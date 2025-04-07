Return-Path: <linux-media+bounces-29465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CEDA7D78F
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 10:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE3C87A65D5
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 08:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBF9227E97;
	Mon,  7 Apr 2025 08:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zdd7f6Jr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C5417BB21
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 08:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013901; cv=none; b=cVoR+4uLBkTwdifhc4ZVjamrYZDeDrL2kazGs1JDPkWzMh+u0b28XdbqIv2EcFoKDbDfL5QDZLZ0gWPBGBQy9C6ixONdXyzTa7qcS7nOOkZt/tL/wCL1kjlo8B3uuMmCXJ+PEyKhIhOra/zR1DyZIGCeHCISG7VRCpeWVLxVFGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013901; c=relaxed/simple;
	bh=YlsQTjXdsv4XA6hqZmO7LwdUAH1dFibkaUp5xfPlBWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YXjKZL9kmQGWGwS8kYhQrk312DQiwOQ/To2cWBExaAqY2l38vP2I1DUzEiHf0+WO97lyTqceBiADqfoZkyhd1hch6drlJVkKKwYWLpQPUTeUjb2Gy0d4HRsCSYGpXuT5OqpgNgbRyPVFAjdWMhXjRkX0S8zFZBWfsCCHKzRpNAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zdd7f6Jr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so24902205e9.1
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 01:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744013897; x=1744618697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uStfGb/uQDex1jEFM3av6TwQpt81IfPerA2ojrAgjDg=;
        b=zdd7f6Jr6WXukul+hUCPyWEYSo1Egi/hHf8Tiuc1wyDJeeRt2m+3op+RrNcznfaQ2P
         mvU3/vAGLnu5RkxXN23DJaRI/Ln3TNCTbfqqryBPwelI1spiDDUyHgFpo2dks/g3BYdw
         Mt40ve0WjkhpUWwXNxKyjBCW1nPD47Vc3O+Zz+tquyJ6YQzCeHtAeGaU6sPLWWED6phU
         +ajiGe+3wZqi3+PiLi36zHN86kRoYlS++xRmFQVinDxNGsmHUTLg5Vp1b/8H1B5Cx18B
         A0+EpaVy5JRdz9mRjewJzdGj747ND1Ak6pbsFcpkIIQF+Rcth6I0So69xkuxcjqmNJTQ
         Yvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013897; x=1744618697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uStfGb/uQDex1jEFM3av6TwQpt81IfPerA2ojrAgjDg=;
        b=pQBAIvrhMPq9sC5jH13miW1T4kJH/MqeDyahSt0VLv6oT8CP9/rgz3uSJnz+nvTmtt
         vZQgpyWBEx387Uxv1wxYU6QXxV/OV9swW1bgc5dJsqEV+H9EN91KeGRroOPN8k4fII/p
         wDf0YlDLi/DM4szdt7978fC1Vvyiylf6Yk5/FPnzAg4wQQ9KjebAdt1xCa94/jEooylc
         zzHxvz0Lv0ZNk6ymUqKpfvXjrRmVVhEEe6iE3+j7f+gq2QnKGyc9gYSuOcXVjSd8Hv5V
         dIMcN/ub5X5z9QctzYmq0p+Rg15yjRudT4LhV4XLgj7xswapaL+YjYqTGMiy+Ys4zPjB
         5VBA==
X-Forwarded-Encrypted: i=1; AJvYcCWxaaOZuqeil9H9J/H/zx1XRM1cfWA98HoxM0U9bEQTu5YJJWv12NfDR62x9BqN8LOyLSsWPZaZo2x4Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWGTOLF8m/e/TH9dLtEJ/HBIJ/7YW+FG7xqaPwOalPYubaJtOz
	82z8ubNUbLdT+sdBFGex5l5uQHawHZ3lMJFNXsq4J2csKI+yqCZhR8dEnQiXk+oq2EzQxZq0lmo
	m74Y=
X-Gm-Gg: ASbGncs12l1Mk6EzFfgzgPG0iiGrBpSAanbodcvrPaHy9U6cisXURNKptGi6pud+9jR
	gG/7DUIibVob9ml4d5laFZygDSC0c8Q8vupNSWl+wZtxkGAxe8tasxvOGTCqHQvgiLx4zwLwpg5
	6pIDR1O5iIOg5NoxSP6yhL9QG3capc5kWx1Ub1qQFzhV0vu4aKT1JpM/DH7ILulCLDIv8dvyFml
	vk5TD7W9u2Igfwk7KAq2dYk1pB6O7blQnACerNWTon4KYd5aNrCX2cFAgM6TQDt80NkcYBZ8aBi
	zNvxOWPJ0uQD0qCPfqIpXBi+FhnchX4tMtPjM6/7G8e7GmJraIQVJ+9EBpXb41hG7b9QUGIrCVR
	nIpggDby1/Q==
X-Google-Smtp-Source: AGHT+IHn0gupopMsVf9o8TJPudpSJ8Lw/nR3yL67Q7MIerQdSv+lOCEPnPMaXToMPCLviiqVq5lmFQ==
X-Received: by 2002:a05:600c:19ce:b0:43b:ca8c:fca3 with SMTP id 5b1f17b1804b1-43eceec3b21mr98959055e9.11.1744013897228;
        Mon, 07 Apr 2025 01:18:17 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630ddesm125516325e9.5.2025.04.07.01.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 01:18:16 -0700 (PDT)
Message-ID: <c0c3f814-552a-434a-9893-61d83b5a346b@linaro.org>
Date: Mon, 7 Apr 2025 09:18:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: vfe: suppress VFE version log spam
To: Johan Hovold <johan+linaro@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Depeng Shao <quic_depengs@quicinc.com>
References: <20250407073132.8186-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250407073132.8186-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2025 08:31, Johan Hovold wrote:
> A recent commit refactored the printing of the VFE hardware version, but
> (without it being mentioned) also changed the log level from debug to
> info.
> 
> This results in several hundred lines of repeated log spam during boot
> and use, for example, on the Lenovo ThinkPad X13s:
> 
> 	qcom-camss ac5a000.camss: VFE:1 HW Version = 1.2.2
> 	qcom-camss ac5a000.camss: VFE:0 HW Version = 1.2.2
> 	qcom-camss ac5a000.camss: VFE:2 HW Version = 1.2.2
> 	qcom-camss ac5a000.camss: VFE:2 HW Version = 1.2.2
> 	qcom-camss ac5a000.camss: VFE:3 HW Version = 1.2.2
> 	qcom-camss ac5a000.camss: VFE:5 HW Version = 1.3.0
> 	qcom-camss ac5a000.camss: VFE:6 HW Version = 1.3.0
> 	qcom-camss ac5a000.camss: VFE:4 HW Version = 1.3.0
> 	qcom-camss ac5a000.camss: VFE:5 HW Version = 1.3.0
> 	qcom-camss ac5a000.camss: VFE:6 HW Version = 1.3.0
> 	qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0
> 	qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0
> 	qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0
> 	...
> 
> Suppress the version logging by demoting to debug level again.
> 
> Cc: Depeng Shao <quic_depengs@quicinc.com>
> Fixes: 10693fed125d ("media: qcom: camss: vfe: Move common code into vfe core")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index cf0e8f5c004a..1ed2518c7a6b 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -428,7 +428,7 @@ u32 vfe_hw_version(struct vfe_device *vfe)
>   	u32 rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
>   	u32 step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
>   
> -	dev_info(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
> +	dev_dbg(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
>   		 vfe->id, gen, rev, step);
>   
>   	return hw_version;

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

