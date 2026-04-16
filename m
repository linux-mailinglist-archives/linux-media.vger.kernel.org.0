Return-Path: <linux-media+bounces-58913-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNpzAsnx4GkZnwAAu9opvQ
	(envelope-from <linux-media+bounces-58913-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:27:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC2840F8ED
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ECCC30474F5
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 14:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB343DF000;
	Thu, 16 Apr 2026 14:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vdFh9Sx8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D766D330D36
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 14:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349635; cv=none; b=eqOEdunj2hEg2aO8BAKuH0AgAgobDGEGvzmB0GXHBKmtaE3GyOFDrAQ7uo784DtClHMegxOZH/bW/TsDJkYxERUQo7XmLXr8TtDofiKc5hnKtp5+/j5LTHFV49wtGqYDjOhNK8f8Gnsq/D6P3pR6sYXRl4f2ton393Nug1KinBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349635; c=relaxed/simple;
	bh=ETiTD68f2xAAia62znH3/fzc0EXdjrJI68nQeKopA5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mj2cnM+TSXisVarnjcpX+91p56z/VLJ7zCgKcmFSR47vGN9pyIRMyScnJ9cq0RY/cZkngunYtV3nihaNn30TBPv5E+wCZolyzRqBzyMu2tAVG5fMw4JZODf2RyyidsVLkVmfybgqf9nctxz99RV370e1e1xmoz4q6/OOAlIaz6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vdFh9Sx8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6EE04132;
	Thu, 16 Apr 2026 16:25:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776349538;
	bh=ETiTD68f2xAAia62znH3/fzc0EXdjrJI68nQeKopA5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vdFh9Sx8oKcTxacn+dfFEZVBEAzE1BnwKQxZuVoaAXmBsVe9immn/iMG0oKkgE9yo
	 91az3UV00tvmgUZUVoVtFpUEHsGc2YS/ucQHS/HkRkEDg1lpeRp/6FQsHhaEVMfN8f
	 kkgBlpICw2xumRa7BR8rlj47YIGk800auBhYQy4w=
Date: Thu, 16 Apr 2026 17:27:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 09/29] media: imx334: Remove redundant kernel-doc
 comments
Message-ID: <20260416142711.GG1775831@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-10-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-10-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58913-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,intel.com:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 5BC2840F8ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 06:39:18PM +0300, Sakari Ailus wrote:
> Remove kernel-doc comments from regular callback functions. These comments
> have no information value.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/imx334.c | 93 --------------------------------------
>  1 file changed, 93 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index 9654f9268056..553a16b84f4d 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -566,18 +566,6 @@ static int imx334_update_exp_gain(struct imx334 *imx334, u32 exposure, u32 gain)
>  	return ret;
>  }
>  
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
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct imx334 *imx334 =
> @@ -678,14 +666,6 @@ static int imx334_get_format_code(struct imx334 *imx334, u32 code)
>  	return imx334_mbus_codes[0];
>  }
>  
> -/**
> - * imx334_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
> - * @sd: pointer to imx334 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device state
> - * @code: V4L2 sub-device code enumeration need to be filled
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
> @@ -698,14 +678,6 @@ static int imx334_enum_mbus_code(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -/**
> - * imx334_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
> - * @sd: pointer to imx334 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device state
> - * @fsize: V4L2 sub-device size enumeration need to be filled
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_enum_frame_size(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_frame_size_enum *fsize)
> @@ -749,14 +721,6 @@ static void imx334_fill_pad_format(struct imx334 *imx334,
>  	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
>  }
>  
> -/**
> - * imx334_get_pad_format() - Get subdevice pad format
> - * @sd: pointer to imx334 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device state
> - * @fmt: V4L2 sub-device format need to be set
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_get_pad_format(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_format *fmt)
> @@ -776,14 +740,6 @@ static int imx334_get_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -/**
> - * imx334_set_pad_format() - Set subdevice pad format
> - * @sd: pointer to imx334 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device state
> - * @fmt: V4L2 sub-device format need to be set
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_set_pad_format(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_format *fmt)
> @@ -815,13 +771,6 @@ static int imx334_set_pad_format(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> -/**
> - * imx334_init_state() - Initialize sub-device state
> - * @sd: pointer to imx334 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device state
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_init_state(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_state *sd_state)
>  {
> @@ -856,15 +805,6 @@ static int imx334_set_framefmt(struct imx334 *imx334)
>  	return -EINVAL;
>  }
>  
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
>  				 struct v4l2_subdev_state *state, u32 pad,
>  				 u64 streams_mask)
> @@ -929,15 +869,6 @@ static int imx334_enable_streams(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
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
>  				  struct v4l2_subdev_state *state, u32 pad,
>  				  u64 streams_mask)
> @@ -1067,12 +998,6 @@ static const struct v4l2_subdev_internal_ops imx334_internal_ops = {
>  	.init_state = imx334_init_state,
>  };
>  
> -/**
> - * imx334_power_on() - Sensor power on sequence
> - * @dev: pointer to i2c device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_power_on(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> @@ -1101,12 +1026,6 @@ static int imx334_power_on(struct device *dev)
>  	return ret;
>  }
>  
> -/**
> - * imx334_power_off() - Sensor power off sequence
> - * @dev: pointer to i2c device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_power_off(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> @@ -1206,12 +1125,6 @@ static int imx334_init_controls(struct imx334 *imx334)
>  	return 0;
>  }
>  
> -/**
> - * imx334_probe() - I2C client device binding
> - * @client: pointer to i2c client device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx334_probe(struct i2c_client *client)
>  {
>  	struct imx334 *imx334;
> @@ -1311,12 +1224,6 @@ static int imx334_probe(struct i2c_client *client)
>  	return ret;
>  }
>  
> -/**
> - * imx334_remove() - I2C client device unbinding
> - * @client: pointer to I2C client device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static void imx334_remove(struct i2c_client *client)
>  {
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);

-- 
Regards,

Laurent Pinchart

