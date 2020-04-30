Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E41F51BF628
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 13:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgD3LKT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 07:10:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36476 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgD3LKT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 07:10:19 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C30D8321;
        Thu, 30 Apr 2020 13:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588245015;
        bh=vzoIGymqMDr4/e03h5JjVx/KZIHtnmQaHGQ9XNk5uK4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ljs9rQYOPJA0aSO47jOEwAPJoY6ZuSjAu026tsgjxuc9vkCtysBW18J5kqOZAxv72
         be88In7eRKa+ZDqolmSVj2xqY9pmLpNNRDoXUZDFyyppR6Bo/ih1syTJl3ZwYpk/tj
         hLxDAnk+T3/s3GvhNMjl9JNM0mr+DLiTbnP6FU+k=
Date:   Thu, 30 Apr 2020 14:10:14 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Daniel Gomez <daniel@qtec.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] media: v4l2-subdev.h: Add min and max enum
Message-ID: <20200430111014.GD5856@pendragon.ideasonboard.com>
References: <20200414200151.80089-1-daniel@qtec.com>
 <20200414200151.80089-2-daniel@qtec.com>
 <20200430094233.GE867@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200430094233.GE867@valkosipuli.retiisi.org.uk>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Thu, Apr 30, 2020 at 12:42:33PM +0300, Sakari Ailus wrote:
> Hi Daniel,
> 
> Thanks for the patchset.
> 
> I'm also cc'ing Laurent who I think could be interested in this one.
> 
> On Tue, Apr 14, 2020 at 10:01:49PM +0200, Daniel Gomez wrote:
> > Add min and max structures to the v4l2-subdev callback in order to allow
> > the subdev to return a range of valid frame intervals.
> > 
> > This would operate similar to the struct v4l2_subdev_frame_size_enum and
> > its max and min values for the width and the height. In this case, the
> > possibility to return a frame interval range is added to the v4l2-subdev level
> > whenever the v4l2 device operates in step-wise or continuous mode.
> 
> The current API only allows providing a list of enumerated values. That is
> limiting indeed, especially on register list based sensor drivers where
> vertical blanking is configurable.
> 
> I guess this could be extended to cover what V4L2, more or less. If we tell
> it's a range, is it assumed to be contiguous? We don't have try operation
> for the frame interval, but I guess set is good enough. The fraction is
> probably best for TV standards but it's not what camera sensors natively
> use. (But for a register list based driver, the established practice
> remains to use frame interval.)
> 
> I'm also wondering the effect on existing user space; if a driver gives a
> range, how will the existing programs work with such a driver?
> 
> I'd add an anonymous union with the interval field, the other field being
> min_interval. Then the current applications would get the minimum interval
> and still continue to function. I guess compilers are modern enough these
> days we can have an anonymous union in the uAPI?

We can discuss all this, but given patch 3/3 in this series, I think
this isn't the right API :-) The sensor driver should not expose the
frame interval enumeration API. It should instead expose control of the
frame rate through V4L2_CID_PIXEL_RATE, V4L2_CID_HBLANK and
V4L2_CID_VBLANK.

> > Signed-off-by: Daniel Gomez <daniel@qtec.com>
> > ---
> >  include/uapi/linux/v4l2-subdev.h | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > index 03970ce30741..ee15393c58cd 100644
> > --- a/include/uapi/linux/v4l2-subdev.h
> > +++ b/include/uapi/linux/v4l2-subdev.h
> > @@ -117,6 +117,8 @@ struct v4l2_subdev_frame_interval {
> >   * @code: format code (MEDIA_BUS_FMT_ definitions)
> >   * @width: frame width in pixels
> >   * @height: frame height in pixels
> > + * @min_interval: min frame interval in seconds
> > + * @max_interval: max frame interval in seconds
> >   * @interval: frame interval in seconds
> >   * @which: format type (from enum v4l2_subdev_format_whence)
> >   */
> > @@ -126,9 +128,11 @@ struct v4l2_subdev_frame_interval_enum {
> >  	__u32 code;
> >  	__u32 width;
> >  	__u32 height;
> > +	struct v4l2_fract min_interval;
> > +	struct v4l2_fract max_interval;
> 
> This changes the memory layout of the struct and breaks the ABI. Any new
> fields in the struct may only replace reserved fields while the rest must
> stay unchanged.
> 
> >  	struct v4l2_fract interval;
> >  	__u32 which;
> > -	__u32 reserved[8];
> > +	__u32 reserved[4];
> >  };
> >  
> >  /**

-- 
Regards,

Laurent Pinchart
