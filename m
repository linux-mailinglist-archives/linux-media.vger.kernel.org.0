Return-Path: <linux-media+bounces-63247-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKbhMqh9HWotbQkAu9opvQ
	(envelope-from <linux-media+bounces-63247-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:40:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5CC61F6A2
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C47FB3014270
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 12:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B007F379C5B;
	Mon,  1 Jun 2026 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jNrgRbSo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B1D37647E
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 12:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780317546; cv=none; b=Ger9stAq4nLrJpT0K8ehyGebYSHQN9FoP/QRm/3tjP0/vfvJECI+dRmsppet4WlSiMIGktKzdftVQMG8xGRuDo65IR98jKV+kWkkNov2VqySszmspZn70Ng6w+nnkzaMEVr8PlND8kRFePY4ozby5A2OrpEhtAE+d6qhbC6/5Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780317546; c=relaxed/simple;
	bh=REyupswLVPxRUsPQqPYR9DfP0rB+Rx88jhSSpFYtNlE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X6YHNaxvftzfrFyo0s8iK8lKHS1XOKVcbrlgQd7mF8Keemkc7bkYEwTaLB3L2cmQeWPQUaGQ/t7BBr7CnExi6mkbflT/HKZcHMWQ0xLdwVbBGHOis83nGIS8oTkhEHbv3bbDMDlbD+yK3OxKrKaCFgBvO9oxMV0/PNWk4R4e6w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jNrgRbSo; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-460153ce644so301068f8f.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 05:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780317543; x=1780922343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REyupswLVPxRUsPQqPYR9DfP0rB+Rx88jhSSpFYtNlE=;
        b=jNrgRbSowhDm7/T6ho67jpv7vpWfJeBPO+M0NcqPSE6Cn63Oap4gG1dgp0rVVolEng
         aOerr4grezKxiPbeURN1mPBjVxT7+QO6gttLLcTEDc4HTYUeZt5zxpiMQXKrJWDBySH6
         43A8n7TrXswpcqd9/sq19suKX3oq9KXn5yxBo4QEG1auLQrtIx0oGUCgeqQ0kKmpcnMI
         KljkAgzmTaiV1yEsVWtU1ysg339GX8zkkgpqJDtWTAMRzU5tEoYTGEP5j9kkWGX+kfAp
         FFoCUw1OiT1Ke8Sc1tXi0hT+3fKHeTtt27p7WqJWEECfvMb5Q3M2VQ+Z6awJY3ksNpei
         OIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780317543; x=1780922343;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=REyupswLVPxRUsPQqPYR9DfP0rB+Rx88jhSSpFYtNlE=;
        b=ik3BDk4TvxLceG7/hc64zIL97//6FLUclkWMenfviBm3mtlzdMVbtms+od1VvQFRCv
         cwFkjsNzCN83dOuh9cBeSqsRX1znzZBFybh9WwQ6HRmupWtKpSW+zSe5+lywaF2k+zYc
         RtTJXJkub/lRAJ6E/t8WBFnyK7kPfgEA4fK1OHeMM3ghylDdmP1Fwfn7FYOp4Qy/Y93t
         hEoV8KBNqBD3Dg2frP3RUdzgDq0MCSF385MKNSTEZuQFXjTksmEMWMXclA95ilnt/DgA
         ZNsSyjp2n3YOKJJTs6QekgkmEd70QdkapZS5/oqyAaFOMyz9D4dpnNmkbsm7QR26LPzd
         naiA==
X-Forwarded-Encrypted: i=1; AFNElJ+HYp6HvnO0wMBTZc/r05Zx2BTQN6WFZfIiYUSU+gb7jik3ufwzwFe3gFHEseq3OzkltA6VRx32LgEBIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ6xicg2FlVufx51D2sIGBzUPpO3Ztv8sGueCBsUVbedYEHHv3
	5hBSAQVlLvjQR2eZvC6gFnSehf7CYGqz/U//ZWga3VaY9kGwsbtvz4g9lzAFtz+4j917RUdzxGM
	lRmkRSErgb3sogWqTIQ==
X-Received: from wmbjr6.prod.google.com ([2002:a05:600c:5606:b0:490:25ec:da5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f87:b0:490:abd7:fd9 with SMTP id 5b1f17b1804b1-490abd71214mr50150365e9.10.1780317542692;
 Mon, 01 Jun 2026 05:39:02 -0700 (PDT)
Date: Mon, 1 Jun 2026 12:39:01 +0000
In-Reply-To: <0ea6b6fdd1e3f1e07445f17c0bf672524938dc85.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260530143541.229628-2-phasta@kernel.org> <20260530143541.229628-5-phasta@kernel.org>
 <ah1glmXDM-OAKa5h@google.com> <0ea6b6fdd1e3f1e07445f17c0bf672524938dc85.camel@mailbox.org>
Message-ID: <ah19ZVkr7b3m7V_u@google.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: phasta@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Igor Korotin <igor.korotin@linux.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	Shankari Anand <shankari.ak0208@gmail.com>, manos@pitsidianak.is, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63247-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zulipchat.com:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BA5CC61F6A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 02:26:17PM +0200, Philipp Stanner wrote:
> On Mon, 2026-06-01 at 10:36 +0000, Alice Ryhl wrote:
> > On Sat, May 30, 2026 at 04:35:11PM +0200, Philipp Stanner wrote:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=
indings::dma_fence_remove_callback(self.fence.as_raw(), self.cb.get());
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > Formatting nit: Usually the ; goes outside the unsafe block.
>=20
> I could have sworn that it was rustfmt who did that? Maybe because the
> ; was inside to begin with.

Indeed, rustfmt will not change whether the ; is inside or outside the
unsafe block.

> > > +/// A trait to enforce that all data in a [`DriverFence`] either doe=
s not need
> > > +/// drop, or lives in a [`RcuBox`].
> > > +pub trait DriverFenceAllowedData: private::Sealed {}
> > > +
> > > +mod private {
> > > +=C2=A0=C2=A0=C2=A0 pub trait Sealed {}
> > > +}
> > > +
> > > +impl<F: Copy> DriverFenceAllowedData for F {}
> > > +impl<F: Send> DriverFenceAllowedData for RcuBox<F> {}
> > > +
> > > +impl<F: Copy> private::Sealed for F {}
> > > +impl<F: Send> private::Sealed for RcuBox<F> {}
> >=20
> > Why sealed? Just make the trait unsafe and require the things you
> > require from the user.
>=20
> This is far better. We definitely only allow the user to pass A or B,
> and only then it compiles.

What if I have another type that I want to use here? For example, maybe
I have a struct containing a copy field and an RcuBox. Or maybe I have
an ARef<_> of some C type that uses rcu for cleanup. Then I must edit
this file to add support for it?

> The unsafe implementation could be messed up.
>=20
> I thought that's what Sealed is for. Or isn't it?

Sealed is for making 100% sure that downstream crates/drivers cannot
provide their own implementations. But I don't see why you need that.
All you require is that the value remains valid for one grace period
after cleanup begins. As long as the type satisfies that, you are happy.
An unsafe trait can require that sort of requirement from the user.

I think what you want is expressed well by `RcuFreeSafe` from this
thread:
https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library/topic/C=
onsolidate.20.60PollCondVarBox.60.20into.20.60Rcu.2ABox.60/near/598726724

> > > +/// A synchronization primitive mainly for GPU drivers.
> > > +///
> > > +/// Fences are always reference counted. The typical use case is tha=
t one side registers
> > > +/// callbacks on the fence which will perform a certain action (such=
 as queueing work) once the
> > > +/// other side signals the fence.
> > > +///
> > > +/// # Examples
> > > +///
> > > +/// ```
> > > +/// use kernel::dma_buf::{DriverFence, FenceCtx, FenceCb, FenceCbReg=
istration};
> > > +/// use kernel::str::CString;
> > > +/// use kernel::sync::{
> > > +///=C2=A0=C2=A0=C2=A0=C2=A0 aref::ARef,
> > > +///=C2=A0=C2=A0=C2=A0=C2=A0 rcu::RcuBox, //
> > > +/// };
> > > +/// use core::ops::Deref;
> > > +/// use core::fmt::Display;
> >=20
> > Use fmt traits from kernel instead. (Actually, I don't think you use
> > Display at all here?)
>=20
> I tried, see a few lines below:
>=20
> >=20
> > > +/// struct CallbackData { }
> > > +///
> > > +/// impl FenceCb for CallbackData {
> > > +///=C2=A0=C2=A0=C2=A0=C2=A0 fn called(&mut self) {
> > > +///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_info!("DmaFen=
ce callback executed.\n");
> > > +///=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > +/// }
> > > +///
> > > +/// let driver_name =3D CString::try_from_fmt(fmt!("dummy_driver"))?=
;
> > > +/// let timeline_name =3D CString::try_from_fmt(fmt!("dummy_timeline=
"))?;
> > > +///
> > > +/// let fctx =3D FenceCtx::new(driver_name, timeline_name, ())?;
> > > +///
> > > +/// let fence_data =3D CString::try_from_fmt(fmt!("dummy_data"))?;
> > > +/// // DriverFence::data must either not need drop, or live in an Rc=
uBox.
> > > +/// let fence_data =3D RcuBox::new(fence_data, GFP_KERNEL)?;
> > > +///
> > > +/// let fence_alloc =3D fctx.as_arc_borrow().new_fence_allocation(fe=
nce_data)?;
> > > +/// let mut fence =3D fctx.new_fence(fence_alloc);
> > > +///
> > > +/// let cb_data =3D CallbackData { };
> > > +/// let waiting_fence =3D ARef::from(fence.as_fence());
> > > +/// let cb_reg =3D FenceCbRegistration::new(&waiting_fence, cb_data)=
;
> > > +/// let cb_reg =3D KBox::pin_init(cb_reg, GFP_KERNEL)?;
> > > +///
> > > +/// // DriverFence implements Deref.
> > > +/// // FIXME: unit test claims that CString does not implement Displ=
ay. Why?
> > > +/// // pr_info!("Fence's inner data is: {}", fence.deref().deref());
>=20
> Lazily, I was hoping that someone here will tell me how that is
> supposed to be done correctly 8-)

This specific code could be written cleaner as &**fence, but it looks
like CString should implement fmt::Display like CStr does.

> > > +// SAFETY: The Rust dma_fence abstractions are already designed arou=
nd the inner
> > > +// C `dma_fence`, which can serve safely as the identification point=
 when being
> > > +// owned by C. Moreover, safety is ensured by not dropping `DriverFe=
nce` and by
> > > +// only allowing operations without side effects on the Borrowed typ=
e.
> > > +unsafe impl<F: Send + Sync + 'static, C: Send + Sync + 'static> Fore=
ignOwnable
> > > +=C2=A0=C2=A0=C2=A0 for DriverFence<F, C>
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 // `DriverFence` is merely a wrapper around a raw=
 pointer. Thus, we can just
> > > +=C2=A0=C2=A0=C2=A0 // use it directly.
> > > +=C2=A0=C2=A0=C2=A0 type Borrowed<'a> =3D DriverFenceBorrow<F, C>;
> > > +=C2=A0=C2=A0=C2=A0 type BorrowedMut<'a> =3D DriverFenceBorrow<F, C>;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 const FOREIGN_ALIGN: usize =3D core::mem::align_o=
f::<bindings::dma_fence>();
> > > +
> > > +=C2=A0=C2=A0=C2=A0 fn into_foreign(self) -> *mut c_void {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence =3D self;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let ptr =3D fence.as_raw(=
);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // DriverFence must not d=
rop.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 core::mem::forget(fence);
> >=20
> > Nit: Modern Rust uses ManuallyDrop instead of forget().
>=20
> You mean still take `self` here, then stuff it into ManuallyDrop and
> let it go out of scope, aye?

I mean this:

let fence =3D ManuallyDrop::new(self);
let ptr =3D fence.as_raw();

This avoids moving `fence` after calling `as_raw()`.

Alice

