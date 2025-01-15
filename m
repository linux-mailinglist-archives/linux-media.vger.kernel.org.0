Return-Path: <linux-media+bounces-24741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3ECA11664
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 02:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58C327A132E
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 01:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07233597D;
	Wed, 15 Jan 2025 01:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mLMJ1esn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7411CA9C
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 01:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736903698; cv=none; b=IIoW7QUQkHWzEkkr4NaGTg0DQg473L/cXucphS6V8/ivzwL8an27jEEjUQpAB7ToJRhVXPNyladkqtIYJLGhT7O+roB8KxYc1jaeTIo85kaeNfSGlkGI249X4DmLgP5kTr5yIfkflfdlBldg7HCBmmt1gDuESFxr01mGw/UahYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736903698; c=relaxed/simple;
	bh=pawVzXSteU0JT81cpfRQYFedo2huwQ5s2qJvw6LlzPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJLQ/gpawUpU0hTxA4EIL+y8ynqZuo2SCSFuZEFNIHUuEfk9L/wxV98d0d5vx96pmzVrZRKFErFBlP/fnzlUON3/qWuBAv+eoMliEsuAgwg1DvUr8KZnlMTBuXxo7kv3Kdo/HJeuXOCa7y0AwfzW3R6+usI5KJsIpkz6wm9p23o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mLMJ1esn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4363ae65100so64590495e9.0
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 17:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736903693; x=1737508493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DGK/Z4o3tfdpxvgsytLPbKxmGC+gbq1wlB8OOZocybQ=;
        b=mLMJ1esnJUTdbOM9aSz/QFyHESph3pTO29aaaTFoT7p15wDvAMX1iCRjKOjgzmyLkW
         I9x/7Jpk0LZaP7oSD1Z+kV4vlJzvu0kuixNqHXoHLNlabpH7BkrCIgrGblMRe/fWp9ml
         BkJFu9/adr7LOmMP1uLKV8684M5V44xMTWe85yCIOVGG+UJLFZd+6UzvGJK/VSeGY5TA
         zD4IKO/lMdb3nq/42ybM9+AOlRRPHvPN0nFQvFxVGa7+Lo6J+xuoRlg6EFkiFk5fQW+C
         Nm4S9ca9yXvj4XX60wS3/qgZFRjnEbIij/q50qWyYpMugcCxs47QNw0dzv1Gd5pKVxpQ
         p93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736903693; x=1737508493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DGK/Z4o3tfdpxvgsytLPbKxmGC+gbq1wlB8OOZocybQ=;
        b=Cxpp50EZoXiiOAbAf33UvACM1ng9hddXCcZlABqOr7bQJhtFtdyGDuIVXtGWV59Gex
         vg0iUaiCOY5jK/RyCtyy2U7uJS0sT98weyM49K+inrqQMBHW1ufHMJEHnC3HdLWpUJF0
         w+0hyJnVVOfV1f+SRAzgII/94vMnvsscLQjrZJAdig0FttRLKqqOFsH2prztS8Z//z/y
         DFJEG4kXV1ym94SvG5beFVKQfBNcM0WF4f1sDTFgGZhLZ7KnBCLFUJG0HTbVvJz5Dscm
         YZyvOv9ZUmtMG7fUGwtGNGZdrYq4NBc0yb91x+VA/5rBrJWD5gjfPYQW/8FzCe3F7CAx
         puUA==
X-Gm-Message-State: AOJu0YzRrIh8pIhTSQegyK+cYQDcZzeG1WyNL3jxWIS1vqQALdkUmAn/
	ebOj4Pi6s4QwFQECPR4O0bIVGa87aNBpumbcpRrk6qcQgf+3YeK/6cuRxgZ1GL4=
X-Gm-Gg: ASbGncsTaUuPTEm3ItyAlOk9/g2s2T1olqL45NPr2RWVRjBsPG2zigssiYmijq9EqCl
	6PyyL3c/lrINv4HlFNaNyWOpcVZ/bfnea2dmyZBsFi2DC2rs3li/xb0gmC/9JLjd6ILCZ57uNOj
	drQd7eWHj2D8w4+kUk20OP2ZNKok0wbp+R0yHvodtOd1EiQBKm53pZY57NIQhNR5YZ2HP+UtzkE
	f0xcdGFFv+uEP5qlWs+n3rQYI4R6Rcw3TREl2yQYrTlyaHLzKEi6/dC68FYRrzCy3oKzA==
X-Google-Smtp-Source: AGHT+IEXoAV81f+3HP8QyUEzM/OxmpVpuxmUdPW23b5WTL2g0q1041pK3bQ54xZClbSrFQ2h28Su2w==
X-Received: by 2002:a05:6000:470d:b0:382:4ab4:b3e5 with SMTP id ffacd0b85a97d-38a87087028mr26649244f8f.0.1736903693486;
        Tue, 14 Jan 2025 17:14:53 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1e0bsm16001719f8f.100.2025.01.14.17.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 17:14:52 -0800 (PST)
Message-ID: <047abbdb-cbd3-4a33-9e18-d12d906ccaee@linaro.org>
Date: Wed, 15 Jan 2025 01:14:51 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] media: venus: vdec: Clamp parm smaller than 1fps
 and bigger than 240.
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
 <20250111-fix-cocci-v6-2-1aa7842006cc@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250111-fix-cocci-v6-2-1aa7842006cc@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2025 09:55, Ricardo Ribalda wrote:
> The driver uses "whole" fps in all its calculations (e.g. in
> load_per_instance()). Those calculation expect an fps bigger than 1, and
> not big enough to overflow.
> 
> Clamp the value if the user provides a parm that will result in an invalid
> fps.
> 
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
> Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/core.h | 2 ++
>   drivers/media/platform/qcom/venus/vdec.c | 5 ++---
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 44f1c3bc4186..afae2b9fdaf7 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -28,6 +28,8 @@
>   #define VIDC_RESETS_NUM_MAX		2
>   #define VIDC_MAX_HIER_CODING_LAYER 6
>   
> +#define VENUS_MAX_FPS			240
> +
>   extern int venus_fw_debug;
>   
>   struct freq_tbl {
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 98c22b9f9372..c1d5f94e16b4 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -481,11 +481,10 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
>   	do_div(us_per_frame, timeperframe->denominator);
>   
> -	if (!us_per_frame)
> -		return -EINVAL;
> -
> +	us_per_frame = max(USEC_PER_SEC, us_per_frame);
>   	fps = (u64)USEC_PER_SEC;
>   	do_div(fps, us_per_frame);
> +	fps = min(VENUS_MAX_FPS, fps);
>   
>   	inst->fps = fps;
>   	inst->timeperframe = *timeperframe;
> 

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5615-rb5
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

