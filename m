Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCD06426C2E
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 15:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234018AbhJHN7p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 09:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhJHN7o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 09:59:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790B5C061570;
        Fri,  8 Oct 2021 06:57:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E506581;
        Fri,  8 Oct 2021 15:57:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633701467;
        bh=rrj5/OHbxLCwvJLUfefaA4aV2n9ZiuZogKvLc2ZlskU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lDr+P/H+qzXpb621M3VAoo5Ufz7gBVIHJxiUUxZr7zYwHIwPidevXqUpoYSUbnKCF
         9qNgcyBZK1/O9ogvSqsotvpMD6YL+B5URZcgCkQsx9ppQJ+Dni7y4A9fvR+WK+o6Oh
         u4zh2GhdaV2Hx977r1j5ApCytqOR7y0OCkmbRRJs=
Date:   Fri, 8 Oct 2021 16:57:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: uvcvideo: Fix memory leak of object map on
 error exit path
Message-ID: <YWBOUP98s0K3yVbc@pendragon.ideasonboard.com>
References: <20210917114930.47261-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210917114930.47261-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Colin,

Thank you for the patch.

On Fri, Sep 17, 2021 at 12:49:30PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when the allocation of map->name fails the error exit path
> does not kfree the previously allocated object map. Fix this by
> setting ret to -ENOMEM and taking the free_map exit error path to
> ensure map is kfree'd.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 07adedb5c606 ("media: uvcvideo: Use control names from framework")

That's not the right commit ID, it should be 70fa906d6fce.

> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Mauro, could you add this in your tree for v5.16 ?

> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index f4e4aff8ddf7..711556d13d03 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -44,8 +44,10 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>  	if (v4l2_ctrl_get_name(map->id) == NULL) {
>  		map->name = kmemdup(xmap->name, sizeof(xmap->name),
>  				    GFP_KERNEL);
> -		if (!map->name)
> -			return -ENOMEM;
> +		if (!map->name) {
> +			ret = -ENOMEM;
> +			goto free_map;
> +		}
>  	}
>  	memcpy(map->entity, xmap->entity, sizeof(map->entity));
>  	map->selector = xmap->selector;

-- 
Regards,

Laurent Pinchart
