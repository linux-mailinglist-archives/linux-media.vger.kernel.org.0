Return-Path: <linux-media+bounces-65217-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HZdbGtEJNGovLwYAu9opvQ
	(envelope-from <linux-media+bounces-65217-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 17:08:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 009556A11D6
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 17:08:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=KCe9ASQD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65217-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65217-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7C5030182E4
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60AD53F58D9;
	Thu, 18 Jun 2026 15:07:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9AF322527
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 15:07:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795262; cv=pass; b=Z0tdsj/8W7ovFACub2cJbuFYYc6z1LAPbCEP50iQA6VK+iw1vgKgvi4eSMkgkCuBGxzwWfn5C8/2PlMcMdg5oJTFwMzddx2JXOP/2lQJygDQDvWXJHui+1/yVX0OprqLzoh0BfUq4Jy2pbQ0CCAZElELaIGTiTjNzZDxrrnbzQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795262; c=relaxed/simple;
	bh=oqojXc1/gGyRKZZBJpvbn3qnQfO0iMRjzOLegsFVCgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQvYl3iGUuio6euzFCEO/RMQEHz0swoTYJyT7U/xoM8L3w4wLvSgqM8YYN8EmPWosut4yDobKJYsEVtMbv5/nuwC9iZoZ1lbo6IB/KuodZhqE+RAs8uMVJp9uRTr0beSf238yz4ylNTJ5r3RAT/NBTRE5gup9fBpZnPvH5Cl6q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KCe9ASQD; arc=pass smtp.client-ip=209.85.218.46
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bed2195323cso150759266b.1
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 08:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781795260; cv=none;
        d=google.com; s=arc-20240605;
        b=EyMpZRks/9o0s0WJd0bKHhVznirLNur7L96EnVp2F0Y0CHuXhtiVCDg3dm9BtaFNjL
         wrEM8CDJ7Cf1aW9N5hrZFTKL+JixhKfqhw1hEftZMVIXnby8x45Xnn2nrBn4gbO1BzlO
         g1yDxPUm/3V7IxOtUAxH7Z5Xfgvb6sOsWU5T2+sYuFJ2ra2012EjO3MTUnatpibANINk
         oI6g+4KAMNcA9B/uBQ9l9RzwiVDdken6K1eJpMy8mDo0HDypY5/2djYOdDEwSn0xHbij
         yHTsoPdwmnXQ7shD4G3/wNpxEMBmjifJu4cj9pyCmn7uWJuctDrE3X8OBmfifqo/P+zB
         efnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NYfGyus+VhVBHeY1TmmYU+r9XB2t30QhuWaxH/6OPAg=;
        fh=K2Sx0mz8xJOk0DuBwiIq1/fT9KjcN0v261MhGv5I9Tg=;
        b=M5EuXqq3KOtK6VJA7rOB6OyED4kJHE6lCZRYEdUEYK2UtIo7CPTkPEqEWm+Lj/5edG
         MvYdHpq6ayVteMYvfVnzBeKBXTIgSNPydeJavPK7aZZP/GoVlgmpU3O2wGvvT1bt8YED
         bJ5AUXEbb6hQ/usory6eHws4GlwiImWuE4pvbUXG+kv9D/dkSLwCocGRepcweZAdCYU2
         HNwsmJJgWsCHOITCATECOV4MDlfVSjIkMxgsIeT4vQtl84Z7yadoG0RksRCntKH5dM0S
         /rBjwcKZAYPUocy+tMbGaK1K3tLBWHy9b3kMdPsO45ExYGZhSoi6TEziTtM1VhzOGOU1
         oeAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781795260; x=1782400060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYfGyus+VhVBHeY1TmmYU+r9XB2t30QhuWaxH/6OPAg=;
        b=KCe9ASQDBwiH0ECiU8N5i5XECpdsvhaVGmLC7JMfrXp05K9hMilflk+QRvx81Fg2Th
         ePOpJtui9eB1AkouOeZOMpZcrwVQT/qK79iGZlj1ag8dHeeuy0Dz0GgjMnEywPqB4aPg
         G4bJ+0BEhfGTg21qJffuNtq1sOLILr0mgy6MA5n3QPVCDT9ty8pFLa4pBAY4hJZZhCih
         Ipt2nhz3KDDTf1hxpmxaZnh3VLTkI9odOodfE9qTLB7NppWpE2/snO7mZXX7N/z1JdXV
         C8gckzGFWbzrioccnDClHIiMOov363CpgXeXs5V7gnPruILQcwyAVL3oP1iJO4CbFT/b
         5Jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781795260; x=1782400060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NYfGyus+VhVBHeY1TmmYU+r9XB2t30QhuWaxH/6OPAg=;
        b=Zv1a5lGZUdrmGSRJBdh57MtNqYNzUM2yt7D2i1d+KNSsj6Jzb6BBZwIDUdL/COci8h
         2j1VdtNdFqWPyZSa4G8LxMfKbZeKlLnRPQuFlEBIfN7ZxsDIPaQd26PqlXzZKFM1zaik
         WUWpHyyscHtNGvBODRLGrbCxut6AifFx/1WImIaB0o45IWUsyh0NkWjy1pRmYtTLKvIr
         M47f6EbfCWmoF8oU98TJynEa01PXhAT8X5oeEidUWT1xfU+Stun/3Qkpx896cYdNU/OF
         OACs3UZmMVRJSENsWYNGshN3q//1dZnhFMctqH8cpF2gyGLP+8xMyBTTO1Fwoj3zN7iL
         d3UA==
X-Forwarded-Encrypted: i=1; AFNElJ/Pmlk8Ye7UsvdsngV3ly6hJdDzruIlxNoauQAJeJZCRpNsCmEd+dxQ7wTigBQuwEgEMO6sEpJdV8kIeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAOIUA5drz9fCKax3Y0ApJDcyEqfAWuFtIn3FxOLQfJAeaYcp8
	VQtKagBFHlBEoQSLekj2dm6f5bMfASQrYSwYb6KX/P+6Vf6EmQkCPo6rWUISHv3CQEUHyPYZ0FU
	111BrMFqfHK5L5QmKxAF25ynWTlA1o87ZHFa8O55EYQ==
X-Gm-Gg: AfdE7cljLoyGP+sYcXyV+AU8gZzlvfRK+gybey6eCINWLdLCr53/RK8fCyxvV3eQ/HB
	/qF1UBiPlRcyG6tjN7hpvhCP87D0Q8mhZiffQAQoOzbPUt7lwXNmXX9XJwSK0gyWNZ1vU/DLBQ6
	qVS8a9y/AAxU1kX0AY91L9okt6XHlOp6k/2eLTTl1qQfVM85mAUSPfq+UvvpJQzeenMi0Eenznd
	HbuD3nTS48P3OHcVSWliYYGi8M4tlzDN9e6/djgtcEOI8dR5lbvD5djzFC0wds5+l3zOyquDZ2w
	wT1ViCM6wmP7h/BZb6L6NqVjpQ==
X-Received: by 2002:a17:907:98c:b0:bfe:ed06:565f with SMTP id
 a640c23a62f3a-c05d2ebb73cmr565480566b.52.1781795259736; Thu, 18 Jun 2026
 08:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618132628.3811068-2-phasta@kernel.org> <20260618132628.3811068-6-phasta@kernel.org>
 <923343e7-1f11-4e29-8278-917fc65c75eb@amd.com>
In-Reply-To: <923343e7-1f11-4e29-8278-917fc65c75eb@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 18 Jun 2026 20:37:28 +0530
X-Gm-Features: AVVi8CdVSitERASSjLlXjGMzf8QWomu8u5eVZoymDD14ZtOhmnelZ1EXdDXW5pQ
Message-ID: <CAO_48GGKOGMr5bexkW3+d9AsF=RYkZeaU6+nWgnaJxzXVLft2Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] MAINTAINERS: Add entry for Rust dma-buf
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Philipp Stanner <phasta@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, Matthew Maurer <mmaurer@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Burak Emir <bqe@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Eliot Courtney <ecourtney@nvidia.com>, Mirko Adzic <adzicmirko97@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Shankari Anand <shankari.ak0208@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:acourbot@nvidia.com,m:lina+kernel@asahilina.net,m:mmaurer@google.com,m:ljs@kernel.org,m:joelagnelf@nvidia.com,m:bqe@google.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:tamird@kernel.org,m:work@onurozkan.dev,m:ecourtney@nvidia.com,m:adzicmirko97@gmail.com,m:alistair.francis@wdc.com,m:shankari.ak0208@gmail.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:lina@asahilina.net,m:fujitatomonori@gmail.com,m:shankariak0208@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65217-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[sumit.semwal@linaro.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.semwal@linaro.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,linuxfoundation.org,nvidia.com,asahilina.net,gmail.com,onurozkan.dev,wdc.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,amd.com:email,linaro.org:dkim,linaro.org:email,linaro.org:from_mime,mail.gmail.com:mid,lists.freedesktop.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 009556A11D6

On Thu, 18 Jun 2026 at 19:00, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 6/18/26 15:26, Philipp Stanner wrote:
> > Rust does now have abstractions for dma_fence. These abstractions are
> > quite complicated and require expertise with both the C and the Rust
> > side. Therefore, using the existing entry also for maintenance of the
> > Rust code appears reasonable.
> >
> > Philipp volunteers to help maintain the dma_fence abstractions. Add a
> > corresponding MAINTAINERS entry.
> >
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
fwiw,
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
>
> > ---
> >  MAINTAINERS | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4ae6919454c3..8b03eb2c578a 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7535,6 +7535,7 @@ F:      fs/dlm/
> >  DMA BUFFER SHARING FRAMEWORK
> >  M:   Sumit Semwal <sumit.semwal@linaro.org>
> >  M:   Christian K=C3=B6nig <christian.koenig@amd.com>
> > +M:   Philipp Stanner <phasta@kernel.org>
> >  L:   linux-media@vger.kernel.org
> >  L:   dri-devel@lists.freedesktop.org
> >  L:   linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
> > @@ -7548,6 +7549,8 @@ F:      include/linux/dma-buf.h
> >  F:   include/linux/dma-buf/
> >  F:   include/linux/dma-resv.h
> >  F:   rust/helpers/dma-resv.c
> > +F:   rust/helpers/dma_fence.c
> > +F:   rust/kernel/dma_buf/
> >  K:   \bdma_(?:buf|fence|resv)\b
> >
> >  DMA GENERIC OFFLOAD ENGINE SUBSYSTEM
>


Best,
Sumit.

