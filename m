Return-Path: <linux-media+bounces-48136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 33346C9E6C2
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 10:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9154C4E3E6D
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 09:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DBB2D8798;
	Wed,  3 Dec 2025 09:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARGyTjRN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F072C21FF
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764753201; cv=none; b=PMhDIhoCBBFgUis91UtOV1opNlAYU4opzRzkMmmzVeucHR4fhapucaVySrSvWXESZolqPj4hCcQadZ/0/2+8xQ2KBWiLiSxoMtOgcu8jOwyQ+t/YCowYVZhPiSnrJIwl42MCejEQRt9CqFffr+7XNbOYuraTwiInCzw1tDds1xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764753201; c=relaxed/simple;
	bh=gwg1cUeefqEYWrbqIza438gE3P5ot++SGc1pBk7cowg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J5xfEZyw+ptaGoX3Vt/dHoJnmMIViSY9R0eT6VZr2/wqc7Pb4zr5fAXOhZsZiO9IG4l2TLP72y3qoccqOcx+UjpAmyAtkYfuHTdQBHJe4zNJcP8BrFfGIH+qkRpfEyUMLVidl7juizxIX4ekhTyEoSMdMixb1r+ozgQ8vnevSPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARGyTjRN; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b73a9592fb8so211384666b.1
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 01:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764753197; x=1765357997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7oZdM7Bhkia/T2ka2lT6n6j9t2T47bvS70YVWKTp9c=;
        b=ARGyTjRNR8zg9pnYiJ79xkzyzhTJS4MX7JcN2oToEvGIZhcLpV0BVtGuoshT0gvnZi
         rAKkxciytOrt+EpMdeEcxb3gKVsiTYah280/iUFgnCSLm6pU4pXnbN5OzcdTICyevA2d
         giFtwcTHLSqcw8zkzwmKxPRYYaGAKBpx+b9XgCX39mN9NYTu+EB26NjD84JmvEobTOZp
         vQT0aGgXVulr+Ql2imRW8DSnzSawc4Un/gVSrfGnkkDNf7EQY+rZ0QLA3CZN0n6isCuV
         W0Cab4rg2sLagLTRd2+hCZ0YYLSTbynvzvDtE9DkC89aG++o/tTcQdyDblDgedIz5PRH
         WPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764753197; x=1765357997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T7oZdM7Bhkia/T2ka2lT6n6j9t2T47bvS70YVWKTp9c=;
        b=AGmr2TP+0NtZ6oExF+3MmNFvuPBvO30/aZsweuQ5HZOd7XLdiBLI7CR1n+Uy2HX1oR
         NdPApPzQV+9Yg518fsRvGDcPu7FP6XgtfTCYKvql3c9iguv9GwXD7SHRxpBu9H0gWT5p
         JKwQhYuenUEwLd6JUF7698Zy12O84dq6B2CBxLx0cIXdsKXebrdo1I+/0wrPCUOH2IeR
         ZZ77R881HHjRSxMUlyr9KLOL+58oT+TR82CFR9bXBtAj+mWdHrVl8SAQUVs96iAT3gdu
         DPBvRj7DAbNp7ZybfSWaKshekAiMTRzCkygMYKCDmy2u75gZ5boMtLxpmD0sGZOeP0Xp
         KL+A==
X-Forwarded-Encrypted: i=1; AJvYcCUVgj1HViZRXBvyX5SeWXzHX1UGi4+22l9nnT2PjS+sJIs8L0JtFvL8vV6b4ti+3mSnDm6epfWI2KRkMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgBflBRrDxsCJ436uteksU9KzI9OW7pzWTHTnzPmk4/J4/gOmM
	PMJTWtS+Kk7mvYP8Vr7YAXdL3iWI+jhNKv5qqLj040ATf+44c8dmscM3
X-Gm-Gg: ASbGnctKR89ulMH/PAoSZApo2Fi9yg3cuxz8EuH14fJRJYJkjw4xQ/Pp+Hya3elIPRd
	YX0oTuaFiosHkc0UzI3cpWgJIiczFEnG7SG++uOq9Z+WefPvCkkUoa5yjbSIU/mYFUGzn7ARGj9
	Xas1zvfygh7qXS+UCzt0y0Hxg5Z9AeSxsNXN+THKLOluJYjyEPsAieWcvjJn0f5dXviiUsnT6SC
	kDTKEOr5RZxV63DCUOYEZqjYLMst2NbEi+lI/6saxd+1nNaz/rG/9fErYO9e1azMt6++ayM+dzO
	GSucEiaajfIPZchGn5WR/aL7ZVQP1hkPA0/irsK2QV5kPrOCVRp9b9YK057M9CwP15fIgsF8mGF
	wJq80bHhG4p+jHk+DDR9cSTud5cs+Q1pDXJzlJeiO/gRroVtHbKOretXuEPO1V2H9gLXD3SiXo4
	RY3GunTP8=
X-Google-Smtp-Source: AGHT+IHRcaZPHaIjuKYFbFHtZj/e375S+VWRWPNOXbUn5kpsJd7u/xOi3ucj9K/9ixeSl8Qs6jLIgA==
X-Received: by 2002:a17:907:60c9:b0:b79:cbbf:7b09 with SMTP id a640c23a62f3a-b79d65a6485mr181409366b.15.1764753197095;
        Wed, 03 Dec 2025 01:13:17 -0800 (PST)
Received: from foz.lan ([95.90.158.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51a9819sm1762754166b.25.2025.12.03.01.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:13:16 -0800 (PST)
Date: Wed, 3 Dec 2025 10:13:14 +0100
From: Mauro Carvalho Chehab <maurochehab@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Keke Li <keke.li@amlogic.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Daniel Scally
 <dan.scally@ideasonboard.com>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Vikash
 Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Stephen
 Rothwell <sfr@canb.auug.org.au>, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] media: uapi: c3-isp: Fix documentation warning
Message-ID: <20251203101314.18910911@foz.lan>
In-Reply-To: <20251203-warnings-6-19-v1-1-25308e136bca@chromium.org>
References: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
	<20251203-warnings-6-19-v1-1-25308e136bca@chromium.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 03 Dec 2025 08:55:34 +0000
Ricardo Ribalda <ribalda@chromium.org> escreveu:

> From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Building htmldocs generates a warning:
> 
> WARNING: include/uapi/linux/media/amlogic/c3-isp-config.h:199
> error: Cannot parse struct or union!
> 
> Which correctly highlights that the c3_isp_params_block_header symbol
> is wrongly documented as a struct while it's a plain #define instead.
> 
> Fix this by removing the 'struct' identifier from the documentation of
> the c3_isp_params_block_header symbol.
> 
> [ribalda: Add Closes:]
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20251127131425.4b5b6644@canb.auug.org.au/
> Fixes: 45662082855c ("media: uapi: Convert Amlogic C3 to V4L2 extensible params")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  include/uapi/linux/media/amlogic/c3-isp-config.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/media/amlogic/c3-isp-config.h b/include/uapi/linux/media/amlogic/c3-isp-config.h
> index 0a3c1cc55ccbbad12f18037d65f32ec9ca1a4ec0..92db5dcdda181cb31665e230cc56b443fa37a0be 100644
> --- a/include/uapi/linux/media/amlogic/c3-isp-config.h
> +++ b/include/uapi/linux/media/amlogic/c3-isp-config.h
> @@ -186,7 +186,7 @@ enum c3_isp_params_block_type {
>  #define C3_ISP_PARAMS_BLOCK_FL_ENABLE	V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
>  
>  /**
> - * struct c3_isp_params_block_header - C3 ISP parameter block header
> + * c3_isp_params_block_header - C3 ISP parameter block header
>   *
>   * This structure represents the common part of all the ISP configuration
>   * blocks and is identical to :c:type:`v4l2_isp_params_block_header`.
> 

Just merged this one at media-committers next. 

My plan is to send later during the merge window, after the first
PR I sent upstream gets merged.

Regards,
Mauro

