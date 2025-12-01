Return-Path: <linux-media+bounces-47951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5EBC97545
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 13:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 39E743442E7
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 12:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F1C30C616;
	Mon,  1 Dec 2025 12:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1hTeajN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E71B30C371
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 12:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592931; cv=none; b=Hn5HaKZ6MBPNJ2YX0zQBx4fmcUCwqisvhv8A0U592fuHrRaih6X3upqrXnQte5XX1sp+MyxNtWrFXNIJ9fxE743sM55FyUFKHGp31IBRAb1CJjjrG4AeUxOGn2mxFian/Q548s6hlf51R153iZcVnZ9xHUCdXwU1dOJ3Dh0grUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592931; c=relaxed/simple;
	bh=GI5TA8anaH8m+59FVKd2pHzex/xs6dYZH9mPeYS120g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=do5We+EZF0qTwi95r6o1USVJcMsrKm/NEZIsdLQMfIuvc8jAGtztTWzLa/ef66DK9Q5fG2oXwKCFeD1cktCd5vwnGYQm8AmYgxZP5azIjYmMSG90nsmymGPAn4AEF1if4/7M42l/kQLT37Y5G1lMiDRFk08Qy5Zwhl+msMbbqwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1hTeajN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764592929; x=1796128929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GI5TA8anaH8m+59FVKd2pHzex/xs6dYZH9mPeYS120g=;
  b=d1hTeajNNNVU6f3pGsoPeDk7i+sVtlQzwc97AVpnaV4v+nL7y6KmkXEN
   QwVURZcuER/8SjEWri/CfbZ3f1DMRIvy0JF+Ujwz83QVhdz0JAqNZitlA
   oTYKbUBhpBTz3gP6xCiwvZSMEKHtFHAsL/lK22gA1PLg7Gpk03eBjl4tQ
   V6tOdu30egQrAQ03aZBIQ07X0t1LzlJy8V77N+H+3eRp9MrisD+PsIQKW
   +e02G1WrZJUPsRcB7xRjU5Y9smOZfC0fb9xweMk8AQBDAwmjlr9mwve2p
   UJFXqU8Wgeyde/cVo43lFF0IzdylB8zaXzH6K6iTT5SbwrwXgixNTKKn/
   A==;
X-CSE-ConnectionGUID: 8ohI3BicRGibwmDwwsi+Xw==
X-CSE-MsgGUID: JZWFlr7WTAK/HTUiyHu4Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="84133223"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="84133223"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 04:42:07 -0800
X-CSE-ConnectionGUID: Toar6IUbRJOucNs/85gS2Q==
X-CSE-MsgGUID: E8LtxOGSTsur9NrX8q8Ptg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="194168869"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.162])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 04:42:07 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3CC2B11FA74;
	Mon, 01 Dec 2025 14:42:08 +0200 (EET)
Date: Mon, 1 Dec 2025 14:42:08 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 07/14] media: omap3isp: rework isp_video_try/set_format
Message-ID: <aS2NIKUsroOnpxvY@kekkonen.localdomain>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <679d80346bef43fab642342ab9de407c132b62ed.1760707611.git.hverkuil+cisco@kernel.org>
 <aPiQAwEa4_fN-LIt@kekkonen.localdomain>
 <7beb5330-10a7-485b-ba55-dca70f990073@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7beb5330-10a7-485b-ba55-dca70f990073@kernel.org>

Hi Hans,

On Mon, Dec 01, 2025 at 09:48:42AM +0100, Hans Verkuil wrote:
> On 22/10/2025 10:04, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Fri, Oct 17, 2025 at 03:26:44PM +0200, Hans Verkuil wrote:
> >> isp_video_set_format now calls isp_video_try_format first, ensuring
> >> consistent behavior and removing duplicate code in both functions.
> >>
> >> This fixes an v4l2-compliance error:
> >>
> >> 	fail: v4l2-test-formats.cpp(519): !pix.sizeimage
> >> test VIDIOC_S_FMT: FAIL
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> >> ---
> >>  drivers/media/platform/ti/omap3isp/ispvideo.c | 60 +++++++++----------
> >>  1 file changed, 30 insertions(+), 30 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >> index d3fe28506fb0..69d17e4dcd36 100644
> >> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> >> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >> @@ -701,11 +701,15 @@ isp_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
> >>  }
> >>  
> >>  static int
> >> -isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
> >> +isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
> >>  {
> >> -	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
> >>  	struct isp_video *video = video_drvdata(file);
> >> -	struct v4l2_mbus_framefmt fmt;
> >> +	struct v4l2_subdev_format fmt = {
> >> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> >> +	};
> >> +	struct v4l2_subdev *subdev;
> >> +	u32 pad;
> >> +	int ret;
> >>  
> >>  	if (format->type != video->type)
> >>  		return -EINVAL;
> >> @@ -745,32 +749,11 @@ isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
> >>  		break;
> >>  	}
> >>  
> >> -	/* Fill the bytesperline and sizeimage fields by converting to media bus
> >> -	 * format and back to pixel format.
> >> -	 */
> >> -	isp_video_pix_to_mbus(&format->fmt.pix, &fmt);
> >> -	isp_video_mbus_to_pix(video, &fmt, &format->fmt.pix);
> >> -
> >> -	mutex_lock(&video->mutex);
> >> -	vfh->format = *format;
> >> -	mutex_unlock(&video->mutex);
> >> -
> >> -	return 0;
> >> -}
> >> -
> >> -static int
> >> -isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
> >> -{
> >> -	struct isp_video *video = video_drvdata(file);
> >> -	struct v4l2_subdev_format fmt = {
> >> -		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> >> -	};
> >> -	struct v4l2_subdev *subdev;
> >> -	u32 pad;
> >> -	int ret;
> >> -
> >> -	if (format->type != video->type)
> >> -		return -EINVAL;
> >> +	if (video->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> >> +		isp_video_pix_to_mbus(&format->fmt.pix, &fmt.format);
> >> +		isp_video_mbus_to_pix(video, &fmt.format, &format->fmt.pix);
> >> +		return 0;
> >> +	}
> >>  
> >>  	subdev = isp_video_remote_subdev(video, &pad);
> >>  	if (subdev == NULL)
> >> @@ -781,12 +764,29 @@ isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
> >>  	fmt.pad = pad;
> >>  	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
> >>  	if (ret)
> >> -		return ret == -ENOIOCTLCMD ? -ENOTTY : ret;
> >> +		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
> > 
> > I believe -ENOTTY was right. Yet this should not happen (albeit I haven't
> > checked) as all omap3isp sub-device drivers with connected video devices
> > presumably implement get_fmt.
> 
> If this returns -ENOTTY, then that indicates that the TRY_FMT ioctl is not supported.
> But that's not the case, it is, but something else is wrong.

The try_format sub-device pad op is used as a backend here. If that's not
implemented, I'd use -ENOTTY to signal that. But as I said I don't think
this happens. So why change it to something that's more opaque?

> 
> Given the fact that this function also returns -EINVAL if subdev == NULL,
> I don't think returning -ENOTTY is the right thing to do.

I don't think that happens either in practice: it'd require a driver bug
for that to happen.

> 
> An alternative to -EINVAL might be to return -ENODEV if subdev == NULL or the
> get_fmt op is not present.

Sounds good.

-- 
Kind regards,

Sakari Ailus

