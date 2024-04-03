Return-Path: <linux-media+bounces-8597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3431E897C12
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 01:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60B5C1C25888
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 23:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31B7156C4B;
	Wed,  3 Apr 2024 23:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lzJFIB8D"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28278692FC
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 23:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712187467; cv=none; b=q0T2QK0KtS+mHOCsf6oDypdGEKnIgcl609Eglvkkg43IVpoh1MXXtW3rnTQshoJs9kPXqGDO3WvzrMeWOqIYX4fTNyD91kAc2H0ewhbvkRjYKVHQ8hwD25O3Rz1en7jX6B/Btk2V1/4Av/x+6Op20S6Ecxf04Z0urKXlBXwPyEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712187467; c=relaxed/simple;
	bh=Dj/JNBV2E/aG6AcsipppEp/wNX3jGYU55BwmX9tvNnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kT8rOAbwdKUWyfqFl4MEsmypnRypK9KmmLCDhbhJcVm9hUXpkGW+tIDRpq7EopxY0Frh5f4uD9VSAfJW5Gv1K3oeM8/+nTMfQj9dxDwT2zsOUNm0mxBqfunOJMWGfF0tldkzuYSZ9BLc9BnjBpSdDJKeqfF9pJsMd6JeJo++qtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lzJFIB8D; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A8594D4;
	Thu,  4 Apr 2024 01:37:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712187426;
	bh=Dj/JNBV2E/aG6AcsipppEp/wNX3jGYU55BwmX9tvNnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzJFIB8DVPdL9bf9IWh+3CHZ2PEFrt8D8PVuLPp8pkZdBfBJwrEr5JRddALE4QP4p
	 4PX64RodnuQg57u0yY8PLeFSDY1EITd5t0dqeW5SCh03yjmkGP/6p63zVQUz0GAIc6
	 wh+EntiDSEbseEYXrrivUEqffBl2dUM0uVsenQtk=
Date: Thu, 4 Apr 2024 02:37:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v4l-utils v2 2/2] v4l2-compliance: Fix streams use in
 testSubDevEnumFrameSize()
Message-ID: <20240403233732.GT16740@pendragon.ideasonboard.com>
References: <20240403-v4l2-compliance-streams-fixes-v2-0-be9b338dc204@ideasonboard.com>
 <20240403-v4l2-compliance-streams-fixes-v2-2-be9b338dc204@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240403-v4l2-compliance-streams-fixes-v2-2-be9b338dc204@ideasonboard.com>

On Wed, Apr 03, 2024 at 01:15:45PM +0300, Tomi Valkeinen wrote:
> We don't pass the stream number to testSubDevEnumFrameSize(), which
> instead always uses stream number 0. This causes failures when the
> subdevice uses streams.
> 
> Fix this by adding stream parameter, and passing the correct stream ID.

This looks ready to merge as far as I'm concerned. Sakari, Hans, if you
disagree, please let me know.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  utils/v4l2-compliance/v4l2-test-subdevs.cpp | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> index 560efb70..da304a8c 100644
> --- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> @@ -121,7 +121,7 @@ static int testSubDevEnumFrameInterval(struct node *node, unsigned which,
>  }
>  
>  static int testSubDevEnumFrameSize(struct node *node, unsigned which,
> -				   unsigned pad, unsigned code)
> +				   unsigned pad, unsigned stream, unsigned code)
>  {
>  	struct v4l2_subdev_frame_size_enum fse;
>  	unsigned num_sizes;
> @@ -130,7 +130,7 @@ static int testSubDevEnumFrameSize(struct node *node, unsigned which,
>  	memset(&fse, 0, sizeof(fse));
>  	fse.which = which;
>  	fse.pad = pad;
> -	fse.stream = 0;
> +	fse.stream = stream;
>  	fse.code = code;
>  	ret = doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse);
>  	node->has_subdev_enum_fsize |= (ret != ENOTTY) << which;
> @@ -140,7 +140,7 @@ static int testSubDevEnumFrameSize(struct node *node, unsigned which,
>  		memset(&fie, 0, sizeof(fie));
>  		fie.which = which;
>  		fie.pad = pad;
> -		fie.stream = 0;
> +		fie.stream = stream;
>  		fie.code = code;
>  		fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY);
>  		return ret;
> @@ -156,7 +156,7 @@ static int testSubDevEnumFrameSize(struct node *node, unsigned which,
>  	memset(&fse, 0xff, sizeof(fse));
>  	fse.which = which;
>  	fse.pad = pad;
> -	fse.stream = 0;
> +	fse.stream = stream;
>  	fse.code = code;
>  	fse.index = 0;
>  	fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse));
> @@ -266,7 +266,7 @@ int testSubDevEnum(struct node *node, unsigned which, unsigned pad, unsigned str
>  		fail_on_test(mbus_core_enum.stream != stream);
>  		fail_on_test(mbus_core_enum.index != i);
>  
> -		ret = testSubDevEnumFrameSize(node, which, pad, mbus_core_enum.code);
> +		ret = testSubDevEnumFrameSize(node, which, pad, stream, mbus_core_enum.code);
>  		fail_on_test(ret && ret != ENOTTY);
>  	}
>  	return 0;
> 

-- 
Regards,

Laurent Pinchart

