Return-Path: <linux-media+bounces-59556-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EVFIQ6x62mRQQAAu9opvQ
	(envelope-from <linux-media+bounces-59556-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 20:06:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1B0462439
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 20:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5D8D3001D55
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 18:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8C43ECBFD;
	Fri, 24 Apr 2026 18:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aPnK2f76"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57213ECBC2;
	Fri, 24 Apr 2026 18:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777053960; cv=none; b=I9CsdGzpN206+mFCxqZzsVgR1NlNs/w+1AxXuj8g1Octps9r9sReQKNipcVrLwCUyjYjZehXKhHNQbe6akhWBetoZzSbTcUHNXHOiZIUo5NO7DPkjVFY1WnY1Z4zDyM0rnZnUc3t2wSkkLtrwUFMX9tLg7udonWwg/h9qOxxVK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777053960; c=relaxed/simple;
	bh=ejKEisanWsd8xl2Mc9rPlQCU5cbmJtb0L3OmLefF4Tg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=pZVIkMrj9bkwjkYFPTP3snKBQl5uqsq9NGeJKZVXYwfH0WtSj2E5FSrBwVFwPGiD55AyXdQ1NWP77BmH7K8bwIsgLIGTTDC2lbisRKsN3wPS5a6LgIE1/9PNNBw/uOI2lX1/xxyFOdNlF/51ncfhVObdPyhn5CbBZoWWDIhttLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aPnK2f76; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from neptunite.rasen.tech (unknown [IPv6:2404:7a81:160:2100:5216:c7b6:205:5f59])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6CFA8227;
	Fri, 24 Apr 2026 20:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777053856;
	bh=ejKEisanWsd8xl2Mc9rPlQCU5cbmJtb0L3OmLefF4Tg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aPnK2f769Kq3yuTbeUBhlkIisCCCFu9ujppk9b0g2hlaHNf3gRgA7S5YWfS3CLOTk
	 SEzb0ySjNcd7aHs6u+vG67DRL1i8VLSiDqqIDPhwS8DpzhprmbOwteuCIEk6aUgjhW
	 rg/UGH6FP7Qk9D07JXD6JK6q9ZPWdHCkRCC1gOqU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260424175853.638202-2-paul.elder@ideasonboard.com>
References: <20260424175853.638202-1-paul.elder@ideasonboard.com> <20260424175853.638202-2-paul.elder@ideasonboard.com>
Subject: Re: [RFC PATCH 1/5] media: dt-bindings: Add rockchip rkisp2 bindings
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: michael.riesch@collabora.com, xuhf@rock-chips.com, stefan.klug@ideasonboard.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
To: laurent.pinchart@ideasonboard.com
Date: Sat, 25 Apr 2026 03:05:50 +0900
Message-ID: <177705395057.43355.18439675795236129023@neptunite.rasen.tech>
User-Agent: alot/0.0.0
X-Rspamd-Queue-Id: 4D1B0462439
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_FROM(0.00)[bounces-59556-lists,linux-media=lfdr.de];
	R_DKIM_ALLOW(0.00)[ideasonboard.com:s=mail];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.elder@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.905];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	TO_DN_SOME(0.00)[]

Hi me,

Quoting Paul Elder (2026-04-25 02:58:46)
> Add documentation for the Rockchip rkisp2 bindings. This is meant to
> support multiple versions of Rockchip ISPs going forward, including the
> 2.x series and 3.x series. The current version only adds the compatible
> for the RK3588, which is a 3.0.
>=20
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  .../bindings/media/rockchip-isp2.yaml         | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-isp2=
.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip-isp2.yaml b=
/Documentation/devicetree/bindings/media/rockchip-isp2.yaml
> new file mode 100644
> index 000000000000..f4ef089adf6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip-isp2.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip-isp2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip SoC Image Signal Processing unit v2
> +
> +maintainers:
> +  - Paul Elder <paul.elder@ideasonboard.com>
> +
> +description: |
> +  Rockchip ISP2 is the Camera interface for the Rockchip series of SoCs =
which
> +  contains image processing, scaling, and compression functions.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3588-isp
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 3
> +    maxItems: 3

These should be 2.

> +
> +  interrupt-names:
> +    items:
> +      - const: isp_irq
> +      - const: mi_irq
> +
> +  clocks:
> +    minItems: 3
> +    items:
> +      - description: ISP AXI clock (aclk)
> +      - description: ISP AHB clock (hclk)
> +      - description: ISP core clock (isp)
> +      # for rk3588
> +      - description: ISP core clock (marvin)
> +      - description: ISP core clock (vicap)
> +
> +  clock-names:
> +    minItems: 3
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: clk_core
> +      # for rk3588
> +      - const: clk_core_marvin
> +      - const: clk_core_vicap
> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    minItems: 1

This can be removed.

> +    items:
> +      - description: ISP power domain
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: connection point for VICAP in inline mode
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-isp
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +        clock-names:
> +          minItems: 5
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +
> +    parent0: parent {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        isp0: isp@fdcb0000 {
> +            compatible =3D "rockchip,rk3588-isp";
> +            reg =3D <0x0 0xfdcb0000 0x0 0x7f00>;
> +            interrupts =3D <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
> +                         <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>,
> +                         <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH 0>;
> +            interrupt-names =3D "isp_irq", "mi_irq";

I removed the interrupt name and forgot to remove the interrupt.

I think the same problem is present in the dt node in the next patch.


Paul

> +            clocks =3D <&cru ACLK_ISP0>, <&cru HCLK_ISP0>,
> +                     <&cru CLK_ISP0_CORE>, <&cru CLK_ISP0_CORE_MARVIN>,
> +                     <&cru CLK_ISP0_CORE_VICAP>;
> +            clock-names =3D "aclk", "hclk", "clk_core",
> +                        "clk_core_marvin", "clk_core_vicap";
> +            power-domains =3D <&power RK3588_PD_VI>;
> +            iommus =3D <&isp0_mmu>;
> +        };
> +    };
> --=20
> 2.47.2
>

