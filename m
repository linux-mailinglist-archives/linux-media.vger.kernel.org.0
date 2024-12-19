Return-Path: <linux-media+bounces-23797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F769F7CC2
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 15:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37B6418840D1
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 14:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC0F2253E0;
	Thu, 19 Dec 2024 14:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L57pPNhy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028BA2248AC
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734616993; cv=none; b=UE6KsRppK2VofdQL7+yI8DMZ1sNMd8856joDJqAEq+3lKbxTthqv30s5xFCeexPX0D46ncA4jM/jhxryAKH38n1bH5EUNuvlJW/In66Kn6Bp9XWcAwqWPqUvSsrnmkXru0b3E2s+9WPlOruBqUeKy9MCK4AP8g6hbgBLVsevm0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734616993; c=relaxed/simple;
	bh=yiGRUJwjsQCL3G6F2nEr7hcrvA4M3eBm6meSLftaLs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tHyD9U4vPZa9/FAVURtvvlMHqnb5y4ZN3IOkXScIp66GSCliFj+O2Rgu99kwpoxgieY6Q5e3Pn/KqoI2kgr1pT3+zcHqOXPhF1ntoRlDgjPc2ZjIcgYotCVN6AsK68qYYVyuCS96JLNe3jsry1lkvJV1Bnm3fxDNoaA+2aPHtQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L57pPNhy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361f664af5so9293015e9.1
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 06:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734616990; x=1735221790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXZUFqb9xwB8UfFG6y2CJGv6YTLp395j5ATjgKVbSgA=;
        b=L57pPNhyTkysZvRLILU1WXE8fDXilFGR3UJ32EqwLDqqQkrTnS3nw9E1WZI+JAn/tU
         +508f4KzxmjcFZWRWJFRb5xtRemjIzryZtAQQeirRYQ6mR998nFm4aklnNWg66PUmP4V
         /0WvROL/pNBSDZCxHr6lPMoUOfc8/68ZcIZwv841RA1ioPOzJS0Q6oMKfoJBn9OXD7dj
         70v3zNxO/qvdvlxafD3s/g7hdI7GaCepDj6pMulAMrrMuqD5erKUQJzFJp5/ICIEZheU
         9ri96ADGXrefzLaZfQIWxOtkAiPVMvpXkYJrAsC/yqoVOhe8b7pxO3ECXwaFb0kaynT7
         JPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734616990; x=1735221790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WXZUFqb9xwB8UfFG6y2CJGv6YTLp395j5ATjgKVbSgA=;
        b=Id96MZ4Zs4y2HyuPYFTJMjThhjYxxVt687YzA2YFBZebv2B47W2hrhy8L8nsMUKJe2
         gYI0DxKSETXjfRBwPerYyJIxT4KOk91EhCT/+v4OPuJcljLFP8g5/k6zPM7cjB3RDkvo
         U9v+32N94ah0q+3VEAXNWIIHlqfO9tTQwhQmUvH9yqhrpDWvXnGVY1cdCfXJ1KGbN24+
         lWoPsmIAw5Dvr6y0SBriHyAm9WbE3tdlZPlD9Kl3XzXZ71BVyIu93+9R87KbSIzOobTl
         p4Z6LcymI2KHG/ZygCHRRIHn5l5hzK8gxK7Qm4mYzHkk2BpUjZ+KmTjzZOVxVkv94VIO
         VISg==
X-Forwarded-Encrypted: i=1; AJvYcCVI5Q4bpFbXNENzuWO/Qzb8/eQLPsha9QUwMOg7HMgYFDK27GspL5LeTmXYukHb7/hZ4yEZ7yKqRM2D2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVXyNL/YGem3+A5CVc9tUT697nqkCy9lj7NHKeO7fJuZpSKeXo
	KzEcopWOPAg8RaAW+GlZU6RRyTk/tdfjdt6v0VrfkT5mpa0lhj5lKdW6WitU4Q0=
X-Gm-Gg: ASbGncsHzCn8bBdJm+hVrAyszElzN5A+g+8B8WkmusLqBWbtTm0NmLUAOqUj0nc3TiG
	iK0gRAcBqo5+lb9wUg3MwxczX3D9Pih5LsgC7LTmRH4HVjYdzTbtlLMngKV6qZb2NgyKHN6zIPh
	dbKFc4D8JzS6FNfd0EokdDesxfBKd24BwWZ54wjtFwWVjnkKeNZ4tpVI7WppA6tLPsjqT3VnFZt
	Mol7G4MpQeBxf9FfMJbH0PNfRDx9Dv3ppQ3X3WhVdD0M85YDyPAdPSgACAgjK4DB7BiRQ==
X-Google-Smtp-Source: AGHT+IGyI95U2ui92gYhnr7jJ7oUrNU3MvE2Krm7vhzjpIBY07DCVjBZHmYYbmYJ3aag0N+d2GREMg==
X-Received: by 2002:a05:600c:1c16:b0:434:ff25:19a0 with SMTP id 5b1f17b1804b1-436553ea696mr62377185e9.21.1734616990116;
        Thu, 19 Dec 2024 06:03:10 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b2a4sm52532425e9.27.2024.12.19.06.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 06:03:09 -0800 (PST)
Message-ID: <1153ebfe-eb98-4b8c-8fd4-914e7a3e063b@linaro.org>
Date: Thu, 19 Dec 2024 14:03:08 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] media: venc: destroy hfi session after m2m_ctx release
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241219033345.559196-1-senozhatsky@chromium.org>
 <20241219053734.588145-1-senozhatsky@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241219053734.588145-1-senozhatsky@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/12/2024 05:37, Sergey Senozhatsky wrote:
> This partially reverts commit that made hfi_session_destroy()
> the first step of vdec/venc close().  The reason being is a
> regression report when, supposedly, encode/decoder is closed
> with still active streaming (no ->stop_streaming() call before
> close()) and pending pkts, so isr_thread cannot find instance
> and fails to process those pending pkts.  This was the idea
> behind the original patch - make it impossible to use instance
> under destruction, because this is racy, but apparently there
> are uses cases that depend on that unsafe pattern.  Return to
> the old (unsafe) behaviour for the time being (until a better
> fix is found).
> 
> Fixes: 45b1a1b348ec ("media: venus: sync with threaded IRQ during inst destruction")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/core.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 2d27c5167246..807487a1f536 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -506,18 +506,14 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
>   void venus_close_common(struct venus_inst *inst)
>   {
>   	/*
> -	 * First, remove the inst from the ->instances list, so that
> -	 * to_instance() will return NULL.
> -	 */
> -	hfi_session_destroy(inst);
> -	/*
> -	 * Second, make sure we don't have IRQ/IRQ-thread currently running
> +	 * Make sure we don't have IRQ/IRQ-thread currently running
>   	 * or pending execution, which would race with the inst destruction.
>   	 */
>   	synchronize_irq(inst->core->irq);
>   
>   	v4l2_m2m_ctx_release(inst->m2m_ctx);
>   	v4l2_m2m_release(inst->m2m_dev);
> +	hfi_session_destroy(inst);
>   	v4l2_fh_del(&inst->fh);
>   	v4l2_fh_exit(&inst->fh);
>   	v4l2_ctrl_handler_free(&inst->ctrl_handler);

Two questions:

1: Will this revert re-instantiate the original bug @

commit 45b1a1b348ec178a599323f1ce7d7932aea8c6d4
Author: Sergey Senozhatsky <senozhatsky@chromium.org>
Date:   Sat Oct 26 01:56:42 2024 +0900

     media: venus: sync with threaded IRQ during inst destruction


2: Why not balanced out the ordering of calls by moving
    hfi_session_create() in vdec_open_common() ? to match
    the ordering in venus_close_common();

---
bod

