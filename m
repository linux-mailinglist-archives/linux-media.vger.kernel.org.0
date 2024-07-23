Return-Path: <linux-media+bounces-15293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D280593A4EF
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 19:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91BDB2836B6
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 17:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314301586C5;
	Tue, 23 Jul 2024 17:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="k9tefn7F"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84D814A4C9;
	Tue, 23 Jul 2024 17:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721755685; cv=none; b=Ed2vCef6itL9RzaB8ykeu+yX81SIaW6ljwNzX6ngF/qR+i2m9N9Wsb/D/bzG6iwphcQK+63cTgilBQSfJy3y3/42q3IZcgRj7lCz8T7ObxdG8hpestQ3XWelpqODQ0KazRpWklqmVWMHrYZ9TGBunThes+b50DmpAi6TRg4qYTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721755685; c=relaxed/simple;
	bh=C7a5QAJerYjhKY7LxrpBPWjQMG0nI462T4h+e+Z/zKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Da4SfT2JOwG+1xtA5tL3VeROJznPc0TYgKJc24ricY8Guk1A2kcqo+gtQtZdQTzhuK6zVVfs6W4wnAF3sm6e5mvqPpQLtAKjlEGJEgUl1kMQKz54YzlL5ax0fOagEsXQABFU6yHaRl+ZkyvuSJl/uavcEvi3WXu8q0mIdtpZ304=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=k9tefn7F; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721755681;
	bh=C7a5QAJerYjhKY7LxrpBPWjQMG0nI462T4h+e+Z/zKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9tefn7FGTczAr6qskn0TAKIL3ojZ7NQBk3gGiyjJ5HwdR2cqktM0eSQvegRFcUus
	 MAFEUA2BzS+K9oF45IC6b6H4KV41vu0S/zxQG3nler/pujabonjkspX60dZciSCp7e
	 zN1bs1g9hLhVX+SsBR0OPSHt6bNVuNOA9AAG5En7uC9aRZohOyuQtsKpnyLV/TWnra
	 MHb7O1EOuU4oqk+V1b4kBfrJVX760QgkEL0NKmRFMiTKo97Q1G8M+/N9CJrOcF38OK
	 EK22DBrS/TIRnVJCcOB3H0VOyji5hpDJeERvpsLmPPSIQ34sV+mzsabnVUyzJCYeOb
	 NfVpavxjsNT9A==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C17C837813AE;
	Tue, 23 Jul 2024 17:28:01 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 6EC80106097F; Tue, 23 Jul 2024 19:28:01 +0200 (CEST)
Date: Tue, 23 Jul 2024 19:28:01 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Johan Jonker <jbx6244@yandex.com>
Cc: Shreeya Patel <shreeya.patel@collabora.com>, heiko@sntech.de, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	jose.abreu@synopsys.com, nelson.costa@synopsys.com, shawn.wen@rock-chips.com, 
	nicolas.dufresne@collabora.com, hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl, 
	kernel@collabora.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: media: Document bindings for HDMI RX
 Controller
Message-ID: <6nzakkvpfodztxh6jnxlhknd7x7ni6agwpguxyqd6gcncedp53@vsk5mnaayfqs>
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <20240719124032.26852-3-shreeya.patel@collabora.com>
 <c926b73e-9ee7-4c4f-9c06-761929425468@yandex.com>
 <3328a8-669e6400-1-609f7800@94177214>
 <ae3f574a-256f-4ced-a371-a26255024750@yandex.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="icvzpzs7h3iwodn3"
Content-Disposition: inline
In-Reply-To: <ae3f574a-256f-4ced-a371-a26255024750@yandex.com>


--icvzpzs7h3iwodn3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 23, 2024 at 01:16:00PM GMT, Johan Jonker wrote:
> On 7/22/24 15:53, Shreeya Patel wrote:
> > On Saturday, July 20, 2024 16:14 IST, Johan Jonker <jbx6244@yandex.com>=
 wrote:
> >> On 7/19/24 14:40, Shreeya Patel wrote:
> >>> Document bindings for the Synopsys DesignWare HDMI RX Controller.
> >>>
>=20
> >>> Reviewed-by: Rob Herring <robh@kernel.org>
> >>> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>=20
> Remove to trigger a new review.

Rob and Dmitry both already reviewed the version with the fallback
compatible. I don't think the rename of hdmirx_cma to hdmi_receiver_cma
warrant a new review. Also FWIW:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

> >>> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> >>> ---
> >>>
> >>> Changes in v4 :-
> >>>   - No change
> >>>
> >>> Changes in v3 :-
> >>>   - Rename hdmirx_cma to hdmi_receiver_cma
> >>>   - Add a Reviewed-by tag
> >>>
> >>> Changes in v2 :-
> >>>   - Add a description for the hardware
> >>>   - Rename resets, vo1 grf and HPD properties
> >>>   - Add a proper description for grf and vo1-grf phandles
> >>>   - Rename the HDMI Input node name to hdmi-receiver
> >>>   - Improve the subject line
> >>>   - Include gpio header file in example to fix dt_binding_check failu=
re
> >>>
> >>>  .../bindings/media/snps,dw-hdmi-rx.yaml       | 132 ++++++++++++++++=
++
> >>>  1 file changed, 132 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-h=
dmi-rx.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.=
yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> >>> new file mode 100644
> >>> index 000000000000..96ae1e2d2816
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> >>> @@ -0,0 +1,132 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +# Device Tree bindings for Synopsys DesignWare HDMI RX Controller
> >>> +
> >>> +---
> >>> +$id: http://devicetree.org/schemas/media/snps,dw-hdmi-rx.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Synopsys DesignWare HDMI RX Controller
> >>> +
> >>> +maintainers:
> >>> +  - Shreeya Patel <shreeya.patel@collabora.com>
> >>> +
> >>> +description:
> >>> +  Synopsys DesignWare HDMI Input Controller preset on RK3588 SoCs
> >>> +  allowing devices to receive and decode high-resolution video strea=
ms
> >>> +  from external sources like media players, cameras, laptops, etc.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - const: rockchip,rk3588-hdmirx-ctrler
> >>
>=20
> >>> +      - const: snps,dw-hdmi-rx
>=20
> remove
>=20
> >>
> >> 1: Compatible strings must be SoC orientated.
> >> 2: In Linux there's no priority in which string will probed first.=20
> >> What's the point of having a fallback string when there's no common co=
de, but instead only the first string is used?
> >>
> >> +static const struct of_device_id hdmirx_id[] =3D {
> >> +	{ .compatible =3D "rockchip,rk3588-hdmirx-ctrler" },
> >> +	{ },
> >> +};
> >>
> >=20
>=20
> > We believe the HDMIRX driver can be used for the Synopsys IP on other S=
oCs
> > in the future, which is why we have added snps,dw-hdmi-rx as the fallba=
ck compatible.
> > Currently, we have tested the driver only on the RK3588 Rock5B, so we a=
re using the
> > rockchip,rk3588-hdmirx-ctrler compatible in the driver instead of the f=
allback one.
>=20
> The rule that compatible strings (for internal SoC components)
> must be SoC orientated also applies to the fallback string.
> "snps,xxxx" does not refer to an independent SoC.=20

Where did you learn that? Having non-SoC specific generic fallback
compatibles is pretty much standard throughout the kernel. See for
example these RK3588 DesignWare compatibles:

Synopsys Serial Controller:
    Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
    compatible =3D "rockchip,rk3588-uart", "snps,dw-apb-uart";

Synopsys USB3 Controller:
    Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
    compatible =3D "rockchip,rk3588-dwc3", "snps,dwc3";

Synopsys Ethernet Controller:
    Documentation/devicetree/bindings/net/snps,dwmac.yaml
    compatible =3D "rockchip,rk3588-gmac", "snps,dwmac-4.20a";

Synsopsys SATA Controller:
    Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml
    compatible =3D "rockchip,rk3588-dwc-ahci", "snps,dwc-ahci"

It's also not specific to Synopsys (but RK3588 has a lot of Synopsys
design incl. the HDMI-RX IP currently worked on by Shreeya). Here
are some other examples:

ARM Mali GPU:
    Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
    compatible =3D "rockchip,rk3588-mali", "arm,mali-valhall-csf";

Generic EHCI:
    Documentation/devicetree/bindings/usb/generic-ehci.yaml
    compatible =3D "rockchip,rk3588-ehci", "generic-ehci";

As you can see almost everything in RK3588 has a non SoC specific
fallback :) It's also not a Rockchip/RK3588 specific thing, but
I think you should be able to find enough references yourself by
looking into the kernel's DTS files.

> Don't invent strings for devices that we don't know yet if it
> might or might not be compatible in the future.

Right now it's a sensible assumption, that an operating system driver
for this hardware (i.e. not necessarily the one submitted by Shreeya
right now) can handle the Synopsys HDMI receiver hardware from different
SoCs just like it is the case for other Synopsys IP.

Whatever is being done now is set in stone, since DT is considered
ABI. So without the fallback compatible being available in DT from
the beginning we need to carry the RK3588 specific compatible in the
kernel driver forever. OTOH if we add the generic one now, the kernel
can switch to use the generic one at any point in time and ignore the
RK3588 specific one.

Greetings,

-- Sebastian

> Johan
>=20
> >=20
> >=20
> > Thanks,
> > Shreeya Patel
> >=20
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 3
> >>> +
> >>> +  interrupt-names:
> >>> +    items:
> >>> +      - const: cec
> >>> +      - const: hdmi
> >>> +      - const: dma
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 7
> >>> +
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: aclk
> >>> +      - const: audio
> >>> +      - const: cr_para
> >>> +      - const: pclk
> >>> +      - const: ref
> >>> +      - const: hclk_s_hdmirx
> >>> +      - const: hclk_vo1
> >>> +
> >>> +  power-domains:
> >>> +    maxItems: 1
> >>> +
> >>> +  resets:
> >>> +    maxItems: 4
> >>> +
> >>> +  reset-names:
> >>> +    items:
> >>> +      - const: axi
> >>> +      - const: apb
> >>> +      - const: ref
> >>> +      - const: biu
> >>> +
> >>> +  memory-region:
> >>> +    maxItems: 1
> >>> +
> >>> +  hpd-gpios:
> >>> +    description: GPIO specifier for HPD.
> >>> +    maxItems: 1
> >>> +
> >>> +  rockchip,grf:
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +    description:
> >>> +      The phandle of the syscon node for the general register file
> >>> +      containing HDMIRX PHY status bits.
> >>> +
> >>> +  rockchip,vo1-grf:
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +    description:
> >>> +      The phandle of the syscon node for the Video Output GRF regist=
er
> >>> +      to enable EDID transfer through SDAIN and SCLIN.
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - interrupts
> >>> +  - interrupt-names
> >>> +  - clocks
> >>> +  - clock-names
> >>> +  - power-domains
> >>> +  - resets
> >>> +  - pinctrl-0
> >>> +  - hpd-gpios
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> >>> +    #include <dt-bindings/gpio/gpio.h>
> >>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>> +    #include <dt-bindings/interrupt-controller/irq.h>
> >>> +    #include <dt-bindings/power/rk3588-power.h>
> >>> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> >>> +    hdmi_receiver: hdmi-receiver@fdee0000 {
>=20
> >>> +      compatible =3D "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-=
rx";
>=20
>       compatible =3D "rockchip,rk3588-hdmirx-ctrler";
>=20
> >>> +      reg =3D <0xfdee0000 0x6000>;
> >>> +      interrupts =3D <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>,
> >>> +                   <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH 0>,
> >>> +                   <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>;
> >>> +      interrupt-names =3D "cec", "hdmi", "dma";
> >>> +      clocks =3D <&cru ACLK_HDMIRX>,
> >>> +               <&cru CLK_HDMIRX_AUD>,
> >>> +               <&cru CLK_CR_PARA>,
> >>> +               <&cru PCLK_HDMIRX>,
> >>> +               <&cru CLK_HDMIRX_REF>,
> >>> +               <&cru PCLK_S_HDMIRX>,
> >>> +               <&cru HCLK_VO1>;
> >>> +      clock-names =3D "aclk",
> >>> +                    "audio",
> >>> +                    "cr_para",
> >>> +                    "pclk",
> >>> +                    "ref",
> >>> +                    "hclk_s_hdmirx",
> >>> +                    "hclk_vo1";
> >>> +      power-domains =3D <&power RK3588_PD_VO1>;
> >>> +      resets =3D <&cru SRST_A_HDMIRX>, <&cru SRST_P_HDMIRX>,
> >>> +               <&cru SRST_HDMIRX_REF>, <&cru SRST_A_HDMIRX_BIU>;
> >>> +      reset-names =3D "axi", "apb", "ref", "biu";
> >>> +      memory-region =3D <&hdmi_receiver_cma>;
> >>> +      pinctrl-0 =3D <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl =
&hdmim1_rx_sda &hdmirx_5v_detection>;
> >>> +      pinctrl-names =3D "default";
> >>> +      hpd-gpios =3D <&gpio1 22 GPIO_ACTIVE_LOW>;
> >>> +    };
> >=20
> _______________________________________________
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com
> This list is managed by https://mailman.collabora.com

--icvzpzs7h3iwodn3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmaf6BoACgkQ2O7X88g7
+pppTQ//ZP1xsXwA2GF5EXfTNq2H83xsINqPzaqhD+6qleDRbb7SrmMIsv28I6Lv
HwoDloGq89XDhGprbxx0NHlo3VLF2wzjqKg8QEi3EIeF9Oc526WiHJdJR1N8Gs6B
MmZgdUL9y0QVjbQPJyXBQdUIF7tX33vlLKVe6s/ULflo+Oxtm7MHEfIwlwQU6dty
GQB+32vnO//XxkAic6rS/GZj6MDhtKqnpPS451pTQOk2mCFCXb4geJQ8U2dojyOL
W+YPsCkbnKcocFHw/zJkwP0vcevKRABvFnSSjLPQClE1F+k8pYa07mgmhT2wLuGB
Duc2/TBeNvx2WysOE2Ut2juaaGgJ/onV0omOwlOc7bbzQFynN2laT4TU+L0eNK2V
5Wyt0NpsHco4UN1/Qo5/hPOcqiVCFU9I+73eslTZFpahIyqTut232FIY9Fx1kVQF
qSGZgGH32NzVdmwQ5gSSIPPmfYsu1rV2s+mLy1O3HKgk4hpyoIFy53w/XDlAZ186
rNk803107tGpsymEAnoZvty7enTe4wCS+RVZ8rUM4lXB0UQ3ZEz7JMd/3zl/BD2+
Bn5w8Ub2N3Z558xzSP0eQieQafs6f3d04FGltaSgye/NtQZicsy6uymudXKRBRqv
F2RxsRRvtXoQ9NMjbW8BlxUb4/+MyOrZDYx+TjpZNFvezCqDdng=
=WG6g
-----END PGP SIGNATURE-----

--icvzpzs7h3iwodn3--

