Return-Path: <linux-media+bounces-20631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EDF9B77B5
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 10:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B543E286B8C
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 09:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB14195FD5;
	Thu, 31 Oct 2024 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ESlbbYyo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25E42AE9A;
	Thu, 31 Oct 2024 09:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730367550; cv=none; b=KNMgyPfYgtz1BxQsqzUqkV6dxk9LKPucbyqNPYTo335UuwtfRrp2IV7BiD3hcs95cRn8ZYfjgUf73zqRb84J6xZlNfwr5Az8+lFHT8GxOsXgA8k8GgFr0xw7UiW/qWk477ffG79z9+WoFd6gUjY6Mtu+dhX6WnKjPY7J1k0dryc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730367550; c=relaxed/simple;
	bh=LRz1h79bJN4EYNQ1JU/SY7GS2AoN+ilnUVUKkNbp1+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oC/XemZiXqe0bBtL1cpQ8p4wqoTl2Fno+9u7kCvIh2nmfJDQuXaT+yDCjF5hnuIsvnz3//gL+nNtWvCc7ptzCTvMF5+MB2fX/HiNpkZHNlBoAtDNGAM3PUHElS5Ec0N+CY/KQ63WHXtxzN5zqbPHHgYCdszaeiB/Mb2K4DpaaF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ESlbbYyo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7AE29EC;
	Thu, 31 Oct 2024 10:39:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730367543;
	bh=LRz1h79bJN4EYNQ1JU/SY7GS2AoN+ilnUVUKkNbp1+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ESlbbYyoYhKGDZUFCQhHxFQx28YfAGaDtvJf0E5BG6Us8nDoBVE1sLhzB/C0wt8jH
	 X8PVJ5860rPxXXg0u7kb5c8zxnMJzvogtvmhE6iGXC68+/MFjy1QJe3RzaIdJdYU3V
	 wqFm3OheKqq96zZZCjGxny3uErcw6VWWdsj321mE=
Date: Thu, 31 Oct 2024 11:38:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: imx283: Report correct V4L2_SEL_TGT_CROP
Message-ID: <20241031093859.GB2473@pendragon.ideasonboard.com>
References: <20241030163439.245035-1-stefan.klug@ideasonboard.com>
 <04ae3f0b-c2f8-4553-9b49-302cc638c0c7@ideasonboard.com>
 <nr7wzo7smtq2mbtorhw4slgtvmj6nyk3witjcymwzk7efrftlc@obgey7ky5hpp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nr7wzo7smtq2mbtorhw4slgtvmj6nyk3witjcymwzk7efrftlc@obgey7ky5hpp>

Hello,

On Thu, Oct 31, 2024 at 10:13:13AM +0100, Stefan Klug wrote:
> On Thu, Oct 31, 2024 at 11:07:00AM +0530, Umang Jain wrote:
> > On 30/10/24 10:04 pm, Stefan Klug wrote:
> > > The target crop rectangle is initialized with the crop of the default
> > > sensor mode. This is incorrect when a different sensor mode gets
> > > selected. Fix that by updating the crop rectangle when changing the
> > > sensor mode.
> > > 
> > > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > > ---
> > >   drivers/media/i2c/imx283.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> > > index 3174d5ffd2d7..c8863c9e0ccf 100644
> > > --- a/drivers/media/i2c/imx283.c
> > > +++ b/drivers/media/i2c/imx283.c
> > > @@ -1123,6 +1123,7 @@ static int imx283_set_pad_format(struct v4l2_subdev *sd,
> > >   				 struct v4l2_subdev_state *sd_state,
> > >   				 struct v4l2_subdev_format *fmt)
> > >   {
> > > +	struct v4l2_rect *crop;
> > >   	struct v4l2_mbus_framefmt *format;
> > >   	const struct imx283_mode *mode;
> > >   	struct imx283 *imx283 = to_imx283(sd);
> > > @@ -1149,6 +1150,9 @@ static int imx283_set_pad_format(struct v4l2_subdev *sd,
> > >   	*format = fmt->format;
> > > +	crop = v4l2_subdev_state_get_crop(sd_state, IMAGE_PAD);
> > > +	*crop = mode->crop;
> > > +
> > 
> > One thing to note, is the crop for binning modes.
> > 
> > Do you need to report
> > 
> >     mode->crop.width / mode->hbin_ratio
> >     mode->crop.height / mode->vbin_ratio
> > 
> > for those modes?
> 
> Good point. I was naively assuming that it has the same semantics as we
> use for ScalerCrop in libcamera where it is explicitly stated that the
> coordinates are in sensor pixels without binning. That has the added
> advantage that we can deduce the binning factor from TGT_CROP and the
> actual output size. However I couldn't find a precise specification for
> that in the linux docs. 
> 
> Maybe Sakari or Laurent have a definiteve answer there?

This is not standardized in V4L2, and different drivers implement
different semantics. There's an ongoing effort to fix this, see
https://lore.kernel.org/r/20241011075535.588140-1-sakari.ailus@linux.intel.com.
Reviews are appreciated :-)

> > >   	return 0;
> > >   }

-- 
Regards,

Laurent Pinchart

