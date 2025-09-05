Return-Path: <linux-media+bounces-41868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4E9B45EAE
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 18:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5774017B74A
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 16:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAAB309F00;
	Fri,  5 Sep 2025 16:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="ZDtmlhPR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E3A13D521;
	Fri,  5 Sep 2025 16:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090943; cv=none; b=mYzeUXVenddgRHJEl3M+pg6SioC5/00AeakzpFEgqRJZBWla45CsIA4xdA6198DoNnGwvJlsMcX0p7T4v5gqWzuBvxlnyuENErDcjj5XOOjSu9tim+3vfmTKxF8n0UHfB23L1q5eljmI6TT81phNuKFbT5nmqmMzmfyUsNYFuvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090943; c=relaxed/simple;
	bh=diSf69d2oQ1dS0WKoCbUPJHHMv6KOh1u+FVVXuJwOm4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ShN71A+ChJ4BIYVa+Q8gl0DJF9XpSzuO/ZkJlHk6fLDx+TAScs3jm0gdM8De+JuPuH2MvqLu/IKTm7LIk6OqWEEU1//BNtQyGr0tcE80sLIX7U+PILVFi6HBahbNngCURswEXjCsJBwVBdRcTzwDDAmReWoAtoQddd02hXzrFKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=ZDtmlhPR; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757090938; x=1757350138;
	bh=diSf69d2oQ1dS0WKoCbUPJHHMv6KOh1u+FVVXuJwOm4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZDtmlhPROSqmOV/mM031irz4iMovwT/6c7BOlqR8Ko2upeeW6TEn7SntMw6fDzaw8
	 qufJU7PvggauiQcOyjOrAzI3yS0QA+BYNuhcttRDGzTEZYXgriOgCZFO9/CrS7NmZ+
	 vXeKW9lqxZ+c3FpKAnk5Rma4s0PIGZiCMtfP6yX3xK1uF2N500A8YyW6RI/xmeQJdf
	 qzNR9dUL01iA1IZweZBwvtK64Ut0sdcFweynzR2gYabOjj/aXkPKVwdTEnqmnE/PVX
	 Ztjcj1wPNky8uIsZSli6Y15XQYQXj9yTb8wy3xxlafgksyozXDcE7IVGZPqEJ4Z7PX
	 I+EfDtxPPFVJQ==
Date: Fri, 05 Sep 2025 16:48:52 +0000
To: Rob Herring <robh@kernel.org>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: leds: commonize leds property
Message-ID: <Lm6PLaup84KHzhxYTbsrQIbEeQpc6dj65aLkLFvOx7QwvuXS9ON53Csa2v6LBp4hd9iIQilvGhXqx4kXv4cfqgYUeA49vrVdWJw-fNMLu2Y=@vinarskis.com>
In-Reply-To: <20250905152404.GB953718-robh@kernel.org>
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com> <20250905-leds-v2-2-ed8f66f56da8@vinarskis.com> <20250905152404.GB953718-robh@kernel.org>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 8506bc237e49fba276022028e967299c197ecd38
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






On Friday, September 5th, 2025 at 17:24, Rob Herring <robh@kernel.org> wrot=
e:

>=20
>=20
> On Fri, Sep 05, 2025 at 09:59:30AM +0200, Aleksandrs Vinarskis wrote:
>=20
> > A number of existing schemas use 'leds' property to provide
> > phandle-array of LED(s) to the consumer. Additionally, with the
> > upcoming privacy-led support in device-tree, v4l2 subnode could be a
> > LED consumer, meaning that all camera sensors should support 'leds'
> > and 'led-names' property via common 'video-interface-devices.yaml'.
> >=20
> > To avoid dublication, commonize 'leds' property from existing schemas
> > to newly introduced 'led-consumer.yaml'.
> >=20
> > Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
> > ---
> > .../devicetree/bindings/leds/backlight/led-backlight.yaml | 7 +------
> > Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml | 6 +=
-----
> > .../devicetree/bindings/media/video-interface-devices.yaml | 3 +++
> > 3 files changed, 5 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backl=
ight.yaml b/Documentation/devicetree/bindings/leds/backlight/led-backlight.=
yaml
> > index f5554da6bc6c73e94c4a2c32b150b28351b25f16..5e19b4376715eeb05cb7892=
55db209ed27f8822f 100644
> > --- a/Documentation/devicetree/bindings/leds/backlight/led-backlight.ya=
ml
> > +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.ya=
ml
> > @@ -18,17 +18,12 @@ description:
> >=20
> > allOf:
> > - $ref: common.yaml#
> > + - $ref: /schemas/leds/leds-consumer.yaml#
>=20
>=20
> Drop.
>=20
> > properties:
> > compatible:
> > const: led-backlight
> >=20
> > - leds:
> > - description: A list of LED nodes
> > - $ref: /schemas/types.yaml#/definitions/phandle-array
> > - items:
> > - maxItems: 1
>=20
>=20
> You need to keep the property here:
>=20
> leds: true
>=20
> > -
> > required:
> > - compatible
> > - leds
> > diff --git a/Documentation/devicetree/bindings/leds/leds-group-multicol=
or.yaml b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> > index 8ed059a5a724f68389a1d0c4396c85b9ccb2d9af..b4f326e8822a3bf452b22f5=
b9fa7189696f760a4 100644
> > --- a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> > +++ b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> > @@ -17,16 +17,12 @@ properties:
> > compatible:
> > const: leds-group-multicolor
> >=20
> > - leds:
> > - description:
> > - An aray of monochromatic leds
> > - $ref: /schemas/types.yaml#/definitions/phandle-array
> > -
> > required:
> > - leds
> >=20
> > allOf:
> > - $ref: leds-class-multicolor.yaml#
> > + - $ref: /schemas/leds/leds-consumer.yaml#
>=20
>=20
>=20
> Same comments in this one.
>=20
> > unevaluatedProperties: false
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/video-interface-de=
vices.yaml b/Documentation/devicetree/bindings/media/video-interface-device=
s.yaml
> > index cf7712ad297c01c946fa4dfdaf9a21646e125099..1e25cea0ff71da2cfd1c7c4=
642713199f3542c0a 100644
> > --- a/Documentation/devicetree/bindings/media/video-interface-devices.y=
aml
> > +++ b/Documentation/devicetree/bindings/media/video-interface-devices.y=
aml
> > @@ -10,6 +10,9 @@ maintainers:
> > - Jacopo Mondi jacopo@jmondi.org
> > - Sakari Ailus sakari.ailus@linux.intel.com
> >=20
> > +allOf:
> > + - $ref: /schemas/leds/leds-consumer.yaml#
>=20
>=20
> This can be dropped. The user still has to define how many entries and
> what the values of led-names are.

Hmm, but where should it be added then? If I just drop it, MIPI camera sche=
mas which are based on 'video-interface-devices.yaml' and have 'unevaluated=
Properties: false' throw warnings because 'leds' was not expected. Includin=
g the example in 'led-consumer.yaml' as found by your bot (because of patch=
 order your bot only run on 1/4, adding this very change fixes it).
In this case, v4l2 subnode is the LED user, which is some camera. It seems =
most/all of these cameras are based on this binding, so instead of adding n=
ew led related properties to all of them, I thought this is a good common p=
lace for it... Shall I add #entries and available options for 'led-names' h=
ere to make it complete?

Thanks,
Alex

>=20
> > +
> > properties:
> > flash-leds:
> > $ref: /schemas/types.yaml#/definitions/phandle-array
> >=20
> > --
> > 2.48.1

