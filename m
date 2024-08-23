Return-Path: <linux-media+bounces-16667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C016495D059
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 16:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AB431F233DB
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 14:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244D018890D;
	Fri, 23 Aug 2024 14:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sZJKQ6WI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8D31865ED;
	Fri, 23 Aug 2024 14:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724424473; cv=none; b=BcnidWX9s1TlHdprXNFZJ4O8FYR3LxeNuEuImOERjl5/lBowzriPOQ4HJKQPMDQqob7J8VQE5LukieEzMs7PN5u7lUhShihe0VjxzaeJvT3Q/68F1ZZDeOye0kCea0NaqdWPbpvwkfPUu+v3d4rRUAwOK22rObx1WuF8zouStv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724424473; c=relaxed/simple;
	bh=X+g0Y1DQzxqNTmTHo5vJQtnuEG3RxlxEPJhyxBhn7KY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WB58/2cQlon1qmJCcXEMVxQ6zdRYgeyhsTm447xRb1aCmanwD6E4EJsFZJppJLYUfQaK392fXtOvj3Ery2bUrHpdHQeWuL1k/mjCvxBhdxaEP7fPUFWfl4BA5A+3eiz/0FMb9ecoUDQmtmRG+hIRVfK1FxIWAYQoHQupsSqglpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sZJKQ6WI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65559497;
	Fri, 23 Aug 2024 16:46:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724424406;
	bh=X+g0Y1DQzxqNTmTHo5vJQtnuEG3RxlxEPJhyxBhn7KY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sZJKQ6WIViutqJKHj+OQ6Kq6QrFmrA6xbh1cFMwPqcpXuF+9XPJDBStNoLJ4xuBax
	 tJA6JMOw94qAAKjWYvFxrSD3OCgbTCbG9m6Lfg3Sg7wgZKjHKMHQqU1Gd7CpCkNoAn
	 FJ4Br3O3T0E6OcbkwZz/HwpxtrKywG28yGF3my0c=
Date: Fri, 23 Aug 2024 17:47:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [v3] staging: media: starfive: Add the dynamic resolution support
Message-ID: <20240823144747.GN26098@pendragon.ideasonboard.com>
References: <20240820112002.560432-1-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240820112002.560432-1-changhuang.liang@starfivetech.com>

Hi Changhuang,

Thank you for the patch.

On Tue, Aug 20, 2024 at 04:20:02AM -0700, Changhuang Liang wrote:
> Add the dynamic resolution support for video "capture_raw" device.
> Otherwise it will capture the wrong image data if the width is
> not 1920.
> 
> Fixes: e080f339c80a ("media: staging: media: starfive: camss: Add capture driver")
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Hi
> 
> v2 forgot to synchronous description with v1. Now send a new version 3.
> 
> Best Regards
> Changhuang
> ---
>  drivers/staging/media/starfive/camss/stf-capture.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/starfive/camss/stf-capture.c b/drivers/staging/media/starfive/camss/stf-capture.c
> index ec5169e7b391..e15d2e97eb0b 100644
> --- a/drivers/staging/media/starfive/camss/stf-capture.c
> +++ b/drivers/staging/media/starfive/camss/stf-capture.c
> @@ -180,6 +180,8 @@ static void stf_channel_set(struct stfcamss_video *video)
>  	u32 val;
>  
>  	if (cap->type == STF_CAPTURE_RAW) {
> +		const struct v4l2_pix_format *pix = &video->active_fmt.fmt.pix;
> +
>  		val = stf_syscon_reg_read(stfcamss, VIN_CHANNEL_SEL_EN);
>  		val &= ~U0_VIN_CHANNEL_SEL_MASK;
>  		val |= CHANNEL(0);
> @@ -193,7 +195,7 @@ static void stf_channel_set(struct stfcamss_video *video)
>  		val |= PIXEL_HEIGH_BIT_SEL(0);
>  
>  		val &= ~U0_VIN_PIX_CNT_END_MASK;
> -		val |= PIX_CNT_END(IMAGE_MAX_WIDTH / 4 - 1);
> +		val |= PIX_CNT_END(pix->width / 4 - 1);
>  
>  		stf_syscon_reg_write(stfcamss, VIN_INRT_PIX_CFG, val);
>  	} else if (cap->type == STF_CAPTURE_YUV) {

-- 
Regards,

Laurent Pinchart

