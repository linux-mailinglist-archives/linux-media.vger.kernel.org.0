Return-Path: <linux-media+bounces-61588-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMXeOkieBWr4YwIAu9opvQ
	(envelope-from <linux-media+bounces-61588-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:04:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E715401A4
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 678373026F11
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C628638A715;
	Thu, 14 May 2026 10:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eALjksVn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77B92848BA
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778752977; cv=none; b=bjMpddWCGUdfCeOWv8yK6TYvuu9xWYYO5BXfC9waKaZ4PZp+mGWMleBqH3EBY9xUSEFmkIzWcHmJdVySu/FNiSTuHJ/jSLjjEbi9kgox8nh/LhlUEpAYDXkUCD8eyIsBHDXfEn0bP8fo0ERvkhE8pPEHeRLF+PLXhGOCXSXeZ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778752977; c=relaxed/simple;
	bh=yWIOJUuMGrQOMmxMQRTqvmepFfzcMqZMYO+fH449U3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6s5zsvsIfQhWDbbSXeAPOUp9qjHHYGsDY49HohIGmD5/o8x1GG4e++GOAho3zvcl/EckzjcwCLIMSmdFcC/TDK2h+7YLK+WuzM88gB6o1vhRgGzSUBG5xCPVc8+sPihQS0gs+ZQcQpoBvazdXFP3slu3bNdpV/pf76Mya4atFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eALjksVn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A67056D;
	Thu, 14 May 2026 12:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778752964;
	bh=yWIOJUuMGrQOMmxMQRTqvmepFfzcMqZMYO+fH449U3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eALjksVnQ1nHIxR+nbOyrtqnwHbhWP9Gq0b/lpMtcRJFeJkXGo9cE1J/QidZh8ZIc
	 tT2NWPwr3a2WIwUKSazI3vdCkvjaExLt/DRgHfcuK0lVDOkCFfSwiYb0b1/I+ahcHz
	 Ds64j5kGg88a7O5t4WFrM+yboG84ovF1xAfZqgXQ=
Date: Thu, 14 May 2026 12:02:50 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 03/17] media: v4l2-subdev: Prepare for changes in getting
 frame descriptors
Message-ID: <agWctBkdQDzXAmh5@zed>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
 <20260513104358.2252605-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513104358.2252605-4-sakari.ailus@linux.intel.com>
X-Rspamd-Queue-Id: 54E715401A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61588-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Hi Sakari

On Wed, May 13, 2026 at 01:43:44PM +0300, Sakari Ailus wrote:
> Introduce v4l2_subdev_alloc_frame_desc() and v4l2_subdev_free_frame_desc()
> to both facilitate implementing drivers that need frame descriptors as
> well as prepare for having a larger number of frame descriptors.

As noticed by Frank, this line doesn't seem to match the patch content

> If the remote sub-device does not support frame descriptors,
> v4l2_subdev_get_frame_desc() creates one (with a single entry)
> opportunistically, thus avoiding the need to add frame descriptor support
> to sensor drivers the device for which only generates a single stream, or
> managing the situation on the caller side.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 59 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 20 +++++++++
>  2 files changed, 79 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index d93ed50255ed..b8acce8f9c33 100644
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
> @@ -2671,6 +2672,64 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough);
>
> +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_frame_desc *desc)
> +{
> +	struct v4l2_subdev_format subdev_fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.pad = pad,
> +	};
> +	int ret;

is it worth being extra paranoid and add an

        if (WARN_ON(!desc))
                return -EINVAL;

here ?

And make immediately sure that desc->type is populated by checking for

        if (desc->type == V4L2_MBUS_FRAME_DESC_TYPE_UNDEFINED)
                return -EINVAL;

or is passing UNDEFINED in supported ?

> +
> +	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
> +		unsigned int type = desc->type;
> +
> +		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
> +		if (ret)
> +			return ret;
> +
> +		if (desc->type != type) {
> +			dev_dbg(sd->dev,
> +				"wrong type of frame descriptor for pad %d (got %u, expected %u)\n",
> +				pad, desc->type, type);
> +			return -EINVAL;
> +		}
> +
> +		return ret;

You can return 0;

> +	}
> +
> +	if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL &&
> +	    desc->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> +		return -EINVAL;
> +
> +	struct v4l2_subdev_state *state =
> +		v4l2_subdev_lock_and_get_active_state(sd);
> +	ret = v4l2_subdev_call(sd, pad, get_fmt, state, &subdev_fmt);
> +	v4l2_subdev_unlock_state(state);
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
> +		dt = mipi_csi2_dt_for_mbus(subdev_fmt.format.code);
> +		if (dt < 0)
> +			return dt;
> +
> +		entry.bus.csi2.dt = dt;
> +	}
> +
> +	desc->entry[0] = entry;

Can't you populate desc->entry[0] directly and avoid a copy ?

> +	desc->num_entries = 1;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc);
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d256b7ec8f84..c9e74566c85a 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1778,6 +1778,26 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  					   unsigned int pad,
>  					   struct v4l2_mbus_frame_desc *fd);
>
> +/**
> + * v4l2_subdev_get_frame_desc() - Get a frame descriptor for a pad
> + * @sd: The sub-device
           The -remote- sub-device ?

> + * @pad: The number of the pad in @sd from which to obtain the frame descriptor
> + * @desc: A pointer to a frame descriptor, with its type field set
> + *
> + * Obtain a frame descriptor from a sub-device. If the sub-device supports the
> + * get_frame_desc pad operation, its result is returned, just like calling it
> + * directly using v4l2_subdev_call(). If the sub-device driver does not support
> + * it, then a frame descriptor containing a single entry is created using the
> + * information from the sub-device format for types
> + * V4L2_MBUS_FRAME_DESC_TYPE_CSI2 and V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL.
> + *
> + * The caller is required to set @desc->type to the expected bus type.
> + *
> + * Return: %0 on success or negative error code on failure.
> + */
> +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_frame_desc *desc);
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> --
> 2.47.3
>
>

