Return-Path: <linux-media+bounces-20335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB7B9B0C10
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 19:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7CF9284D6C
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 17:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7B618BC23;
	Fri, 25 Oct 2024 17:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iUg44kWB"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7716820C31F;
	Fri, 25 Oct 2024 17:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729878422; cv=none; b=h6XYzYBJhhniYm9kpbDb91gfkrHWX1+LaGBKU35/OeeGFOlh6f+BANhAkrMvi2D7bY8Ek9sWGDcu+VeqZVLraWR9mQXtjJPNRkX0srqpNVYscfX/cehz3WBOVqgs8wnukW3z/cTbr/ynzV5ObXJs6TsW1WXueI4Xjw743Am0c1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729878422; c=relaxed/simple;
	bh=ozBIpgyxnAgCBKNUleMXiK02jDu4q4LAhe4fTs4O04s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VtmVVp4rAq1MxzkhBJd36BqkYeEUBjntfb6ySFwHXIWNh1oSVdDA+Y7dQfuItgmY6XaQx7moQvWb6Ls92FCeuuVJEu0FW//hnuPIAq7n/LIh1XdkORChytzOKCup2Y2R87nJ9jMzU3UJAvLXLEkf0eIt+61l+10Yk+xk5qTd798=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iUg44kWB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729878418;
	bh=ozBIpgyxnAgCBKNUleMXiK02jDu4q4LAhe4fTs4O04s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=iUg44kWBzy9MSSIzXccTiM8CT+DmPeUOKRVz7wQSt6tXpAV8XHJyQsUgsBzcJMnrl
	 H2wUZKvZqhgtu4gEjEq5KdV9Uu1DBV6gHCy04fMhzVm1of3mNa4NMGY+2HUbDULdW9
	 xFEXp2AoyMZUxDeTtHC4LByH0c2gdHO7XSutsFlHIRzODNIrcBNAWxjH3U1rkuwqye
	 gujMmwRC7Ckl2G+l6HL4G9veMPSN9jM0QCowsOYc8GTEoqkKmo0RCqGQJQsuMRwLSy
	 O1fctHQo8IOTsgglaa0sk2pQsQXhu1OaLnC0ZBS48/rbMPInMEPBB216adib9YQKFs
	 dtLZ2T11X37QQ==
Received: from nicolas-tpx395.lan (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B8C4817E36B5;
	Fri, 25 Oct 2024 19:46:56 +0200 (CEST)
Message-ID: <f42f85b801f9fc74e5cc1cee5984e9fc44f63ada.camel@collabora.com>
Subject: Re: [PATCH v6 11/11] media: rkvdec: Fix enumerate frame sizes
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: Alex Bee <knaerzche@gmail.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>
Date: Fri, 25 Oct 2024 13:46:55 -0400
In-Reply-To: <20240909192522.1076704-12-jonas@kwiboo.se>
References: <20240909192522.1076704-1-jonas@kwiboo.se>
	 <20240909192522.1076704-12-jonas@kwiboo.se>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le lundi 09 septembre 2024 à 19:25 +0000, Jonas Karlman a écrit :
> The VIDIOC_ENUM_FRAMESIZES ioctl should return all frame sizes (i. e.
> width and height in pixels) that the device supports for the given pixel
> format.
> 
> For coded format returning the frame size used to enforce HW alignment
> requirements for CAPTURE buffers does not make fully sense.
> 
> Instead, signal applications what the maximum frame size that is
> supported by the HW decoder using a frame size of continuous type.
> 
> Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> Suggested-by: Alex Bee <knaerzche@gmail.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> v6:
> - New patch
> 
> With this change FFmpeg V4L2 Request API hwaccels can implement a strict
> check if frame size is supported by the video device:
> https://ffmpeg.org/pipermail/ffmpeg-devel/2024-August/332037.html
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index c8c14f35ac44..9002eb3a59e5 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -334,8 +334,14 @@ static int rkvdec_enum_framesizes(struct file *file, void *priv,
>  	if (!fmt)
>  		return -EINVAL;
>  
> -	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> -	fsize->stepwise = fmt->frmsize;
> +	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
> +	fsize->stepwise.min_width = 1;
> +	fsize->stepwise.max_width = fmt->frmsize.max_width;
> +	fsize->stepwise.step_width = 1;
> +	fsize->stepwise.min_height = 1;
> +	fsize->stepwise.max_height = fmt->frmsize.max_height;
> +	fsize->stepwise.step_height = 1;
> +
>  	return 0;
>  }
>  


