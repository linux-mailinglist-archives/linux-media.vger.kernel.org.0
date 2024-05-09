Return-Path: <linux-media+bounces-11246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9448C1587
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 21:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87C4F1C21D84
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 19:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF07E7FBAA;
	Thu,  9 May 2024 19:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Df+c2loC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A49EED5;
	Thu,  9 May 2024 19:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715283559; cv=none; b=cCKuz9Hc4+E+d/esrTFJOZw55wxFDFphaS+726+R/9lKZ4367ihOkQL5vDPmg+AxXyx1BplC2fLVwbFhRlhlsds4WnXVaD0aclifOsKCsc8JZUqvCZHjpxk5AF7hB3vzr3POq4ahlRwW6xQZYA1L8vTFwbFvpR3350cG/oXnCQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715283559; c=relaxed/simple;
	bh=x+qhi+MJAf6bKwSdDWFSUhP5/37H1SaN9N9PAVA+wJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5pBC+5D4J5QnqJUfa09RoBVltbrbWupGjau5FAfBcY9RkjRxRFvAVBiu96YodvJofGes976AzVcP3oh2Z9rgNG+G5azdE4+w00opPRFSe7C3+wr6NlgYIiqLmtonSPKTl67ownhrCqnU6lNZr7oYClfSIYR8XQ2aGtv6WKap9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Df+c2loC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A449236;
	Thu,  9 May 2024 21:39:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715283546;
	bh=x+qhi+MJAf6bKwSdDWFSUhP5/37H1SaN9N9PAVA+wJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Df+c2loCrpu5YmWfk3iKyCmdbPonFsGnbNsd4KsBWgsUV9MVPswCCyiIyZDD+TKfp
	 TCqfMI+nL78mfr4H7OlnzvOq5VTEpQu5NS/r+DHFdviJUCz7Q37VBwn4CJlarUD/0/
	 Md2kkbANGWeNhTQIKYSk5T7ztneXZfOxZ/xj7DWI=
Date: Thu, 9 May 2024 22:39:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: hi846: Fix V4L2_SUBDEV_FORMAT_TRY
 get_selection()
Message-ID: <20240509193900.GA32013@pendragon.ideasonboard.com>
References: <20240509-fix-hi846-v1-1-1e19dc517be1@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240509-fix-hi846-v1-1-1e19dc517be1@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Thu, May 09, 2024 at 05:05:55PM +0000, Ricardo Ribalda wrote:
> The current code does not return anything to the user.
> 
> Although the code looks a bit dangerous (using a pointer without
> checking if it is valid), it should be fine. The code validates that

I think you meant s/code/core/

> sel->pad has a valid value.
> 
> Fix the following smatch error:
> drivers/media/i2c/hi846.c:1854 hi846_get_selection() warn: statement has no effect 31
> 
> Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> While running media-ci on the last patches there was a new sparse
> warning:
> https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/58524338/artifacts/external_file/junit/test-smatch.log.txt
> ---
>  drivers/media/i2c/hi846.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index 9c565ec033d4..52d9ca68a86c 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
> @@ -1851,7 +1851,7 @@ static int hi846_get_selection(struct v4l2_subdev *sd,
>  		mutex_lock(&hi846->mutex);
>  		switch (sel->which) {
>  		case V4L2_SUBDEV_FORMAT_TRY:
> -			v4l2_subdev_state_get_crop(sd_state, sel->pad);
> +			sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
>  			break;
>  		case V4L2_SUBDEV_FORMAT_ACTIVE:
>  			sel->r = hi846->cur_mode->crop;
> 
> ---
> base-commit: 48259b90973718d2277db27b5e510f0fe957eaa0
> change-id: 20240509-fix-hi846-c3d77768622e

-- 
Regards,

Laurent Pinchart

