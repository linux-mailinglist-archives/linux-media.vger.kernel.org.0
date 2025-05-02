Return-Path: <linux-media+bounces-31584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D09AA7295
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 14:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7AD03A78A1
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 12:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC27254B14;
	Fri,  2 May 2025 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHKi5deO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7408236445
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 12:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746190256; cv=none; b=Eavb4AwLzmQGCa9FIRly55hYLwxJq721JVrlz04GJk4LLbBXIlGiUvxDuVAasRkBn9Md84A8rosXR8w/qJc1xLlS6ttV8ZStPTpvgQdudbd+tYRY5efsgjj/dhDm73WAyg5b95XMljG3/1JMkV1j3BUrAcO/+L8+4F8g7pyppdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746190256; c=relaxed/simple;
	bh=I6QAVRToiFrvXi4WBLFZ0QTX2zbLl6IKDM8t8exjEX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLmBJl0N/VprT3vjXKhJlWWcOp2ESf85Ihvm30SLhYOPSeFpk2HlnYCGN1loezfEmOdDGNtXhd9zNaQhslFIA8VsIxByoQcqebNq6g/sWa7p5jPPVnuJj2040adFDXAYIhvtuWTq8+2bItrNP6+dHVd46zm/OGfZ3IF2FB+2iA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cHKi5deO; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1395167f8f.1
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 05:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746190252; x=1746795052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OVMDO5iVYdVsAgbbPuYJnfbdpZGyS2sQg1xq2ZTg1LA=;
        b=cHKi5deOJ293bf3CRIphFNNfccXuVpGeTQkweNbYsuGDGPRmyAAqXcSf5TKyhYbBxM
         B6uqGFVseCZrUIpOcXA6AV5eqC/TPGFipFGqvTsnIhQLbiOdj7CBFbETeiQQ2mSLXotS
         M+46dYNWyhaOiiV9Htsi/iJNJWUVK4XLrHuEr9mUrslroilTvHcIe5Rmd/SARHlCKZQg
         T7AvoB5qPsb3scm1XUwFntqLFeBFknb2WhhfhT9liYd9nrknsSIPF6NcxWgOOFwrrifk
         eI2M5D4cP40H9elbFCMdMXJ3J1cp3WMdeEljoW5SX20hKkz6EOafP8sbBiDw8m/04POJ
         Ukxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746190252; x=1746795052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OVMDO5iVYdVsAgbbPuYJnfbdpZGyS2sQg1xq2ZTg1LA=;
        b=pXuMaT65Y0czvW8uqBrS6lLecZ5mLRWioJwa7YY9y6AAZF8HiS1420VNZGON+7cbkM
         0B8BD4WAgf9RU6HH1lyEf9wr1rszC6vPDyPwqCgelt0X1n/98HkMjZrN+D4ZR9G6f2nU
         qs4ez5QXxMciR1winaCfYrq/HFrS1TQRd1brJuXS4ubJX9e3qwJq8130Qnx5GuylezN6
         MkeZwFFkFk7int9RWq/QblFgHx3RrbrvpyaqIwxC5jWnXBsxqbsRj+Uaw9L9IhWNVncB
         t3T9o5VtEeoxsxc9qSDKR2kYRZLulmhNeJCm6M6ye0K6dw2HY2s1Y5mEPHRviCvkkY8x
         4Xzg==
X-Forwarded-Encrypted: i=1; AJvYcCUucubL2sev4K7aEjaf+cLR8UfacCGI5CQDlymPj1hTdHHwdejK6myvjVIHRtw3tqw5/5teIZKOEYZKOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXHgHhbr2/ahDnBK2UeebBEFusg6MUHyaJ2K//afvI+kGxfGCr
	hNo90QzhxqHps/dq7wmOx4xwR6Y9TuMogcc9bMVhiA8cachkstn68nnbAn+PymQ=
X-Gm-Gg: ASbGnctR0YirN5p7tIGIh07OsvJxHzO06M2Yb9fWfAhYJKmGMsbxRXMgy8S8E0wqgVb
	R6HRHmKSTqJr2uvgsNbvJbhiQVb7mhS0abQGhOTnxvVWow0rEu16olCq/hmj0Y/A/STMOlEE3UG
	UZGTp0t3yAV0em6GXmyt6567puZcVwGkpxQO7C/GUcY/sbrK3k9KGx4VGyZINv1QOH5lQgFRmLm
	7vXPbRGyoBa/91bZYoWg8nfUKdXiEPfx13Pj+xu7nAYWVNWUuxz3O3sX4XUEFq9iYDZ3uG1gRio
	qBMHw9oysMsafNUORkGCrq6FcnM2YzFe8EDLk3/Kx6bfnvO8hQrVYRgf+xpwLIyoiKz+SrrCRZA
	n0FCMMNCDV7ytH8Bx
X-Google-Smtp-Source: AGHT+IEpWxj8o8pcRmbEsdS/lBTeH4fuOpeC4FeLOdr9sgL5/27OXW/XpA743y7zHGnyxTK8bCoWtA==
X-Received: by 2002:a05:6000:186b:b0:3a0:90bf:b9b with SMTP id ffacd0b85a97d-3a099ad40dcmr1861666f8f.8.1746190252191;
        Fri, 02 May 2025 05:50:52 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2aecb54sm88637035e9.10.2025.05.02.05.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:50:51 -0700 (PDT)
Message-ID: <6bd73ae8-28eb-42da-b916-fadc114e2fd4@linaro.org>
Date: Fri, 2 May 2025 13:50:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/23] media: iris: Add handling for no show frames
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-14-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-14-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> Firmware sends the picture type as NO_SHOW for frames which are not
> supposed to be displayed, add handling for the same in driver to drop
> them.
> 
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h  | 1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 4 +++-
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 806f8bb7f505..666061a612c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -113,6 +113,7 @@ enum hfi_picture_type {
>   	HFI_PICTURE_I				= 0x00000008,
>   	HFI_PICTURE_CRA				= 0x00000010,
>   	HFI_PICTURE_BLA				= 0x00000020,
> +	HFI_PICTURE_NOSHOW			= 0x00000040,
>   };
>   
>   enum hfi_buffer_type {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 3bb326843a7b..2267e220c9ea 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -91,7 +91,9 @@ static int iris_hfi_gen2_get_driver_buffer_flags(struct iris_inst *inst, u32 hfi
>   	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>   	u32 driver_flags = 0;
>   
> -	if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
> +	if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_NOSHOW)
> +		driver_flags |= V4L2_BUF_FLAG_ERROR;
> +	else if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
>   		driver_flags |= V4L2_BUF_FLAG_KEYFRAME;
>   	else if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_P)
>   		driver_flags |= V4L2_BUF_FLAG_PFRAME;
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

