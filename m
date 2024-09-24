Return-Path: <linux-media+bounces-18515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEEA984803
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 16:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1AEAB21E99
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 14:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A0F1AB530;
	Tue, 24 Sep 2024 14:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zwrDy5bB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51301A7AD6
	for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727189353; cv=none; b=feN4y5JWSzTQdt1dOKY4i84R5rawi1fBvkny65Adv47Fs/Rk1Tzr+upauQEkTmLYwfUDhiUQ8AaQl0F0qe0FjLgofMzwN1kN2aw7wATnSPYxvi9tMvhwzbN97i7myyNOdiFSU3KSkP3wFQukwRiyq4VzW+/GUHKxUv1rVbGQrrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727189353; c=relaxed/simple;
	bh=9fSwM+DKte0wEQiPHds4A4zZnzDD4zB8w2JRFLmZl7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXs/O8rOIFUOQ8e9t7AQZMl8cXxG5ULxoxlXOS3FfYJZC9QxGoBL88lBkCFZKpRb7Vs+ptnt9YcOxlGO1S6emtlxq62xtH6zE+I4hKZ1oci9x0miYW8Ceg31hVda3TyCBgPOrcC2/cHN0IJYwsfBNccxCGr1Xluvs0khpd+UQeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zwrDy5bB; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c2561e8041so7784002a12.2
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 07:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727189349; x=1727794149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZ35KoJN7S1WoCdRYzNP/4L7HDj6JlTW7CKwysrsQR8=;
        b=zwrDy5bBNBXRXnJ6Mk1N0ugfGEPnxALmnT72DN2bp6FaZYuyi525aOYBNHcAQs5uRR
         AOCaLXl92RUFTKmlajM9jVZ3IK2sPAhEGanrA2ojxPiQHZUGtszTdI7tz1GmcEETlYzL
         FkPwtwfjCFv40a9IVMKuCMdLYKxoOwS9SjiMtMzWf5RlO9+L11llUM3xLLfPxladdd+a
         kcQtVMnuBCacHwWJcSdX2Mcd7ghaSE1q/uBYiOFReSmIZ0RNP7d1wIkCXM8Fb7DcEE1G
         p6J7Q9K4yKWCeYPPHuJi4tNinStqSQ2MoxJ9Dr+e8dF4EgoPiOA85R7CnBK+RRZR2/Wj
         wDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727189349; x=1727794149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZ35KoJN7S1WoCdRYzNP/4L7HDj6JlTW7CKwysrsQR8=;
        b=Lj5+njZPaBvYw4P4bQ3GNdbk9oGm5CJcMoL64fXvtEW//FpMfw8QRThumXPzZ5zeJh
         hzznsoX7VqIG8m6MD2X7/mJphV1Y5s6ddDriB1nOtklNUjtYDYOHLVyqKwAZ8bNMZC6u
         JzfzsRFuzsq+1Y4tACIg34RSJiMLP/PUBgGiS4F7fSCCBwlMhS0ODVkWP25Ulb3CA5sL
         myVQ6T0e8ES8sov+moLk7r081bCAYWOhzLqqpxtxN5luPNHJZaB8y4O6Um5YdLXg0/61
         7nhcRPUKqT7SRlIUztG+4L34su2yUhJ5KSqSFsBxSCgtkOYVKxyzx0HLxYkMLjuVOdsb
         bStQ==
X-Gm-Message-State: AOJu0Yz077wzph+mr/u+MJ+5WASo0K+vh/rBArFtEc4Uqyc9ENjqbOI7
	OTN6+jV48ECkFvaWS6KvKXulQ0Z1Xg5GFghXH0cAY5E2eOD0CRA+/yCRZ+M/5o0=
X-Google-Smtp-Source: AGHT+IEhlkUAQPCtZT8hubUSWmv8QbQvdcc2jJFbDh8/xt91cjOh/MPa07mapBuSNdWUMSs06Uz6Dw==
X-Received: by 2002:a05:6402:1ed3:b0:5c5:b646:945b with SMTP id 4fb4d7f45d1cf-5c5b646959fmr11606788a12.22.1727189348976;
        Tue, 24 Sep 2024 07:49:08 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf48c437sm832865a12.5.2024.09.24.07.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 07:49:08 -0700 (PDT)
Message-ID: <8f156cc8-d8f8-4caf-8431-4a549f41ac0f@linaro.org>
Date: Tue, 24 Sep 2024 15:49:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/29] media: iris: implement query_cap, query_ctrl and
 query_menu ioctls
To: quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vedang Nagar <quic_vnagar@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-17-c5fdbbe65e70@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240827-iris_v3-v3-17-c5fdbbe65e70@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
> From: Vedang Nagar <quic_vnagar@quicinc.com>
> 
> Implement query_cap, query_ctrl and query_menu ioctls in the
> driver with necessary hooks.
> 
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vidc.c | 89 ++++++++++++++++++++++++++++
>   1 file changed, 89 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 7d5da30cb1d1..1dd612b7cec5 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -362,6 +362,92 @@ static int iris_enum_framesizes(struct file *filp, void *fh,
>   	return ret;
>   }
>   
> +static int iris_querycap(struct file *filp, void *fh, struct v4l2_capability *cap)
> +{
> +	struct iris_inst *inst;
> +	int ret = 0;
> +
> +	inst = iris_get_inst(filp, fh);
> +	if (!inst)
> +		return -EINVAL;
> +
> +	mutex_lock(&inst->lock);
> +	strscpy(cap->driver, IRIS_DRV_NAME, sizeof(cap->driver));
> +	strscpy(cap->bus_info, IRIS_BUS_NAME, sizeof(cap->bus_info));
> +	memset(cap->reserved, 0, sizeof(cap->reserved));
> +	strscpy(cap->card, "iris_decoder", sizeof(cap->card));
> +	mutex_unlock(&inst->lock);

Locking is a good thing but, this seems very rote.

What's being protected here ?

Please take a critical - no pun intended - look at your locking strategy 
here.

I mentioned previously taking a core lock and releasing it with a level 
of granularity that didn't make a ton of sense to me, here's another 
example of locking for locking's sake.

Please go through your code, look at your locks with a critical eye and 
say "what's this for, why are doing this, what is the lock supposed to 
guarantee here".

I appreciate that can be difficult with a progressive patchset so 
recommend jumping in at the end and doing that analysis.

---
bod

