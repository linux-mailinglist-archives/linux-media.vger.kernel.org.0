Return-Path: <linux-media+bounces-58503-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHKMKOS82GlVhggAu9opvQ
	(envelope-from <linux-media+bounces-58503-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:03:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEDE3D4774
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6D1B300FEC1
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBE73B2FEE;
	Fri, 10 Apr 2026 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FoI9S/Om"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF2B3469E7
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 09:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811798; cv=none; b=YaQRPrxNwsMio8cppqCM8tIiuwiqlvkSGdObSMqQUmSHAtQftvjmBgEefaeDEGLgyWgE+bIa2Vp/h+hS+95xGkfLG07GtE7e4O1yxIWBz7FFG6PyFyBinhbeb/BCV405wiZC36EpkcRLhr6QZAD5oN0N+FHYRors6rszQ0UYYj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811798; c=relaxed/simple;
	bh=miCDnsrLroExrUZMsZ/95KI0Da3EvZsDYLWza0moqrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDvgzRraj2RxWDB+U6svsosKsPEldgX/XuozNnPs/zawAIYRQakXYbqe6Bp1MKff1KGKq+HDwn+CZbgW4mXknH2YStVfwdyIS6BInHPKKSpAtKGhrE+2lUkWG6TUUWIFfBbcsp8WCtd9WGPX45as8pK27X655xzg7M+dvvroS1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FoI9S/Om; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0C941C6;
	Fri, 10 Apr 2026 11:01:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811706;
	bh=miCDnsrLroExrUZMsZ/95KI0Da3EvZsDYLWza0moqrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FoI9S/OmAyLKrTnL6uWZwAKAvt2Q93U26bWlp7OKD8U8bW1Cz5b/bp+l7YByHEvEJ
	 cRxK8MejgQ+dEH+Zin4zi1q9Kwb5GsqWX+Cr57kZAe0I4YhdeE+vaSP0gVAgI5aiwT
	 VquxPUTSFWhdV0/CyrQuf45VW6UfahyTG77X9BO8=
Date: Fri, 10 Apr 2026 11:03:13 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	"Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 11/29] media: imx412: Remove redundant kernel-doc
 comments
Message-ID: <adi8xKefEIPdl6bG@zed>
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
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58503-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 0BEDE3D4774
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Wed, Apr 08, 2026 at 06:39:20PM +0300, Sakari Ailus wrote:
> Remove kernel-doc comments from regular callback functions. These comments
> have no information value.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

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
> --
> 2.47.3
>
>

