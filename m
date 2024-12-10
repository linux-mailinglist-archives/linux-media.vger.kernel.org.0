Return-Path: <linux-media+bounces-23021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFC89EADA6
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 11:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDA29165BE5
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049F123DEAC;
	Tue, 10 Dec 2024 10:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="NP0seO6Z"
X-Original-To: linux-media@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1621D23DEA0
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 10:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733825494; cv=none; b=sS3089m7pWNdemrA8M2HN/CHaTKEyFjbr+rmjy1u1r4l9cSbslWX1h1pnzxqcEiVn9X8NYJVzo7CTMWzW9aiwqRGdKQYvHVHvOfAFRBihOvKH2GJMMRcaPD1eHR9bvC5RaRQ9iRNVGZ2htGqEx5xT/rvvs+O9DYYOXgwFqioaso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733825494; c=relaxed/simple;
	bh=Is04EpUqny47P+McpfOwBkWYp5nx/FFC8BY4uWj8p4E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dSXwMHyvt5pTn2suNDWtOjzCykR9DGjYuAwFJcBvx4Cm5c3hfQSxgtmK2A9j5yRZcLLDkNqDG7uF4FEtM77ZbaysYO+SvcL1nF7QswlouBK+ATjmRfLlLf1PXxCwdnQMJGHySJ7uH2/e7Fv5mLn0M692JzLimAGkR8PQqxOR/pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=NP0seO6Z; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1733825479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=purajMjFhhk8y5/cpEF3Tr9X2g/M0StBEyNcpYreAGQ=;
	b=NP0seO6ZkdS2m743DvP2W4u6umphTKJ3vID18ZeBxSHPY0Yo3J+7mkFKSH269V5fr3hvZm
	T74G377FYPbEDDgtfloYV/kw0OgMQ4wg5UvqGE2V4MaK5sHQZUXBOyaULdn1jfyo/puj2c
	8Xvj6JMIPwRply5w+fCIm6ZhRmwKpYxZ1e8npoBeJ5zXiEL4V9tkjU1oMrM1zMlh3TcH9x
	L3BssV0fnPQ8De/3uBS8KENaNxj73YxspCuc3EcZZyUcqlvizwXohOgG10PCmcmoPVZ+q+
	/0SJNDbGqwoS6ulAFy7hF/4UPKWXILs8u7EVdclE8QdaYJ82hC7QXLG+Ga0hgQ==
Content-Type: multipart/signed;
 boundary=f3aa349fa658de3c6bc38a403667b8482bead4ff85b9abcb6690bf442bc1;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Tue, 10 Dec 2024 11:11:09 +0100
Message-Id: <D67XU0SO4U6D.2GTDZE4V7RK0J@cknow.org>
Cc: <kernel@collabora.com>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <dmitry.osipenko@collabora.com>,
 "Sebastian Reichel" <sebastian.reichel@collabora.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: media: Document bindings for HDMI
 RX Controller
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Shreeya Patel" <shreeya.patel@collabora.com>, <heiko@sntech.de>,
 <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
 <p.zabel@pengutronix.de>, <jose.abreu@synopsys.com>,
 <nelson.costa@synopsys.com>, <shawn.wen@rock-chips.com>,
 <nicolas.dufresne@collabora.com>, <hverkuil@xs4all.nl>,
 <hverkuil-cisco@xs4all.nl>
References: <20241209200120.3228643-1-shreeya.patel@collabora.com>
 <01020193ad040150-e0cf3371-115b-469e-840e-4fa97af5b207-000000@eu-west-1.amazonses.com>
In-Reply-To: <01020193ad040150-e0cf3371-115b-469e-840e-4fa97af5b207-000000@eu-west-1.amazonses.com>
X-Migadu-Flow: FLOW_OUT

--f3aa349fa658de3c6bc38a403667b8482bead4ff85b9abcb6690bf442bc1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Dec 9, 2024 at 9:02 PM CET, Shreeya Patel wrote:
> Document bindings for the Synopsys DesignWare HDMI RX Controller.
>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> ---
>
> Changes in v5 :-
> - Correct the interrupt IRQ number
>
> Changes in v4 :-
> - No change
>
> Changes in v3 :-
> - Rename hdmirx_cma to hdmi_receiver_cma
> - Add a Reviewed-by tag
>
> Changes in v2 :-
> - Add a description for the hardware
> - Rename resets, vo1 grf and HPD properties
> - Add a proper description for grf and vo1-grf phandles
> - Rename the HDMI Input node name to hdmi-receiver
> - Improve the subject line
> - Include gpio header file in example to fix dt_binding_check failure
>
>  .../bindings/media/snps,dw-hdmi-rx.yaml       | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-=
rx.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml=
 b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> new file mode 100644
> index 000000000000..510e94e9ca3a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Device Tree bindings for Synopsys DesignWare HDMI RX Controller
> +
> +---
> +$id: http://devicetree.org/schemas/media/snps,dw-hdmi-rx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare HDMI RX Controller
> +
> +maintainers:
> +  - Shreeya Patel <shreeya.patel@collabora.com>
> +
> +description:
> +  Synopsys DesignWare HDMI Input Controller preset on RK3588 SoCs

s/preset/present/ ?

> +  allowing devices to receive and decode high-resolution video streams
> +  from external sources like media players, cameras, laptops, etc.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: rockchip,rk3588-hdmirx-ctrler
> +      - const: snps,dw-hdmi-rx
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: cec
> +      - const: hdmi
> +      - const: dma
> +
> +  clocks:
> +    maxItems: 7
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: audio
> +      - const: cr_para
> +      - const: pclk
> +      - const: ref
> +      - const: hclk_s_hdmirx
> +      - const: hclk_vo1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 4
> +
> +  reset-names:
> +    items:
> +      - const: axi
> +      - const: apb
> +      - const: ref
> +      - const: biu
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  hpd-gpios:
> +    description: GPIO specifier for HPD.
> +    maxItems: 1
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the general register file
> +      containing HDMIRX PHY status bits.
> +
> +  rockchip,vo1-grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the Video Output GRF register
> +      to enable EDID transfer through SDAIN and SCLIN.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +  - pinctrl-0
> +  - hpd-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +    hdmi_receiver: hdmi-receiver@fdee0000 {
> +      compatible =3D "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-rx";
> +      reg =3D <0xfdee0000 0x6000>;
> +      interrupts =3D <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>,
> +                   <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH 0>,
> +                   <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>;
> +      interrupt-names =3D "cec", "hdmi", "dma";
> +      clocks =3D <&cru ACLK_HDMIRX>,
> +               <&cru CLK_HDMIRX_AUD>,
> +               <&cru CLK_CR_PARA>,
> +               <&cru PCLK_HDMIRX>,
> +               <&cru CLK_HDMIRX_REF>,
> +               <&cru PCLK_S_HDMIRX>,
> +               <&cru HCLK_VO1>;
> +      clock-names =3D "aclk",
> +                    "audio",
> +                    "cr_para",
> +                    "pclk",
> +                    "ref",
> +                    "hclk_s_hdmirx",
> +                    "hclk_vo1";
> +      power-domains =3D <&power RK3588_PD_VO1>;
> +      resets =3D <&cru SRST_A_HDMIRX>, <&cru SRST_P_HDMIRX>,
> +               <&cru SRST_HDMIRX_REF>, <&cru SRST_A_HDMIRX_BIU>;
> +      reset-names =3D "axi", "apb", "ref", "biu";
> +      memory-region =3D <&hdmi_receiver_cma>;
> +      pinctrl-0 =3D <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdm=
im1_rx_sda &hdmirx_5v_detection>;
> +      pinctrl-names =3D "default";
> +      hpd-gpios =3D <&gpio1 22 GPIO_ACTIVE_LOW>;

I just found out it isn't documented in the DTS coding style and that
the binding is technically not specifically for a Rockchip based
component, but there is a convention to sort the node properties
alpha-numerically by property name, with some exceptions.

So would it be useful to apply that convention to the example?
And possibly to the list of required properties as well?

Cheers,
  Diederik

> +    };


--f3aa349fa658de3c6bc38a403667b8482bead4ff85b9abcb6690bf442bc1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ1gTwQAKCRDXblvOeH7b
bsFZAP9ah94RpYjb318hSsjAUcVveSXQNnXUQZtSOiciapqPPwD9HrzGbq5DsPOY
Dbp0/AwZTuRb8GPhxezjlT57mTULfAc=
=kg+g
-----END PGP SIGNATURE-----

--f3aa349fa658de3c6bc38a403667b8482bead4ff85b9abcb6690bf442bc1--

