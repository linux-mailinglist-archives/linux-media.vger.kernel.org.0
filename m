Return-Path: <linux-media+bounces-53736-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEwEFNm9oWnCwAQAu9opvQ
	(envelope-from <linux-media+bounces-53736-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 16:52:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 097F01BA556
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 16:52:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6822B307DE62
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 15:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EBC91AAE28;
	Fri, 27 Feb 2026 15:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqUiaXwn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFD4394465;
	Fri, 27 Feb 2026 15:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207437; cv=none; b=dohTrJl8rNsFo6RY3TycIpEEvW9WpQ1cgNcJMug/bvzQD/rLbXdvU+S7ukv1uV/gzG8GjDOE3taZ9wIf2bb2OqOTcekaqRQUyubP0nJwOypmJj0Un1IhaUG2Vpl91ToDMCCg1hSdAkXCtaA+pUlj9yUZ8XOMp9mhmk0KyX8IMJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207437; c=relaxed/simple;
	bh=VNdQZZw9aIaxOZa+qCUXMY3f+K9E1mCwFoQ7EytCOHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bk/wXDVYpgkIZMHo1Od7S4Bwsfnwplsex44VVu8/TaZZRL0MJamHIu7md1H0y4cKLxdydWnrJ7jSK0OrHMofl+yodwSwY25vyzD46uvaIV+xXYDblxMGad8kAkiew8ClUZV2MLe4QIUHFVkH7vut0zT9bJ1y+6ovG99bgo3o//I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqUiaXwn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E60C19422;
	Fri, 27 Feb 2026 15:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772207436;
	bh=VNdQZZw9aIaxOZa+qCUXMY3f+K9E1mCwFoQ7EytCOHs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SqUiaXwnSzN1fZBKtnZJe8jwY3Y4r0RkIIWxh+/mmUs0GdjdHeTo8eDSn0QdHoZYH
	 4RNcy44IEtzTKYJk16anEJtE57MHvuz85XelRs0aeUpAAYdwHpKVxbwLoVmjwpjZud
	 pbA0Tf9Y36VZuXQECSwpVmn4rjG14S4yqmRayPsxPxI1n5mA15CpkVoRxZ54jHJgSc
	 UVx3QoVhL9yKvKVKYer+G+E7ORAn1B9olYse61XjYSoYStHqwPiOl/pL9pJDMTOG7s
	 6l07k1N6yQJCm0fV94ZE113BDkHKzrq3wG5nMBNhYki8tL6Mu3SuLCFSRn/uihF13W
	 5G7TN1LsehT+A==
Message-ID: <4dcbbd06-18eb-46c6-a52c-07a4b17205cd@kernel.org>
Date: Fri, 27 Feb 2026 16:50:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-1-850043ac3933@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260227-kaanapali-iris-v2-1-850043ac3933@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53736-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url,qualcomm.com:email]
X-Rspamd-Queue-Id: 097F01BA556
X-Rspamd-Action: no action

On 27/02/2026 15:11, Vikash Garodia wrote:
> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> compared to previous generation, iris3x, it has,
> - separate power domains for stream and pixel processing hardware blocks
>   (bse and vpp).
> - additional power domain for apv codec.
> - power domains for individual pipes (VPPx).
> - different clocks and reset lines.
> 
> iommu-map include all the different stream-ids which can be possibly
> generated by vpu4 hardware as below,
> bitstream stream from vcodec
> non-pixel stream from vcodec
> non-pixel stream from tensilica
> pixel stream from vcodec
> secure bitstream stream from vcodec
> secure non-pixel stream from vcodec
> secure non-pixel stream from tensilica
> secure pixel stream from vcodec
> firmware stream from tensilica (might be handled by the TZ / hyp)

I cannot really parse above.

> 
> This patch is depend on the below dt-schema patch.
> Link: https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-iris.yaml        | 261 +++++++++++++++++++++
>  include/dt-bindings/media/qcom,iris.h              |  18 ++
>  2 files changed, 279 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..db734c664a0417d8f5ea55b066f63f42583b1c14
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
> @@ -0,0 +1,261 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-iris.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Kaanapali Iris video encoder and decoder
> +
> +maintainers:
> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> +  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> +
> +description:
> +  The iris video processing unit is a video encode and decode accelerator
> +  present on Qualcomm Kaanapali SoC.
> +
> +definitions:
> +  iommu-types:
> +    items:
> +      - description: Function ID
> +      - description: Phandle to IOMMU
> +      - description: IOMMU stream ID base
> +      - description: IOMMU stream ID mask
> +      - description: Number of stream IDs

You don't need definitions.

> +
> +properties:
> +  compatible:
> +    const: qcom,kaanapali-iris
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 10
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: core
> +      - const: vcodec0_core
> +      - const: iface1
> +      - const: core_freerun
> +      - const: vcodec0_core_freerun
> +      - const: vcodec_bse
> +      - const: vcodec_vpp0
> +      - const: vcodec_vpp1
> +      - const: vcodec_apv
> +
> +  dma-coherent: true
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  iommu-map:
> +    description: |
> +        - bitstream stream from vcodec
> +        - non-pixel stream from vcodec
> +        - non-pixel stream from tensilica
> +        - pixel stream from vcodec
> +        - secure bitstream stream from vcodec
> +        - secure non-pixel stream from vcodec
> +        - secure non-pixel stream from tensilica
> +        - secure pixel stream from vcodec
> +        # firmware might be handled by the TZ / hyp
> +        - firmware stream from tensilica

Drop description, pointless. How does it help anyhow in writing DTS?

> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      $ref: '#/definitions/iommu-types'
> +      minItems: 5
> +    minItems: 8
> +    maxItems: 9

This solves nothing from the discussions we had. I re-iterated multiple
times, plus there were internal threads doing the same, that you need to
define the items to have strict order.

> +
> +  memory-region:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +  power-domains:
> +    maxItems: 7
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: mxc
> +      - const: mmcx
> +      - const: vpp0
> +      - const: vpp1
> +      - const: apv
> +
> +  resets:
> +    maxItems: 4
> +
> +  reset-names:
> +    items:
> +      - const: bus0
> +      - const: bus1
> +      - const: core
> +      - const: vcodec0_core
> +

I assume you checked and used last SoC order of all the entries here.


> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - dma-coherent
> +  - interconnects
> +  - interconnect-names
> +  - interrupts
> +  - iommu-map
> +  - memory-region
> +  - power-domains
> +  - power-domain-names
> +  - resets
> +  - reset-names
> +
> +unevaluatedProperties: false

additionalprops, see writing schema for explanation.


...

> +    };
> diff --git a/include/dt-bindings/media/qcom,iris.h b/include/dt-bindings/media/qcom,iris.h

Filename must match binding/compatible. I asked for this multiple times.

> new file mode 100644
> index 0000000000000000000000000000000000000000..beb244289466ca938c7e5fe5cf15526f606a3a6c
> --- /dev/null
> +++ b/include/dt-bindings/media/qcom,iris.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_MEDIA_QCOM_IRIS_H
> +#define _DT_BINDINGS_MEDIA_QCOM_IRIS_H
> +
> +/* Function identifiers for iommu-map to attach for the context bank devices */
> +#define IRIS_BITSTREAM		0x100
> +#define IRIS_NON_PIXEL		0x101
> +#define IRIS_PIXEL		0x102
> +#define IRIS_SECURE_BITSTREAM	0x200
> +#define IRIS_SECURE_NON_PIXEL	0x201
> +#define IRIS_SECURE_PIXEL	0x202
> +#define IRIS_FIRMWARE		0x300
> +

Abstract identifiers for ABI start with 0 or 1 and are incremented by 1,
not 0x100. There are also decimal, not hex.

Best regards,
Krzysztof

