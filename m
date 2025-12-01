Return-Path: <linux-media+bounces-47979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A11DC98120
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 16:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 70E0C4E1E0B
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 15:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56723321D3;
	Mon,  1 Dec 2025 15:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="clywZ3Y0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7521F03C5;
	Mon,  1 Dec 2025 15:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764603427; cv=none; b=YUvmc31jxXwclDOyMfdjlkbRyWtyQ0WuQSH4SMZUrz1bOAvIuxn0wlfuoCbJ/5wkLbS+x6WZ/wvs5/fMhliVsrDrL/tQw9a/QmIbd9vGFDsY2VbEN/jsBeXVzcp9Mt4n8E+kXAFqxcbSdsKrUfdShqJCShBEAgA5Th9Fm2tTb6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764603427; c=relaxed/simple;
	bh=9/FYSpQaoNEKEWIu/JrUdpJenTgLCKGyjIFaFx+tmKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yc5iUyOLVduKpP/bO5lOOxVPN97KmYFGesOCp6HBT3Eg5JiqSvdShVZscaXJWzc9ZpVgIdFATAWeZ9RnTnEbQEMkLmyggBEme0AWRQrE3g0nS6oIu1/shq0NPVE2+QQjaObm7OUXzr8GQfu8L6xdUMergpp+H0l5pcWysUra+pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=clywZ3Y0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3815D110;
	Mon,  1 Dec 2025 16:34:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764603288;
	bh=9/FYSpQaoNEKEWIu/JrUdpJenTgLCKGyjIFaFx+tmKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=clywZ3Y0LbdKhnEQrJnJwFkBhBmlqs+IhzQNnXZcCKR5QgB0RGyJaHy3X32Cu6XjB
	 rD5s1vZ4ACrSVj7jzSf6j5/Zk69zlqyWiQHRsyKux5kGyDi8zB0zMXAoXKfFBgx76i
	 04VAbilweeWh19lo3/8WdlH39KJDqxRHK2iFYyhg=
Date: Mon, 1 Dec 2025 16:36:58 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Naushir Patuck <naush@raspberrypi.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Robinson <pbrobinson@gmail.com>, 
	Stefan Wahren <wahrenst@gmx.net>, "Ivan T. Ivanov" <iivanov@suse.de>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 15/16] media: i2c: ov5647: Tidy up PIXEL_RATE control
Message-ID: <i4wtzq6y4h4em2qr2qic636d26dszq2efon547kjz3rifxix3j@k3bmjmgvrd4t>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
 <20251118-b4-rpi-ov5647-v2-15-5e78e7cb7f9b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118-b4-rpi-ov5647-v2-15-5e78e7cb7f9b@ideasonboard.com>

Hi Jai

On Tue, Nov 18, 2025 at 05:33:08PM +0530, Jai Luthra wrote:
> The pixel rate control is marked as read-only by the framework itself,
> so no need to mark it explicitly in the driver. Also, we can set the ops
> to NULL to avoid checking for it in the s_ctrl implementation.
>
> Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/i2c/ov5647.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 3a2c25a6b6808bf1289a2357ac5b79bf6bf99daa..71107d74f2900b39233a52b29a229282bd087963 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1195,12 +1195,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
>  				   ov5647_test_pattern_val[ctrl->val]);
>  		break;
> -
> -	/* Read-only, but we adjust it based on mode. */
> -	case V4L2_CID_PIXEL_RATE:
> -		/* Read-only, but we adjust it based on mode. */
> -		break;
> -
>  	case V4L2_CID_HFLIP:
>  		/* There's an in-built hflip in the sensor, so account for that here. */
>  		ov5647_s_flip(sd, OV5647_REG_TIMING_TC_H, !ctrl->val);
> @@ -1267,7 +1261,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>  			  V4L2_CID_ANALOGUE_GAIN, 16, 1023, 1, 32);
>
>  	/* By default, PIXEL_RATE is read only, but it does change per mode */
> -	sensor->pixel_rate = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> +	sensor->pixel_rate = v4l2_ctrl_new_std(&sensor->ctrls, NULL,
>  					       V4L2_CID_PIXEL_RATE,
>  					       sensor->mode->pixel_rate,
>  					       sensor->mode->pixel_rate, 1,
> @@ -1306,7 +1300,6 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>  	if (sensor->ctrls.error)
>  		goto handler_free;
>
> -	sensor->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  	sensor->sd.ctrl_handler = &sensor->ctrls;
>
>  	return 0;
>
> --
> 2.51.1
>

