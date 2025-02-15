Return-Path: <linux-media+bounces-26174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A66B3A36D47
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 11:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2525A1896498
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 10:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE0C1A316F;
	Sat, 15 Feb 2025 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BQeCIQT1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67063155CB3;
	Sat, 15 Feb 2025 10:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739614845; cv=none; b=tY/SV2Eo7jNfCJpC5L3pcWxa4dOl70RnTdre+wYjhWQXh6OXd8/41dRiAwp1RVTmI058vuaWReI9CDfElNOfOBybvZ9I1+hcs1tRdKkFAFGHBdlBTrxxidv1N+ZicVSjH3T2cHkO/MTbKpFOTRQjPOh+KV5BVV+0GgrnBL3d5hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739614845; c=relaxed/simple;
	bh=vdaZIbL/XhyFD1tljTOzP7QBjF6nY9Cv2bH9TbWELVk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=LvJzDVefytxXQn3S0Fk8v355DsUozfJ4/n3jeBdJXY+9VBeBY1DEHCvWrSvf0AtlcLVLyTHjiaQnsMvn5Sq5olHZQl1d4BJcnRYEqZwpmnS+tePnqBzQHMHMZnLkK2A6hpOhAw76COUA4oyYAiKBPBF3m62qhv5QhABpmsE22kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BQeCIQT1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C353021C;
	Sat, 15 Feb 2025 11:19:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739614761;
	bh=vdaZIbL/XhyFD1tljTOzP7QBjF6nY9Cv2bH9TbWELVk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BQeCIQT1IPMJShD+BJvEyiR5GpZWPsB20+hrplKucno+yWdM+O/6GRiOY4kOgSzux
	 GR/hFOT8nZb6P5rTR90o/spc2wwbZGgXaKS71c1bOwZWakhnhxU22xslMpDHzHnX8K
	 Tol5gA3EMssN1iLQUcZJ5Y8Q07Ryqit0z1sKHXN0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aae670db21a1de622cc89ac637c407bf6452c44f.camel@ndufresne.ca>
References: <20250214133709.1290585-1-paul.elder@ideasonboard.com> <aae670db21a1de622cc89ac637c407bf6452c44f.camel@ndufresne.ca>
Subject: Re: [PATCH] media: imx335: Set vblank immediately
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, open list <linux-kernel@vger.kernel.org>
To: Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org, nicolas@ndufresne.ca
Date: Sat, 15 Feb 2025 10:20:38 +0000
Message-ID: <173961483828.3850773.86050600448052546@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting nicolas@ndufresne.ca (2025-02-14 14:44:05)
> Hi,
>=20
> Le vendredi 14 f=C3=A9vrier 2025 =C3=A0 22:37 +0900, Paul Elder a =C3=A9c=
rit=C2=A0:
> > When the vblank v4l2 control is set, it does not get written to the
> > hardware immediately. It only gets updated when exposure is set.
> > Change
> > the behavior such that the vblank is written immediately when the
> > control is set.
>=20
> Not my field of competence, but won't this cause a flicker ?

No it shouldn't. The controls will only take effect on the next frame
boundary, but what was missing here before was that the VBLANK was not
being changed at all unless userspace also sets the Exposure control
directly.

That means that setting the exposure, and then setting the framerate
would not update the framerate (adjusted through the blanking), meaning
the framerate could not be updated at runtime. (Or it could be set but
would not take effect).

Note that in the event that VBLANK is updated, the exposure and blanking
is fully recalculated and reprogrammed to the hardware through
imx335_update_exp_gain(), which is required because the exposure is
proportional against the total frame duration. Perhaps that's specific
area you were concerned about potential for flicker?

Perhaps the commit message should make it clear that currently setting
the vblank does not take effect at all *unless* the exposure is also
*changed*. And Setting the vblank without changing the exposure is a
valid use case to change the frame rate.



> Nicolas
>=20
> >=20
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > ---
> > =C2=A0drivers/media/i2c/imx335.c | 19 +++++++++++++------
> > =C2=A01 file changed, 13 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> > index fcfd1d851bd4..e73a23bbbc89 100644
> > --- a/drivers/media/i2c/imx335.c
> > +++ b/drivers/media/i2c/imx335.c
> > @@ -559,12 +559,12 @@ static int imx335_set_ctrl(struct v4l2_ctrl
> > *ctrl)
> > =C2=A0                     imx335->vblank,
> > =C2=A0                     imx335->vblank + imx335->cur_mode->height);
> > =C2=A0
> > -             return __v4l2_ctrl_modify_range(imx335->exp_ctrl,
> > -                                             IMX335_EXPOSURE_MIN,
> > -                                             imx335->vblank +
> > -                                             imx335->cur_mode-
> > >height -
> > -
> >                                               IMX335_EXPOSURE_OFFSET,
> > -                                             1,
> > IMX335_EXPOSURE_DEFAULT);
> > +              __v4l2_ctrl_modify_range(imx335->exp_ctrl,
> > +                                     =C2=A0 IMX335_EXPOSURE_MIN,
> > +                                     =C2=A0 imx335->vblank +
> > +                                     =C2=A0 imx335->cur_mode->height -
> > +                                     =C2=A0 IMX335_EXPOSURE_OFFSET,
> > +                                     =C2=A0 1,
> > IMX335_EXPOSURE_DEFAULT);
> > =C2=A0     }
> > =C2=A0
> > =C2=A0     /*
> > @@ -575,6 +575,13 @@ static int imx335_set_ctrl(struct v4l2_ctrl
> > *ctrl)
> > =C2=A0             return 0;
> > =C2=A0
> > =C2=A0     switch (ctrl->id) {
> > +     case V4L2_CID_VBLANK:
> > +             exposure =3D imx335->exp_ctrl->val;
> > +             analog_gain =3D imx335->again_ctrl->val;
> > +
> > +             ret =3D imx335_update_exp_gain(imx335, exposure,
> > analog_gain);
> > +

This is what I would expect here,


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


> > +             break;
> > =C2=A0     case V4L2_CID_EXPOSURE:
> > =C2=A0             exposure =3D ctrl->val;
> > =C2=A0             analog_gain =3D imx335->again_ctrl->val;
>

