Return-Path: <linux-media+bounces-44691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C445BE2192
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 10:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8552D4EA17C
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 08:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F7432549C;
	Thu, 16 Oct 2025 08:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6udRf96"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE852FF652
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 08:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760602283; cv=none; b=goaEeN7WRf04/ToZLmCL8gq8ozFhvD3QShWH7Kq507lZ7S8O5urGdkxvNjRiwEjHjOMvFVK31P36rHr0VS9vJFBWQ3rxRbFCmpM576NA8SCkPry//ixbxtSFdJ+XlPpG2N3l/LsXd+oGeeNnrbDS2oxM8X4aT00Dvc11mBNbwyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760602283; c=relaxed/simple;
	bh=qb955I25stn686vANe32cdVasVspBIOh8gzbwSMTCCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/uIT8y20sEOkjyco51IG/ZP6sOya6V/QnjVqH4HPZ4eo5t3ahyVNwrFfN5pbeGjDGWr6qYksjlrTDz7pncjL1DSoz4ThCbHU86nNg/n7tx7UzwexnFI8QzqSVliPmpRaqydkmwTjEnq1XVKSVPKGJiMoM2kWaPdsNesa6TEEHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6udRf96; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57e36125e8aso441123e87.2
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 01:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760602279; x=1761207079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X5+2CZZfMBynQqO48tMM7HGvpzaeSmX/JqR3/En34zE=;
        b=W6udRf96Px36hSdnU0kr1D/6AunNUbPbOgesfElM1yvqVKewsWMBjtY7oIamLrmCom
         gG24CXJohwj3ISkfxvvl19Z9bP8KvTTTDIl92yTF/FqaAcisVIzku8akq9zKOZPmUHgU
         FfOKnCZkaY8fr1cE/38PlV4tW+kNUIVUyaX7X4lUlpW6TDpU+W68ifUhARPOkorYeE9n
         AAl2NSDFsy3ZETml6wj9JWqP9PzMaoa+OJD+Pb2IUc5LUQ+vWOYieJwd8StHib85sstn
         sy0wckYc1Q7koTRx2JaFS3USdVLcJ0BEGjjLCskFEE7qyXGg8sQWq5SUhTzaR8OCUsAY
         j2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760602279; x=1761207079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5+2CZZfMBynQqO48tMM7HGvpzaeSmX/JqR3/En34zE=;
        b=PCG1tyLdvs/4o0TmcJgapY6hwmAxKxHcq8WZgNsOmMQE/0QjXRHw/GLXXrSDSTcS2K
         +rcDRXq+YKrMismeDVYKofPcvGj2HPU9SvZQBXSZYtrhBGlfaZMKqTcN4YHxGwm+K+8y
         JVTdwLlIXy3S5pXW87h8SD5Uw4PHTMm8RTUXp77QSBySAan/9Bhgs3YmJRyPvbMz0jnH
         RpJpC/vnHrWWzscIetts4sRNGt97NkpntMh+0ln72pHweKom4xrjNPhcsHm8vDssUIYv
         ljKt9YnnnpexaB9yUlojDFsh7+1fXKDNOkLiJK6V1zS05eeuCLSfGTWN/q+Oa5/uFsbD
         0Oeg==
X-Forwarded-Encrypted: i=1; AJvYcCVTxq8d05ZfuUBEtZIFnv7cbrJBz8vYFrPImUKCymqsCxfAcJ1dSx1XEr1nNPGYdZ3X9FwOTPnoF8n3gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvsrXvO2x+aECdVNwZDit026R7OrbSoVP/47+54NF7Pe/0bACe
	Ol1w9iEH9B8WDD/vTpljpe7c8pmgxe76Lj9JQ1l+DFvX9NKD+eGCvIeO
X-Gm-Gg: ASbGnctTZyT0pJwKT6gh1Xq4v98YkEWyQnR2K1VJKr1atIR2Zdlf/0U2vMJdAt1DsVe
	kvYGUDDpdeBDOjiA29eBUZoEL9U1mewYw7VEsSuqMKwq2L07OpvU47BKmZg2NbAaOP5dCbZ2LJq
	bhJbyS0yElfOsb8i9hBg6YdTrx8gsUayH7Im9oeUhNo2JO2u+y0d5MEvfRgp2xDAzIFEjy31tAZ
	7xNjr73BAVqcBW8xH/56S2sTg+DKieWNyNEJV4KfHQSWLHooBRgvwHNjNz7VUYwHgtitw2z4Om/
	V2wyRTin1L24CeBzChEtnizqdWlaupivCQa/D7PH8wiNhYdC8bbIB7NHPJ9w2i7US+xLuAMW83W
	Z7VTnlaMqJLp4s+Fx5sYYhi/Gq/4WExqQ3KkdCW/fzS//MSx0sj3YMHAYBTIkMmPwtxFYbeD68g
	4Gb4n/9kIDVWfLJ7h5jwoOWxk9LNZzjM2zlks=
X-Google-Smtp-Source: AGHT+IEYWB1mGiujYNtAZfgmbXj5qXzMVo5yOgGV2/jf8UYxiEdfgb8Xo1Yclq2cMZD8i9xmbbs1dA==
X-Received: by 2002:a05:6512:1325:b0:57e:f60:2330 with SMTP id 2adb3069b0e04-5906dc122b7mr8208187e87.21.1760602278760;
        Thu, 16 Oct 2025 01:11:18 -0700 (PDT)
Received: from [192.168.15.130] (94-240-0-2.lukman.pl. [94.240.0.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3764618a0c9sm49380031fa.53.2025.10.16.01.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:11:18 -0700 (PDT)
Message-ID: <fdcbd981-259f-418a-a72b-cc463d39796c@gmail.com>
Date: Thu, 16 Oct 2025 10:11:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/25] media: samsung: s5p-jpeg: Drop unneeded
 v4l2_m2m_get_vq() NULL check
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
 <20251015075353.22625-22-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
In-Reply-To: <20251015075353.22625-22-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Laurent,

W dniu 15.10.2025 o 09:53, Laurent Pinchart pisze:
> The v4l2_m2m_get_vq() function never returns NULL.
> 
> In the set format handler, the check may have been intended to catch
> invalid format types, but that's not needed as the V4L2 core picks the
> appropriate VIDIOC_S_FMT ioctl handler based on the format type, so the
> type can't be incorrect.
> 
> In the get format handler, the return value is not used for any purpose
> other than the NULL check, which was therefore probably intended to
> catch invalid format types. That's not needed for the same reason as in
> the set format handler.
> 
> Drop the unneeded return value check and, as the function has no side
> effect, the unneeded function call as well.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>

> ---
>   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> index 81792f7f8b16..ff28482759ec 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> @@ -1332,15 +1332,10 @@ static struct s5p_jpeg_q_data *get_q_data(struct s5p_jpeg_ctx *ctx,
>   
>   static int s5p_jpeg_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
>   {
> -	struct vb2_queue *vq;
>   	struct s5p_jpeg_q_data *q_data = NULL;
>   	struct v4l2_pix_format *pix = &f->fmt.pix;
>   	struct s5p_jpeg_ctx *ct = file_to_ctx(file);
>   
> -	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
> -	if (!vq)
> -		return -EINVAL;
> -
>   	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE &&
>   	    ct->mode == S5P_JPEG_DECODE && !ct->hdr_parsed)
>   		return -EINVAL;
> @@ -1593,8 +1588,6 @@ static int s5p_jpeg_s_fmt(struct s5p_jpeg_ctx *ct, struct v4l2_format *f)
>   	unsigned int f_type;
>   
>   	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
> -	if (!vq)
> -		return -EINVAL;
>   
>   	q_data = get_q_data(ct, f->type);
>   	BUG_ON(q_data == NULL);


