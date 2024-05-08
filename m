Return-Path: <linux-media+bounces-11164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F728C01E6
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 18:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B0BBB23713
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 16:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9769A129E8E;
	Wed,  8 May 2024 16:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JEhoibij"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1F11F5F3;
	Wed,  8 May 2024 16:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715185413; cv=none; b=sxyFSRbHgc5wcRNc7CQ/jIZIuaBNhz65DOs+KiK/iDtNplORwBdKevWxAVav4ULJAQjl5GfY6K5kVo+S26BTZEdaj2UmLRrTFcWuKgC+uCkIvxTBaUN62LLCHOQiAdk3fUmpWbxbLeCw+MLJPI3C5NL3pKD0z5IuXXoACwRGI2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715185413; c=relaxed/simple;
	bh=WelstoePjnDnRChpMtP24IlPVegDX/ryQMkZRwZ5JqI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=OSdnUEaJCC4M5nUp/dJ3R5u1T1Up5nA+qxgifKakbDaM4ieTjiAUGU3T7gGc2oJC76AqB4xlDhcKDM5OR6RICAJxJsWku5YtlnLg6JVUeTfau16O7r9DafB10o5ZkfktUEJWX3G3rFiQNy7+4EgnBCtFCCuld2fQQ2YTj0k9eC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JEhoibij; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 747DCFD6;
	Wed,  8 May 2024 18:23:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715185405;
	bh=WelstoePjnDnRChpMtP24IlPVegDX/ryQMkZRwZ5JqI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JEhoibijttr1P6mbGqyI6W3jMX2iMVY/uW1eTQdZIiHiA5oLcdMfj4AgRHtcI7pvX
	 El8fdo53IyKJXDQpdzVaqhfm55r/gJhjFB6HY7gggVCrM0iNM1tD10Gp08+xLiMkbJ
	 Qwq1sQJdxhdJ4NyKjFEQcNZJiR7WNGagXpPcE9Xs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <bppn2qglcya3xbfy7uey5cgybyanxthhweqv7foojwi5rvqwmk@temzdedvecfe>
References: <20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-v2-1-2e665f072f8f@linaro.org> <dvyed4grpazqk7a3tz6dqwpkd76ghtrt4euinxt3kycdeh63ez@ljgfjsfhypix> <20a0300a-ac16-456c-840a-e272f49050a8@linaro.org> <bppn2qglcya3xbfy7uey5cgybyanxthhweqv7foojwi5rvqwmk@temzdedvecfe>
Subject: Re: [PATCH v2] media: i2c: Fix imx412 exposure control
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Paul J. Murphy <paul.j.murphy@intel.com>, Martina Krasteva <quic_mkrastev@quicinc.com>, Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Wed, 08 May 2024 17:23:25 +0100
Message-ID: <171518540550.191612.743149233311332771@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Jacopo Mondi (2024-05-08 13:43:34)
> Hi Bryan
>=20
> On Wed, May 08, 2024 at 01:30:31PM GMT, Bryan O'Donoghue wrote:
> > On 08/05/2024 09:02, Jacopo Mondi wrote:
> > > Hi Bryan
> > >
> > > On Mon, May 06, 2024 at 11:38:26PM GMT, Bryan O'Donoghue wrote:
> > > > Currently we have the following algorithm to calculate what value s=
hould be
> > > > written to the exposure control of imx412.
> > > >
> > > > lpfr =3D imx412->vblank + imx412->cur_mode->height;
> > > > shutter =3D lpfr - exposure;
> > > >
> > > > The 'shutter' value is given to IMX412_REG_EXPOSURE_CIT however, th=
e above
> > > > algorithm will result in the value given to IMX412_REG_EXPOSURE_CIT
> > > > decreasing as the requested exposure value from user-space goes up.
> > > >
> > > > e.g.
> > > > [ 2255.713989] imx412 20-001a: Received exp 1608, analog gain 0
> > > > [ 2255.714002] imx412 20-001a: Set exp 1608, analog gain 0, shutter=
 1938, lpfr 3546
> > > > [ 2256.302770] imx412 20-001a: Received exp 2586, analog gain 100
> > > > [ 2256.302800] imx412 20-001a: Set exp 2586, analog gain 100, shutt=
er 960, lpfr 3546
> > > > [ 2256.753755] imx412 20-001a: Received exp 3524, analog gain 110
> > > > [ 2256.753772] imx412 20-001a: Set exp 3524, analog gain 110, shutt=
er 22, lpfr 3546
> > > >
> > > > This behaviour results in the image having less exposure as the req=
uested
> > > > exposure value from user-space increases.
> > > >
> > > > Other sensor drivers such as ov5675, imx218, hid556 and others take=
 the
> > > > requested exposure value and directly.
> > >
> > > has the phrase been truncated or is it me reading it wrong ?
> >
> > Sod's law says no matter how many times you send yourself a patch before
> > sending it to LKML you'll find a typo ~ 2 seconds after reading your pa=
tch
> > on LKML.
> >
>=20
> Sounds familiar enough
>=20
> >
> > > > Looking at the range of imx sensors, it appears this particular err=
or has
> > > > been replicated a number of times but, I haven't so far really dril=
led into
> > > > each sensor.
> > >
> > > Ouch, what other driver have the same issue ?
> >
> > So without data sheet or sensor its hard to say if these are correct or
> > incorrect, it's the same basic calculation though.
> >
> > drivers/media/i2c/imx334.c::imx334_update_exp_gain()
> >
> >         lpfr =3D imx334->vblank + imx334->cur_mode->height;
> >         shutter =3D lpfr - exposure;
> >
> >         ret =3D imx334_write_reg(imx334, IMX334_REG_SHUTTER, 3, shutter=
);
> >
> >
> > drivers/media/i2c/imx335.c::imx335_update_exp_gain()
> >
> >         lpfr =3D imx335->vblank + imx335->cur_mode->height;
> >         shutter =3D lpfr - exposure;
> >
> >         ret =3D imx335_write_reg(imx335, IMX334_REG_SHUTTER, 3, shutter=
);

Is this a copy / paste error (IMX334), or are you using a downstream/altern=
ative
driver?

Upstream implements this:

/**
 * imx335_update_exp_gain() - Set updated exposure and gain
 * @imx335: pointer to imx335 device
 * @exposure: updated exposure value
 * @gain: updated analog gain value
 *
 * Return: 0 if successful, error code otherwise.
 */
static int imx335_update_exp_gain(struct imx335 *imx335, u32 exposure, u32 =
gain)
{
	u32 lpfr, shutter;
	int ret;

	lpfr =3D imx335->vblank + imx335->cur_mode->height;
	shutter =3D lpfr - exposure;

	dev_dbg(imx335->dev, "Set exp %u, analog gain %u, shutter %u, lpfr %u\n",
		exposure, gain, shutter, lpfr);

	ret =3D imx335_write_reg(imx335, IMX335_REG_HOLD, 1, 1);
	if (ret)
		return ret;

	ret =3D imx335_write_reg(imx335, IMX335_REG_LPFR, 3, lpfr);
	if (ret)
		goto error_release_group_hold;

	ret =3D imx335_write_reg(imx335, IMX335_REG_SHUTTER, 3, shutter);
	if (ret)
		goto error_release_group_hold;

	ret =3D imx335_write_reg(imx335, IMX335_REG_AGAIN, 2, gain);

error_release_group_hold:
	imx335_write_reg(imx335, IMX335_REG_HOLD, 1, 0);

	return ret;
}

> >
> >
> > Looking again I'm inclined to believe the imx334/imx335 stuff is probab=
ly
> > correct for those sensors, got copied to imx412/imx577 and misapplied t=
o the
> > EXPOSURE control in imx412.

We're directly using the IMX335 driver in mainline on the i.MX8MP (and
also validated on Raspberry Pi 5). AGC is operational on both those
platforms with the sensor, so I have no reason to believe there is any
error in the upstream driver:

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/media/i2c/imx335.c


--
Kieran


> >
>=20
> Without datasheet/devices it really is hard to tell. Cargo cult at
> play most probably.
>=20
> >
> > > > - ret =3D imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, shut=
ter);
> > > > + ret =3D imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, expo=
sure);
> > >
> > > No datasheet here, can you confirm the IMX412_REG_EXPOSURE_CIT
> > > register is actually in lines ?
> >
> >
> > Looks like.
> >
> > From downstream "coarseIntgTimeAddr"
> >
> > imx577_sensor.xml
> >     <coarseIntgTimeAddr>0x0202</coarseIntgTimeAddr>
> >
> > imx586/imx586_sensor.cpp
> > pRegSettingsInfo->regSetting[regCount].registerAddr  =3D
> > pExposureData->pRegInfo->coarseIntgTimeAddr + 1;
> >
> > pRegSettingsInfo->regSetting[regCount].registerData  =3D (lineCount & 0=
xFF);
> >
> > > Apart from that, as the CID_EXPOSURE control limit are correctly
> > > updated when a new VBLANK is set by taking into account the exposure
> > > margins, I think writing the control value to the register is the
> > > right thing to do (if the register is in lines of course)
> > >
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > >
> > > Thanks
> > >    j
> > >
> >
> > If that's good enough I'll fix the typo and apply your RB.
>=20
> Sure
>=20
> Thanks
>   j
>=20
> >
> > ---
> > bod
> >

