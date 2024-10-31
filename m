Return-Path: <linux-media+bounces-20619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0926C9B742A
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 06:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF9132860D4
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 05:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EBA13CFA5;
	Thu, 31 Oct 2024 05:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OKpE+t+q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF0728E8;
	Thu, 31 Oct 2024 05:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730353029; cv=none; b=oXjvdrIZkGSDPCK5Vn7g/setnaUaYhErTqUlCUsCf9SxV1qVERUCWsAjcq7rjm51kHkDetdaX8J4fQx+Hu5ZLEG7IXoA8Ud1hLrc6XrEqjFtx790g//YDFjRx2PrW1ZWe7E7qZMQAV8CL5PiU3/rAPUHn4kdYdj4TdvqccyVT74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730353029; c=relaxed/simple;
	bh=8ewBrgbIPlY7S598KZ4WcC1h6n5PO4F3mmIRKZ6AtM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U3+teACfZpSMeUpizkZwXmK0rDUhNbiR/2IlkHDQL71bgWnO8mY6COhPm0iOgtiJMdWN6cMNCOhCO12hzrA7Cc9wSnaBVOItDA+Tykwjqrxy/Nx0knf/lRXBuK2E+z0iYmFX/NIG+jLHV1WFdxbvU4BThyhGnYTEI0d37jNlF+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OKpE+t+q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [IPV6:2405:201:2015:f873:c173:4b:4a04:3a21] (unknown [IPv6:2405:201:2015:f873:c173:4b:4a04:3a21])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4574C842;
	Thu, 31 Oct 2024 06:37:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730353021;
	bh=8ewBrgbIPlY7S598KZ4WcC1h6n5PO4F3mmIRKZ6AtM4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OKpE+t+qPMQOYoB57FJnYTYtjRaHdMyIEI4/ljy4cx0jWoNQ1VHVpXMdqkfJkz1Er
	 YYeXe4r7f1x4AA3BZa+JW6jYE+/o3hJXIvzhiN74lxVEOli1gT99J3Xdt1dUwBm1FQ
	 jHKHa2L5Zi5lMTqntp980qIGnqWWknJVdMLTasbM=
Message-ID: <04ae3f0b-c2f8-4553-9b49-302cc638c0c7@ideasonboard.com>
Date: Thu, 31 Oct 2024 11:07:00 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: imx283: Report correct V4L2_SEL_TGT_CROP
To: Stefan Klug <stefan.klug@ideasonboard.com>,
 libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20241030163439.245035-1-stefan.klug@ideasonboard.com>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20241030163439.245035-1-stefan.klug@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan

On 30/10/24 10:04 pm, Stefan Klug wrote:
> The target crop rectangle is initialized with the crop of the default
> sensor mode. This is incorrect when a different sensor mode gets
> selected. Fix that by updating the crop rectangle when changing the
> sensor mode.
>
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> ---
>   drivers/media/i2c/imx283.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index 3174d5ffd2d7..c8863c9e0ccf 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -1123,6 +1123,7 @@ static int imx283_set_pad_format(struct v4l2_subdev *sd,
>   				 struct v4l2_subdev_state *sd_state,
>   				 struct v4l2_subdev_format *fmt)
>   {
> +	struct v4l2_rect *crop;
>   	struct v4l2_mbus_framefmt *format;
>   	const struct imx283_mode *mode;
>   	struct imx283 *imx283 = to_imx283(sd);
> @@ -1149,6 +1150,9 @@ static int imx283_set_pad_format(struct v4l2_subdev *sd,
>   
>   	*format = fmt->format;
>   
> +	crop = v4l2_subdev_state_get_crop(sd_state, IMAGE_PAD);
> +	*crop = mode->crop;
> +

One thing to note, is the crop for binning modes.

Do you need to report

     mode->crop.width / mode->hbin_ratio
     mode->crop.height / mode->vbin_ratio

for those modes?

>   	return 0;
>   }
>   


