Return-Path: <linux-media+bounces-10315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7398B5338
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 10:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20B582809B2
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 08:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4D8175A4;
	Mon, 29 Apr 2024 08:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iNsbIwwq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B3F14A98
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714379618; cv=none; b=F4zv0asXGx1fIkbxsJS8VNgBjUo8sFyzc7j0XIFWvQiqP/sGWetO1jsRClN+IG/CiNggSeCDdCpVHMATwl62x72WxMiOqhq31Fi2Lyt+y/oLKEU01/osSgnBmVua8SO4IM+OlTG0m8q/p+OnOo5kOD+f+bfbHsjZ8zZeVNDSdvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714379618; c=relaxed/simple;
	bh=IZTdejnUtUN9+kZJzvjJz8C9E4u7aXX66sQohQvrrLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhaWOTkqr2bZvCKpUTzvT7jo01H3K5TNl0ek4A5TEIPm+AreUHjCXQeETW2jWFhpB2LUdKjypR3V6yjfxl9cTzAznIZghv3kep7j72HcuQV7ItIbL/ZyQYh+Ki08N59x3X3uDV0nq9tACOH9JYX/3Ka+0Me20zSg9GdffgBe9GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iNsbIwwq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FF594AB;
	Mon, 29 Apr 2024 10:32:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714379557;
	bh=IZTdejnUtUN9+kZJzvjJz8C9E4u7aXX66sQohQvrrLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iNsbIwwqGpn5hL+yZCsGetxXnHI0R70B28QygaZvm5Yrff81LiQ3EdQHVsJnrcwPn
	 K+2pVMvALmSHZacPbCv9ISnkgw2oONv+GnebDOrdFWP6LPMjM5fKr6rXBBY76lcqcE
	 Ez85cL1u4pRX3eC7sOh+Y7YqzRzWxQOb9U6AgIP0=
Date: Mon, 29 Apr 2024 11:33:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
	bingbu.cao@intel.com, hongju.wang@intel.com,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	Ng Khai Wen <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH] media: uapi: v4l: Don't expose generic metadata formats
 to userspace
Message-ID: <20240429083326.GA4233@pendragon.ideasonboard.com>
References: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
 <20240426153319.26872-1-laurent.pinchart@ideasonboard.com>
 <39105858-0774-4668-8120-cca8572079c9@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <39105858-0774-4668-8120-cca8572079c9@ideasonboard.com>

On Mon, Apr 29, 2024 at 10:05:15AM +0300, Tomi Valkeinen wrote:
> On 26/04/2024 18:33, Laurent Pinchart wrote:
> > The generic metadata pixel formats (V4L2_META_FMT_GENERIC_*) are meant
> > to be used in conjunction with device-specific media bus codes. Those
> > codes are work in progress and not available in the upstream kernel yet.
> > To make sure the generic metadata pixel formats won't be used by
> > userspace until we have the full infrastructure in place, keep their
> > definition private to the kernel for now.
> 
> Does it matter? How can the userspace use the generic formats, if no 
> driver provides them?

I agree with you, but this series generated some level of discomfort and
voices were raised that the generic formats could be abused. Sakari and
I don't believe that's the case, but because only part of the puzzle has
been submitted for v6.10 (the device-specific media bus codes will be
for v6.11 - if all goes well), I can understand that the big picture may
appear a bit confusing for people who haven't followed the development.

I expect this patch to be reverted for v6.11.

> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > This patch can be squashed with "[PATCH v3 05/14] media: uapi: v4l: Add
> > generic 8-bit metadata format definitions" or kept separate.
> > ---
> >   include/uapi/linux/videodev2.h | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index f74aca14044f..1c0bb4f9ecac 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -842,6 +842,7 @@ struct v4l2_pix_format {
> >   #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
> >   #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
> >   
> > +#ifdef __KERNEL__
> >   /*
> >    * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
> >    * adding new ones!
> > @@ -853,6 +854,7 @@ struct v4l2_pix_format {
> >   #define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
> >   #define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
> >   #define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
> > +#endif
> >   
> >   /* priv field value to indicates that subsequent fields are valid. */
> >   #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> > 
> > base-commit: 5a6272f644afa3db2f00e77ff8b0ea9df51ea875

-- 
Regards,

Laurent Pinchart

