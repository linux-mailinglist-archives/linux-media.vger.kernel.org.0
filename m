Return-Path: <linux-media+bounces-34049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D79E9ACD9BA
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 10:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B4AE1898DF1
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 08:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0158528C5AA;
	Wed,  4 Jun 2025 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Ddwg44kF"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA5F28B7FE;
	Wed,  4 Jun 2025 08:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025569; cv=none; b=SNKSL6qJb9zSComIVE1yzDR2ZvniKDjtHuHosknpINW3bzHYtzkD9cMhP3C3StBp+CdGO8oMNgvjec8Nvs/4hW7Scet0uf7Ilj8H6U5EwgqkIIMKhze1NGfzO9b7s6SKCY5OR0qD8gfpQz/EcInf8zqxp6DX8l2QsDacy7WWYcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025569; c=relaxed/simple;
	bh=JBhNwS14VlqnULVahD/zps/5wK/F/KjGlCaxfXrITRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YPclPzFZfutEPlKoZ48IAgfXXLcHmoXCWg/kwD2+T+0xXsZmk+0hYEe5TEbCZjdUcZzWd2gk7CGJ+Ti7sO4zuVhUh/iWaFoI5jfrMTb/jdMLjczziGQdj257OeDvQq9zKXxqx+wmvAs4hhv+sXrJl/NzsXOfEpexppHv44i7ugA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Ddwg44kF; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=LCPFAPADt8JOCJBFFfu1MyhQ+vPj22OqdN/un1YStz0=; b=Ddwg44kFMwOOqBVKp98e9Ri5nF
	0t4YLM+TCicL6BAy/Ym89l27K60UgOgN0Vc/s9tMQSF5YXSjzwA0lYQnPqesHG8z3j3p6K0Saax9K
	osb/9XUSHQMziUs9ZDdy7pCSb1HYjIcGaMA5832WtLeYsY/GluJ34pCVBJN/GHpl3quL+lVkUx/QG
	jb6DFa5Arf5ERK2jYAZ60ww2w0ZibTjhmdj1k4BtYUmDXIyAH0b3t83H/xceFMDoK8SHCIvt34Ahj
	ttPwCiE0naYusuB3fDhuEvn/D/yK497t98YVX/dPo98FdywF8tf7tODLvR6uYsqvlKJ/rjC1hXiwB
	VOOuZPgQ==;
Received: from i53875a2b.versanet.de ([83.135.90.43] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uMjR3-0006Av-Ec; Wed, 04 Jun 2025 10:25:21 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
Date: Wed, 04 Jun 2025 10:25:20 +0200
Message-ID: <2024813.jZfb76A358@diego>
In-Reply-To: <20250604-6-10-rocket-v6-1-237ac75ddb5e@tomeuvizoso.net>
References:
 <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-1-237ac75ddb5e@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 4. Juni 2025, 09:57:14 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Tomeu Vizoso:
> Add the bindings for the Neural Processing Unit IP from Rockchip.
>=20
> v2:
> - Adapt to new node structure (one node per core, each with its own
>   IOMMU)
> - Several misc. fixes from Sebastian Reichel
>=20
> v3:
> - Split register block in its constituent subblocks, and only require
>   the ones that the kernel would ever use (Nicolas Frattaroli)
> - Group supplies (Rob Herring)
> - Explain the way in which the top core is special (Rob Herring)
>=20
> v4:
> - Change required node name to npu@ (Rob Herring and Krzysztof Kozlowski)
> - Remove unneeded items: (Krzysztof Kozlowski)
> - Fix use of minItems/maxItems (Krzysztof Kozlowski)
> - Add reg-names to list of required properties (Krzysztof Kozlowski)
> - Fix example (Krzysztof Kozlowski)
>=20
> v5:
> - Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
> - Streamline compatible property (Krzysztof Kozlowski)
>=20
> v6:
> - Remove mention to NVDLA, as the hardware is only incidentally related
>   (Kever Yang)
> - Mark pclk and npu clocks as required by all clocks (Rob Herring)
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 144 +++++++++++++++=
++++++
>  1 file changed, 144 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-c=
ore.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.=
yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9a5e9e213912d0997da2f6ae2=
6189adf044dcc7b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
> @@ -0,0 +1,144 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Neural Processing Unit IP from Rockchip
> +
> +maintainers:
> +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> +
> +description:
> +  Rockchip IP for accelerating inference of neural networks.
> +
> +  There is to be a node per each core in the NPU. In Rockchip's design t=
here
> +  will be one core that is special and needs to be powered on before any=
 of the
> +  other cores can be used. This special core is called the top core and =
should
> +  have the compatible string that corresponds to top cores.
> +
> +properties:
> +  $nodename:
> +    pattern: '^npu@[a-f0-9]+$'
> +
> +  compatible:
> +    enum:
> +      - rockchip,rk3588-rknn-core-top
> +      - rockchip,rk3588-rknn-core
> +
> +  reg:
> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: pc
> +      - const: cna
> +      - const: core
> +
> +  clocks:
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: npu
> +      - const: pclk
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  npu-supply: true
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: srst_a
> +      - const: srst_h
> +
> +  sram-supply: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - iommus
> +  - power-domains
> +  - resets
> +  - reset-names
> +  - npu-supply
> +  - sram-supply
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rknn-core-top

should be rockchip,rk3588-rknn-core-top I think

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +
> +        clock-names:
> +          minItems: 4
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rknn-core

should be rockchip,rk3588-rknn-core

> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          maxItems: 2


Heiko



