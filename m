Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B9F23F8C4
	for <lists+linux-media@lfdr.de>; Sat,  8 Aug 2020 22:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbgHHUk1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Aug 2020 16:40:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36902 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbgHHUk1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Aug 2020 16:40:27 -0400
Received: from pendragon.ideasonboard.com (85-76-78-184-nat.elisa-mobile.fi [85.76.78.184])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF003F9;
        Sat,  8 Aug 2020 22:40:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596919224;
        bh=vIReoEoXrYFf0pZEs/Z6RMS6MgwBIuS/weoocSp8iFM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BK/j4gLQ26C7kY2tV3PpvdTDzj7lhemCpLdn64YaGk/1HN4w3zssi31QzfsXCqpco
         tjLkdruPned3KDD2jGclOkf9fK/WNEV1gZvP8sjcZXDmCru5DGSnDh7bNTYIB35lTm
         yDA/SREk9c0Lo3VjH32GrNnaYQ4+KPlRTgYS124U=
Date:   Sat, 8 Aug 2020 23:40:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     skhan@linuxfoundation.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/20] media: usb: uvc_ctrl.c: add temp variable for list
 iteration
Message-ID: <20200808204007.GI6186@pendragon.ideasonboard.com>
References: <20200807083548.204360-3-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200807083548.204360-3-dwlsalmeida@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Fri, Aug 07, 2020 at 05:35:30AM -0300, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Fixes the following coccinelle report:
> 
> drivers/media/usb/uvc/uvc_ctrl.c:1860:5-11:
> ERROR: invalid reference to the index variable of the iterator on line 1854
> 
> By introducing a temporary variable to iterate the list.
> 
> Do not dereference the 'entity' pointer if it is not found in the list.
> 
> Found using - Coccinelle (http://coccinelle.lip6.fr)
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index e399b9fad757..567bdedc2ff2 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1842,7 +1842,8 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	struct uvc_xu_control_query *xqry)
>  {
> -	struct uvc_entity *entity;
> +	struct uvc_entity *entity = NULL;
> +	struct uvc_entity *cursor = NULL;

cursor doesn't have to be initialized to NULL.

It may be a style preference, but instead of a cursor variable that
doesn't tell in its name what it refers to, I'd prefer a

	bool found = false;

>  	struct uvc_control *ctrl;
>  	unsigned int i, found = 0;
>  	u32 reqflags;
> @@ -1851,13 +1852,15 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	int ret;
>  
>  	/* Find the extension unit. */
> -	list_for_each_entry(entity, &chain->entities, chain) {
> -		if (UVC_ENTITY_TYPE(entity) == UVC_VC_EXTENSION_UNIT &&
> -		    entity->id == xqry->unit)
> +	list_for_each_entry(cursor, &chain->entities, chain) {
> +		if (UVC_ENTITY_TYPE(cursor) == UVC_VC_EXTENSION_UNIT &&
> +		    cursor->id == xqry->unit) {

All this would keep using entity.

> +			entity = cursor;

And this would be replaced with

			found = true;

>  			break;
> +		    }
>  	}
>  
> -	if (entity->id != xqry->unit) {
> +	if (!entity || entity->id != xqry->unit) {

The second part of the check isn't needed, it was only meant to check if
the entity has been found.

Here, we'd have 

	if (!found) {

I'f you're OK with these changes there's no need to resubmit, I can
update when applying. Please let me know how you'd like to proceed.

>  		uvc_trace(UVC_TRACE_CONTROL, "Extension unit %u not found.\n",
>  			xqry->unit);
>  		return -ENOENT;

-- 
Regards,

Laurent Pinchart
