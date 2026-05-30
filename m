Return-Path: <linux-media+bounces-63098-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIE9Aep6GmrW4ggAu9opvQ
	(envelope-from <linux-media+bounces-63098-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 07:51:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FBA60B58E
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 07:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED71E303AF05
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 05:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0DA2580F2;
	Sat, 30 May 2026 05:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e45XiW77"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0074A219303
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 05:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780120229; cv=none; b=ZKOQM9B50p+WczVe+KUFGSVQYBJactQMlE7TYsAXFU44ICaQHF3FDGAXaF77cYAeeEg6Zy1WocIgx8838+L+OLqbcQDBTu11Qf+6YcUsA1qA1UePslWsI1jU3J4n991bvYULThG0ipS7EWuR4mynh1wUdXgTjXyCNVb43QDo7o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780120229; c=relaxed/simple;
	bh=HqdpIWDBXiQCki9mNT42IA9nM4U8ePLD34SIC5IIRCo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eFVcr7Qgt3u00/9v8n3IA3WozZehOYX/vcwH67n2sE+VAcJs9jWoXVyhwdDBZxO8ZbKYhj/8wOkyOVvy8HogvvnS6WlIBgs0TY5t3IYuIuVoHXl/BN70kggHlPmVB7oxxjR3eDDYrT3G4PD1ZnTYeceBCunAtE5LB1CvxhgSeAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e45XiW77; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B09A1F00893;
	Sat, 30 May 2026 05:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780120227;
	bh=EqgKkxkf00+LTAUc6BGP2Zt5MLy2/I7GMhyyjVyL+EI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e45XiW77K7N3RKmCKFXiBThz/n9wxlY/WBYUP/UoIAvZ2OP4kXqO8lbO1XGfH6xI2
	 3h2fV25drch/X+AriX6OMuakXA3fIHsx4d/lGXC0Sz6RUgN6D+z/ekT3xnKvbapmMq
	 1KDGnUGrl2bZV2n7EfSMvu/OB4PYvSrK1SCAhDSpMZlACMdYlTV1A6SQwNKWVY5Mqn
	 40YBYqqwuGM6MOOyM2d2JaXkdbeXXhMTBmIOo25nTZguzzrMs6PgsUUWCXw+wEB1VG
	 W/ssF4N4KxOl4dj0Bn5SsMsCchxylwGC3znHjauU0RED73RxZkTOVVisQvw8W2Lfd/
	 Cx4QNzw8qw6CQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 6/6] rust: drm: gem: Introduce
 shmem::Object::sg_table()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: linux-media@vger.kernel.org, ojeda@kernel.org
In-Reply-To: <20260529183702.677677-7-lyude@redhat.com>
References: <20260529183702.677677-7-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 05:50:27 +0000
Message-Id: <20260530055027.6B09A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63098-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,smtp.kernel.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url]
X-Rspamd-Queue-Id: 58FBA60B58E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Eager evaluation of `Devres::new` and `SGTableMap::new` inside `sg=
_table()` causes a use-after-free of the scatterlist and leaking of page re=
ferences.
- [High] Concurrent device unbind and GEM object free causes Use-After-Free=
 of the GEM object in `SGTableMap::drop`.
- [Low] The patch imports and uses `LazyInit`, `new_lazy_init`, and `LazyIn=
itError` from `crate::sync`, but these are neither defined nor exported any=
where in the tree.
--

commit 2d2d3346ec26b2ca8eba7a05f0577c63628921d0
Author: Lyude Paul <lyude@redhat.com>

rust: drm: gem: Introduce shmem::Object::sg_table()

In order to do this, we need to be careful to ensure that any interface we
expose for scatterlists ensures that any mappings created from one are
destroyed on driver-unbind. To do this, we introduce a Devres resource into
shmem::Object that we use in order to ensure that we release any SGTable
mappings on driver-unbind.

> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 494e0d0d8d0d6..5655c2a1ae8fb 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs

[ ... ]

>      sync::{
>          aref::ARef,
>          new_lazy_init,
>          LazyInit,
>          LazyInitError, //
>      },

[Severity: Low]
Are these primitives defined somewhere else?  The patch imports and uses
LazyInit, new_lazy_init, and LazyInitError from crate::sync, but these don't
seem to be present in the tree or introduced anywhere in this patch series.
Will this lead to a module resolution failure and compilation error?

[ ... ]

>      extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
>          // SAFETY:
>          // - DRM always passes a valid gem object here
>          // - We used drm_gem_shmem_create() in our create_gem_object cal=
lback, so we know that
>          //   `obj` is contained within a drm_gem_shmem_object
>          let base =3D unsafe { container_of!(obj, bindings::drm_gem_shmem=
_object, base) };
> =20
>          // SAFETY:
>          // - We verified above that `obj` is valid, which makes `this` v=
alid
>          // - This function is set in AllocOps, so we know that `this` is=
 contained within a
>          //   `Object<T>`
>          let this =3D unsafe { container_of!(Opaque::cast_from(base), Sel=
f, obj) }.cast_mut();
> =20
>          // We need to reset `sgt_res` first, since doing so requires tha=
t the GEM object is still
>          // alive.
>          // SAFETY:
>          // - We verified above that `this` is valid.
>          // - `&mut (*this)` does not implement Unpin.
>          unsafe { Pin::new_unchecked(&mut (*this).sgt_res) }.reset();

[Severity: High]
Does this code introduce a race condition causing a use-after-free?

If drm_gem_object_put() triggers free_callback() concurrently with a device
unbind, the device unbind thread's devres release callback calls
Revocable::revoke().  This swaps is_available to false and blocks on
synchronize_rcu() before dropping SGTableMap.

Concurrently, free_callback() calls sgt_res.reset(), which drops Devres.
Devres::drop() calls revoke_nosync(), which sees is_available is already fa=
lse
and returns immediately without waiting for the unbind thread.

Then free_callback() proceeds to call drm_gem_shmem_release() and frees the=
 GEM
object memory.

When the unbind thread finishes synchronize_rcu() and executes
SGTableMap::drop(), could it dereference the freed GEM object memory
to lock its dma_resv?

> =20
>          // SAFETY:
>          // - We're in free_callback - so this function is safe to call.
>          // - We won't be using the gem resources on `this` after this ca=
ll.
>          unsafe { bindings::drm_gem_shmem_release(base) };

[ ... ]

>      pub fn sg_table<'a>(
>          &'a self,
>          dev: &'a device::Device<Bound>,
>      ) -> Result<&'a scatterlist::SGTable> {
>          if dev.as_raw() !=3D self.dev().as_ref().as_raw() {
>              return Err(EINVAL);
>          }
> =20
>          match self.sgt_res.init(Devres::new(dev, SGTableMap::new(self)))=
 {

[Severity: High]
Can eager evaluation cause a use-after-free and leaked page references here?

In Rust, function arguments are evaluated eagerly.  Devres::new allocates a=
nd
executes its initializer eagerly.  SGTableMap::new(self) evaluates its
initializer, causing drm_gem_shmem_get_pages_sgt() to be called synchronous=
ly
every time sg_table() is executed, incrementing the page use count.

If sgt_res is already initialized, init() returns LazyInitError::AlreadyInit
and drops the newly created Devres argument.

When Devres is dropped, it drops the inner SGTableMap, calling
SGTableMap::drop(). This calls __drm_gem_shmem_free_sgt_locked(), which
unconditionally unmaps and frees the shared shmem->sgt memory and sets it to
NULL without decrementing the page use count.

Does this leave the originally cached SGTableMap holding a reference to a N=
ULL
or freed shmem->sgt, which would cause a NULL pointer dereference or
use-after-free the next time it's accessed?

>              Ok(ret) | Err(LazyInitError::AlreadyInit(ret)) =3D> Ok(ret.a=
ccess(dev)?),
>              Err(LazyInitError::DuringInit(e)) =3D> Err(e),
>          }
>      }
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529183702.6776=
77-1-lyude@redhat.com?part=3D6

