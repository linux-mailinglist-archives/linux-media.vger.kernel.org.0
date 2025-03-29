Return-Path: <linux-media+bounces-28965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FFCA753D5
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 02:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08DCA3B604D
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 01:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A599517BA5;
	Sat, 29 Mar 2025 01:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X535yHZn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506E936B
	for <linux-media@vger.kernel.org>; Sat, 29 Mar 2025 01:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743211127; cv=none; b=uAoORb0z5LIwhmZGaB4K6uVpo7YPNOD4IDghTxtkb4+ZQwxHLeECKyaog6uky+dVnaOhaUTWBPbHnFgYpUlkIeS/SRo3J4PoJuQzObHE+RBICxd9V02CQOQKx4I0WlWeQSVOCZfxogLXLXhRPtGSb+iJkpmb7TnVNTd+V08Wto4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743211127; c=relaxed/simple;
	bh=B6WXFv42WibloTinEG3stIHOn2nFdQfJskknML+aNxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZdHsK/3VH8U4kNEK094pBhMtOW3pZt6hahQFv8O/LTiuKKVtRkKnB0WV51gnpKdyRXBVcirMIY9v7fqz/RA+SryoPwfMV+w6+WSikWFyBc9zh8qE1PwAjVQb+HFX8OhziYK/3v7TsnZxNyhJmXrwAiCXTGROTfFRfBK5VEwYEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X535yHZn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-399749152b4so932641f8f.3
        for <linux-media@vger.kernel.org>; Fri, 28 Mar 2025 18:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743211122; x=1743815922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rpne36gCiaUf/vOcHEmQCMmIt/bPKT4qWHgc4yEtsfA=;
        b=X535yHZnjDUOa4beakAT6hhV9jRva/k7GCoMpmIwoHgGSZJX1MtSg6RKRXjzXyOcrM
         FHh48ol0DBcStf06WfxlVuAIgsXVNWKZVPhRn0JqA8wJWCuPhYhRFe7KfMScZojUvO3J
         RgaE9CttjtLGXOWwZGXO396neipjCWfZWY8biTZ18x6fTnGG74NprPB4qdxAeBMkOr5R
         48lPCXrACiV5S5+zYwevL3QqSZd/S2nKMC6pG2/XEHnuKyWGpLMRnNp1Mlur3fz9OY4K
         2wyKLrhF987HdsHNDWlurwduNtjXCzdrtD6w8sy/E40bus2pRgFLhD7b4isSlL8VSzJo
         nd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743211122; x=1743815922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rpne36gCiaUf/vOcHEmQCMmIt/bPKT4qWHgc4yEtsfA=;
        b=QBGyJHGBrhkBlL4X9JrBh2WywlU9RewReS3YGBpOIX22QRuGArN6+kshNf0aFcwQC3
         foihSmBXA630aEPg+FH3B7bz0ERRpc3x/nsiQab+HYaW2o+7MFrLkqGTJTvX6RpN+MF5
         OGQI+uhZ/ph84lidHj8+92NiWOOUuJBpIeXOLCoBOy9UgFVPboJU5W9bsJriSZvb6ERo
         3GIBUJgC9Jp/XjB+emjuIylFcz4kgCL/if4BW+75kpfFVtGpCQutSsG/YeElVj7CZA9h
         r7SmunovLEUX0xob1Qr+jeTVJ7voOvFwtAMIHRFL/PUPO7lgyhKPtMSw6s6nDz0G9ARe
         3JyA==
X-Gm-Message-State: AOJu0YwPeZ9o/VWio+ZLjq1s4xulgIr2Y3ToJ4Ct03vmlo5mCzddFMO/
	K0u73awgIOHqjZ3InwDhmXXPOzf5gv+xTxOt6Mz4a6euRLumwhJwG+HMvbYZIls=
X-Gm-Gg: ASbGncsAZ4xNQPK4y9klDCwT6jHl1g0XbRHxofFktyydl7I4boJTsAwWZo8EIVf6X8e
	13vbZKMRAsIDJApudPLNSL+3M3yLyrIjEFbURTY+gsnSkckMrI3V9Vsr7xjCrzb2FjSjdbBvVNq
	DNpsPWg+FiqHjWm/3nJ0jIbAG9LbzKZ+s1ygLj6M7z+88KfXeaZxZWScOu0oiUyWT2UdbsJTamG
	s5spBATOFR3kZ9aCqjHkhoVwmmJpWeNdv0u8i2xEPHCZIGuEmZP+GD0zz3FwAVgslOUb1cuFrzH
	c96+tTa4Odm63kiOTG26ldtVPo8IoDZRIuD3Yh+Im4vjiriPhqijS7A0+FatrtyPWRgnlu3ep7m
	EvgciDYKosw==
X-Google-Smtp-Source: AGHT+IGgq3lN2khHUfxvzTLLGRHiPLTs5+vkkxGV/MOmv/iCHJ4zdsJUQ6EeZEdYriKuTFWbLbYrNg==
X-Received: by 2002:a05:6000:40cd:b0:38f:38eb:fcfc with SMTP id ffacd0b85a97d-39c120ca794mr739070f8f.7.1743211122572;
        Fri, 28 Mar 2025 18:18:42 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b662c11sm4252858f8f.31.2025.03.28.18.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 18:18:41 -0700 (PDT)
Message-ID: <fef11ce6-b3b6-4677-9387-13332b9a9d43@linaro.org>
Date: Sat, 29 Mar 2025 01:18:39 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: Add OV05C10 camera sensor driver
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
 krzk@kernel.org, dan.carpenter@linaro.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, Venkata Narendra Kumar Gutta <vengutta@amd.com>
References: <MhUYQD7uWnfZQAPq7VslFWPHOmx2B2UfAIpbMhLq1-7GC_i5bI2hhns_-ov_AAVpEH_VmDDFYkS5aOKBwnY61g==@protonmail.internalid>
 <20250328214706.1516566-1-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250328214706.1516566-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/03/2025 21:42, Pratap Nirujogi wrote:
> From: Bin Du <Bin.Du@amd.com>

> +static const struct i2c_device_id ov05c10_id[] = {
> +	{"ov05c10", 0 },
> +	{ }
> +};

There's an IPU6/IPU7 version of this driver.

https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov05c10.c

Perhaps you could import the Intel ACPI name contained in there too.

> +
> +MODULE_DEVICE_TABLE(i2c, ov05c10_id);
> +
> +static struct i2c_driver ov05c10_i2c_driver = {
> +	.driver = {
> +		.name = DRV_NAME,
> +		.pm = pm_ptr(&ov05c10_pm_ops),
> +	},
> +	.id_table = ov05c10_id,
> +	.probe = ov05c10_probe,
> +	.remove = ov05c10_remove,
> +};
> +
> +module_i2c_driver(ov05c10_i2c_driver);
> +
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
> +MODULE_DESCRIPTION("OmniVision OV05C1010 sensor driver");
> +MODULE_LICENSE("GPL v2");

Why v2 ? Checkpatch will complain about v2 and BTW the IPU6 driver above 
is GPL not GPL v2.

---
bod

