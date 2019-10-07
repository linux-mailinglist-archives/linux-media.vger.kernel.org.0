Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12A61CE233
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 14:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbfJGMuO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 08:50:14 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46908 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727554AbfJGMuO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 08:50:14 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97CoC97010645;
        Mon, 7 Oct 2019 07:50:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570452612;
        bh=9IjfOP8gCGca/mlTC1I3oFYCzdJI7fhG+NZeTD0pUIs=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=mw1ZWcT08BC/AorG2DrXvwracfMbF27+AiLozRone9amKI19s72jm05huAB3nEnyF
         2k07kHAVfptBoYWQDHQRoMBcQ3dv+8i63JdmK/Gjs4PcrziRoz8gqEyrndM08o+C15
         cjBwthGUppsSdnFnm3GHlTcqprzXbnvgugaZmz+s=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97CoCGd097628
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 07:50:12 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 07:50:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 07:50:11 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id x97CoBik101734;
        Mon, 7 Oct 2019 07:50:11 -0500
Date:   Mon, 7 Oct 2019 07:52:45 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch v2 19/21] media: v4l2-common: add pixel encoding support
Message-ID: <20191007125245.zfysnop5xelitacf@ti.com>
References: <20191004162952.4963-1-bparrot@ti.com>
 <20191004162952.4963-20-bparrot@ti.com>
 <0118836c-f6d9-dccf-4e90-ede802c8be33@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0118836c-f6d9-dccf-4e90-ede802c8be33@xs4all.nl>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans Verkuil <hverkuil@xs4all.nl> wrote on Mon [2019-Oct-07 10:06:39 +0200]:
> On 10/4/19 6:29 PM, Benoit Parrot wrote:
> > It is often useful to figure out if a pixel_format is either YUV or RGB
> > especially for driver who can perform the pixel encoding conversion.
> > 
> > Instead of having each driver implement its own "is_this_yuv/rgb"
> > function based on a restricted set of pixel value, it is better to do
> > this in centralized manner.
> > 
> > We therefore add a pix_enc member to the v4l2_format_info structure to
> > quickly identify the related pixel encoding.
> > And add helper function to find/check pixel encoding.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 162 ++++++++++++++++----------
> >  include/media/v4l2-common.h           |  20 ++++
> >  2 files changed, 119 insertions(+), 63 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index 62f7aa92ac29..474cdb5863f4 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -236,77 +236,77 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
> >  {
> >  	static const struct v4l2_format_info formats[] = {
> >  		/* RGB formats */
> > -		{ .format = V4L2_PIX_FMT_BGR24,   .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_RGB24,   .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_HSV24,   .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_BGR32,   .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_XBGR32,  .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_BGRX32,  .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_RGB32,   .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_XRGB32,  .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_RGBX32,  .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_HSV32,   .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_ARGB32,  .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_RGBA32,  .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_ABGR32,  .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_BGRA32,  .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_GREY,    .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_BGR24,   .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_RGB24,   .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_HSV24,   .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_BGR32,   .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_XBGR32,  .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_BGRX32,  .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_RGB32,   .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_XRGB32,  .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_RGBX32,  .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_HSV32,   .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_ARGB32,  .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_RGBA32,  .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_ABGR32,  .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_BGRA32,  .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_GREY,    .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >  
> >  		/* YUV packed formats */
> > -		{ .format = V4L2_PIX_FMT_YUYV,    .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_YVYU,    .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_UYVY,    .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_VYUY,    .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_YUYV,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_YVYU,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_UYVY,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_VYUY,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> >  
> >  		/* YUV planar formats */
> > -		{ .format = V4L2_PIX_FMT_NV12,    .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> > -		{ .format = V4L2_PIX_FMT_NV21,    .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> > -		{ .format = V4L2_PIX_FMT_NV16,    .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_NV61,    .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_NV24,    .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_NV42,    .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -
> > -		{ .format = V4L2_PIX_FMT_YUV410,  .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 4 },
> > -		{ .format = V4L2_PIX_FMT_YVU410,  .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 4 },
> > -		{ .format = V4L2_PIX_FMT_YUV411P, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_YUV420,  .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> > -		{ .format = V4L2_PIX_FMT_YVU420,  .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> > -		{ .format = V4L2_PIX_FMT_YUV422P, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_NV12,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> > +		{ .format = V4L2_PIX_FMT_NV21,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> > +		{ .format = V4L2_PIX_FMT_NV16,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_NV61,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_NV24,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_NV42,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +
> > +		{ .format = V4L2_PIX_FMT_YUV410,  .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 4 },
> > +		{ .format = V4L2_PIX_FMT_YVU410,  .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 4 },
> > +		{ .format = V4L2_PIX_FMT_YUV411P, .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_YUV420,  .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> > +		{ .format = V4L2_PIX_FMT_YVU420,  .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> > +		{ .format = V4L2_PIX_FMT_YUV422P, .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1 },
> >  
> >  		/* YUV planar formats, non contiguous variant */
> > -		{ .format = V4L2_PIX_FMT_YUV420M, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> > -		{ .format = V4L2_PIX_FMT_YVU420M, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> > -		{ .format = V4L2_PIX_FMT_YUV422M, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_YVU422M, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_YUV444M, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_YVU444M, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 1, .vdiv = 1 },
> > -
> > -		{ .format = V4L2_PIX_FMT_NV12M,   .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> > -		{ .format = V4L2_PIX_FMT_NV21M,   .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> > -		{ .format = V4L2_PIX_FMT_NV16M,   .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_NV61M,   .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_YUV420M, .pix_enc = V4L2_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> > +		{ .format = V4L2_PIX_FMT_YVU420M, .pix_enc = V4L2_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> > +		{ .format = V4L2_PIX_FMT_YUV422M, .pix_enc = V4L2_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_YVU422M, .pix_enc = V4L2_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_YUV444M, .pix_enc = V4L2_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_YVU444M, .pix_enc = V4L2_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 1, .vdiv = 1 },
> > +
> > +		{ .format = V4L2_PIX_FMT_NV12M,   .pix_enc = V4L2_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> > +		{ .format = V4L2_PIX_FMT_NV21M,   .pix_enc = V4L2_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> > +		{ .format = V4L2_PIX_FMT_NV16M,   .pix_enc = V4L2_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_NV61M,   .pix_enc = V4L2_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> >  
> >  		/* Bayer RGB formats */
> > -		{ .format = V4L2_PIX_FMT_SBGGR8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SGBRG8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SGRBG8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SRGGB8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SBGGR10,	.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SGBRG10,	.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SGRBG10,	.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SRGGB10,	.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SBGGR10ALAW8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SGBRG10ALAW8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SGRBG10ALAW8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SRGGB10ALAW8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SBGGR10DPCM8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SGBRG10DPCM8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SGRBG10DPCM8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SRGGB10DPCM8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SBGGR12,	.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SGBRG12,	.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SGRBG12,	.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > -		{ .format = V4L2_PIX_FMT_SRGGB12,	.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SBGGR8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SGBRG8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SGRBG8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SRGGB8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SBGGR10,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SGBRG10,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SGRBG10,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SRGGB10,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SBGGR10ALAW8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SGBRG10ALAW8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SGRBG10ALAW8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SRGGB10ALAW8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SBGGR10DPCM8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SGBRG10DPCM8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SGRBG10DPCM8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SRGGB10DPCM8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SBGGR12,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SGBRG12,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SGRBG12,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > +		{ .format = V4L2_PIX_FMT_SRGGB12,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >  	};
> >  	unsigned int i;
> >  
> > @@ -317,6 +317,42 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
> >  }
> >  EXPORT_SYMBOL(v4l2_format_info);
> >  
> > +bool v4l2_is_format_rgb(u32 format)
> > +{
> > +	const struct v4l2_format_info *f;
> > +
> > +	f = v4l2_format_info(format);
> > +	if (f && f->pix_enc == V4L2_ENC_RGB)
> > +		return true;
> > +
> > +	return false;
> 
> This can be simplified to:
> 
> 	return f && f->pix_enc == V4L2_ENC_RGB;
> 
> Same for the other two functions below.

Ok I'll change that.

> 
> > +}
> > +EXPORT_SYMBOL(v4l2_is_format_rgb);
> > +
> > +bool v4l2_is_format_yuv(u32 format)
> > +{
> > +	const struct v4l2_format_info *f;
> > +
> > +	f = v4l2_format_info(format);
> > +	if (f && f->pix_enc == V4L2_ENC_YUV)
> > +		return true;
> > +
> > +	return false;
> > +}
> > +EXPORT_SYMBOL(v4l2_is_format_yuv);
> > +
> > +bool v4l2_is_format_bayer(u32 format)
> > +{
> > +	const struct v4l2_format_info *f;
> > +
> > +	f = v4l2_format_info(format);
> > +	if (f && f->pix_enc == V4L2_ENC_BAYER)
> > +		return true;
> > +
> > +	return false;
> > +}
> > +EXPORT_SYMBOL(v4l2_is_format_bayer);
> 
> That said, I am not sure I like these three functions. It leads to
> usage like this (from patch 21/21):
> 
> 	if (v4l2_is_format_yuv(src_fmt->fmt.pix_mp.pixelformat) &&
> 	    v4l2_is_format_rgb(dst_fmt->fmt.pix_mp.pixelformat)) {

Well it is called twice here because we are checking two different format,
so the loop are ineveitable, I am afraid.

But I guess it is also called in the "else" part in case this fails so it
might get called twice.

> 
> which is quite inefficient since v4l2_format_info() is called twice, so
> the same for-loop there is also done twice.
> 
> I think the caller should just call v4l2_format_info(), then test f->pix_enc.
> 
> You can also add something like this to v4l2-common.h:
> 
> static inline bool v4l2_is_format_yuv(const struct v4l2_format_info *f)
> {
> 	return f && f->pix_enc == V4L2_ENC_YUV;
> }
> 
> I'm fine with that.

I can store the format_info result I guess and use that.

> 
> > +
> >  static inline unsigned int v4l2_format_block_width(const struct v4l2_format_info *info, int plane)
> >  {
> >  	if (!info->block_w[plane])
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index c070d8ae11e5..27041cf2b818 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -456,9 +456,25 @@ int v4l2_s_parm_cap(struct video_device *vdev,
> >  
> >  /* Pixel format and FourCC helpers */
> >  
> > +/**
> > + * enum v4l2_pixel_encoding - specifies the pixel encoding value
> > + *
> > + * @V4L2_ENC_UNKNOWN:	Pixel encoding is unknown/un-initialized
> > + * @V4L2_ENC_YUV:	Pixel encoding is YUV
> > + * @V4L2_ENC_RGB:	Pixel encoding is RGB
> > + * @V4L2_ENC_BAYER:	Pixel encoding is Bayer
> > + */
> > +enum v4l2_pixel_encoding {
> > +	@V4L2_ENC_UNKNOWN = 0,
> > +	V4L2_ENC_YUV = 1,
> > +	V4L2_ENC_RGB = 2,
> > +	V4L2_ENC_BAYER = 3,
> > +};
> 
> Just plain _ENC_ is a bit too generic. I'd change this to _PIXEL_ENC_.

No problem.

> 
> > +
> >  /**
> >   * struct v4l2_format_info - information about a V4L2 format
> >   * @format: 4CC format identifier (V4L2_PIX_FMT_*)
> > + * @pix_enc: Pixel format encoding (see enum v4l2_pixel_encoding above)
> 
> Drop the 'format' word.

Agreed.

> 
> >   * @mem_planes: Number of memory planes, which includes the alpha plane (1 to 4).
> >   * @comp_planes: Number of component planes, which includes the alpha plane (1 to 4).
> >   * @bpp: Array of per-plane bytes per pixel
> > @@ -469,6 +485,7 @@ int v4l2_s_parm_cap(struct video_device *vdev,
> >   */
> >  struct v4l2_format_info {
> >  	u32 format;
> > +	u8 pix_enc;
> 
> I would prefer pixel_enc instead of pix_enc.

I'll fix that.

Benoit

> 
> >  	u8 mem_planes;
> >  	u8 comp_planes;
> >  	u8 bpp[4];
> > @@ -479,6 +496,9 @@ struct v4l2_format_info {
> >  };
> >  
> >  const struct v4l2_format_info *v4l2_format_info(u32 format);
> > +bool v4l2_is_format_rgb(u32 format);
> > +bool v4l2_is_format_yuv(u32 format);
> > +bool v4l2_is_format_bayer(u32 format);
> >  
> >  void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
> >  				    const struct v4l2_frmsize_stepwise *frmsize);
> > 
> 
> Regards,
> 
> 	Hans
