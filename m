Return-Path: <linux-media+bounces-58502-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N6eNMi82GlVhggAu9opvQ
	(envelope-from <linux-media+bounces-58502-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:03:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEB73D4765
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DBED3010491
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA4A3B19B0;
	Fri, 10 Apr 2026 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SDay5saN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E23A5E7E
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811782; cv=none; b=UYX32bvFdzGBXL4r/c+tuQpW8V7Mk2lom8XOuUVqY27rCn2HnNSIXaoqbOAYl/7a66u+wp8ZIxoZuGBCdH8ylH8O578oh33c2Spw0Ihz9dG+YsA9IldRiqUMrO64aIzdhU33+KavYfD6fsIC+fb43cMq94kJJYstqbLEqStn7MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811782; c=relaxed/simple;
	bh=QyALKt83D55DvctuwtkXY994N3bRyD7+G/JzFUXVqOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IP34AHpXN5vsgISeY78Dhcif7iw1GOnRzTueKNmWRrMwZjZeFBBOhz/pNYDU+iFe09aAgAH6x1KQb0kl+ENvggC/3+fCpe7yK+jzt7vemrl0m2Ob8IE7g1DdZsTW91+kJNz7JFIT/SwwH6xRbWIC2Z8rG18s6ipeT2TscHRLixM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SDay5saN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A25101C6;
	Fri, 10 Apr 2026 11:01:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811689;
	bh=QyALKt83D55DvctuwtkXY994N3bRyD7+G/JzFUXVqOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SDay5saN9E7fqL8RqTPcl0X+0gxQ4Ee9d7/QrG1eyCDVBZBmPUTjsiiCL5gi/1co0
	 HXln3X1u0GQdaZzHgIzdY9/L4aZ0dDgDlBb3zDrmEkM4n+g+bvgLTUF8nGkwh2Jqr4
	 nfNURWhPfHNxMjDHovn5g3A187k+iqRLAp69pkKY=
Date: Fri, 10 Apr 2026 11:02:56 +0200
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
Subject: Re: [PATCH v4 10/29] media: imx335: Remove redundant kernel-doc
 comments
Message-ID: <adi8tB-gLoYDcr8U@zed>
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
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58502-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,ideasonboard.com:dkim,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4BEB73D4765
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Wed, Apr 08, 2026 at 06:39:19PM +0300, Sakari Ailus wrote:
> Remove kernel-doc comments from regular callback functions. These comments
> have no information value.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

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
> --
> 2.47.3
>
>

