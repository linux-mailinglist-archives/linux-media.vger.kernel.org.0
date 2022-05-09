Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11D7251F97A
	for <lists+linux-media@lfdr.de>; Mon,  9 May 2022 12:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbiEIKRX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 May 2022 06:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiEIKRT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 May 2022 06:17:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C7E427E3F9
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 03:13:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71FFD55A;
        Mon,  9 May 2022 12:09:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652090953;
        bh=0nyBfZSp8dkYcun0eC4AEADP/QmhSwImOAkybIhBl/k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dKZhjXEdmser5Iigt5kxpmxHk5J/qdNT+EWKDiC899apbHT9V4MQSpRoNqEJADYg4
         U256E/nbmD/K6T4frLgTlQAe0Zy4UGjzE9fd+RNJJG3C215nXxG7YnErWc3WD2bcPt
         iDnphE8Zx+64bjB3MCS5aqxiUa29dAOabdt+jino=
Date:   Mon, 9 May 2022 13:09:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 7/7] uvc_v4l2.c: avoid using iterator used outside loop
Message-ID: <YnjoRYaLduxIwxdA@pendragon.ideasonboard.com>
References: <20220509091553.2637089-1-hverkuil-cisco@xs4all.nl>
 <20220509091553.2637089-8-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220509091553.2637089-8-hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Mon, May 09, 2022 at 11:15:53AM +0200, Hans Verkuil wrote:
> Fixes these two smatch warnings:
> 
> drivers/media/usb/uvc/uvc_v4l2.c:885 uvc_ioctl_enum_input() warn: iterator used outside loop: 'iterm'
> drivers/media/usb/uvc/uvc_v4l2.c:896 uvc_ioctl_enum_input() warn: iterator used outside loop: 'iterm'
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

This conflicts with 261f33388c29 ("media: uvcvideo: Fix missing check to
determine if element is found in list").

> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 711556d13d03..ff3f04af4e21 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -871,6 +871,7 @@ static int uvc_ioctl_enum_input(struct file *file, void *fh,
>  	struct uvc_video_chain *chain = handle->chain;
>  	const struct uvc_entity *selector = chain->selector;
>  	struct uvc_entity *iterm = NULL;
> +	bool found_pin = false;
>  	u32 index = input->index;
>  	int pin = 0;
>  
> @@ -879,21 +880,25 @@ static int uvc_ioctl_enum_input(struct file *file, void *fh,
>  		if (index != 0)
>  			return -EINVAL;
>  		list_for_each_entry(iterm, &chain->entities, chain) {
> -			if (UVC_ENTITY_IS_ITERM(iterm))
> +			if (UVC_ENTITY_IS_ITERM(iterm)) {
> +				pin = iterm->id;
> +				found_pin = true;
>  				break;
> +			}
>  		}
> -		pin = iterm->id;
>  	} else if (index < selector->bNrInPins) {
>  		pin = selector->baSourceID[index];
>  		list_for_each_entry(iterm, &chain->entities, chain) {
>  			if (!UVC_ENTITY_IS_ITERM(iterm))
>  				continue;
> -			if (iterm->id == pin)
> +			if (iterm->id == pin) {
> +				found_pin = true;
>  				break;
> +			}
>  		}
>  	}
>  
> -	if (iterm == NULL || iterm->id != pin)
> +	if (!found_pin)
>  		return -EINVAL;
>  
>  	memset(input, 0, sizeof(*input));

-- 
Regards,

Laurent Pinchart
