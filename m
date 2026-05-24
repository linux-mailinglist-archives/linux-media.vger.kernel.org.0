Return-Path: <linux-media+bounces-62687-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id enAoAnleE2r1/AYAu9opvQ
	(envelope-from <linux-media+bounces-62687-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 22:24:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BE05C41DF
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 22:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05A833002506
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 20:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6481232B128;
	Sun, 24 May 2026 20:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HisCkmrZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A606F2DC321
	for <linux-media@vger.kernel.org>; Sun, 24 May 2026 20:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779654257; cv=none; b=nPP5U3dpL0DTZ34cyK5inEZE5aijEEze3kddIXvlDSHun/VtMuU1V09dorQ9yq0U98ZHlgLhXRK1u2N95Zr6VYD+RBlFtlca42fFzaxlKKIBwZoQAltvjaE9OjN20qi00BbebdRqitPNGgsHA95Y6jmnK2VBlqiCMKG5r0txkPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779654257; c=relaxed/simple;
	bh=5m2ynUlv29/CRCMqZ0YAToZhJK3uFgMuk+eYo1BnwjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rPEB8+Fc/3SIVqO6Y8KFSSOEPOOoKb3WDwoO/2YKpuIYvULoHq4VXfE/qlmtzIuDtbVNaAHwcH6kMqfVreEP4vPCs9FGWfTp/dve8tdA5v+U/r5bF9wxX8N45nn7K4lYxpnjVigAaw5kB/lxx5dnnwBkahLZanxkXNrsQsQemJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HisCkmrZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799091F00ADB
	for <linux-media@vger.kernel.org>; Sun, 24 May 2026 20:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779654256;
	bh=qF2ENtSHxpeUd+ayXyc4puyf9CPxrGQ63HI8vKzfFlk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=HisCkmrZAlCCAeVfzBL2isa35vgLvuT0HgrzBt2TzrnVMu4MkmHTcpR3IYBE0KaNm
	 XQ8oaTnb1+vSUkFNauo+3VBD0f4eTEFgyJc9RA3YcwPsLepvmtRjP8PZtPc9kpQVfw
	 r7pPlyS/b8PxAyROKyzYiEGJ8XI8mfwI49EPm/Wi6lT9OH0ClVIyJ6vBd1eLilBEWH
	 yAwYC5uOrIg+sDhN35LEC/HYroeaYzXk2OCcTjPLavolEgBFQ5sEdSi7bWpKfAC76U
	 3EpLjM12ugD9lnmqxQDTlrMO1KsnpDni/Iio5+17CYQrjq2fWN/ifM7OlFZkqRCdKA
	 BkHMUSMPqRtUg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39378db197aso92622491fa.3
        for <linux-media@vger.kernel.org>; Sun, 24 May 2026 13:24:16 -0700 (PDT)
X-Gm-Message-State: AOJu0YxFt3c51iPxF75f33MHDsezONHrenLav5aHLsAqHgoioYoLuHXI
	7APdow+OErMRNoYNGSJGFzBG6l9ri3aNp2VUQ3iiJmQJIBNpONe0y8Hy5C+nNN1EdHQnGWgNZ5y
	i012U3sV4tNrw5I0B+dqqKRpvyjwXDE0=
X-Received: by 2002:a2e:8957:0:b0:38d:e220:8dc2 with SMTP id
 38308e7fff4ca-395d8cef4abmr31227691fa.20.1779654254895; Sun, 24 May 2026
 13:24:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518153339.619947-1-paulk@sys-base.io> <20260518153339.619947-9-paulk@sys-base.io>
In-Reply-To: <20260518153339.619947-9-paulk@sys-base.io>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 24 May 2026 23:24:02 +0300
X-Gmail-Original-Message-ID: <CAGb2v65g5pRfamiGXDzf1e3tDOC3hKKpN42zsehyV5kH64mqvA@mail.gmail.com>
X-Gm-Features: AVHnY4JZ91o4upme6W15C4GgmvRnJJM3a9BrnhW1qst5pC5WhUcG5wXpq_KeV7k
Message-ID: <CAGb2v65g5pRfamiGXDzf1e3tDOC3hKKpN42zsehyV5kH64mqvA@mail.gmail.com>
Subject: Re: [PATCH v9 8/9] ARM: dts: sun8i-a83t: Add BananaPi M3 OV5640
 camera overlay
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yong Deng <yong.deng@magewell.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62687-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,magewell.com,kernel.org,gmail.com,sholland.org,baylibre.com,redhat.com,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,bootlin.com:email,mail.gmail.com:mid,sys-base.io:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,3c:email]
X-Rspamd-Queue-Id: D7BE05C41DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 6:15=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>
> Add an overlay supporting the OV5640 from the BananaPi Camera v3
> peripheral board. The board has two sensors (OV5640 and OV8865)

> which cannot be supported in parallel as they share the same reset
> pin and the kernel currently has no support for this case.

This part is no longer true. The kernel recently gained shared GPIO
support. I've tried it on Chromebooks to describe a USB 2/3 hub.
(This is actually one chip and one pin, but has two device nodes
to model the USB 2.0 and USB 3.1 portions.)


> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   3 +
>  .../sun8i-a83t-bananapi-m3-camera-ov5640.dtso | 115 ++++++++++++++++++
>  2 files changed, 118 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-ca=
mera-ov5640.dtso
>
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/all=
winner/Makefile
> index f71392a55df8..6975df9d7b46 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -221,6 +221,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>         sun8i-a33-vstar.dtb \
>         sun8i-a83t-allwinner-h8homlet-v2.dtb \
>         sun8i-a83t-bananapi-m3.dtb \
> +       sun8i-a83t-bananapi-m3-camera-ov5640.dtb \
>         sun8i-a83t-cubietruck-plus.dtb \
>         sun8i-a83t-tbs-a711.dtb \
>         sun8i-h2-plus-bananapi-m2-zero.dtb \
> @@ -270,6 +271,8 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>         sun8i-v3s-licheepi-zero-dock.dtb \
>         sun8i-v3s-netcube-kumquat.dtb \
>         sun8i-v40-bananapi-m2-berry.dtb
> +sun8i-a83t-bananapi-m3-camera-ov5640-dtbs +=3D \
> +       sun8i-a83t-bananapi-m3.dtb sun8i-a83t-bananapi-m3-camera-ov5640.d=
tbo
>  sun8i-h2-plus-orangepi-zero-interface-board-dtbs +=3D \
>         sun8i-h2-plus-orangepi-zero.dtb sun8i-orangepi-zero-interface-boa=
rd.dtbo
>  sun8i-h3-orangepi-zero-plus2-interface-board-dtbs +=3D \
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov=
5640.dtso b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov564=
0.dtso
> new file mode 100644
> index 000000000000..0d4de0027fea
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dt=
so
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0 OR X11
> +/*
> + * Copyright 2022 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/sun8i-a83t-ccu.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +       /*
> +        * These regulators actually have DLDO4 tied to their EN pin, whi=
ch is
> +        * described as input supply here for lack of a better representa=
tion.
> +        * Their actual supply is PS, which is always-on.
> +        */
> +
> +       ov5640_avdd: ov5640-avdd {

You should fix the device node names, as Sashiko mentioned for patch 9.

> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "ov5640-avdd";
> +               regulator-min-microvolt =3D <2800000>;
> +               regulator-max-microvolt =3D <2800000>;
> +               vin-supply =3D <&reg_dldo4>;
> +       };
> +
> +       ov5640_dovdd: ov5640-dovdd {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "ov5640-dovdd";
> +               regulator-min-microvolt =3D <2800000>;
> +               regulator-max-microvolt =3D <2800000>;
> +               vin-supply =3D <&reg_dldo4>;
> +       };
> +
> +       ov5640_dvdd: ov5640-dvdd {

This one as well.

> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "ov5640-dvdd";
> +               regulator-min-microvolt =3D <1500000>;
> +               regulator-max-microvolt =3D <1500000>;
> +               vin-supply =3D <&reg_dldo4>;
> +       };
> +};
> +
> +&csi {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&csi_8bit_parallel_pins>;
> +       status =3D "okay";
> +
> +       ports {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               port@0 {
> +                       reg =3D <0>;
> +
> +                       csi_in_ov5640: endpoint {
> +                               remote-endpoint =3D <&ov5640_out_csi>;
> +                               bus-width =3D <8>;
> +                               data-shift =3D <2>;
> +                               hsync-active =3D <1>;
> +                               vsync-active =3D <1>;
> +                               pclk-sample =3D <1>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c2 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c2_pe_pins>;
> +       status =3D "okay";
> +
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       ov5640: camera@3c {
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&csi_mclk_pin>;
> +
> +               compatible =3D "ovti,ov5640";
> +               reg =3D <0x3c>;

Per the "new" DT coding style guide, the compatible property is always
the first oen, and reg, if present, is always the second.

Same comments also apply to patch 9.


Thanks
ChenYu


> +
> +               clocks =3D <&ccu CLK_CSI_MCLK>;
> +               clock-names =3D "xclk";
> +               assigned-clocks =3D <&ccu CLK_CSI_MCLK>;
> +               assigned-clock-parents =3D <&osc24M>;
> +               assigned-clock-rates =3D <24000000>;
> +
> +               AVDD-supply =3D <&ov5640_avdd>;
> +               DOVDD-supply =3D <&ov5640_dovdd>;
> +               DVDD-supply =3D <&ov5640_dvdd>;
> +
> +               powerdown-gpios =3D <&pio 3 15 GPIO_ACTIVE_HIGH>; /* PD15=
 */
> +               reset-gpios =3D <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
> +
> +               rotation =3D <180>;
> +
> +               port {
> +                       ov5640_out_csi: endpoint {
> +                               remote-endpoint =3D <&csi_in_ov5640>;
> +                               bus-width =3D <8>;
> +                               data-shift =3D <2>;
> +                               hsync-active =3D <1>;
> +                               vsync-active =3D <1>;
> +                               pclk-sample =3D <1>;
> +                       };
> +               };
> +       };
> +};
> +
> +&reg_dldo4 {
> +       regulator-min-microvolt =3D <2800000>;
> +       regulator-max-microvolt =3D <2800000>;
> +};
> --
> 2.54.0
>

