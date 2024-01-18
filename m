Return-Path: <linux-media+bounces-3881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1014831AAB
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 14:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26A3AB21E11
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 13:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B655625603;
	Thu, 18 Jan 2024 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B+Ix+HCw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2C52554A
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705584862; cv=none; b=AlXtqK4bUhNDo6eB7leXcO8VyX+/MCzsffED9S1EoQuOsfyqsNlCQyx42SLFF8vJDKWlKGMlm0fiSAZbWcQOvWJQln4SCIs136IZO139qq88x+WaCrw8Ee0ZvzDSAe5FuarGsYUsrBwrykvyRoCPxpDLc+D0RY5+u45MH3itf7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705584862; c=relaxed/simple;
	bh=cvBbavxq/YxOjTZc3o8gTyrEuL5y+Usgr/yLRKRZpFI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=kQVtn+iRyMj17rKM8yehDQmPuGehjdKCIJNR0owlHaFuppvjA93ysUH1cBu5akfrwgBKy8XZa5LzF8GmLs+U5zREqR4yT2UNe9shtBu+yLwaK3KmG8Wn5NNcjsTTnsNQ48s6Lgts+Zjf8DL170oS/QuBjwz8nQAcupF2t9aFaW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B+Ix+HCw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e8ddebc71so10096795e9.2
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 05:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705584859; x=1706189659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YHeLV0TQs3MeVFgQiX7V8lAzpJlQDaK5HPvbw2WeUM=;
        b=B+Ix+HCwDjC2JTCpcF/fKiYxYP8ABgwEwt6PPwomv8UGsiJjAGexglVJ5isGo9PAVN
         uuvqWjDfZ+3B9TcxERoMQttD4DxhiTHu2vGrJR+gR+qCFfgIvEb8hxIie+VJPDfFn/Lq
         bPXtS0nw2TvpIk2DOTwrExVq7i4Fdt/jCbcbBDAQ2xhVyej53uTode9SRuCyifgCveNq
         G8uI5CeEXAUueAjyNw2PpO2wXmqTXbQ9Ylr+17KAjD6DU3bi6vNBniDyIB+sGLSZ68ou
         P7PVN9Thte8BE6rkWL9hgoy5RcaJqAsfloH5++U5DxYgNOEdH/qjfqwAdxI7bnp57JGD
         +dZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705584859; x=1706189659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4YHeLV0TQs3MeVFgQiX7V8lAzpJlQDaK5HPvbw2WeUM=;
        b=Eh5RqDFLxUhWtf9ACacyJsiwQamzzHH4P+aVzOsTZeLChQbWh7WBqVKR9WNCva/5k/
         tUsgxU8+Z5SyGXldsUC4soEXG7tvgTLQkBOBcdkxNthHby9YcxxwQOkf8NQUjKgXVHNK
         WMH/gsdW0bSSBjj14beJnF8cKVzL3HjmcsGJP7SyJgb0j14oNHovk4b7NBxFOi5KdmAa
         bIes3IQzFwTqoeOtRdDKrgeMbHIefVz6KuxkVG1qHQmBHFeltCYCl57OVr3d6lMTySnB
         dRH33R6o4JYIrYSyLeCfgnKBFh0XTLLn3NKY3e7t6qcZ2QtBgkFNxUfjvFEUsis4FEtP
         ERzA==
X-Gm-Message-State: AOJu0YyZej20EcL2uvJN3sH82oRxFsQlwb5In956HSq5ykA/4P4DP8OJ
	NUmBssxXTwYH7lu+LXL3FWXE4u3HnLRT7/HeXazAfjtFxv0Ygt1uZ3ykCErlzDY=
X-Google-Smtp-Source: AGHT+IFjO+J+fPdCGYBGEmiIzZ273KdF1+pqEd1e1bkQkfXM4BvS/2gJPylNcqOCshGB4EJoZn84vA==
X-Received: by 2002:a1c:7510:0:b0:40e:89da:7b71 with SMTP id o16-20020a1c7510000000b0040e89da7b71mr538405wmc.100.1705584858904;
        Thu, 18 Jan 2024 05:34:18 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b0040e52cac976sm29348312wmq.29.2024.01.18.05.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 05:34:18 -0800 (PST)
Message-ID: <da27f648-fca4-42a5-8099-e6e19fa76220@linaro.org>
Date: Thu, 18 Jan 2024 13:34:17 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: venus: add new rate control type MBR for
 encoder
Content-Language: en-US
To: Sachin Kumar Garg <quic_sachinku@quicinc.com>, hverkuil-cisco@xs4all.nl,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240118105934.137919-1-quic_sachinku@quicinc.com>
 <20240118105934.137919-3-quic_sachinku@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240118105934.137919-3-quic_sachinku@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/01/2024 10:59, Sachin Kumar Garg wrote:
>   
> -		switch (*in) {
> -		case HFI_RATE_CONTROL_OFF:
> -		case HFI_RATE_CONTROL_CBR_CFR:
> -		case HFI_RATE_CONTROL_CBR_VFR:
> -		case HFI_RATE_CONTROL_VBR_CFR:
> -		case HFI_RATE_CONTROL_VBR_VFR:
> -		case HFI_RATE_CONTROL_CQ:
> -			break;
> -		default:
> -			ret = -EINVAL;
> -			break;
> +		if (hfi_ver == HFI_VERSION_4XX) {
> +			switch (*in) {
> +			case HFI_RATE_CONTROL_OFF:
> +			case HFI_RATE_CONTROL_CBR_CFR:
> +			case HFI_RATE_CONTROL_CBR_VFR:
> +			case HFI_RATE_CONTROL_VBR_CFR:
> +			case HFI_RATE_CONTROL_VBR_VFR:
> +			case HFI_RATE_CONTROL_CQ:
> +			case HFI_RATE_CONTROL_MBR_CFR:
> +				break;
> +			default:
> +				ret = -EINVAL;
> +				break;
> +			}
> +		} else {
> +			switch (*in) {
> +			case HFI_RATE_CONTROL_OFF:
> +			case HFI_RATE_CONTROL_CBR_CFR:
> +			case HFI_RATE_CONTROL_CBR_VFR:
> +			case HFI_RATE_CONTROL_VBR_CFR:
> +			case HFI_RATE_CONTROL_VBR_VFR:
> +			case HFI_RATE_CONTROL_CQ:
> +				break;
> +			default:
> +				ret = -EINVAL;
> +				break;
> +			}

The if/else you have here seems like a needless replication

Just have =>

case HFI_RATE_CONTROL_MBR_CFR:
    if (hfi_ver == HFI_VERSION_4XX)

---
bod

