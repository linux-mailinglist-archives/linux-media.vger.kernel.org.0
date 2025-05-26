Return-Path: <linux-media+bounces-33375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D1FAC3F24
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 14:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0838B3A3C09
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 12:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF6D1FECBA;
	Mon, 26 May 2025 12:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YKCETNB5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8458C1F5619;
	Mon, 26 May 2025 12:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748261643; cv=none; b=GCGio/jU3pA5MGt/p3sEDfOQz/tFVniHJkoW7Nvo9QHWiDI7zg+AF+5IKxpadv+gTUXTrCRGY39Ya2VFtrYXDGvJiG4lwKI9QHQaJ9vVrNEVpdKmgQOtIASd6SfTWTt9+ImZM9leYYkGeVz8weWtl2Gcek+8gkwpIeoVRLK7Kds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748261643; c=relaxed/simple;
	bh=f+xq8YG0asKr+yzADyfPtfiglKdK/kQYPtTCJ4mDz/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOaSL7QNMsgA6pcrJpTOhM3pK0RAEnl8v/CLSveN/7dqdj9Yb2HcKdXPB5l+3P/zvvBkvfJCDV1TZYZMTTGqxJ3dv2Tsul8Ykv5vWgcfksJrthALmUn+e0NibY5TwAYaNVQ6oRokrDfJi4xygDe4rxWDc+FHQYNDBROH95PHuH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YKCETNB5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D79627E6;
	Mon, 26 May 2025 14:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748261615;
	bh=f+xq8YG0asKr+yzADyfPtfiglKdK/kQYPtTCJ4mDz/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKCETNB5JI46Ujgv3ggecBeD19hX8cMkpefuQKbexm4+Z+RUxwPCfy9vheRgHj9h8
	 W9Riw11PSCyfJcZWi9ytnRZzyMU4LllEmue6EM1S416f9hx2oIOfyRxzeKhLbrwhhx
	 fVqDau7GeCini5W+zIxHyrvLkZC6YzYLOaq3dnFE=
Date: Mon, 26 May 2025 14:13:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com, mathis.foerst@zuehlke.com
Subject: Re: [PATCH v6 5/7] media: mt9m114: Allow set_selection while
 streaming
Message-ID: <20250526121353.GG17743@pendragon.ideasonboard.com>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
 <20250522143512.112043-6-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522143512.112043-6-mathis.foerst@mt.com>

Hi Mathis,

Thank you for the patch.

On Thu, May 22, 2025 at 04:35:09PM +0200, Mathis Foerst wrote:
> The current implementation does not apply changes to the crop-
> configuration of the sensor immediately if the sensor is in
> streaming state. The user has to stop and restart the stream for
> the changes to be applied.
> This can be undesirable e.g. in a calibration usecase where the user
> wants to see the impact of his changes in a live video stream.
> Under the condition that the width & height of the cropped image area
> does not change, the changed cropping configuration can be applied to
> the pixel-array immediately without disturbing the IFP.
> 
> Call mt9m114_configure_pa() in mt9m114_pa_set_selection() if the sensor is
> in streaming state and the size of the cropping rectangle didn't change,
> issue a CONFIG_CHANGE to apply the changes immediately.
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> ---
>  drivers/media/i2c/mt9m114.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 7d39978835fe..e909c1227e51 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -1301,11 +1301,14 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
>  	struct mt9m114 *sensor = pa_to_mt9m114(sd);
>  	struct v4l2_mbus_framefmt *format;
>  	struct v4l2_rect *crop;
> +	struct v4l2_rect old_crop;
> +	int ret = 0;
>  
>  	if (sel->target != V4L2_SEL_TGT_CROP)
>  		return -EINVAL;
>  
>  	crop = v4l2_subdev_state_get_crop(state, sel->pad);
> +	old_crop = *crop;
>  	format = v4l2_subdev_state_get_format(state, sel->pad);
>  
>  	/*
> @@ -1331,10 +1334,25 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
>  	format->width = crop->width;
>  	format->height = crop->height;
>  
> -	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> -		mt9m114_pa_ctrl_update_blanking(sensor, format);
> +	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> +		return ret;
>  
> -	return 0;
> +	mt9m114_pa_ctrl_update_blanking(sensor, format);
> +
> +	/*
> +	 * Apply values immediately if streaming and the selection size did not
> +	 * change.
> +	 */
> +	if (sensor->streaming && old_crop.height == crop->height &&
> +	    old_crop.width == crop->width) {

Changing the width or height of the active crop rectangle should be
disallowed completely during streaming. mt9m114_pa_set_selection().
should return -EBUSY in that case.

> +		ret = mt9m114_configure_pa(sensor, state);
> +		if (ret)
> +			return ret;
> +		// Changing the cropping config requires a CONFIG_CHANGE
> +		ret = mt9m114_set_state(sensor,	MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> +	}
> +
> +	return ret;
>  }
>  
>  static const struct v4l2_subdev_pad_ops mt9m114_pa_pad_ops = {

-- 
Regards,

Laurent Pinchart

