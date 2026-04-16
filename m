Return-Path: <linux-media+bounces-58915-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMhnHhDy4GkZnwAAu9opvQ
	(envelope-from <linux-media+bounces-58915-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:28:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 275AB40F8FD
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E8B53010932
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 14:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB873DEAE0;
	Thu, 16 Apr 2026 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Tf9kzMpM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B12D26AF4
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 14:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349703; cv=none; b=VOcZng7PkL+SMCKwOhwIYxo+RfOsdlXPDuQo2DD35DxRI2DXx9xlHs/WL/qSOVSShnaxpyJrso4XqGIJk+RCCWJ1ID0wDNA/qgGF/ee8fYRkrIcB05sAR1Us6Jg8HVA7dDTUATQKnWJk4AeKGw0Nl4lbpNTSsfEL0fOYw/XW/A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349703; c=relaxed/simple;
	bh=FLWlFmCODr/uKaU4tMaH8OUX9rI5cLoSBCi778CWf6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJDknhtPJ16sTgWTa8pfyHrxIXg1spM4ZZQO8/IhGiqkqV4CV7dVa7m2x5qqQsLcl4POlJgBva4M5cskPoSUmIoYn8ZjvRbd1uZU4r48GTBwPp/rCVajwefNq5INaBDGzaTfzhSGnLL665c0njhCjxdX4EWxoSXt1jMuM4An6kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Tf9kzMpM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E8ABC132;
	Thu, 16 Apr 2026 16:26:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776349607;
	bh=FLWlFmCODr/uKaU4tMaH8OUX9rI5cLoSBCi778CWf6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tf9kzMpMkBsXA9Ft3sVB57zs/PhZAN7aZGeOt/ksvsKXd2+v/I5X9uODkEBej05HW
	 yxGmFFq0mlccZD9l6qmgWcJv9+R0xIaCC5zzWfxMEU7jGqT/DsvXxNKevw1O4ghzf8
	 mrP7cY5M+aviTjr+Yigl2oJpIvHzcF3c3mbcNVjg=
Date: Thu, 16 Apr 2026 17:28:19 +0300
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
Subject: Re: [PATCH v4 11/29] media: imx412: Remove redundant kernel-doc
 comments
Message-ID: <20260416142819.GI1775831@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-12-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-12-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58915-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 275AB40F8FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 06:39:20PM +0300, Sakari Ailus wrote:
> Remove kernel-doc comments from regular callback functions. These comments
> have no information value.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/imx412.c | 82 --------------------------------------
>  1 file changed, 82 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index e25e0a9ff65c..2705af2f16c0 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -570,18 +570,6 @@ static int imx412_update_exp_gain(struct imx412 *imx412, u32 exposure, u32 gain)
>  	return ret;
>  }
>  
> -/**
> - * imx412_set_ctrl() - Set subdevice control
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
>  static int imx412_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct imx412 *imx412 =
> @@ -634,14 +622,6 @@ static const struct v4l2_ctrl_ops imx412_ctrl_ops = {
>  	.s_ctrl = imx412_set_ctrl,
>  };
>  
> -/**
> - * imx412_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
> - * @sd: pointer to imx412 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @code: V4L2 sub-device code enumeration need to be filled
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
> @@ -654,14 +634,6 @@ static int imx412_enum_mbus_code(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -/**
> - * imx412_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
> - * @sd: pointer to imx412 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @fsize: V4L2 sub-device size enumeration need to be filled
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_enum_frame_size(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_frame_size_enum *fsize)
> @@ -701,14 +673,6 @@ static void imx412_fill_pad_format(struct imx412 *imx412,
>  	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
>  }
>  
> -/**
> - * imx412_get_pad_format() - Get subdevice pad format
> - * @sd: pointer to imx412 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @fmt: V4L2 sub-device format need to be set
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_get_pad_format(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_format *fmt)
> @@ -731,14 +695,6 @@ static int imx412_get_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -/**
> - * imx412_set_pad_format() - Set subdevice pad format
> - * @sd: pointer to imx412 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @fmt: V4L2 sub-device format need to be set
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_set_pad_format(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_format *fmt)
> @@ -768,13 +724,6 @@ static int imx412_set_pad_format(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> -/**
> - * imx412_init_state() - Initialize sub-device state
> - * @sd: pointer to imx412 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_init_state(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_state *sd_state)
>  {
> @@ -840,13 +789,6 @@ static int imx412_stop_streaming(struct imx412 *imx412)
>  				1, IMX412_MODE_STANDBY);
>  }
>  
> -/**
> - * imx412_set_stream() - Enable sensor streaming
> - * @sd: pointer to imx412 subdevice
> - * @enable: set to enable sensor streaming
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct imx412 *imx412 = to_imx412(sd);
> @@ -1010,12 +952,6 @@ static const struct v4l2_subdev_internal_ops imx412_internal_ops = {
>  	.init_state = imx412_init_state,
>  };
>  
> -/**
> - * imx412_power_on() - Sensor power on sequence
> - * @dev: pointer to i2c device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_power_on(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> @@ -1053,12 +989,6 @@ static int imx412_power_on(struct device *dev)
>  	return ret;
>  }
>  
> -/**
> - * imx412_power_off() - Sensor power off sequence
> - * @dev: pointer to i2c device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_power_off(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> @@ -1159,12 +1089,6 @@ static int imx412_init_controls(struct imx412 *imx412)
>  	return 0;
>  }
>  
> -/**
> - * imx412_probe() - I2C client device binding
> - * @client: pointer to i2c client device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx412_probe(struct i2c_client *client)
>  {
>  	struct imx412 *imx412;
> @@ -1254,12 +1178,6 @@ static int imx412_probe(struct i2c_client *client)
>  	return ret;
>  }
>  
> -/**
> - * imx412_remove() - I2C client device unbinding
> - * @client: pointer to I2C client device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static void imx412_remove(struct i2c_client *client)
>  {
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);

-- 
Regards,

Laurent Pinchart

