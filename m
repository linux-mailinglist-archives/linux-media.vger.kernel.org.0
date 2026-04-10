Return-Path: <linux-media+bounces-58501-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KALXJrm82GlVhggAu9opvQ
	(envelope-from <linux-media+bounces-58501-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:02:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F36C13D475D
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC7A13010140
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D65D3AE1A9;
	Fri, 10 Apr 2026 09:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O6aqfBjf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765433A3E91
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811763; cv=none; b=Enps0itDKb/P8vXIGRSrgYYZFEYfSQsFrIkCB91fkJ7dRF1g30d2CyNULQTCcQEc2EW1xSAEPgWRmP/oPLO349iy6B/FdnkkE56VUG4LegOPzaefLqaWXOaEJaF5WQmp5FyRCPykSQOUSoU3CmTqz6XBZhPN9Hf4HKUkcdutYIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811763; c=relaxed/simple;
	bh=kO7MvhVbMx7aovqZdkfWOvKWlzoj89MHiJGnbgZ5fWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPC7GOKqMdLFLY436EXe1QrZ2cojzNe0u0SuVTYOz+LtJ8WXUTqlEwrOIJfNBlnzF4oQ6VSNddcLd17Rr6WO34eqoTQGrxYlDa+LCrpoFiSKPeQZBj9he1M23gO0f2soqxDSRrvUzLUnVz9x9UzG+extbK5k0Z+HMHzX2G1ySxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O6aqfBjf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AA281BA;
	Fri, 10 Apr 2026 11:01:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811671;
	bh=kO7MvhVbMx7aovqZdkfWOvKWlzoj89MHiJGnbgZ5fWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6aqfBjf8PgPKKVibiPXiTIB8EspiuFcHydCsZ+AovITWcgJ63zwx+3kpjo711X68
	 1HJTSPPW3mUJ/uwlBCFktMZ+yZBzLYiQ/Bz1cajb8rLd/k28UKkFPGDRJ/L0zDdwk9
	 m1hOG3lLA8vv41wNB1xUesGqknNW49ATRz5xprW8=
Date: Fri, 10 Apr 2026 11:02:37 +0200
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
Subject: Re: [PATCH v4 09/29] media: imx334: Remove redundant kernel-doc
 comments
Message-ID: <adi8ortNix1C4uld@zed>
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
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58501-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: F36C13D475D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Wed, Apr 08, 2026 at 06:39:18PM +0300, Sakari Ailus wrote:
> Remove kernel-doc comments from regular callback functions. These comments
> have no information value.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

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
> --
> 2.47.3
>
>

