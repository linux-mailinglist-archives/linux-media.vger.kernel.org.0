Return-Path: <linux-media+bounces-67082-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fBwzKDbiTmpVWAIAu9opvQ
	(envelope-from <linux-media+bounces-67082-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 01:50:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C173272B42D
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 01:50:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=RNMLsxEA;
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67082-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67082-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5AE40301AC8E
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 23:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D930B3AB5DE;
	Wed,  8 Jul 2026 23:49:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D564639EF33
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 23:49:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783554589; cv=pass; b=pEc6W2QaMwSRN3gGmF3DZZlq7nVxWnBLdqSxgOyuHlb85nC87tb1xE6G4OEmJxHfX4VTA61XDZiUyN0vp221/qjFuCzlWkshYtufUBzoeQAtnaNjjIzQbrV+y/vHe3SE6R5SIryKDOaxjKtx3VC8/jTMGbGjI1u6c0o3sDb5ayw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783554589; c=relaxed/simple;
	bh=iOu8Vu8FK8936tOh9CPH/yq1tUlz9DnfnSlQFjrnLXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+QcowhOpnfXIDv/xoKt460KIbris07+LQokJ6n5sjUI0A9qX40KrScRiJf/vyJkaha8y4XZJFV2TIY8xEiBdaDRf6a5X+jYyuMb+F3cdDXwQEHqdoUucX0N9I0O6F55trBskcpPULrN162WiQVfwE+oKRHNlekKSdBii3iB9qI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RNMLsxEA; arc=pass smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b8d92a4eso10865e9.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 16:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783554585; cv=none;
        d=google.com; s=arc-20260327;
        b=IPx11UvVV2F3N1kW7+69aDYRNNfBGD+gMY7Z/MN94olw+nlr2Dttfjh9CCFEIGgD01
         En1ddhGmIiLzYHJrB1hnsuIEoOFZ0g8fqO5/RHCfPEse3Xc91G6pkORosGEyfGeHZH3j
         r4W9BbRMP7CEdnl9XXc/JZ9ZeD0rqKrJiH+flPnJOAyhpdiklKIzCV2qXSpSLNCcmDsb
         svdEMks6tUUW2e1tZmkvIOmZx1wItP4a0urSLLDxLRqLjjxaPhnvO39eK3YVCUiEXqkA
         13L5px8gMqbynqjZNo1yfCNkAL0FD7ykn0yY+w7oytKaqAZ90CL3qlmmfH86PRHkOnLD
         r2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rib4ibu+dts9p9/XbnX7ZcTmfXYVT7n2/w0qnalOJkU=;
        fh=hlPDps8xSnVwpp8ZyTwgpCdXxYviixyr3zz/gOOy8J8=;
        b=ematKmXVYlYyiauBH1rPbP1eltj3Lmt9bjwx4Vz+Ql+9ZTQPWZbBzNfzsHMl7aL+IX
         SDzj0ItMoaz4Ym1reN8mK8GU54JKpYVA23WZXjQH+kmiFy4vPO8doqcTidZNbtXMk4rc
         +bqjuT1bbv26PMGM5X4BTA8qkUCr9E3BeeGzutivyDo2p19fwZx8Az5AgiTXQJ8OHDkC
         K9HNTOslYouTnXettVgoPJEQie8qfEdfrarDErTS7+jsyOODMxX/kLY2CHaXZNK+Xis1
         ryVt0KwNoIW6/U6Fkw9vojiv5ygSmTDzBbjX7KglEPLdsyHjFSlMDiN29twnx26rlcpI
         1NDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783554585; x=1784159385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rib4ibu+dts9p9/XbnX7ZcTmfXYVT7n2/w0qnalOJkU=;
        b=RNMLsxEAr+xtYUGa2w2RLBYdc3vMdclo2hbrnRNoPtAxzVmN83odkQCAStJGxUynUF
         BIf5Ujb8R0CcGtrNleby/Jxz4vg3zJXnVYz4l5gbQzms8PTZgmeCpEn/bOhuzop3GKmZ
         Necd5686JpmAx0zKgZ55Zb97yMJ8KeaMiJsnBQank8P2z0uXUgXS/Qy2ZLbzClUWU5um
         3vHFLLhdBPE3lliNNNQE4vnnYM4A/5oMAeJoG6w5+v/BNR1fl0BrRARjBS4i9eKZFyrV
         E/SRiiJ20WmuGW6y9dBs9Q366OpGQptx4i7J/oPJyql07YagvKcmBKqCWW7213gubWw5
         4O6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783554585; x=1784159385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rib4ibu+dts9p9/XbnX7ZcTmfXYVT7n2/w0qnalOJkU=;
        b=gtcFCnnvqXk7mRYSHceDNYHDtfd7MO4wtfeCmFslw3PA9pe/M3O1EguVzx9LmDUenE
         kYOo9oVLboJuMBiis8AraCmQl8ixOH3QR4KHX22KGB5XomwB4Kajqa0s9ZqL099BswJR
         DGXiwt9zZ758Qbvwu7nfmKZzbjlTTe6kiCOoKoQezdTGHJ2XMTgaseEJlCWBv6EWSsAE
         Qf1PIl4h2ZhHjGY2pmMyHcVNtfYhXjzEdLf3mQ6EVbsNji6tWxO6zXu5qSX+aGgxnLAR
         uPUIEs7Lrgc2E9JJvqNeVkvbUQRpjXqNktPGQhrqVBM1vdJP7VkLxb9uojQgWQ2X9axn
         jXCw==
X-Forwarded-Encrypted: i=1; AHgh+Rq9WoV08bYrWNUg93i8a1d3JnhHwEIZMEM3+I6WZjvt+EN6hk6huHme2AGxc/p6ESOAQExTh2rmpaAddA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6cVbYtJ4dzLCFt0mswTeF5sCD/YvCOaJ+gszEaAteJlQMcTE9
	RnNuuEyhqIHjElY84EFqRIS7KxYjKQv2JPJNLuD6FVSWHqZTlUSSafKwA5BmNFbMad1K67BufHJ
	363Z3gC+xtp+4BWH905MD9CoASfyuXGzYJRYC6gIo
X-Gm-Gg: AfdE7cnbea2Mu02vOkcH/vXy60hmaGiu0CgEPJxhS5LauadPRcR1fPVuLxulUDEKttV
	sBFstXIIVN+sHdO3A3SUccyHAqr+d6fqfBdLxYspT7JctvZQKZaW1cywH4O5Vx77zQBSQh1UUP4
	Nfxd3XajwVE6KLJKpnehaoPEIXOElhRSvKMBRHvb7+hCySRzyybiGM/FCsfRZTDRA8u0NPLc2j8
	FsqwbwAs58jMM6ZLWeGZQkGfpfkxVUfIRlHtTRxnfzSxBXzZ/lJHz7oIhPD8KSNbA5zga1BlyQI
	98iMA7jUmoqWKiGKUkcAHOOZaXhgF8cGUt492DMR0URZoCyaEnEUxG6C8Q==
X-Received: by 2002:a05:600d:644a:10b0:490:b3cd:fc4d with SMTP id
 5b1f17b1804b1-493ec91fb9cmr44975e9.9.1783554584679; Wed, 08 Jul 2026 16:49:44
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-tegra-vpr-v3-0-d80f7b871bb4@nvidia.com> <20260701-tegra-vpr-v3-6-d80f7b871bb4@nvidia.com>
In-Reply-To: <20260701-tegra-vpr-v3-6-d80f7b871bb4@nvidia.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 8 Jul 2026 16:49:31 -0700
X-Gm-Features: AUfX_mzOMAhQgIZCGlz9_znmnioZkDYwZn81U0HlPggiFRGlpgF5nj0v4x5iIA0
Message-ID: <CABdmKX2i_vxs3EgJgydEbXoTxqWe9g9pj=hqPKuwf0ge0SjZuQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] mm/cma: Allow dynamically creating CMA areas
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Russell King <linux@armlinux.org.uk>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-mm@kvack.org, iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org, 
	linux-trace-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67082-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jonathanh@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mperttunen@nvidia.com,m:yury.norov@gmail.com,m:linux@rasmusvillemoes.dk,m:linux@armlinux.org.uk,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:christian.koenig@amd.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:catalin.marinas@arm.com,
 m:will@kernel.org,m:thierry.reding@gmail.com,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linaro-mm-sig@lists.linaro.org,m:linux-trace-kernel@vger.kernel.org,m:treding@nvidia.com,m:krzk@kernel.org,m:conor@kernel.org,m:yurynorov@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,bootlin.com,rasmusvillemoes.dk,armlinux.org.uk,linux.ibm.com,linux-foundation.org,infradead.org,google.com,suse.com,samsung.com,arm.com,linaro.org,collabora.com,amd.com,goodmis.org,efficios.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kvack.org,lists.linux.dev,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,nvidia.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C173272B42D

On Wed, Jul 1, 2026 at 9:09=E2=80=AFAM Thierry Reding <thierry.reding@kerne=
l.org> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> There is no technical reason why there should be a limited number of CMA
> regions, so extract some code into helpers and use them to create extra
> functions (cma_create() and cma_free()) that allow creating and freeing,
> respectively, CMA regions dynamically at runtime.
>
> The static array of CMA areas cannot be replaced by dynamically created
> areas because for many of them, allocation must not fail and some cases
> may need to initialize them before the slab allocator is even available.
> To account for this, keep these "early" areas in a separate list and
> track the dynamic areas in a separate list.

Hi, It looks like you'll also need to update the CMA dma-buf heap's
add_cma_heaps init function so that it adds all the CMA areas, not
just the early ones.

>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - rebase on top of recent linux-next, update kernel/dma/contiguous.c
> - use kzalloc_obj() instead of kzalloc() with sizeof()
>
> Changes in v2:
> - rename fixed number of CMA areas to reflect their main use
> - account for pages in dynamically allocated regions
> ---
>  arch/arm/mm/dma-mapping.c |   2 +-
>  arch/s390/mm/init.c       |   2 +-
>  include/linux/cma.h       |   8 +-
>  kernel/dma/contiguous.c   |   2 +-
>  mm/cma.c                  | 187 +++++++++++++++++++++++++++++++++++++---=
------
>  mm/cma.h                  |   5 +-
>  6 files changed, 165 insertions(+), 41 deletions(-)
>
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index f9bc53b60f99..934952ab2102 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -254,7 +254,7 @@ struct dma_contig_early_reserve {
>         unsigned long size;
>  };
>
> -static struct dma_contig_early_reserve dma_mmu_remap[MAX_CMA_AREAS] __in=
itdata;
> +static struct dma_contig_early_reserve dma_mmu_remap[MAX_EARLY_CMA_AREAS=
] __initdata;
>
>  static int dma_mmu_remap_num __initdata;
>
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index f07168a0d3dd..f8f78f1434ea 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -241,7 +241,7 @@ static int s390_cma_mem_notifier(struct notifier_bloc=
k *nb,
>         mem_data.start =3D arg->start_pfn << PAGE_SHIFT;
>         mem_data.end =3D mem_data.start + (arg->nr_pages << PAGE_SHIFT);
>         if (action =3D=3D MEM_GOING_OFFLINE)
> -               rc =3D cma_for_each_area(s390_cma_check_range, &mem_data)=
;
> +               rc =3D cma_for_each_early_area(s390_cma_check_range, &mem=
_data);
>         return notifier_from_errno(rc);
>  }
>
> diff --git a/include/linux/cma.h b/include/linux/cma.h
> index 8555d38a97b1..fb7a4923c3ba 100644
> --- a/include/linux/cma.h
> +++ b/include/linux/cma.h
> @@ -7,7 +7,7 @@
>  #include <linux/numa.h>
>
>  #ifdef CONFIG_CMA_AREAS
> -#define MAX_CMA_AREAS  CONFIG_CMA_AREAS
> +#define MAX_EARLY_CMA_AREAS    CONFIG_CMA_AREAS
>  #endif
>
>  #define CMA_MAX_NAME 64
> @@ -57,8 +57,14 @@ struct page *cma_alloc_frozen_compound(struct cma *cma=
, unsigned int order);
>  bool cma_release_frozen(struct cma *cma, const struct page *pages,
>                 unsigned long count);
>
> +extern int cma_for_each_early_area(int (*it)(struct cma *cma, void *data=
), void *data);
>  extern int cma_for_each_area(int (*it)(struct cma *cma, void *data), voi=
d *data);
>  extern bool cma_intersects(struct cma *cma, unsigned long start, unsigne=
d long end);
>
>  extern void cma_reserve_pages_on_error(struct cma *cma);
> +
> +extern struct cma *cma_create(phys_addr_t base, phys_addr_t size,
> +                             unsigned int order_per_bit, const char *nam=
e);
> +extern void cma_free(struct cma *cma);
> +
>  #endif
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index f754079a287d..7975551f69b3 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -52,7 +52,7 @@
>  #define CMA_SIZE_MBYTES 0
>  #endif
>
> -static struct cma *dma_contiguous_areas[MAX_CMA_AREAS];
> +static struct cma *dma_contiguous_areas[MAX_EARLY_CMA_AREAS];
>  static unsigned int dma_contiguous_areas_num;
>
>  static int dma_contiguous_insert_area(struct cma *cma)
> diff --git a/mm/cma.c b/mm/cma.c
> index a13ce4999b39..f989e2e98594 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -34,7 +34,12 @@
>  #include "internal.h"
>  #include "cma.h"
>
> -struct cma cma_areas[MAX_CMA_AREAS];
> +static DEFINE_MUTEX(cma_lock);
> +
> +struct cma cma_early_areas[MAX_EARLY_CMA_AREAS];
> +unsigned int cma_early_area_count;
> +
> +static LIST_HEAD(cma_areas);
>  unsigned int cma_area_count;
>
>  phys_addr_t cma_get_base(const struct cma *cma)
> @@ -198,7 +203,6 @@ static void __init cma_activate_area(struct cma *cma)
>                                 free_reserved_page(pfn_to_page(pfn));
>                 }
>         }
> -       totalcma_pages -=3D cma->count;
>         cma->available_count =3D cma->count =3D 0;
>         pr_err("CMA area %s could not be activated\n", cma->name);
>  }
> @@ -207,8 +211,8 @@ static int __init cma_init_reserved_areas(void)
>  {
>         int i;
>
> -       for (i =3D 0; i < cma_area_count; i++)
> -               cma_activate_area(&cma_areas[i]);
> +       for (i =3D 0; i < cma_early_area_count; i++)
> +               cma_activate_area(&cma_early_areas[i]);
>
>         return 0;
>  }
> @@ -219,41 +223,77 @@ void __init cma_reserve_pages_on_error(struct cma *=
cma)
>         set_bit(CMA_RESERVE_PAGES_ON_ERROR, &cma->flags);
>  }
>
> +static void __init cma_init_area(struct cma *cma, const char *name,
> +                                phys_addr_t size, unsigned int order_per=
_bit)
> +{
> +       if (name)
> +               strscpy(cma->name, name);
> +       else
> +               snprintf(cma->name, CMA_MAX_NAME,  "cma%d\n", cma_area_co=
unt);
> +
> +       cma->available_count =3D cma->count =3D size >> PAGE_SHIFT;
> +       cma->order_per_bit =3D order_per_bit;
> +
> +       INIT_LIST_HEAD(&cma->node);
> +}
> +
>  static int __init cma_new_area(const char *name, phys_addr_t size,
>                                unsigned int order_per_bit,
>                                struct cma **res_cma)
>  {
>         struct cma *cma;
>
> -       if (cma_area_count =3D=3D ARRAY_SIZE(cma_areas)) {
> +       if (cma_early_area_count =3D=3D ARRAY_SIZE(cma_early_areas)) {
>                 pr_err("Not enough slots for CMA reserved regions!\n");
>                 return -ENOSPC;
>         }
>
> +       mutex_lock(&cma_lock);
> +
>         /*
>          * Each reserved area must be initialised later, when more kernel
>          * subsystems (like slab allocator) are available.
>          */
> -       cma =3D &cma_areas[cma_area_count];
> -       cma_area_count++;
> +       cma =3D &cma_early_areas[cma_early_area_count];
> +       cma_early_area_count++;
>
> -       if (name)
> -               strscpy(cma->name, name);
> -       else
> -               snprintf(cma->name, CMA_MAX_NAME,  "cma%d\n", cma_area_co=
unt);
> +       cma_init_area(cma, name, size, order_per_bit);
>
> -       cma->available_count =3D cma->count =3D size >> PAGE_SHIFT;
> -       cma->order_per_bit =3D order_per_bit;
> -       *res_cma =3D cma;
>         totalcma_pages +=3D cma->count;
> +       *res_cma =3D cma;
> +
> +       mutex_unlock(&cma_lock);
>
>         return 0;
>  }
>
>  static void __init cma_drop_area(struct cma *cma)
>  {
> +       mutex_lock(&cma_lock);
>         totalcma_pages -=3D cma->count;
> -       cma_area_count--;
> +       cma_early_area_count--;
> +       mutex_unlock(&cma_lock);
> +}
> +
> +static int __init cma_check_memory(phys_addr_t base, phys_addr_t size)
> +{
> +       if (!size || !memblock_is_region_reserved(base, size))
> +               return -EINVAL;
> +
> +       /*
> +        * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement whic=
h
> +        * needs pageblock_order to be initialized. Let's enforce it.
> +        */
> +       if (!pageblock_order) {
> +               pr_err("pageblock_order not yet initialized. Called durin=
g early boot?\n");
> +               return -EINVAL;
> +       }
> +
> +       /* ensure minimal alignment required by mm core */
> +       if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
> +               return -EINVAL;
> +
> +       return 0;
>  }
>
>  /**
> @@ -276,22 +316,9 @@ int __init cma_init_reserved_mem(phys_addr_t base, p=
hys_addr_t size,
>         struct cma *cma;
>         int ret;
>
> -       /* Sanity checks */
> -       if (!size || !memblock_is_region_reserved(base, size))
> -               return -EINVAL;
> -
> -       /*
> -        * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement whic=
h
> -        * needs pageblock_order to be initialized. Let's enforce it.
> -        */
> -       if (!pageblock_order) {
> -               pr_err("pageblock_order not yet initialized. Called durin=
g early boot?\n");
> -               return -EINVAL;
> -       }
> -
> -       /* ensure minimal alignment required by mm core */
> -       if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
> -               return -EINVAL;
> +       ret =3D cma_check_memory(base, size);
> +       if (ret < 0)
> +               return ret;
>
>         ret =3D cma_new_area(name, size, order_per_bit, &cma);
>         if (ret !=3D 0)
> @@ -444,7 +471,7 @@ static int __init __cma_declare_contiguous_nid(phys_a=
ddr_t *basep,
>         pr_debug("%s(size %pa, base %pa, limit %pa alignment %pa)\n",
>                 __func__, &size, &base, &limit, &alignment);
>
> -       if (cma_area_count =3D=3D ARRAY_SIZE(cma_areas)) {
> +       if (cma_early_area_count =3D=3D ARRAY_SIZE(cma_early_areas)) {
>                 pr_err("Not enough slots for CMA reserved regions!\n");
>                 return -ENOSPC;
>         }
> @@ -1051,12 +1078,12 @@ bool cma_release_frozen(struct cma *cma, const st=
ruct page *pages,
>         return true;
>  }
>
> -int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data=
)
> +int cma_for_each_early_area(int (*it)(struct cma *cma, void *data), void=
 *data)
>  {
>         int i;
>
> -       for (i =3D 0; i < cma_area_count; i++) {
> -               int ret =3D it(&cma_areas[i], data);
> +       for (i =3D 0; i < cma_early_area_count; i++) {
> +               int ret =3D it(&cma_early_areas[i], data);
>
>                 if (ret)
>                         return ret;
> @@ -1065,6 +1092,25 @@ int cma_for_each_area(int (*it)(struct cma *cma, v=
oid *data), void *data)
>         return 0;
>  }
>
> +int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data=
)
> +{
> +       struct cma *cma;
> +
> +       mutex_lock(&cma_lock);
> +
> +       list_for_each_entry(cma, &cma_areas, node) {
> +               int ret =3D it(cma, data);
> +
> +               if (ret) {
> +                       mutex_unlock(&cma_lock);
> +                       return ret;
> +               }
> +       }
> +
> +       mutex_unlock(&cma_lock);
> +       return 0;
> +}
> +
>  bool cma_intersects(struct cma *cma, unsigned long start, unsigned long =
end)
>  {
>         int r;
> @@ -1147,3 +1193,74 @@ void __init *cma_reserve_early(struct cma *cma, un=
signed long size)
>
>         return ret;
>  }
> +
> +struct cma *__init cma_create(phys_addr_t base, phys_addr_t size,
> +                             unsigned int order_per_bit, const char *nam=
e)
> +{
> +       struct cma *cma;
> +       int ret;
> +
> +       ret =3D cma_check_memory(base, size);
> +       if (ret < 0)
> +               return ERR_PTR(ret);
> +
> +       cma =3D kzalloc_obj(*cma, GFP_KERNEL);
> +       if (!cma)
> +               return ERR_PTR(-ENOMEM);
> +
> +       cma_init_area(cma, name, size, order_per_bit);
> +       cma->ranges[0].base_pfn =3D PFN_DOWN(base);
> +       cma->ranges[0].early_pfn =3D PFN_DOWN(base);
> +       cma->ranges[0].count =3D cma->count;
> +       cma->nranges =3D 1;
> +
> +       cma_activate_area(cma);
> +
> +       mutex_lock(&cma_lock);
> +       list_add_tail(&cma->node, &cma_areas);
> +       totalcma_pages +=3D cma->count;
> +       cma_area_count++;
> +       mutex_unlock(&cma_lock);
> +
> +       return cma;
> +}
> +
> +void cma_free(struct cma *cma)
> +{
> +       unsigned int i;
> +
> +       /*
> +        * Safety check to prevent a CMA with active allocations from bei=
ng
> +        * released.
> +        */
> +       for (i =3D 0; i < cma->nranges; i++) {
> +               unsigned long nbits =3D cma_bitmap_maxno(cma, &cma->range=
s[i]);
> +
> +               if (!bitmap_empty(cma->ranges[i].bitmap, nbits)) {
> +                       WARN(1, "%s: range %u not empty\n", cma->name, i)=
;
> +                       return;
> +               }
> +       }
> +
> +       /* free reserved pages and the bitmap */
> +       for (i =3D 0; i < cma->nranges; i++) {
> +               struct cma_memrange *cmr =3D &cma->ranges[i];
> +               unsigned long end_pfn, pfn;
> +
> +               end_pfn =3D cmr->base_pfn + cmr->count;
> +               for (pfn =3D cmr->base_pfn; pfn < end_pfn; pfn++)
> +                       free_reserved_page(pfn_to_page(pfn));
> +
> +               bitmap_free(cmr->bitmap);
> +       }
> +
> +       mutex_destroy(&cma->alloc_mutex);
> +
> +       mutex_lock(&cma_lock);
> +       totalcma_pages -=3D cma->count;
> +       list_del(&cma->node);
> +       cma_area_count--;
> +       mutex_unlock(&cma_lock);
> +
> +       kfree(cma);
> +}
> diff --git a/mm/cma.h b/mm/cma.h
> index c70180c36559..ae4db9819e38 100644
> --- a/mm/cma.h
> +++ b/mm/cma.h
> @@ -41,6 +41,7 @@ struct cma {
>         unsigned long   available_count;
>         unsigned int order_per_bit; /* Order of pages represented by one =
bit */
>         spinlock_t      lock;
> +       struct list_head node;
>         struct mutex alloc_mutex;
>  #ifdef CONFIG_CMA_DEBUGFS
>         struct hlist_head mem_head;
> @@ -71,8 +72,8 @@ enum cma_flags {
>         CMA_ACTIVATED,
>  };
>
> -extern struct cma cma_areas[MAX_CMA_AREAS];
> -extern unsigned int cma_area_count;
> +extern struct cma cma_early_areas[MAX_EARLY_CMA_AREAS];
> +extern unsigned int cma_early_area_count;
>
>  static inline unsigned long cma_bitmap_maxno(struct cma *cma,
>                 struct cma_memrange *cmr)
>
> --
> 2.54.0
>

