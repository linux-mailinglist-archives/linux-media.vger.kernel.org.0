Return-Path: <linux-media+bounces-19792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E61FE9A2018
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 12:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AC411F22AAB
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 10:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47E51D2F61;
	Thu, 17 Oct 2024 10:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fitoWWqw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839441D966B;
	Thu, 17 Oct 2024 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729161275; cv=none; b=cvE/e+DHwojIUBmWLnMaijEdFYQ47NAjJf+V2ue3qHAceE5CWyvbWlAOYfGXyx2Y0/wZhrAEpg3+cp9mpOOLtrGmNMDtLWde6pcj5ZOXsWBYyIwB80g68utrAfDUosuVUSmczi2zGpES3gm3wBCFVvG7cbu7oNGQy1BhFv+7MF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729161275; c=relaxed/simple;
	bh=2HKS+YmD5B2Dly0sLQmjE7gavsagPyykmQJ+lhyDz5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XTrvuRdvKqrSLfKw5FnHIF/BGl1OkXl6nxcYBuGh+uFqkiv0iPnNvw3a/myBaWJWEeJq71ouOgLjf37OA95UsbvgnbHMy2toxW08QKGc6SZ5t2cuOP/DDR2IRRybKSX2ZBmWrreiFKbyoS5W4dIr8kzr7fGOGDVwZSGPpa9jris=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fitoWWqw; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a1b71d7ffso111795766b.1;
        Thu, 17 Oct 2024 03:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729161272; x=1729766072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RI5Duu0ie0BXr5/GSCqGUartM+TPyPW+SIijWcsO3Pg=;
        b=fitoWWqwV2dKskn7T4b+rzk4XaaruQYNJfE4+39RQRKa/xt/GTm3GkZ9RCK8Decqcq
         GJjkLxJeD+V4fkV/wnM+x7Qf0QHFFvbJWxylW9RdfwRgpAagZluOYRz5X6MW1zYxOOxs
         iiUX6KeLY6ro9Jg2TSlPTTJWulVmLUPFzLs8O34rDBt05ec2ZUU6KXhJpWcFfqNKqdbZ
         zxQMGyOi1nsCueMCNChNxhlRLbnvW8/sDFzi7AxP6Q2t4GmFnd1n7q2kMfoyHVNxAB+r
         TbMTbXLQEQugrxR2rHMvv5ImwTOWVPfG4ZnSYVP6jHWp2TahJdjxZ/2MxESJCQk6aQC0
         xI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729161272; x=1729766072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RI5Duu0ie0BXr5/GSCqGUartM+TPyPW+SIijWcsO3Pg=;
        b=dGIRopKhodWDSFkRobsN3k7ZD30pG8tXO3wu9YgQPCXxTJz/8thT57df90ZNZUQSuD
         We7aspxA7a6t8ZyG+5urvqTfz+sEUgPpWChjQaCQNCP5ENReLIdG14j/uJN2koFSmckS
         PuUHRO91P2dHc5qc3thJ3QuY1mjr1ayno9VudIspLEeP2JDR41mqYpPYLYnBuSK4WRhK
         nRiACt/TweBTxxe4hR+37lAfY9j7vrXqM5rzdq4DdmThopKXYvbwj3irGGJiyrMC2xW8
         hu4UoPgawGYZOit3zOtkt65ZZfwCbFRdccvZxQUs77Tw+BWQ8zSMbSRfcIRkyHtp8fTL
         A4XA==
X-Forwarded-Encrypted: i=1; AJvYcCUNOBdItzJtCR8QN+dnakKlg+dNSJPf6xhPdifclGTj6qKKXoXI2krwQj5lTmJQxjV0eUoE7mVe@vger.kernel.org, AJvYcCVvr+oMhh2FiinQIJ8IUOup4pkFnrj0DVdW5Sub5ZJGz4al29JpmAsaL3BFi+2s89mdzvt2WQlQHyGEXsc=@vger.kernel.org, AJvYcCXbgYL9F2YzOI+7HuFiMWxWNf4uMbss75BVM+e+1QZdUAjgzIsSHD6vaB/C0r0z5DL6ZzeREFGTsgoUqGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOyOFxNgLQylr4ZHJ+EobmkOkY2mbnLUEWUDjA0NNnbxLK38ba
	HafhV64U12CtbyvJ0/QygS9QJsWducVABpbHJHAVKCCKzBShEmzV
X-Google-Smtp-Source: AGHT+IHRVOJYobAlUFIv1wiiXYcuRBS4ZuRqxfY4PRApRdzrHhuzQvlH24VlwuZQCRC6AMhLM/PzzQ==
X-Received: by 2002:a17:907:930d:b0:a9a:dac:2ab9 with SMTP id a640c23a62f3a-a9a0dac2ec0mr1424435566b.42.1729161271476;
        Thu, 17 Oct 2024 03:34:31 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29718b84sm282176466b.29.2024.10.17.03.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 03:34:30 -0700 (PDT)
Message-ID: <48d9f9b4-8b28-f24b-c0bd-d899c59bd247@gmail.com>
Date: Thu, 17 Oct 2024 12:34:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 07/13] media: s5p-jpeg: prevent buffer overflows
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, stable@vger.kernel.org
References: <cover.1729074076.git.mchehab+huawei@kernel.org>
 <16ccf3d588665a5a0dda91cbb04374d6aea99ca6.1729074076.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <16ccf3d588665a5a0dda91cbb04374d6aea99ca6.1729074076.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mauro,

On 10/16/24 12:22, Mauro Carvalho Chehab wrote:
> The current logic allows word to be less than 2. If this happens,
> there will be buffer overflows. Add extra checks to prevent it.
> 
> While here, remove an unused word = 0 assignment.
> 
> Fixes: 6c96dbbc2aa9 ("[media] s5p-jpeg: add support for 5433")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>   .../media/platform/samsung/s5p-jpeg/jpeg-core.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> index d2c4a0178b3c..1db4609b3557 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> @@ -775,11 +775,14 @@ static void exynos4_jpeg_parse_decode_h_tbl(struct s5p_jpeg_ctx *ctx)
>   		(unsigned long)vb2_plane_vaddr(&vb->vb2_buf, 0) + ctx->out_q.sos + 2;
>   	jpeg_buffer.curr = 0;
>   
> -	word = 0;
> -
>   	if (get_word_be(&jpeg_buffer, &word))
>   		return;
> -	jpeg_buffer.size = (long)word - 2;
> +
> +	if (word < 2)
> +		jpeg_buffer.size = 0;
> +	else
> +		jpeg_buffer.size = (long)word - 2;
> +
>   	jpeg_buffer.data += 2;
>   	jpeg_buffer.curr = 0;
>   
> @@ -1058,6 +1061,7 @@ static int get_word_be(struct s5p_jpeg_buffer *buf, unsigned int *word)
>   	if (byte == -1)
>   		return -1;
>   	*word = (unsigned int)byte | temp;
> +
>   	return 0;
>   }
>   
> @@ -1145,7 +1149,7 @@ static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
>   			if (get_word_be(&jpeg_buffer, &word))
>   				break;
>   			length = (long)word - 2;
> -			if (!length)
> +			if (length <= 0)
>   				return false;
>   			sof = jpeg_buffer.curr; /* after 0xffc0 */
>   			sof_len = length;
> @@ -1176,7 +1180,7 @@ static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
>   			if (get_word_be(&jpeg_buffer, &word))
>   				break;
>   			length = (long)word - 2;
> -			if (!length)
> +			if (length <= 0)
>   				return false;
>   			if (n_dqt >= S5P_JPEG_MAX_MARKER)
>   				return false;
> @@ -1189,7 +1193,7 @@ static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
>   			if (get_word_be(&jpeg_buffer, &word))
>   				break;
>   			length = (long)word - 2;
> -			if (!length)
> +			if (length <= 0)
>   				return false;
>   			if (n_dht >= S5P_JPEG_MAX_MARKER)
>   				return false;
> @@ -1214,6 +1218,7 @@ static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
>   			if (get_word_be(&jpeg_buffer, &word))
>   				break;
>   			length = (long)word - 2;
> +			/* No need to check underflows as skip() does it  */
>   			skip(&jpeg_buffer, length);
>   			break;
>   		}

Seems reasonable.

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

