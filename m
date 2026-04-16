Return-Path: <linux-media+bounces-58914-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLaRNunx4GkZnwAAu9opvQ
	(envelope-from <linux-media+bounces-58914-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:27:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BD240F8F5
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56DB130474C0
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 14:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D763DFC61;
	Thu, 16 Apr 2026 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f0CfC+Gz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4249C3DEFE6
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 14:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349668; cv=none; b=e3j8lD+EbgMoHx+6AMj9FDqUeGHwzQN6+vpq/ll/yzjHUxFiXszf1LQ7lAoRusDqy7n8bFMi2oFd/SoWYQ26t06AHRKylXHROmHuqgSMfBaqkF1sh9AR4Z4shWTfS7gm4gx78kqolgdHWx+hHl9Has/7E6j6xCNATVAQ5kGiRMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349668; c=relaxed/simple;
	bh=aSZkr1QpCgEBOC6GO7aD4jznEwUa5hfkbp6K8c+o1AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TM+CatIJ4LfZtolbja0eBUsvlrVCC9cU/IxoUjLVP8Nn2Oycmz1UAdDWBPT1ddiIV/fjDiy65SRlmBdRQ3NN6s8jBCrazGGV1C9dQMzjmC7PUNOCNV5BxJ1vLm9egeIh76dhtH3LjVMlQm0bznbB/3JLOXNvTIrtd2cCQiIzW1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f0CfC+Gz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F1125132;
	Thu, 16 Apr 2026 16:26:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776349571;
	bh=aSZkr1QpCgEBOC6GO7aD4jznEwUa5hfkbp6K8c+o1AA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f0CfC+Gzyf8Xlh820GDPufVkT50cyTBIEMPHWI8KmS3zU5csGiLRdevwLRZ/qibK8
	 /23F4iwG3xrEmyarKyjylqiLXPx2hAGJuytc1bFhTCj5sMmHcmEzifxnXKCtQBxTTl
	 w283VwqHY1pYDtDjkHYBJE1WFktxzu1ZTuyL5ZRM=
Date: Thu, 16 Apr 2026 17:27:43 +0300
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
Subject: Re: [PATCH v4 10/29] media: imx335: Remove redundant kernel-doc
 comments
Message-ID: <20260416142743.GH1775831@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-11-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-11-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58914-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 43BD240F8F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 06:39:19PM +0300, Sakari Ailus wrote:
> Remove kernel-doc comments from regular callback functions. These comments
> have no information value.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/imx335.c | 87 --------------------------------------
>  1 file changed, 87 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index 5790aa4fabeb..1f777a1a8192 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -698,18 +698,6 @@ static int imx335_update_test_pattern(struct imx335 *imx335, u32 pattern_index)
>  	return ret;
>  }
>  
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
>  static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct imx335 *imx335 =
> @@ -800,14 +788,6 @@ static int imx335_get_format_code(struct imx335 *imx335, u32 code)
>  	return imx335_mbus_codes[0];
>  }
>  
> -/**
> - * imx335_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
> - * @sd: pointer to imx335 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @code: V4L2 sub-device code enumeration need to be filled
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx335_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
> @@ -820,14 +800,6 @@ static int imx335_enum_mbus_code(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -/**
> - * imx335_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
> - * @sd: pointer to imx335 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @fsize: V4L2 sub-device size enumeration need to be filled
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx335_enum_frame_size(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_frame_size_enum *fsize)
> @@ -871,14 +843,6 @@ static void imx335_fill_pad_format(struct imx335 *imx335,
>  	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
>  }
>  
> -/**
> - * imx335_set_pad_format() - Set subdevice pad format
> - * @sd: pointer to imx335 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @fmt: V4L2 sub-device format need to be set
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx335_set_pad_format(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_format *fmt)
> @@ -923,13 +887,6 @@ static int imx335_set_pad_format(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> -/**
> - * imx335_init_state() - Initialize sub-device state
> - * @sd: pointer to imx335 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx335_init_state(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_state *sd_state)
>  {
> @@ -947,14 +904,6 @@ static int imx335_init_state(struct v4l2_subdev *sd,
>  	return imx335_set_pad_format(sd, sd_state, &fmt);
>  }
>  
> -/**
> - * imx335_get_selection() - Selection API
> - * @sd: pointer to imx335 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @sel: V4L2 selection info
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx335_get_selection(struct v4l2_subdev *sd,
>  				struct v4l2_subdev_state *sd_state,
>  				struct v4l2_subdev_selection *sel)
> @@ -1011,15 +960,6 @@ static int imx335_set_framefmt(struct imx335 *imx335)
>  	return ret;
>  }
>  
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
>  				 struct v4l2_subdev_state *state, u32 pad,
>  				 u64 streams_mask)
> @@ -1097,15 +1037,6 @@ static int imx335_enable_streams(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
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
>  				  struct v4l2_subdev_state *state, u32 pad,
>  				  u64 streams_mask)
> @@ -1299,12 +1230,6 @@ static int imx335_power_on(struct device *dev)
>  	return ret;
>  }
>  
> -/**
> - * imx335_power_off() - Sensor power off sequence
> - * @dev: pointer to i2c device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx335_power_off(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> @@ -1430,12 +1355,6 @@ static int imx335_init_controls(struct imx335 *imx335)
>  	return 0;
>  }
>  
> -/**
> - * imx335_probe() - I2C client device binding
> - * @client: pointer to i2c client device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int imx335_probe(struct i2c_client *client)
>  {
>  	struct imx335 *imx335;
> @@ -1530,12 +1449,6 @@ static int imx335_probe(struct i2c_client *client)
>  	return ret;
>  }
>  
> -/**
> - * imx335_remove() - I2C client device unbinding
> - * @client: pointer to I2C client device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static void imx335_remove(struct i2c_client *client)
>  {
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);

-- 
Regards,

Laurent Pinchart

