Return-Path: <linux-media+bounces-58016-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCk7CIl0z2kewgYAu9opvQ
	(envelope-from <linux-media+bounces-58016-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:04:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 664AE391E54
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37E04305F4D6
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 08:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F312FFDDE;
	Fri,  3 Apr 2026 08:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I5P34I+9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD692C11EF
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 08:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775203322; cv=none; b=AIW6bru6Qk020qT1eCaY4M68Ymt2QCgxCRdet2AqRWCpVZXUSBdOGYVX6MX99cOaBNF9oEaa94m7SqeaDCZ4+zwFmTfVyN9k1cq/cUI8onbsFU3IY4WC15RYE+mu5Z9KE1Dzw2BfuLzkWQGe//GswXgrFJNRixGbQC8gxIEO5lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775203322; c=relaxed/simple;
	bh=xAosbomV5/i3BI0hSehPFyZ+7k6VTHSqWnLMZpq4Zkc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=dhrlETtrPAzE9oAdlDmle97MauJxoIklT560MNaCqHQGXEO0SzE9ETegGYwA4xvmw7yBcmzvG0Yrz6WyM6lS+6Hx+PKoQ5UvcNosD7zDWWYklez7UHPfisicIlmToGyaYn4QCQf5tmkAZvo0lMxxejU4lvmhmlF8w/Qusbf5IOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I5P34I+9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 599CA143C;
	Fri,  3 Apr 2026 10:00:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775203232;
	bh=xAosbomV5/i3BI0hSehPFyZ+7k6VTHSqWnLMZpq4Zkc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=I5P34I+9u8aVICH7Jh1AioxrMBmJm2hsBYO4OnBZfxZ31XmWwFxOKwE/eYuzrBjBC
	 gtTIyjz58n/IQo7MIW43r+1jQnPrmuzypnxSf4+xzh2pj7yB5872C4NUPND+Vpw6PJ
	 3LD6RGo5mJhHLqjIX91I9gBsRuwf/akIbXekgdos=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260402214954.3827408-4-sakari.ailus@linux.intel.com>
References: <20260402214954.3827408-1-sakari.ailus@linux.intel.com> <20260402214954.3827408-4-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 3/6] media: imx335: Remove redundant kernel-doc comments
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Leon Luo <leonl@leopardimaging.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Fri, 03 Apr 2026 09:01:54 +0100
Message-ID: <177520331405.571732.9880654093799944396@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58016-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,ideasonboard.com:dkim,ideasonboard.com:email,ping.linuxembedded.co.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 664AE391E54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Sakari Ailus (2026-04-02 22:49:51)
> Remove kernel-doc comments from regular callback functions. These comments
> have no information value.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx335.c | 87 --------------------------------------
>  1 file changed, 87 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index 5790aa4fabeb..1f777a1a8192 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -698,18 +698,6 @@ static int imx335_update_test_pattern(struct imx335 =
*imx335, u32 pattern_index)
>         return ret;
>  }
> =20
> -/**
> - * imx335_set_ctrl() - Set subdevice control
> - * @ctrl: pointer to v4l2_ctrl structure
> - *
> - * Supported controls:
> - * - V4L2_CID_VBLANK
> - * - cluster controls:
> - *   - V4L2_CID_ANALOGUE_GAIN
> - *   - V4L2_CID_EXPOSURE
> - *
> - * Return: 0 if successful, error code otherwise.
> - */

I hadn't even noticed/stored in my head that the gain/exposure were
clusted here! So highlighting has shown me something \o/

Still - I still think you're right - and it doesn't need a specific
kernel-doc, and the other functions here even more so, so:


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>  static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         struct imx335 *imx335 =3D
> @@ -800,14 +788,6 @@ static int imx335_get_format_code(struct imx335 *imx=
335, u32 code)
>         return imx335_mbus_codes[0];
>  }
> =20
> -/**
> - * imx335_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
> - * @sd: pointer to imx335 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @code: V4L2 sub-device code enumeration need to be filled
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx335_enum_mbus_code(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_mbus_code_enum *code)
> @@ -820,14 +800,6 @@ static int imx335_enum_mbus_code(struct v4l2_subdev =
*sd,
>         return 0;
>  }
> =20
> -/**
> - * imx335_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
> - * @sd: pointer to imx335 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @fsize: V4L2 sub-device size enumeration need to be filled
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx335_enum_frame_size(struct v4l2_subdev *sd,
>                                   struct v4l2_subdev_state *sd_state,
>                                   struct v4l2_subdev_frame_size_enum *fsi=
ze)
> @@ -871,14 +843,6 @@ static void imx335_fill_pad_format(struct imx335 *im=
x335,
>         fmt->format.xfer_func =3D V4L2_XFER_FUNC_NONE;
>  }
> =20
> -/**
> - * imx335_set_pad_format() - Set subdevice pad format
> - * @sd: pointer to imx335 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @fmt: V4L2 sub-device format need to be set
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx335_set_pad_format(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_format *fmt)
> @@ -923,13 +887,6 @@ static int imx335_set_pad_format(struct v4l2_subdev =
*sd,
>         return ret;
>  }
> =20
> -/**
> - * imx335_init_state() - Initialize sub-device state
> - * @sd: pointer to imx335 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx335_init_state(struct v4l2_subdev *sd,
>                              struct v4l2_subdev_state *sd_state)
>  {
> @@ -947,14 +904,6 @@ static int imx335_init_state(struct v4l2_subdev *sd,
>         return imx335_set_pad_format(sd, sd_state, &fmt);
>  }
> =20
> -/**
> - * imx335_get_selection() - Selection API
> - * @sd: pointer to imx335 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @sel: V4L2 selection info
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx335_get_selection(struct v4l2_subdev *sd,
>                                 struct v4l2_subdev_state *sd_state,
>                                 struct v4l2_subdev_selection *sel)
> @@ -1011,15 +960,6 @@ static int imx335_set_framefmt(struct imx335 *imx33=
5)
>         return ret;
>  }
> =20
> -/**
> - * imx335_enable_streams() - Enable sensor streams
> - * @sd: V4L2 subdevice
> - * @state: V4L2 subdevice state
> - * @pad: The pad to enable
> - * @streams_mask: Bitmask of streams to enable
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx335_enable_streams(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *state, u32 pad,
>                                  u64 streams_mask)
> @@ -1097,15 +1037,6 @@ static int imx335_enable_streams(struct v4l2_subde=
v *sd,
>         return ret;
>  }
> =20
> -/**
> - * imx335_disable_streams() - Disable sensor streams
> - * @sd: V4L2 subdevice
> - * @state: V4L2 subdevice state
> - * @pad: The pad to disable
> - * @streams_mask: Bitmask of streams to disable
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx335_disable_streams(struct v4l2_subdev *sd,
>                                   struct v4l2_subdev_state *state, u32 pa=
d,
>                                   u64 streams_mask)
> @@ -1299,12 +1230,6 @@ static int imx335_power_on(struct device *dev)
>         return ret;
>  }
> =20
> -/**
> - * imx335_power_off() - Sensor power off sequence
> - * @dev: pointer to i2c device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx335_power_off(struct device *dev)
>  {
>         struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> @@ -1430,12 +1355,6 @@ static int imx335_init_controls(struct imx335 *imx=
335)
>         return 0;
>  }
> =20
> -/**
> - * imx335_probe() - I2C client device binding
> - * @client: pointer to i2c client device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx335_probe(struct i2c_client *client)
>  {
>         struct imx335 *imx335;
> @@ -1530,12 +1449,6 @@ static int imx335_probe(struct i2c_client *client)
>         return ret;
>  }
> =20
> -/**
> - * imx335_remove() - I2C client device unbinding
> - * @client: pointer to I2C client device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static void imx335_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> --=20
> 2.47.3
>

