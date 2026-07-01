Return-Path: <linux-media+bounces-66279-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LpWJEIpzRWr9AQsAu9opvQ
	(envelope-from <linux-media+bounces-66279-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 22:07:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AF96F1465
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 22:07:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SW5Xw1L4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66279-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66279-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D3B1307E689
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 19:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7749382383;
	Wed,  1 Jul 2026 19:53:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368B3431E7A;
	Wed,  1 Jul 2026 19:53:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782935593; cv=none; b=GgMF8YKHZ/JJBVMjPZNG2BtnfUkoACVEJDba3QGYt58xPDP99gp1i7O5xnrXSqqQxjAs8HBtI/WuYl4zrO7o1wP08rC+dhFWZBN/59sdzc6QBkB79mIOjaGb7ChOyJkNhM5UUbKYfyZqloUD7Z2rCk7tsd2p/8z1fyJS+14V9Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782935593; c=relaxed/simple;
	bh=dls7ew1+DYfJVASM/Ls/ff51kSQcSlGjKUlKVbrcrxs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=PQM8Cy2Za1lzz7+ocF7hZYvBGH90Aa80frF0+sojwZW8IL0OS4sfo+g0gKzpmROMTjGxsbY23CEAlURzwK0h80P3BA0MKV8Fgck8WZt9+0Io41aRtn2ehu35zEOUl69iiVc+Gm91QRM13+0Hnh/Sxet6gmoY5Buq2rJEUPHuunM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SW5Xw1L4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA4B1F000E9;
	Wed,  1 Jul 2026 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782935591;
	bh=Btp8Coh0/YDoX5eWIBILnB6rkqO9aOJKzbTAJEfWmYk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=SW5Xw1L4n6km0go7iiQIUMhYp6NAfj0RV6eYQqCVHodCALEB8dTOYsfQaNULAMbqI
	 xB7nUW5AdUfmj/kfqGM0ge94GbUCCvRDC/EQnSopZqdpLC3YWJPU3hhxzoB7TiuMXK
	 rgwksGyFQDkLQ4L1Zv//reedGipqwPdRgCwYfIYn7SUowcW/xIaoKQgA7tLYyowF21
	 vtZqvsjUt5lA/qYPA9GV1RiCdmGczJhLUDM+otUG+k4cTl/W4Sjha1gMK6icACBU9B
	 4gKGJaZ253aNPnE8hxuMfX5mHW4TnINK1IFn2iP7EiwQlNNuW7HvzKuCaOFexbJrlV
	 u/4ONeNo3HSXg==
Date: Wed, 01 Jul 2026 14:53:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 dri-devel@lists.freedesktop.org, David Hildenbrand <david@kernel.org>, 
 Yury Norov <yury.norov@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-trace-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-mm@kvack.org, Russell King <linux@armlinux.org.uk>, 
 Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 David Airlie <airlied@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 linaro-mm-sig@lists.linaro.org, Heiko Carstens <hca@linux.ibm.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Thierry Reding <treding@nvidia.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Brian Starkey <Brian.Starkey@arm.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Michal Hocko <mhocko@suse.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Suren Baghdasaryan <surenb@google.com>, 
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, 
 devicetree@vger.kernel.org, "Liam R. Howlett" <liam@infradead.org>, 
 linux-tegra@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, "T.J. Mercier" <tjmercier@google.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, iommu@lists.linux.dev, 
 Mike Rapoport <rppt@kernel.org>, Sven Schnelle <svens@linux.ibm.com>
To: Thierry Reding <thierry.reding@kernel.org>
In-Reply-To: <20260701-tegra-vpr-v3-1-d80f7b871bb4@nvidia.com>
References: <20260701-tegra-vpr-v3-0-d80f7b871bb4@nvidia.com>
 <20260701-tegra-vpr-v3-1-d80f7b871bb4@nvidia.com>
Message-Id: <178293558945.1610040.13281502080616690110.robh@kernel.org>
Subject: Re: [PATCH v3 01/11] dt-bindings: reserved-memory: Document Tegra
 VPR
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,rasmusvillemoes.dk,lists.freedesktop.org,kernel.org,gmail.com,vger.kernel.org,arm.com,ffwll.ch,amd.com,kvack.org,armlinux.org.uk,collabora.com,lists.linaro.org,linaro.org,nvidia.com,google.com,bootlin.com,suse.com,goodmis.org,linux.intel.com,lists.infradead.org,infradead.org,samsung.com,suse.de,linux-foundation.org,efficios.com,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66279-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:borntraeger@linux.ibm.com,m:linux@rasmusvillemoes.dk,m:dri-devel@lists.freedesktop.org,m:david@kernel.org,m:yury.norov@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robin.murphy@arm.com,m:simona@ffwll.ch,m:linux-trace-kernel@vger.kernel.org,m:krzk+dt@kernel.org,m:christian.koenig@amd.com,m:linux-mm@kvack.org,m:linux@armlinux.org.uk,m:will@kernel.org,m:mhiramat@kernel.org,m:airlied@gmail.com,m:gor@linux.ibm.com,m:benjamin.gaignard@collabora.com,m:linaro-mm-sig@lists.linaro.org,m:hca@linux.ibm.com,m:sumit.semwal@linaro.org,m:treding@nvidia.com,m:mripard@kernel.org,m:thierry.reding@gmail.com,m:jstultz@google.com,m:luca.ceresoli@bootlin.com,m:vbabka@kernel.org,m:Brian.Starkey@arm.com,m:mperttunen@nvidia.com,m:mhocko@suse.com,m:rostedt@goodmis.org,m:jonathanh@nvidia.com,m:maarten.lankhorst@linux.intel.com,m:skomatineni@nvidia.com,m:surenb@google.com,m:linux-arm-kernel@lists.infradead.org,m:linux-s390@vger.kernel.org,m:devicetree@vger.k
 ernel.org,m:liam@infradead.org,m:linux-tegra@vger.kernel.org,m:catalin.marinas@arm.com,m:m.szyprowski@samsung.com,m:conor+dt@kernel.org,m:tzimmermann@suse.de,m:akpm@linux-foundation.org,m:gerald.schaefer@linux.ibm.com,m:agordeev@linux.ibm.com,m:ljs@kernel.org,m:tjmercier@google.com,m:mathieu.desnoyers@efficios.com,m:iommu@lists.linux.dev,m:rppt@kernel.org,m:svens@linux.ibm.com,m:thierry.reding@kernel.org,m:yurynorov@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:email,devicetree.org:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3AF96F1465


On Wed, 01 Jul 2026 18:08:12 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Video Protection Region (VPR) found on NVIDIA Tegra chips is a
> region of memory that is protected from CPU accesses. It is used to
> decode and play back DRM protected content.
> 
> It is a standard reserved memory region that can exist in two forms:
> static VPR where the base address and size are fixed (uses the "reg"
> property to describe the memory) and a resizable VPR where only the
> size is known upfront and the OS can allocate it wherever it can be
> accomodated.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - add examples for fixed and resizable VPR
> ---
>  .../nvidia,tegra-video-protection-region.yaml      | 76 ++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.example.dtb: protected@2a8000000 (nvidia,tegra-video-protection-region): reg: [[2, 2818572288], [0, 1879048192]] is too long
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.example.dtb: protected@2a8000000 (nvidia,tegra-video-protection-region): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701-tegra-vpr-v3-1-d80f7b871bb4@nvidia.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


