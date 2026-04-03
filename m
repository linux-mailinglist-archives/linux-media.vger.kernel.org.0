Return-Path: <linux-media+bounces-58023-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SERhOoF6z2mvwgYAu9opvQ
	(envelope-from <linux-media+bounces-58023-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:29:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D3D392179
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2B8B30CA6FA
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 08:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DB1374E55;
	Fri,  3 Apr 2026 08:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LRFkgxtX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DBD33F8C5
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 08:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204595; cv=none; b=b/Bl71nKIHV8wAQ/9VsVUk0fSKNbye4cPyalUT3wxqKOnz53MbMfevEFMTVsmKsK90nLXe6PhNZiVC1xhR9DID96fCRxgg1q80imiHqIM9aOXZUArKxht/JjwlHOx+pKpRKMehAEtu8kN2EMpv0DJNNWXax0Qir9EzGzBI3bAvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204595; c=relaxed/simple;
	bh=TKFbpVA6VD6Ov2+zGfXZy1iDWFFSrO5tsaHXmSekRoE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=i/5xknXyvtKtXAKMmyAxIbyrB/if+6SBhfd4VHrnpFL7V6oFZRr7mqGYQCuKnfIOP7yLRrph9C4aMxaDa1PqoCvjYpbTxUZHKQkq+PWq+BCNQh7a9rcF1lqfH5SgRT33r2/KiXh4Z2p8f5Q4QpMYk93zcREfiK6dS7O7TBrDySE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LRFkgxtX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7BCB4B3;
	Fri,  3 Apr 2026 10:21:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775204508;
	bh=TKFbpVA6VD6Ov2+zGfXZy1iDWFFSrO5tsaHXmSekRoE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LRFkgxtXPrtkPLvdJ9kth57tVuL3mvnx5Q+zU59OoC415B2dlKhIjhyZgF2Daam6g
	 6K0kosSkdq/cBUIFCfzwXG4bBR0SUN+bAAS/lPN1SWgAodSJzz+8t7LPww7eWi9dp5
	 rKwv6Fz3Xf03KY9txgxwWHy+qPaW9wjShxtb9VvI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260402214954.3827408-6-sakari.ailus@linux.intel.com>
References: <20260402214954.3827408-1-sakari.ailus@linux.intel.com> <20260402214954.3827408-6-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 5/6] media: ov9282: Remove redundant kernel-doc comments
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Leon Luo <leonl@leopardimaging.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Fri, 03 Apr 2026 09:23:10 +0100
Message-ID: <177520459056.571732.8308453276941366752@ping.linuxembedded.co.uk>
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
	TAGGED_FROM(0.00)[bounces-58023-lists,linux-media=lfdr.de];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+]
X-Rspamd-Queue-Id: 57D3D392179
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Sakari Ailus (2026-04-02 22:49:53)
> Remove kernel-doc comments from regular callback functions. These comments
> have no information value.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  drivers/media/i2c/ov9282.c | 67 --------------------------------------
>  1 file changed, 67 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 2167fb73ea41..5b6f897a74fc 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -586,18 +586,6 @@ static u32 ov9282_flash_duration_to_us(struct ov9282=
 *ov9282, u32 value)
>         return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTO=
R);
>  }
> =20
> -/**
> - * ov9282_set_ctrl() - Set subdevice control
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
>  static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         struct ov9282 *ov9282 =3D
> @@ -704,14 +692,6 @@ static const struct v4l2_ctrl_ops ov9282_ctrl_ops =
=3D {
>         .try_ctrl =3D ov9282_try_ctrl,
>  };
> =20
> -/**
> - * ov9282_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
> - * @sd: pointer to ov9282 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @code: V4L2 sub-device code enumeration need to be filled
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int ov9282_enum_mbus_code(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_mbus_code_enum *code)
> @@ -780,14 +760,6 @@ static void ov9282_fill_pad_format(struct ov9282 *ov=
9282,
>         fmt->format.xfer_func =3D V4L2_XFER_FUNC_NONE;
>  }
> =20
> -/**
> - * ov9282_get_pad_format() - Get subdevice pad format
> - * @sd: pointer to ov9282 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @fmt: V4L2 sub-device format need to be set
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int ov9282_get_pad_format(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_format *fmt)
> @@ -807,14 +779,6 @@ static int ov9282_get_pad_format(struct v4l2_subdev =
*sd,
>         return 0;
>  }
> =20
> -/**
> - * ov9282_set_pad_format() - Set subdevice pad format
> - * @sd: pointer to ov9282 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @fmt: V4L2 sub-device format need to be set
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_format *fmt)
> @@ -852,13 +816,6 @@ static int ov9282_set_pad_format(struct v4l2_subdev =
*sd,
>         return ret;
>  }
> =20
> -/**
> - * ov9282_init_state() - Initialize sub-device state
> - * @sd: pointer to ov9282 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int ov9282_init_state(struct v4l2_subdev *sd,
>                              struct v4l2_subdev_state *sd_state)
>  {
> @@ -1157,12 +1114,6 @@ static const struct v4l2_subdev_internal_ops ov928=
2_internal_ops =3D {
>         .init_state =3D ov9282_init_state,
>  };
> =20
> -/**
> - * ov9282_power_on() - Sensor power on sequence
> - * @dev: pointer to i2c device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int ov9282_power_on(struct device *dev)
>  {
>         struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> @@ -1206,12 +1157,6 @@ static int ov9282_power_on(struct device *dev)
>         return ret;
>  }
> =20
> -/**
> - * ov9282_power_off() - Sensor power off sequence
> - * @dev: pointer to i2c device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int ov9282_power_off(struct device *dev)
>  {
>         struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> @@ -1333,12 +1278,6 @@ static int ov9282_init_controls(struct ov9282 *ov9=
282)
>         return 0;
>  }
> =20
> -/**
> - * ov9282_probe() - I2C client device binding
> - * @client: pointer to i2c client device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int ov9282_probe(struct i2c_client *client)
>  {
>         struct ov9282 *ov9282;
> @@ -1435,12 +1374,6 @@ static int ov9282_probe(struct i2c_client *client)
>         return ret;
>  }
> =20
> -/**
> - * ov9282_remove() - I2C client device unbinding
> - * @client: pointer to I2C client device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static void ov9282_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> --=20
> 2.47.3
>

