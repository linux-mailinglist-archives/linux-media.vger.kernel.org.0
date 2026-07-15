Return-Path: <linux-media+bounces-67598-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kOhkByzUVmq7BgEAu9opvQ
	(envelope-from <linux-media+bounces-67598-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 02:28:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A855759B2A
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 02:28:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Atc8W/mF";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67598-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67598-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94E89310794C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 00:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD65C23ED60;
	Wed, 15 Jul 2026 00:27:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700B11AAE17;
	Wed, 15 Jul 2026 00:27:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784075237; cv=none; b=nFl4Q5SM6TIaRxZIPIYrTF22MOjqqJ+dpQKTjeKvp9RCXDRlb1QPFoNEr1cUYYcju9ZHEz5YAyPXXiyUT88AOY3MTsuUfx39XS+hvu4tXNrCKN1cY2CiQMUqxiTrKMSX1gApjrBfrrMyzu6n3Mimyud8G2DLBYO8H7XnyOO6JFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784075237; c=relaxed/simple;
	bh=WQF/g0Ub6QIAneJVPIEDsZ2OoW8izXG1C3aJGA/G1I8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=pL0A9noCQaSi5jvIJgVu+SBbsybGR0trxGOhT89YRSHKaotYHBG+7DmSSs9Nr4cn9Abp5Uctx2XNGes5suUBK+FcW0b4ccSFios+FvB4Wi8qe5EaTAeU9G9Y8+A7t3tN7o8M8tvw1VrQs7zPkRzTFLbK/P3X2E+WWcOyQsOsrP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Atc8W/mF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B61A1F000E9;
	Wed, 15 Jul 2026 00:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784075235;
	bh=YnKdpSVNbBNw2d+E5IMYSn3WATsVf3xChkFAnCOzXd0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Atc8W/mFUsO+P/qwGvR+WgSu99Qx3rWw3iGFzic+pUllmKaPiSeQgQWqPsZksXHUe
	 9kezYaIzK0b0uhcXKuaHlC69C1x/g8DAQ1K0SO1NZ/TEMmPS8bd9eohJUFinV8AOZS
	 R3T4K2H+EooGti9Jv/dNuHxxm5v6FM55Uolxr+s1+o3NA23dg8dM6ilGUAnFQOwjJ1
	 UyK6lAj+rDLjjB1/1dCW95pJ+81Jy2dtPJVvJmHm/R4C7dRMEAGyoa1TJJ5z5Pnh2d
	 88icBCMr74TOrvWgjASBNfWVhDP1AqK57xwtzblEvmoqQzRBapAdZU6yxzZ4w571C+
	 75UZpWRB94BeQ==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 02:27:08 +0200
Message-Id: <DJYPVXEKX4I3.LITS0PZKHBJ1@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
Cc: "Oliver Neukum" <oneukum@suse.com>, "Colin Braun"
 <colinbrauncl@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Mathias Nyman" <mathias.nyman@intel.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-media@vger.kernel.org>, "Colin Braun"
 <colin.braun.cl@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 <driver-core@lists.linux.dev>
To: "Alan Stern" <stern@rowland.harvard.edu>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org> <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
 <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
 <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
 <DJYHI6W0VJ73.NP4QFGU57J50@kernel.org>
 <a6809829-b7f8-4181-9965-0668fe95d133@rowland.harvard.edu>
In-Reply-To: <a6809829-b7f8-4181-9965-0668fe95d133@rowland.harvard.edu>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67598-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:oneukum@suse.com,m:colinbrauncl@gmail.com,m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:mchehab@kernel.org,m:mathias.nyman@intel.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-media@vger.kernel.org,m:colin.braun.cl@gmail.com,m:rafael@kernel.org,m:driver-core@lists.linux.dev,m:stern@rowland.harvard.edu,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,intel.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,rust-lang.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A855759B2A

On Tue Jul 14, 2026 at 9:25 PM CEST, Alan Stern wrote:
> On Tue, Jul 14, 2026 at 07:53:03PM +0200, Danilo Krummrich wrote:
>> (Cc: driver-core)
>>=20
>> On Tue Jul 14, 2026 at 6:26 PM CEST, Alan Stern wrote:
>> > I don't see why Rust needs to distinguish between a USB device that is=
=20
>> > bound and one that is unbound.  There isn't much you can do with one=
=20
>> > that can't be done with the other.
>>=20
>> It has nothing to do with Rust, those driver lifecycle rules exist regar=
dless
>> and they are present universally, including in C.
>>=20
>> The only difference is that in C all the responsibility to enforce them =
is
>> usually on the driver -- e.g. by creating, destroying and calling things=
 in the
>> correct order in probe() and remove() -- and a lot of drivers have bugs =
in this
>> regard as a consequence.
>>=20
>> With Rust we can enforce those rules with the help of the type system at=
 compile
>> time; device context states are a part of that.
>
> I don't really understand how that would work.  For example, suppose you=
=20
> have an object whose type represents an unbound USB interface (I forget=
=20
> what you are calling this).  Then a driver is probed and binds to the=20
> interface.  What happens to the object?  Is it somehow destroyed and=20
> replaced by a new object of a different type, representing a bound=20
> interface?  Or does the object remain unchanged but you create a new=20
> reference to it, of the new type?

The usb::Interface struct definition looks like this:

	#[repr(transparent)]
	pub struct Interface<Ctx: device::DeviceContext =3D device::Normal>(
	    Opaque<bindings::usb_interface>,
	    PhantomData<Ctx>,
	);

It is a transparent wrapper around a struct usb_interface, which means it i=
s
layout compatible, i.e. in memory is has the exact same representation as s=
truct
usb_interface.

The default type state is "Normal", so usb::Interface actually means
usb::Interface<Normal>, which means "a USB interface without any additional
guarantees".

When we receive a pointer of a struct usb_interface from C, we can (unsafel=
y)
create any transparent wrapper type of it as a "Rust reference" [1], e.g.

	extern "C" fn probe_callback(
	    intf: *mut bindings::usb_interface,
	    id: *const bindings::usb_device_id,
	) -> kernel::ffi::c_int {
	    // `intf` is of type `&usb::Interface`.
	    let intf =3D  unsafe { &*intf.cast::<usb::Interface>() };
=09
	    // `intf` is of type `&usb::Interface<Bound>`.
	    let intf =3D  unsafe { &*intf.cast::<usb::Interface<Bound>>() };
=09
	    // `intf` is of type `&usb::Interface<Core<'_>>`.
	    let intf =3D  unsafe { &*intf.cast::<usb::Interface<Core<'_>>>() };

	    ...
	}

In memory they are all identical, but for the compiler they now carry diffe=
rent
type information.

When we now e.g. call the driver's Rust probe() function, we pass the struc=
t
usb_interface pointer as &'bound usb::Interface<Core<'_>>.

The 'Core' type state only lives for the duration of probe() and indicates =
that
we are in a bus callback where the device lock of struct usb_interface is h=
eld,
which means that we can implement methods that require the device lock of s=
truct
usb_interface to be held for usb::Interface<Core> only, so they are not
available for e.g. usb::Interface or usb::Interface<Bound>.

&'bound usb::Interface<Core<'_>> dereferences (see [2]) to &'bound
usb::Interface<Bound>, as the 'Core' type state implies 'Bound'.

Let's have a look at &'bound usb::Interface<Bound> as it becomes relevant l=
ater
on.

The '&' indicates a reference [1], which can be roughly described as a poin=
ter
with additional guarantees that are tracked by the compiler. One of those i=
s the
lifetime of the pointer, which in my example is explicitly named as 'bound.

[1] https://doc.rust-lang.org/reference/types/pointer.html#references--and-=
mut
[2] https://doc.rust-lang.org/std/ops/trait.Deref.html

> Also, what happens while the binding or unbinding procedure is underway,=
=20
> so the interface is, so to speak, partially bound?  The USB stack does=20
> actually take notice of this; see the definition of enum=20
> usb_interface_condition in include/linux/usb.h.

The driver core doesn't make this distinction in the direction of driver AP=
Is.
The 'Bound' type state goes from call_driver_probe() until device_remove() =
has
finished.

The exact point doesn't really matter to drivers, for them 'Bound' begins w=
ith
their probe() callback and ends with the destructor of their bus device pri=
vate
data.

The enum usb_interface_condition seems to me like an approach to synchroniz=
e the
initialization and teardown sequence of interfaces in regards to their pare=
nt
device within the USB core code, but it isn't driver facing.

>> > Similarly, I don't see why Rust needs to distinguish between an=20
>> > interface that is bound and one that isn't.
>> >
>> > Even from the point of view of the device core, a device that is bound=
=20
>> > to a driver is the same kind of data structure as one that isn't bound=
;=20
>> > the only difference is whether the ->driver pointer is set.
>>=20
>> This is a huge understatement.
>>=20
>> The state of a device being bound to a driver defines which entity (i.e.=
 which
>> driver) is in charge of operating the underlying device, and thus define=
s who
>> owns the device (associated) resources.
>
> That's not how I would describe it.  When a device is bound to a driver,=
=20
> the driver is allowed to create and use associated resource; when the=20
> device is not bound, no such resources should exist.

I think we are basically saying the same thing; no driver bound to the devi=
ce
means no one "owns" the device and hence no one operates it or manages (its=
)
resources.

>> Many APIs rely on this, as in they only guarantee valid behavior when ca=
lled
>> from a scope where the device is guaranteed to be bound to a driver, or =
IOW
>> where a driver can prove that it actually operates the device.
>
> I can't think of many APIs like that in the USB stack.  One that springs=
=20
> to mind is encapsulated by checkintf() and check_ctrlrecip() in=20
> core/devio.c, but those are the exception rather than the rule.

It's not only the USB specific APIs, a usb::Interface<Bound> would also giv=
e you
the underlying, embedded struct device as Device<Bound>, which you need for
various APIs to operate.

For instance, requesting DMA coherent memory that has IOMMU mappings requir=
es a
Device<Bound>, the same goes for SGTable mappings.

Another example are class device registrations and workqueues. I will give =
an
example how that looks like in Rust, but you can think of it similar to API=
s
like devm_work_autocancel() and devm_iio_device_register().

Those APIs require the device embedding the core struct device to be bound =
to a
driver (and so does the Rust Devres API).

For USB specifically, you want to require the 'Bound' device state for anyt=
hing
that operates the device in a way that only a driver should do that is, wel=
l,
bound to the device. For instance, any methods that perform I/O operations =
(e.g.
usb_submit_urb(), which AFAIK implies DMA mappings too) with the device sho=
uld
be implemented for the 'Bound' type state only.

IOW, drivers should be restricted from having DMA mappings for a device and
performing I/O with the device outside the scope between probe() and remove=
().

>> Drivers must only acquire device resources when they are actually bound =
to the
>> corresponding device, and must hand them back before the device is unbou=
nd. The
>> devres API, for instance, exists for this fundamental reason.
>
> How would having separate types for bound and unbound interfaces enable=
=20
> Rust to recognize that a driver had not destroyed back a resource in its=
=20
> unbind callback?

The abstract answer is that together with the Rust compiler's ownership and
lifetime tracking we can represent relationships such as "A lives at least =
as
long as B", "A does not outlive B", etc.

I will sketch up a concrete example below.

>> For instance, we can't have drivers manage IRQs, mess with I/O memory, p=
rogram
>> IOMMU page tables (e.g. through DMA APIs), etc. for devices they are not=
 bound
>> to and hence are not allowed to operate (anymore).
>>=20
>> Those device resources all have a lifetime that is tied to the lifetime =
of the
>> device being bound to a driver.
>>=20
>> Consequently, any asynchronous scopes such as IOCTLs from class device
>> registrations, IRQs, work queued on workqueues, etc. must all be synchro=
nized in
>> some way such that those asynchronous scopes do not access device resour=
ces that
>> have already been destroyed on driver unbind.
>
> That is certainly true.  But I don't see how it can be enforced at=20
> compile time.

(I'll try to explain the mechanics below; a lot of this requires deep
familiarity with Rust's ownership and lifetime system, so I'll try to keep =
it
approachable while still being precise enough to be useful. Also note that =
I'm
simplifying a few details for the same reason. As mentioned, I will also tr=
y to
sketch up a concrete example driver below.)

Let's assume we are in probe() of a Rust driver, then we will eventually ha=
ve a

	&'bound usb::Interface<Bound>

i.e. a reference to a bound USB interface with the lifetime 'bound.

When we now try to create a class device registration, let's say a DRM devi=
ce
registration, it looks like this:

	// `dev` is the embedded `struct device` as `&'bound Device<Bound>`.
	let dev =3D intf.as_ref();

	// `drm`:  The DRM device.
	// `data`: Private data that lives as long as the DRM device is
	//         registered.
	let reg =3D drm::Registration::new(dev, drm, data)?

What happens is that `reg` captures the lifetime of `dev`, i.e. 'bound and =
the
compiler will now ensure that `reg` can't outlive 'bound.

The same goes for the private data `data`; it also captures this lifetime, =
so
you can store a &'bound usb::Interface<Bound> within `data`.

Now, we finally need to store `reg` somewhere before probe() ends, otherwis=
e it
will go out of scope and be destroyed right away, which would be useless.

The only place where it can go is the bus device private data, i.e. the pri=
vate
data of the usb::Interface.

Technically, this is returned as an initializer by probe(), but that's just=
 an
implementation detail. The relevant part is that since we control the signa=
ture
of probe(), i.e.

	fn probe<'bound>(
	    adev: &'bound auxiliary::Device<Core<'_>>,
	    _info: &'bound Self::IdInfo,
	) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
	    ...
	}

we can define that the return value captures this lifetime too. So, this is=
 the
only place where this data can go, and since the driver core controls the
lifetime of the returned private data, the driver core will ensure that it =
is
destroyed when the driver is unbound.

When we now receive an IOCTL from the DRM class device you will get your `d=
ata`
back, which contains your original &'bound usb::Interface<Bound>.

And the reason you can get your &'bound usb::Interface<Bound> is because th=
e
drm::Registration ties itself to the 'bound lifetime and guarantees that on=
ce it
is destroyed no more IOCTLs can hit the driver.

You can now apply the same pattern to any other registration kind of thing.
IRQs, workqueues, work items, etc.

Of course there are also primitives that do not tie their lifetime to the '=
bound
lifetime and just exist as long as a driver wants them to exist, but those =
can't
capture any types that capture the 'bound lifetime themselves.

For instance, the compiler will not allow you to pass a

	&'bound usb::Interface<Bound>

to

	workqueue::system().enqueue();

instead you'd need to pass it to a Rust equivalent of devm_work_autocancel(=
) for
the compiler to accept it.

>> Or in other words, they must be synchronized against the "bound" scope, =
which is
>> exactly what the Device<Bound> type state in Rust represents.
>>=20
>> So, again, all those lifetime rules around the driver lifecycle exist
>> universally, it's just that in Rust we enforce them through the type sys=
tem.
>
> How do you enforce through the type system that, for example, a=20
> workqueue item has completed?

Like I mentioned above, if you look for the code, please see [1]. But the t=
rick
is the same, it captures the 'bound lifetime and the destructor, which call=
s
destroy_workqueue() which will wait for pending work.

[1] https://lore.kernel.org/all/20260617144645.253444-2-work@onurozkan.dev/

>> For instance, tying it back to USB, we don't want that a usb_driver stil=
l messes
>> with a usb_interface, e.g. initiating transfers after it has been unboun=
d from
>> the interface and hence must not operate it anymore. This can easily hap=
pen if
>> e.g. a class device registration is not properly synchronized and the dr=
iver
>> still receives IOCTLs after driver unbind. In Rust we know through the "=
Bound"
>> type state which scope provides the guarantee that the device is still b=
ound,
>> such that mistakes like this become impossible.
>
> How can you pass types around to different control threads with somewhat=
=20
> arbitrary synchronization schemes managed at runtime, all while not=20
> allowing a typed reference to exist beyond its lifetime?

Here's the example I promised, to keep it simple I will just use
platform::Device, MMIO and an IRQ handler, but the concept applies universa=
lly.

Please see the inline comments for additional explanation.

Note that in addition the approach does also remove the typical ordering
pitfalls we have in C driver's probe() functions by modelling them as real =
data
dependencies the compiler can actually check.

```
const REGS_SIZE: usize =3D 0x1000;

// Common infrastructure to define types for registers.
register! {
    STATUS(u32) @ 0x00 {
        31:0 pending;
    }

    ACK(u32) @ 0x04 {
        31:0 clear;
    }

    CONTROL(u32) @ 0x08 {
        0:0 enable;
        1:1 irq_enable;
    }
}

// Custom impl block for the `ACK` register.
impl ACK {
    fn from_status(status: STATUS) -> Self {
        Self::from(status.pending().get())
    }
}

// The IRQ handler, which captures the `'bound` lifetime. We use `'irq` as =
a
// name to indicate that it might live shorter, but in any case it can't li=
ve
// longer than `'bound`, which is ensured by the `irq::Registration`
// constructor.
//
// The only thing we store in the `irq::Registration` is the `iomem`, so we=
 can
// perform I/O. Note that `ExclusiveIoMem` also captures a lifetime as a de=
vice
// resource, i.e. it can't outlive `'bound` either.
struct IrqHandler<'irq> {
    iomem: &'irq ExclusiveIoMem<'irq, REGS_SIZE>,
    // Not used for anything other than printing, but you get the idea.
    pdev: &'irq platform::Device<Bound>,
}

// The implementation of the IRQ handler.
impl irq::Handler for IrqHandler<'_> {
    fn handle(&self) -> IrqReturn {
        let status =3D self.iomem.read(STATUS);

        if status.pending() =3D=3D 0 {
            return IrqReturn::None;
        }
        self.iomem.write_reg(ACK::from_status(status));

        dev_info!(self.pdev, "I must not print from hard IRQs.\n");
        IrqReturn::Handled
    }
}

// The bus device private data structure, which captures the `'bound` lifet=
ime.
// It lives exactly as long as the driver is bound to the device.
//
// Both `iomem` and the IRQ registration `_irq` live until the driver is
// unbound from the device.
//
// When `irq::Registration` is destroyed no more IRQs can fire.
#[pin_data(PinnedDrop)]
struct SampleData<'bound> {
    #[pin]
    _irq: irq::Registration<'bound, IrqHandler<'bound>>,
    iomem: ExclusiveIoMem<'bound, REGS_SIZE>,
}

// The `Drop` implementation (destructor) of the bus device private data.
//
// This is pretty much equivalent to remove(); all resources such as `iomem=
`
// and `_irq` are cleaned up automatically through their `Drop` implementat=
ion.
#[pinned_drop]
impl PinnedDrop for SampleData<'_> {
    fn drop(self: Pin<&mut Self>) {
        self.iomem.write_reg(CONTROL::zeroed());
    }
}

struct SampleDriver;

// The implementation of the platform::Driver, some type information, ID ta=
ble,
// bus callbacks, etc.
impl platform::Driver for SampleDriver {
    // The type of the device ID data; we don't have any hence the unit typ=
e
    // (think of it as void).
    type IdInfo =3D ();

    // The type of the driver's bus device private data.
    type Data<'bound> =3D SampleData<'bound>;

    // ID tables, we don't have any in this example.
    const OF_ID_TABLE: Option<kernel::of::IdTable<Self::IdInfo>> =3D None;
    const ACPI_ID_TABLE: Option<kernel::acpi::IdTable<Self::IdInfo>> =3D No=
ne;

    // The probe() function. The pin-init syntax may be a bit confusing, bu=
t
    // going into pin-init details is a bit out of scope.
    //
    // Think of it as something that captures a recipe of how memory of a
    // certain type (`SampleData` in this case) has to be initialized to be
    // valid.
    fn probe<'bound>(
        pdev: &'bound platform::Device<Core<'_>>,
        _info: Option<&'bound Self::IdInfo>,
    ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
        // We create and return an initializer for `SampleData`.
        try_pin_init!(SampleData {
            // We initialize the first field `iomem`; the `platform::Device=
`
            // provides a method on `platform::Device<Bound>` which `pdev`
            // dereferences to as it has the `Core` device context.
            //
            // iomap_exclusive_sized() captures the lifetime of `pdev` and
            // stores it in `iomem`. The only place this can live in is pro=
be()
            // and this initializer; the driver core takes care that the
            // constructed `SampleData` can't outlive `'bound`.
            iomem: pdev
                .io_request_by_index(0)
                .ok_or(ENODEV)?
                .iomap_exclusive_sized::<REGS_SIZE>()?,

            // Similar to `iomem`, request_irq_by_index() requires a
            // `platform::Device<Bound>` and captures the `'bound` lifetime=
 for
            // both `IrqHandler` and the returned `irq::Registration`.
            //
            // Note that the `IrqHandler` stores a reference to `iomem`, th=
is is
            // only possible as pin-init will take care that the field has
            // actually been initialized previously and is dropped after th=
e
            // `IrqHandler` is dropped.
            //
            // It becomes impossible to get the order wrong and accidentall=
y
            // register the IRQ before `iomem`; it can't happen that an IRQ
            // fires before `iomem` is initialized.
            //
            // The reason I use future tense is because pin-init doesn't do=
 that
            // yet; people are working on it. There are other options to do=
 this
            // safely (e.g. with reference counts, etc.), but this is the o=
ne
            // with zero overhead we are heading towards.
            _irq <- pdev.request_irq_by_index(
                        Flags::SHARED,
                        0,
                        c"sample-irq",
                        IrqHandler { iomem: &iomem, pdev: pdev }),

            // This initializes absolutely nothing, but pin-init allows us =
to
            // execute arbitrary code in our recipe. So, now that everythin=
g
            // else is initialized, enable the controller.
            _: {
                let ctrl =3D CONTROL::zeroed().with_enable(true).with_irq_e=
nable(true);
                iomem.write_reg(ctrl);
            },
        })
    }
}

kernel::module_platform_driver! {
    type: SampleDriver,
    name: "rust_driver_sample",
    authors: ["Danilo Krummrich"],
    description: "Sample Driver",
    license: "GPL v2",
}
```

I also plan to give a talk about this at Kernel Recipes [1] where I go into
details and try to give some comparison between C and Rust code.

[1] https://kernel-recipes.org/en/2026/schedule/enforcing-device-driver-lif=
ecycle-rules-at-compile-time/

