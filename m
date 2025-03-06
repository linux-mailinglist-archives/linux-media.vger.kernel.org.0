Return-Path: <linux-media+bounces-27666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD31DA53F95
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 02:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6C1B1891C36
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 01:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281E37DA67;
	Thu,  6 Mar 2025 01:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FeGmXz8/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B615628DA1
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 01:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741223157; cv=none; b=pT/injwvPEw9H0y+zGZSf+204MqT44D/+Zk3tPfCtnUJbTo+rxq40sBLOOFwp2XWuA0Rc8vBmcyM2c+mKi1vaqlH/YgiTRsztRVtIa23Rh1uLat8VZrKqUTV1DD/Yyvhb47Eumqiu92uXj9cHxmjfPstELC68vTZF32Zv9sdgLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741223157; c=relaxed/simple;
	bh=iKZaZZ93A8EmJ6E6wiLd3eIK1XonMbv0JikYfwCMXDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AivgQkstQzVK5xxP/Eet3VIktgh2Jy0ey74Svp0y7dVOj7JKl08OY2bDMm8389jEzL4/pO/ML1EbcyRAIGRcXx/UA6XteBdo5QYTxcI7xJ3EIZwN/PviftFnmVFvHurqVuqgv85TuMH8LGqi/3VsAqT3g4nrbABjpFA8Ucj21tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FeGmXz8/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43bdcd0d97dso249015e9.3
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 17:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741223154; x=1741827954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZUbDcyt1+aw6K+SCP95Z+3ScUhwExiAJQZmJDC2tNv0=;
        b=FeGmXz8/UXatXipjY2Uf8S0HWtoTPXHgP9s1mPZMdQcLRaDzOY1Y/Usr/GwFW0Quv+
         7RoacIMDUlhlgogaXx9xhOWRSsTBoXgDXD8mzu8YbztycICfbLNA6HqiUugex6vzJ+KJ
         F2tqnxBv4Ux3lQnPcvFMfondHwWRKbfKrdRK1m9Gdfn7JdwiNhkFClUUFngfzE1+bJrb
         LglPoMgT3KEbvUJ4dt2PFXTOJXb32y3rTKewOlWtT6WYCPVYop1GZZ24WO9IYVv+LA6R
         SizlpWjXXtvKHw6KEaF7pi1CzEreXpIJIsXN6izHjEBZDiYvy2VB3kYLTDHCa9jEsZWS
         CxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741223154; x=1741827954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUbDcyt1+aw6K+SCP95Z+3ScUhwExiAJQZmJDC2tNv0=;
        b=STeu5O844HSsmkOZzbMTVXKddN0dga7Ccoy2r3nMqV4xHUg41UKJw1j1udxXKrMCgv
         d9f6GLbh4Phul3bzEp6vgJZcuU9YvuYsuc2Mf+PoSisgCKJblNe51ATAGmUkaLXr7E68
         Iaq+UhXVXw0d3T+kEmm9GEEdt5b3hQ9vyYEEaJ84wkN/I9wctaH/pqzvBrIg1hb7ZU8U
         3w74QGu81VwZp8qruxUfXOGHFabrSqex2ojgZcmEMmTRpx7FLvLEB/Y01duxsRAs8GcT
         DRACAIHkR8k8VtM4+xipiYurXPj6fZmkaSHSeB8SxP3Id3GGv66PDZoRLxf8xcf4omc/
         cmCA==
X-Forwarded-Encrypted: i=1; AJvYcCU5l9UjXmoKgR1YnBoI7YET0qO0Z0GVBRpb8pJi/Xg8dkkAzFo4h0rSTpw2OfkJFLOKTmxVDhw+iNkHHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzSUoOW+kZa8WI6lC6I8SrwhzkdZbVD/j8Bbaa3f8u35xpxTWM
	gMHzjysv6uMOXa8W73bvzkNQWOmEMCE6TwEGOZ/nlMl4kD/FFVLFBeZe6qtssZ0=
X-Gm-Gg: ASbGncu4dC8IhXJJb0jABwKTPJyHU4x99Jq6SPMUHHgouNntIVkacGirOB31w66e9zn
	cD3DCwivdUo9ePK3PLkL8ZgcK6bJjWgK4vll2Z4hwXgT8Kfdvh1A+tqfkF+kAeP0hp0sNWyEx2O
	yJBSSXBxyPf9mdTPvxJ3dXVUf0kmQ+THhW4CelcE09l3I/eJ+2ULKcb5uoP0XiQA8bKB98J+iha
	WZZRAdYtSQamRv9DBtqBjdnTdglUSxZhO3rLfhgcGY9k5AZDkmpr1b+zg0Mx5SkFXd6lIAw4Lif
	bXFsOCKNnc6s5JOjZ7UwxTCtnFSuHjAvIThrvm0vQnlsvH1wlUW+x2KmReCndjcP9HX2eFsDpur
	oFTzia0ssMg==
X-Google-Smtp-Source: AGHT+IEBE+AjJSFQ5hTzB0AD9wDUmggQ6dY7nBAGbbjumNehivZ0YmNvgBtLxJfeYy/ati/9+ylr/A==
X-Received: by 2002:a05:600c:190a:b0:43b:cbe2:ec0c with SMTP id 5b1f17b1804b1-43bd29c9377mr40663785e9.27.1741223152664;
        Wed, 05 Mar 2025 17:05:52 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfe2bsm206780f8f.24.2025.03.05.17.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 17:05:52 -0800 (PST)
Message-ID: <ac44e16c-36af-471a-b47b-bb26ccd9f018@linaro.org>
Date: Thu, 6 Mar 2025 01:05:50 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/12] media: iris: Add internal buffer calculation
 for HEVC and VP9 decoders
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, quic_vgarodia@quicinc.com,
 quic_abhinavk@quicinc.com, mchehab@kernel.org
Cc: hverkuil@xs4all.nl, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
 <20250305104335.3629945-5-quic_dikshita@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250305104335.3629945-5-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2025 10:43, Dikshita Agarwal wrote:
> Add internal buffer count and size calculations for HEVC and VP9
> decoders.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   .../media/platform/qcom/iris/iris_buffer.c    |   3 +
>   .../platform/qcom/iris/iris_vpu_buffer.c      | 397 +++++++++++++++++-
>   .../platform/qcom/iris/iris_vpu_buffer.h      |  46 +-
>   3 files changed, 432 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index e5c5a564fcb8..8c9d5b7fe75c 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -205,6 +205,9 @@ static u32 iris_bitstream_buffer_size(struct iris_inst *inst)
>   	if (num_mbs > NUM_MBS_4K) {
>   		div_factor = 4;
>   		base_res_mbs = caps->max_mbpf;
> +	} else {
> +		if (inst->codec == V4L2_PIX_FMT_VP9)
> +			div_factor = 1;
>   	}
>   
>   	/*
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index dce25e410d80..13ee93356bcb 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -31,6 +31,42 @@ static u32 hfi_buffer_bin_h264d(u32 frame_width, u32 frame_height, u32 num_vpp_p
>   	return size_h264d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
>   }
>   
> +static u32 size_h265d_hw_bin_buffer(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 product = frame_width * frame_height;
> +	u32 size_yuv, size_bin_hdr, size_bin_res;
> +
> +	size_yuv = (product <= BIN_BUFFER_THRESHOLD) ?
> +		((BIN_BUFFER_THRESHOLD * 3) >> 1) : ((product * 3) >> 1);

When I read this code I have no way of knowing if it makes sense.

#define BIN_BUFFER_THRESHOLD		(1280 * 736)

((BIN_BUFFER_THRESHOLD * 3) >> 1)

How/why is that correct ?

> +	size_bin_hdr = size_yuv * H265_CABAC_HDR_RATIO_HD_TOT;
> +	size_bin_res = size_yuv * H265_CABAC_RES_RATIO_HD_TOT;
> +	size_bin_hdr = ALIGN(size_bin_hdr / num_vpp_pipes, DMA_ALIGNMENT) * num_vpp_pipes;
> +	size_bin_res = ALIGN(size_bin_res / num_vpp_pipes, DMA_ALIGNMENT) * num_vpp_pipes;
> +
> +	return size_bin_hdr + size_bin_res;
> +}
> +
> +static u32 hfi_buffer_bin_vp9d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 _size_yuv = ALIGN(frame_width, 16) * ALIGN(frame_height, 16) * 3 / 2;
> +	u32 _size = ALIGN(((max_t(u32, _size_yuv, ((BIN_BUFFER_THRESHOLD * 3) >> 1)) *
> +			VPX_DECODER_FRAME_BIN_HDR_BUDGET / VPX_DECODER_FRAME_BIN_DENOMINATOR *
> +			VPX_DECODER_FRAME_CONCURENCY_LVL) / num_vpp_pipes), DMA_ALIGNMENT) +
> +			ALIGN(((max_t(u32, _size_yuv, ((BIN_BUFFER_THRESHOLD * 3) >> 1)) *
> +			VPX_DECODER_FRAME_BIN_RES_BUDGET / VPX_DECODER_FRAME_BIN_DENOMINATOR *
> +			VPX_DECODER_FRAME_CONCURENCY_LVL) / num_vpp_pipes), DMA_ALIGNMENT);

The size_yuv I guess just about makes sense but the _size component here 
is pretty hard to say whether or not this adds up.

Could you please add some comments to describe the calculations in these 
complex size/alignment clauses.

---
bod

