Return-Path: <linux-media+bounces-20961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 549FC9BD79B
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 22:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84A141C229F5
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 21:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED747216213;
	Tue,  5 Nov 2024 21:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8Ehu90G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B93F1E0B65;
	Tue,  5 Nov 2024 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730842137; cv=none; b=H2v2e4Tmdv0XZxffM1btiQyoN3C2qYGltRzYe+6YzbpBgFClGjAHuWVSBj6ncG7MvvdjPZbE7hmgciF89i0cNY5s4F1z4mKKLaiF5dJFIQ36FdAVBWDCk6NriIFLk4LN0PfxbEfBQmytquk/uEoJ7+vY+DOo4GL/+McjBPBWO+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730842137; c=relaxed/simple;
	bh=ClrekfPxZQ76ZNV7DZX8QGPxXakxpQ0qHEZc3EGpDHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pIPRrObye9+W6c+iyt1AAzbR5nnA650h39zTS8SKnbpRnBF4kCna/CvK15Q4s+sS7is5C9nZeIgh4WRvAiE7tEpNXB6PWyAkI40sR5993ZCbGPAJPjod8FPjvgOOhZ7PsfyN/P+mYR8YA+kLcnFzA/PH2blbXLd7VwcyFSa06Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8Ehu90G; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c941623a5aso400484a12.0;
        Tue, 05 Nov 2024 13:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730842134; x=1731446934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eP2/dmGZ6upd0meydOq+bVFxjAFfyWnPqjTOOaybaFY=;
        b=Y8Ehu90GhTVJNDn6VrZ1xAYygTnpsWo7+avzQhe6Nd82hveHaBo2tFzggnWTSXjzC/
         lLYW09iag1iWbxFdQHQp7Ve5b/fupuPRYopcIl39g0cchjTf/3vXFNcCzc2lNIMUReAO
         pToysTGNYmSk1ZjT/5/pyniXEznY0Uf/9cHnD+2DWMupd4bc8hZDm1F69J3WehZUQ9pE
         4aSO5Ml+6AbOzaHg/0UsJU0P+Qj5TUBhlks1OGD6H+2x2ssq5NOCRG655geYLtrCouhp
         nc0OKfMWxsOcuqfnfXIj+Fq5Wiwfj4c0pFhWHf59whA/cWcytLdA6DLx+iH5XNU+uxKH
         edPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730842134; x=1731446934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eP2/dmGZ6upd0meydOq+bVFxjAFfyWnPqjTOOaybaFY=;
        b=WO24XvaQ+I9SsbZiySDzkkP78DYWVPsH/sOwtAtCEMzBS+b55UPXWBiWqGCphssMqo
         INVFTRswvXi18F32bpOEQlp1dDc/ihLAPTcrDY/PCpcDFhbqXz4Djrlf2HyBDfaTDdGg
         VjijSb5Ef8ahm5G5zbtfwwU2SezxACybS2p+9KEssmGXpp22y/dCvnXJURUNUPqF8U4x
         0zk/PHzsoiFhIgC+aaOhESFgLw2DcSRiowhBxDGbGguzs5DnvhzkA8mSqmy0uqcafTH1
         3RCVGRBzdlk6mzAwwroaB+aXIylZRdD/ZqeSrm8N6BXKGQDPBPchpqdcjJs8RN0d4pbD
         ydpw==
X-Forwarded-Encrypted: i=1; AJvYcCU8KYgfIHDw2pQkhX/3vkl5dGo4V7Ntz5qcaEMw+BQFqv7PPvmMAeVh4/rTa+uwqLplwD8Pfm5LrejuzWk=@vger.kernel.org, AJvYcCWrsoxmNlR8Ye+aKt+myGtbqQQtMMqFce/ompmdpoX+1P4743EZfOvpk3OVCi7OAjA1gVkDQccimQKVwVIRQ8FIaD4=@vger.kernel.org, AJvYcCXPypLIi9srPo8kAsYxnF/kTH/rSWwrev1n2XQbTWJOML4GcmhUvukENLXUl3KwgXJPUsfXdMudGfoUOV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbFAlusr6qkR7HjaWlgy5meHcuXFI4idA6nn4AdaBIhxldppcY
	yVU3XuAk9K1lvBC28oV76XIslNufYUGmNxY+6IoOp07yY8uv7pbL
X-Google-Smtp-Source: AGHT+IHUZAxiDAWEcZd5uQeTbY5C3HluVgi/eb5cOKQYEX/QkwtA0Jhcn5FY5SM7HLsTN2r4FykKig==
X-Received: by 2002:a05:6402:2709:b0:5ce:c7b1:e052 with SMTP id 4fb4d7f45d1cf-5cef55266f9mr306262a12.9.1730842133414;
        Tue, 05 Nov 2024 13:28:53 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6ac09edsm1785846a12.40.2024.11.05.13.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 13:28:52 -0800 (PST)
Message-ID: <a2c66875-490f-9b8e-5683-fa4ad1fba6da@gmail.com>
Date: Tue, 5 Nov 2024 22:28:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] media: platform: samsung: s5p-jpeg: Remove deadcode
To: linux@treblig.org, andrzejtp2010@gmail.com, s.nawrocki@samsung.com,
 mchehab@kernel.org, krzk@kernel.org, alim.akhtar@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241103192315.288743-1-linux@treblig.org>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20241103192315.288743-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David,

Thank you for the patch.

On 11/3/24 20:23, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> exynos3250_jpeg_operating() has been unused since it was added in 2014's
> commit 3246fdaa0ac2 ("[media] s5p-jpeg: Add support for Exynos3250 SoC")
> 
> exynos4_jpeg_get_fifo_status(), exynos4_jpeg_get_frame_size(), and
> exynos4_jpeg_set_timer_count() have been unused since they were added by
> commit 80529ae5c137 ("[media] s5p-jpeg:  JPEG codec")
> 
> Remove them.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>   .../samsung/s5p-jpeg/jpeg-hw-exynos3250.c     |  5 -----
>   .../samsung/s5p-jpeg/jpeg-hw-exynos3250.h     |  1 -
>   .../samsung/s5p-jpeg/jpeg-hw-exynos4.c        | 19 -------------------
>   .../samsung/s5p-jpeg/jpeg-hw-exynos4.h        |  4 ----
>   4 files changed, 29 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.c
> index 637a5104d948..6657d294c10a 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.c
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.c
> @@ -427,11 +427,6 @@ void exynos3250_jpeg_clear_int_status(void __iomem *regs,
>   	writel(value, regs + EXYNOS3250_JPGINTST);
>   }
>   
> -unsigned int exynos3250_jpeg_operating(void __iomem *regs)
> -{
> -	return readl(regs + S5P_JPGOPR) & EXYNOS3250_JPGOPR_MASK;
> -}
> -
>   unsigned int exynos3250_jpeg_compressed_size(void __iomem *regs)
>   {
>   	return readl(regs + EXYNOS3250_JPGCNT) & EXYNOS3250_JPGCNT_MASK;
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.h b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.h
> index 15af928fad76..709c61ae322c 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.h
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.h
> @@ -45,7 +45,6 @@ void exynos3250_jpeg_rstart(void __iomem *regs);
>   unsigned int exynos3250_jpeg_get_int_status(void __iomem *regs);
>   void exynos3250_jpeg_clear_int_status(void __iomem *regs,
>   						unsigned int value);
> -unsigned int exynos3250_jpeg_operating(void __iomem *regs);
>   unsigned int exynos3250_jpeg_compressed_size(void __iomem *regs);
>   void exynos3250_jpeg_dec_stream_size(void __iomem *regs, unsigned int size);
>   void exynos3250_jpeg_dec_scaling_ratio(void __iomem *regs, unsigned int sratio);
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.c
> index 0828cfa783fe..479288fc8c77 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.c
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.c
> @@ -185,11 +185,6 @@ unsigned int exynos4_jpeg_get_int_status(void __iomem *base)
>   	return readl(base + EXYNOS4_INT_STATUS_REG);
>   }
>   
> -unsigned int exynos4_jpeg_get_fifo_status(void __iomem *base)
> -{
> -	return readl(base + EXYNOS4_FIFO_STATUS_REG);
> -}
> -
>   void exynos4_jpeg_set_huf_table_enable(void __iomem *base, int value)
>   {
>   	unsigned int	reg;
> @@ -300,22 +295,8 @@ void exynos4_jpeg_set_dec_bitstream_size(void __iomem *base, unsigned int size)
>   	writel(size, base + EXYNOS4_BITSTREAM_SIZE_REG);
>   }
>   
> -void exynos4_jpeg_get_frame_size(void __iomem *base,
> -			unsigned int *width, unsigned int *height)
> -{
> -	*width = (readl(base + EXYNOS4_DECODE_XY_SIZE_REG) &
> -				EXYNOS4_DECODED_SIZE_MASK);
> -	*height = (readl(base + EXYNOS4_DECODE_XY_SIZE_REG) >> 16) &
> -				EXYNOS4_DECODED_SIZE_MASK;
> -}
> -
>   unsigned int exynos4_jpeg_get_frame_fmt(void __iomem *base)
>   {
>   	return readl(base + EXYNOS4_DECODE_IMG_FMT_REG) &
>   				EXYNOS4_JPEG_DECODED_IMG_FMT_MASK;
>   }
> -
> -void exynos4_jpeg_set_timer_count(void __iomem *base, unsigned int size)
> -{
> -	writel(size, base + EXYNOS4_INT_TIMER_COUNT_REG);
> -}
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.h b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.h
> index 3e2887526960..b941cc89e4ba 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.h
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.h
> @@ -35,10 +35,6 @@ void exynos4_jpeg_select_dec_h_tbl(void __iomem *base, char c, char x);
>   void exynos4_jpeg_set_encode_hoff_cnt(void __iomem *base, unsigned int fmt);
>   void exynos4_jpeg_set_dec_bitstream_size(void __iomem *base, unsigned int size);
>   unsigned int exynos4_jpeg_get_stream_size(void __iomem *base);
> -void exynos4_jpeg_get_frame_size(void __iomem *base,
> -			unsigned int *width, unsigned int *height);
>   unsigned int exynos4_jpeg_get_frame_fmt(void __iomem *base);
> -unsigned int exynos4_jpeg_get_fifo_status(void __iomem *base);
> -void exynos4_jpeg_set_timer_count(void __iomem *base, unsigned int size);
>   
>   #endif /* JPEG_HW_EXYNOS4_H_ */

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

