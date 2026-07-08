Return-Path: <linux-media+bounces-67070-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Br3mI6y+Tmp4TQIAu9opvQ
	(envelope-from <linux-media+bounces-67070-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 23:18:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F1C72A782
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 23:18:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ij1oKLvn;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67070-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67070-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D20363015181
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 21:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE1936F8EF;
	Wed,  8 Jul 2026 21:18:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3015F3E8331
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 21:18:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783545505; cv=none; b=G3Jia318OMglchMgK6yVB0zQOrfVMdMDD2C1Ru7CBFD2L1bBjDmt3NvPrsPHmqkGiTlAuT6rNYTBfU5hMDHQK+d/4pLeVU1wmHB8JxreKbfZYyaktoLsNjADMLjmyPZv0tjxH/B6VhlBoRoOvaSwruoCgv+wqnVYVeKrS0eSMRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783545505; c=relaxed/simple;
	bh=/yf86s+VjDN6zg68B/grd6BOMs4viFCbAkNex3o3AKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qW0HTgcyFz07umuVpK7LAsDU7kELOEFdt05vPGCn8JEKm4nQLDsnqUBKE3Vxm5GwB/0PjaWtr+kF9qB5VnqdmSV9+Up5QHnxr2iHBRH8G4ZIFoR5yY66kMmX2bD7rGx7pCCZDslVc5vWKgFKB89Vvkv8GCfWX3RuyiWEzqtIwnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ij1oKLvn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8447E1F00A3D
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 21:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783545503;
	bh=XHlK26iT5OTlGmvdsQr6aTlcJ71q9tfgFUQl/PoXZWA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ij1oKLvneDuoMo7g4aa7tnzEGSduqP/POFTYHBdxBZ815qZpk9LFbDgsAo0yCt8IU
	 7IVs6w+zLmWUyetjrgBlg1w5iqaPlbRALMaZO8JW7hqU/1gvwTbxJwp4KOcWeGc63v
	 75V4WotUCt8Dobg79gGG87lQ7nK03BdYhKAKjhYHR6XGEIrP/JoGdtP22AbbDvdmY9
	 B/6r+YzOxZx43W7v+wiSMS40iikcKhYr6dIVP5FmzwUS2uq8+P91iQ4y6rs3YT1Lct
	 RdWSXHuhozPhfIOsKn2saEE2M5xJTpuQM3JnOsppmQRmSqllqe3+hlGwET7HA3MA1T
	 EVcF2gcOddPww==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15b33f7b23so178140066b.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 14:18:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpHUeqqTjNbkPOtt3hdpUvoMu7yDHfx/vjODk7dHD3AlnEnPP2I09ZT1WKbRWLDLBhRc3W7IGjm0E64wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCdTzI8R+/3boHkZthQhHG8D0MzufpxMEhZ0m1McxQuqUHrnO3
	tYVPjG5EcMstZcoSj1KTlz9s7mlLNAcZKAz/IBidSci4GKWFNe98qcW1sQenknUfaRx/r4404xQ
	8FiCoOqboU6wL6kx27xPUkLcquy9z7g==
X-Received: by 2002:a17:907:a286:b0:c15:b6bd:cbb8 with SMTP id
 a640c23a62f3a-c15ce121a12mr190425566b.50.1783545501322; Wed, 08 Jul 2026
 14:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-tegra-vpr-v3-0-d80f7b871bb4@nvidia.com>
 <20260701-tegra-vpr-v3-1-d80f7b871bb4@nvidia.com> <178293558945.1610040.13281502080616690110.robh@kernel.org>
 <akZde-8lFvf8rPji@orome>
In-Reply-To: <akZde-8lFvf8rPji@orome>
From: Rob Herring <robh@kernel.org>
Date: Wed, 8 Jul 2026 16:18:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJCMm-oL35COx=agY+mwRUMMnRvbUgzPr5Hy9uvcPk0Dg@mail.gmail.com>
X-Gm-Features: AUfX_mz5rhGcrunDpACqiF1Zhx-HBPPyHD0sxMJJ0YCYlPmg5dj7i6HAGao9icM
Message-ID: <CAL_JsqJCMm-oL35COx=agY+mwRUMMnRvbUgzPr5Hy9uvcPk0Dg@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] dt-bindings: reserved-memory: Document Tegra VPR
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	dri-devel@lists.freedesktop.org, David Hildenbrand <david@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-trace-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-mm@kvack.org, Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, David Airlie <airlied@gmail.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	linaro-mm-sig@lists.linaro.org, Heiko Carstens <hca@linux.ibm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Thierry Reding <treding@nvidia.com>, 
	Maxime Ripard <mripard@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	John Stultz <jstultz@google.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Brian Starkey <Brian.Starkey@arm.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Michal Hocko <mhocko@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Suren Baghdasaryan <surenb@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, 
	devicetree@vger.kernel.org, "Liam R. Howlett" <liam@infradead.org>, 
	linux-tegra@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, "T.J. Mercier" <tjmercier@google.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, iommu@lists.linux.dev, 
	Mike Rapoport <rppt@kernel.org>, Sven Schnelle <svens@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,rasmusvillemoes.dk,lists.freedesktop.org,kernel.org,gmail.com,vger.kernel.org,arm.com,ffwll.ch,amd.com,kvack.org,armlinux.org.uk,collabora.com,lists.linaro.org,linaro.org,nvidia.com,google.com,bootlin.com,suse.com,goodmis.org,linux.intel.com,lists.infradead.org,infradead.org,samsung.com,suse.de,linux-foundation.org,efficios.com,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-67070-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:borntraeger@linux.ibm.com,m:linux@rasmusvillemoes.dk,m:dri-devel@lists.freedesktop.org,m:david@kernel.org,m:yury.norov@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robin.murphy@arm.com,m:simona@ffwll.ch,m:linux-trace-kernel@vger.kernel.org,m:krzk+dt@kernel.org,m:christian.koenig@amd.com,m:linux-mm@kvack.org,m:linux@armlinux.org.uk,m:will@kernel.org,m:mhiramat@kernel.org,m:airlied@gmail.com,m:gor@linux.ibm.com,m:benjamin.gaignard@collabora.com,m:linaro-mm-sig@lists.linaro.org,m:hca@linux.ibm.com,m:sumit.semwal@linaro.org,m:treding@nvidia.com,m:mripard@kernel.org,m:thierry.reding@gmail.com,m:jstultz@google.com,m:luca.ceresoli@bootlin.com,m:vbabka@kernel.org,m:Brian.Starkey@arm.com,m:mperttunen@nvidia.com,m:mhocko@suse.com,m:rostedt@goodmis.org,m:jonathanh@nvidia.com,m:maarten.lankhorst@linux.intel.com,m:skomatineni@nvidia.com,m:surenb@google.com,m:linux-arm-kernel@lists.infradead.org,m:linux-s390@vger.ke
 rnel.org,m:devicetree@vger.kernel.org,m:liam@infradead.org,m:linux-tegra@vger.kernel.org,m:catalin.marinas@arm.com,m:m.szyprowski@samsung.com,m:conor+dt@kernel.org,m:tzimmermann@suse.de,m:akpm@linux-foundation.org,m:gerald.schaefer@linux.ibm.com,m:agordeev@linux.ibm.com,m:ljs@kernel.org,m:tjmercier@google.com,m:mathieu.desnoyers@efficios.com,m:iommu@lists.linux.dev,m:rppt@kernel.org,m:svens@linux.ibm.com,m:yurynorov@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,vger.kernel.org:from_smtp,mail.gmail.com:mid,nvidia.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8F1C72A782

On Thu, Jul 2, 2026 at 7:58=E2=80=AFAM Thierry Reding <thierry.reding@kerne=
l.org> wrote:
>
> On Wed, Jul 01, 2026 at 02:53:10PM -0500, Rob Herring (Arm) wrote:
> >
> > On Wed, 01 Jul 2026 18:08:12 +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > The Video Protection Region (VPR) found on NVIDIA Tegra chips is a
> > > region of memory that is protected from CPU accesses. It is used to
> > > decode and play back DRM protected content.
> > >
> > > It is a standard reserved memory region that can exist in two forms:
> > > static VPR where the base address and size are fixed (uses the "reg"
> > > property to describe the memory) and a resizable VPR where only the
> > > size is known upfront and the OS can allocate it wherever it can be
> > > accomodated.
> > >
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > > Changes in v2:
> > > - add examples for fixed and resizable VPR
> > > ---
> > >  .../nvidia,tegra-video-protection-region.yaml      | 76 ++++++++++++=
++++++++++
> > >  1 file changed, 76 insertions(+)
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/reserved-memory/nvidia,tegra-video-protection-region.example.dtb: protecte=
d@2a8000000 (nvidia,tegra-video-protection-region): reg: [[2, 2818572288], =
[0, 1879048192]] is too long
> >       from schema $id: http://devicetree.org/schemas/reserved-memory/nv=
idia,tegra-video-protection-region.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/reserved-memory/nvidia,tegra-video-protection-region.example.dtb: protecte=
d@2a8000000 (nvidia,tegra-video-protection-region): Unevaluated properties =
are not allowed ('no-map', 'reg' were unexpected)
> >       from schema $id: http://devicetree.org/schemas/reserved-memory/nv=
idia,tegra-video-protection-region.yaml
>
> Any ideas why that second error shows up? It turns out that it goes away
> when the first one is fixed (which admittedly is a stupid mistake), but
> I spent quite a bit of time looking for a fix before realizing that it's
> only a side-effect of the first.

If a property fails validation in a referenced schema, then everything
in that referenced schema is considered not evaluated. So then
unevaluatedProperties is applied to the properties only in the
referenced schema. That's why 'no-map' is also unevaluated. Just a
quirk of how json-schema works...

Rob

