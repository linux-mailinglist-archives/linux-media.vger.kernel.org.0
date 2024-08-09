Return-Path: <linux-media+bounces-16053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A6294CE18
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 12:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0ACFF1C2101C
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 10:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52281197A97;
	Fri,  9 Aug 2024 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p38ortRd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23CC197A7D;
	Fri,  9 Aug 2024 09:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723197486; cv=none; b=a1DUQiy3ncFgePaUdwxdrSv4l/KQo6XJr5Y2GI9NBWgU+mcra6uFID+Lqj91DnBHR1vViQHaK8W2VA5Nue8iaZCqTEX7JQsJMGgjuk8kbifB/ze/QkxV/tvEOHHaKTDsfu+mnqcJpHNC96jk2qiSJetrLJQrelfkQeb2gJMY2Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723197486; c=relaxed/simple;
	bh=7SkbNTBIDo2C/pZXSACoShL67gBt1HQt309TW3RsFMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XySa/ZBmoUV6RZF7O3Jw41FQjrJgD77Ischq3HnRpUGu/PE8yL9cm5vcOnus1vctIJLJ0+X67HU7unCdkVxpO7jdk3sysKZqChXoo8M4NUKoa6oorz5SqrKIQqgbEsYXkINrTAiAOlCUG49/yhVreN93jy60YFMSdnVM1d1xCfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p38ortRd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09FC0581;
	Fri,  9 Aug 2024 11:57:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723197428;
	bh=7SkbNTBIDo2C/pZXSACoShL67gBt1HQt309TW3RsFMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p38ortRdOVCnThR14Q0/8rG0ZoF2LkOEs5NUsXbbrYn7UmSTNBJVqCTzNwz4s3I+b
	 zE9qPhENLJXdheWT4LkupAlft1Fc4NhIp5shH6gdv4Hd5MbHyKhvnowqiQ/dWNLE8s
	 kwDuc7wADnjjZSZnajgYv4N6DHzJonexPGCFo6dc=
Date: Fri, 9 Aug 2024 12:57:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: starfive: Add multiple resolution support
Message-ID: <20240809095738.GG5833@pendragon.ideasonboard.com>
References: <20240419081955.5140-1-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240419081955.5140-1-changhuang.liang@starfivetech.com>

Hi Changhuang,

Thank you for the patch.

On Fri, Apr 19, 2024 at 01:19:55AM -0700, Changhuang Liang wrote:
> Add multiple resolution support for video "capture_raw" device. Otherwise
> it will capture the wrong image data if the width is not 1920.
> 
> Fixes: e080f339c80a ("media: staging: media: starfive: camss: Add capture driver")
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/staging/media/starfive/camss/stf-capture.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/starfive/camss/stf-capture.c b/drivers/staging/media/starfive/camss/stf-capture.c
> index ec5169e7b391..9e853ff2596a 100644
> --- a/drivers/staging/media/starfive/camss/stf-capture.c
> +++ b/drivers/staging/media/starfive/camss/stf-capture.c
> @@ -177,9 +177,12 @@ static void stf_channel_set(struct stfcamss_video *video)
>  {
>  	struct stf_capture *cap = to_stf_capture(video);
>  	struct stfcamss *stfcamss = cap->video.stfcamss;
> +	struct v4l2_pix_format *pix;

This variable can be const as you don't modify the format.

>  	u32 val;
> 
>  	if (cap->type == STF_CAPTURE_RAW) {
> +		pix = &video->active_fmt.fmt.pix;

And it can be declared and initialized here:

		const struct v4l2_pix_format *pix = &video->active_fmt.fmt.pix;

> +
>  		val = stf_syscon_reg_read(stfcamss, VIN_CHANNEL_SEL_EN);
>  		val &= ~U0_VIN_CHANNEL_SEL_MASK;
>  		val |= CHANNEL(0);
> @@ -193,7 +196,7 @@ static void stf_channel_set(struct stfcamss_video *video)
>  		val |= PIXEL_HEIGH_BIT_SEL(0);
> 
>  		val &= ~U0_VIN_PIX_CNT_END_MASK;
> -		val |= PIX_CNT_END(IMAGE_MAX_WIDTH / 4 - 1);
> +		val |= PIX_CNT_END(pix->width / 4 - 1);

Is there no need to consider the image height as well ? How does the
driver prevent buffer overflows if the sensor sends more data than
expected ?

> 
>  		stf_syscon_reg_write(stfcamss, VIN_INRT_PIX_CFG, val);
>  	} else if (cap->type == STF_CAPTURE_YUV) {

-- 
Regards,

Laurent Pinchart

