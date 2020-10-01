Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8359B27F7A3
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 04:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbgJACEG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 22:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgJACEG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 22:04:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF781C061755
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 19:04:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77580255;
        Thu,  1 Oct 2020 04:04:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601517841;
        bh=vLjWQ4ey4mO9fM7AdU2O+7DEhYLQ3Wu53U079z4Pe4U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=haXReLEHo7yny7SatBSyNRJF4ThnK7rhWWaxdf8FQu2r5RyDChbGWvhbXosdOolxA
         Xxe6GdeagccSEpHdDnQObMsYrAwhazk1xhYeK9pNDduQUyWHEyCGplNHQbrh7p6yJx
         nEPmpcLx5C5Usy2B83UyocFWRZpF64lFsfL0I4ek=
Date:   Thu, 1 Oct 2020 05:03:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v3 09/10] media: rkisp1: cap: simplify the link
 validation by compering the media bus code
Message-ID: <20201001020325.GJ5689@pendragon.ideasonboard.com>
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
 <20200723132014.4597-10-dafna.hirschfeld@collabora.com>
 <20200930190025.GH1516931@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200930190025.GH1516931@oden.dyn.berto.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Wed, Sep 30, 2020 at 09:00:25PM +0200, Niklas Söderlund wrote:
> Hi Dafna,
> 
> This commit is not just a simplification but a change of behavior.  The 
> change is for the better but it broke capture of NV12 and NV21 formats 
> in libcamera unexpectedly.
> 
> The issue at hand is that libcamera when configuring the pipeline 
> retrieves the mbus code for the ISP (rkisp1_isp) source pad (2) and then 
> propagates it to the resizer (rkisp_resizer_{main,self}path) sink pad 
> (0) and then to the resizers source pad (1). Effectively propagating 
> MEDIA_BUS_FMT_YUYV8_2X8 for all formats.
> 
> At this point if the video node (main or self) is configured with a 
> YUV420 format (NV12, NV21, etc) and with this change applied the link 
> validation will fail as MEDIA_BUS_FMT_YUYV8_1_5X8 !=  
> MEDIA_BUS_FMT_YUYV8_2X8. Given the nature of how link validation is 
> implemented it's VIDIOC_QBUF that returns a -EPIPE when it fails and 
> libcamera lockup the capture session.

I would be very, very surprised is the hardware really used YUYV8_1_5X8.
YUYV8_1X16 is a much more likely bus format between the resizer and the
DMA engine, as well as between the ISP and the resizer.

> I will submit a fix for this to libcamera to bring it in sync with this 
> change.
> 
> Would it be possible to ask that future changes to the rkisp1 driver be 
> tested with libcamera so we can track and update both the kernel and 
> user-space components of this driver at the same time and avoid nasty 
> surprises? :-)

I strongly second this. Drivers that are supported in libcamera should
be tested with libcamera to catch regressions, for any chance submitted
to the kernel.

> On 2020-07-23 15:20:13 +0200, Dafna Hirschfeld wrote:
> > The capture has a mapping of the mbus code needed for each pixelformat.
> > This can be used to simplify the link validation by comparing the mbus
> > code in the capture with the code in the resizer.
> > 
> > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > ---
> >  drivers/staging/media/rkisp1/rkisp1-capture.c | 18 ++++--------------
> >  1 file changed, 4 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> > index 4dabd07a3da9..a5e2521577dd 100644
> > --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> > +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> > @@ -1255,22 +1255,11 @@ static int rkisp1_capture_link_validate(struct media_link *link)
> >  	struct v4l2_subdev *sd =
> >  		media_entity_to_v4l2_subdev(link->source->entity);
> >  	struct rkisp1_capture *cap = video_get_drvdata(vdev);
> > -	struct rkisp1_isp *isp = &cap->rkisp1->isp;
> > -	u8 isp_pix_enc = isp->src_fmt->pixel_enc;
> > -	u8 cap_pix_enc = cap->pix.info->pixel_enc;
> > +	const struct rkisp1_capture_fmt_cfg *fmt =
> > +		rkisp1_find_fmt_cfg(cap, cap->pix.fmt.pixelformat);
> >  	struct v4l2_subdev_format sd_fmt;
> >  	int ret;
> >  
> > -	if (cap_pix_enc != isp_pix_enc &&
> > -	    !(isp_pix_enc == V4L2_PIXEL_ENC_YUV &&
> > -	      cap_pix_enc == V4L2_PIXEL_ENC_RGB)) {
> > -		dev_err(cap->rkisp1->dev,
> > -			"format type mismatch in link '%s:%d->%s:%d'\n",
> > -			link->source->entity->name, link->source->index,
> > -			link->sink->entity->name, link->sink->index);
> > -		return -EPIPE;
> > -	}
> > -
> >  	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> >  	sd_fmt.pad = link->source->index;
> >  	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
> > @@ -1278,7 +1267,8 @@ static int rkisp1_capture_link_validate(struct media_link *link)
> >  		return ret;
> >  
> >  	if (sd_fmt.format.height != cap->pix.fmt.height ||
> > -	    sd_fmt.format.width != cap->pix.fmt.width)
> > +	    sd_fmt.format.width != cap->pix.fmt.width ||
> > +	    sd_fmt.format.code != fmt->mbus)
> >  		return -EPIPE;
> >  
> >  	return 0;

-- 
Regards,

Laurent Pinchart
