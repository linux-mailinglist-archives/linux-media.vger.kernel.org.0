Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6AAA459C53
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 07:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhKWG1b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 01:27:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbhKWG1b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 01:27:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A701AC061574
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 22:24:23 -0800 (PST)
Received: from [IPV6:2a01:e0a:169:7140:3c3b:9149:b:8aa9] (unknown [IPv6:2a01:e0a:169:7140:3c3b:9149:b:8aa9])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 052A3A1B;
        Tue, 23 Nov 2021 07:24:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637648661;
        bh=EK8WtLeeFMItBxun8CvEt3m2zsswYwmRQjQ+Vl2FCO4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SxjBXT/cwaa3BVZv/ennmRqoE/51Re71wi5bNtlVZ3ti67X4j4Q53GSyQv3PdR3d5
         KTvRu6G8PdW6bAwxLiRqkV1NIoy08SlN4cXZwNsMvEbOLI8J+9mVzw2YNNGgDThTJr
         GEK3I842Qzh5QhAiTNJ3UnVi1idrKnmCxeESZq9c=
Message-ID: <c802ce76-4d57-72f0-50f5-15b83c03a014@ideasonboard.com>
Date:   Tue, 23 Nov 2021 07:24:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v5 14/17] media: i2c: Switch exposure control unit to
 lines
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, kieran.bingham@ideasonboard.com,
        hdegoede@redhat.com
References: <20211123000017.43187-1-djrscally@gmail.com>
 <20211123000017.43187-15-djrscally@gmail.com>
From:   Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
In-Reply-To: <20211123000017.43187-15-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thanks for the patch !

On 23/11/2021 01:00, Daniel Scally wrote:
> The ov8865 driver currently has the unit of the V4L2_CID_EXPOSURE control
> as 1/16th of a line. This is what the sensor expects, but isn't very
> intuitive. Switch the control to be in units of a line and simply do the
> 16x multiplication before passing the value to the sensor.
> 
> The datasheet for this sensor gives minimum exposure as 2 lines, so take
> the opportunity to correct the lower bounds of the control.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
Tested-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Reviewed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>

> ---
> Changes in v5:
> 
> 	- None
> 
>   drivers/media/i2c/ov8865.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index 45b569f1e7c0..1cc9f78bb97a 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -2126,6 +2126,9 @@ static int ov8865_exposure_configure(struct ov8865_sensor *sensor, u32 exposure)
>   {
>   	int ret;
>   
> +	/* The sensor stores exposure in units of 1/16th of a line */
> +	exposure *= 16;
> +
>   	ret = ov8865_write(sensor, OV8865_EXPOSURE_CTRL_HH_REG,
>   			   OV8865_EXPOSURE_CTRL_HH(exposure));
>   	if (ret)
> @@ -2527,8 +2530,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
>   
>   	/* Exposure */
>   
> -	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16,
> -					    1048575, 16, 512);
> +	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 2,
> +					    65535, 1, 32);
>   
>   	/* Gain */
>   
> 
