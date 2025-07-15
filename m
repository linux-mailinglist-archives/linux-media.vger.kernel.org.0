Return-Path: <linux-media+bounces-37758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 820D2B05587
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 10:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83D444A59E0
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 08:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E652D375C;
	Tue, 15 Jul 2025 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T8ilJksX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8E9D2FB
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752569638; cv=none; b=dVPr9Pc6mSrrhebPXl1YxBJsq7zsM24X3ecUFZ7rYgGuDSS6K2/VUJ/cIDf9Xi0l7+ON3quWvYBCNyZ6L5hZ0X0XtCq7ZIwlcZovhevlAoN0jPQPJZ9qEYAZTIoJS5WGNQ4TkxhqCBdWSCKMovG1GUj8N3IdlzEMaOYy4Mgb/0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752569638; c=relaxed/simple;
	bh=KFuz5uXK3g7i7vsp7oXRs007hSrwVTZk7mEvE08DGwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OiZKmrOu6z2d264SodH/ABNOsWEmZTfOAPrL3Ts669bcDx4oHrDXLDuOMSGPEbl3OzwwyqoO7FTtIyPOIz7R6PpKRlSxVdJ8g87xQjQQD6bo3TWiVnD1479cvCebujtrP+6Nhr+2ZEobwl1mCQh+rxf3UMETmDlya6c0ILUZzAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T8ilJksX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4535fc0485dso6642725e9.0
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 01:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752569635; x=1753174435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Inio5hItYIE7Gfl8ekEhk3c3MGH8gDi+Zkltf8koQq0=;
        b=T8ilJksXUUr8rvN2YhMO3Vd3sxmkP2zOfSdouS0+1EGZY9ATSSw61vI6jqqgfMSAh8
         RqQk2Z76ob5YRaMRCDyS3EY1YcxKcwBu1VYhcWpjNNXNHvHUG3bR67wH6d0B09uMDgpF
         Z+HI0vd74PCd/hyui3LlhHHP6Hrp064jlkYOU9rpBLMkU61BrIvjZLrPaNgy1/eUMP1e
         FIX2yaN0Zg94ALkEkyuVvvOwKqs90cgzWimGArhXo+8Hqown20nDbjmRNemyCyNtQTTT
         hz132oPAOleg9Ms0DoG22UGlCss4R/lsoTeg9npmONaDVePp48rlqo+/zKF/USwbPwes
         6z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752569635; x=1753174435;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Inio5hItYIE7Gfl8ekEhk3c3MGH8gDi+Zkltf8koQq0=;
        b=MrQhGnC1yaYAuqYb+Ywkj3e+IhvOqPg+5VuNYPnpYxR6pvtnBqdkshQawsop2Mslsl
         SJbN3OqEMV1aezs0QnpPJ9/F6rUL+UJE3KCTZy8ddlblImMkg1tZRH8GAAdWe2Ta1fCp
         CWXGqs7Fmckufa1W5HqZ9B88rVLUdAH5aAQkHkjy4Oyn6EpsdK9zlNpV3QKIit9qozT5
         Z1ItY2U8KwVcd6G1EoGgE34GRbkIdNgX+9hr13+Jofr9iPoKG0V5pIWN3p6lMLPCv0Dt
         fATrWxQ+yc0YgLZWu4IvKS+GLO0mFKNlZ0tk8EtH7YEGG4WtTjBb5Njp9fwQRgAxalXD
         b6Ow==
X-Gm-Message-State: AOJu0YzaSrWmXfWt7uHvuRCXex2g/GPmlXoCsD5zmpSTUpkIu5+gj9bG
	rkoJwLXZnnqiH8Ao1QIZ2nkhC1wNfyUc2IzdHUDun6oBzRrLoH+cllE3ePgHGiM+jUw=
X-Gm-Gg: ASbGncvhB3vutr4uUcYrMQ5Sr52aKUQw5+LVyRjMdLgJvcfNPdeB436axob/CJM3HLN
	ANdcsIAcBYP+Ikz4SlGYrgRpv7w9e/QLfKOSq3QbzqxFLER4dH4it83fCnIww5Wx4Ttnpn56ysL
	Ol6ljn30InCgyac4PklDWgBOKaTpDHfDKWXksZx25RohOODkFJB8Ywux6MzsaLzvhP+m8UnjOHl
	u3+2cW3Qc21ZJZ2RB5MZmdIpiDvUof4PsRGPdL53uwv3GAd9kP1vjP9DeZQnLrp8N6APkCWfd1g
	TyEa1/hXS6NN2/H7htKydZpKa3TMxRLUMfZ6BJlWTmF5/nBTEnlKWjlJa2iFpkrA/LW12AyrUFF
	vUsGxh0M69vIZyXHqi13BMQw5JWOQGseoPoKB9Wa66A==
X-Google-Smtp-Source: AGHT+IGGFf611I4xGD+mAyQMZaK74muYs6u8nJ4rajE19UqGLjgCRcydVsweJTptw446w0tSfdYTpA==
X-Received: by 2002:a05:600c:3d94:b0:442:e0e0:24d with SMTP id 5b1f17b1804b1-456291af6e6mr3125305e9.7.1752569634736;
        Tue, 15 Jul 2025 01:53:54 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4560c50b7b4sm93657195e9.25.2025.07.15.01.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 01:53:54 -0700 (PDT)
Message-ID: <aae14c58-cf11-45a2-b036-96ce02eb9648@linaro.org>
Date: Tue, 15 Jul 2025 10:53:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/19] dt-bindings: media: Add bindings for ARM
 mali-c55
To: Dan Scally <dan.scally@ideasonboard.com>, Rob Herring <robh@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
 jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
 <20250714-c55-v11-7-bc20e460e42a@ideasonboard.com>
 <20250714212510.GA3193902-robh@kernel.org>
 <f81e4f88-3fb5-4ae6-a861-08ec7f44c990@ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <f81e4f88-3fb5-4ae6-a861-08ec7f44c990@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/07/2025 08:28, Dan Scally wrote:
> 
> On 14/07/2025 22:25, Rob Herring wrote:
>> On Mon, Jul 14, 2025 at 04:06:33PM +0100, Daniel Scally wrote:
>>> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
>>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
>>> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>> ---
>>> Changes in v11:
>>>
>>> 	- Dropped in arm,inline_mode property. This is now identical to the
>>> 	  reviewed version 8, so I have kept the tags on there.
>> [...]
>>
>>> +  arm,inline_mode:
>>> +    description:
>>> +      The ISP can be either electrically connected to sensor and CSI-2 receiver
>>> +      or driven through a DMA input device. This property declares the ISP as
>>> +      being electrically connected to the source of image data.
>>> +    type: boolean
>> Except you didn't drop it.
> 
> 
> Argh, how did I miss that. Sorry (and sorry Krzysztof too!). Thanks for the heads up...I'll re-send 
> this patch.

No worries, happens. I appreciate the work.

Best regards,
Krzysztof

