Return-Path: <linux-media+bounces-18903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8A498B7F8
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 11:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13A0C1F231C9
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 09:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BF719D88A;
	Tue,  1 Oct 2024 09:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AkavaydY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F30517BB08
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 09:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727773755; cv=none; b=EIRwk3eSLnay3PrXlmcWn1nlG1n8NEgrZPfptUyY8gFuIeAcCiZynxWPzls19MhM6m4sBC7JPO5+PTT5hejMBVMO5aaBx2OIeJZGhvyzPW0TXE9VVli4Sh3teDO+ydXBgvELajCivpJYiHZyxY/ZuiRsX/tv9sihqCTPiJi7aTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727773755; c=relaxed/simple;
	bh=m4g9Fj328u373FQgoh9ByEPxnYiUpxDQxkHpAC2kNuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fRu9C8PiWGLVHOcmMuI5R62wUHIWreLf8mwi9lxb4sfo1lsveQ6MUrh9w96lAaFJ4fPe1W3wMwjSH5SeaQxhxjv9/PkYeSCbVdIsjVYNIx1BMkdr5BDLGyWF9YHzj8q3ay4kKEgcEfDX16CxH5gZlSgU5K97qse+fGbKy4aiheA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AkavaydY; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c89f3f28b6so1704491a12.2
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2024 02:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727773752; x=1728378552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r6fXJEyonWR/8EacTP5XqZH01/Wa+2HpA3vaYRJrrRQ=;
        b=AkavaydYEVqXnWr1zkv2U7rIsKjireppsgch93gHCWTi14ckWojgFDAojwwTxO+dOC
         +O1xYAbWl4Bt3xp45LlwVL5uAwILy9ELbxiTFhJKZ7f6eiE04mcsdjnXd3xQ6z59x5+e
         7SzmysWrufuWvvWHRTGCvsaLF90HqY3ga3sPfg7yLG+Gcueh/WrE9ax9tZuOaf5D29op
         p8bO/LIf0JLz6QyNK1OmK70z5NOLNUWPOPJXT3VGxCN1n+VVW6yxqcs0Ba3gD+M9UEn5
         SUud7Dsh4O4A7PZ4OrXC3gLnZjRxRNoELlb3e+liADsoe4tZ7C3vF4MWJBDxMWKK3OW8
         HLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727773752; x=1728378552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r6fXJEyonWR/8EacTP5XqZH01/Wa+2HpA3vaYRJrrRQ=;
        b=oEVpXZZqiNu+O2aLQKRH3f/BoXq+7ev3cuF2BFVKYfGx/QKOAusic9sQLzSk6PqNXK
         KQhyd5BFJtfBsrWmeFZF/N+bmcrENs1xTjlfW8wHEH4PRu4BnB+JIlXi1vVYgdtcyWS0
         8wgrPIT9tda9duILtZCRz4n5kYxwYQetrv4cD6py4kLexvJF+qyOLE+7U+EwQ4uHf47+
         RRdXytHWrciXmvdk8xxNN9RGhsAbJTLX4ayh/zj4Om9NIo4MfTTKmI7pBZrrtjXZCmQM
         zA46fXLeJ+Ab3wnbtznje05ORecbXQhTIsLQnH9fTyWx91f4jnOwcFu0auGMW/2oSgEW
         KjfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAkUfT4PIaczKLcx9oo/9C2I1fIioTQi8KPHSG0/BBbmE9Oe58kShx0OybakcgQwCKuw8YdieKwadyfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH1+w5vqVnfD5/X5GDCsWxc501YwM5mo00ytrmGQpVRg+DTcsL
	ikXgVixE/YEYaBUIwNmPI0bj9O/hydIjgVgASmyvLPUs1ou/esQ2/ilBGA8h/4g=
X-Google-Smtp-Source: AGHT+IHDUPzks78aQFTskmf42JXCM1g0xERxSPBxrPEBW/hfzXcGDP2kNdeHp5M5NxOLBA80JFAvcw==
X-Received: by 2002:a50:858b:0:b0:5c5:c059:63ba with SMTP id 4fb4d7f45d1cf-5c88261009emr11723136a12.35.1727773752474;
        Tue, 01 Oct 2024 02:09:12 -0700 (PDT)
Received: from [192.168.0.15] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245e9d7sm5861727a12.57.2024.10.01.02.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 02:09:11 -0700 (PDT)
Message-ID: <306b0806-70c5-4dfb-b7e3-5614a20699d2@linaro.org>
Date: Tue, 1 Oct 2024 10:09:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] dt-bindings: media: camss: Add qcom,sdm670-camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20241001023520.547271-9-mailingradian@gmail.com>
 <20241001023520.547271-13-mailingradian@gmail.com>
 <aleot5kegf5xvlvzmws6tmxcqxw3gnmxndclkb7rdzcxnmehel@varsfzbmiszm>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aleot5kegf5xvlvzmws6tmxcqxw3gnmxndclkb7rdzcxnmehel@varsfzbmiszm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2024 07:53, Krzysztof Kozlowski wrote:
>> +  reg-names:
>> +    items:
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: vfe0
>> +      - const: csid0
>> +      - const: vfe1
>> +      - const: csid1
>> +      - const: vfe_lite
>> +      - const: csid2
> Why this order is so different than all others? This is supposed to
> match other devices. Look at sdm845 for example.

These are appearing in address order, which is preferred over reg-name 
ordering AFAIU.

+            reg = <0 0x0ac65000 0 0x1000>,
+                  <0 0x0ac66000 0 0x1000>,
+                  <0 0x0ac67000 0 0x1000>,
+                  <0 0x0acaf000 0 0x4000>,
+                  <0 0x0acb3000 0 0x1000>,
+                  <0 0x0acb6000 0 0x4000>,
+                  <0 0x0acba000 0 0x1000>,
+                  <0 0x0acc4000 0 0x4000>,
+                  <0 0x0acc8000 0 0x1000>;
+            reg-names = "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "vfe0",
+                        "csid0",
+                        "vfe1",
+                        "csid1",
+                        "vfe_lite",
+                        "csid2";

---
bod

