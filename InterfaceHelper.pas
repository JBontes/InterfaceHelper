unit InterfaceHelper;

interface

type
  TInterface<Intf: IInterface> = record
  private
    P: Pointer;
  public
    function I: Intf;  //for calling interface methods
    class operator Implicit(const A: Intf): TInterface<Intf>; //Assigning the record
    class operator Implicit(const A: TInterface<Intf>): Intf; //Assigning to an interface variable
    class operator Explicit(const A: TInterface<Intf>): Intf; //Calling interface methods alternative syntax
  end;


implementation

{ TInterface<Intf> }


function TInterface<Intf>.I: Intf;
begin
  pointer(IInterface(Result)):= P;
end;

class operator TInterface<Intf>.Implicit(const A: Intf): TInterface<Intf>;
begin
  Result.P:= pointer(IInterface(A));
end;

class operator TInterface<Intf>.Implicit(const A: TInterface<Intf>): Intf;
begin
  pointer(IInterface(Result)):= A.P;
end;

class operator TInterface<Intf>.Explicit(const A: TInterface<Intf>): Intf;
begin
  pointer(IInterface(Result)):= A.P;
end;

end.
