Return-Path: <linux-media+bounces-20171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D72B9ADF85
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 10:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C4981C21C42
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 08:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1201B218B;
	Thu, 24 Oct 2024 08:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hLnQ+JH9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3651AF0AD
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 08:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729760072; cv=none; b=jA4quMD/MGBktPgv+/xLQtoqWnf4rUo8U9xfWAwMecs4UVFDaRnm+r9uxbWSM6jeoVjg60BImr46XQINCcRAQp8Y4FjoUlYqLnk4D46oIxN48jXZ980X4dw+A/iw1ArhVjhsevHPp6XOaW64Kt2GLD3pi5SdOYtJbcGRw8hzSC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729760072; c=relaxed/simple;
	bh=DJfiaNN0XemKK4RktxCCVMa36EfHMCL8pPutCdn1OTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ugB3eABsHaQczGNyfcGuLubBfD1HF8tXwVZyFQAlF60JbzSVLHADB/Htp2782JGN02ayu7t26KouMSYVVEukYZJrzXVOBHfdLPu07Qf0LqBh4zuZdTWxDK/Q/9sHAVJKrN7+QTZl66AJ6WsLfAQn+cxqyV4/d76DeaMh21gvHJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hLnQ+JH9; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9acafdb745so136197166b.0
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 01:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729760068; x=1730364868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d0qmLDbeSABodAIc8gmIXN4es8vz5n5AiRUE4hqdnTk=;
        b=hLnQ+JH9Q7TSiB0wJNbQIQNHNVk9ZvyNP0RDEDFmS6HRFmlAkBkXpERrsiKOlODyLh
         VR5AwFbVnbd2zPJL0uLLyX7hBOmciWm3eUJ4E6ayZLCXWwEEX12cmqBiOCEndwdZyxer
         o/YUJlSPR3pJTHOgZtCAijv0fqD2cUmrQE2HV1yuuTST/IWFAa4jCOZ4jPx3kjA6zvmk
         eJVhtOuu+FbNgna2SkCOoD68brVBwd1Aof5ZNyeX6aJnWjS4CSNP0sAsuhAjQPEsDMOD
         Y0RiNazxaPjE3DzZCMqyaotQfLYdDf7toyVjCo6NOLAIU8ePQCpalRYcZzCinECNlria
         afXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729760068; x=1730364868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0qmLDbeSABodAIc8gmIXN4es8vz5n5AiRUE4hqdnTk=;
        b=VHBHUjzrWehrmoMMjMM9S28sR2eVdX0d/Leh/HiBeXd1xeYf/KtbvEvVuk4o6V1PI5
         +4nb3X6oJXHVOdx/LbCBPxgUBbVJaAK5iTyDC218b9GHdFuatSNUffKgUrsFDAakNq0A
         wmNbCjLsmpGs9sgsy2QJSgxFxd3nvRqlQ7KqqpuC+6qNpqKXZW/uq4qhTVe2luKjkMjU
         B3BrJFRQkfES1P0aIPLAAWqcVNXtjcTEGJ5ViwamrxJJok0wGhHW7iXCx71X/YrW5/qV
         wnz+aNvzXQ5Gi2De7DqoQl7ZN6VTqcoLI3g9g+JoFYdoGXfGHi48twzqcpzh19lL6sFe
         g3vQ==
X-Gm-Message-State: AOJu0Yyes1ZXuwaWIxbaHjPB/U9Yo3TZmpJFB3KSA9YPF8I5ps7zZBqz
	YnrPqnlRXDx9L2Pt2kL5LVKrZ38sW2w1qXNRc9OO6HV7B9i16SGJMeIWwcYvE3s=
X-Google-Smtp-Source: AGHT+IEtkv88aszDqGLRcL7SdViTGUOQM4RoLn3yhnz+YHcVFpufFnKSLz6jGrfZU7O0d1cTY3WVmQ==
X-Received: by 2002:a17:906:c104:b0:a9a:4b51:9e7 with SMTP id a640c23a62f3a-a9ad19c4e2dmr139529266b.16.1729760068494;
        Thu, 24 Oct 2024 01:54:28 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91571e3asm589303966b.147.2024.10.24.01.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 01:54:28 -0700 (PDT)
Message-ID: <ae479f58-5474-401b-adf3-3937c91cae1a@linaro.org>
Date: Thu, 24 Oct 2024 09:54:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 1/2] media: venus: fix enc/dec destruction order
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@google.com>
References: <20241024061809.400260-1-senozhatsky@chromium.org>
 <20241024061809.400260-2-senozhatsky@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241024061809.400260-2-senozhatsky@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2024 07:16, Sergey Senozhatsky wrote:
> We destroy mutex-es too early as they are still taken in
> v4l2_fh_exit()->v4l2_event_unsubscribe()->v4l2_ctrl_find().
> 
> We should destroy mutex-es right before kfree().  Also
> do not vdec_ctrl_deinit() before v4l2_fh_exit().
> 
> Suggested-by: Tomasz Figa <tfiga@google.com>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 7 ++++---
>   drivers/media/platform/qcom/venus/venc.c | 6 +++---
>   2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 6252a6b3d4ba..0013c4704f03 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1752,13 +1752,14 @@ static int vdec_close(struct file *file)
>   	cancel_work_sync(&inst->delayed_process_work);
>   	v4l2_m2m_ctx_release(inst->m2m_ctx);
>   	v4l2_m2m_release(inst->m2m_dev);
> -	vdec_ctrl_deinit(inst);
>   	ida_destroy(&inst->dpb_ids);
>   	hfi_session_destroy(inst);
> -	mutex_destroy(&inst->lock);
> -	mutex_destroy(&inst->ctx_q_lock);
>   	v4l2_fh_del(&inst->fh);
>   	v4l2_fh_exit(&inst->fh);
> +	vdec_ctrl_deinit(inst);
> +
> +	mutex_destroy(&inst->lock);
> +	mutex_destroy(&inst->ctx_q_lock);
>   
>   	vdec_pm_put(inst, false);
>   
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 322a7737e2c7..6a26a6592424 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1519,14 +1519,14 @@ static int venc_close(struct file *file)
>   
>   	v4l2_m2m_ctx_release(inst->m2m_ctx);
>   	v4l2_m2m_release(inst->m2m_dev);
> -	venc_ctrl_deinit(inst);
>   	hfi_session_destroy(inst);
> -	mutex_destroy(&inst->lock);
> -	mutex_destroy(&inst->ctx_q_lock);
>   	v4l2_fh_del(&inst->fh);
>   	v4l2_fh_exit(&inst->fh);
> +	venc_ctrl_deinit(inst);
>   
>   	inst->enc_state = VENUS_ENC_STATE_DEINIT;
> +	mutex_destroy(&inst->lock);
> +	mutex_destroy(&inst->ctx_q_lock);
>   
>   	venc_pm_put(inst, false);
>   

Lgtm

Requires a Fixes: tag though

i.e.

Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")

Once added

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

