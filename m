Return-Path: <linux-media+bounces-43713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 519ECBB672C
	for <lists+linux-media@lfdr.de>; Fri, 03 Oct 2025 12:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A74D4344FDF
	for <lists+linux-media@lfdr.de>; Fri,  3 Oct 2025 10:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188162EAB61;
	Fri,  3 Oct 2025 10:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UdzxMg/M"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D37FEED8;
	Fri,  3 Oct 2025 10:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759487717; cv=none; b=Gpz/RcoAVPn/17FOTZtvJuIbtibBXqIQdhtz/XNrlT5oshbj8KXe2IQXetRO1GJbWjp5S3nGPhFbgIiukgHd3EXJKau6PByMRUB+pxGtSzjMcVLKmY1CNfrfTHSu/rPNx1rHdcdEyk9OJ5QJmgeAEf83X1RbaMKGaUd3vONGP2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759487717; c=relaxed/simple;
	bh=3JWA9oif72B2fdKOGx3ma2MxgIoNecyfOUqxEQ+hy0U=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=RRH8eozOYm12AIQMpKXqpo6usct7OU6aTdGn+Lfj63gHYXAUxQK6E0zb0+5qrIsCVjio2jGb+LAxVlEpWCqqXNPttxLqXauJnHyP5V9gGlnUFjmn//G7FLqdB30rN6bfNP+s8IVmCy81nwzi4q1gZVhiRma0uIpvdLOs6o7BSzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UdzxMg/M; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57872192C;
	Fri,  3 Oct 2025 12:33:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759487622;
	bh=3JWA9oif72B2fdKOGx3ma2MxgIoNecyfOUqxEQ+hy0U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UdzxMg/MyuPF0ZjEqTl81NM2zqAYZb/b/g7qQZAj9YZvWuK4hbwLpA9yFb3Iz5EXe
	 wWUUmser5UEL93SE68Pz5XwMJIlOdW7KNdWuVAQSpKZ9tILJ89i6sBjv2hHaiS5hhf
	 z8QE5zBxa6av40Rp62uymf+vEVpUNvFHoGGg8SH8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1be80052-3ba5-46de-804a-de995f8db5d4@oss.qualcomm.com>
References: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com> <20251002-dw9800-driver-v1-3-c305328e44f0@fairphone.com> <1be80052-3ba5-46de-804a-de995f8db5d4@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI pull-up
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
To: =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Bjorn Andersson <andersson@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Daniel Scally <djrscally@gmail.com>, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org
Date: Fri, 03 Oct 2025 11:35:09 +0100
Message-ID: <175948770924.935713.8703906918697470771@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Konrad Dybcio (2025-10-02 13:45:49)
> On 10/2/25 12:15 PM, Griffin Kroah-Hartman wrote:
> > Enable vreg_l6p which is used as a pull-up for the CCI busses, to make
> > sure I2C communication works as expected.
> >=20
> > Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> > ---
>=20
> Makes me wonder if we should maybe extend the CCI definition
> (or maybe the common i2c-bus binding?) to accept an external
> pull-up supply, as this is a common problem.. (+Bryan, Wolfram)

I'm a little confused about terminology here. To me CCI is the
communiation protocol (how to write the registers on the i2c bus). But
here' we're talking about 'pulling up' a cci bus ?

Is this actually impacting the bus - or is it more that it's /powering/
the camera and VCM both simultaneously (which is what happens on the RPi
cameras)

My curiosity lies in the fact that indeed we somehow need to be able to
coordinate the power relationship between multiple devices which ...
while independent for configuration - they do impact each other. I.e. if
you power on the camera and it simultaneously powers on the VCM - you
get the VCM jumping position if it's not also configured, so I
anticipate various bits of complexities here if they are all powered by
the same line.

I don't think a camera module should always be powered on for a phone
running on a battery - perhaps on this device the sensors have a
separate power down control ?

--
Kieran

> We could then shut down the regulator when cameras are not
> in use, preserving some trace amounts of power.
>=20
> Or maybe L6P is already used as a pull-up supply for more things
> onboard and should be always-on either way? Could you please
> check that, Griffin?
>=20
> Konrad
>=20
> >  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/=
arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > index e115b6a52b299ef663ccfb614785f8f89091f39d..2dd2c452592aa6b0ac826f1=
9eb9cb1a8b90cee47 100644
> > --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > @@ -749,6 +749,8 @@ vreg_l6p: ldo6 {
> >                               regulator-name =3D "vreg_l6p";
> >                               regulator-min-microvolt =3D <1700000>;
> >                               regulator-max-microvolt =3D <1904000>;
> > +                             /* Pull-up for CCI I2C busses */
> > +                             regulator-always-on;
> >                       };
> > =20
> >                       vreg_l7p: ldo7 {
> >

