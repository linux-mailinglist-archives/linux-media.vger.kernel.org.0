Return-Path: <linux-media+bounces-62894-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPHiIRrhFmo9uQcAu9opvQ
	(envelope-from <linux-media+bounces-62894-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 14:18:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7FB5E4089
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 14:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDB95302BCF5
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 12:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD80364E88;
	Wed, 27 May 2026 12:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hleFI1uo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f201.google.com (mail-lj1-f201.google.com [209.85.208.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2CF305678
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 12:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884188; cv=none; b=pL/n6UNxGggg4g8Cx6iQBbqdlM/zT/D46CjlcUYUzHMnSziN/vPKSLzbTyc2Uc7UUpC8dLbN0MlhyYuE0wUj7VUTRi7F+iRnBieIPkLs0luO8oagec1vhZO63ljNIzLdpArwbj+kqPsZiFPSOKQMxucM5+wHl4EHjvj2VIn05B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884188; c=relaxed/simple;
	bh=hH4FUXAWRkoqD7RFxNxzVkWtnxsFjO12a4XWB+RyyEc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jIXY+EIWTPLm4KMI3RMc5iFhK8twDlSJArRKy1GX7YUFaSPDYYsr41Ed7hwCxxJJuWf0JLKgz7DYeFt5bA4s1FuUr2pllAr8XXO2Cbk4UD4b5z3H5YTNoIFtJV/LJj6+r3BCkvlPoQmeyK9Bkdk6PJJQ6h4WAQN5819kpntOE5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hleFI1uo; arc=none smtp.client-ip=209.85.208.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-lj1-f201.google.com with SMTP id 38308e7fff4ca-38e9589b7c7so5184211fa.0
        for <linux-media@vger.kernel.org>; Wed, 27 May 2026 05:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779884185; x=1780488985; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3GySeGqKvH9w0k+SKK+eNFV995XnhG9D+usTEWb/rPg=;
        b=hleFI1uoWKnT+CCO/W3dV3xFe8CG2SvpXYHj6iJ31/9sINokbQay3drB8Df1g/b2+W
         nc4WemJWZ95a9d0TrCoXl/iZ/Je5jj0iPwZNC8xWDXR5MBeomIxzOI7gJ1I+1rtE9qmv
         XyJnV5B1PVsjLu+86AGoGeCEYl2gzZqhx+HdIVWcB2NCxMKiZWseVSV4qu3qMSYbTEF1
         0o7RI5x5OLJYmy5VM/zVpTRz6DuZ85R+rzqhGEQ6KWbOg6G58jAk7r9W1u2elcUMQuXf
         o8q/NSusYIRcm8V5UhGk/N/0D66AqeMnS285NVcoikwEBQjWciOs8WcHuHf6uK2N/HTt
         esvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779884185; x=1780488985;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GySeGqKvH9w0k+SKK+eNFV995XnhG9D+usTEWb/rPg=;
        b=DyGaGkbbYNun9pydkmkhx4dMUFJqZJunlflYUj1DOXM5k9vME2Wva0tCnw0/mlHCaB
         YPWf6HlJdstqjqOqIE2rP2sgma5AAVsonjdRNEu1cXajDGhcYme6NiH1YyPv4Irk36Se
         wuwF1lheRQKyOlLWRPo1tgHUSjrSBgUJmFismnSLKD+4m+0OKAYc922oHq9qjSIM2A2b
         zmbs1CIiUI5GpJcjButNnVy4psG4D3i11Qx5CmWna1IUAuPUvNbvMRh89ppdZhL7bkR9
         +NYKi09DIUnlmLVTv+cjyFmaL8OtjkqXygZn0RZBTkPt52wr0yOTYquecBwI9yzykZJf
         SfZA==
X-Forwarded-Encrypted: i=1; AFNElJ/rZikel2VaiuY9DO1nvIWETn1IczJ/1SwskUUtS4zKujmImu7okxndzFphQ4tE8+FoQTvFz5c7kS3NAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygcrcfGUHS37BXNjuYliAZWr3MeZ/b1pOX3y85xRszbpJeARRI
	GM7ZDWea4xXt+pueoaX0wBNDh6tVeIbOAI0QVuylEjWAazj5eYjzyJaezA0IfWFi8tMzeSQE4NQ
	NCRTGcBNcFFh+vhXEMw==
X-Received: from ljey13.prod.google.com ([2002:a2e:bb8d:0:b0:393:7fb2:6b5a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:651c:907:b0:396:c3c:d27e with SMTP id 38308e7fff4ca-3960c3cd3femr45362351fa.12.1779884184566;
 Wed, 27 May 2026 05:16:24 -0700 (PDT)
Date: Wed, 27 May 2026 12:16:23 +0000
In-Reply-To: <20260526212857.1158294-6-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260526212857.1158294-1-lyude@redhat.com> <20260526212857.1158294-6-lyude@redhat.com>
Message-ID: <ahbglxo5yePyjE81@google.com>
Subject: Re: [PATCH v14 5/6] rust: drm: gem/shmem: Add DmaResvGuard helper
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62894-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,nvidia.com,garyguo.net,amd.com,lists.linux.dev,kernel.org,linux.intel.com,ffwll.ch,linaro.org,suse.de,gmail.com,lists.linaro.org,asahilina.net,collabora.com,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.896];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0A7FB5E4089
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 05:28:56PM -0400, Lyude Paul wrote:
> Just a temporary holdover to make locking/unlocking the dma_resv lock much
> easier.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-authored-by: Alexandre Courbot <acourbot@nvidia.com>

Missing SoB for Alexandre.

> ---
>  rust/kernel/drm/gem/shmem.rs | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 116ed0a13eac2..1b24cb1129a8b 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -27,7 +27,10 @@
>          Deref,
>          DerefMut, //
>      },
> -    ptr::NonNull,
> +    ptr::{
> +        self,
> +        NonNull, //
> +    },
>  };
>  use gem::{
>      BaseObjectPrivate,
> @@ -233,3 +236,29 @@ impl<T: DriverObject> driver::AllocImpl for Object<T> {
>          dumb_map_offset: None,
>      };
>  }
> +
> +/// Private helper-type for holding the `dma_resv` object for a GEM shmem object.
> +///
> +/// When this is dropped, the `dma_resv` lock is dropped as well.
> +///
> +// TODO: This should be replace with a WwMutex equivalent once we have such bindings in the kernel.
> +struct DmaResvGuard<'a, T: DriverObject>(&'a Object<T>);

Is this missing a NotThreadSafe, or is it safe to unlock on a different
thread than where it was locked?

> +impl<'a, T: DriverObject> DmaResvGuard<'a, T> {
> +    #[inline(always)]
> +    #[expect(unused)]
> +    fn new(obj: &'a Object<T>) -> Self {
> +        // SAFETY: This lock is initialized throughout the lifetime of `object`.
> +        unsafe { bindings::dma_resv_lock(obj.raw_dma_resv(), ptr::null_mut()) };
> +
> +        Self(obj)
> +    }
> +}
> +
> +impl<'a, T: DriverObject> Drop for DmaResvGuard<'a, T> {
> +    #[inline(always)]
> +    fn drop(&mut self) {
> +        // SAFETY: We are releasing the lock grabbed during the creation of this object.
> +        unsafe { bindings::dma_resv_unlock(self.0.raw_dma_resv()) };
> +    }
> +}
> -- 
> 2.54.0
> 

