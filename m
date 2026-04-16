Return-Path: <linux-media+bounces-58917-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLyzN03y4GkZnwAAu9opvQ
	(envelope-from <linux-media+bounces-58917-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:29:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA9040F92A
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 618B830616FD
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 14:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977A33E0234;
	Thu, 16 Apr 2026 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q4231RuX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C203C65F2
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 14:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349742; cv=none; b=qb18KzYheP+C6hHJdLRRAHLqaZQA4a0k+CrKLJ3ZJmmdS1dZzB0cwnUWzXlI2nO9QMyO3mlDC5k1SLU9HnDpzKrunomv4UVb0RDD28tJD71ac6KElMArLPveDIMY+zKYB0nDM0yoP8x3bPnXmARsg0bZdzj744n8qzzx7P+umCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349742; c=relaxed/simple;
	bh=FdQCGant0h0l1dTZFtaZ+KHZ+HkMeDjpbGIdnByOwFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrHPjkdUIsmV/JdF8aQyfVUrBnk7DK2YCWrWJF0p5hx5IrUy7jUHr96zBXtqgiCgwfrlXF5nudl2qvmZ3yfBDglH6w3IddzzVZ6ei1v0xmNtF37vJiH49zr8vIFTXL3lbhAY6Fi3ZRtfVxJOKDVr4RH4cfPNM9x0WhLeY0lJTIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q4231RuX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 33F57132;
	Thu, 16 Apr 2026 16:27:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776349645;
	bh=FdQCGant0h0l1dTZFtaZ+KHZ+HkMeDjpbGIdnByOwFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q4231RuXKJveI5+DOOve2h2yev+XcuMi/0D/hxH7D1FmhEc6EBiChQdSmlm0+ZF0t
	 X2cUp6MiMT1zIpgIOmyxxxgFfyZzVoXRxD5qYaK4nsI+Ntf2kGAPAA2Rrg3panYD3X
	 xdiNmGVNB175dyKxoDHKbqE85fsxN4PcZWKsj0dk=
Date: Thu, 16 Apr 2026 17:28:58 +0300
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
Subject: Re: [PATCH v4 13/29] media: tvp514x: Remove redundant kernel-doc
 comments
Message-ID: <20260416142858.GK1775831@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-14-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-14-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58917-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 5BA9040F92A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 06:39:22PM +0300, Sakari Ailus wrote:
> Remove kernel-doc comments from regular callback functions. These comments
> have no information value.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/tvp514x.c | 55 +------------------------------------
>  1 file changed, 1 insertion(+), 54 deletions(-)
> 
> diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
> index f9c9c80c33ac..7af8f37646d6 100644
> --- a/drivers/media/i2c/tvp514x.c
> +++ b/drivers/media/i2c/tvp514x.c
> @@ -686,13 +686,6 @@ static int tvp514x_s_routing(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -/**
> - * tvp514x_s_ctrl() - V4L2 decoder interface handler for s_ctrl
> - * @ctrl: pointer to v4l2_ctrl structure
> - *
> - * If the requested control is supported, sets the control's current
> - * value in HW. Otherwise, returns -EINVAL if the control is not supported.
> - */
>  static int tvp514x_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct v4l2_subdev *sd = to_sd(ctrl);
> @@ -789,13 +782,6 @@ tvp514x_set_frame_interval(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -/**
> - * tvp514x_s_stream() - V4L2 decoder i/f handler for s_stream
> - * @sd: pointer to standard V4L2 sub-device structure
> - * @enable: streaming enable or disable
> - *
> - * Sets streaming to enable or disable, if possible.
> - */
>  static int tvp514x_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	int err = 0;
> @@ -850,14 +836,6 @@ static const struct v4l2_ctrl_ops tvp514x_ctrl_ops = {
>  	.s_ctrl = tvp514x_s_ctrl,
>  };
>  
> -/**
> - * tvp514x_enum_mbus_code() - V4L2 decoder interface handler for enum_mbus_code
> - * @sd: pointer to standard V4L2 sub-device structure
> - * @sd_state: subdev state
> - * @code: pointer to v4l2_subdev_mbus_code_enum structure
> - *
> - * Enumertaes mbus codes supported
> - */
>  static int tvp514x_enum_mbus_code(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_mbus_code_enum *code)
> @@ -877,14 +855,6 @@ static int tvp514x_enum_mbus_code(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -/**
> - * tvp514x_get_pad_format() - V4L2 decoder interface handler for get pad format
> - * @sd: pointer to standard V4L2 sub-device structure
> - * @sd_state: subdev state
> - * @format: pointer to v4l2_subdev_format structure
> - *
> - * Retrieves pad format which is active or tried based on requirement
> - */
>  static int tvp514x_get_pad_format(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_format *format)
> @@ -909,14 +879,6 @@ static int tvp514x_get_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -/**
> - * tvp514x_set_pad_format() - V4L2 decoder interface handler for set pad format
> - * @sd: pointer to standard V4L2 sub-device structure
> - * @sd_state: subdev state
> - * @fmt: pointer to v4l2_subdev_format structure
> - *
> - * Set pad format for the output pad
> - */
>  static int tvp514x_set_pad_format(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_format *fmt)
> @@ -1014,15 +976,7 @@ tvp514x_get_pdata(struct i2c_client *client)
>  	return pdata;
>  }
>  
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
>  	struct tvp514x_platform_data *pdata = tvp514x_get_pdata(client);
>  	struct tvp514x_decoder *decoder;
> @@ -1113,13 +1067,6 @@ tvp514x_probe(struct i2c_client *client)
>  	return ret;
>  }
>  
> -/**
> - * tvp514x_remove() - decoder driver i2c remove handler
> - * @client: i2c driver client device structure
> - *
> - * Unregister decoder as an i2c client device and V4L2
> - * device. Complement of tvp514x_probe().
> - */
>  static void tvp514x_remove(struct i2c_client *client)
>  {
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);

-- 
Regards,

Laurent Pinchart

