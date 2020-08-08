Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 844A523F8C7
	for <lists+linux-media@lfdr.de>; Sat,  8 Aug 2020 22:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgHHUpi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Aug 2020 16:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbgHHUph (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Aug 2020 16:45:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90015C061756;
        Sat,  8 Aug 2020 13:45:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-78-184-nat.elisa-mobile.fi [85.76.78.184])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DAA0F9;
        Sat,  8 Aug 2020 22:45:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596919534;
        bh=lFcos1oYh855e+NsfnTo8k171dyAMUBXR1Qzo20TZyY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EeS9s7vAcV3xVK5qZJxSvIDTfO8Pk3wxT8S1EyikTJ6v3mjWRRM41P9FaJZq3FJSY
         kUuOAB5p+EizPTHqpgKzL1bO5hlfu0uOUz3FonGCYp98rOhh6EjQFTNbMWwGdx08eR
         ZF3HVe1BlEhUU7v7Pc7gF0i3I8Atu9/4VnA554UY=
Date:   Sat, 8 Aug 2020 23:45:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     skhan@linuxfoundation.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/20] media: uvc: uvc_v4l2.c: add temp variable for list
 iteration
Message-ID: <20200808204517.GJ6186@pendragon.ideasonboard.com>
References: <20200807083548.204360-4-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200807083548.204360-4-dwlsalmeida@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Fri, Aug 07, 2020 at 05:35:31AM -0300, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Fixes the following coccinelle reports:
> 
> drivers/media/usb/uvc/uvc_v4l2.c:840:8-13:
> ERROR: invalid reference to the index variable of the iterator on line 836
> 
> drivers/media/usb/uvc/uvc_v4l2.c:851:5-10:
> ERROR: invalid reference to the index variable of the iterator on line 843
> 
> drivers/media/usb/uvc/uvc_v4l2.c:851:22-27:
> ERROR: invalid reference to the index variable of the iterator on line 843
> 
> Byy introducing a temporary variable for list iteration.
> 
> Found using - Coccinelle (http://coccinelle.lip6.fr)
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 0335e69b70ab..7205ef13c2e1 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -826,6 +826,7 @@ static int uvc_ioctl_enum_input(struct file *file, void *fh,
>  	struct uvc_video_chain *chain = handle->chain;
>  	const struct uvc_entity *selector = chain->selector;
>  	struct uvc_entity *iterm = NULL;
> +	struct uvc_entity *cursor = NULL;
>  	u32 index = input->index;
>  	int pin = 0;
>  
> @@ -833,18 +834,22 @@ static int uvc_ioctl_enum_input(struct file *file, void *fh,
>  	    (chain->dev->quirks & UVC_QUIRK_IGNORE_SELECTOR_UNIT)) {
>  		if (index != 0)
>  			return -EINVAL;
> -		list_for_each_entry(iterm, &chain->entities, chain) {
> -			if (UVC_ENTITY_IS_ITERM(iterm))
> +		list_for_each_entry(cursor, &chain->entities, chain) {
> +			if (UVC_ENTITY_IS_ITERM(cursor)){
> +				iterm = cursor;
>  				break;
> +			}
>  		}

If no entity is found by this loop the next line will dereference a NULL
pointer. There's a similar issue below.

I think the issues reported by coccinelle are false positives, as every
chain is guaranteed to have the proper input terminals (ITERM). This is
verified when constructing the chain at probe time.

>  		pin = iterm->id;
>  	} else if (index < selector->bNrInPins) {
>  		pin = selector->baSourceID[index];
> -		list_for_each_entry(iterm, &chain->entities, chain) {
> -			if (!UVC_ENTITY_IS_ITERM(iterm))
> +		list_for_each_entry(cursor, &chain->entities, chain) {
> +			if (!UVC_ENTITY_IS_ITERM(cursor))
>  				continue;
> -			if (iterm->id == pin)
> +			if (cursor->id == pin) {
> +				iterm = cursor;
>  				break;
> +			}
>  		}
>  	}
>  
> @@ -1519,4 +1524,3 @@ const struct v4l2_file_operations uvc_fops = {
>  	.get_unmapped_area = uvc_v4l2_get_unmapped_area,
>  #endif
>  };
> -

-- 
Regards,

Laurent Pinchart
