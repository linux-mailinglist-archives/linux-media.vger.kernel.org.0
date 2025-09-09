Return-Path: <linux-media+bounces-42130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB7AB503AE
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 19:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB44B173E44
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 17:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A629037427F;
	Tue,  9 Sep 2025 16:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="ZRuLJCJu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8DA368085;
	Tue,  9 Sep 2025 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437088; cv=none; b=P2ptKDDvLUaijifDPI2Mi8JLemBfmMcKl+W5OKcGqH1BTqFVlRlqOsFarEa0HAKp0aIE8zLIXibnCNujeBA89wn5ybTkZgehnYLnVti5rLuhg9QU0xZXzBLX9hJVdV+Phpnk4QiMIV9x1V64IM88JjHQqZ/lCTeZQSTTozyYLiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437088; c=relaxed/simple;
	bh=d+p6lXxmYSZ/O+1dw1vhgQn9XprwvhG0g5Khdikh6KI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X5RahCeftLpf85oyaLQHVLK4VinsG2Jof++aWZ90xkO5e4e9JekRM1FOfyrm96cs061umdglBSoKyByIINmD2GlxJZN58YGBYYbatmfzKZvAj4NcwyKYMxv3UaomaYmrR6aUZJOed1RazFgERyCOpoBbjyFrdEEA98sQKIxBKDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=ZRuLJCJu; arc=none smtp.client-ip=109.224.244.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757437082; x=1757696282;
	bh=d+p6lXxmYSZ/O+1dw1vhgQn9XprwvhG0g5Khdikh6KI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZRuLJCJuh0BsxDr+fvIwxu4Zo6flmVtxvUVZCZgVZ0zy1ZfCAIoOEBaoVfGVV6TdI
	 TXx+Q+9YEfa7rjj/IS1KreTwf/0vPIMd2+fSEuwH8JDnfHEawQkCzLsHxCRUcbSRre
	 d6OCQZgrcq523O24+bLt4hrbCT2lb3rI22rIQihpwAi/E4VKbiVPFA+vyxa/3kYugV
	 czx3SoZCGYJ0g3dnFy02CXfCzUukPKa43kCof3Q8J1yEZ/nwYO9zqFUPfn3HKPMjoC
	 gqcismscamviwHoNUccA5wS5ipoUtWIGbL5w4Qy94DCDgBZ7VeFb8+7AWD7nbIc4jn
	 PRuw0tFsZtOkQ==
Date: Tue, 09 Sep 2025 16:57:55 +0000
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: add generic LED consumer documentation
Message-ID: <MOj2NUVAdyu9bvVkEON8rhAlGJ9FRRh9gJABkrOR_6gKhE8rmeZ5Isbj9noA1bDZ12gY4dlDpEtmEjxlRTucCssKwTo4f5nCowMOin85IKk=@vinarskis.com>
In-Reply-To: <20250908-leds-v3-1-5944dc400668@vinarskis.com>
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com> <20250908-leds-v3-1-5944dc400668@vinarskis.com>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: e90e158337c24b2a021c921e009cdad9d409d03e
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






On Monday, September 8th, 2025 at 01:18, Aleksandrs Vinarskis <alex@vinarsk=
is.com> wrote:

>=20
>=20
> Introduce common generic led consumer binding, where consumer defines
> led(s) by phandle, as opposed to trigger-source binding where the
> trigger source is defined in led itself.
>=20
> Add already used in some schemas 'leds' parameter which expects
> phandle-array. Additionally, introduce 'led-names' which could be used
> by consumers to map LED devices to their respective functions.
>=20
> Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
>=20
> ---
> .../devicetree/bindings/leds/leds-consumer.yaml | 89 ++++++++++++++++++++=
++
> 1 file changed, 89 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/=
Documentation/devicetree/bindings/leds/leds-consumer.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d50a3850f6336e9e3a52eb137=
4e36ea50de27f47
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common leds consumer
> +
> +maintainers:
> + - Aleksandrs Vinarskis alex@vinarskis.com
>=20
> +
> +description:
> + Some LED defined in DT are required by other DT consumers, for example
> + v4l2 subnode may require privacy or flash LED. Unlike trigger-source
> + approach which is typically used as 'soft' binding, referencing LED
> + devices by phandle makes things simpler when 'hard' binding is desired.
> +
> + Document LED properties that its consumers may define.
> +
> +select: true
> +
> +properties:
> + leds:
> + oneOf:
> + - type: object
> + - $ref: /schemas/types.yaml#/definitions/phandle-array
> + description:
> + A list of LED device(s) required by a particular consumer.
> + items:
> + maxItems: 1
> +
> + led-names:

While going over the feedback I realized `leds` and `led-names` do
not follow `property`, `property-names` convention. Any objections
if I rename `led-names` to `leds-names` for consistency?

Thanks,
Alex

> + description:
> + A list of device name(s). Used to map LED devices to their respective
> + functions, when consumer requires more than one LED.
> +
> +additionalProperties: true
> +
> +examples:
> + - |
> + #include <dt-bindings/gpio/gpio.h>
>=20
> + #include <dt-bindings/leds/common.h>
>=20
> +
> + leds {
> + compatible =3D "gpio-leds";
> +
> + privacy_led: privacy-led {
> + color =3D <LED_COLOR_ID_RED>;
>=20
> + default-state =3D "off";
> + function =3D LED_FUNCTION_INDICATOR;
> + gpios =3D <&tlmm 110 GPIO_ACTIVE_HIGH>;
>=20
> + };
> + };
> +
> + i2c {
> + #address-cells =3D <1>;
>=20
> + #size-cells =3D <0>;
>=20
> +
> + camera@36 {
> + compatible =3D "ovti,ov02c10";
> + reg =3D <0x36>;
>=20
> +
> + reset-gpios =3D <&tlmm 237 GPIO_ACTIVE_LOW>;
>=20
> + pinctrl-names =3D "default";
> + pinctrl-0 =3D <&cam_rgb_default>;
>=20
> +
> + leds =3D <&privacy_led>;
>=20
> + led-names =3D "privacy-led";
> +
> + clocks =3D <&ov02e10_clk>;
>=20
> +
> + assigned-clocks =3D <&ov02e10_clk>;
>=20
> + assigned-clock-rates =3D <19200000>;
>=20
> +
> + avdd-supply =3D <&vreg_l7b_2p8>;
>=20
> + dvdd-supply =3D <&vreg_l7b_2p8>;
>=20
> + dovdd-supply =3D <&vreg_cam_1p8>;
>=20
> +
> + port {
> + ov02e10_ep: endpoint {
> + data-lanes =3D <1 2>;
>=20
> + link-frequencies =3D /bits/ 64 <400000000>;
>=20
> + remote-endpoint =3D <&csiphy4_ep>;
>=20
> + };
> + };
> + };
> + };
> +
> +...
>=20
> --
> 2.48.1

