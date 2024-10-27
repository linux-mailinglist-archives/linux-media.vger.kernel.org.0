Return-Path: <linux-media+bounces-20358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DC69B1E10
	for <lists+linux-media@lfdr.de>; Sun, 27 Oct 2024 15:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EBCB1C20A67
	for <lists+linux-media@lfdr.de>; Sun, 27 Oct 2024 14:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85291161320;
	Sun, 27 Oct 2024 14:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hMJLOtho"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6452CA5B
	for <linux-media@vger.kernel.org>; Sun, 27 Oct 2024 14:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730038676; cv=none; b=Icg4a7vemou3CVoMX052HLg7aPqAiGUVwndYx18vfwXeolBE68JoWTBqYEKHDHwVsj3awcOLyXOCNBirAvTh/NAHNlZzEgrlvSkrCTZrGqPPJ67ohiA94hqYuaOmH/xIFi9PcjZGFFY/PKfrra47ly1chKzq0iKWC/aywv6BVio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730038676; c=relaxed/simple;
	bh=qPl3DgmjvCFOJe4a4wZ7JNrdGHfDo0BpsXMkoDLvPb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/dLehazamwihrKOJV+jyRXL87OJcu2efPL5NFpVODKdE5TGXji60TR11lYs9BTpp3FBGIeX2V3C1ukslXq9FAgR6cQym+KuocvMukBkJv9RyLzifha49I0/vapxA869MvobvCnY7iveDjI7HfmJY4l/LbqCnzVtm3eqKh3g8cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hMJLOtho; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E470B7E4;
	Sun, 27 Oct 2024 15:17:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730038669;
	bh=qPl3DgmjvCFOJe4a4wZ7JNrdGHfDo0BpsXMkoDLvPb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hMJLOthoItP0uxp0Bm6C+5Nc6/e9Ywf2wF8vEuONEjKBcYpMGP+SLgepIlxesH3fY
	 zlUHT3m6HZojmeyKv1QwejOFj97PcMuxv7gi2kA3VbFq9Ot8jhtRMDay+GJa0hAfyl
	 T3qEzKyVYEYmAaYbWgulR8BevhL6ax9qSV1pIpLE=
Date: Sun, 27 Oct 2024 16:17:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] media: dw100: Rectify rounding error
Message-ID: <20241027141744.GH6519@pendragon.ideasonboard.com>
References: <20241025130300.227817-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025130300.227817-1-umang.jain@ideasonboard.com>

Hi Umang, Stefan,

Thank you for the patch.

On Fri, Oct 25, 2024 at 06:33:00PM +0530, Umang Jain wrote:
> From: Stefan Klug <stefan.klug@ideasonboard.com>
> 
> The current scaler code fails in many cases which can be validated
> by the following python script:
> 
> ```
> error_count = 0
> valid_count = 0
> 
> def check_scaling_error(src_w, dst_w, add_point_five):
>     global error_count
>     global valid_count
> 
>     qscale = (dst_w << 16) // src_w
> 
>     if (add_point_five):
>         delta = 1 << 15; # 0.5 in Q16.16
>     else:
>         delta = 0
> 
>     scaled_w = ((((src_w << 16) + delta) * qscale) >> 32)
>     if dst_w != scaled_w:
>         print(f'scale_error: src_w: {src_w} | dst_w:{dst_w} | scaled_w:{scaled_w}')
>         error_count += 1
>     else:
>         valid_count += 1
> 
> print(f'==== Test without delta=0.5 ====\n')
> for i in range(1000, 1920):
>     check_scaling_error(1920, i, False)
> print(f'Error: {error_count} | Valid: {valid_count}\n\n')
> 
> error_count = 0

You need to reset valid_count too here.

> print(f'==== Test with delta=0.5 ====')
> for i in range(1000, 1920):
>     check_scaling_error(1920, i, True)
> print(f'Error: {error_count} | Valid: {valid_count}\n\n')
> ```
> 
> Excerpt of the output is retrieved:
> ```
> 	==== Test without delta=0.5 ====
> 	...
> 	...
> 	scale_error: src_w: 1920 | dst_w:1915 | scaled_w:1914
> 	scale_error: src_w: 1920 | dst_w:1916 | scaled_w:1915
> 	scale_error: src_w: 1920 | dst_w:1917 | scaled_w:1916
> 	scale_error: src_w: 1920 | dst_w:1918 | scaled_w:1917
> 	scale_error: src_w: 1920 | dst_w:1919 | scaled_w:1918
> 	Error: 859 | Valid: 61
> 
> 	==== Test with delta=0.5 ====
> 	Error: 0 | Valid: 981
> ```
> Hence, fixing the scaling rounding error by adding 0.5 to the
> frame dimensions before applying the scale.
> 
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/dw100/dw100.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
> index 42712ccff754..541706f0aec4 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -984,6 +984,7 @@ static int dw100_s_selection(struct file *file, void *fh,
>  	u32 qscalex, qscaley, qscale;
>  	int x, y, w, h;
>  	unsigned int wframe, hframe;
> +	uint32_t zero_point_five;
>  
>  	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
>  		return -EINVAL;
> @@ -1032,8 +1033,9 @@ static int dw100_s_selection(struct file *file, void *fh,
>  			}
>  		}
>  
> -		w = (u32)((((u64)wframe << 16) * qscale) >> 32);
> -		h = (u32)((((u64)hframe << 16) * qscale) >> 32);
> +		zero_point_five = 1 << 15;
> +		w = (u32)(((((u64)wframe << 16)+zero_point_five) * qscale) >> 32);

I'm having trouble understanding what you're really fixing here. It
seems the patch ensures that the crop rectangle requested by the
application doesn't get adjusted, but doesn't take into account what is
actually programmed to the hardware. Looking at dw100_hw_set_src_crop(),
I see that the hardware scaling factor is expressed as a UQ1.7 integer.
Shouldn't the rounding applied by the hardware need to be reported in
the crop rectangle returned by dw100_s_selection(), instead of
pretending it can be pixel-perfect ? At the very least I would expect
this function to use Q1.7 encoding for the scaling factor, and apply the
same rounding as the hardware to calculate the width and height back.

> +		h = (u32)(((((u64)hframe << 16)+zero_point_five) * qscale) >> 32);

Missing spaces around '+'/

>  		x = x + (sel->r.width  - w) / 2;
>  		y = y + (sel->r.height  - h) / 2;
>  		x = min(wframe - w, (unsigned int)max(0, x));

-- 
Regards,

Laurent Pinchart

