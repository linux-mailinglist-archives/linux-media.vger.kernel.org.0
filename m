Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFCF119EE77
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 01:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727652AbgDEXAs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Apr 2020 19:00:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34506 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbgDEXAs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Apr 2020 19:00:48 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73B45312;
        Mon,  6 Apr 2020 01:00:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586127646;
        bh=1nm8g4uUajHc8yxwMII80sm9goTSuR4xERYLGYq2eas=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J1lZPDIMsu5G/T1p0GvHo0jbk1SM3WHZVlUZu9tbgLv5tJGLVrPrCi8GfOlyNa1Ix
         cgcJBvbCdibWv62ZT7QY+trmvMymKSi0e/uEuRMogyEZDrFmQnvvA4mYVj4AyP0wbb
         Zz1nqSgGrwwG9WUzAG89x5ifGu73vIwTqHXJcO/U=
Date:   Mon, 6 Apr 2020 02:00:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, helen.koike@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH] media: v4l2-common: change the pixel_enc of
 V4L2_PIX_FMT_GREY to YUV
Message-ID: <20200405230037.GT5846@pendragon.ideasonboard.com>
References: <20200323173618.14058-1-dafna.hirschfeld@collabora.com>
 <9304066ca10c9ccdf8a5fd88866425a5f45a330a.camel@collabora.com>
 <ef6fd691-c8ca-9408-76b4-e47aca0fc9b4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ef6fd691-c8ca-9408-76b4-e47aca0fc9b4@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Tue, Mar 31, 2020 at 09:20:49AM +0200, Dafna Hirschfeld wrote:
> On 30.03.20 20:22, Ezequiel Garcia wrote:
> > Hi Dafna,
> > 
> > Nice catch, thanks a lot.
>
> Hi, It was actually Helen's idea,
> 
> > On Mon, 2020-03-23 at 18:36 +0100, Dafna Hirschfeld wrote:
> >> V4L2_PIX_FMT_GREY format is Ycbcr format without
> > 
> > A nitpick s/Ycbcr/YCbCr. Maybe Hans can amend
> > this when applying.
> > 
> > It's no big deal anyway.
> > 
> > Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> > 
> >> the color data, therefore its pixel_enc should
> >> set to V4L2_PIXEL_ENC_YUV.
> >>
> >> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>
> Suggested-by: Helen Koike <helen.koike@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> >> ---
> >>   drivers/media/v4l2-core/v4l2-common.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> >> index d0e5ebc736f9..054f2e607dff 100644
> >> --- a/drivers/media/v4l2-core/v4l2-common.c
> >> +++ b/drivers/media/v4l2-core/v4l2-common.c
> >> @@ -250,7 +250,6 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
> >>   		{ .format = V4L2_PIX_FMT_RGBA32,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >>   		{ .format = V4L2_PIX_FMT_ABGR32,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >>   		{ .format = V4L2_PIX_FMT_BGRA32,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >> -		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >>   		{ .format = V4L2_PIX_FMT_RGB565,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >>   		{ .format = V4L2_PIX_FMT_RGB555,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >>   
> >> @@ -274,6 +273,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
> >>   		{ .format = V4L2_PIX_FMT_YUV420,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> >>   		{ .format = V4L2_PIX_FMT_YVU420,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> >>   		{ .format = V4L2_PIX_FMT_YUV422P, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1 },
> >> +		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >>   
> >>   		/* YUV planar formats, non contiguous variant */
> >>   		{ .format = V4L2_PIX_FMT_YUV420M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },

-- 
Regards,

Laurent Pinchart
