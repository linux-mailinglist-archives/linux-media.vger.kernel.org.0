Return-Path: <linux-media+bounces-41933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3203EB47E31
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 22:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E619F3AC149
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 20:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D13C212B3D;
	Sun,  7 Sep 2025 20:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nxHgVkWu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6672A1B424F;
	Sun,  7 Sep 2025 20:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757276474; cv=none; b=BO+GJZmHlNnrzbYAiJv1689AEzTtRsYGxz8nZNA64JderKBkwi75BSYJ6IBhDOZuvD5tq+DElIX4JzhilTwX8r9oZAe3FmLk6OZrpjmEgYnbx3nMXgrhFQtr0vbVYYkRskZBahUXxI/I1a3vRxHIK5GIfz1tr8sf0KH9ypi2TIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757276474; c=relaxed/simple;
	bh=eokpR0IH5Z2KYJSiEcoNGBjnXwNir2e3O3BQrsQuL1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBcL/nesbjGj0yul4tgLAyPoLkj8ssR4Ss2JYMSq+WPT2aelLoORosPjzxFJCWzg7oSx0erXnVg2/wfHpZIpoaKr8KRlc6/q2AQ9DE82/CH1t8EFO3Re/dpur9CiqHuGiNk6iVxLFryiWxWsb1si4nbuJCZ2a6JNeVowZcfW+Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nxHgVkWu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E5A4B13E2;
	Sun,  7 Sep 2025 22:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757276399;
	bh=eokpR0IH5Z2KYJSiEcoNGBjnXwNir2e3O3BQrsQuL1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nxHgVkWuhXFJ/t/wQazH7WtOBOgQRNhMZJWyu1Hhix4EgVg/PhdB7xxB8FJ71u7wV
	 Yk71wrxLpWDw9ZuERWruYpRZz7qlSjuRx+JKm7/zdKXd+Kl/3js9HNgq32xDd5jEV9
	 7eIXVEeW5lLuJPRhTZk3k6uS5RptP64iFSbsEvvM=
Date: Sun, 7 Sep 2025 22:20:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 08/10] media: i2c: ov9282: add strobe_source v4l2
 control
Message-ID: <20250907202049.GD19568@pendragon.ideasonboard.com>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-8-d58d5a694afc@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250901-ov9282-flash-strobe-v7-8-d58d5a694afc@linux.dev>

Hi Richard,

Thank you for the patch.

On Mon, Sep 01, 2025 at 05:05:13PM +0200, Richard Leitner wrote:
> Add read-only V4L2_CID_FLASH_STROBE_SOURCE control. Its value is fixed
> to V4L2_FLASH_STROBE_SOURCE_EXTERNAL as the camera sensor triggers the
> strobe based on its register settings.

I don't think you should implement this control in the sensor driver. It
should only be implemented in the flash controller driver to select the
source.

> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index c405e3411daf37cf98d5af3535702f8321394af5..9efc82a1929a76c6fb245e7dbfb5276a133d1c5d 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1368,11 +1368,12 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	struct v4l2_ctrl_handler *ctrl_hdlr = &ov9282->ctrl_handler;
>  	const struct ov9282_mode *mode = ov9282->cur_mode;
>  	struct v4l2_fwnode_device_properties props;
> +	struct v4l2_ctrl *ctrl;
>  	u32 hblank_min;
>  	u32 lpfr;
>  	int ret;
>  
> -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
>  	if (ret)
>  		return ret;
>  
> @@ -1443,6 +1444,14 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
>  			  0, 13900, 1, 8);
>  
> +	ctrl = v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
> +				      V4L2_CID_FLASH_STROBE_SOURCE,
> +				      V4L2_FLASH_STROBE_SOURCE_EXTERNAL,
> +				      ~(1 << V4L2_FLASH_STROBE_SOURCE_EXTERNAL),
> +				      V4L2_FLASH_STROBE_SOURCE_EXTERNAL);
> +	if (ctrl)
> +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
>  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
>  	if (!ret) {
>  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */

-- 
Regards,

Laurent Pinchart

