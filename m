Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE77F19D26
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 14:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbfEJMY2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 08:24:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36784 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbfEJMY2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 08:24:28 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD4382DF;
        Fri, 10 May 2019 14:24:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557491066;
        bh=e/QSIEJSNUz1Vjigu3B1BwMtx26DCDQZJKMbNQvHoao=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wA4wc/9K5+i0PLs61dHj23JTh6J8igieebMI51B19UpuB1Ljxi2nK+6KJt77fIB8P
         1mnyE0Q4QlsZFwugVP1xtM0uLwT2+6L0PfaSig9JR1VGHx+19TkeOmXsewh6sq4uOf
         lIchc8BxK4W4XelQF63Og132TQs6QyC9lH6H6mZc=
Date:   Fri, 10 May 2019 15:24:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v5 03/15] media: v4l2-common: Support custom
 imagesize/bytesperline in fill_pixfmt()
Message-ID: <20190510122411.GB4972@pendragon.ideasonboard.com>
References: <20190503114719.28784-1-boris.brezillon@collabora.com>
 <20190503114719.28784-4-boris.brezillon@collabora.com>
 <0c5a648c-27a8-8195-8ad9-8cefb4369837@xs4all.nl>
 <20190510112847.GA4972@pendragon.ideasonboard.com>
 <c2d02ffb-5273-67a8-1a3a-c7268dc7bfb6@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c2d02ffb-5273-67a8-1a3a-c7268dc7bfb6@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, May 10, 2019 at 02:17:32PM +0200, Hans Verkuil wrote:
> On 5/10/19 1:28 PM, Laurent Pinchart wrote:
> > On Fri, May 10, 2019 at 10:57:26AM +0200, Hans Verkuil wrote:
> >> On 5/3/19 1:47 PM, Boris Brezillon wrote:
> >>> Users can define custom sizeimage and bytesperline as long as they're
> >>> big enough to store the amount of pixels required for a specific
> >>> width/height under a specific format. Avoid overriding those fields in
> >>> this case.
> >>>
> >>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >>> ---
> >>> Hello Hans,
> >>>
> >>> The sizeimage/bytesperline check on !MPLANE formats is still not 100%
> >>> sure, as custom bytesperline might induce bigger sizeimage than what
> >>> we calculate.
> >>>
> >>> I tried implementing something smarter taking the per-component plane
> >>> bpp + hdiv param as we discussed the other day but decided to step
> >>> back after realizing the per-component plane macro block might also
> >>> differ at least in theory (not sure that's true in practice) and that
> >>> has an impact on bytesperline too.
> >>>
> >>> Let me know how you want to handle that case.
> >>>
> >>> Regards,
> >>>
> >>> Boris
> >>>
> >>> Changes in v5:
> >>> * New patch
> >>> ---
> >>>  drivers/media/v4l2-core/v4l2-common.c | 54 +++++++++++++++++++--------
> >>>  1 file changed, 39 insertions(+), 15 deletions(-)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> >>> index 3c6f5c115fc5..37bfc984a8b5 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-common.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-common.c
> >>> @@ -563,9 +563,10 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> >>>  	pixfmt->num_planes = info->mem_planes;
> >>>  
> >>>  	if (info->mem_planes == 1) {
> >>> +		u32 bytesperline, sizeimage = 0;
> >>> +
> >>>  		plane = &pixfmt->plane_fmt[0];
> >>> -		plane->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
> >>> -		plane->sizeimage = 0;
> >>> +		bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
> >>>  
> >>>  		for (i = 0; i < info->comp_planes; i++) {
> >>>  			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
> >>> @@ -576,10 +577,17 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> >>>  			aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
> >>>  			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
> >>>  
> >>> -			plane->sizeimage += info->bpp[i] *
> >>> -				DIV_ROUND_UP(aligned_width, hdiv) *
> >>> -				DIV_ROUND_UP(aligned_height, vdiv);
> >>> +			sizeimage += info->bpp[i] *
> >>> +				     DIV_ROUND_UP(aligned_width, hdiv) *
> >>> +				     DIV_ROUND_UP(aligned_height, vdiv);
> >>>  		}
> >>> +
> >>> +		/*
> >>> +		 * The user might have specified custom sizeimage/bytesperline,
> >>> +		 * only override them if they're not big enough.
> >>> +		 */
> >>> +		plane->sizeimage = max(sizeimage, plane->sizeimage);
> >>> +		plane->bytesperline = max(bytesperline, plane->bytesperline);
> >>
> >> Let's just set bytesperline, ignoring the value the user supplied. There are very
> >> few drivers that allow the user to set bytesperline anyway, so it's not a big deal
> >> to drop support for that for now. We can add it back later.
> >>
> >> Just add a comment that a user-defined bytesperline value isn't currently supported.
> > 
> > Kieran recently ran into an issue related to this, when sharing buffers
> > between a CSI-2 receiver and an ISP. The ISP has alignment constraints
> > in both the horizontal and vertical directions on the line stride and
> > total image size. Out software framework currently allocates buffers
> > from the CSI-2 receiver which doesn't have those constraints, and not
> > being able to specify sizeimage is thus a problem.
> 
> Not being able to specify sizeimage where? From userspace? Sorry, I don't
> quite understand the specific issue here.

Yes, from userspace.

> > We have worked around this by allocating buffers on the ISP side but
> > that departed from the normal way of operation, and it may not be a good
> > idea to carry that forward.
> > 
> > I wonder how we should solve these issues long term. A central memory
> > allocator is probably the way to go.
> > 
> >>>  	} else {
> >>>  		for (i = 0; i < info->comp_planes; i++) {
> >>>  			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
> >>> @@ -591,10 +599,20 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> >>>  			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
> >>>  
> >>>  			plane = &pixfmt->plane_fmt[i];
> >>> -			plane->bytesperline =
> >>> -				info->bpp[i] * DIV_ROUND_UP(aligned_width, hdiv);
> >>> -			plane->sizeimage =
> >>> -				plane->bytesperline * DIV_ROUND_UP(aligned_height, vdiv);
> >>> +
> >>> +			/*
> >>> +			 * The user might have specified custom
> >>> +			 * sizeimage/bytesperline, only override them if
> >>> +			 * they're not big enough.
> >>> +			 */
> >>> +			plane->bytesperline = max_t(u32,
> >>> +						    info->bpp[i] *
> >>> +						    DIV_ROUND_UP(aligned_width, hdiv),
> >>> +						    plane->bytesperline);
> >>> +			plane->sizeimage = max_t(u32,
> >>> +						 plane->bytesperline *
> >>> +						 DIV_ROUND_UP(aligned_height, vdiv),
> >>> +						 plane->sizeimage);
> >>>  		}
> >>>  	}
> >>>  	return 0;
> >>> @@ -605,6 +623,7 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> >>>  		     u32 width, u32 height)
> >>>  {
> >>>  	const struct v4l2_format_info *info;
> >>> +	u32 bytesperline, sizeimage = 0;
> >>>  	int i;
> >>>  
> >>>  	info = v4l2_format_info(pixelformat);
> >>> @@ -618,8 +637,7 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> >>>  	pixfmt->width = width;
> >>>  	pixfmt->height = height;
> >>>  	pixfmt->pixelformat = pixelformat;
> >>> -	pixfmt->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
> >>> -	pixfmt->sizeimage = 0;
> >>> +	bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
> >>>  
> >>>  	for (i = 0; i < info->comp_planes; i++) {
> >>>  		unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
> >>> @@ -629,11 +647,17 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> >>>  
> >>>  		aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
> >>>  		aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
> >>> -
> >>> -		pixfmt->sizeimage += info->bpp[i] *
> >>> -			DIV_ROUND_UP(aligned_width, hdiv) *
> >>> -			DIV_ROUND_UP(aligned_height, vdiv);
> >>> +		sizeimage += info->bpp[i] * DIV_ROUND_UP(aligned_width, hdiv) *
> >>> +			     DIV_ROUND_UP(aligned_height, vdiv);
> >>>  	}
> >>> +
> >>> +	/*
> >>> +	 * The user might have specified its own sizeimage/bytesperline values,
> >>> +	 * only override them if they're not big enough.
> >>> +	 */
> >>> +	pixfmt->sizeimage = max(sizeimage, pixfmt->sizeimage);
> >>> +	pixfmt->bytesperline = max(bytesperline, pixfmt->bytesperline);
> >>> +
> >>>  	return 0;
> >>>  }
> >>>  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);

-- 
Regards,

Laurent Pinchart
