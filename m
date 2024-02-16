Return-Path: <linux-media+bounces-5249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8154685791D
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 10:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A67D31C21724
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 09:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C8D1BDE7;
	Fri, 16 Feb 2024 09:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LnTfHmA8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A5C1C29B
	for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708076586; cv=none; b=TVhjSgfMzia3PCw2go3AmEI49ZVOZJKZqwAGc8BA0uRSFdmlMk/3oZ4XB6fHza24y+mwkt/fh/m8bcJ8zEC7ePvvHsHa+qi+ViHWX2SlsxxiYS4CMXqkG+Xivd9GcA8mxgg+GDwJNqXMXhAzDpftYlJuXmjKhf9A78vcVNoORr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708076586; c=relaxed/simple;
	bh=erJbXgT6svUzCFGLPxEPNcIji7DFpwP5TtlqCfzm5O8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LeBeG5ZRTCiN1XJNbIDNIINUMfnwrU0cRgdVd8idnBRZl0KBYomfAE4i7wO17eoWEtSff3+NXIAHR0miAOo7mSsg3dYy8qUqWM+CpA0YrkaAhY5BcmW1UnliWs1VSGWC9H0uAdHwqwDPQTluWgBI2tpnGY6mUiUh7DZjFcXAR3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LnTfHmA8; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3566c0309fso219309566b.1
        for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 01:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708076582; x=1708681382; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=50f7zKmZnRI9LrVHCKInlnIFfogg3BhO8mJWvUu8tZs=;
        b=LnTfHmA8v5elccLMuK1io6WFMXhUNhTl5Z8kRNjwh4e1UalYqlLuccT7x2o098cC2o
         D6fUULVTiRSRi5PgsxZDYQO5CwWE0v7jWQ2pAJiSoUwPi8YpiBd3Td0OtDG31VWeXy5z
         6SW/Fef+czcSVvrt/6o1RfMuPlhi/UPPNm3HtJ/FM8tOBktD6P0vyO9n8K6TWV/eCuDp
         Kax2tqwbAOcZEyVKTgp3dy8693eI3U6dpJ0QmdEEinpCTFRsGaXi5nrECnIVheiP8DSC
         p5XsPZGQQzY+wqHow7C6jDGRuIXJd5sMtdQJVrZfxrAYKPaCOLuTzNzcE7zS3Vo+jwrs
         SQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708076582; x=1708681382;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=50f7zKmZnRI9LrVHCKInlnIFfogg3BhO8mJWvUu8tZs=;
        b=t9dxRk87qjKtKP4+NH6XN/PbS6SYcRaJePOnv//C8eDKqj/4AEChP948U3iJq/9AR2
         8AmcfA61apDPrwYiGd3F+msRfZ8FYsScq8EtSnI5J5Hx2Y2W/fAmP4iufc5uMBpYZCgm
         BVt0LiqD8Vl3Aqji9fz/QQDnP0tyFI03VrkPz5gw1Q1sQTObIDFJDoOxQMY4KgM2Uunx
         deYuh9mRD0O0yR9mkYBR9UIcISIys/CtXGktOuqjkK8AAhSe4KPgHA2EnNzQLmV8BsXR
         dyHSzEFBVDrGqV+5rwXTu0ceJEFC4gN61pCmEPq0OSPTFyXm663MPwsVf/cS4uYfwZmd
         vLTw==
X-Forwarded-Encrypted: i=1; AJvYcCV8Los9hQVJsoGZk5+4DhCEAhjEcYsOY7icSzLLKij73U8dZWBV4pxhjdvfw/k+Bld4udAFGV1e3SbzQaSjg20S/QQJG+o0AkLJu1Q=
X-Gm-Message-State: AOJu0Yx154rgaYRXtGFR+I5joJ0Sr8lqnnlOruwd7TAxNW/ylDerW2tt
	SfBAnIVnOSGGXlRHmcygRfLqvQNivt7L+aTqf3R23OXV+IOQGg/0qmjtDhDW7Ws=
X-Google-Smtp-Source: AGHT+IE1PPpt5WXjLMqsV+j10ORMRQbg86LRvVNhA6Wu9P6fc3uH1nDSTRPe/hwaqeL9gfQQqKyPDA==
X-Received: by 2002:a17:906:9a8d:b0:a3d:5db0:120d with SMTP id ag13-20020a1709069a8d00b00a3d5db0120dmr3006253ejc.23.1708076582527;
        Fri, 16 Feb 2024 01:43:02 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id br21-20020a170906d15500b00a3d64b37a35sm1380977ejb.137.2024.02.16.01.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 01:43:02 -0800 (PST)
Message-ID: <df33fe7c-8732-4e30-8e9e-0c74252c8c76@linaro.org>
Date: Fri, 16 Feb 2024 10:43:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] media: dt-bindings: Add Chameleon v3 framebuffer
Content-Language: en-US
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>,
 Rob Herring <robh@kernel.org>
Cc: chromeos-krk-upstreaming@google.com, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, hverkuil-cisco@xs4all.nl,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mchehab@kernel.org, ribalda@chromium.org, robh+dt@kernel.org,
 mripard@kernel.org, airlied@gmail.com, linux-media@vger.kernel.org,
 akpm@linux-foundation.org, dinguyen@kernel.org, devicetree@vger.kernel.org,
 daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <20240212131323.2162161-1-panikiel@google.com>
 <20240212131323.2162161-8-panikiel@google.com>
 <170774854498.294434.14234480400138512065.robh@kernel.org>
 <CAM5zL5qx1sw=NSWE7gv3E80MCMJ4=tvc44WDAnBrfsJ2qQB3iw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAM5zL5qx1sw=NSWE7gv3E80MCMJ4=tvc44WDAnBrfsJ2qQB3iw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/02/2024 16:51, Paweł Anikiel wrote:
>>
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit after running the above command yourself. Note
>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>> your schema. However, it must be unset to test all examples with your schema.
>>
> 
> I was missing a '#include
> <dt-bindings/interrupt-controller/arm-gic.h>' in the dt binding
> example. I ran dt_binding_check after adding it and it reports no
> errors. I will include the fix in v2.

Please test the patch before sending...

Best regards,
Krzysztof


