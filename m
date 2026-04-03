Return-Path: <linux-media+bounces-58022-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCNEEBp6z2mvwgYAu9opvQ
	(envelope-from <linux-media+bounces-58022-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:28:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CF4392137
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DF2A306B800
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 08:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137CA371D14;
	Fri,  3 Apr 2026 08:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L5bvGTGu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394BB285406
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 08:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204574; cv=none; b=NLkgSCjLfEfQVvIKuL4t2uVnSjh8eELmG1Gqc8iHrdfrya3I2ItYHINWW08YHwpbJx8i30WtJqvm/0WlskOFDhlNvGIbORhWC3CyY5rUITPwKq8c8rn2KjQ69tq3Oa+UP3OVs+ky9BFb/swToQ9QaZBrW5WUWTLG8NcIIvznY7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204574; c=relaxed/simple;
	bh=ARVRaKdIrdBviJqC57qDim7ufFydId7xy/gaO5q4rLg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=IJ+pb8/O4V0mwf225ZgPOKRv21cl8FxPzOgKDYEWRSNeJzRCX8dhzlGYxhUxB5soRItloXo7FHA3GpecFhT+TBq5hfZOC4KnoKIeuo7J3T2TuA/vzjmQNrLNUTYaPe8mO5a4IWlcvJchOLaqccWZSyizHXbekSYb2T//l5loSaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L5bvGTGu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 633AD4B3;
	Fri,  3 Apr 2026 10:21:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775204487;
	bh=ARVRaKdIrdBviJqC57qDim7ufFydId7xy/gaO5q4rLg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=L5bvGTGuHx0NGI13G2FZy9ZQBSCCvFI7Qt3W8DOODdtXyXidh05jvq5hvmzDLE46t
	 OfHn283b8DK0Rz+st1f0wMK6ULZz1SypscNiZDGEzNlqY/XoFxoCKKovFGzSygkQDO
	 /R0jMmsPB1eIKcEEWPWRJ+HSykvliUhpRmxtCJtY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260402214954.3827408-5-sakari.ailus@linux.intel.com>
References: <20260402214954.3827408-1-sakari.ailus@linux.intel.com> <20260402214954.3827408-5-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 4/6] media: imx412: Remove redundant kernel-doc comments
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Leon Luo <leonl@leopardimaging.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Fri, 03 Apr 2026 09:22:48 +0100
Message-ID: <177520456885.571732.13850070798625497207@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58022-lists,linux-media=lfdr.de];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+]
X-Rspamd-Queue-Id: 96CF4392137
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Sakari Ailus (2026-04-02 22:49:52)
> Remove kernel-doc comments from regular callback functions. These comments
> have no information value.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx412.c | 82 --------------------------------------
>  1 file changed, 82 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index e25e0a9ff65c..2705af2f16c0 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -570,18 +570,6 @@ static int imx412_update_exp_gain(struct imx412 *imx=
412, u32 exposure, u32 gain)
>         return ret;
>  }
> =20
> -/**
> - * imx412_set_ctrl() - Set subdevice control
> - * @ctrl: pointer to v4l2_ctrl structure
> - *
> - * Supported controls:
> - * - V4L2_CID_VBLANK
> - * - cluster controls:
> - *   - V4L2_CID_ANALOGUE_GAIN
> - *   - V4L2_CID_EXPOSURE

A recurring pattern, so it's well established at least which means less
requirement IMO.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         struct imx412 *imx412 =3D
> @@ -634,14 +622,6 @@ static const struct v4l2_ctrl_ops imx412_ctrl_ops =
=3D {
>         .s_ctrl =3D imx412_set_ctrl,
>  };
> =20
> -/**
> - * imx412_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
> - * @sd: pointer to imx412 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @code: V4L2 sub-device code enumeration need to be filled
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_enum_mbus_code(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_mbus_code_enum *code)
> @@ -654,14 +634,6 @@ static int imx412_enum_mbus_code(struct v4l2_subdev =
*sd,
>         return 0;
>  }
> =20
> -/**
> - * imx412_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
> - * @sd: pointer to imx412 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @fsize: V4L2 sub-device size enumeration need to be filled
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_enum_frame_size(struct v4l2_subdev *sd,
>                                   struct v4l2_subdev_state *sd_state,
>                                   struct v4l2_subdev_frame_size_enum *fsi=
ze)
> @@ -701,14 +673,6 @@ static void imx412_fill_pad_format(struct imx412 *im=
x412,
>         fmt->format.xfer_func =3D V4L2_XFER_FUNC_NONE;
>  }
> =20
> -/**
> - * imx412_get_pad_format() - Get subdevice pad format
> - * @sd: pointer to imx412 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @fmt: V4L2 sub-device format need to be set
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_get_pad_format(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_format *fmt)
> @@ -731,14 +695,6 @@ static int imx412_get_pad_format(struct v4l2_subdev =
*sd,
>         return 0;
>  }
> =20
> -/**
> - * imx412_set_pad_format() - Set subdevice pad format
> - * @sd: pointer to imx412 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @fmt: V4L2 sub-device format need to be set
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_set_pad_format(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_format *fmt)
> @@ -768,13 +724,6 @@ static int imx412_set_pad_format(struct v4l2_subdev =
*sd,
>         return ret;
>  }
> =20
> -/**
> - * imx412_init_state() - Initialize sub-device state
> - * @sd: pointer to imx412 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_init_state(struct v4l2_subdev *sd,
>                              struct v4l2_subdev_state *sd_state)
>  {
> @@ -840,13 +789,6 @@ static int imx412_stop_streaming(struct imx412 *imx4=
12)
>                                 1, IMX412_MODE_STANDBY);
>  }
> =20
> -/**
> - * imx412_set_stream() - Enable sensor streaming
> - * @sd: pointer to imx412 subdevice
> - * @enable: set to enable sensor streaming
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>         struct imx412 *imx412 =3D to_imx412(sd);
> @@ -1010,12 +952,6 @@ static const struct v4l2_subdev_internal_ops imx412=
_internal_ops =3D {
>         .init_state =3D imx412_init_state,
>  };
> =20
> -/**
> - * imx412_power_on() - Sensor power on sequence
> - * @dev: pointer to i2c device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_power_on(struct device *dev)
>  {
>         struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> @@ -1053,12 +989,6 @@ static int imx412_power_on(struct device *dev)
>         return ret;
>  }
> =20
> -/**
> - * imx412_power_off() - Sensor power off sequence
> - * @dev: pointer to i2c device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_power_off(struct device *dev)
>  {
>         struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> @@ -1159,12 +1089,6 @@ static int imx412_init_controls(struct imx412 *imx=
412)
>         return 0;
>  }
> =20
> -/**
> - * imx412_probe() - I2C client device binding
> - * @client: pointer to i2c client device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_probe(struct i2c_client *client)
>  {
>         struct imx412 *imx412;
> @@ -1254,12 +1178,6 @@ static int imx412_probe(struct i2c_client *client)
>         return ret;
>  }
> =20
> -/**
> - * imx412_remove() - I2C client device unbinding
> - * @client: pointer to I2C client device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static void imx412_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> --=20
> 2.47.3
>

