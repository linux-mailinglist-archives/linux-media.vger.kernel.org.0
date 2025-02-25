Return-Path: <linux-media+bounces-26945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29025A43FAA
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 13:50:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B2A83AD5FC
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 12:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC59268C51;
	Tue, 25 Feb 2025 12:50:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD68B1DD874;
	Tue, 25 Feb 2025 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740487813; cv=none; b=pM6uf9g2lAgSlKhP6x1TMZEZd7G5vNZSViixAid5FB7LKpeX5EoSkBre6SyGKDY/EPwNaFtz89HqOKMYgfOzEYFWCjKF04ZBMsWWNPLVt37fEpwzkk40FoLesG/jHbdtEIUxNoWixEJioLubiqq0PN4juJbEbq2VEW7XlMTt6P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740487813; c=relaxed/simple;
	bh=RDShVDm2hkvStdziotLtsnx5nP2gqIC6ZwbeypXhRVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uaqxw/1JMzjYCeqst3gTl8f24gg63wtWD6i/H5Af3XX8U4m6njGuSkScRxMxn6uU4k4nKIVvO8PP7mBpZ9XatBYiiGbp1YnOdevM/7dWKZ9/K8xtizKgYXaZO25+PETtjT5OMg8pwGRFRhVVg0Ay+QfDy9vly9Ij26ZeONYFWXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367A8C4CEE6;
	Tue, 25 Feb 2025 12:50:10 +0000 (UTC)
Message-ID: <795082c4-499f-4935-b580-72b01d82fe1b@xs4all.nl>
Date: Tue, 25 Feb 2025 13:50:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fixup! media: v4l2-common: Add helpers to calculate
 bytesperline and sizeimage
Content-Language: en-US
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-media <linux-media@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 linux-staging <linux-staging@lists.linux.dev>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Alex Bee <knaerzche@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Jonas Karlman <jonas@kwiboo.se>
References: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
 <20250225124008.195405-1-sebastian.fricke@collabora.com>
 <1953d249c3c.d1d6678f34821.5333341344528638254@collabora.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <1953d249c3c.d1d6678f34821.5333341344528638254@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/25/25 13:46, Sebastian Fricke wrote:
> Hey,
> 
> sorry about missing this in the patch series, if you don't like the fixup path, then I can send a new patch series as well.
> I just thought the change was minor enough and addressed the final comments.

Ah, this relates to patch 01/12 of this patch series:

https://patchwork.linuxtv.org/project/linux-media/list/?series=14577

Next time it might be better to just reply to the offending patch with the fixup.

That way it is clear for the maintainer what the fixup is for.

Regards,

	Hans

> 
> Regards,
> Sebastian
> 
>  ---- On Tue, 25 Feb 2025 13:40:08 +0100  Sebastian Fricke <sebastian.fricke@collabora.com> wrote --- 
>  > ---
>  >  drivers/media/v4l2-core/v4l2-common.c | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
>  > 
>  > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>  > index 07a999f75755..aa86b8c6aa75 100644
>  > --- a/drivers/media/v4l2-core/v4l2-common.c
>  > +++ b/drivers/media/v4l2-core/v4l2-common.c
>  > @@ -360,7 +360,7 @@ static inline unsigned int v4l2_format_block_height(const struct v4l2_format_inf
>  >  }
>  >  
>  >  static inline unsigned int v4l2_format_plane_stride(const struct v4l2_format_info *info, int plane,
>  > -                           unsigned int width)
>  > +                            unsigned int width)
>  >  {
>  >      unsigned int hdiv = plane ? info->hdiv : 1;
>  >      unsigned int aligned_width =
>  > -- 
>  > 2.25.1
>  > 
>  > 
> 


