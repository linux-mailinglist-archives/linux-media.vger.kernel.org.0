Return-Path: <linux-media+bounces-58024-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKWdFRV7z2nrwgYAu9opvQ
	(envelope-from <linux-media+bounces-58024-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:32:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A79A93921AD
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 029573053BB5
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 08:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB75F346ADC;
	Fri,  3 Apr 2026 08:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="whpTCXFj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AACE21FF21
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 08:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204700; cv=none; b=Pm3C8CYtsuUxo0op3j+ZD79t6Q8+wo194Mc6fSYViB6b3W119HQn9280XGluhghx5KLG4HycyewTVVp/A6tB17k9tTAnuNs6Q4ISyKN6R8sTZTolGJakL1f2dtrHY9712oEHIFz2Xon2MMRxCHygVnk2+vVkRdYw+cBKMzTdSyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204700; c=relaxed/simple;
	bh=6axINFat+o6y4ic/WZvtFF19gsrttAVYum4BfNyBAW8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=CdA7+TdNzMtRW6wKCZ64odtRn5DnArc5W3MnxpCY5lHcmsnMFyl/3qKv8yJ0ptPuxt2nMYxW0fSHqxl05B9FBPXTKLehmfch/mzKVKdGQIBY2Ls+M47fc8CUaNDAkvJCaQ9dpZAwQI+DZYigDc7AzT1hYKTl27Kw6Nsadsv3Gxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=whpTCXFj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 487BC4B3;
	Fri,  3 Apr 2026 10:23:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775204613;
	bh=6axINFat+o6y4ic/WZvtFF19gsrttAVYum4BfNyBAW8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=whpTCXFjzfGv2dgwl/Y48IxMg6DZ78qOw+gArdi5QsLSxN6Z8e9ZY9fof5fJjAQQr
	 4deAoDPu357txiAT3j5JEBa2vRsUetKWG3uhGu/+JV4iCaX6/SrZhdb+Q/i3xaUS/L
	 x+kIY2FSA1Gl8Rk1gIIHhk8NOp2Jy7DXxI6d6ydY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260402214954.3827408-7-sakari.ailus@linux.intel.com>
References: <20260402214954.3827408-1-sakari.ailus@linux.intel.com> <20260402214954.3827408-7-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 6/6] media: tvp514x: Remove redundant kernel-doc comments
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Leon Luo <leonl@leopardimaging.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Fri, 03 Apr 2026 09:24:54 +0100
Message-ID: <177520469478.571732.7306468270702930185@ping.linuxembedded.co.uk>
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
	TAGGED_FROM(0.00)[bounces-58024-lists,linux-media=lfdr.de];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+]
X-Rspamd-Queue-Id: A79A93921AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Sakari Ailus (2026-04-02 22:49:54)
> Remove kernel-doc comments from regular callback functions. These comments
> have no information value.
>=20


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/tvp514x.c | 55 +------------------------------------
>  1 file changed, 1 insertion(+), 54 deletions(-)
>=20
> diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
> index f9c9c80c33ac..7af8f37646d6 100644
> --- a/drivers/media/i2c/tvp514x.c
> +++ b/drivers/media/i2c/tvp514x.c
> @@ -686,13 +686,6 @@ static int tvp514x_s_routing(struct v4l2_subdev *sd,
>         return 0;
>  }
> =20
> -/**
> - * tvp514x_s_ctrl() - V4L2 decoder interface handler for s_ctrl
> - * @ctrl: pointer to v4l2_ctrl structure
> - *
> - * If the requested control is supported, sets the control's current
> - * value in HW. Otherwise, returns -EINVAL if the control is not support=
ed.
> - */
>  static int tvp514x_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         struct v4l2_subdev *sd =3D to_sd(ctrl);
> @@ -789,13 +782,6 @@ tvp514x_set_frame_interval(struct v4l2_subdev *sd,
>         return 0;
>  }
> =20
> -/**
> - * tvp514x_s_stream() - V4L2 decoder i/f handler for s_stream
> - * @sd: pointer to standard V4L2 sub-device structure
> - * @enable: streaming enable or disable
> - *
> - * Sets streaming to enable or disable, if possible.
> - */
>  static int tvp514x_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>         int err =3D 0;
> @@ -850,14 +836,6 @@ static const struct v4l2_ctrl_ops tvp514x_ctrl_ops =
=3D {
>         .s_ctrl =3D tvp514x_s_ctrl,
>  };
> =20
> -/**
> - * tvp514x_enum_mbus_code() - V4L2 decoder interface handler for enum_mb=
us_code
> - * @sd: pointer to standard V4L2 sub-device structure
> - * @sd_state: subdev state
> - * @code: pointer to v4l2_subdev_mbus_code_enum structure
> - *
> - * Enumertaes mbus codes supported
> - */
>  static int tvp514x_enum_mbus_code(struct v4l2_subdev *sd,
>                                   struct v4l2_subdev_state *sd_state,
>                                   struct v4l2_subdev_mbus_code_enum *code)
> @@ -877,14 +855,6 @@ static int tvp514x_enum_mbus_code(struct v4l2_subdev=
 *sd,
>         return 0;
>  }
> =20
> -/**
> - * tvp514x_get_pad_format() - V4L2 decoder interface handler for get pad=
 format
> - * @sd: pointer to standard V4L2 sub-device structure
> - * @sd_state: subdev state
> - * @format: pointer to v4l2_subdev_format structure
> - *
> - * Retrieves pad format which is active or tried based on requirement
> - */
>  static int tvp514x_get_pad_format(struct v4l2_subdev *sd,
>                                   struct v4l2_subdev_state *sd_state,
>                                   struct v4l2_subdev_format *format)
> @@ -909,14 +879,6 @@ static int tvp514x_get_pad_format(struct v4l2_subdev=
 *sd,
>         return 0;
>  }
> =20
> -/**
> - * tvp514x_set_pad_format() - V4L2 decoder interface handler for set pad=
 format
> - * @sd: pointer to standard V4L2 sub-device structure
> - * @sd_state: subdev state
> - * @fmt: pointer to v4l2_subdev_format structure
> - *
> - * Set pad format for the output pad
> - */
>  static int tvp514x_set_pad_format(struct v4l2_subdev *sd,
>                                   struct v4l2_subdev_state *sd_state,
>                                   struct v4l2_subdev_format *fmt)
> @@ -1014,15 +976,7 @@ tvp514x_get_pdata(struct i2c_client *client)
>         return pdata;
>  }
> =20
> -/**
> - * tvp514x_probe() - decoder driver i2c probe handler
> - * @client: i2c driver client device structure
> - *
> - * Register decoder as an i2c client device and V4L2
> - * device.
> - */
> -static int
> -tvp514x_probe(struct i2c_client *client)
> +static int tvp514x_probe(struct i2c_client *client)
>  {
>         struct tvp514x_platform_data *pdata =3D tvp514x_get_pdata(client);
>         struct tvp514x_decoder *decoder;
> @@ -1113,13 +1067,6 @@ tvp514x_probe(struct i2c_client *client)
>         return ret;
>  }
> =20
> -/**
> - * tvp514x_remove() - decoder driver i2c remove handler
> - * @client: i2c driver client device structure
> - *
> - * Unregister decoder as an i2c client device and V4L2
> - * device. Complement of tvp514x_probe().
> - */
>  static void tvp514x_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> --=20
> 2.47.3
>

