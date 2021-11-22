Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0189458E5B
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 13:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234228AbhKVMdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 07:33:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233240AbhKVMdT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 07:33:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EB6C061574
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 04:30:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16D0C14C3;
        Mon, 22 Nov 2021 13:30:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637584210;
        bh=gPAo5NSAoDvemSdjB40ouHKRT9R+9QXR6YujOxJz8ik=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rTSX5Da8K9uBELKS0pZJ8S2rAAjUChrdtFVL4YRFVJpeppvXViDqC5/s+jIv/JmUp
         ObTNupzUc1wpQ8sXmIWhwBUXPcqexI5suM5CiLP8y6bi3P5A6SW1ihVZ2arMMs6Hv2
         7s92h/5gevckmo/ItL12/efSIQcbZdPKNgY8Xpp8=
Date:   Mon, 22 Nov 2021 14:29:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: Re: [PATCH] media: rkisp1: remove support for V4L2_PIX_FMT_GREY
Message-ID: <YZuNOzlVWteTaNYt@pendragon.ideasonboard.com>
References: <20211120110257.22775-1-dafna.hirschfeld@collabora.com>
 <YZjrWdrZzyEE8G7g@pendragon.ideasonboard.com>
 <abc40fe3-6529-17f3-a6d3-4ab741afe849@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <abc40fe3-6529-17f3-a6d3-4ab741afe849@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Mon, Nov 22, 2021 at 01:20:47PM +0200, Dafna Hirschfeld wrote:
> On 20.11.21 14:34, Laurent Pinchart wrote:
> > On Sat, Nov 20, 2021 at 01:02:57PM +0200, Dafna Hirschfeld wrote:
> >> When trying to stream on both mainpatch and selfpatch
> >> with grey format, I get an iommu page fault.
> >> The fault is on the address at the end of the buffer,
> >> so it seems that the device is somehow wrongly
> >> configured and thinks there is another plane.
> > 
> > Could we try to fix that instead ? There are IR sensors for which the
> > GREY format is useful.
> 
> Hi, the doc is not very useful so I can try doing a bit trial and error.
> I see that there are several greyscale formats: [1]
> which make me think that maybe the device support one of the other greyscale formats.
> Do you know if some formats are more likely than other?

GREY seems the most likely (useful for IR sensors for instance, after
ISP processing). Formats with a higher bpp would require processing of
more than 8bpp through the ISP pipeline, I don't know if that's
supported.

Formats with a higher bpp (both greyscale and bayer formats) are also
useful to capture raw images (before ISP processing). Is that something
the hardware and driver support ?

> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-yuv-luma.html
> 
> >> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >> ---
> >>   .../platform/rockchip/rkisp1/rkisp1-capture.c     | 15 ---------------
> >>   1 file changed, 15 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> >> index 768987d5f2dd..7f78f361dd5e 100644
> >> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> >> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> >> @@ -116,13 +116,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
> >>   		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> >>   		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >>   	},
> >> -	/* yuv400 */
> >> -	{
> >> -		.fourcc = V4L2_PIX_FMT_GREY,
> >> -		.uv_swap = 0,
> >> -		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> >> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >> -	},
> >>   	/* yuv420 */
> >>   	{
> >>   		.fourcc = V4L2_PIX_FMT_NV21,
> >> @@ -244,14 +237,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
> >>   		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> >>   		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >>   	},
> >> -	/* yuv400 */
> >> -	{
> >> -		.fourcc = V4L2_PIX_FMT_GREY,
> >> -		.uv_swap = 0,
> >> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> >> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
> >> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >> -	},
> >>   	/* rgb */
> >>   	{
> >>   		.fourcc = V4L2_PIX_FMT_XBGR32,

-- 
Regards,

Laurent Pinchart
