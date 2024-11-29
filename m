Return-Path: <linux-media+bounces-22293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEA99DC0D4
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 09:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DE92164324
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 08:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D67198A1A;
	Fri, 29 Nov 2024 08:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z3+hhSGR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8D817836B
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 08:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732870126; cv=none; b=Zd/AmQsV0ZUwCCl3pAQbigTgr6K5Y13RR5NfqVYfXCT1FrW/PP+QrfK2OygkAusHR6pbOiXEJF5DKu3/ng8F+iYtKH3tjw5ByeyXyO25QDQkusZGyOOBmVxIqUrmf6lh3ZQYJJLGcobH0IM09Km2Im2/qqIytVTaMqq40F/lbzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732870126; c=relaxed/simple;
	bh=HstscN3AKhpGT9oZAm0aaRUT3RudCL3tGSflNPCsNUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksfVuXIHB7R5fbf4OwMw52wJTFHC1zo3gP+Ut8uQJdi8+ota833ViMxSPhd/z4zlZawzoEuA6BYWV0F3woqOzGxJAxVxEQWE3ZZW86Nn/6lNyX7iUGpZf4IbeVN9nY3i0XpQxpN5TIVhfAtt2V50+SJAkvueCswMJruuiOMFmaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z3+hhSGR; arc=none smtp.client-ip=209.85.167.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f68.google.com with SMTP id 2adb3069b0e04-53dd58a4433so181598e87.2
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 00:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732870123; x=1733474923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qyguf3tBcAojb1uI+66AInXBhiRVFzD69zKSJMnWlsE=;
        b=z3+hhSGRQz9wgm7f2nAHPzPE2t2ckYp+IqqLQcsD//Rqfbdvmgkkl7RmZjLePLjwG/
         q25gY81PQqSJ035z86r92+cogLmG3GZ/vLH8zTRO8mXEPkVWn/7Zj+WE6076a+txHcS6
         diJAEwU47JPJ8d+amnlJMVUVKs40nHjAEQgix51z3AUpTPwa2qef9MNNZeYiCVJuT0th
         XoaM+8gIuv8PXS6xbdH+09J9tFTPRCIvuCAfRVfaRREkawlD0ZWdZocDbMlUMXHz9Mp9
         2HVJtL2wqYtcZjMExbLOTtci3EHwNdTJdOqQXY5S5FOK2ncO3Wk2zIYqRGB/w0o0+d3h
         Tqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732870123; x=1733474923;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qyguf3tBcAojb1uI+66AInXBhiRVFzD69zKSJMnWlsE=;
        b=TxOIaOBF6Y89rczB0lq2H9L70TwfvjQ9MU6UQKrDLK2q9RYHzAyBiZ4HxAqI0mdUSg
         OY+VCcjCub4U0VM1uHmeziWbVTfby1GKlU9Zi4yefTX91sSuPMi3cfujMjgYz2tKsmFA
         YuQfVgHxr9BhzAXzkQFEdVkHJVY/EVWR9CP3Cv2LI7AOZJ6ATgTKgvojxJ3DIazISBuG
         SqKTdY7IZ/NMJBFdhUniP7+ilaoaWECAc4rTjzmCwx6HvnuTz1nM0B3AVDLZR4LQ8il3
         5TZQA9U0RnFoyYk7lqWoBgZUVg0I69KUw22k3EunGbn6hU+9gAcNt3AZMans81GmqaE/
         057w==
X-Gm-Message-State: AOJu0Yzie1RJVWC7emHTULbQ6r7YUKdybSI3zpY/gd4qAbFCGfgcyuoA
	FD0gz5tj3XrZzqeUzhVrByh4+xdp9ALl2Vh0Bbxzd++uk3bbzmqdXd5CtNHfzIk=
X-Gm-Gg: ASbGncsiXY2ZuF4RupdrX1/kuZhYr0sXZuGgqPpi5HeKFFt+HHamHpnm0suZJR1WxV3
	XRP9Zv11F3t1ykpiKZeDxwmoa5YQNdKXxkbu9ljRgjkcFT+YqhvY5wLMQBBxrFpUn5buH/SLShm
	eWyHH/T6I0F+W6Im7h2XPsFHufA9ddMaF3dZg4v38DQvQCK18LF9oICYx8z+cxd+PK4dKT2NmzH
	vTj1Hxt2nJ+SHvj6c4tzq8XP4ma2A5AN8dRYN+hwaZflwziJ9074aLyikRHoC9h8grqBT2TO6ZE
	V8TfEVBXu3BmFpd7yKJKK4ZQjl/t
X-Google-Smtp-Source: AGHT+IFALjH/mnh0mN9G6UoEZAEXjAQv218dyi0GiG7wHiMBUeNzur4jNLQhfUdVSdCSqGhsrCMGmg==
X-Received: by 2002:a05:6512:124f:b0:53d:ee75:4a02 with SMTP id 2adb3069b0e04-53df011183bmr1260311e87.12.1732870123099;
        Fri, 29 Nov 2024 00:48:43 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649649esm428338e87.181.2024.11.29.00.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 00:48:42 -0800 (PST)
Message-ID: <3a5fd596-b442-4d3f-aae2-f454d0cd8e5c@linaro.org>
Date: Fri, 29 Nov 2024 10:48:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: fix VFE pm domain off
Content-Language: en-US
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>
References: <20241128-vfe_pm_domain_off-v2-1-0bcbbe7daaaf@mainlining.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241128-vfe_pm_domain_off-v2-1-0bcbbe7daaaf@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/28/24 21:39, Barnabás Czémán wrote:
> Fix NULL pointer check before device_link_del
> is called.
> 
> Unable to handle kernel NULL pointer dereference at virtual address 000000000000032c
> Call trace:
>   device_link_put_kref+0xc/0xb8
>   device_link_del+0x30/0x48
>   vfe_pm_domain_off+0x24/0x38 [qcom_camss]
>   vfe_put+0x9c/0xd0 [qcom_camss]
>   vfe_set_power+0x48/0x58 [qcom_camss]
>   pipeline_pm_power_one+0x154/0x158 [videodev]
>   pipeline_pm_power+0x74/0xfc [videodev]
>   v4l2_pipeline_pm_use+0x54/0x90 [videodev]
>   v4l2_pipeline_pm_put+0x14/0x34 [videodev]
>   video_release+0x2c/0x44 [qcom_camss]
>   v4l2_release+0xe4/0xec [videodev]
> 
> Fixes: eb73facec2c2 ("media: qcom: camss: Use common VFE pm_domain_on/pm_domain_off where applicable")
> Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
> Changes in v2:
> - Add backtrace to the commit message.
> - Link to v1: https://lore.kernel.org/r/20241122-vfe_pm_domain_off-v1-1-81d18f56563d@mainlining.org
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 80a62ba11295042802cbaec617fb87c492ea6a55..1bf1473331f63b9ab106d21ea263c84d851c8a31 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -595,7 +595,7 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
>    */
>   void vfe_pm_domain_off(struct vfe_device *vfe)
>   {
> -	if (!vfe->genpd)
> +	if (!vfe->genpd_link)
>   		return;
>   
>   	device_link_del(vfe->genpd_link);
> 

I object to this change, there might be a problem in the code, however it
is not yet identified.

vfe->genpd is not NULL, if vfe_pm_domain_on()/vfe_pm_domain_off() are
called appropriately, the "fix" does not fix the real problem, it veils it.

--
Best wishes,
Vladimir



