Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E21019E7B
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 15:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbfEJNvW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 09:51:22 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:36331 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727261AbfEJNvV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 09:51:21 -0400
Received: by mail-qk1-f193.google.com with SMTP id c14so3699102qke.3
        for <linux-media@vger.kernel.org>; Fri, 10 May 2019 06:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KdLJdmWc/A0FbGvK9NtD7jc+LzhwzZbiSdsPy/m0Yqc=;
        b=L2e4AKwvKKJq+xR9TZ4IUmWk4OdtDr0e08lrM8zhCAOufsBLQSyAIWr5oeXUfYJ4XO
         6DLGyPW5uV8BUTtai0n14oXwV8Z55icQVejpP85MeNFaT6sQYuz3GwKfddw3MdOohSxB
         7+jLEF+R39QRF35zOhvRpFPJiLl+lH13bFwKbgdqSzoT1uRxLFfUJAQCJvRASaRvCUyS
         dsix9Alnl4nI+eXrNSPvKMGHCzXjmODwjqAJ1TG2FnPWCCAmWAAJU+c/aV2h9KNtUI9q
         cJMT4r0AGsdbv5yLrFJDyhqBQKBAxltdqsAgHmsDZhFA+xRDmLqUxX9ecjghDUrqg3fq
         QB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KdLJdmWc/A0FbGvK9NtD7jc+LzhwzZbiSdsPy/m0Yqc=;
        b=k+R3Cn9Tjnf7r/SPPPnH/isK/rU6ftnsVKwRBbnsT+cVCvZ7frabjPHY/Ta2UwU2pL
         RFXFRI53RjGPAplSjX+xncldrCQxIRNXMZTShj6167mPsYeU09ZCepsn953VpHF2BDjv
         qzlOD6F7mrOI3Y5dM14x7pAL+NcVSaW+Y71kWV2b/Sj/jG8gmh2KMuED3MreXTeO8P3x
         RUQ2tWkYdN5OFqcI8IQwt+lcoMJWGTtbS3Hwu5ncIyPFCssZc4ADvirQ5clLXtCMcP5V
         oga+J+bFJBNGrRGpkQH15iwRetN3RHYeK7FenjRT0hVbFnDAdLL+n6wcGuFkht/CRjB5
         Ty2g==
X-Gm-Message-State: APjAAAXD+oZxY6btLVIOr9Oc81/ssoUiELippLZ4MbYKU4pRDZJ3MuMp
        uIpW/87BOaM0PKtSSqceMXdTSQ==
X-Google-Smtp-Source: APXvYqxJgG5iTxmYWTijkc8G0gT+VoOiiKQbWM+JFKboH7XkWp4oCFxWk964BE5OPmlXsH8xB3EeVw==
X-Received: by 2002:a37:a794:: with SMTP id q142mr8990696qke.36.1557496280475;
        Fri, 10 May 2019 06:51:20 -0700 (PDT)
Received: from skullcanyon ([2002:c0de:c115:0:481e:e17e:2f68:43f8])
        by smtp.gmail.com with ESMTPSA id a1sm2409655qth.69.2019.05.10.06.51.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 10 May 2019 06:51:19 -0700 (PDT)
Message-ID: <106a6aa5fe62cf5b18652b667d15bc8677790cad.camel@ndufresne.ca>
Subject: Re: [PATCH v5 03/15] media: v4l2-common: Support custom
 imagesize/bytesperline in fill_pixfmt()
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Date:   Fri, 10 May 2019 09:51:17 -0400
In-Reply-To: <f9ffc9ae-2c27-2883-7f62-9931597c8e75@xs4all.nl>
References: <20190503114719.28784-1-boris.brezillon@collabora.com>
         <20190503114719.28784-4-boris.brezillon@collabora.com>
         <0c5a648c-27a8-8195-8ad9-8cefb4369837@xs4all.nl>
         <20190510112847.GA4972@pendragon.ideasonboard.com>
         <c2d02ffb-5273-67a8-1a3a-c7268dc7bfb6@xs4all.nl>
         <20190510122411.GB4972@pendragon.ideasonboard.com>
         <f9ffc9ae-2c27-2883-7f62-9931597c8e75@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 (3.32.1-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 10 mai 2019 à 14:30 +0200, Hans Verkuil a écrit :
> On 5/10/19 2:24 PM, Laurent Pinchart wrote:
> > Hi Hans,
> > 
> > On Fri, May 10, 2019 at 02:17:32PM +0200, Hans Verkuil wrote:
> > > On 5/10/19 1:28 PM, Laurent Pinchart wrote:
> > > > On Fri, May 10, 2019 at 10:57:26AM +0200, Hans Verkuil wrote:
> > > > > On 5/3/19 1:47 PM, Boris Brezillon wrote:
> > > > > > Users can define custom sizeimage and bytesperline as long as they're
> > > > > > big enough to store the amount of pixels required for a specific
> > > > > > width/height under a specific format. Avoid overriding those fields in
> > > > > > this case.
> > > > > > 
> > > > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > > > ---
> > > > > > Hello Hans,
> > > > > > 
> > > > > > The sizeimage/bytesperline check on !MPLANE formats is still not 100%
> > > > > > sure, as custom bytesperline might induce bigger sizeimage than what
> > > > > > we calculate.
> > > > > > 
> > > > > > I tried implementing something smarter taking the per-component plane
> > > > > > bpp + hdiv param as we discussed the other day but decided to step
> > > > > > back after realizing the per-component plane macro block might also
> > > > > > differ at least in theory (not sure that's true in practice) and that
> > > > > > has an impact on bytesperline too.
> > > > > > 
> > > > > > Let me know how you want to handle that case.
> > > > > > 
> > > > > > Regards,
> > > > > > 
> > > > > > Boris
> > > > > > 
> > > > > > Changes in v5:
> > > > > > * New patch
> > > > > > ---
> > > > > >  drivers/media/v4l2-core/v4l2-common.c | 54 +++++++++++++++++++--------
> > > > > >  1 file changed, 39 insertions(+), 15 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > > > > > index 3c6f5c115fc5..37bfc984a8b5 100644
> > > > > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > > > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > > > > @@ -563,9 +563,10 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> > > > > >  	pixfmt->num_planes = info->mem_planes;
> > > > > >  
> > > > > >  	if (info->mem_planes == 1) {
> > > > > > +		u32 bytesperline, sizeimage = 0;
> > > > > > +
> > > > > >  		plane = &pixfmt->plane_fmt[0];
> > > > > > -		plane->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
> > > > > > -		plane->sizeimage = 0;
> > > > > > +		bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
> > > > > >  
> > > > > >  		for (i = 0; i < info->comp_planes; i++) {
> > > > > >  			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
> > > > > > @@ -576,10 +577,17 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> > > > > >  			aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
> > > > > >  			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
> > > > > >  
> > > > > > -			plane->sizeimage += info->bpp[i] *
> > > > > > -				DIV_ROUND_UP(aligned_width, hdiv) *
> > > > > > -				DIV_ROUND_UP(aligned_height, vdiv);
> > > > > > +			sizeimage += info->bpp[i] *
> > > > > > +				     DIV_ROUND_UP(aligned_width, hdiv) *
> > > > > > +				     DIV_ROUND_UP(aligned_height, vdiv);
> > > > > >  		}
> > > > > > +
> > > > > > +		/*
> > > > > > +		 * The user might have specified custom sizeimage/bytesperline,
> > > > > > +		 * only override them if they're not big enough.
> > > > > > +		 */
> > > > > > +		plane->sizeimage = max(sizeimage, plane->sizeimage);
> > > > > > +		plane->bytesperline = max(bytesperline, plane->bytesperline);
> > > > > 
> > > > > Let's just set bytesperline, ignoring the value the user supplied. There are very
> > > > > few drivers that allow the user to set bytesperline anyway, so it's not a big deal
> > > > > to drop support for that for now. We can add it back later.
> > > > > 
> > > > > Just add a comment that a user-defined bytesperline value isn't currently supported.
> > > > 
> > > > Kieran recently ran into an issue related to this, when sharing buffers
> > > > between a CSI-2 receiver and an ISP. The ISP has alignment constraints
> > > > in both the horizontal and vertical directions on the line stride and
> > > > total image size. Out software framework currently allocates buffers
> > > > from the CSI-2 receiver which doesn't have those constraints, and not
> > > > being able to specify sizeimage is thus a problem.
> > > 
> > > Not being able to specify sizeimage where? From userspace? Sorry, I don't
> > > quite understand the specific issue here.
> > 
> > Yes, from userspace.
> 
> Ah, OK. But why not use CREATEBUFS? You can provide your own size when allocating
> the buffers.
> 
> Also note this patch: https://patchwork.linuxtv.org/patch/55656/
> 
> Although this is specific for compressed formats.

While this work for compressed formats, it does not do anything for raw
image horizontal padding. The importation bit of V4L2 is pretty
difficult, so if we add helpers, we should load the way and simplify
things for userspace rather then enforcing the existing difficulty.

I think from now own we should design with the mindset that a DMABuf
that cannot be imported back into another driver due to software
limitations is a useless waste of FD.

Nicolas

> 
> Regards,
> 
> 	Hans
> 
> > > > We have worked around this by allocating buffers on the ISP side but
> > > > that departed from the normal way of operation, and it may not be a good
> > > > idea to carry that forward.
> > > > 
> > > > I wonder how we should solve these issues long term. A central memory
> > > > allocator is probably the way to go.
> > > > 
> > > > > >  	} else {
> > > > > >  		for (i = 0; i < info->comp_planes; i++) {
> > > > > >  			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
> > > > > > @@ -591,10 +599,20 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> > > > > >  			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
> > > > > >  
> > > > > >  			plane = &pixfmt->plane_fmt[i];
> > > > > > -			plane->bytesperline =
> > > > > > -				info->bpp[i] * DIV_ROUND_UP(aligned_width, hdiv);
> > > > > > -			plane->sizeimage =
> > > > > > -				plane->bytesperline * DIV_ROUND_UP(aligned_height, vdiv);
> > > > > > +
> > > > > > +			/*
> > > > > > +			 * The user might have specified custom
> > > > > > +			 * sizeimage/bytesperline, only override them if
> > > > > > +			 * they're not big enough.
> > > > > > +			 */
> > > > > > +			plane->bytesperline = max_t(u32,
> > > > > > +						    info->bpp[i] *
> > > > > > +						    DIV_ROUND_UP(aligned_width, hdiv),
> > > > > > +						    plane->bytesperline);
> > > > > > +			plane->sizeimage = max_t(u32,
> > > > > > +						 plane->bytesperline *
> > > > > > +						 DIV_ROUND_UP(aligned_height, vdiv),
> > > > > > +						 plane->sizeimage);
> > > > > >  		}
> > > > > >  	}
> > > > > >  	return 0;
> > > > > > @@ -605,6 +623,7 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > > > > >  		     u32 width, u32 height)
> > > > > >  {
> > > > > >  	const struct v4l2_format_info *info;
> > > > > > +	u32 bytesperline, sizeimage = 0;
> > > > > >  	int i;
> > > > > >  
> > > > > >  	info = v4l2_format_info(pixelformat);
> > > > > > @@ -618,8 +637,7 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > > > > >  	pixfmt->width = width;
> > > > > >  	pixfmt->height = height;
> > > > > >  	pixfmt->pixelformat = pixelformat;
> > > > > > -	pixfmt->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
> > > > > > -	pixfmt->sizeimage = 0;
> > > > > > +	bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
> > > > > >  
> > > > > >  	for (i = 0; i < info->comp_planes; i++) {
> > > > > >  		unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
> > > > > > @@ -629,11 +647,17 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > > > > >  
> > > > > >  		aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
> > > > > >  		aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
> > > > > > -
> > > > > > -		pixfmt->sizeimage += info->bpp[i] *
> > > > > > -			DIV_ROUND_UP(aligned_width, hdiv) *
> > > > > > -			DIV_ROUND_UP(aligned_height, vdiv);
> > > > > > +		sizeimage += info->bpp[i] * DIV_ROUND_UP(aligned_width, hdiv) *
> > > > > > +			     DIV_ROUND_UP(aligned_height, vdiv);
> > > > > >  	}
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * The user might have specified its own sizeimage/bytesperline values,
> > > > > > +	 * only override them if they're not big enough.
> > > > > > +	 */
> > > > > > +	pixfmt->sizeimage = max(sizeimage, pixfmt->sizeimage);
> > > > > > +	pixfmt->bytesperline = max(bytesperline, pixfmt->bytesperline);
> > > > > > +
> > > > > >  	return 0;
> > > > > >  }
> > > > > >  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);

