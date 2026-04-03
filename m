Return-Path: <linux-media+bounces-58018-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPWVGeB0z2kewgYAu9opvQ
	(envelope-from <linux-media+bounces-58018-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:05:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61431391E75
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B9D92300BE8A
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 08:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCAC301472;
	Fri,  3 Apr 2026 08:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c0IoL856"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A07219D07E
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775203541; cv=none; b=BTVhGhdpzqEs43vsjUQbM274xaRmu8xsE7yiNduU9BXGHA1Hp9F4HpGyGmkTPE7RDVFlolvWkDhG03UFkRVPPhjemR8U2xW+vLvw77yzde4aX4f+4uPyEBLAyO0EWTd9O+YRmQkNCwpp0PLxfK1u/ae1d+7CNHDnoef8bxLSB1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775203541; c=relaxed/simple;
	bh=Ps44OVcJ8fmeLr0jOhCGcOLw3Q4J4lpDpbvERjnNePY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=phvjn8R+w7NQgvh2KopTQsw6mqFEB69cqm4SQNzOjKUdhC6d8KCM5oU9YU0aQatkMR/WeMoFr5SgTk8S7pArusrBV/6VKnBl3FITKubTpS2p3NZZxIB4U0ZbNrclmeU4FLgM/LGgfVJK5pIBTMAaccLhEeUe775y8LeRAnLdm0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c0IoL856; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1C87143C;
	Fri,  3 Apr 2026 10:04:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775203453;
	bh=Ps44OVcJ8fmeLr0jOhCGcOLw3Q4J4lpDpbvERjnNePY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=c0IoL856IZX/IbjRT7DqVJsS7xVeqjSYku1/62uuTuIx7xu56HoW7SuG5750LZ+Q8
	 blZc2McaZS1yTWksNufYzNNuGM0PHHv0YwEn3FIWqlLYBaectbqgcLVVCclroHsVg9
	 x7AAs9lmguE/BIYJzZr+/aVJmbYmRLH1l8Fvxxvk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260402214954.3827408-3-sakari.ailus@linux.intel.com>
References: <20260402214954.3827408-1-sakari.ailus@linux.intel.com> <20260402214954.3827408-3-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 2/6] media: imx334: Remove redundant kernel-doc comments
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Leon Luo <leonl@leopardimaging.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Fri, 03 Apr 2026 09:05:34 +0100
Message-ID: <177520353491.571732.4843100473344237788@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58018-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ping.linuxembedded.co.uk:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 61431391E75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Sakari Ailus (2026-04-02 22:49:50)
> Remove kernel-doc comments from regular callback functions. These comments
> have no information value.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx334.c | 93 --------------------------------------
>  1 file changed, 93 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index 9654f9268056..553a16b84f4d 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -566,18 +566,6 @@ static int imx334_update_exp_gain(struct imx334 *imx=
334, u32 exposure, u32 gain)
>         return ret;
>  }
> =20
> -/**
> - * imx334_set_ctrl() - Set subdevice control
> - * @ctrl: pointer to v4l2_ctrl structure
> - *
> - * Supported controls:
> - * - V4L2_CID_VBLANK
> - * - cluster controls:
> - *   - V4L2_CID_ANALOGUE_GAIN
> - *   - V4L2_CID_EXPOSURE
> - *

Not too surprising to see the same pattern there.


Perhaps the highlight that some controls are managed as a cluster is
helpful, but I've already had it in my head that it should be fine to
remove this comment for IMX335, so I think it would be fine with me for
IMX334 too, I'm curious if it matters to anyone else ... but as long as
the driver operates the gain and exposure correctly at least from a
libcamera perspective that's what counts.

All the other comments certainly seem fairly redundant.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>



> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         struct imx334 *imx334 =3D
> @@ -678,14 +666,6 @@ static int imx334_get_format_code(struct imx334 *imx=
334, u32 code)
>         return imx334_mbus_codes[0];
>  }
> =20
> -/**
> - * imx334_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
> - * @sd: pointer to imx334 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device state
> - * @code: V4L2 sub-device code enumeration need to be filled
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_enum_mbus_code(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_mbus_code_enum *code)
> @@ -698,14 +678,6 @@ static int imx334_enum_mbus_code(struct v4l2_subdev =
*sd,
>         return 0;
>  }
> =20
> -/**
> - * imx334_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
> - * @sd: pointer to imx334 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device state
> - * @fsize: V4L2 sub-device size enumeration need to be filled
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_enum_frame_size(struct v4l2_subdev *sd,
>                                   struct v4l2_subdev_state *sd_state,
>                                   struct v4l2_subdev_frame_size_enum *fsi=
ze)
> @@ -749,14 +721,6 @@ static void imx334_fill_pad_format(struct imx334 *im=
x334,
>         fmt->format.xfer_func =3D V4L2_XFER_FUNC_NONE;
>  }
> =20
> -/**
> - * imx334_get_pad_format() - Get subdevice pad format
> - * @sd: pointer to imx334 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device state
> - * @fmt: V4L2 sub-device format need to be set
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_get_pad_format(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_format *fmt)
> @@ -776,14 +740,6 @@ static int imx334_get_pad_format(struct v4l2_subdev =
*sd,
>         return 0;
>  }
> =20
> -/**
> - * imx334_set_pad_format() - Set subdevice pad format
> - * @sd: pointer to imx334 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device state
> - * @fmt: V4L2 sub-device format need to be set
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_set_pad_format(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_format *fmt)
> @@ -815,13 +771,6 @@ static int imx334_set_pad_format(struct v4l2_subdev =
*sd,
>         return ret;
>  }
> =20
> -/**
> - * imx334_init_state() - Initialize sub-device state
> - * @sd: pointer to imx334 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device state
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_init_state(struct v4l2_subdev *sd,
>                              struct v4l2_subdev_state *sd_state)
>  {
> @@ -856,15 +805,6 @@ static int imx334_set_framefmt(struct imx334 *imx334)
>         return -EINVAL;
>  }
> =20
> -/**
> - * imx334_enable_streams() - Enable specified streams for the sensor
> - * @sd: pointer to the V4L2 subdevice
> - * @state: pointer to the subdevice state
> - * @pad: pad number for which streams are enabled
> - * @streams_mask: bitmask specifying the streams to enable
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_enable_streams(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *state, u32 pad,
>                                  u64 streams_mask)
> @@ -929,15 +869,6 @@ static int imx334_enable_streams(struct v4l2_subdev =
*sd,
>         return ret;
>  }
> =20
> -/**
> - * imx334_disable_streams() - Enable specified streams for the sensor
> - * @sd: pointer to the V4L2 subdevice
> - * @state: pointer to the subdevice state
> - * @pad: pad number for which streams are disabled
> - * @streams_mask: bitmask specifying the streams to disable
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_disable_streams(struct v4l2_subdev *sd,
>                                   struct v4l2_subdev_state *state, u32 pa=
d,
>                                   u64 streams_mask)
> @@ -1067,12 +998,6 @@ static const struct v4l2_subdev_internal_ops imx334=
_internal_ops =3D {
>         .init_state =3D imx334_init_state,
>  };
> =20
> -/**
> - * imx334_power_on() - Sensor power on sequence
> - * @dev: pointer to i2c device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_power_on(struct device *dev)
>  {
>         struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> @@ -1101,12 +1026,6 @@ static int imx334_power_on(struct device *dev)
>         return ret;
>  }
> =20
> -/**
> - * imx334_power_off() - Sensor power off sequence
> - * @dev: pointer to i2c device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_power_off(struct device *dev)
>  {
>         struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> @@ -1206,12 +1125,6 @@ static int imx334_init_controls(struct imx334 *imx=
334)
>         return 0;
>  }
> =20
> -/**
> - * imx334_probe() - I2C client device binding
> - * @client: pointer to i2c client device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_probe(struct i2c_client *client)
>  {
>         struct imx334 *imx334;
> @@ -1311,12 +1224,6 @@ static int imx334_probe(struct i2c_client *client)
>         return ret;
>  }
> =20
> -/**
> - * imx334_remove() - I2C client device unbinding
> - * @client: pointer to I2C client device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static void imx334_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> --=20
> 2.47.3
>

