Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB672EBFB3
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 15:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbhAFOnP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 09:43:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbhAFOnP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 09:43:15 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D560C06134C
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 06:42:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DD7F878;
        Wed,  6 Jan 2021 15:42:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609944151;
        bh=q5D+DbInV1OqffiyoCg7QO+Y2bboT4rlQcSaIAmkOsE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OZL4RieHUEE3yAMgDTBZQccg2eammJT1Lw7bKHIpnYN07ZbJ47EPImpBVH8Corwr0
         SuCXPM3s4i7braC2rHl+YSv7Vjp6ZKULrA+V9dW6bMO6GccnZy0M5mTrwO1KWcaZDB
         0O03zhNaPbLcYqg471FxmvYF13Y75fi6UzasF3ew=
Date:   Wed, 6 Jan 2021 16:42:19 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH] Revert "media: videobuf2: Fix length check for single
 plane dmabuf queueing"
Message-ID: <X/XMS+53s3RDUdY0@pendragon.ideasonboard.com>
References: <20210106135210.12337-1-naush@raspberrypi.com>
 <c63d6797-d3f7-3e6d-b760-d05291dbc0ed@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c63d6797-d3f7-3e6d-b760-d05291dbc0ed@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 06, 2021 at 02:35:22PM +0000, Kieran Bingham wrote:
> Hi Naush,
> 
> On 06/01/2021 13:52, Naushir Patuck wrote:
> > The updated length check for dmabuf types broke existing usage in v4l2
> > userland clients.
> 
> Indeed, my tests have indeed been failing since 5.8 or such it seems.
> 
> Thank you for this - it fixes the tests again for me.
> 
> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Cc: stable@vger.kernel.org

?

> > Fixes: 961d3b27 ("media: videobuf2: Fix length check for single plane dmabuf queueing")
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > ---
> >  drivers/media/common/videobuf2/videobuf2-v4l2.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > index 96d3b2b2aa31..3f61f5863bf7 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > @@ -118,8 +118,7 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
> >  				return -EINVAL;
> >  		}
> >  	} else {
> > -		length = (b->memory == VB2_MEMORY_USERPTR ||
> > -			  b->memory == VB2_MEMORY_DMABUF)
> > +		length = (b->memory == VB2_MEMORY_USERPTR)
> >  			? b->length : vb->planes[0].length;
> >  
> >  		if (b->bytesused > length)

-- 
Regards,

Laurent Pinchart
