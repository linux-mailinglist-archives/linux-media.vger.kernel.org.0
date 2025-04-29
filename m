Return-Path: <linux-media+bounces-31268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EEBAA065C
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 10:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 843CF3B1432
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 08:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB1E3A8C1;
	Tue, 29 Apr 2025 08:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TgUiQqKP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1F91F0E58
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 08:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916972; cv=none; b=cFB3pfBGY17EgHY1m8kaQK0ADj35NhalcTYW19BA6+Shb9oef3bTRGfZtec2KIX/xbwQq8gkT45XUw4Nb47ksXlH7E1+n7uxVKSZFocGCVztbdvX8IZBLhGCuQkpeCUIp8Hau8fQz8XLnltUcJF0TfYBJZOMJorH2MppVz8LX1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916972; c=relaxed/simple;
	bh=VGSUv8IMyo/+7FSfMQ/md9GZ5yAXlVyAihHwpi/VFmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K4rpL3e5SXHu0pf3UZBHRe0CTpuSEYSrhXg8cPue5zGCEvbe2MsdohOf/P7Kytr5NTqSwXdr5o1+YA3sBkCfLqzH9AmHJt866vNeoGXUCQ3lQpIxNUux0zUsaaEmpmyMp43mATa7D07CWMbm4K2deYzYHxZZGsaWZZfQBsRONnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TgUiQqKP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso54233525e9.1
        for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 01:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916969; x=1746521769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L6o5hjRp85UWQQXUadf5ZOJK128HUInGP2DlPSifNAY=;
        b=TgUiQqKP5EVuFvI1+LcIgfzCNwD3zeWj4PrVF6Zi5u+evH0qpv2+9l8+5BZ/C0+goC
         D5cx9fl8eUxrG1JXAkF6Cyw7P9m8Q583Q6q6h0HCT7yD1mdJFBRHDfcJyNow4MxYvmqu
         akDXmWuDQSg9KoI/f5vLV/5bLHY+O2NyLBDMHEzl1qJhjkp0ftcl8iI7yKhwTAb6aIf0
         dipea8PMzBoDnkIJ8zwV2bmfRbktCrjoMnxvBJrXoizOkCi0stxP31nXDHfr9pwr8o8N
         9JEptMrwziCLUxD7UY3G2UwPOK+iqT933BrsAdjFWOMhIhKBy6riekX6xY6aymqWGq9B
         3D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916969; x=1746521769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L6o5hjRp85UWQQXUadf5ZOJK128HUInGP2DlPSifNAY=;
        b=Y7nCumlfIm9k4RYZ0jQvUnCV+MZJ2JexP5DWxkQswsz1rDO22rbWk0qSfUmOMwPYrO
         Lc+AUPCdgQRSpN/urIalD3OUwURzjO74AODyY+LE3pJQtnEqP0F88t+fs4BPen7r707o
         f4/CwQsOOuthPUDSU/bzDBkjRnOw4eBI2oU2xJVYGMmb9qh5KNuPFPamBl4hJl3OzvQ9
         JmVGRl72ARJ2I59bNQzzhHKdqcGjh87OE0/4zT8X5lYckFhJ4fEQnxPYyVBy2M4Pl3y3
         amcD9ry5S4Ap7OE6ayIR5HLwDa04Czbkq5/JyP762TXjUb7/UhHK4n6VLg4+9s4kAxen
         WSlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPuAAmRMUllnPQot203009j56lbqZTtC8Pr3wMUYusrr7nfcOexn6uXqgOIaNBTyTL7AM/oqHegEku8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3R6D1aWgpq9GyKGYawZYylcR+MoVv9og6Az4HRg1DQpUoiMkt
	tZd3QjhEQFJurW7ExmXhn0k4r1y9c2eSPuFU4Wv8XUleEoaOh74eXC6cwdzGbGM=
X-Gm-Gg: ASbGnct+kgvUCHUXZFMyCDFhwNzNYKiqD8qtIgy22GbhSLUgG+NSHptHfqggo4A/ODw
	xdku2IypjCQ4c7NPd/lWoQeEv1Lb9iZTlKlGyJat8wHq48DPLRjVEB792BQ5Qxzo5+c4B5wcJjA
	w40bgKG5hd5N6tbPwKc14+EqBjx9Z8kFnYZwYheT+WQrJGUguOeC0iop4kqcDYnAIFftqTFnJuU
	DgRvCSVIFcTfPWdT+EbYEGFBvDU/N/4TT5wndqEktwjnpo+fTfb1OqHWJsN4ZYk32XRDIWVT3uj
	vDKKhjwF/ydbouL/5/MW/XQH4YLwp2rD/nZHwWjOXXmXdjAJoiz8dkPdqAGlgjiYTmIoIbZaBGF
	20NdTSw==
X-Google-Smtp-Source: AGHT+IH9rqlanYRLVoejNADUZZK2BCLrA1vTjyKXJPEFx5S8Ym0qtiNw8zpAkebHLPNFkECSALlAsQ==
X-Received: by 2002:a05:600c:3c86:b0:43e:ee80:c233 with SMTP id 5b1f17b1804b1-441ac8915ebmr16226495e9.32.1745916969184;
        Tue, 29 Apr 2025 01:56:09 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbe386sm13143769f8f.42.2025.04.29.01.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 01:56:08 -0700 (PDT)
Message-ID: <0b2c5b93-15f1-4d44-a524-bd444cebf377@linaro.org>
Date: Tue, 29 Apr 2025 09:56:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Add OminiVision 0V02C10
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bryan O'Donoghue <bod@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250426-b4-sailusfor-6-16-1-5-signed-ov02c10-yaml-v1-1-9a46124fae7b@linaro.org>
 <20250428-spry-mustard-flamingo-78ef4d@kuoka>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250428-spry-mustard-flamingo-78ef4d@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/04/2025 09:38, Krzysztof Kozlowski wrote:
> On Sat, Apr 26, 2025 at 11:35:21PM GMT, Bryan O'Donoghue wrote:
>> Extend the ov02e10 bindings yaml to describe the ov02c10 sensor which has
>> the same bindings with a different compat string and different i2c
>> address only.
>>
>> Other differences in sensor capabilities exist but are not expressed in
>> devicetree.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>> I previously submitted a standalone ov02c10 yaml file but, it was pointed
>> out to me by Krzysztof that the ov02e10 yaml has exactly the same bindings
>> and we should therefore extend the ov02e10 yaml.
>>
>> Link: https://lore.kernel.org/linux-media/da93bf6c-b4bc-4c4f-9373-583fbd0c031c@kernel.org/
>>
>> The accompanying patch:
>>
>> - Updates the overall description to differentiate between the two sensors
>> - Adds ovti,ov02c10 compat string
>> - Adds an example for the ov02c10
>>
>> Once merged we can also merge the ov02c10 driver, which contains a compat
>> string requiring yaml description as precursor to merge.
>> ---
>>   .../bindings/media/i2c/ovti,ov02e10.yaml           | 47 ++++++++++++++++++++--
>>   1 file changed, 43 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
> 
> There is no such file in recent next (0424) and no dependencies
> mentioned, so I cannot verify and I just assume that below:
> 
>> +        ov02c10: camera@36 {
> 
> makes sense and you are not duplicating I2C address on the same bus.
> 
> You should document the dependencies.
> 
> Best regards,
> Krzysztof
> 

Queued here

https://git.linuxtv.org/sailus/media_tree.git/commit/?h=devel&id=7db2f2a8e6c51f65a099c40a7b580566ac44c805

---
bod

