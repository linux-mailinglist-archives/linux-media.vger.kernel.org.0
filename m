Return-Path: <linux-media+bounces-15248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CD5939032
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 15:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 379671F21C4F
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 13:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CED16DC0D;
	Mon, 22 Jul 2024 13:53:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6607816D9BA;
	Mon, 22 Jul 2024 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721656387; cv=none; b=QEmnxMMzZEdc46gPZKX/d1I0sDsZFHKwb7exMLV73yJP9ZF7WgRl24sZ1+D395K96Im5fnPRFMLRKC/UR/DGH4r7zq/+A3xOR/LhEHl+KmXz/vL3qGNJvbu8E6V/XypoQJQoCPiq16Mw7OszdsutzOZZIYKc6xv/iGBjjwrfc+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721656387; c=relaxed/simple;
	bh=AbDvZ72xd2iAiDvkGlFhknAmLdGYCkcPuPuNKN8J0Hw=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=rYk08T7u2ACSSjMNEgG32AXt7q0XLSTCnPLkdauct+9qJWbFNum5+SnSMOlxUrejdkEt8xIo+4Hlut6Lr+v3BZY1n+MErIS+Ucob1YSZ7XD6nHP+XBW4FZQBIkLaKCLDt5MwrHPTGRof0+6LqpZXipdb02GgGFuZQEfg13qpn6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from harlem.collaboradmins.com (harlem.collaboradmins.com [IPv6:2a01:4f8:1c0c:5936::1])
	by madrid.collaboradmins.com (Postfix) with ESMTP id A9CC537811CD;
	Mon, 22 Jul 2024 13:53:01 +0000 (UTC)
From: "Shreeya Patel" <shreeya.patel@collabora.com>
In-Reply-To: <c926b73e-9ee7-4c4f-9c06-761929425468@yandex.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <20240719124032.26852-3-shreeya.patel@collabora.com> <c926b73e-9ee7-4c4f-9c06-761929425468@yandex.com>
Date: Mon, 22 Jul 2024 14:53:01 +0100
Cc: heiko@sntech.de, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com, shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com, hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl, kernel@collabora.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, "Dmitry Osipenko" <dmitry.osipenko@collabora.com>
To: "Johan Jonker" <jbx6244@yandex.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <3328a8-669e6400-1-609f7800@94177214>
Subject: =?utf-8?q?Re=3A?= [PATCH v4 2/4] =?utf-8?q?dt-bindings=3A?=
 =?utf-8?q?_media=3A?= Document bindings for HDMI RX Controller
User-Agent: SOGoMail 5.10.0
Content-Transfer-Encoding: quoted-printable

On Saturday, July 20, 2024 16:14 IST, Johan Jonker <jbx6244@yandex.com>=
 wrote:

Hi Johan,

>=20
>=20
> On 7/19/24 14:40, Shreeya Patel wrote:
> > Document bindings for the Synopsys DesignWare HDMI RX Controller.
> >=20
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> > ---
> >=20
> > Changes in v4 :-
> >   - No change
> >=20
> > Changes in v3 :-
> >   - Rename hdmirx=5Fcma to hdmi=5Freceiver=5Fcma
> >   - Add a Reviewed-by tag
> >=20
> > Changes in v2 :-
> >   - Add a description for the hardware
> >   - Rename resets, vo1 grf and HPD properties
> >   - Add a proper description for grf and vo1-grf phandles
> >   - Rename the HDMI Input node name to hdmi-receiver
> >   - Improve the subject line
> >   - Include gpio header file in example to fix dt=5Fbinding=5Fcheck=
 failure
> >=20
> >  .../bindings/media/snps,dw-hdmi-rx.yaml       | 132 ++++++++++++++=
++++
> >  1 file changed, 132 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/snps,dw=
-hdmi-rx.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-r=
x.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > new file mode 100644
> > index 000000000000..96ae1e2d2816
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > @@ -0,0 +1,132 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Device Tree bindings for Synopsys DesignWare HDMI RX Controller
> > +
> > +---
> > +$id: http://devicetree.org/schemas/media/snps,dw-hdmi-rx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Synopsys DesignWare HDMI RX Controller
> > +
> > +maintainers:
> > +  - Shreeya Patel <shreeya.patel@collabora.com>
> > +
> > +description:
> > +  Synopsys DesignWare HDMI Input Controller preset on RK3588 SoCs
> > +  allowing devices to receive and decode high-resolution video str=
eams
> > +  from external sources like media players, cameras, laptops, etc.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: rockchip,rk3588-hdmirx-ctrler
>=20
> > +      - const: snps,dw-hdmi-rx
>=20
> 1: Compatible strings must be SoC orientated.
> 2: In Linux there's no priority in which string will probed first.=20
> What's the point of having a fallback string when there's no common c=
ode, but instead only the first string is used?
>=20
> +static const struct of=5Fdevice=5Fid hdmirx=5Fid[] =3D {
> +	{ .compatible =3D "rockchip,rk3588-hdmirx-ctrler" },
> +	{ },
> +};
>=20

We believe the HDMIRX driver can be used for the Synopsys IP on other S=
oCs
in the future, which is why we have added snps,dw-hdmi-rx as the fallba=
ck compatible.
Currently, we have tested the driver only on the RK3588 Rock5B, so we a=
re using the
rockchip,rk3588-hdmirx-ctrler compatible in the driver instead of the f=
allback one.


Thanks,
Shreeya Patel

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 3
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: cec
> > +      - const: hdmi
> > +      - const: dma
> > +
> > +  clocks:
> > +    maxItems: 7
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: audio
> > +      - const: cr=5Fpara
> > +      - const: pclk
> > +      - const: ref
> > +      - const: hclk=5Fs=5Fhdmirx
> > +      - const: hclk=5Fvo1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 4
> > +
> > +  reset-names:
> > +    items:
> > +      - const: axi
> > +      - const: apb
> > +      - const: ref
> > +      - const: biu
> > +
> > +  memory-region:
> > +    maxItems: 1
> > +
> > +  hpd-gpios:
> > +    description: GPIO specifier for HPD.
> > +    maxItems: 1
> > +
> > +  rockchip,grf:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      The phandle of the syscon node for the general register file
> > +      containing HDMIRX PHY status bits.
> > +
> > +  rockchip,vo1-grf:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      The phandle of the syscon node for the Video Output GRF regi=
ster
> > +      to enable EDID transfer through SDAIN and SCLIN.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - resets
> > +  - pinctrl-0
> > +  - hpd-gpios
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/rk3588-power.h>
> > +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> > +    hdmi=5Freceiver: hdmi-receiver@fdee0000 {
> > +      compatible =3D "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdm=
i-rx";
> > +      reg =3D <0xfdee0000 0x6000>;
> > +      interrupts =3D <GIC=5FSPI 177 IRQ=5FTYPE=5FLEVEL=5FHIGH 0>,
> > +                   <GIC=5FSPI 436 IRQ=5FTYPE=5FLEVEL=5FHIGH 0>,
> > +                   <GIC=5FSPI 179 IRQ=5FTYPE=5FLEVEL=5FHIGH 0>;
> > +      interrupt-names =3D "cec", "hdmi", "dma";
> > +      clocks =3D <&cru ACLK=5FHDMIRX>,
> > +               <&cru CLK=5FHDMIRX=5FAUD>,
> > +               <&cru CLK=5FCR=5FPARA>,
> > +               <&cru PCLK=5FHDMIRX>,
> > +               <&cru CLK=5FHDMIRX=5FREF>,
> > +               <&cru PCLK=5FS=5FHDMIRX>,
> > +               <&cru HCLK=5FVO1>;
> > +      clock-names =3D "aclk",
> > +                    "audio",
> > +                    "cr=5Fpara",
> > +                    "pclk",
> > +                    "ref",
> > +                    "hclk=5Fs=5Fhdmirx",
> > +                    "hclk=5Fvo1";
> > +      power-domains =3D <&power RK3588=5FPD=5FVO1>;
> > +      resets =3D <&cru SRST=5FA=5FHDMIRX>, <&cru SRST=5FP=5FHDMIRX=
>,
> > +               <&cru SRST=5FHDMIRX=5FREF>, <&cru SRST=5FA=5FHDMIRX=
=5FBIU>;
> > +      reset-names =3D "axi", "apb", "ref", "biu";
> > +      memory-region =3D <&hdmi=5Freceiver=5Fcma>;
> > +      pinctrl-0 =3D <&hdmim1=5Frx=5Fcec &hdmim1=5Frx=5Fhpdin &hdmi=
m1=5Frx=5Fscl &hdmim1=5Frx=5Fsda &hdmirx=5F5v=5Fdetection>;
> > +      pinctrl-names =3D "default";
> > +      hpd-gpios =3D <&gpio1 22 GPIO=5FACTIVE=5FLOW>;
> > +    };


