Return-Path: <linux-media+bounces-48988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D4DCC7BBB
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 14:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B780A30143C0
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 13:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3417354AD6;
	Wed, 17 Dec 2025 12:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WGpBif7i"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7653B350A1F;
	Wed, 17 Dec 2025 12:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765975354; cv=none; b=IIkeFwFqS2yaqiXgolTrojTzRv1aBoZp+LvNwzXKIwbBgfJTsOVxjivOF6jy94JmE05FhIfROQMgG3WK7WV5aY4vdOMeO+6SFI80+ghOyHTt5uOEeMK+qaPRd6XpoGbjw/z5g4fm1R14pPu9LBiqebz6Sf6bbCysnz4+NMNbKEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765975354; c=relaxed/simple;
	bh=z7uhR3R8PJon7b37JGfuZMuPirZ2NpxcAxTM9cqyoFI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=kxQC2lic9eneiFpsURv6SII8qFp3l55+uXV2K+sGD4S9D50c1xPLsrshScOLblSQiP7WQv2OTvSCJR5KQgNEBduLWT+Fy9yue0Gs/tX+0tWVJT1r5ASoLqEQmN47K9/fG4++WEq8UZGse45rW1w2hSoAB4fjS3z0TZvw52dU+Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WGpBif7i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3D8C324;
	Wed, 17 Dec 2025 13:42:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765975342;
	bh=z7uhR3R8PJon7b37JGfuZMuPirZ2NpxcAxTM9cqyoFI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WGpBif7inp4dFOdghcshhb6u6NFeWWGQTpjPgMwJh2YJd3exr6sBmY/5GyTxNdKeR
	 tbNAY/3qudSlcPTRECFZh4wzujSE0L3evPG3hkXncoauiKcqaR6+MX/O4vv9DmzGm3
	 dSgIkkAh50LKqrIfhNoeFK37yo1jGH+9uqPsNSKU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2f93eda4-483e-4fa2-a765-73e8df4eeaea@emfend.at>
References: <20251217-imx283-ext-v1-0-906a762f592d@emfend.at> <20251217-imx283-ext-v1-3-906a762f592d@emfend.at> <CAPY8ntCiOJb9iyFDYS_wxhteoHL7vMFpEF8gVwrf2qeFd-Fssw@mail.gmail.com> <2f93eda4-483e-4fa2-a765-73e8df4eeaea@emfend.at>
Subject: Re: [PATCH 3/3] media: i2c: imx283: implement {g,s}_register
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Umang Jain <uajain@igalia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Matthias Fend <matthias.fend@emfend.at>
Date: Wed, 17 Dec 2025 12:42:25 +0000
Message-ID: <176597534567.3937789.3409848773538845012@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Matthias Fend (2025-12-17 12:21:28)
> Hi Dave,
>=20
> thanks for your comment.
>=20
> Am 17.12.2025 um 12:54 schrieb Dave Stevenson:
> > Hi Matthias
> >=20
> > On Wed, 17 Dec 2025 at 07:41, Matthias Fend <matthias.fend@emfend.at> w=
rote:
> >>
> >> Implement {g,s}_register to support advanced V4L2 debug functionality.
> >=20
> > Is there any real benefit to providing access via {g,s}_register
> > rather than using i2ctransfer -f ? The I2C framework ensures that each
> > transfer is atomic as long as it is formed into one transaction
> > request.
>=20
> This allows, for example, the registers to be changed when the image=20
> sensor is actually used in streaming mode.
>=20
> IMHO, this cannot be covered by i2ctransfer, as the device is used=20
> exclusively by the driver.

I frequently modify registers while the device is streaming to debug and
investigate.

I use my colleague Tomi's rwmem tool though:

 - https://github.com/tomba/rwmem

But I don't think it does anything specifically special - it's still an
underlying i2c-transfer operation through /dev/i2c-x ?



>=20
> >=20
> > IMHO The only place these are really needed is with devices such as
> > the adv7180 family which have a bank and page addressing scheme, and
> > the driver is caching the last accessed bank.
> >=20
> >> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> >> ---
> >>   drivers/media/i2c/imx283.c | 44 ++++++++++++++++++++++++++++++++++++=
++++++++
> >>   1 file changed, 44 insertions(+)
> >>
> >> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> >> index 7a6ab2941ea985401b21d60163b58e980cf31ddc..d8ccde0a1587259f39a109=
84c517cc57d323b6bc 100644
> >> --- a/drivers/media/i2c/imx283.c
> >> +++ b/drivers/media/i2c/imx283.c
> >> @@ -1295,7 +1295,51 @@ static const struct v4l2_subdev_internal_ops im=
x283_internal_ops =3D {
> >>          .init_state =3D imx283_init_state,
> >>   };
> >>
> >> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> >> +static int imx283_g_register(struct v4l2_subdev *sd,
> >> +                            struct v4l2_dbg_register *reg)
> >> +{
> >> +       struct imx283 *imx283 =3D to_imx283(sd);
> >> +       u64 val;
> >> +       int ret;
> >> +
> >> +       if (!pm_runtime_get_if_active(imx283->dev))
> >> +               return 0;
> >=20
> > Returning no error if the device is powered down feels wrong. How is
> > the caller meant to differentiate between powered down and the
> > register actually containing 0?
>=20
> The only other I2C drivers that use pm* in {g,s}_register seem to be=20
> imx283 and tc358746. Since both return 0 when the device is inactive, I=20

Did you mean something other than imx283 here ?

--
Kieran

> figured there must be a reason for this and implemented it that way as we=
ll.
>=20
> Thanks
>   ~Matthias
>=20
> >=20
> >> +
> >> +       ret =3D cci_read(imx283->cci, CCI_REG8(reg->reg), &val, NULL);
> >> +       reg->val =3D val;
> >> +
> >> +       pm_runtime_put(imx283->dev);
> >> +
> >> +       return ret;
> >> +}
> >> +
> >> +static int imx283_s_register(struct v4l2_subdev *sd,
> >> +                            const struct v4l2_dbg_register *reg)
> >> +{
> >> +       struct imx283 *imx283 =3D to_imx283(sd);
> >> +       int ret;
> >> +
> >> +       if (!pm_runtime_get_if_active(imx283->dev))
> >> +               return 0;
> >=20
> > Ditto here. The caller is told the value was written, but it wasn't.
> >=20
> > Thanks.
> >    Dave
> >=20
> >> +
> >> +       ret =3D cci_write(imx283->cci, CCI_REG8(reg->reg), reg->val, N=
ULL);
> >> +
> >> +       pm_runtime_put(imx283->dev);
> >> +
> >> +       return ret;
> >> +}
> >> +#endif
> >> +
> >> +static const struct v4l2_subdev_core_ops imx283_core_ops =3D {
> >> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> >> +       .g_register =3D imx283_g_register,
> >> +       .s_register =3D imx283_s_register,
> >> +#endif
> >> +};
> >> +
> >>   static const struct v4l2_subdev_ops imx283_subdev_ops =3D {
> >> +       .core =3D &imx283_core_ops,
> >>          .video =3D &imx283_video_ops,
> >>          .pad =3D &imx283_pad_ops,
> >>   };
> >>
> >> --
> >> 2.34.1
> >>
> >>
>

