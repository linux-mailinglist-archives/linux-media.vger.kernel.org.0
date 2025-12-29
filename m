Return-Path: <linux-media+bounces-49615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B3ACE59BA
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 01:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 830153006603
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 00:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA41C8488;
	Mon, 29 Dec 2025 00:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LAN243lR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8733410F1
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 00:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766967170; cv=none; b=fbGeImyWO2lZEecFIpBLFSlr0l4+gmVWfvVugX8dxqBr/8xSzXr2dnSXGzGckWLyL2LBC75LeHZnChvPODZduefi2l4V8dECK2jmAout6YsKApB1T6C0QTKAgNuK/pWALQ8ZZE3F3TDETcLK54r0NHx9ltGCH507PCzHCu8eQ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766967170; c=relaxed/simple;
	bh=ssCCkzx1dIj2++bhNA1Ei/xkIhM6dwHxoCrlDrpUI60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gNxVJWaLcXOskPqZnoRhIgYrPUxdsAzJu+50buOGniXAG03P5EqBB+Ind1mHNJ3ItLlr1DDcaLeSbO8Ro0hZjrA4u9rLVTTZ9JrXxjklNKzeaIydi8Xwn9cHM5vASiGq7upNdwkUKe2yk8m5nWc5pxfzp7Ug09LbhnVpLvGg5c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LAN243lR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so65220965e9.1
        for <linux-media@vger.kernel.org>; Sun, 28 Dec 2025 16:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766967167; x=1767571967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9WzXxaUUQ9sEQkmr39uEkHOj+5A+LDwJkjmpr53iZlU=;
        b=LAN243lRUFcr6wRfyaDFquylw3+P/BlANxwBiqqacpPMVnPNpuYr+Gcuh2jFtkHVuD
         La8igOFWY+jr1t4TQt7lsFVQYMyGKZ0LYhSbrqUe/ja6BDB5nY0woKa/ZqSNFbWIxO3J
         kKkn1mHO5rEUlBMs/X6n1wxHiGGLEfHeIzx/InlXvdGqMft5ofiS7NaSdbisaPSCSVaO
         UlpEpEZzdfshki7DodZXUHOVFIIQD9GC2NypWE5IQb49TBRXh9msgy6KA/eQ2dLtHe7O
         j9c/uOVap51ti2ae0rU0Z8RAg0jRhWFAfIRSrlLdqYrtjv4K8s96nrek2L+k/FpwZt/6
         dXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766967167; x=1767571967;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9WzXxaUUQ9sEQkmr39uEkHOj+5A+LDwJkjmpr53iZlU=;
        b=jPick2Qtw70ItkL8OeHVnELvWcLe7vkl6M3TO+4WeZMrccH64ekooS95zBXYqMnIt2
         wvmbk/3d6eiNDMhbzG19vhnbDvX9NxXzik1bfBXyqiZ9vEfKvWXqquAu3nT3FwWpuW22
         JsiA0dc0JPqbc0Ji/i02ZbaT1T4gO7qsv7m8MhTCfDFrVJtlli00DzcAYKLfrhcV4LSW
         DnfbKgNcyQFDoXXUym43OEIHYfdNtdg4zC5xU5eAOp+8wbG0SCSEWMQAsHHHSmoDCcBW
         UwZs8bpwb1yBB0NbCzz/wjmDqx7LdWasYwzS2wkYmpwfBCe2liWWwEvelH2MOl8/vYaW
         Nw5A==
X-Forwarded-Encrypted: i=1; AJvYcCWWTrBRRt4uhX9ESYW2P6aMWV3Jr316dpAgbnnvw4qQC3Qlmk+ijFW22/JrC3XC68sEW8eR1hNDxS+KRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw06CiOE1xNj1eNJZEDZ3pfQ++sK7p8cDhdPfnB3F4Frl9l8W4/
	i2DF+Hbp4U5b6YysEG9XnY2w9MKlX1K55KFPU+7aHEz5ZF026ieFUIhUVNaL9P9T6V7DuqnL8J8
	EMqmGp98=
X-Gm-Gg: AY/fxX46ApNv08/O/SmPV3xJHCuuex4wMSZi3sD65EkzSJjPeyIgNvSZvpX4ClUDfqD
	CMNczXHSa9oT28UNhfF6bBP4e3P8wXFOqriQq9UfbUnwq+TERMeiIH3D2PNlSMXGtXnAvTzyeUU
	GjgCKHPKcTB0ooOPg9kHKcyMFpr0dG280Bs2JHAOZChvSwVn+O01r42ijGbkjG07KPP0YYapt7D
	6x+78pTBlHKbOt0sZWtfJkY2WED23VtpyhYfloT2PoGIHLm7zuirkb5VqgI7nqIR0cURY7uN3Iq
	iJrMOG+R69hVb/vQAfUzObm/gWUaw/imu8QPyNuezWFJF2xOBCVR9twxmIsRHHrW1rAps5+5f40
	w3jpce/TbLdvVCF8rovsf8og/OPvjC5ihC5Ub/vqUpurYb7i2lYsT25CE0WUElKvQMpDC/kilmV
	jcEaDay6puPVW1SIMMeWc3E+Ajr+JoLt+nCsJhuFvnPsHOuar3085G
X-Google-Smtp-Source: AGHT+IFpU6dHath/DI6lRZn8hXaVXbJ9CczHi8G+sEXQ8+e10hHeMAr3Ba1/cVvVC7LHB0On1s7JEg==
X-Received: by 2002:a05:600c:3b0d:b0:477:569c:34e9 with SMTP id 5b1f17b1804b1-47d20021316mr331963275e9.23.1766967166913;
        Sun, 28 Dec 2025 16:12:46 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2724fe8sm663868575e9.1.2025.12.28.16.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 16:12:46 -0800 (PST)
Message-ID: <8d260d93-38cc-459d-b8f5-40bec5497277@linaro.org>
Date: Mon, 29 Dec 2025 00:12:44 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: vfe: Fix out-of-bounds access in
 vfe_isr_reg_update()
To: Alper Ak <alperyasinak1@gmail.com>, hverkuil@kernel.org,
 mchehab@kernel.org
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251227102442.44989-1-alperyasinak1@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251227102442.44989-1-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/12/2025 10:24, Alper Ak wrote:
> vfe_isr() iterates using MSM_VFE_IMAGE_MASTERS_NUM(7) as the loop
> bound and passes the index to vfe_isr_reg_update(). However,
> vfe->line[] array is defined with VFE_LINE_NUM_MAX(4):
> 
>      struct vfe_line line[VFE_LINE_NUM_MAX];
> 
> When index is 4, 5, 6, the access to vfe->line[line_id] exceeds
> the array bounds and resulting in out-of-bounds memory access.
> 
> Add a bounds check to ensure line_id is within valid range before
> accessing the array.
> 
> Fixes: 4edc8eae715c ("media: camss: Add initial support for VFE hardware version Titan 480")
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe-480.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
> index 4feea590a47b..fac111135c78 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
> @@ -237,6 +237,9 @@ static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
>   	struct vfe_output *output;
>   	unsigned long flags;
>   
> +	if (line_id >= VFE_LINE_NUM_MAX)
> +		return;
> +
>   	spin_lock_irqsave(&vfe->output_lock, flags);
>   	vfe_reg_update_clear(vfe, line_id);
>   

A logical bug.

I think we shouldn't be calling this function at all with a index that 
is too large though.

Something like this instead. An explicit loop for the output lines and 
another loop for the write-master completions.

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c 
b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index 4feea590a47bc..d73f733fde045 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -202,11 +202,13 @@ static irqreturn_t vfe_isr(int irq, void *dev)
                 writel_relaxed(status, vfe->base + VFE_BUS_IRQ_CLEAR(0));
                 writel_relaxed(1, vfe->base + VFE_BUS_IRQ_CLEAR_GLOBAL);

-               /* Loop through all WMs IRQs */
-               for (i = 0; i < MSM_VFE_IMAGE_MASTERS_NUM; i++) {
+               for (i = 0; i < MAX_VFE_OUTPUT_LINES; i++) {
                         if (status & BUS_IRQ_MASK_0_RDI_RUP(vfe, i))
                                 vfe_isr_reg_update(vfe, i);
+               }

+               /* Loop through all WMs IRQs */
+               for (i = 0; i < MSM_VFE_IMAGE_MASTERS_NUM; i++) {
                         if (status & BUS_IRQ_MASK_0_COMP_DONE(vfe, 
RDI_COMP_GROUP(i)))
                                 vfe_buf_done(vfe, i);
                 }

---
bod

