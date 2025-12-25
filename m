Return-Path: <linux-media+bounces-49529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF393CDD893
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 09:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82885302034E
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 08:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1F22F39B5;
	Thu, 25 Dec 2025 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H3jPgQ7K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A91712D1F1
	for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766652579; cv=none; b=rnwCV9eWUVRUrFK8EDm8OHPcUt/a4+lXyP6DKhGSHbvXA70+r0iUT3bZCi95Kut7j62pylydz4TVtFQZxc7uE441YT8K+oi8PUmayuXiUxPB7YRzBJB9Zq9ykL6uxuyostMWDoZ8ilIpa1xQ/yDe4c9tnAP2r5M5IIOVgNJLfkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766652579; c=relaxed/simple;
	bh=IaUv/bEmXrjpgGeev5PpfBcVPxklP5nZb+aJj6da84s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXZiD6yAO9RKB96NjeilTXzBBfXUyGQ8Dha1LL4bdm1MmKmi6a0+s+/oRv8kQAVrNdDdxxPMRY/54rwwWcwNmXbjRaB1lKUQwHsShruA2s/hPk7kIO5LMQGW1iQ5bxaer7CGCEA0BWffMvOYpFNSwiBkIxHw0+Uk/nhw4B6TgQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H3jPgQ7K; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-430f57cd471so3408767f8f.0
        for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 00:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766652576; x=1767257376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoBDRxVmXrYcyUWaWX2M43BL+d+5SL+xKSZsptXvX8M=;
        b=H3jPgQ7KOgsizim0eNqQY2zrUgWHSpswyD8Wrf5yk/QeqpMpVP6XI+/XZiU+XPUWOL
         XvQ5rqM8hPxbgB6fuHTkGsl4vjMfRJU0NTirnWIXOA2RN8Bcs0d0WopI2StKkPVBqLRb
         PpP2a9QFGLVV3Vxc691HiTe21nKYQUjS1Tz3E5jIa4EOnvZsGDALEG0MfyqgqCeN9csM
         JKBsZjooq60kPU/PJ0TxIFmysUeSi9ILp+dbPT5sYtNf7pZtRZO3F4Tr518iyBi7pI9x
         ZZJQ6tQp2WcF92Lu/Pb8cek79ssuW9wzPhQqn+aPTuDy6mMvYw2X/m+ytH6IBovv8D30
         CgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766652576; x=1767257376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoBDRxVmXrYcyUWaWX2M43BL+d+5SL+xKSZsptXvX8M=;
        b=jJu02XlSGRh8X1dlP49/69iqlOSSeRjRkWRg8eVOnrlJ1iODfRQI5Ji19HzcYmBV4o
         yHRSQMxkreheBPD+R9iPOhRhuYvN73PrCmGFuxHPR6WyN5t1AA8VGh4r3w0xa4JUZMBb
         KbYZoIdEYvW5WWeR84u3g4j2RvR9cAf+9LwlnPZSD3RHHJLRDNFs0qfxwuDPfpiJMaTl
         M3Tlj49/pIuDGesNrBR2Fas8ACV9tqCUI5yMB+FuzKIdFsHWWu2nomtBmhzDICtbfsMJ
         w9r9BJ8PgNtH/iJtunhzBaxKJXhCOe0X/Gk/2Pm7KZbCMGgXrdfyLt6wcWR7sHjaolC0
         TOYA==
X-Gm-Message-State: AOJu0Yx0hOYVjD6fAH2w0QAyf1J+lP4D/OsOv3KRIhavgPrOGiIK36UV
	qbRMvqYEHn00q7+3xOCTGtVanH6wY3kX6NQ9lxvHKXFtDRz+mHmMHdypmt4VGRM3C7GtclLbuf7
	8s97jVMc=
X-Gm-Gg: AY/fxX4zBDH4DJ+lZANMS1LjyTq7FqWrnwyDyxtTI+D2KWW8Vbh1/kebSLL4o7KLBzy
	75Pcb7KDy6iBeYQPYuZLyNG7GhM7RjqokK0Rv4xhlrScIFMeKtpYJzhaMLCRyMByAjTRm30pxtV
	mjM0MKDBcjTCS4kn7djmSurjEIUyhE5iwOGRgF0z+Zyfn66tQLpsNqBJXU2OdCVfRl0fVo8xdO0
	DJ6G7PX3n8T/xf0PC+nQJDoN/8vdYd+D7Vwt7mkrxdsZD/+Gr5lwTxUpGTpmHklHyHEsl+mHfeq
	S9mnKrQeUcZ3KSGurYcj1Xwh+LkCi11VYRB2IjPj0O78L655M6xtC/St5ZJRyqvOVl8UNEvTrWQ
	/ZMCjPS59Xdzg9kiGp2PiuG4yLbG0jqpwxvRp2/dZIqAoH7kALfc+VF13Gj2fp+M+ZgZicDvieV
	OJTz/mBTQ8K0paL2mZTqNi0taMs+CpDLx6ghGqo9D2/LZ7QVU91CKY
X-Google-Smtp-Source: AGHT+IGB03s/TFHHK32TGVs9YpBfcIdvRZx8YFRPv17geyEukeVgPpI7hyWLxapWo3sPx+1F2nXfzQ==
X-Received: by 2002:a05:6000:420c:b0:42f:9e75:8605 with SMTP id ffacd0b85a97d-4324e45d3efmr18403483f8f.0.1766652576404;
        Thu, 25 Dec 2025 00:49:36 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm38939643f8f.5.2025.12.25.00.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Dec 2025 00:49:35 -0800 (PST)
Message-ID: <1b8b0f61-6907-4ae3-ac2b-54a3e25045c7@linaro.org>
Date: Thu, 25 Dec 2025 08:49:34 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: iris: Add buffer to list only after successful
 allocation
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
 <20251224-iris-fixes-v1-1-5f79861700ec@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20251224-iris-fixes-v1-1-5f79861700ec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/12/2025 06:27, Dikshita Agarwal wrote:
> Move `list_add_tail()` to after `dma_alloc_attrs()` succeeds when creating
> internal buffers. Previously, the buffer was enqueued in `buffers->list`
> before the DMA allocation. If the allocation failed, the function returned
> `-ENOMEM` while leaving a partially initialized buffer in the list, which
> could lead to inconsistent state and potential leaks.
> 
> By adding the buffer to the list only after `dma_alloc_attrs()` succeeds,
> we ensure the list contains only valid, fully initialized buffers.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index b89b1ee06cce151e7c04a80956380d154643c116..f1f003a787bf22db6f048c9e682ba8ed2f39bc21 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -351,12 +351,15 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
>   	buffer->index = index;
>   	buffer->buffer_size = buffers->size;
>   	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
> -	list_add_tail(&buffer->list, &buffers->list);
>   
>   	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
>   					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
> -	if (!buffer->kvaddr)
> +	if (!buffer->kvaddr) {
> +		kfree(buffer);
>   		return -ENOMEM;
> +	}
> +
> +	list_add_tail(&buffer->list, &buffers->list);
>   
>   	return 0;
>   }
> 

Missing an appropriate Fixes: tag.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

---
bod

