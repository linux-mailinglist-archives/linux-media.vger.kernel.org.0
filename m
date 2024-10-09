Return-Path: <linux-media+bounces-19322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC01A996B4F
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 15:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A455928A36C
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 13:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BFF1957E4;
	Wed,  9 Oct 2024 13:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KGo/OZ7C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917E3194C9E
	for <linux-media@vger.kernel.org>; Wed,  9 Oct 2024 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728478973; cv=none; b=I6DMkceF/ZfiwcDyAWYsdzptfMgkB44YF3a52/VmgHbxith2+u6Fz8wtXYd4C6H5tcsh7Phb3My7aqxzGvPJBLudrXs0dBWPPlEVROSm7lH+cn4ao/tQbA7xErMci34wR0keqWZZGFlmHEMdkiH5n6MuboZVIDtAUUQCXMoP4fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728478973; c=relaxed/simple;
	bh=GjnPV5sOZgTZMm2KQG/PI/BeyRDCSFbmBjidp8mCRPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lTA0FlCeC4ShcCxOEplHkekxfnrgXDhUXCpPBq/ewzP8KT3nUNIo7t4xl8v1rmmo0UhDkJAFefxX+Fk5yC5K62RPmZFGhY0m5jP+AbYysjQUTN4wsZuQUG2MVFWXu1HEeLtBOzxrgycYoGqTriHPPBXG4WC+xKObUYZcZQa5IZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KGo/OZ7C; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fac47f0b1aso80874701fa.1
        for <linux-media@vger.kernel.org>; Wed, 09 Oct 2024 06:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728478970; x=1729083770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XQ4P68ZRxv+hHVO0lABXJo+8ycp2fDd9E94BHF6XTqI=;
        b=KGo/OZ7CeSkYNepRjkbja0zq7ynXI/m82wP2RCVicKaN3jIUkehf2Cw8AqOiqOW7ja
         b1+nTpNCYkCvkim+AB0qAy5qaCkXGzX8eeWWdkWeNSc8Q8tbiCN06pS+QXXTyepLwHu2
         WqL5zhbb0/d5NtEi+HLRoIbU/dqq8UHAFeL4HDpvrsUGWHtV6oV66jWzUwPTd4bWzz17
         uAsyb3y+rY1lF/0r2sIQwEd8sqpdyMOKQ79dG0PK9rMoan/QkPFuSF35D6F7ImqsOnFH
         j7KOb/ylNcaZwDqNWSm3MtiHA7mRhuSFmWTDn7vAxwwqlXdhjE+ms5GwQbIJ8YIgOj9N
         bn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728478970; x=1729083770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XQ4P68ZRxv+hHVO0lABXJo+8ycp2fDd9E94BHF6XTqI=;
        b=O6LUkNMWI5ifQ8cAzALEvWwrdYrpjTTiJMILflHFJsZrhstB6N8yTg9coxLVjJKDtg
         s9H3pmvHVGFUYtG3Emecw/71/mR+krr4+XoJsw6E295lG+5cPG8tDETgXIlpuJKxf9Sz
         58vd6x8FZtShagOtq+PBt0bBbuLVDdK5AJgGHkF2FLVUuGvLq2qWhjkmQrPW/fpqFsAZ
         OMxFqsHSyVrGn/m/9l474NORcTXWUXLOmoaRzAo+IINLvCgJYAq5C9CkRcpXmsbd9E5S
         cxZff2Zc4d4qj2p8FFD6uDKPJ4qzsTySdryKrX+WNhdm/U0NSX0k9wtOB92h4A6LmUHf
         A5Ew==
X-Gm-Message-State: AOJu0YyL8b+LcdkcdHRxHuqkZwQOMY1rA+YIQu+FcV3KvWBvrPmvTJ7r
	mlL/X+2rrYHQDvAh3INcjTGz2qWh/7C+EzGeIPJ8ENdZ5Ipa4n+P/cWTatdn61k=
X-Google-Smtp-Source: AGHT+IELZkj89u1afBb7PSQ9wwNotzJkcSezbWUcteXtw7nUEW52WKbZA04/L2zb0pBTJV+mK2zu8Q==
X-Received: by 2002:a2e:d1a:0:b0:2fa:de13:5c2a with SMTP id 38308e7fff4ca-2fb187a1883mr12341611fa.25.1728478969628;
        Wed, 09 Oct 2024 06:02:49 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05c0dc1sm5461539a12.52.2024.10.09.06.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 06:02:49 -0700 (PDT)
Message-ID: <58958e05-882d-4866-809b-1daec897f59a@linaro.org>
Date: Wed, 9 Oct 2024 14:02:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] media: dt-bindings: Add OmniVision OV08X40
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241005-b4-master-24-11-25-ov08x40-v5-0-5f1eb2e11036@linaro.org>
 <20241005-b4-master-24-11-25-ov08x40-v5-2-5f1eb2e11036@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241005-b4-master-24-11-25-ov08x40-v5-2-5f1eb2e11036@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2024 11:31, Bryan O'Donoghue wrote:
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies

I had some offline discussion with Laurent about this since, the logical 
conclusion of this would be anything from 
schemas/media/video-interfaces.yaml# would be valid.

And I'll admit I looked @ upstream examples and copied/pasted which also 
implies that the upstream examples aren't correct.

So, I'll v6 this with

    properties:
      endpoint:
        $ref: /schemas/media/video-interfaces.yaml#
        _additionalProperties_: false

        properties:
          link-frequencies: true
          data-lanes:
            oneOf:
              - items:
                  - const: 1
                  - const: 2
              - items:
                  - const: 1
                  - const: 2
                  - const: 3
                  - const: 4

        required:
          - data-lanes
          - link-frequencies

and then change the relevant upstream examples of unevaluatedProperties: 
false to additionalProperties: false.

---
bod

