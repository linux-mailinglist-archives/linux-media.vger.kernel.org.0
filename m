Return-Path: <linux-media+bounces-15028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE149316CE
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 16:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 921E51F22CB4
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 14:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF4618EFD0;
	Mon, 15 Jul 2024 14:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ej0EsMbP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AAC18EA85
	for <linux-media@vger.kernel.org>; Mon, 15 Jul 2024 14:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721053854; cv=none; b=jqc1G+nVtT7mXT+hA7cJRwzf3kAyPKrhXVkLW1f1M0ct+OEelfUgUUdee9o8zEQiD/ceDdNJEO4SzDm1MVcC66ubAk4TssA6x96/+YDy1iGROIacvGbH7bT9qiuwM1c60pPgrPxGWekz0hleEX9HLvm1uxbAuGwHzSUs4/GLc+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721053854; c=relaxed/simple;
	bh=lfhIDgG8aIpnMofvE4K3NzvsrMT8nhGPAIApVMYn9Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uu7d7+CqvMrIbAaaxPtw3+UJNSO1sjE9YyR0cH4JVvQ1/9QiJU8/dnox61clvXqldWjOiwD/3Vbf6+9geT/QgqdoP9yjcZjXt6gvQWxA1AjtDd7bgIG+NKD00QUV0L6Rk9vU0VOg1TCQT3nmFdBU7XJuHRqOOf1///vxWnuRChg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ej0EsMbP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9040A496;
	Mon, 15 Jul 2024 16:30:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721053814;
	bh=lfhIDgG8aIpnMofvE4K3NzvsrMT8nhGPAIApVMYn9Jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ej0EsMbPBn3tH8A2yvSWV7dz6QhNLmUGjP/1vdEp08kTiptsU7aI1ufcdPtJwJZPc
	 CWtkDAaf6LDzxsQvd8I++Xl0aIpJKSkD0FS2hBeTeZqQhZDTxWMhQJMoBICAa/jvCL
	 tmZsA/yOFz/oaXdpWMbO4N0f9WLTD6QZGL3ZC6Qk=
Date: Mon, 15 Jul 2024 16:30:48 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: linux-media@vger.kernel.org, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] media: pispbe: Protect against left-shift wrap in
 V4L2_COLORSPACE_MASK()
Message-ID: <t4zv56rnrprztgyjyjx3k3lzaitddky3c22bqslykq3qvxi7gi@jaafmm5uw6rs>
References: <20240715102425.1244918-1-naush@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240715102425.1244918-1-naush@raspberrypi.com>

Hi Naush

On Mon, Jul 15, 2024 at 11:24:25AM GMT, Naushir Patuck wrote:
> Ensure that the user requested colorspace value does not wrap when
> using the V4L2_COLORSPACE_MASK() macro. If the requested colorspace
> value >= BIT_PER_LONG, revert to the default colorspace for the given
> format.
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>

Thanks for handling this

> ---
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index e74df5b116dc..bd5d77c691d3 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -1124,8 +1124,9 @@ static void pispbe_try_format(struct v4l2_format *f, struct pispbe_node *node)
>  	 * not supported. This also catches the case when the "default"
>  	 * colour space was requested (as that's never in the mask).
>  	 */
> -	if (!(V4L2_COLORSPACE_MASK(f->fmt.pix_mp.colorspace) &
> -	    fmt->colorspace_mask))
> +	if (f->fmt.pix_mp.colorspace >= BITS_PER_LONG ||
> +	    !(V4L2_COLORSPACE_MASK(f->fmt.pix_mp.colorspace) &
> +	      fmt->colorspace_mask))
>  		f->fmt.pix_mp.colorspace = fmt->colorspace_default;

Isn't it better handled in the macro definition itself so that future
usages of the V4L2_COLORSPACE_MASK() macro won't need to be protected
like this one ?

Would this silence the smatch warning ?

-#define V4L2_COLORSPACE_MASK(colorspace) BIT(colorspace)
+#define V4L2_COLORSPACE_MASK(c)        BIT((c) < V4L2_COLORSPACE_LAST ? \
+                                           (c) : V4L2_COLORSPACE_LAST)


>
>  	/* In all cases, we only support the defaults for these: */
> --
> 2.34.1
>

