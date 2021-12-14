Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65EAA474D5F
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 22:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234877AbhLNVyb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 16:54:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234861AbhLNVya (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 16:54:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFDEEC061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 13:54:29 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2736A8C4;
        Tue, 14 Dec 2021 22:54:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639518868;
        bh=yNLGVFmTg/8cjJ/r3T2+9yXwI7SLhzjYf/wX6Q2FxoY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V9qg3m160xfANEt5QYPch1gTrOElAZMCFB1Ocn8YA9FpiAkKrKbjOSP8G8rfgrVxQ
         aejAABH5BiG2/K14dNWOQaY2Vw0q5PbxAluRPQDlfQYNgsDnjONh8xsRRdRfF60Heh
         NYruTLv4ya+Hy93Wgyay90zbs4e1cRWn6/e4AF2s=
Date:   Tue, 14 Dec 2021 23:54:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        sakari.ailus@linux.intel.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH 2/5] media: entity: Add link_type() helper
Message-ID: <YbkSkjEKagLDeIm7@pendragon.ideasonboard.com>
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211213232849.40071-3-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211213232849.40071-3-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Dec 13, 2021 at 11:28:46PM +0000, Daniel Scally wrote:
> Now we have three types of media link, printing the right name during
> debug output is slightly more complicated. Add a helper function to
> make it easier.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes since the rfc:
> 
> 	- new patch
> 
>  drivers/media/mc/mc-entity.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index f40f41977142..d79eb88bc167 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -60,6 +60,20 @@ static inline const char *intf_type(struct media_interface *intf)
>  	}
>  };
>  
> +static inline const char *link_type(struct media_link *link)

This could be named link_type_name() to avoid confusion with a function
that would return the link type.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +{
> +	switch (link->flags & MEDIA_LNK_FL_LINK_TYPE) {
> +	case MEDIA_LNK_FL_DATA_LINK:
> +		return "data";
> +	case MEDIA_LNK_FL_INTERFACE_LINK:
> +		return "interface";
> +	case MEDIA_LNK_FL_ANCILLARY_LINK:
> +		return "ancillary";
> +	default:
> +		return "unknown";
> +	}
> +}
> +
>  __must_check int __media_entity_enum_init(struct media_entity_enum *ent_enum,
>  					  int idx_max)
>  {
> @@ -107,9 +121,7 @@ static void dev_dbg_obj(const char *event_name,  struct media_gobj *gobj)
>  
>  		dev_dbg(gobj->mdev->dev,
>  			"%s id %u: %s link id %u ==> id %u\n",
> -			event_name, media_id(gobj),
> -			media_type(link->gobj0) == MEDIA_GRAPH_PAD ?
> -				"data" : "interface",
> +			event_name, media_id(gobj), link_type(link),
>  			media_id(link->gobj0),
>  			media_id(link->gobj1));
>  		break;

-- 
Regards,

Laurent Pinchart
