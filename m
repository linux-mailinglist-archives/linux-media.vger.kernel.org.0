Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C628F2DC49
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 13:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfE2L7F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 07:59:05 -0400
Received: from casper.infradead.org ([85.118.1.10]:40524 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbfE2L7F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 07:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=4FOP+cdw/bEEkj54zLhsTbxhlfvZyibbXIsoAM6DTxc=; b=Ec2v18sAGbyavvlg1at7fabhvK
        uAzYtMYEtXo+OmjQEqWx+tn3QyQLB3C5zDjdwkG0JSYAutcSGBe6W7to2Uji+0UmX6VIxcHhQzZ7G
        ArMy36ztb9VRsQMV98Yk4Op2156DJICODsDjBZ02hY1jMOEXXEfhBvrq8DPsKK0nAF92FHI4uYcp6
        xGLDtb5VCBCo1ImY73GhWVuOb2EN9mcYP4mGrv9sATGtrApyse0LZUCcO06n2yvdxOVIg+YLzHuue
        lxqRwMYab9LAZTffxV1FDSQlFZkhkXW2vTthbPT09P+KjkmectisVSBSa1D4Bq9CDK72XxXaqL5PZ
        wQEp7Vvg==;
Received: from 177.132.232.81.dynamic.adsl.gvt.net.br ([177.132.232.81] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hVxES-0005it-Is; Wed, 29 May 2019 11:59:01 +0000
Date:   Wed, 29 May 2019 08:58:54 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v6 03/16] media: v4l2-common: Support custom imagesize
 in fill_pixfmt()
Message-ID: <20190529085854.6c689f8d@coco.lan>
In-Reply-To: <cc51be76-81c3-1c54-2005-1b99d00a8ac1@xs4all.nl>
References: <20190528170232.2091-1-ezequiel@collabora.com>
        <20190528170232.2091-4-ezequiel@collabora.com>
        <20190529082809.0b9f3553@coco.lan>
        <cc51be76-81c3-1c54-2005-1b99d00a8ac1@xs4all.nl>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 29 May 2019 13:43:20 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 5/29/19 1:28 PM, Mauro Carvalho Chehab wrote:
> > Em Tue, 28 May 2019 14:02:19 -0300
> > Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> >   
> >> From: Boris Brezillon <boris.brezillon@collabora.com>
> >>
> >> Users can define custom sizeimage as long as they're big enough to
> >> store the amount of pixels required for a specific width/height under a
> >> specific format. Avoid overriding those fields in this case.
> >>
> >> We could possibly do the same for bytesperline, but it gets tricky when
> >> dealing with !MPLANE definitions, so this case is omitted for now and  
> >> ->bytesperline is always overwritten with the value calculated in  
> >> fill_pixfmt().
> >>
> >> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >> ---
> >> Changes from v5:
> >> * Overwrite bytesperline with the value calculated in fill_pixfmt()
> >>
> >> Changes from v4:
> >> * New patch
> >>
> >>  drivers/media/v4l2-core/v4l2-common.c | 58 ++++++++++++++++++++-------
> >>  1 file changed, 43 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> >> index b2d1e55d9561..fd286f6e17d7 100644
> >> --- a/drivers/media/v4l2-core/v4l2-common.c
> >> +++ b/drivers/media/v4l2-core/v4l2-common.c
> >> @@ -585,9 +585,9 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> >>  	pixfmt->num_planes = info->mem_planes;
> >>  
> >>  	if (info->mem_planes == 1) {
> >> +		u32 sizeimage = 0;
> >> +
> >>  		plane = &pixfmt->plane_fmt[0];
> >> -		plane->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
> >> -		plane->sizeimage = 0;
> >>  
> >>  		for (i = 0; i < info->comp_planes; i++) {
> >>  			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
> >> @@ -598,10 +598,21 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> >>  			aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
> >>  			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
> >>  
> >> -			plane->sizeimage += info->bpp[i] *
> >> -				DIV_ROUND_UP(aligned_width, hdiv) *
> >> -				DIV_ROUND_UP(aligned_height, vdiv);
> >> +			sizeimage += info->bpp[i] *
> >> +				     DIV_ROUND_UP(aligned_width, hdiv) *
> >> +				     DIV_ROUND_UP(aligned_height, vdiv);
> >>  		}
> >> +
> >> +		/* Custom bytesperline value is not supported yet. */
> >> +		plane->bytesperline = ALIGN(width,
> >> +					    v4l2_format_block_width(info, 0)) *
> >> +				      info->bpp[0];
> >> +
> >> +		/*
> >> +		 * The user might have specified a custom sizeimage, only
> >> +		 * override it if it's not big enough.
> >> +		 */
> >> +		plane->sizeimage = max(sizeimage, plane->sizeimage);  
> > 
> > No upper limit? That doesn't sound a good idea to me, specially since some
> > (broken) app might not be memset the format to zero before filling the ioctl
> > structure.
> > 
> > Perhaps we could do something like:
> > 
> > 		sizeimage = min (sizeimage, 2 * plane->sizeimage)
> > 
> > or something similar that would be reasonable.  
> 
> I've no idea what's sane.
> 
> Buffers can be really large. The largest video resolution defined by CTA-861-G
> is 10240x4320, so at 4 bytes per pixel that's 0x0a8c0000. So perhaps we can
> use min(sizeimage, 0x10000000)? Although we should probably use the clamp function
> instead of min/max.

Well, the max is driver-specific. 

For example, for a camera with a max resolution of 640x480 with 2 bytes
per pixel as the max format can only be

	max_size = 640*480*2 (plus some alignment value if pertinent)

It sounds to me that the best would be to have a callback function
or value filled by the drivers that would support custom sizeimage.

The core could actually calculate during init (by asking the driver
to a very big resolution and getting the returned value), but
it sounds better to let the drivers to explicitly calculate it.

> 
> Regards,
> 
> 	Hans
> 
> >   
> >>  	} else {
> >>  		for (i = 0; i < info->comp_planes; i++) {
> >>  			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
> >> @@ -613,10 +624,19 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> >>  			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
> >>  
> >>  			plane = &pixfmt->plane_fmt[i];
> >> -			plane->bytesperline =
> >> -				info->bpp[i] * DIV_ROUND_UP(aligned_width, hdiv);
> >> -			plane->sizeimage =
> >> -				plane->bytesperline * DIV_ROUND_UP(aligned_height, vdiv);  
> >   
> >> +
> >> +			/* Custom bytesperline value is not supported yet. */  
> > 
> > Supporting custom bytesperline seems too risky of breaking apps. 
> > So, I would drop this comment.
> > 
> >   
> >> +			plane->bytesperline = info->bpp[i] *
> >> +					      DIV_ROUND_UP(aligned_width, hdiv);  
> >   
> >> +
> >> +			/*
> >> +			 * The user might have specified a custom sizeimage,
> >> +			 * only override it if it's not big enough.
> >> +			 */
> >> +			plane->sizeimage = max_t(u32,
> >> +						 plane->bytesperline *
> >> +						 DIV_ROUND_UP(aligned_height, vdiv),
> >> +						 plane->sizeimage);
> >>  		}
> >>  	}
> >>  	return 0;
> >> @@ -627,6 +647,7 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> >>  		     u32 width, u32 height)
> >>  {
> >>  	const struct v4l2_format_info *info;
> >> +	u32 sizeimage = 0;
> >>  	int i;
> >>  
> >>  	info = v4l2_format_info(pixelformat);
> >> @@ -640,8 +661,6 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> >>  	pixfmt->width = width;
> >>  	pixfmt->height = height;
> >>  	pixfmt->pixelformat = pixelformat;
> >> -	pixfmt->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
> >> -	pixfmt->sizeimage = 0;
> >>  
> >>  	for (i = 0; i < info->comp_planes; i++) {
> >>  		unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
> >> @@ -651,11 +670,20 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> >>  
> >>  		aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
> >>  		aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
> >> -
> >> -		pixfmt->sizeimage += info->bpp[i] *
> >> -			DIV_ROUND_UP(aligned_width, hdiv) *
> >> -			DIV_ROUND_UP(aligned_height, vdiv);
> >> +		sizeimage += info->bpp[i] * DIV_ROUND_UP(aligned_width, hdiv) *
> >> +			     DIV_ROUND_UP(aligned_height, vdiv);
> >>  	}
> >> +
> >> +	/* Custom bytesperline value is not supported yet. */
> >> +	pixfmt->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) *
> >> +			       info->bpp[0];
> >> +
> >> +	/*
> >> +	 * The user might have specified its own sizeimage value, only override
> >> +	 * it if it's not big enough.
> >> +	 */
> >> +	pixfmt->sizeimage = max(sizeimage, pixfmt->sizeimage);
> >> +  
> > 
> > Same comment applies here: We need to sanitize it from too big sizeimages.
> >   
> >>  	return 0;
> >>  }
> >>  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);  
> > 
> > 
> > 
> > Thanks,
> > Mauro
> >   
> 



Thanks,
Mauro
