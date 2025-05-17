Return-Path: <linux-media+bounces-32696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74813ABAC86
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 23:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C58667A62F3
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 21:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E207205ABF;
	Sat, 17 May 2025 21:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GnSaGp4f"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9537F1AA786
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 21:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747516160; cv=none; b=nwO9TC7+9dDNb6dxB/wL1AFsEtro3yTtsmPLuYTEM16kMfPHgXUevAw/L1ResOYcmYB2vaErOEEgLm/T5V5A/nziu4gnIfdQV6363Ieh4QR/fcaJNHRKz8vwi8JkNjlekM+fDYiiyvDCOZYufz0CS+/D/q3Trk03H7PS9pZ2SF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747516160; c=relaxed/simple;
	bh=3+6xSdDL8WMYD471H6IO4sbdrms7+Xz2+VS2ChHjOG8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ch/qrWUvNxfFIj2z7wDIzcZqJgcJtq8A/w6E/FFR7MakUNj/SqTU3LlyOIvecf8QKYKrizpW7fN3YhVRHHiW8b4M4RFpqbaPN/+nsOInAFQN0OTrNyIPp4QK1TUbf+73MhQ+JvG13wKXkKPP8jZh+bjsF3IE9Xyvol38uaAmR3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GnSaGp4f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D4494AD;
	Sat, 17 May 2025 23:08:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747516137;
	bh=3+6xSdDL8WMYD471H6IO4sbdrms7+Xz2+VS2ChHjOG8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GnSaGp4fhl8nzMIW6xIMdz2XaucbktfpNz8Y/Q7NCWSYJWxbbePeSWXUIwqp6iO/H
	 xvzTSsCZXJHDwxr2LLAWLIMeEsI6ra7eA/zVTyTVd8Y3XjtG0cTHRHSXNiwS9tfrDu
	 40yqfKoQ7+t/sJFhQHl3V7X9diVnqvrN6N+a/Ux8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250517114106.43494-6-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com> <20250517114106.43494-6-hdegoede@redhat.com>
Subject: Re: [PATCH 05/23] media: atomisp: gc0310: Use V4L2_CID_ANALOGUE_GAIN for gain control
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 May 2025 22:09:13 +0100
Message-ID: <174751615300.335894.3402272890581119176@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2025-05-17 12:40:48)
> Use V4L2_CID_ANALOGUE_GAIN for gain control, as expected by userspace.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers=
/staging/media/atomisp/i2c/atomisp-gc0310.c
> index ee039f3be4da..756e56f639b7 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -289,7 +289,7 @@ static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
>                 ret =3D cci_write(sensor->regmap, GC0310_AEC_PK_EXPO_REG,
>                                 ctrl->val, NULL);
>                 break;
> -       case V4L2_CID_GAIN:
> +       case V4L2_CID_ANALOGUE_GAIN:
>                 ret =3D gc0310_gain_set(sensor, ctrl->val);
>                 break;
>         default:
> @@ -533,7 +533,7 @@ static int gc0310_init_controls(struct gc0310_device =
*sensor)
> =20
>         /* 32 steps at base gain 1 + 64 half steps at base gain 2 */

sounds like a curious gain model...

Will be interesting when we get the sensor calibration tools up and
running to plot this. (Or is there already a public datasheet
documenting this?)

Is there a split here between analogue gain and digital gain ? Or is it
all expected to be 'analogue gain' ?


>         sensor->ctrls.gain =3D
> -               v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_GAIN, 0, 95, 1=
, 31);
> +               v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_ANALOGUE_GAIN,=
 0, 95, 1, 31);
> =20
>         return hdl->error;
>  }
> --=20
> 2.49.0
>

