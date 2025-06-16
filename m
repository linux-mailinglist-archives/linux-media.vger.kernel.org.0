Return-Path: <linux-media+bounces-34935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46987ADB33C
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAE953A4376
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012591DED70;
	Mon, 16 Jun 2025 14:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rnDklTqx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589184642D;
	Mon, 16 Jun 2025 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083285; cv=none; b=tqfGyjdpwRk+eJC+MOF67nMs6jQYtZjHSHWCIfmOXH+AvDxxs6WkN36e/223WqOqQLakFUmm1XPN4/KizuBMpjq3U/sBe0QzGxD3/b0FbY/r2ZSBmcnGl2zC/k15VBn02L+i6EOyEiWSyjRmxXv8k2Ru7ys5/oTnvLd3jF6OpXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083285; c=relaxed/simple;
	bh=jS2Q+1EzrUDyOWoIm//NLEGW96pjBPREVnh99l31kRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkzA8boiTeQe5XhggexI2P7jJ9QzE+/3L75W6a4AgCTv649cw8Jt1A+Z71HElezjXNdgxm8z4IyuOm92dYD9DdLWQ4L/PAmloxciCSc8XxQd+2QQxiIZ3VXGh7RNG+cRhYvkEWjlhQvMdLSi4+9eyjyRfQIqGcF6s9NodYFfAPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rnDklTqx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55513C4CEEA;
	Mon, 16 Jun 2025 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750083284;
	bh=jS2Q+1EzrUDyOWoIm//NLEGW96pjBPREVnh99l31kRg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rnDklTqxnqq1KcAwz53/rX07qcH5zHc9UUH61N78v1Ej/zMeiZKzYtk25jGjmvBNx
	 HbvX2Q0Q0zmoPhm68XLuaEHLPfkUKgTA00ni408nGIpJ8K1ehtWvMbuJXufNQEofjn
	 CsGW3wwIsJDFj8x93WFF+WWuc5sgpHmyYSVFo/rVt92WWI9k/KImpvw0IVGA6TbFZA
	 v01Ohi/PW/8IEabEjJZ2Dp9Jdwq2EcQPJ2Ipd/gstgN2y/feETEYPIa4BwbZX6P5OA
	 uN8vwtM0X4L4b4cE1GI3oahUjwZroKWBqGSYoAbUWYRhAu1H0oKb0lLzl8g3zyUV8D
	 cq4fV2vSS7tRw==
Message-ID: <cebcac7e-9c39-4feb-96ac-992d7affeb1b@kernel.org>
Date: Mon, 16 Jun 2025 16:14:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] media: core: export v4l2_compat_translate_cmd()
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
 <20250602-uvc-grannular-invert-v2-8-c871934ad880@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-8-c871934ad880@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 2-Jun-25 15:06, Ricardo Ribalda wrote:
> v4l2_compat_translate_cmd() can be useful for drivers to convert between
> the VIDIOC_*32 and VIDIOC_ defines.
> 
> The VIDIOC_*32 defines are not accessible by the drivers, they live in
> v4l2-compat-ioctl32.c.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans




> ---
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> index 8c07400bd280dea5d2e66e2759658c423bcd3866..ced4892b42597d605887b7c6a14373e3922f7bc6 100644
> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> @@ -929,6 +929,7 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
>  	}
>  	return cmd;
>  }
> +EXPORT_SYMBOL_GPL(v4l2_compat_translate_cmd);
>  
>  int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
>  {
> 


