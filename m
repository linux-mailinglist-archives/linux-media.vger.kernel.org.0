Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA721BFDCF
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 16:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbgD3OU2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 10:20:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37880 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726309AbgD3OU2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 10:20:28 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DE45321;
        Thu, 30 Apr 2020 16:20:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588256426;
        bh=y2PsAauFIXGCIqWqheeij6vlSTYDffjTnW42XNRYk9c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a5wr02LbeaRy801vibzYJaPl7k7MplN6oN/MwAdSu1+l3dpGCEvT7kBl3kldBQjCA
         mpw8mzlOWMMig8slWa9n9M0VPL5kM/JumATTQQZLRQCQb81sVzTmm3LDU5E33DMm1R
         ylhpKSPrevZzm6RVI5FhCi0c4ERchuitzU93bXcs=
Date:   Thu, 30 Apr 2020 17:20:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Daniel Gomez <daniel@qtec.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] media: v4l2-subdev.h: Add min and max enum
Message-ID: <20200430142024.GK5856@pendragon.ideasonboard.com>
References: <20200414200151.80089-1-daniel@qtec.com>
 <20200414200151.80089-2-daniel@qtec.com>
 <20200430094233.GE867@valkosipuli.retiisi.org.uk>
 <20200430111014.GD5856@pendragon.ideasonboard.com>
 <20200430133125.GL867@valkosipuli.retiisi.org.uk>
 <20200430135904.GI5856@pendragon.ideasonboard.com>
 <20200430141552.GO867@valkosipuli.retiisi.org.uk>
 <20200430141753.GJ5856@pendragon.ideasonboard.com>
 <20200430141849.GP867@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200430141849.GP867@valkosipuli.retiisi.org.uk>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Apr 30, 2020 at 05:18:49PM +0300, Sakari Ailus wrote:
> On Thu, Apr 30, 2020 at 05:17:53PM +0300, Laurent Pinchart wrote:
> > On Thu, Apr 30, 2020 at 05:15:52PM +0300, Sakari Ailus wrote:
> >> On Thu, Apr 30, 2020 at 04:59:04PM +0300, Laurent Pinchart wrote:
> >>> On Thu, Apr 30, 2020 at 04:31:25PM +0300, Sakari Ailus wrote:
> >>>> On Thu, Apr 30, 2020 at 02:10:14PM +0300, Laurent Pinchart wrote:
> >>>>> On Thu, Apr 30, 2020 at 12:42:33PM +0300, Sakari Ailus wrote:
> >>>>>> On Tue, Apr 14, 2020 at 10:01:49PM +0200, Daniel Gomez wrote:
> >>>>>>> Add min and max structures to the v4l2-subdev callback in order to allow
> >>>>>>> the subdev to return a range of valid frame intervals.
> >>>>>>> 
> >>>>>>> This would operate similar to the struct v4l2_subdev_frame_size_enum and
> >>>>>>> its max and min values for the width and the height. In this case, the
> >>>>>>> possibility to return a frame interval range is added to the v4l2-subdev level
> >>>>>>> whenever the v4l2 device operates in step-wise or continuous mode.
> >>>>>> 
> >>>>>> The current API only allows providing a list of enumerated values. That is
> >>>>>> limiting indeed, especially on register list based sensor drivers where
> >>>>>> vertical blanking is configurable.
> >>>>>> 
> >>>>>> I guess this could be extended to cover what V4L2, more or less. If we tell
> >>>>>> it's a range, is it assumed to be contiguous? We don't have try operation
> >>>>>> for the frame interval, but I guess set is good enough. The fraction is
> >>>>>> probably best for TV standards but it's not what camera sensors natively
> >>>>>> use. (But for a register list based driver, the established practice
> >>>>>> remains to use frame interval.)
> >>>>>> 
> >>>>>> I'm also wondering the effect on existing user space; if a driver gives a
> >>>>>> range, how will the existing programs work with such a driver?
> >>>>>> 
> >>>>>> I'd add an anonymous union with the interval field, the other field being
> >>>>>> min_interval. Then the current applications would get the minimum interval
> >>>>>> and still continue to function. I guess compilers are modern enough these
> >>>>>> days we can have an anonymous union in the uAPI?
> >>>>> 
> >>>>> We can discuss all this, but given patch 3/3 in this series, I think
> >>>>> this isn't the right API :-) The sensor driver should not expose the
> >>>>> frame interval enumeration API. It should instead expose control of the
> >>>>> frame rate through V4L2_CID_PIXEL_RATE, V4L2_CID_HBLANK and
> >>>>> V4L2_CID_VBLANK.
> >>>>> 
> >>>> 
> >>>> That would require also exposing the size of the pixel array (and the
> >>>> analogue crop), in order to provide all the necessary information to
> >>>> calculate the frame rate. No objections there; this is a new driver.
> >>>> 
> >>>> There are however existing drivers that implement s_frame_interval subdev
> >>>> ioctl; those might benefit from this one. Or would you implement the pixel
> >>>> rate based control as well, and effectively deprecate the s_frame_interval
> >>>> on those?
> >>> 
> >>> That's what I would recommend, yes. I would only keep
> >>> .s_frame_interval() for sensors that expose that concept at the hardware
> >>> level (for instance with an integrated ISP whose firmware exposes a
> >>> frame interval or frame rate control).
> >> 
> >> Sounds good to me.
> >> 
> >> Jacopo's set exposing read-only subdevs completes the puzzle so the user
> >> space should have all it needs, right?
> > 
> > Until we run into the next missing piece :-)
> 
> I was thinking of the frame rate configuration. Can you confirm that?

I believe so, yes.

-- 
Regards,

Laurent Pinchart
