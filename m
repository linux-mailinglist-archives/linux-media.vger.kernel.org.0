Return-Path: <linux-media+bounces-41183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 329B7B3831E
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 14:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 665561BA3E59
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 12:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4A6350D44;
	Wed, 27 Aug 2025 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mmXBkG8x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3177212D83;
	Wed, 27 Aug 2025 12:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756299501; cv=none; b=bbr9TwYOtdyoFdTSujfQc2p3f9kDHm8C7YzXYDCaDiyePoKJaY10TUJin3wmuQobPIlnpa7HrBoi69Sc43RnZwAj5UYqP2V+Y/W3lRV8rqgIhhpM+S9f/LIhyj5C4c8fGp6TUX+pwUwrYocqCw+Lr91yHCWiZf/Yhy9ZMxMRlw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756299501; c=relaxed/simple;
	bh=486NpqqtiWtw1ACm5ZWQvrWUNEI+EywJOGONBEDgqIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZB36fHiBVFh45vjxi1MBmoq6lcKZEMrFUq1cWwTzyEpRGXsvZSCBA0UzhixHSgSNTT5X/reKhAI0rNRB7iRbW9P8hZ2UhB6X8SwkoeyIrrStlO7DmWZiwemGHwxha4BGTghMUdcmDkIr4bVKMoFr+j/cV+6c+Rh8YCRneU2Hi8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mmXBkG8x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-54-205.net.vodafone.it [5.90.54.205])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57456300E;
	Wed, 27 Aug 2025 14:57:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756299434;
	bh=486NpqqtiWtw1ACm5ZWQvrWUNEI+EywJOGONBEDgqIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mmXBkG8xN4p8PqvGaUKpKyxvwwfkwKs1uexbkBa3a7Og32Ojsq8ylinMu7YQjVi6A
	 t2f1dLOIl5h5FMCw8SsIj4ribprVjwVDU4vuv9yQV+gbvhCH3+ip6CLoDLIU9T9QDM
	 L5BGf16Ljw4P9aseppJN92+1ugbb5lb/iFbTidrw=
Date: Wed, 27 Aug 2025 14:58:14 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"open list:MT9V111 APTINA CAMERA SENSOR" <linux-media@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] media: i2c: mt9v111: fix incorrect type for ret
Message-ID: <xbmwlnflzhfhapyt5dinqqsdurxgu5imlqixudopb7z32eteth@cs7hulza54e3>
References: <20250827123916.504189-1-rongqianfeng@vivo.com>
 <20250827123916.504189-3-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250827123916.504189-3-rongqianfeng@vivo.com>

Hi Qianfeng

On Wed, Aug 27, 2025 at 08:39:10PM +0800, Qianfeng Rong wrote:
> Change "ret" from unsigned int to int type in mt9v111_calc_frame_rate()
> to store negative error codes or zero returned by __mt9v111_hw_reset()
> and other functions.
>
> Storing the negative error codes in unsigned type, doesn't cause an issue
> at runtime but it's ugly as pants.
>
> No effect on runtime.

well, I'm not sure that's true.

The code goes as

	ret = __mt9v111_hw_reset(mt9v111);
	if (ret == -EINVAL)
		ret = __mt9v111_sw_reset(mt9v111);
	if (ret)
		return ret;

And if ret is unsigned the condition ret == -EINVAL will never be met.

I guess this actually fixes a bug, doesn't it ?

>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>

You can add:

Cc: stable@vger.kernel.org
Fixes: aab7ed1c3927 ("media: i2c: Add driver for Aptina MT9V111")
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j


> ---
>  drivers/media/i2c/mt9v111.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
> index 6aa80b504168..9d724a7cd2f5 100644
> --- a/drivers/media/i2c/mt9v111.c
> +++ b/drivers/media/i2c/mt9v111.c
> @@ -532,8 +532,8 @@ static int mt9v111_calc_frame_rate(struct mt9v111_dev *mt9v111,
>  static int mt9v111_hw_config(struct mt9v111_dev *mt9v111)
>  {
>  	struct i2c_client *c = mt9v111->client;
> -	unsigned int ret;
>  	u16 outfmtctrl2;
> +	int ret;
>
>  	/* Force device reset. */
>  	ret = __mt9v111_hw_reset(mt9v111);
> --
> 2.34.1
>

