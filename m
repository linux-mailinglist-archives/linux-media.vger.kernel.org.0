Return-Path: <linux-media+bounces-27302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 459E1A4B2A7
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 16:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78DC57A4113
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 15:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801891E8331;
	Sun,  2 Mar 2025 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="idt9eCJ3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B781E5732
	for <linux-media@vger.kernel.org>; Sun,  2 Mar 2025 15:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740930109; cv=none; b=XCSXBg21Qf66Prbi/8tkiC45ZWZhY8KBQH4QzaLvlodc2WAd85QdpcNeoeNjx+Nn6wlSnHWfJawvRNFi0FZGZ0wWw3L2JA14iN0xO0tHcJoLIVWfp/xnMq4M5qo5kNVfSfoKkBaEDriCb0MB4ACSWYbjVnAXQ3d0gqfeYemG4lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740930109; c=relaxed/simple;
	bh=O9yktWR+C5UOOJ/Pim1ZiwPXfXUq7IZHz+HcJoY2M6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rda2VNIcUO343tpg0ehfO4YpTWRw0Se2WQWm5mOe7TGocbH+aHOdEZ6KTjoJTlrfto1zRE4bt0prhEKOsKIRj5ShuwwGjV7DRUuSRXEgcjhVGbnHrPqVFwU3yoWtr4WVcCm00AFwZ/om3KJSCzAIaP5N6J4nDgrO5OfU9V9+/7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=idt9eCJ3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-390f5556579so969216f8f.1
        for <linux-media@vger.kernel.org>; Sun, 02 Mar 2025 07:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740930106; x=1741534906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3HiV9dRvcF513l+bB0U3lampzZal2SlXhUeZ/+c9e5I=;
        b=idt9eCJ3NbzECCIwN2m8YWFRth4IqBsCAlE8O3UfIreNKORslSxsnojtfDH58xdYAW
         AJhmL386brTG9sgXbSse8pns9H8aWxzPOcsoVul7hOU/e8oAjlk/n/Q9YyHeGdkZ/ebA
         0iiapOcubYwveOz1AU/hTkQ9GznbG8nUg+01SJXFc3kFu7yWzGpS93o4MxUjNH9GpR97
         LdfYvBPKzJdElvDGMxOAtHXCkC44jS8R8afuKKMSVXzGGW950lnqqmK9gM+Ge9j30KG+
         FCa7LT/LQN3XQj11VW+qnWDNxny2b51pWq2eJFXbQGVm6R6AglLlmMO95uo38iBBMba9
         GAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740930106; x=1741534906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3HiV9dRvcF513l+bB0U3lampzZal2SlXhUeZ/+c9e5I=;
        b=VN1jUYS/pEVdu3F4ZQLRImx9OpslCpgVP15o+t7u5+bNtec4Ym1U+fvFUCnszZ2zrf
         jmUasPa3Q2Z7qGzTMBcNKyodRpkZeFApJM/BjrDs8NJvv3GEtoTTfVUbTwNAzIagUmVe
         oTdvdgZD2bUTXvvM+6vJuLiMezUvQWw7en+NhCZ98qypbRWd76XGg6pvwuKf9eW8BSF9
         PmVxEdEnaI2Qva9JfGgLoPe08qhEmUwFghaDjcqk0yE8L0n4oiqpTQ4YGKDvDC4usAl9
         eSMiXOgNEpwMwVKzHG81VQvwi3ts3ftiYYTvKe4/Q2jJp46OrGweTSGB4kcPx6furVBa
         TdbA==
X-Forwarded-Encrypted: i=1; AJvYcCX+yocrN5prMsu0eW/OU4juH5pMVZAu+0PB4acy2X2UXf2mF6E5SZO2AuMAHfDgVyAkCW+TZAmHKyLSWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQtwo3uG7L0eYQyuU0nAV8Qc86mY65u7pkPuePhDr08P1jeaVn
	rQonpJiLBekKgrfi05nRcwJevBMUaMyRTFQ/qBQrlX6/CiC8KIGCshO6pmRu4R4=
X-Gm-Gg: ASbGnctaQWaQ22ObTEe3KBegIxoAvZ8TbEyYBPEyPUYU8MoTuS/emk3LQq+K8xISr+Z
	vaeMTwGDj5jBkuTY9x0bZXS/lYE5vMJqyjkzhWfXf7ANUenTU1V6VtTJLwejwnk0dbS5qydQJvp
	l+oTdoZRLyWZ3zFwW0wJ7VV6nNbuIF4xOyUsqzf+lHaG7AEQHT8Bmoc+E4A2qGTsihaQZBismdg
	BlXjLn1PqA25MWsEI944DgdpwUropru50vXYC4EEyEyBHBOjOQitF+HzwIKZGLSexeSKCrDb6DJ
	4VQXmgep+8UogskD4V04XakKWxdg7DKZ2ttjsWJnsxFIUvTfO0MrL1Yi0Wv5h4HJghnqgxxyjqv
	MOnxu7UwrQQ==
X-Google-Smtp-Source: AGHT+IF12eOjKiABtow++9hCd3t+XcKq5zNahsSe2+/4RMaIaG6U4tj5+0hpB4H1eE9JrU2wrrtzcw==
X-Received: by 2002:a5d:47cd:0:b0:391:865:5a94 with SMTP id ffacd0b85a97d-39108655be0mr934764f8f.4.1740930104863;
        Sun, 02 Mar 2025 07:41:44 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba53943asm156590705e9.19.2025.03.02.07.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 07:41:44 -0800 (PST)
Message-ID: <04c9b97a-7bc0-43f7-9177-b5a007dacdc0@linaro.org>
Date: Sun, 2 Mar 2025 15:41:43 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: ov08x40: Log chip ID when identifying the chip
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250301114830.22668-1-hdegoede@redhat.com>
 <20250301114830.22668-2-hdegoede@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250301114830.22668-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2025 11:48, Hans de Goede wrote:
> Debug log the chip ID after successfully identifying the chip, this is
> useful to see if the identification is done on probe() time or if it is
> delayed till the first stream on.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/media/i2c/ov08x40.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index a4790e68f523..cf0e41fc3071 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -1955,6 +1955,7 @@ static int ov08x40_identify_module(struct ov08x40 *ov08x)
>   		return -ENXIO;
>   	}
>   
> +	dev_dbg(&client->dev, "chip id 0x%x\n", val);
>   	ov08x->identified = true;
>   
>   	return 0;
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

