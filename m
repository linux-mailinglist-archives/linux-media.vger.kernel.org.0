Return-Path: <linux-media+bounces-66280-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1gdSCTNwRWrvAAsAu9opvQ
	(envelope-from <linux-media+bounces-66280-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 21:53:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D39B36F120D
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 21:53:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dVQu4w7P;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66280-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66280-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E41E1303A41D
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 19:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B205B3B2FCC;
	Wed,  1 Jul 2026 19:53:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1A3431E6E;
	Wed,  1 Jul 2026 19:53:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782935594; cv=none; b=VPOhy/xvKybC37M+1eepldLw/c6r3Y+NvA+YGNtukiIdqE+wZaplBh+L46nDjtucBrRLXzOrBACoqAzbfe1AWDv6TAsmBj5SkXZwFv5i8wSj5OI8dq1pWCAqk7XWDXoN5eyR1eTzJG93sGLEbLm2eZGe+qsYL/3rqWiP/UEaPqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782935594; c=relaxed/simple;
	bh=k1hLGRaDb4DJ+uVX/6oHYdjDM3FPTy2iKVHUJOfw94Y=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=OMHhJv1DWw79pXbbkSXY3TQa/9bP8CfQ+HPkT4y7Wb3UN/G8PC+nsZPFucRFGWhN+ldYE+eWcJIBA+brDOEhqwM+IALQjPSLDfyn+7KZCRcsaG8DHD3vEEG4GNentWRyhRZVTEPSEKSMWJzitQkElW5It6IzpBopsAARJ9NRUXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVQu4w7P; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4A41F00A3A;
	Wed,  1 Jul 2026 19:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782935592;
	bh=fzFM+3fnKG0YLEDmBIloyOG/31SnlMJCbijzwmUNu+0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=dVQu4w7P3dCUJ5KBUDAc4q3L1wAsQVNP/nKMxUpjt8ZiS/3HdSIMwTOljW8/JVMl0
	 DD5yfBvXaIX6yid82xMVg80tHH93ROwQVaAxzACoOABqbDYaCrwrCdnMp9yQjhfmtv
	 yM/CK/nD1+sWbi/uI5coRQ1PFmO6naJBOghjrbGdQihcbAPR/R2fxRSZsHfL3/gAe1
	 dMrlH6WU1wKStdUEBTtzKgxEFvCZ0V/P2NzUQYLEfQBmrAPn+66TFX5UaD09Y1Jc/x
	 xn/7dzGPjhWgaqehG2ONJtZ4IjW23B2TJGgOkXsKOGFoAeMGU/E2Pcw/2APB/MHO/i
	 qx3e+GdTEgJqA==
Date: Wed, 01 Jul 2026 14:53:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linaro-mm-sig@lists.linaro.org, Lorenzo Stoakes <ljs@kernel.org>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Yury Norov <yury.norov@gmail.com>, 
 linux-media@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-s390@vger.kernel.org, 
 Masami Hiramatsu <mhiramat@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
 David Hildenbrand <david@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Mike Rapoport <rppt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Robin Murphy <robin.murphy@arm.com>, Russell King <linux@armlinux.org.uk>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 John Stultz <jstultz@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-mm@kvack.org, 
 Sumit Semwal <sumit.semwal@linaro.org>, Will Deacon <will@kernel.org>, 
 Thierry Reding <treding@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 "Liam R. Howlett" <liam@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, linux-tegra@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 "T.J. Mercier" <tjmercier@google.com>, David Airlie <airlied@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>
In-Reply-To: <20260701-tegra-vpr-v3-2-d80f7b871bb4@nvidia.com>
References: <20260701-tegra-vpr-v3-0-d80f7b871bb4@nvidia.com>
 <20260701-tegra-vpr-v3-2-d80f7b871bb4@nvidia.com>
Message-Id: <178293559078.1610192.17087150631381044391.robh@kernel.org>
Subject: Re: [PATCH v3 02/11] dt-bindings: display: tegra: Document memory
 regions
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,kernel.org,linux.ibm.com,suse.de,gmail.com,vger.kernel.org,rasmusvillemoes.dk,nvidia.com,goodmis.org,lists.linux.dev,ffwll.ch,linux.intel.com,arm.com,armlinux.org.uk,lists.freedesktop.org,samsung.com,google.com,amd.com,collabora.com,lists.infradead.org,efficios.com,kvack.org,linaro.org,bootlin.com,infradead.org,linux-foundation.org,suse.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66280-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linaro-mm-sig@lists.linaro.org,m:ljs@kernel.org,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:tzimmermann@suse.de,m:yury.norov@gmail.com,m:linux-media@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux@rasmusvillemoes.dk,m:jonathanh@nvidia.com,m:linux-s390@vger.kernel.org,m:mhiramat@kernel.org,m:vbabka@kernel.org,m:hca@linux.ibm.com,m:mperttunen@nvidia.com,m:david@kernel.org,m:rostedt@goodmis.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:simona@ffwll.ch,m:rppt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:robin.murphy@arm.com,m:linux@armlinux.org.uk,m:dri-devel@lists.freedesktop.org,m:mripard@kernel.org,m:m.szyprowski@samsung.com,m:gor@linux.ibm.com,m:Brian.Starkey@arm.com,m:krzk+dt@kernel.org,m:borntraeger@linux.ibm.com,m:jstultz@google.com,m:christian.koenig@amd.com,m:thierry.reding@gmail.com,m:devicetree@vger.kernel.org,m:benjamin.gaignard@collabora.com,m:catalin.marinas@arm.com,m:linux-arm-kernel@lists.infradead.org
 ,m:agordeev@linux.ibm.com,m:mathieu.desnoyers@efficios.com,m:linux-mm@kvack.org,m:sumit.semwal@linaro.org,m:will@kernel.org,m:treding@nvidia.com,m:luca.ceresoli@bootlin.com,m:liam@infradead.org,m:akpm@linux-foundation.org,m:surenb@google.com,m:skomatineni@nvidia.com,m:linux-tegra@vger.kernel.org,m:conor+dt@kernel.org,m:mhocko@suse.com,m:tjmercier@google.com,m:airlied@gmail.com,m:thierry.reding@kernel.org,m:yurynorov@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nvidia.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D39B36F120D


On Wed, 01 Jul 2026 18:08:13 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the memory-region and memory-region-names properties to the bindings
> for the display controllers and the host1x engine found on various Tegra
> generations. These memory regions are used to access firmware-provided
> framebuffer memory as well as the video protection region.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - document properties for VIC
> ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml |  8 ++++++++
>  .../devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml  | 10 ++++++++++
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml   | 10 +++++++++-
>  .../bindings/display/tegra/nvidia,tegra20-host1x.yaml          |  7 +++++++
>  4 files changed, 34 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml: properties:memory-region-names: 'anyOf' conditional failed, one must be fixed:
	'maxitems' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml: properties:memory-region-names:items: {'enum': ['framebuffer', 'protected']} is not of type 'array'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml: properties:memory-region-names: Additional properties are not allowed ('maxitems' was unexpected)
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml: properties:memory-region-names:items: {'enum': ['framebuffer', 'protected']} is not of type 'array'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml: properties:memory-region-names: Additional properties are not allowed ('maxitems' was unexpected)
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701-tegra-vpr-v3-2-d80f7b871bb4@nvidia.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


