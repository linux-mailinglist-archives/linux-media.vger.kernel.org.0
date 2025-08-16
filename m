Return-Path: <linux-media+bounces-40009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A5EB28CC4
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 12:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B86C7B8C80
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 10:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85DF131771E;
	Sat, 16 Aug 2025 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ggbz/Z/p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2E8290BD5
	for <linux-media@vger.kernel.org>; Sat, 16 Aug 2025 10:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755339329; cv=none; b=WZDOkaHepyahpJ3pnafqHRRCsawIBp6P7JXHICGEnNDjCq1Jal2AUF5lnM9jvcytYjEaUXt9KArD1H/DilpqPp3j8pZXnyfH2i1krVSzqayMEPB00up3xJ4i9hOZ5h6On+2vue1ZeHh9McSwwjKriqndTA/aBidTQaX2+8wYdTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755339329; c=relaxed/simple;
	bh=Nh3NrLx9OEag4aosCiVt6RzyBczUYLkKTLWOeNhbtQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nyrqfP2tCMonMt5Idy3ssWWMNGaPPFD9is2VUpJquHsLZVBn9ai1uLPcc+dfNWU4RDIjewT6qjjO76M9/4FSXjfWnrLi5QQaLVVmObvvHU3n8+hXF5jfJoRcD5UbRwurvTrxEWPP8QLBtR0rPUG85Kohp4dRit91FxAwSueJXmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ggbz/Z/p; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9dc5c6521so1777009f8f.1
        for <linux-media@vger.kernel.org>; Sat, 16 Aug 2025 03:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755339326; x=1755944126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lGt82GlIKWDzCqErqhiqhcXLyT50Jvw2mM2mW/AA2Dw=;
        b=Ggbz/Z/p/nBIjYYEAMC69itrPy04Uw77np836rOtmdq5YPDh2v2TYrKzt4qDWtUKc3
         wmn7bKpE7wtqOTqeEAflMooNtM0YuLU0hLvUrvinalQ6JI0i7/FJ77FZJvlSms5Wh6yx
         YLImcbfxnNQr6hC8A5ZzsdhwG8ETaKZi/haREoE8AOGQ/fGTWKZN9Mdk0jc6Q0lhz73u
         MlsEF31lKZh6RETIshtWuYm3q+CHmrOnmgWysSteRaIATyZMn2f5tyzFWx/Kt2FDVkvw
         JxPDMKNoZ/MvhgBjjUl2ZpWRiM7OqSuYcLeYLkbz8cYxv/hISLVI7DG3NP2kkXs5h14b
         mOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755339326; x=1755944126;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lGt82GlIKWDzCqErqhiqhcXLyT50Jvw2mM2mW/AA2Dw=;
        b=YzS8V4nDh1qKWcFJJCzcHtuZNidGcECHdWkSS6qCiWaldzr5dOBnUxXCrwJgtPULtB
         dcrQKyJX28bqJ+sxnTL+iLpKFdDJmegXy7CD27+j05/tu3QgbVjRcrTJsywagz9o9M/1
         ueFJN4y3gEJvNFNfPNaGChsA53IWVZBZGXrDKw2OyFHz0/X/tcJaz6Mm4eK8GGf8ORh/
         +rxJ7m+mgdFutXMnaABWdZaMfG8SqLgPR1ok8Pak0h+4+wZ0Fe4hs2RrldREgKq07i1J
         66r9ZNqZmYZY5602ga8J+UzAeJDlyL+Zo6J3jOCH5agjhrcP4T9if4kNl6pljgaxT9OX
         +KgQ==
X-Gm-Message-State: AOJu0YzV4vTtEd446+C6GbiELXOIVslV4AKYZJhh36V1rH1dFUlfh/sk
	HKh5b8IaKBagSI4YLqCiIpFyKTDEvimDtH/CW2AsxPOfJBMFmcSSKp57XyCB5KrMNSc=
X-Gm-Gg: ASbGnctj2cH/EcbUOx4Wtl2cOwaB4s6WCAGkqesggQezYIqpghT1vLOqA9u7AyWq9cu
	U5epBzclMJ+k72sj0KRLU7dEs9hr2j/JbNZkxQbn7EHRu+dcBpnIsQo9FSdmxh6EnSPiJGp8ntw
	rC/3JRmbGZKpvpInVUwuCpJrJaP6W363ln0pyHh/+0bznvLZdWhVW1aFKfp3LsdJYilecA0udO/
	Z8L/khUXHkzpOhBL17VnQ98Y5q9C4T1pUBPVBjtMdTgJCQQpnTjiS+k3Gqp/D2CXGB1GgIlxPOa
	nGNWBev7QRn+eFlFQ0KQqa/48sonhQiWD+pmSYw7mEdWeaHWVMesylpKPQjlb8xiitOGc/K8oxU
	ROi4NXfxisYkT1uCRp1rpI2XVGen74yxhnoHrqadJ7V4mKvbZso3Y87z+LXJ8VftG
X-Google-Smtp-Source: AGHT+IGmLANuUFgyoBXIF4SnP+CvmH/WZED91QLhAbarFtBDm+auOklS8ukCHnJhlG0Pcv8G6VzDtQ==
X-Received: by 2002:a05:6000:420a:b0:3b7:886b:fb76 with SMTP id ffacd0b85a97d-3bb6636cb0emr4085932f8f.12.1755339326328;
        Sat, 16 Aug 2025 03:15:26 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a22319780sm50655435e9.7.2025.08.16.03.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 03:15:25 -0700 (PDT)
Message-ID: <956110cf-d309-430c-b30f-a9c442e015cf@linaro.org>
Date: Sat, 16 Aug 2025 11:15:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/24] media: iris: Fix memory leak by freeing
 untracked persist buffer
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-3-c725ff673078@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813-iris-video-encoder-v2-3-c725ff673078@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 10:37, Dikshita Agarwal wrote:
> One internal buffer which is allocated only once per session was not
> being freed during session close because it was not being tracked as
> part of internal buffer list which resulted in a memory leak.
> 
> Add the necessary logic to explicitly free the untracked internal buffer
> during session close to ensure all allocated memory is released
> properly.
> 
> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 6425e4919e3b0b849ba801ca9e01921c114144cd..9f664c241149362d44d3a8fa65e2266f9c2e80e0 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -413,6 +413,16 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
>   		}
>   	}
>   
> +	if (force) {
> +		buffers = &inst->buffers[BUF_PERSIST];
> +
> +		list_for_each_entry_safe(buf, next, &buffers->list, list) {
> +			ret = iris_destroy_internal_buffer(inst, buf);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
>   	return 0;
>   }
>   
> 

Why is the logic here not to simply release every index of the enum 
iris_buffer_type ?

If I'm reading the code right here, len indicates the list of linked 
lists to free, adding BUF_PERSIST appends to the list that may be freed 
if force is true but, then what about the remaining entries BUF_SCRATCH_1 ?

Is it valid to leave this routine with force = true but BUF_SCRATCH_1 
not specifically indexed, if so why ?

---
bod

