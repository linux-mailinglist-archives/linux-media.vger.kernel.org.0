Return-Path: <linux-media+bounces-63931-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FTdWAJHmImrjewEAu9opvQ
	(envelope-from <linux-media+bounces-63931-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:09:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4089164921D
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:09:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="wShIty/h";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63931-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63931-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A19A930BE3B1
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 14:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7907C3DF009;
	Fri,  5 Jun 2026 14:54:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8162D3DDDC3
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 14:54:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780671261; cv=pass; b=HLUJeiro3uwSbPwSL5uTXB1KwTTTcMPuyAGusDOo28dLQBFMr0wCg3T4v1DqcB+v7cZIFs4+72oviOpWV8LYY/Td5xzDC47EHDg7P5QwATkSmauxOs57Za8WVRONtbjWRJHecICouA63J3Qkd+7oegNGrL/MY83YbVfSD7ytWqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780671261; c=relaxed/simple;
	bh=5U2bHCSeSFtZBuKuVq8W81kjSD7uabbhoCN8hd/76pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pcMVsruhbP8/STJ87NDMjkEaTAh7A7ha2iPusDFjhkNFmO3RQjAbRbgPBtvLNJC97mulFco2eITa7tcQpk3iufKy6XQXXg75cbioo2hj9Nd8t/qDxCzC/oJQ5zPVCbJPhMFZ0LfdeO6IGuFLeB8dj0HNYpT4rJ12BtBGNQd3Xks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wShIty/h; arc=pass smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so1392412f8f.1
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 07:54:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780671259; cv=none;
        d=google.com; s=arc-20240605;
        b=izZt2nhsxm50oja8YGaFFnDX48E8n0QgqaucRyT+ir07svkDO7Cea7auca73QOw14m
         GU4nzIr701V7mQ0TDR67KEwRgfOx/n/YH3cx3v1vGHKZ8iYgHG5KswRN+NTkvEX0MDDK
         YvuQLqcqC7WwVJZgqzcnIGDfrJKLVjqWMuKWHxd4wKBr8oQiQUWkSGdnNPq1e5xp+rpv
         vBs183rsLgckeX7s3a1qbrcXXwBdA3oQcKPT5zwnsxxVC3n1VgwKGU+AZqzp50kqyFw4
         9tf65hCblUje/5Ir6UPus8tZouIFUY9MgBJMdMIuAac6fCYB5dWbPE9YfIJIHFC5T+Uq
         UBYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iMx/nHWOMEwtym34VZ261ncrvtjhMvq2oZ5WpIEUnq0=;
        fh=2dGnoQdMJsNeV7oBUpyHm8TVoHuFDtg78Cazf8DcoWE=;
        b=DFRln+qpnDPMfbziAoiYlTcndz1/IdbAHOgXKeCigBq+gC3dRfg4ev20xlaaLIBkKA
         BUzNMzzGymWgKHJIY6oJtaW/1Nux/qxl4DHLeT3D96+CZFdm4jY+Tyo3Sw9ioAfdva1s
         SnAQPzCy2lsNsk4O+4/KT9B6qGy96/sZgwYJWA9poFB7JRrM75p/0RpFb9N3iD/+pgmS
         Cx+Hdn2cXYi6gm1rTExjbMTAyK+Kd07+oXLl9IdQJ3cntpcWaUnV7wnwxYnm2fy1nvEh
         8MK2qPfb77zLQjDrhvp10E0b0135xMe/nD1iN9iy2UvxOFZDuj7V43PzMSCGwQeED76i
         QR6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780671259; x=1781276059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMx/nHWOMEwtym34VZ261ncrvtjhMvq2oZ5WpIEUnq0=;
        b=wShIty/hqg+rPx64r/atcg+EYvg/Z/F6FlaKQqHXNbAfO88S4Ki6U5lF/sspBOvceg
         1ffkhGqDQ2f9AEHLgZTPRw6PQXj3nuOis39774CMKK8pFAMrtSE51RxZw2Dz1yRKCr6J
         if04owCusUMW1YU/gwcN9DY3YoTDVMYwBz9tzU1nMuF8AmR3WWpOra3xH7ZHXob0t5YQ
         jMGSBFP1PNeTcE/WGDxGEBba5gIWV6w8wymlU25qxKN40g17YHq00G8ORMj5yC4pIwvk
         4OVcenW9LVSdoaVbHSnarY+orrApqBvOmZyRlHtjXvGm+9+CTGe4KViUGUIao32gfvEP
         PxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780671259; x=1781276059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iMx/nHWOMEwtym34VZ261ncrvtjhMvq2oZ5WpIEUnq0=;
        b=kZD6zyGHpnwcT3JnosrJmu9nssT0FG4xVvnuFTGljWjMts5Hei7tk7LqHl15MhIB7I
         SZ4Z3N26TLgxBiDGu+2f4djT74Fjj5F3djqaMTmcC4gMr61uLX+TpihmkESujc5ASCr9
         tGPewWJOSwJF0ZwgvSlaWD1boZRy5hD0ePtXpspBG1c+4gNc/Xh2LwWmmB2+ujn2dla+
         XMgjxysyjEFvGpinEtAkJmGpvKwrOt3a3JvzOzV+gj14mL7Om6l0logWO03xtbhxgElO
         arxn/pp5x2QT0FZEcNwbP/JhabXxpbF+eSqAuSoKoMSeiT28g73FPMJGs9bzC0VRCX2n
         WVeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+r4/GaTWYGJ+tj9WMXhQtl1AdbDwNHd9C0tqvLaK/BiT9CbcDGod8w1OPQ0aOfBZCQV9FISU+yaV6puQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzGZYnjEQrl9HhY9p6kBOkv9TOU7Kh81otbKOjjfhKsvABPjv3
	I0zfwWCygOagI2LDLWKxkkgNBIodAzsO6681/z0L4KCgAJkooFqf2Tz67VL4L44hFPKv9WeqCgX
	eEniIV5c+V5lDTPFCS7/xv7vBG5Bt4l8PshjkzUbR
X-Gm-Gg: Acq92OFH7NQQPtNGwZp0eTW/jFhnpwaxsaxsiHkIxL1elrb7weEj+cng3NKYh6h/gRG
	IIRNPWQycTY187LONUl4WnMWsrPk7autcA6pdoPI68wYtpIjBFCmCuOj9EOJ3i12vLsV++pFuGC
	UXJZU49XiVMjpkleWtMsTKi6FkGZJ4A2liTWbKEFOtUveQ9t685RLdC2ZqOLJ1mDULDoRnmORBO
	IsOuyV/ww0frKudw/w90lTjsgnBn+nKRWfuinEIw0ZU4Bvj5dE5EXoz77oPYEXWvGcdWaQ3XVgq
	AvI40Sp0vXQbABYS0vrNkoWxZ4DCD9GTxPtAHJVOelJsnlPbKTKuPFnZnJ0=
X-Received: by 2002:a5d:5747:0:b0:45e:73b4:85cc with SMTP id
 ffacd0b85a97d-46030762e2dmr4902991f8f.35.1780671258380; Fri, 05 Jun 2026
 07:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605133541.22569-1-boqun@kernel.org> <20260605133541.22569-6-boqun@kernel.org>
 <aiLXWHg22P6OTb7O@google.com> <aiLbOd9BkRrrzauk@tardis-2.local>
In-Reply-To: <aiLbOd9BkRrrzauk@tardis-2.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 5 Jun 2026 16:54:05 +0200
X-Gm-Features: AVVi8Cdg9vKBauMx2gFlTcbSb2NA7zDY8I7EUodYwLM12r5vWqTj6E3w8SCGnp8
Message-ID: <CAH5fLgiBayr6S5ijfEdXNgZqaZvFbKWqLvVEsVePmrBybqDZzg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] rust: rcu: Introduce RcuFreeBox
To: Boqun Feng <boqun@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	rcu@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Andrew Ballance <andrewjballance@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boqun@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:rcu@vger.kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:liam@infradead.org,m:andrewjballance@gmail.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:maple-tree@lists.infradead.org,m:linux-mm@kvack.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:phasta@kernel.org,m:lyude@redhat.com,m:daniel.almeida@collabora.com,m:work@onurozkan.dev,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63931-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,umich.edu,infradead.org,gmail.com,nvidia.com,joshtriplett.org,goodmis.org,efficios.com,linux.dev,linaro.org,amd.com,lists.infradead.org,kvack.org,lists.freedesktop.org,redhat.com,collabora.com,onurozkan.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4089164921D

On Fri, Jun 5, 2026 at 4:20=E2=80=AFPM Boqun Feng <boqun@kernel.org> wrote:
>
> On Fri, Jun 05, 2026 at 02:04:08PM +0000, Alice Ryhl wrote:
> > On Fri, Jun 05, 2026 at 06:35:41AM -0700, Boqun Feng wrote:
> > > The current RcuBox will call the `drop()` function after a grace peri=
od
> > > inside an RCU callback. This suffices for maintaining a RCU-protected
> > > object:
> > >
> > >   RcuBox::drop():
> > >     call_rcu(
> > >       |..| { // <- call back after one grace period.
> > >         T::drop(); // <- call the destructor of the inner object.
> > >       }
> > >     )
> > >
> > > However, to support a different RCU usage pattern as below we need to
> > > extend RcuBox:
> > >
> > > 1. clean up the object, and unshare it from future RCU readers.
> > > 2. wait for an RCU grace period.
> > > 3. no other RCU readers, we can free the memory.
> > >
> > > An `RcuFreeBox<T: RcuFreeSafe>` is introduced to provide support for
> > > this:
> > >
> > >   RcuFreeBox::drop():
> > >     T::drop_before_gp(); // clean up and ushare.
> > >     kfree_call_rcu(..);  // free it after one grace period.
> > >
> > > Signed-off-by: Boqun Feng <boqun@kernel.org>
> > > ---
> > >  rust/kernel/sync/rcu.rs         | 31 +++++++++++++++
> > >  rust/kernel/sync/rcu/rcu_box.rs | 68 +++++++++++++++++++++++++++++++=
--
> > >  2 files changed, 95 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/rust/kernel/sync/rcu.rs b/rust/kernel/sync/rcu.rs
> > > index 7da6b8d22277..7c26591bb318 100644
> > > --- a/rust/kernel/sync/rcu.rs
> > > +++ b/rust/kernel/sync/rcu.rs
> > > @@ -4,6 +4,8 @@
> > >  //!
> > >  //! C header: [`include/linux/rcupdate.h`](srctree/include/linux/rcu=
pdate.h)
> > >
> > > +use core::pin::Pin;
> > > +
> > >  use crate::{
> > >      bindings,
> > >      types::{
> > > @@ -82,3 +84,32 @@ pub trait ForeignOwnableRcu: ForeignOwnable {
> > >      /// [`from_foreign`]: ForeignOwnable::from_foreign
> > >      unsafe fn rcu_borrow<'a>(ptr: *mut ffi::c_void) -> Self::RcuBorr=
owed<'a>;
> > >  }
> > > +
> > > +/// Declares a struct is safe to free after a grace period if all re=
aders are guarded by RCU.
> > > +///
> > > +/// # Safety
> > > +///
> > > +/// Implementation must guarantee `drop_before_gp()` makes sure no f=
uture RCU reader will access
> > > +/// any part of [`Self`], as a result, after `drop_before_gp()` retu=
rn + one grace period, no RCU
> > > +/// reader will be on the object, and it's safe to free it.
> > > +///
> > > +/// Notes for implementators: implementing this trait in general req=
uires `Self` being a
> > > +/// [`UnsafePinned`], i.e. a `&mut Self` is not a noalias reference =
if `Self` has non-trivial
> > > +/// `drop()` function.
> > > +pub unsafe trait RcuFreeSafe {
> > > +    fn drop_before_gp(self: Pin<&mut Self>);
> > > +}
> >
> > Should this have an associated type for the rcu-safe view?
> >
> > pub unsafe trait RcuFreeSafe {
> >     type RcuView<'a>;
> >
> >     /// Access this value in a manner that is safe after
> >     /// `drop_before_gp` for one grace period.
> >     fn rcu_view<'a>(self: Pin<&'a Self>, _rcu: &'a RcuGuard) -> Self::R=
cuView<'a>;
> >
> >     /// Drop this value in a manner where it may still be accessed via
> >     /// `rcu_view` for one grace period.
> >     ///
> >     /// # Safety
> >     ///
> >     /// All other accesses to this value must happen before the call to=
 this
> >     /// method, except for accesses using `rcu_view`.
> >     fn drop_before_gp(self: Pin<&mut Self>);
> > }
> >
> > The idea being that once you call `drop_before_gp()`, the value
> > immediately becomes unusable as the type itself, but you can still use
> > it via `rcu_view`. The `RcuView` type can then be a type that has a
> > subset of the type's methods that is safe to use for one grace period
> > after `drop_before_gp`.
> >
> > If you define the trait like this, then PollCondVar becomes RcuFreeSafe=
.
> > It can't be RcuFreeSafe today because you must not create new waiters a=
fter
> > `drop_before_gp()` is called. With this modified trait, it can simply
> > not provide methods for registering new waiters from the RcuView type.
> >
>
> Good point! But I guess I could keep RcuFreeSafe as it is but remove the
> `RcuFreeSafe::with_rcu()`, and this should be sufficient for
> PollCondVar. I do want to wait for a meaningful usage of `rcu_view()` to
> add that, but I think your idea of that is great. Or maybe you have a
> potential usage in mind?

For the dma fence, the fence context would let you access the name c
string via the rcu view.

Alice

