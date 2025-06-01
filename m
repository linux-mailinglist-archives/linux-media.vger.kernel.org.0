Return-Path: <linux-media+bounces-33738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD58AC9E21
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 10:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F9D0189551E
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 08:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C80B1A3A94;
	Sun,  1 Jun 2025 08:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O5rFh/D+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B5B188A0E
	for <linux-media@vger.kernel.org>; Sun,  1 Jun 2025 08:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748768129; cv=none; b=PR3TbJI8dtpNOevKfo8y3izI2QZ69Rnggv40zcmxSY8McnED6Ma70+O3DOkG5aEtyznpc4QEXDKvBlogG4Vs86jWnyFtDtxfyjv6vBdYJTcsrqyZ0Alq+W4DZq5wNbJhnpkfCpWxX58nhyIdZHMaAPIL4ag4fCYI2hQYGXU3r9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748768129; c=relaxed/simple;
	bh=ELjgw5x2DtWerFcTQqXF907NgsZU6jvJyml2IQA8WY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ll8vXQ9yUhAAjvs6kqJRcoc7Mt0AdfCr3qpKVR+u3fIWZch5xvr7edQFr4B92eFjrmnS+XcQaNR2GJjw4oy0BcSP8RIdnS4LHs/u/u6CFH4SJVCnVyNviClC0XPO2p60DzTCbrAV+RKgR/9vCoHspEQP2a6isV0wOrpTtXeHtGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O5rFh/D+; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4f89c6e61so1079225f8f.3
        for <linux-media@vger.kernel.org>; Sun, 01 Jun 2025 01:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748768125; x=1749372925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=urRzCl5tjeEVqvqsmB0ZFW27RtQHVlLkSlE30TVPg+w=;
        b=O5rFh/D+rALG98ZbdZ6oRPBTAFooRdoCdwRcchaRbDzfu7HGCB+uAZAisXZxAAJ8GP
         x/KdzxEm3w7r3rMbiwnCGnUdV23d1KHBGNA7JSwYd7+OAvqWlAPsu2/PwXDPGIvmXRz5
         jex4LfMuQM646zwYb/QE4sFCVh5NGn6n/lFOOOvR6SmKE4j0tavYpNi8GtzIy5QydFzd
         n9/WxkkmMePcRmaY+nJkw7sXXoXNfFmoKN3f9SHiGGJlLLrDSPpHnmt8VC/PIDCn4UEK
         ZceuJt8Cx8rwvZkOAzDYDVKd4xipQZWKsJMOFXyGFKXinlzhe3T+zWEf1LM/4LYkOW7s
         ZWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748768125; x=1749372925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=urRzCl5tjeEVqvqsmB0ZFW27RtQHVlLkSlE30TVPg+w=;
        b=EQ/YNvhRwMvSLIXK/e4Dhg7F6WrpN6SxczS+tnllwSu1IEcWZAGk62u4LxtJojGfvU
         Wfknh7cx1Vb6iR5Loav0k+QCOpYzki4ypsTuIlNJecCbtpBkArfra+G1ZSOGSzu3Kp4X
         BDo/kRHPeqWxLgbBKFFLVMns1xm1Lqu1WIAT/NT6OlnCXxM6lb1+s0e0zFS9ESQCEhGA
         amhBZ8IOz3BjBUbnWVy//U6P5uoHHB9p23WvWUZSdDO5NyB+Ci+DmDrVTVVAY8xHL3O8
         TJgomMunCnHOcmrFDlr50ysAmM28X4ptZkdCv1du/RH0kXO8nTuUst3D0yN6CyV8Det/
         vFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcXurGEKAKFpURppLDcOi+QZ39sHImD6+9NPLzBrbhJpkvH+usUT84JQ548kBnQ2lOnDNXxnIxycVrOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWccJMgybqE4JkJDIcoKdNCyGztNHdctos/CEu3CJMgWcOjnUy
	r06ZYok8FQN8FwuVW2ScIR1C8aG5aBfuaoxLMCRwGX768/U4VZqKN1fggY+3T21dohU=
X-Gm-Gg: ASbGnctiCyos6JVD9KXMqzqjxxhL282cU3IDri6ZBIl764lmOpv1jJBWrta28Ot2Pta
	2b4QRwE/RNvYK+0Qxp/lBwVP9+eSMz0Gc3hDDn5XSbzEUtgbDQR7uPYov09ahXhPxMqsMQc/Tu6
	wDHfEg0X6aFQwnIF1lCCtO8zl1ZQ3/UQynvVhiL3vCCBvO0TXBahWzjPVVldRjFCTEoAgP6aSEB
	Hd/nHwHluWCqnC5ply3fD1AvOjH0gXlIchTYvR33aktTSMcR1s3LoQvgcr4yAVPEnNXKrS0akzJ
	Uzgs8Agkfv8CbXCm9tJ+Rdc1Ghmi4/Eey6dsENwvastRxo9Q4cz3Ss6ExKFtwmj1D+PPgt2J/Df
	qn7qn5ZoU3+SzD7GT
X-Google-Smtp-Source: AGHT+IHahLhAnxPmN4IhWgL434b77IHsNGngm83xj+pJjR8Vtxj5id3EpkncLZTwOFGIjcU0Fi9cNA==
X-Received: by 2002:a5d:64ed:0:b0:3a4:e54c:adf2 with SMTP id ffacd0b85a97d-3a4fe161874mr3719813f8f.5.1748768124669;
        Sun, 01 Jun 2025 01:55:24 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972aasm11064413f8f.66.2025.06.01.01.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 01:55:24 -0700 (PDT)
Message-ID: <cd1e456d-82e3-48b5-9387-6d407ed7b051@linaro.org>
Date: Sun, 1 Jun 2025 09:55:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: Fix MSM8998 frequency table
To: Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Marc Gonzalez <mgonzalez@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/05/2025 13:22, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Fill in the correct data for the production SKU.
> 
> Fixes: 193b3dac29a4 ("media: venus: add msm8998 support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/core.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index d305d74bb152d21133c4dfa23805b17274426a5c..2bb514c322692475ed58198e17f906f894d81cf4 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -709,11 +709,11 @@ static const struct venus_resources msm8996_res = {
>   };
>   
>   static const struct freq_tbl msm8998_freq_table[] = {
> -	{ 1944000, 465000000 },	/* 4k UHD @ 60 (decode only) */
> -	{  972000, 465000000 },	/* 4k UHD @ 30 */
> -	{  489600, 360000000 },	/* 1080p @ 60 */
> -	{  244800, 186000000 },	/* 1080p @ 30 */
> -	{  108000, 100000000 },	/* 720p @ 30 */
> +	{ 1728000, 533000000 },	/* 4k UHD @ 60 (decode only) */
> +	{ 1036800, 444000000 },	/* 2k @ 120 */
> +	{  829440, 355200000 },	/* 4k @ 44 */
> +	{  489600, 269330000 },/* 4k @ 30 */
> +	{  108000, 200000000 },	/* 1080p @ 60 */
>   };
>   
>   static const struct reg_val msm8998_reg_preset[] = {
> 
> ---
> base-commit: 2a628f951ed54c30a232230b5b58349d2a8dbb11
> change-id: 20250531-topic-venus_98_tbl-5765675a4ce5
> 
> Best regards,

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

