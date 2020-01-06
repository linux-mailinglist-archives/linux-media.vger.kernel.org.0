Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5164B1311A6
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 12:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgAFLza (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 06:55:30 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:40139 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725787AbgAFLz3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Jan 2020 06:55:29 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud9.xs4all.net with ESMTPA
        id oQyhiIwlNVPvpoQykipRs5; Mon, 06 Jan 2020 12:55:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578311727; bh=QM4+e/JWJcP7Xkl+d+2VWkVOC4Sr7FElVrguPTUV42g=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=AZ/FYGHOzh2LZmUbriH4hTl91gmctvWHHxt0nYsk+/KWRQoV34dEM9gMvNTsPp2+R
         SleplPEw65KqpTJab+fzAgx9ze/8PwJM8fOvV4IGBRKc9eqWzWZWi04U9fMCf/ilpy
         9kEUai6WTq1UcENAwSBl1ubT8PBAcdOrLJLH8ZhwO3Ry7DFWECgUzz9jtycc4P75Oy
         Z90o5xBWrgWNEl6WPX4ApvBgP/8JEzUkA2fHseYKafa/1vWPRWeskYagnHMyHz2ByH
         E358jubTaMDduviV2tdd3tS8Q9PPTzgdVOaG+C8A2Exugj472kkxYj14wyyt2Kcd9C
         ftrWWX4ifwmFA==
Subject: Re: [PATCH v2] media: davinci/vpfe_capture.c: Avoid BUG_ON for
 register failure
To:     Aditya Pakki <pakki001@umn.edu>
Cc:     kjlu@umn.edu, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191217221254.1078-1-pakki001@umn.edu>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a3f1da01-79b0-f548-de4f-e0c82b8abbf9@xs4all.nl>
Date:   Mon, 6 Jan 2020 12:55:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191217221254.1078-1-pakki001@umn.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEr83cOGeYQWoPj0V4roRl0p7EsnNFj7+7aapH2ULA59deP4LNFV/8by4yb4wQqQqWjh9DoKir4JWaROfC5Q+q7F5b0+sCQ3ouV+tWMqga8znAXh3y5j
 DaWAVzkUQyNWekLezyoTMWeCda9uBjoBXZ5kJkzV8Q3u+Xcw+TzLjmO0wnznHq6QXBs1E/CfhdxElkIGD7NNX+QCzpX2tu0ktuDTplyACjCAcM9TU/ND1kPI
 jp34CLgQvgNYa/YwvyOu27PB5elcKRjFdlgCx/3Km609OnN69ywMs8A9qzpP6C/ELapbGf7l2lMowiRYUbaJBpB5z3uxVNQ0Tj4QIcvn2nQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/17/19 11:12 PM, Aditya Pakki wrote:
> In vpfe_register_ccdc_device(), failure to allocate dev->hw_ops
> fields calls BUG_ON(). This patch returns the error to callers
> instead of crashing. The issue was identified by a static
> analysis tool.
> 
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>
> ---
> v1: Fixed the type to a regular variable instead of a pointer,
> also added fixes suggested by Ezequiel Garcia.
> ---
>  drivers/media/platform/davinci/vpfe_capture.c | 31 ++++++++++---------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c
> index 916ed743d716..a3838a2e173f 100644
> --- a/drivers/media/platform/davinci/vpfe_capture.c
> +++ b/drivers/media/platform/davinci/vpfe_capture.c
> @@ -168,21 +168,22 @@ int vpfe_register_ccdc_device(const struct ccdc_hw_device *dev)
>  	int ret = 0;
>  	printk(KERN_NOTICE "vpfe_register_ccdc_device: %s\n", dev->name);
>  
> -	BUG_ON(!dev->hw_ops.open);
> -	BUG_ON(!dev->hw_ops.enable);
> -	BUG_ON(!dev->hw_ops.set_hw_if_params);
> -	BUG_ON(!dev->hw_ops.configure);
> -	BUG_ON(!dev->hw_ops.set_buftype);
> -	BUG_ON(!dev->hw_ops.get_buftype);
> -	BUG_ON(!dev->hw_ops.enum_pix);
> -	BUG_ON(!dev->hw_ops.set_frame_format);
> -	BUG_ON(!dev->hw_ops.get_frame_format);
> -	BUG_ON(!dev->hw_ops.get_pixel_format);
> -	BUG_ON(!dev->hw_ops.set_pixel_format);
> -	BUG_ON(!dev->hw_ops.set_image_window);
> -	BUG_ON(!dev->hw_ops.get_image_window);
> -	BUG_ON(!dev->hw_ops.get_line_length);
> -	BUG_ON(!dev->hw_ops.getfid);
> +	if (!dev->hw_ops.open ||
> +			!dev->hw_ops.enable ||
> +			!dev->hw_ops.set_hw_if_params ||
> +			!dev->hw_ops.configure ||
> +			!dev->hw_ops.set_buftype ||
> +			!dev->hw_ops.get_buftype ||
> +			!dev->hw_ops.enum_pix ||
> +			!dev->hw_ops.set_frame_format ||
> +			!dev->hw_ops.get_frame_format ||
> +			!dev->hw_ops.get_pixel_format ||
> +			!dev->hw_ops.set_pixel_format ||
> +			!dev->hw_ops.set_image_window ||
> +			!dev->hw_ops.get_image_window ||
> +			!dev->hw_ops.get_line_length ||
> +			!dev->hw_ops.getfid)

Please align this under !dev->hw_ops.open. E.g.:

	if (!dev->hw_ops.open ||
	    !dev->hw_ops.enable ||
	    !dev->hw_ops.set_hw_if_params ||
	    ...etc...

Regards,

	Hans


> +		return -EINVAL;
>  
>  	mutex_lock(&ccdc_lock);
>  	if (!ccdc_cfg) {
> 

