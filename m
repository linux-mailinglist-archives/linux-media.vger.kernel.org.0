Return-Path: <linux-media+bounces-8490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6DC896949
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 10:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CC631C25A8A
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 08:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB9783A0D;
	Wed,  3 Apr 2024 08:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="P6bfXRrL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CCD82D69
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 08:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712133803; cv=none; b=TRWQAR30L43HPBSJyfhQdWn1FWZS6KY5Q38KPEpWjOlf/A32M/p6Xg8pKklsNNqtpFkHVZPDV5rOyqPMTAb+oivwXpf7KY2a9aBa6UmKU3lTHdjdAh2n5cYaX/Iapwk96wuEDK4nIA1b4t5KYFeFljKrklsI3hsFdI+I0AWKMqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712133803; c=relaxed/simple;
	bh=pbHMZUANyxTeQrJBXOpg0HnrxdXRyZp7dGNUSyDbaPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRLgnxaiRYm/oiyHfqJusXIVa/kJF3g11p+P4cU2Nc5r1E8qD3Ynyp8lH21h4hmS8Q2ST2+z7BW5LoUENJ4PoUlFxVo8E0+dBEjN6G116Q4yCb/mq6FPpxUQSH+E5lI4VnoYQLCe/yFlPmuwoa35CN+dMmyf9eq6pygVocXuM/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=P6bfXRrL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0880A674;
	Wed,  3 Apr 2024 10:42:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712133764;
	bh=pbHMZUANyxTeQrJBXOpg0HnrxdXRyZp7dGNUSyDbaPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P6bfXRrLrk/UlnMEh8fz3Zif2WpRIJViU4Qyt89Md2ZprcM3WKYogmtrU2W+F9mhv
	 J7SEJC0nmtYrfnDQn8FNsXI95M0+xWzh5YfECNnKVKnzTmXwOeaipJyHkMrtiIs85D
	 z79zvaB/j9vuaAYzvd3oPMgbQkpbumuDeq88NZHk=
Date: Wed, 3 Apr 2024 11:43:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v4l-utils 2/2] v4l2-compliance: Fix streams use in
 testSubDevEnumFrameSize()
Message-ID: <20240403084309.GP16740@pendragon.ideasonboard.com>
References: <20240403-v4l2-compliance-streams-fixes-v1-0-a1c383cc2139@ideasonboard.com>
 <20240403-v4l2-compliance-streams-fixes-v1-2-a1c383cc2139@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240403-v4l2-compliance-streams-fixes-v1-2-a1c383cc2139@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Wed, Apr 03, 2024 at 11:16:29AM +0300, Tomi Valkeinen wrote:
> We don't pass the stream number to testSubDevEnumFrameSize(), which
> instead always uses stream number 0. This causes failures when the
> subdevice uses streams.
> 
> Fix this by adding stream parameter, and passing the correct stream ID.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  utils/v4l2-compliance/v4l2-test-subdevs.cpp | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> index fe7a9e1d..b2667a3b 100644
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

