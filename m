Return-Path: <linux-media+bounces-31580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3291CAA71C4
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 14:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4B371BC0909
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 12:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC380253B7C;
	Fri,  2 May 2025 12:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VqXgdKSm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEDF248F46
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 12:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188938; cv=none; b=FpJwtk99yDi77FXlsf6/F52+ijr7v7COHz7RJKVGsAHiyaYO5jaFQO+6pe7FqPXKLbIYQtEAlOKhhUVdL0m3ZrEmdq7VwRwlCLh22AFMHM5zJgog1A/i272Ih1PJE43+kx+5vOa+vz6u1Yb0TTXrASyfr/iquHy8PGx7Zutz0wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188938; c=relaxed/simple;
	bh=hezViJURrVOoPpXb8OTUuWkHgUlYO5MOuHtWGN/Nd/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHFNnnaLP3LAdodj10JDPq+oTRO6hH2oPiJt3y1XoQRfZBCkWc1YbH5Efu5FUbiZnbXREfaqm7lLqVrrOG42mIfUQqLOQbGhPuE/A4TP9YLlvj9CTpPTgiBY+7S89ZHFAmTP39zBaFRqOdvGXc/ciyvfuA2g99EPGp13R91tjmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VqXgdKSm; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39149bccb69so1431461f8f.2
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746188935; x=1746793735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JuKJjEeqpYYqUAoutx/iNQxZ8cud4TMO/EdBgGtZGBQ=;
        b=VqXgdKSm/IYlvWiR8iG7ny7q/2EZ2yEKC8oHQzZxn7XHf7I34f60cCCEPooFJdsKUR
         qifW/f1FT6wqHEdfdoEWDW3ghYPe2N+qVouTVnOZT3xlhyXUioi/m/fLcgsYcdcqyOiH
         UjHZ6+b5QyEHUlAktoKIvI7upCwiITZOw1byHtFGhZBgDo5NgDYYRFujguzj58QatDO+
         xyAqakFsHe/tsyo5Mqjbe0pVCjpIdsiFND5DQAIsykrbgRogppOQt7apnGqODlfY/tMV
         33rw2YvYWUEQqHHVroHxnxya5jWkL9XuqLSzkBRHBDT1Jv5mIT2q5KuQ8PIdvYwabe9u
         /cyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188935; x=1746793735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JuKJjEeqpYYqUAoutx/iNQxZ8cud4TMO/EdBgGtZGBQ=;
        b=AquJK8USqbLHsuELLfHZrmAuxnRQaK00StgHrrmpOdi8leCf7sgbWx9zu/8OiYCDsV
         cU0cbjsg26kXU6Nm7a93C+kPugU51H2bdpQw9hmgnllaofIEE0xfgC6aZOMzWud2rIQ3
         Kd2pvrfsl/ThlbX/jz5nSKUieHlR5rNgtvQFB58QWOWkt+vcHqbQt4D2Hq5TmIY6wI4P
         WhuW2OfiW4xNyLfggHF7mrSs2fDMrSur5hkRLVftN24W41TMe2ajHnszw4LI6qJyMi/G
         QmZX0am+bLoQF+gxSXyGXNcxh0oPiZ387ROkyaNIAVMxcCo5qwSnY4C6Hcl/Z1vLAMIx
         3S1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7gczmKXNlt9n2dOsfAnDCLtzIEumR7o7WuINQ0tHNCsIDdrVu58CKulp4OxzOvdaKOaqncfurYGVHpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLi6swlsmasbRXZ2gyb9DSNi70XroSpPeMi9hwUIvLyahkP8CL
	PRq3ymAh1BAMKWa42ezBlDAiS46FajHQtQ5mDwf15KUUsE1WOdB1gt9EcmG1j2c=
X-Gm-Gg: ASbGncshdWiCpqohoT9fGZLYM0mLYwE+NlPLR1vX27iBEDWfkYTiidCGJb8IqkwnHSQ
	Scy0l4AT8HCgE+uguyhR5iIFGcFPKodwgFejRyNZkAJHlpkHMpkgPb+3dimjT0J8eomOzG2gUbg
	oMieCQ+hlOKuBiL2SRBe3P4I3tgpd6iFLAlk4q0f0pZEEC6ruuuCGeuADy9Ium3Yu/I2XUE4XZb
	DsnlIg5GtLB6qegu6j7+kwLy+vcNKG7OdkoqMD58lLVhqpESS+FA0Edlu8X/Gz9HIw9JeKdBt98
	5z23Nx3kK6jBWFNiz6TVsJpAMfqNlKCMOLn+sDldjS14ck4EGNGJXgMluM2o4tONy3CMGJ+OYqk
	+HaiQcDNJvPMZc/Is
X-Google-Smtp-Source: AGHT+IGjhiW8tlzqpxgk5VoUKCEl54e77Nr773Jlan97Ttw4cL9jyMAsrH6+IC+FpMkUAZB5kV3tVg==
X-Received: by 2002:a05:6000:220e:b0:39f:7e99:5e8c with SMTP id ffacd0b85a97d-3a099af1056mr1924634f8f.51.1746188934794;
        Fri, 02 May 2025 05:28:54 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0bc0sm2020496f8f.20.2025.05.02.05.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:28:54 -0700 (PDT)
Message-ID: <54d9f9a3-6567-4d36-a020-78da0f656ed7@linaro.org>
Date: Fri, 2 May 2025 13:28:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/23] media: iris: Fix NULL pointer dereference
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
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com, stable@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-8-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-8-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> A warning reported by smatch indicated a possible null pointer
> dereference where one of the arguments to API
> "iris_hfi_gen2_handle_system_error" could sometimes be null.
> 
> To fix this, add a check to validate that the argument passed is not
> null before accessing its members.
> 
> Cc: stable@vger.kernel.org
> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-media/634cc9b8-f099-4b54-8556-d879fb2b5169@stanley.mountain/
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index d1a2a497a7b2..4488540d1d41 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -265,7 +265,8 @@ static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
>   {
>   	struct iris_inst *instance;
>   
> -	dev_err(core->dev, "received system error of type %#x\n", pkt->type);
> +	if (pkt)
> +		dev_err(core->dev, "received system error of type %#x\n", pkt->type);
>   
>   	core->state = IRIS_CORE_ERROR;
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

