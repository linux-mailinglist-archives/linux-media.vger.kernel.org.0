Return-Path: <linux-media+bounces-58539-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBi/K2/Y2GlYjQgAu9opvQ
	(envelope-from <linux-media+bounces-58539-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 13:01:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE3F3D5EA8
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 13:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4AE4307F9DB
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0549D38C2B1;
	Fri, 10 Apr 2026 10:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gn+X97Be"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0C434572B
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775818430; cv=none; b=tcVsFXwVj1kJEEf5tvAsxudy+Z8JcWnsi9y3WcJORUWIv2vpju63FxRyqBwNp8tsikFkP/tgOddvBGelnKu/KMoDVgMVNwV6us/4NKOL/UVkyOiyT+8ZDBht0/28JuqFc3wWJzB8Z6x1/Dzv74NuHN/38TTtZqcthmeqQ/ffTmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775818430; c=relaxed/simple;
	bh=PpSxSy3nlvNtKU/PgG4upLMc+qNCsbLGIGylQFfS7Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPdyPXN9jiQar/1tdT43EqcUNofqVe6B8MHmztcLXd4yzgEp9aHmc+P9FdSud3JCaLm1sEmFyGEgvjExSEYJf5tq+9YTVgWfzRpVfjRyf81R83YtFjLYNeVeF8dxrLXCLmGfif1mYWxsHtghaO3tz8r3ii21Joe//cZoYiwPaVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gn+X97Be; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E91061E7;
	Fri, 10 Apr 2026 12:52:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775818336;
	bh=PpSxSy3nlvNtKU/PgG4upLMc+qNCsbLGIGylQFfS7Ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gn+X97BeAp6NznVtVVJezNPNhK/ibReWE9Mtk/ZIjoQI+1mHWOWKzl5aq+SheLiGa
	 5inv0mUOZffp89CqFsgyVDGOj1zUepV5/x9AZRFTP0UgusWa58FqmuBevrOVqKr0t4
	 /c64lCoH7eITDlOqCPy5Yl1OJc7raLuksV/cpRM8=
Date: Fri, 10 Apr 2026 12:53:42 +0200
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
Subject: Re: [PATCH v4 24/29] media: v4l2-subdev: Introduce
 v4l2_subdev_get_frame_desc()
Message-ID: <adjWaqk9qO7CWM5W@zed>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-25-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-25-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58539-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: CBE3F3D5EA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Wed, Apr 08, 2026 at 06:39:33PM +0300, Sakari Ailus wrote:
> Introduce v4l2_subdev_get_frame_desc() in order to facilitate implementing
> drivers that need frame descriptors. If the remote sub-device does not
> support frame descriptors, v4l2_subdev_get_frame_desc() creates one (with
> a single entry) opportunistically, thus avoiding the need to add frame
> descriptor support to sensor drivers the device for which only generates a
> single stream, or managing the situation on the caller side.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 96 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 20 ++++++
>  2 files changed, 116 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 647587c0499a..40b28e070726 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -20,6 +20,7 @@
>  #include <linux/version.h>
>  #include <linux/videodev2.h>
>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -2758,3 +2759,98 @@ void v4l2_subdev_put_privacy_led(struct v4l2_subdev *sd)
>  #endif
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_put_privacy_led);
> +
> +static int get_mipi_dt_for_mbus(u32 code)
> +{
> +	switch (code) {
> +	case MEDIA_BUS_FMT_BGR888_1X24:
> +		return MIPI_CSI2_DT_RGB888;
> +	case MEDIA_BUS_FMT_Y8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		return MIPI_CSI2_DT_RAW8;
> +	case MEDIA_BUS_FMT_Y10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +		return MIPI_CSI2_DT_RAW10;
> +	case MEDIA_BUS_FMT_Y12_1X12:
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +		return MIPI_CSI2_DT_RAW12;
> +	case MEDIA_BUS_FMT_Y14_1X14:
> +	case MEDIA_BUS_FMT_SBGGR14_1X14:
> +	case MEDIA_BUS_FMT_SGBRG14_1X14:
> +	case MEDIA_BUS_FMT_SGRBG14_1X14:
> +	case MEDIA_BUS_FMT_SRGGB14_1X14:
> +		return MIPI_CSI2_DT_RAW14;
> +	case MEDIA_BUS_FMT_Y16_1X16:
> +	case MEDIA_BUS_FMT_SBGGR16_1X16:
> +	case MEDIA_BUS_FMT_SGBRG16_1X16:
> +	case MEDIA_BUS_FMT_SGRBG16_1X16:
> +	case MEDIA_BUS_FMT_SRGGB16_1X16:
> +		return MIPI_CSI2_DT_RAW16;
> +	case MEDIA_BUS_FMT_SBGGR20_1X20:
> +	case MEDIA_BUS_FMT_SGBRG20_1X20:
> +	case MEDIA_BUS_FMT_SGRBG20_1X20:
> +	case MEDIA_BUS_FMT_SRGGB20_1X20:
> +		return MIPI_CSI2_DT_RAW20;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_frame_desc *desc)
> +{
> +	struct v4l2_subdev_format subdev_fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.pad = pad,
> +	};
> +	int ret;
> +
> +	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
> +		unsigned int type = desc->type;
> +
> +		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
> +
> +		if (desc->type != type)
> +			return -EINVAL;
> +
> +		return ret;
> +	}
> +
> +	if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL &&
> +	    desc->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> +		return -EINVAL;
> +
> +	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL,
> +			       &subdev_fmt);
> +	if (ret)
> +		return ret;
> +
> +	struct v4l2_mbus_frame_desc_entry entry = {
> +		.pixelcode = subdev_fmt.format.code,
> +	};
> +
> +	if (desc->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> +		int dt;
> +
> +		dt = get_mipi_dt_for_mbus(subdev_fmt.format.code);
> +		if (dt < 0)
> +			return dt;
> +
> +		entry.bus.csi2.dt = dt;
> +	}
> +
> +	desc->entry[0] = entry;
> +	desc->num_entries = 1;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc);
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 4588992b4417..93b672edd08e 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -2058,4 +2058,24 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
>   */
>  bool v4l2_subdev_is_streaming(struct v4l2_subdev *sd);
>
> +/**
> + * v4l2_subdev_get_frame_desc() - Get a pad's frame descriptor
> + * @sd: The sub-device
> + * @pad: The number of the pad in @sd from which to obtain the frame descriptor
> + * @desc: A pointer to a frame descriptor, with its type field set
> + *
> + * Obtain a frame descriptor from a sub-device. If the sub-device supports the
> + * get_frame_desc pad operation, its result is returned, just like calling it
> + * directly using v4l2_subdev_call(). If the sub-device driver does not support
> + * it, then one containing a single entry is created using the information from
> + * the sub-device active state, which this function locks for the duration of
> + * the call to obtain it.

This doesn't seem to apply anymore...

> + *
> + * The caller is required to set @desc->type to the expected bus type.

Is it worth mentioning that only V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL
and V4L2_MBUS_FRAME_DESC_TYPE_CSI2 are supported ?


> + *
> + * Return: %0 on success or negative error code on failure.
> + */
> +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_frame_desc *desc);

With the documentation addressed
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> +
>  #endif /* _V4L2_SUBDEV_H */
> --
> 2.47.3
>
>

