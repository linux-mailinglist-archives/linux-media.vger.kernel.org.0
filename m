Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2447459035
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 15:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239644AbhKVOcH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 09:32:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41546 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239590AbhKVOcG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 09:32:06 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C71EA14C3;
        Mon, 22 Nov 2021 15:28:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637591339;
        bh=p41yQn/iqdlbqM11W8ho9BvVNOlAts/4qP33em94CEM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NrcZ+DVAqeu/kK5X1aUasc3zv84Kb+hSo1XHVXWMyTYocKggSw9ObT4TCQDwkj9s6
         jlDcki0taTYUU3i9/mVNzVXG9Rfwv3E7Kf4OAo+c3kxKjXZKW8gec/9oZpEbbuRkkX
         jKV2jpqXMZ5joCpG81tvXAW5v8HjcoV4zNgx588k=
Date:   Mon, 22 Nov 2021 16:28:35 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: Re: [PATCH] media: rkisp1: remove support for V4L2_PIX_FMT_GREY
Message-ID: <YZupE2zKojGCKuTT@pendragon.ideasonboard.com>
References: <20211120110257.22775-1-dafna.hirschfeld@collabora.com>
 <YZjrWdrZzyEE8G7g@pendragon.ideasonboard.com>
 <abc40fe3-6529-17f3-a6d3-4ab741afe849@collabora.com>
 <YZuNOzlVWteTaNYt@pendragon.ideasonboard.com>
 <88434c9b-a682-7da5-ce3b-adec28b89471@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <88434c9b-a682-7da5-ce3b-adec28b89471@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Mon, Nov 22, 2021 at 04:21:25PM +0200, Dafna Hirschfeld wrote:
> On 22.11.21 14:29, Laurent Pinchart wrote:
> > On Mon, Nov 22, 2021 at 01:20:47PM +0200, Dafna Hirschfeld wrote:
> >> On 20.11.21 14:34, Laurent Pinchart wrote:
> >>> On Sat, Nov 20, 2021 at 01:02:57PM +0200, Dafna Hirschfeld wrote:
> >>>> When trying to stream on both mainpatch and selfpatch
> >>>> with grey format, I get an iommu page fault.
> >>>> The fault is on the address at the end of the buffer,
> >>>> so it seems that the device is somehow wrongly
> >>>> configured and thinks there is another plane.
> >>>
> >>> Could we try to fix that instead ? There are IR sensors for which the
> >>> GREY format is useful.
> >>
> >> Hi, the doc is not very useful so I can try doing a bit trial and error.
> >> I see that there are several greyscale formats: [1]
> >> which make me think that maybe the device support one of the other greyscale formats.
> >> Do you know if some formats are more likely than other?
> > 
> > GREY seems the most likely (useful for IR sensors for instance, after
> > ISP processing). Formats with a higher bpp would require processing of
> > more than 8bpp through the ISP pipeline, I don't know if that's
> > supported.
> > 
> > Formats with a higher bpp (both greyscale and bayer formats) are also
> > useful to capture raw images (before ISP processing). Is that something
> > the hardware and driver support ?
> 
> hi, yes the variations of V4L2_PIX_FMT_Sxxxx10, V4L2_PIX_FMT_Sxxxx12
> are supported on mainpath.

That's nice. Does it bypass the whole ISP then ? Is it possible to
capture raw frames on the main path and processed frames on the self
path at the same time, or are we restricted to raw only when we capture
raw frames ?

> >> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-yuv-luma.html
> >>
> >>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >>>> ---
> >>>>    .../platform/rockchip/rkisp1/rkisp1-capture.c     | 15 ---------------
> >>>>    1 file changed, 15 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> >>>> index 768987d5f2dd..7f78f361dd5e 100644
> >>>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> >>>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> >>>> @@ -116,13 +116,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
> >>>>    		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> >>>>    		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >>>>    	},
> >>>> -	/* yuv400 */
> >>>> -	{
> >>>> -		.fourcc = V4L2_PIX_FMT_GREY,
> >>>> -		.uv_swap = 0,
> >>>> -		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> >>>> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >>>> -	},
> >>>>    	/* yuv420 */
> >>>>    	{
> >>>>    		.fourcc = V4L2_PIX_FMT_NV21,
> >>>> @@ -244,14 +237,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
> >>>>    		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> >>>>    		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >>>>    	},
> >>>> -	/* yuv400 */
> >>>> -	{
> >>>> -		.fourcc = V4L2_PIX_FMT_GREY,
> >>>> -		.uv_swap = 0,
> >>>> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> >>>> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
> >>>> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >>>> -	},
> >>>>    	/* rgb */
> >>>>    	{
> >>>>    		.fourcc = V4L2_PIX_FMT_XBGR32,

-- 
Regards,

Laurent Pinchart
