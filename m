Return-Path: <linux-media+bounces-20628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 209A49B7721
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 10:13:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CD51B23B84
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 09:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7A8193439;
	Thu, 31 Oct 2024 09:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rj7zytZF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006DA18453F;
	Thu, 31 Oct 2024 09:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730366007; cv=none; b=ksgt2lENy50Z0A/tD6MbvLKwsBCihEHY9mDbuMVYVbvLf9iGXEqpu+5dI6ne+mn7Q/0J63d4pzIX9A6NtP5W3spDFJnKapYtW1T73IrvGbpjp9E/SFCoR80n1oJAq/5XCRuPsH9WHUbbpGJWfH7TsU/c0ZKxmYqDj96Dy5lyFMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730366007; c=relaxed/simple;
	bh=gqnaDtZtuISCM8zTQgzltHmUGJlE1EtGHbAL+f5QyvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAOYgf5842puTn6RnJNTjUBR6mvpSrp3Dk2kFWuB9FYDAIYIug3ZBSVagE/9GMjFxugH/cH3SR46sRFsETjMiTS+5VwMr/RwtIDHhT4D8cKTm00DlCbHrGKse26STfCwi1VfNiEJPrvVHYZTMboTZ824Og4ZVIUwrjHNgHLKwno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rj7zytZF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:c433:a011:b9cf:d32c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AD8D842;
	Thu, 31 Oct 2024 10:13:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730365993;
	bh=gqnaDtZtuISCM8zTQgzltHmUGJlE1EtGHbAL+f5QyvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rj7zytZFTQ42WfgEkXHKy4HFyxdM9Hq1aTmwWll4DJ7Ef8BjlMeS7EBlHyuiSkTm4
	 5/hc8hV39g36KoSRArCTygpEjYWmM+kcF4OOy4Y3w4936Bj38dNTn+XsnBUgI9/i6z
	 kT/G4th/M+9kE1Ylm/v0fom1TwJU+b1YwUTUE5Ls=
Date: Thu, 31 Oct 2024 10:13:13 +0100
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: imx283: Report correct V4L2_SEL_TGT_CROP
Message-ID: <nr7wzo7smtq2mbtorhw4slgtvmj6nyk3witjcymwzk7efrftlc@obgey7ky5hpp>
References: <20241030163439.245035-1-stefan.klug@ideasonboard.com>
 <04ae3f0b-c2f8-4553-9b49-302cc638c0c7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04ae3f0b-c2f8-4553-9b49-302cc638c0c7@ideasonboard.com>

Hi Umang,

On Thu, Oct 31, 2024 at 11:07:00AM +0530, Umang Jain wrote:
> Hi Stefan
> 
> On 30/10/24 10:04 pm, Stefan Klug wrote:
> > The target crop rectangle is initialized with the crop of the default
> > sensor mode. This is incorrect when a different sensor mode gets
> > selected. Fix that by updating the crop rectangle when changing the
> > sensor mode.
> > 
> > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > ---
> >   drivers/media/i2c/imx283.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> > index 3174d5ffd2d7..c8863c9e0ccf 100644
> > --- a/drivers/media/i2c/imx283.c
> > +++ b/drivers/media/i2c/imx283.c
> > @@ -1123,6 +1123,7 @@ static int imx283_set_pad_format(struct v4l2_subdev *sd,
> >   				 struct v4l2_subdev_state *sd_state,
> >   				 struct v4l2_subdev_format *fmt)
> >   {
> > +	struct v4l2_rect *crop;
> >   	struct v4l2_mbus_framefmt *format;
> >   	const struct imx283_mode *mode;
> >   	struct imx283 *imx283 = to_imx283(sd);
> > @@ -1149,6 +1150,9 @@ static int imx283_set_pad_format(struct v4l2_subdev *sd,
> >   	*format = fmt->format;
> > +	crop = v4l2_subdev_state_get_crop(sd_state, IMAGE_PAD);
> > +	*crop = mode->crop;
> > +
> 
> One thing to note, is the crop for binning modes.
> 
> Do you need to report
> 
>     mode->crop.width / mode->hbin_ratio
>     mode->crop.height / mode->vbin_ratio
> 
> for those modes?

Good point. I was naively assuming that it has the same semantics as we
use for ScalerCrop in libcamera where it is explicitly stated that the
coordinates are in sensor pixels without binning. That has the added
advantage that we can deduce the binning factor from TGT_CROP and the
actual output size. However I couldn't find a precise specification for
that in the linux docs. 

Maybe Sakari or Laurent have a definiteve answer there?

Best regards,
Stefan

> 
> >   	return 0;
> >   }
> 

