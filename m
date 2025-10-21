Return-Path: <linux-media+bounces-45119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8C6BF5BA5
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 12:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2DCEE4E9542
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 10:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A2332038D;
	Tue, 21 Oct 2025 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MzDE80HF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D3926E6F4
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 10:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761041774; cv=none; b=agpBonJTGQfK3aEStTQQ61OznJIAW0BXFgb3ZsZvn2Aq4y7URWio5LtPKgogemttINzkPrq+7f9nAzV5fBnFQQLXF8k5IEC0XNnQmWYvyOnjYOIhkgk/3dc/B3wQLc57jevduLxtDm7fnh0UhYhHOe/GK0lnCAvySLqZESMhG3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761041774; c=relaxed/simple;
	bh=u/CslD2SYCYgr7s6ZBAC5R5wt+b2li4CXOd52Z7V0DM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W4+MWAk3+JSvEANZU2en8DBzggpqV/WWzSQySY+Xjy5K0SiJg04k4i9WPf+YVH/Yp4eL146q3brrgdkx3ekwsSJ1dnO90QGNSZCXnc4YFBwkny2nXjd9JSgihaQccFrcoD4aa9xxOcU45yxA8Ju/SueBn6uOYH7sgKR+KfyvvuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MzDE80HF; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57e7aae5af9so774363e87.0
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 03:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761041770; x=1761646570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CE8ZJxdULgiVs2no8qL8wlR7lwU+rgbNowUWObie/F8=;
        b=MzDE80HFgju//52fdE0naOV0UTn/HQRhoghhhqtFSCaWZOWkZ0rZmKyH+I4wYFpBrF
         ZXtHxH4ZxTDWKX9XaHUa9V+51a+PeH2mbgspyme1K4+bv+Ep5RC8UaMNF0EPtorAk2Bx
         M9D/nBHYwFg8oQW4KW67ek7pSfcbLf5ZM6QLV0G3BnUw3f8GWWqJqBFOTugBJcPzevBA
         GCpRH81V3HqjjG5/zwtApSJUg9SUYu2lhvUx0PaCYEmh37SK59XAWWYBU5WqmZRMtXN/
         ORuTuRAmZaJjTJ9oxcxpa5EKOwKhzL4ScmkM1W9zkUemOkV+DFwCMwr944OxD8QalftD
         MoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761041770; x=1761646570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CE8ZJxdULgiVs2no8qL8wlR7lwU+rgbNowUWObie/F8=;
        b=gF230WHiynowIx1bFTg1KwrJqivwnMK61NFqySJhTU9UxS8Kg7jf6Gr3Zr1jglmGrD
         JaKl5CAkAfERPE5dPgsZNo+cbIdiOFsHy4ywCUJfelLMk485gEVpmnKVBQrA+INJgt/Y
         +UvHqKcbH+2nD1MUo+soWwcxxkVqBdYTCeYWby1fn6kTLbuMqIYhbgOrVjEqXVhT24OE
         P3ZcuahNByae5HosngCbqoM1DV6pnYXvf2Co3frU18C7Gck1R+jjd24+XvsJI96CP3B3
         ekW21/1QLpeoxNhZVANXJDNNORLi0tQU0X8UtflogSmXX+IaXBMVgb3ghfHXnkmFNCYj
         Vh2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyWw6mHXCVixC5zf3DIllkZRBLhXbour7Y1qD2ZXcLrJ9XGbbYhHeMZjc5NDYtZyl6TLBKdwowPFfxbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJqWWSSwVvu4EMwIpLrkYolYJ2V1NtjXSN7qowWZyo+hTYlgJ/
	Dpha9RoHx2vs//5QdMk3Jm1w0ufKxpIwT4BoyS/iKTPXdOi2RsPJNgu1GMhuFBV6wWY=
X-Gm-Gg: ASbGncvzbVMkFYYw1XxnQl9GRfpk9CCtz0zkp4S++kOu0BDGQRpcktotcKHi+gaVHLf
	RP16BR44hDa9nRd9/UF8841CRbWtg420EfJ0SSsa31qWFxqUjHpZWX3TfrAgYaTJnV+/GpcziJ8
	FpD/icWGBbUQa2GJuJIewieWvLnnXNK9jBhUSIshRbudH9YV7+aNXqpeYYMtqDc1XzISDr/OtE9
	cFrPEFtShGHall7umSHrJ0y7yuqwIhye6NeKxFBFqclo+0HTCnvnBUuvo1oeIFUAcNtLWoTqnsO
	GYwpBcoPPBt6yIks+JAw0FAWYFkVdg8JkBTh3eY//94fRlzaLTsXLiCzuP5xh+tnOem3nu+M7ef
	Xusbi+BYQaB3XfbLry1csYRmrU5EDY1EtqmVrjaPGI0dWJJuP+slVz+cD0l9Fo4rSLAsAaikiG6
	LGL5hLYRnRXqk2wPanKzxiVxxGTd+Ccir9DFfa8R4SftWcEonqXZwqaTTNCYdwgxxUEg==
X-Google-Smtp-Source: AGHT+IHIG4buxZs2osnY5RcnhjHgKrKobYPfx6MFnDE5w4Wfkd1mzQuOr+0vSK2TSHXuB5C/Vpvz/A==
X-Received: by 2002:a2e:a9a1:0:b0:373:a537:6a2d with SMTP id 38308e7fff4ca-37797698c2amr28696851fa.0.1761041770316;
        Tue, 21 Oct 2025 03:16:10 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a950635csm27817741fa.30.2025.10.21.03.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 03:16:09 -0700 (PDT)
Message-ID: <33d9eaad-1043-4816-9620-d7625556bc65@linaro.org>
Date: Tue, 21 Oct 2025 13:16:09 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: add Samsung S5KJN1 image sensor device
 driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251016020419.2137290-1-vladimir.zapolskiy@linaro.org>
 <20251016020419.2137290-3-vladimir.zapolskiy@linaro.org>
 <aPdRlygxV1TCCUU3@kekkonen.localdomain>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aPdRlygxV1TCCUU3@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 10/21/25 12:25, Sakari Ailus wrote:
> Hi Vladimir,
> 
> On Thu, Oct 16, 2025 at 05:04:19AM +0300, Vladimir Zapolskiy wrote:
>> +	{ S5KJN1_REG_X_ADDR_START,  0x0000 },
>> +	{ S5KJN1_REG_Y_ADDR_START,  0x0000 },
>> +	{ S5KJN1_REG_X_ADDR_END,    0x1fff },
>> +	{ S5KJN1_REG_Y_ADDR_END,    0x181f },
>> +	{ S5KJN1_REG_X_OUTPUT_SIZE, 0x0ff0 },
>> +	{ S5KJN1_REG_Y_OUTPUT_SIZE, 0x0c00 },
>> +	{ CCI_REG16(0x0350), 0x0008 },
>> +	{ CCI_REG16(0x0352), 0x0008 },
>> +	{ CCI_REG16(0x0900), 0x0122 },
>> +	{ CCI_REG16(0x0380), 0x0002 },
>> +	{ CCI_REG16(0x0382), 0x0002 },
>> +	{ CCI_REG16(0x0384), 0x0002 },
>> +	{ CCI_REG16(0x0386), 0x0002 },
>> +	{ CCI_REG16(0x0110), 0x1002 },
>> +	{ CCI_REG16(0x0114), 0x0301 },
>> +	{ CCI_REG16(0x0116), 0x3000 },
>> +
>> +	/* Clock settings */
>> +	{ CCI_REG16(0x0136), 0x1800 },
>> +	{ CCI_REG16(0x013e), 0x0000 },
>> +	{ CCI_REG16(0x0300), 0x0006 },
>> +	{ CCI_REG16(0x0302), 0x0001 },
>> +	{ CCI_REG16(0x0304), 0x0004 },
>> +	{ CCI_REG16(0x0306), 0x008c },
>> +	{ CCI_REG16(0x0308), 0x0008 },
>> +	{ CCI_REG16(0x030a), 0x0001 },
>> +	{ CCI_REG16(0x030c), 0x0000 },
>> +	{ CCI_REG16(0x030e), 0x0004 },
>> +	{ CCI_REG16(0x0310), 0x0092 },
>> +	{ CCI_REG16(0x0312), 0x0000 },
>> +
>> +	{ CCI_REG16(0x080e), 0x0000 },
>> +	{ S5KJN1_REG_VTS,    0x10c0 },
>> +	{ S5KJN1_REG_HTS,    0x1100 },
>> +	{ CCI_REG16(0x0702), 0x0000 },
>> +	{ S5KJN1_REG_EXPOSURE, 0x0100 },
>> +	{ CCI_REG16(0x0200), 0x0100 },
>> +	{ CCI_REG16(0x0d00), 0x0101 },
>> +	{ CCI_REG16(0x0d02), 0x0101 },
>> +	{ CCI_REG16(0x0d04), 0x0102 },
>> +	{ CCI_REG16(0x6226), 0x0000 },
>> +	{ CCI_REG16(0x0816), 0x1c00 },
> 
> This looks interestingly CCS compliant. It might be worth taking the MSRs
> and trying with the CCS driver.

The register map is similar to CCS (and it's explicitly mentioned in a comment
withing the driver), but it is not compatible due to a known number of
registers, for instance 0x0310 register is not a CCS_R_PLL_MODE, but a PLL
setting etc.

The same reasoning is applicable to the second sensor driver Samsung S5K3M5,
moreover even these two sensors have different interfaces to registers,
e.g. it's not possible to separately configure HLIP/VFLIP settings for the
latter one, while it's working nicely, and even a "stream on" control bit
in 0x100 (CCS_R_MODE_SELECT) register are different...

So, I believe it would be more tedious and unclean to add a number of
exceptions to the CSS driver rather than to add a sensor specific driver.

> Where is this sensor found?
> 

For a while I work on Qualcomm ISP support, and these Samsung sensors are
found on SM8x50-HDK and SM8x50-QRD boards:

https://lore.kernel.org/linux-arm-msm/20251013235500.1883847-1-vladimir.zapolskiy@linaro.org/

If you ask about the downstream code, there is a multitude of downstream
Android drivers of these Samsung sensors found on github.com, the init
sequence for modes is taken from these drivers and the driver is tested
on the boards in my access.

-- 
Best wishes,
Vladimir

