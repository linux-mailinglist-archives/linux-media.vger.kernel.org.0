Return-Path: <linux-media+bounces-58525-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K60CKLA2Gk4hwgAu9opvQ
	(envelope-from <linux-media+bounces-58525-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:19:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 777D73D4A4A
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D9A8311DD21
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBC63BB9F4;
	Fri, 10 Apr 2026 09:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DO5mI3/1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62DB312825
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 09:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812120; cv=none; b=iugxAYUCBfbBf+JeUmERpIH7/WZgvH8m8LTWUtEp31rTcXkdbAARYSUHhKvPvNFPDDsgyDGStnVM+hJO2woZFzIuokbhQQKj24F7M6zANQJ3l2A9SN0b6S7gq1uAu5SE0Jo46SaBB+R3/u9CDxpWZB3Arwo4y0E8ouY1WdMu5dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812120; c=relaxed/simple;
	bh=BT6KXRNB12twSFP+yZI1TKSUFEt1fd8nzIWcEE0lEtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWeGZrueDRsx7YG72u/cNZh4/ZUBbJxuQLmVCNvW8D/iBivNmojNzEi+paX8Z/wT/Uv57/nIa52Xka/wjyuOf38b64w2zRViOitpiuLroMWBPviPexT2IkdzDvEeo9ncaiVr21iguhSddckm14AS9Eyv/N4UXXfMvFcMwFJHjkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DO5mI3/1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A442225;
	Fri, 10 Apr 2026 11:07:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775812028;
	bh=BT6KXRNB12twSFP+yZI1TKSUFEt1fd8nzIWcEE0lEtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DO5mI3/1xgDU/5V2rYW1e+ui7uc4dbojTF3jEiNGMQpKyWdo5FZM2aYo46Rel4Kn1
	 9dL9gShaKVR+rwjXMhLcwJWJxT+UQqviPj1G/DEv9FMm2jlJsOohzM4HKD6yhkUt1o
	 nr0YuAHIuftvqpkO5BmDolGLZuoqk4Qkw/ILQecE=
Date: Fri, 10 Apr 2026 11:08:35 +0200
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
Subject: Re: [PATCH v4 13/29] media: tvp514x: Remove redundant kernel-doc
 comments
Message-ID: <adi-B7tSo8FCnWJ4@zed>
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
	TAGGED_FROM(0.00)[bounces-58525-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 777D73D4A4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Wed, Apr 08, 2026 at 06:39:22PM +0300, Sakari Ailus wrote:
> Remove kernel-doc comments from regular callback functions. These comments
> have no information value.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

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
> --
> 2.47.3
>
>

