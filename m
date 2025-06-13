Return-Path: <linux-media+bounces-34713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ADAAD8569
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 10:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B33218968F8
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 08:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4DF26B77B;
	Fri, 13 Jun 2025 08:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bF7mysxU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD2324DCE8
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 08:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803013; cv=none; b=K5ysbpfWzhXq0tV84Gnurgm/merQKSse/p3hFJW0xfGA2iO/9fF4OaLKUlzGvjA18vhhBn0ap89p6Y0jn6yLGOVKISiK1cQtZTIsKnNnDm0JNLMwtWBU6gi4ppORjEfLYRt98A/tWe8s363HVEAQiEhxp9VBgyfYZ5P9nepiLlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803013; c=relaxed/simple;
	bh=IKdAWnzwfFWyOXdX+1G6U0sXevLYVYDKwcZ5PhqJDyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p1Hsot2ABoez4bjIgtkT1r1VLuDrRDDMYjxJNUOZs4ToL9CJH3mfwyL209rwKGDE12PdZyGHPMnva6ebHjXLgyHYrCRIJPa98hs1qv/OXZ2O5r41CEBjCWqNeFQw5WXFqnqLpMnNkQ/naOvGWN2F5yLPbT6Q6DoSUZMy1uDUx9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bF7mysxU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so12274715e9.2
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 01:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749803009; x=1750407809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SL0zV9DuqfcJBeCX55h9Xj8eRYlqXWH7BtBGhKU/pUE=;
        b=bF7mysxUx3VkkxE/cmqT1kQK2UvZAsOeApL2QkSQ/zyeniAlPASIgwaE8nS8V/tRmP
         kaezQ+xYct5YBbqIjiG2Xb01oTD1n43s92t1XKWD/ctOTQIeSTsMU186BpN2TM9ipXaG
         EeQlBNFDijqE8gPrVo6Wky2HJULqnTPUz2ASr0xD+dEMeh5jXGAFessr7VwoUNno9GA4
         E4M6zL3aONwrbmugmz3UpPpTQDUw0SVN3nRX8V2MfLVIAOfyQCD6WJrJd7Bgnckm9+lV
         crqOLFecAnLezJBxNW3jXIOlB0oxnWAMqpcZUPu4X6Ulgn+miDgXfEIPw066g98elq34
         GPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749803009; x=1750407809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SL0zV9DuqfcJBeCX55h9Xj8eRYlqXWH7BtBGhKU/pUE=;
        b=qvEmzmsPlktAdyFi1LbMk+S1XT1gpDfTTIolj5R57lSuOJpNYgYS2+3VObooSExLlD
         rdD6fR+v3F9W/wpNzV/OMAwDj+eMsJAWjh/1CSatyrtACIMXDiBeAKEOp6pXlb79FdXZ
         Alz6zOxdSPwWbgaljGYikFCdcR3ppGIZMnti9zqaS0lL/PZKVNXZ//ZFZ1sUcXH8C3KN
         eKJGCFPrk6SwU7umTcm+ep+xXdjnbpisfsIcE8SN41OqGaU0UCv78OCaRRXb9+UGTAg9
         JjXS7MgOlbj78toGdSSqsOZ5XuIRTzuo2rFZ8jRaIHlNzNlgIMf+urJke3gkqF59t3yQ
         wzWA==
X-Forwarded-Encrypted: i=1; AJvYcCVGPhmHkvHoJiaZrydkt7vlw53PZaPS8PVuv8yc2vn12CD5yqyHsw2aNoxizJbXqHjSEzY9Do4XQtVdYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9CRbyaDoivJnItIJn+tLAF3uuyKNP77cMD0Bvcsdblk7vrcsU
	JkvY0/6aI6O04w5MY7Xp2pgFO0WfE4DWjs3KjldbMsDTKGpmHV2UBPvDbPqf8Ea2jBw=
X-Gm-Gg: ASbGncvJFTXWpv4TJbmm3HKEswZnm/V6Bf0s3oXHs9z88Uiuh13jPOfY4ZRtLa0ZHTY
	QesMOexp8tsnkYpjNOCTvlSMRFRSTofJ2udhzOaBobSoR3aN61G5P07dbTY324dlmixx13nmKzL
	+52waEuidcMH+CWg/udp8+cV9ezFbjIcOgIarCDC9+1brDoldxh1zb0DAQT7fUQic1TDQ5V2Xed
	Sz4LeL4RiHd4SJfORmA6kCbrViuEtXsXpXqMIZ67zCg2bn5an2H+PbdnOu0fz7vVHibN0ddITHt
	GQWwbsjy4guX9hWYb/ktC7uXC7lMHhijmYrb6ANjP0OMJegAl5YTEJF9AnbtxSeH6LObXM+irez
	D0FDdlD+WzL3lzrRIPtQmZKpFr7A=
X-Google-Smtp-Source: AGHT+IGNHdTsjLgwG/C438NLrGIbJka/L3CLjJ8ARU7Rx01chsRF11AsJfB2bRKuYUGzbEuQNFsylw==
X-Received: by 2002:a05:600c:5395:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-45334b06b56mr20467385e9.31.1749803009292;
        Fri, 13 Jun 2025 01:23:29 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4531ff595b7sm64979825e9.2.2025.06.13.01.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 01:23:28 -0700 (PDT)
Message-ID: <830b7ce4-69f6-4200-b4b5-0e9abfe3600b@linaro.org>
Date: Fri, 13 Jun 2025 09:23:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] media: dt-bindings: Add qcom,qcm2290-camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
 <20250423072044.234024-6-loic.poulain@oss.qualcomm.com>
 <20250424-versatile-brown-chowchow-dfc4a9@kuoka>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250424-versatile-brown-chowchow-dfc4a9@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 08:37, Krzysztof Kozlowski wrote:
> On Wed, Apr 23, 2025 at 09:20:43AM GMT, Loic Poulain wrote:
>> +  power-domains:
>> +    items:
>> +      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
>> +
>> +  vdda-csiphy-1p2-supply:
>> +    description:
>> +      Phandle to a 1.2V regulator supply to CSI PHYs.
>> +
>> +  vdda-pll-1p8-supply:
> 
> 
> How are the pins or input supplies called?
> 
> Before sending new version, allow people to actually finish ongoing
> discussion.
> 
> Best regards,
> Krzysztof
> 

@Loic

Could you do a v5 of this series with the voltage supply rails 
consistent with:

commit 2ab7f87a7f4bf392e3836a2600f115a1baa1415c
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Fri Mar 14 13:14:00 2025 +0000

     dt-bindings: media: Add qcom,x1e80100-camss


I don't think it is reasonable to gate your submission on a PHY rewrite 
for another number of kernel releases. We've been doing voltage rails 
like this for > 10 years we can loop back and do improvements to expand 
when the code for that is merged.

Seems unreasonable to gate new SoCs in the meantime, so if you have the 
time for this update, I think the rest of your series is ready for merge.

Merci beaucoup.

---
bod

