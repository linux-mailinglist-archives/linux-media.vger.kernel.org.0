Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317C649849B
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 17:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243273AbiAXQXe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 11:23:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243260AbiAXQXe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 11:23:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED1B7C06173B
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 08:23:33 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A55F143B;
        Mon, 24 Jan 2022 17:23:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643041410;
        bh=d8kkN6lHRKDDmSWI1T7ayi4unocz1vEz5354Nl49k/c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rQaYpwucSq6gjGpP3c+OZwyFpooKkyJxGKi/PQfnYJwm/87cXOvm0wu36O61XkLf7
         wEZz16vix56Abstx6VkdziYeLW60VvVEeHfh/R122XgpUZWTP8w6+UgKeeE2mpTFBp
         MFKVIQVVQYeowBXcBgQOQOllN5YnBilmz2rZXIzI=
Date:   Mon, 24 Jan 2022 18:23:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 3/3] v4l: ioctl: Set bus_info in v4l_querycap()
Message-ID: <Ye7ScPzWH20vDv3Z@pendragon.ideasonboard.com>
References: <20220122163656.168440-1-sakari.ailus@linux.intel.com>
 <20220122163656.168440-4-sakari.ailus@linux.intel.com>
 <YeyYbk5hBodwa0FH@pendragon.ideasonboard.com>
 <Ye7Ns4UMUUDpB3AM@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ye7Ns4UMUUDpB3AM@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 24, 2022 at 06:02:59PM +0200, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Sun, Jan 23, 2022 at 01:51:10AM +0200, Laurent Pinchart wrote:
> 
> ...
> 
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > index 642cb90f457c..81ebf6cca522 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -18,6 +18,7 @@
> > >  
> > >  #include <linux/videodev2.h>
> > >  
> > > +#include <media/media-device.h> /* for media_set_bus_info() */
> > >  #include <media/v4l2-common.h>
> > >  #include <media/v4l2-ioctl.h>
> > >  #include <media/v4l2-ctrls.h>
> > > @@ -1069,6 +1070,8 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
> > >  	cap->capabilities |= V4L2_CAP_EXT_PIX_FORMAT;
> > >  	cap->device_caps |= V4L2_CAP_EXT_PIX_FORMAT;
> > >  
> > > +	media_set_bus_info(cap->bus_info, vfd->dev_parent);
> > > +
> > 
> > Shouldn't you do this before calling the driver operation, if you want
> > to allow driver overrides ?
> 
> This is done conditionally based on the value of the first byte.

I had missed that.

Isn't it still better to call media_set_bus_info() first, instead of
checking the first byte ?

-- 
Regards,

Laurent Pinchart
