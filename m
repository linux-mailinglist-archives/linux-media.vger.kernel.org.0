Return-Path: <linux-media+bounces-60529-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKqxEJzv+mlGUgMAu9opvQ
	(envelope-from <linux-media+bounces-60529-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 09:37:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9876C4D74E4
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 09:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0A3B301F499
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 07:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA1E3B7769;
	Wed,  6 May 2026 07:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCGrX+GH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE553B6366;
	Wed,  6 May 2026 07:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778052821; cv=none; b=cDiGwZvu5ms/l/GR6d/GwZSkMXinwrlz/Y1zBANvn+TVya39UTM2IOkRfZXd3Yvyh2pYWRUVl56pa1aoBtThvk5BBuzxhigzYNTZNm6lNvx7sSR/+2csBob7N3ocso+09vYaVpivN54GQ6QdhJC5ld2XI4UoC2sPVem0RrYE84A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778052821; c=relaxed/simple;
	bh=F2Y0rkFfu8WpYJn2WFscZsjiOa2h76q/1wFRyrGfSi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pB8w63Sh9CnIWhzWu5jvOHof2iq0R4FMKAJlg/R/YS8bHITBc+yOU3G0DROldstK9Agcao7GVjHAjRBDNmrpPkAYwJzsvmawM89EMN1xnXXM9g9/Q3A78+Wrkm9YuEbGrYZUK1MEIykSFp5Wyregy8l6OjnPbUcEDQBIHBResMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCGrX+GH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D310CC2BCB8;
	Wed,  6 May 2026 07:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778052821;
	bh=F2Y0rkFfu8WpYJn2WFscZsjiOa2h76q/1wFRyrGfSi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HCGrX+GHCUYy+ayJnjE8RaOFP8GmHrTBXZ5dOScZTUNJK3S5URWnzKRucVzda7Ai+
	 YmeFXEXyLK8f6jabvhnXTpckMgSHiZJVj+rwhgnR1ag6s0Tjzkl0koSGg9qSiAYWJ/
	 3M6MLiBK0bO9z+xL09iF3XYSHE+3ZaU46vxo0ys6agLBjN+2TZgVqo2pUr4CcG0vjJ
	 +QhJ0cR3F6cC9LHjVLhoCsAEL4tkuKSixFw6ZaiHmjeL83+KcnyAFxB0iOcA71E6J3
	 Jye9koB3/Jd3IKeWPXiLP5YrjqzU6u18/GR0c7Ahw3bmPiAxGh3LOrNxinJANfIOL2
	 pYJlJFsZPXmgg==
Date: Wed, 6 May 2026 09:33:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] media: dt-bindings: venus: Add qcom,msm8939 schema
Message-ID: <20260506-magic-greedy-caterpillar-ea5ad8@quoll>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
 <20260506-msm8939-venus-rfc-v4-1-994f5eb22acb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260506-msm8939-venus-rfc-v4-1-994f5eb22acb@gmail.com>
X-Rspamd-Queue-Id: 9876C4D74E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60529-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,apitzsch.eu:email]

On Wed, May 06, 2026 at 12:44:38AM +0300, Erikas Bitovtas wrote:
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>=20
> Add a schema description for the Venus video decoder/encoder IP in
> MSM8939.
>=20
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  .../bindings/media/qcom,msm8939-venus.yaml         | 75 ++++++++++++++++=
++++++
>  1 file changed, 75 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-venus.y=
aml b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
> new file mode 100644
> index 000000000000..5bbc7cfb61c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,msm8939-venus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm MSM8939 Venus video encode and decode accelerators
> +
> +maintainers:
> +  - Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> +  - Erikas Bitovtas <xerikasxx@gmail.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The Venus IP is a video encode and decode accelerator present
> +  on Qualcomm platforms
> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,msm8939-venus
> +
> +  power-domains:
> +    maxItems: 3
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: core0

vcodec0

> +      - const: core1

vcodec1

> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +      - const: bus
> +      - const: core0

vcodec0_core

> +      - const: core1

vcodec1_core

To match other bindings.

> +
> +  iommus:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - iommus
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
> +
> +    video-codec@1d00000 {
> +      compatible =3D "qcom,msm8939-venus";
> +      reg =3D <0x01d00000 0xff000>;
> +      interrupts =3D <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks =3D <&gcc GCC_VENUS0_VCODEC0_CLK>,
> +               <&gcc GCC_VENUS0_AHB_CLK>,
> +               <&gcc GCC_VENUS0_AXI_CLK>,
> +               <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
> +               <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
> +      clock-names =3D "core", "iface", "bus", "core0", "core1";
> +      power-domains =3D <&gcc VENUS_GDSC>,
> +                      <&gcc VENUS_CORE0_GDSC>,
> +                      <&gcc VENUS_CORE1_GDSC>;
> +      power-domain-names =3D "venus", "core0", "core1";
> +      iommus =3D <&apps_iommu 5>;
> +      memory-region =3D <&venus_mem>;
> +      status =3D "disabled";

Examples cannot be disabled. Please add here complete example.

Best regards,
Krzysztof


