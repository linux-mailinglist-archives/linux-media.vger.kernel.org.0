Return-Path: <linux-media+bounces-49695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD033CE95DB
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 11:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A66753024D78
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED37F30CD89;
	Tue, 30 Dec 2025 10:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A8ysGjiS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B14A286D55
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767090311; cv=none; b=C9svHqflW++9H2dhysNeYfHg6BWkWFDxKWgprwbIwRfh/5CHGUWgH7c8R4FLihxekVWO8yYNqg6WM2MPhu3h7rMI14DMSgHUhECBP1Xizz4rVrlu7ThtZ6HZ3CBC9u59vnFV5IZ/WckJw67FDg/zJnlWm/LdD/Kgvp4AB3YS9Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767090311; c=relaxed/simple;
	bh=3bq4wS41sElH6HN97Xk+wCPENH1Pwd1DGUbqR7V7hEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X6LRZAIefNVZGjbp6YaM9Nglk9Rt7+h2/QJdwCSjlGMyQgOMZl46CfTJi2qLk10ooO7myQ67Ft6RkXApfAyPtF7BRIe5vZOoFP8pQjbLy1B9ogeUIWC5rtmwEYlRtLQUn+4e/4aoG+R13IzZGtYUUbYmpvCgbvoWiIiaebo+7vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A8ysGjiS; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b76b5afdf04so1470637366b.1
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 02:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767090306; x=1767695106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A84L5izMWerjv3l5VUK/ThKlyQecyYUlcn2gwusIU18=;
        b=A8ysGjiSqf9QeKSn9jN+oHfmfPLwKMWjxRKFA7KgRhQFkBNY2AF+yXGPddzessPIW+
         8cS3o4T7N95Ko9fQ0LG7JawoP1HqzS+5GISMpSrei/VOiO2pC7pVj7n51L2zytCQ1T6y
         u33n6i1D8Yp3lhqEXddFDD226QsG1yOmRgxeBjDa2eYsccYWwgI0PF53ORjT+k5bujr2
         a4o+DLwdLNL/U4i1SIQQv2uKKKfZIR/kFjnwPzr3ksYpD5ZSriSxEr83NPGn+a2lYGvn
         okD4zuOVnfBC/MR8HrIDxxE4C56mWu+ua/A78TD/t6/FM4fkoQhUE6l9t8n52AhGmxPo
         WYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767090306; x=1767695106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A84L5izMWerjv3l5VUK/ThKlyQecyYUlcn2gwusIU18=;
        b=PUFz+RDSEDCBPX6pWwUoUiW/Oui62PhDs7jpWfHqNozZqqy9yS12QFPCheaSLcN8a0
         sRfPKOHxnjswk2qi9OpRDxwXei0lZWS0l5//d1lj7evTcyH1JY9KHpagmh4DLoY40G14
         8yO0uWtFhslxRqMcrAO8rsSvdmvRmOx5IbpZUJKOOaFZen6oiFss9VdtFaJB+i7QZFzT
         0sRTNJDbIZ6TmmqEqgAVCIhf5uQoq0TkANz4LkOQBAMlOM3rEBcvHI9K43YwdcD8cJQo
         /TQ1Nx2VNbimAx1pplLKN1FgLgXcnd19WxKSjx3u6McuI/DtgvBp9fY0kGEkvOBexlPT
         UOWw==
X-Gm-Message-State: AOJu0Yym6I7GYO4zc8hO1xCuDbyf0LD9tBKmEOIN65HLaKfpBXMB9aA/
	lAS947c9w9hil09e1bvYRU1hW5tghAnQBkUJKt8OMEx+Sey89kwINg088eFTNqHojzI=
X-Gm-Gg: AY/fxX6cNBZHT6c9Deb9bMnWomAr6ntXIIQEjdCJCxZJ4wL3MjVw8NHVKsbdwZw6Ncn
	HEl/zt8lCCRG8c3VBuefEeBtbYKZUZmA3a1QAmk9nsln07HSAcjrouhpMzuCOq39kL4f2Z/+FXK
	dROrmrPd42AhtQNUvwe6IarOcZX2PT1X78U46Q1B1mGkBK/DNzyRjjlGKdurmGjTmFh9QRH7sIm
	TtnIGd8oKk+4IZe4rv6pIMpIOUpJ1dRVM/eg9jJ2xsMCRuv/Nc1aKfnfNbgUEL+zuxmTKbJPyKq
	QXphmqeeD8hHd3H8CNrAqSzX6VeRVisZkU6mU4TXBFJlPkOVLZMT36z5O6YF1HWfaRiq1BDefJc
	j0NT9ORkjW3XwS+XcZiHIpKjH+ZANRHIqiyRNGzsEm5z44rBY46O6E0czWzFMoNILiQhlinoGby
	u0mda63FvxzQnqje0ljHYe+vY1GFP6lehGVypjSg1+6R3tOAjuJhY8G7ukLmDnkkempsB5MenzL
	EIfaANBI6LiBhLAkt3MeD5p9QEfnQprJfjCAUNHyEyMxxa0byryOrISxGDnDlbmfv2yjJLvtJAL
	+g==
X-Google-Smtp-Source: AGHT+IHtjFq36fKb/W+hEgTGU8xzmwqZqlmZ4nekHBAp9M3fENMh3Rta2nGIQX3/7oQIixs7qoB9SA==
X-Received: by 2002:a17:907:6d12:b0:b74:9833:306c with SMTP id a640c23a62f3a-b803719a492mr3238157166b.47.1767090305697;
        Tue, 30 Dec 2025 02:25:05 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad806asm3660996166b.23.2025.12.30.02.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 02:25:05 -0800 (PST)
Message-ID: <859778df-4f46-4a32-93ff-dcdae7dacb0f@linaro.org>
Date: Tue, 30 Dec 2025 10:25:04 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] Revert "media: iris: Add sanity check for stop
 streaming"
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <20251229-iris-fixes-v2-4-6dce2063d782@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20251229-iris-fixes-v2-4-6dce2063d782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/12/2025 06:31, Dikshita Agarwal wrote:
> Revert the check that skipped stop_streaming when the instance was in
> IRIS_INST_ERROR, as it caused multiple regressions:
> 
> 1. Buffers were not returned to vb2 when the instance was already in
>     error state, triggering warnings in the vb2 core because buffer
>     completion was skipped.
> 
> 2. If a session failed early (e.g. unsupported configuration), the
>     instance transitioned to IRIS_INST_ERROR. When userspace attempted
>     to stop streaming for cleanup, stop_streaming was skipped due to the
>     added check, preventing proper teardown and leaving the firmware
>     in an inconsistent state.
> 
> Fixes: ad699fa78b59 ("media: iris: Add sanity check for stop streaming")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vb2.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index db8768d8a8f61c9ceb04e423d0a769d35114e20e..139b821f7952feb33b21a7045aef9e8a4782aa3c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>   		return;
>   
>   	mutex_lock(&inst->lock);
> -	if (inst->state == IRIS_INST_ERROR)
> -		goto exit;
>   
>   	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>   	    !V4L2_TYPE_IS_CAPTURE(q->type))
> @@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>   		goto exit;
>   
>   exit:
> -	if (ret) {
> -		iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
> +	iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
> +	if (ret)
>   		iris_inst_change_state(inst, IRIS_INST_ERROR);
> -	}
> +
>   	mutex_unlock(&inst->lock);
>   }
>   
> 

This revert looks strange, should be something like:

commit 9b6b11d31918722b4522b8982141d7b9646c0e48 (HEAD -> next-6.19-camss-v2)
Author: Bryan O'Donoghue <bod@kernel.org>
Date:   Tue Dec 30 10:20:01 2025 +0000

     Revert "media: iris: Add sanity check for stop streaming"

     This reverts commit ad699fa78b59241c9d71a8cafb51525f3dab04d4.

     Everything is broken I give up.

     Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c 
b/drivers/media/platform/qcom/iris/iris_vb2.c
index db8768d8a8f61..139b821f7952f 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
                 return;

         mutex_lock(&inst->lock);
-       if (inst->state == IRIS_INST_ERROR)
-               goto exit;

         if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
             !V4L2_TYPE_IS_CAPTURE(q->type))
@@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
                 goto exit;

  exit:
-       if (ret) {
-               iris_helper_buffers_done(inst, q->type, 
VB2_BUF_STATE_ERROR);
+       iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
+       if (ret)
                 iris_inst_change_state(inst, IRIS_INST_ERROR);
-       }
+
         mutex_unlock(&inst->lock);
  }

Just `git revert ad699fa78b59241c9d71a8cafb51525f3dab04d4` and add your 
commit log ?!

---
bod

