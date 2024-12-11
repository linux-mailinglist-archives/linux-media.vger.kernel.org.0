Return-Path: <linux-media+bounces-23218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D78B9ED036
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 16:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69217188BCE2
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 15:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B597C1D5CF5;
	Wed, 11 Dec 2024 15:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZ6aMIe7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CAE18BC3F
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733931895; cv=none; b=QyLg8vmmhF4Z5b/oENcU02wyM4wJz8AQ423zb/l5qWjV/7eNVJOK4Xl0X6R/XyMNoZYa1PuHoQUz6pFvd1S+J8+rdVjMyd2vuD/afl1ubGTWZsKMufunOG7VKlhdGWGz0R8CaYbOLCpgFV/pOpgrvSLPohRO4shHN692Y2lUHs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733931895; c=relaxed/simple;
	bh=Y7RUfnCiAOKkUerIqaBCl0TUIFGov53LacoipgJNjPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgKFLezcjBDlXER5eFw/AHLLhBY5glKsC3fOCjRdDXUbk4y0XiZVvY2lcw4d4CgdNghpK6p2qmyHyLL64guO8jgNF20iCOAUi595bOi3yf8xxXGBCK/Eih6fY1ST/gZnhcah56l1HzzvmYHmMoptZNVPelMtx/J1Z6A7yc/KMy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZ6aMIe7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385eed29d17so4448707f8f.0
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 07:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733931891; x=1734536691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBmna7+6RMIWIREX03MVhyyHeHj5nS5NLCMMk7SB1Kc=;
        b=pZ6aMIe7eYcI80OMcQgywNLBmxx+zZtOtQGjflMD+DILV6NKFxFSZ3YeCAtMHwHKUP
         KVXf7D6VFsfTJBLLuLsBxsO8HicK8Ub5tYFLBnzqmw+mj4K0fuf4YOG/j/u6ZuD5G9k6
         1oh82fOxNMPA9K4tEhZswbcvbpbP88hOu0GoSnRhwALU2myveTI5T2pQPL8U4s6mcBBc
         n4Ma7WUZugsr2qzYh7uhDMQIzEGzz/SRaMvJg69hGqZ5qJ0OSqls+XfSC+TXN0o1Dkee
         gkjyxPeYmGDU209HDTBKACWSdO73TVktB7TRbIJ/jUHvdvUhUjSCdmQPoZfRvjT3bh+O
         6Fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733931891; x=1734536691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oBmna7+6RMIWIREX03MVhyyHeHj5nS5NLCMMk7SB1Kc=;
        b=Cy9EMOQ9sYeucxbfJ+tdEPqtxMoOMfyQ/UFCIpLbi6AX43iE7B+T24VkSXptQba6uK
         Tr5nZSkNB3q2vJ/CSYBzGxuPp5JlDIiyz2NTypfwENI+6b5H98T2sR2fKQBDsVdQABxu
         h1yyCXq6A1ODjGzbus6YwtE9Cegx1oRs9OK+yweLIVHD1ZGrnIBx5Ln/IbnFuivxYbgn
         8MyIHuMvJrSP0WBvmatvJuMSW4iQw8BmD6cd0Nz1O/PJea9Vz7TwcfmKoWJ8vzAVrNTe
         fvW/ugKPDL5GxQptbaNxZPAjfOH0r0NaaxM1GJe3BKWgir3E5kAm6vPSeP/haqnQmeFw
         S/sg==
X-Forwarded-Encrypted: i=1; AJvYcCUUoGpMG4NPQQE0fpZ9n9fmoBnIVoT/OEAQiN8NsNNjN6XKZLQ1qEvtLQx7UKesWCh8OPTVgWL27r770w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh5mBGvwqzAlnxrbbAwqB4nEQqussETwXUXYF6etwcoElQ2dBF
	tAwRCjX+AwPjjdx9ZF1Xbwk3otg1w8UQrozDUzyRb6rzl/+7TAeCLsBrCtgCqvw=
X-Gm-Gg: ASbGncsWUjJwqugTHQn2N1wjhiHljKcaDgWAdSSVTzcOZbqR83Mus6Xc9efqLpv/GT1
	OA/Qa7UYdje9zN8k9SYuBl/CoNe1cypWEJL0AEBOdVncYhq2M1kvtGFXZH++vRyOFlKNQfPQgQw
	ttYPQqz0UNgugT3oktnvTjw05m38gr4awxyMxtSq5wie2FFWn5Qe3QUb8RTMlDFVTW0mtBpGjez
	H+K2VPWaCWg/io1E51IWPBTMU9KRwiAxGyKpJO25mX+tEyskHK388kNlAypuyCg86U=
X-Google-Smtp-Source: AGHT+IEWZzmBMWvFGvTooD56kxpnFOuI8vUWhZdHT9OAfinfrH9O5pPMEGROg6P7/K5rwwn2X/PyIA==
X-Received: by 2002:a05:6000:4807:b0:385:f092:e16 with SMTP id ffacd0b85a97d-387876c41ecmr45709f8f.55.1733931891604;
        Wed, 11 Dec 2024 07:44:51 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514da2sm1521777f8f.66.2024.12.11.07.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 07:44:51 -0800 (PST)
Message-ID: <12dabbc6-5813-4369-b882-2fc72333746c@linaro.org>
Date: Wed, 11 Dec 2024 15:44:50 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] media: qcom: camss: csid: Add v4l2 ctrl if TPG mode
 isn't disabled
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-12-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241211140738.3835588-12-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2024 14:07, Depeng Shao wrote:
> There is no CSID TPG in some modern HW, so the v4l2 ctrl in CSID driver

"some modern HW" => "on some SoCs"

> shouldn't be registered. Checking the supported TPG modes to indicate
> if the TPG HW is existing or not, and only register v4l2 ctrl for CSID

"TP HW is existing or not, and only register" => "TPG hardware exists or 
not and oly registering"

No need to abbreviate hardware to HW.

>   only when TPG HW is existing.

"when the TPG hardware exists" you could also say "is present" instead 
of "exists".

You have additional whitespace in your log before " only"

> 
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   .../media/platform/qcom/camss/camss-csid.c    | 60 +++++++++++--------
>   1 file changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 6cf8e434dc05..e26a69a454a7 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -760,11 +760,13 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>   	int ret;
>   
>   	if (enable) {
> -		ret = v4l2_ctrl_handler_setup(&csid->ctrls);
> -		if (ret < 0) {
> -			dev_err(csid->camss->dev,
> -				"could not sync v4l2 controls: %d\n", ret);
> -			return ret;
> +		if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED) {
> +			ret = v4l2_ctrl_handler_setup(&csid->ctrls);
> +			if (ret < 0) {
> +				dev_err(csid->camss->dev,
> +					"could not sync v4l2 controls: %d\n", ret);
> +				return ret;
> +			}
>   		}
>   
>   		if (!csid->testgen.enabled &&
> @@ -838,7 +840,8 @@ static void csid_try_format(struct csid_device *csid,
>   		break;
>   
>   	case MSM_CSID_PAD_SRC:
> -		if (csid->testgen_mode->cur.val == 0) {
> +		if (csid->testgen.nmodes == CSID_PAYLOAD_MODE_DISABLED ||

if (csid->ctrls ||

feels like a more natural test. Less cumbersome and also less typing.

I think that change should be feasible, could you please update your 
logic from if (csid->testgen.nmodes == CSID_PAYLOAD_MODE_DISABLED) to if 
(csid->ctrls)

Otherwise looks good but, I'll wait to see your next version before 
giving an RB.

---
bod

