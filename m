Return-Path: <linux-media+bounces-33888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFE7ACABC3
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 11:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8B1E3BD343
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 09:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5791EB9FD;
	Mon,  2 Jun 2025 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LL6sGAV9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECE91E285A;
	Mon,  2 Jun 2025 09:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748857460; cv=none; b=AQru07FRBC3MUjC4TH6WdvLoLJiROI2wUa9dvevhoYLw8zWNjV++/34NaQQL5Q/qBw5XhA2KCbrnCST7Vhq99+PMRWR4gzKrQXwtlb69bY55cTX/k9b2hDtAPTHhHTfdOvlvxPizQIXUFYdDAdvQMII96ObPjwDO/YG7oGnH4G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748857460; c=relaxed/simple;
	bh=uIw5FT+oSLAsNqOjmaUd1W4Or0NVYECduE24Avljrtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tfd3NgeBaDdH19axUnD/UQj1U8EOoG3bB3DF7OrR0vQYL+gRbCyD7bKg3gZmzN7pLGkGuOqpGxM6hTj/6nLqOZATSyAxQid6ydUCizXymflfvshvtw4xHV77oxFLvLvpUvewUbyAEArw9vCSm3WY4SVNbhRQrL5DKkVVhU0Cxks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LL6sGAV9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09F26379;
	Mon,  2 Jun 2025 11:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748857456;
	bh=uIw5FT+oSLAsNqOjmaUd1W4Or0NVYECduE24Avljrtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LL6sGAV9QnlbAgq4O3j81FkvgfHIjbw73X32i1z/q5RX0kxkN4lhXf8NVXat/Dcii
	 5Yt9IO99oAyQUBlB9FhVH6h3RSlLwmcckEgYkfAJH+k8oEM9zQKD0f3f4hoGaYSq3Z
	 s7pqRnMIDzaZmgqoBdMMH+xzvdp7UDA7iNnSNiTI=
Date: Mon, 2 Jun 2025 12:44:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 10/15] media: rcar-csi2: Add .get_frame_desc op
Message-ID: <20250602094409.GI3645@pendragon.ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-10-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-rcar-streams-v3-10-026655df7138@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, May 30, 2025 at 04:50:39PM +0300, Tomi Valkeinen wrote:
> Add v4l2_subdev_pad_ops.get_frame_desc() implementation.
> 
> We also implement a fallback for the case where the upstream subdevice
> does not implement .get_frame_desc. It assumes a single stream with VC =
> 0 and DT based on the configured stream mbus format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 56 ++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 20bd44274bd2..65c7f3040696 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1676,12 +1676,68 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
> +					 unsigned int pad,
> +					 struct v4l2_mbus_frame_desc *fd)
> +{
> +	const struct rcar_csi2_format *format;
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_mbus_framefmt *fmt;
> +	int ret = 0;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);

This reminds me we should pass the state to the .get_frame_desc()
operation.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +
> +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
> +	if (!fmt) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	format = rcsi2_code_to_fmt(fmt->code);
> +	if (!format) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	fd->num_entries = 1;
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	fd->entry[0].stream = 0;
> +	fd->entry[0].pixelcode = fmt->code;
> +	fd->entry[0].bus.csi2.vc = 0;
> +	fd->entry[0].bus.csi2.dt = format->datatype;
> +
> +out:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
> +static int rcsi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct rcar_csi2 *priv = sd_to_csi2(sd);
> +	int ret;
> +
> +	if (WARN_ON(!priv->info->use_isp))
> +		return -ENOTTY;
> +
> +	if (WARN_ON(pad != RCAR_CSI2_SOURCE_VC0))
> +		return -EINVAL;
> +
> +	ret = v4l2_subdev_get_frame_desc_passthrough(sd, pad, fd);
> +	if (ret == -ENOIOCTLCMD)
> +		ret = rcsi2_get_frame_desc_fallback(sd, pad, fd);
> +	return ret;
> +}
> +
>  static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
>  	.enable_streams = rcsi2_enable_streams,
>  	.disable_streams = rcsi2_disable_streams,
>  
>  	.set_fmt = rcsi2_set_pad_format,
>  	.get_fmt = v4l2_subdev_get_fmt,
> +
> +	.get_frame_desc = rcsi2_get_frame_desc,
>  };
>  
>  static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {

-- 
Regards,

Laurent Pinchart

