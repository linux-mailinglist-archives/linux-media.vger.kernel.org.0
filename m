Return-Path: <linux-media+bounces-51030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F35ED3A3FF
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 11:02:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51567307B411
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 09:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B97352921;
	Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MX2GsPbx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A09633E347
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816730; cv=none; b=Cz9P2EcJUKkWTeKSQseCy95wXuqVra96ODf1yMIV5ADiPBvmkS1R+BwmbNcYCFW3j6oqjujlfVIaW3qqRjU/1X9hfSoSc/gLM/wIxkvyQ8D56j/e+7kzodRC7MygxRxSDcL/mx/gsfX578Nx8iTJhpPxWsjBAYUjo+qUdbQMG4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816730; c=relaxed/simple;
	bh=TLdjqoVIE+Q9q91ePPjmYNloGq0TOanY7B4oKwKnzIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+HCvzLL0nZSRetUrZKbh/XPBHN9hRmphVFG/l91e3bpO/Hi7Y/Eez8Foe+2AgGUj6SKejR1uYv4u3KzYuVxe0HyyaOml4Vx9nJyEzm4yP/4yGKSLwXNIsrL0COYyEFcY+4xJEScBxhbQRWCx4UkVsP4m3dONsXjxdL8s/Gs118=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MX2GsPbx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so29494345e9.1
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 01:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768816725; x=1769421525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VbO+zxW5Tr1lt5ztXDgpLXAufhVHB99cvlxCwAYSGTc=;
        b=MX2GsPbxnAsNH/LhEk7HKr0apsanP/5nOw0m9tqh6dY3YDHg28hKEbQBn5/xFTapA0
         QchRapldVwpxfDZJHAPRkH4PqFwkg9NOsEffB704Wd23USYNv1yKU06fER1QoPrmuIuq
         7XUv+IXK/WnZJLeWKmfNDg2khStg7L63zbFlkGDcxTH4zduL5kYOxW5M8Grz/eMTWfKW
         0glhXdQ1f4VZkgD4n/wYpwQGgv/j80LbxIhcP04Dmov83KSY0pFLiP/8F2gYKhS2ONix
         mgw7ZRAX4r/B5xthTgpmtF3WL4MQGkYiers8UoupjovBGkIQbkiF77ikly0jM0mc0FCx
         b6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768816725; x=1769421525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VbO+zxW5Tr1lt5ztXDgpLXAufhVHB99cvlxCwAYSGTc=;
        b=EC1s9QEnpHchdsf4UR4eIYd3Fhp/HiXlyCbH9AHMEhUFFpIpRS4+OU6uHNf8bHsfIG
         9LslToR9xa3t31a/kvRhTnSkHfOzdu1sAEUZXhECdgfS0vtZT/NopL2FKSWOKCSpyr9X
         pwpgwJw77hhuNWBw6vKpan5XR8fwgQU0pyo1awD7tXHrJUlJWGQWHJIZpLI+nEs1jlC5
         7wk3GPg7GxQbc+7kCfkLZxY2jnuLF1Iy8u+ZeTU3HbuYXTvONB4Jj2Ks4jKZ8NXUYr2+
         HmD9TXDdpy34fAtOB2LgzDkHC7LV01uigsVaAXTvwG/aYJeV4Lll8thXmN7D9NE0w3Lx
         lLpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6b4jtq87y18Bc3HdVXGbLp++jCWK0UvPrK7T7+WHAUKNV8wpHEMNo8vMYabFujQjQpt0COLciqsxV+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX0A56+xK8hABhsKkcMkrbZduzXxVJC0Ua/6igFBkXld29jOFd
	UhMhmtxr4LhchiKWdABFbs78I5zYiui5BFGJm6ku0rF7325O5AbgO7lL1hbvnWftxV4=
X-Gm-Gg: AY/fxX58Ry6sDEDsjDnEOPTGLQHCMInl44LUueWTwrQ69Hifi9wDO1ArqbhQi7wtqZX
	6xMYkLNhNbf/AWEtN1FWsZhfVehsrwESO5mI2aqXwJNUSytI+fM6fKNgJKSarjgnYIcHn/8aOGe
	NH6JoTtVSaXoOXzhlvDEu/KL2/f+75HWJSKIjMCJGu9GrT1E4OiZFP0Ff0bEM9n4XxFKCQcejRo
	dYyB77SYzhlBSpGk16+SSJkDiv2VLCiO66yIOZ1gBNT45iVN0zUAb9K8KcJf2NhiILOH6E7TdFz
	jx8L7dba047fArgh2YGNrzSP52RubVlaXQEVO2oRQCr2UPnuPVeVigG9SFkwGEIsqI5ZqPG3jCX
	c+DKMtjpyKxyvmZq89h2LZL9cF9CzsTJBtDnZueYZARiuzldhNiUjc9KkwTH4jFZzQ1MIfNjKXM
	v9psPkXwLwQJ8JzBM6B4c8M4T/c0vs5dANFA+Kcaho+v7eIaMPthQy
X-Received: by 2002:a05:600c:138a:b0:477:1af2:f40a with SMTP id 5b1f17b1804b1-4801e33c066mr162021155e9.17.1768816724599;
        Mon, 19 Jan 2026 01:58:44 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f42907141sm240781765e9.9.2026.01.19.01.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 01:58:43 -0800 (PST)
Message-ID: <a7228ac6-86ee-4ee2-beda-8252aa418d31@linaro.org>
Date: Mon, 19 Jan 2026 09:59:04 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] media: qcom: camss: Add common TPG support
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
 <20260113-camss_tpg-v8-1-fa2cb186a018@oss.qualcomm.com>
 <87a31d4e-b604-4b9a-92e9-75fd2748489a@linaro.org>
 <98a26638-675b-4654-a940-898ba9e1af9c@oss.qualcomm.com>
 <e1907273-3d14-41ee-9a22-a963f2b83d20@linaro.org>
 <a70f69e6-6ee6-4a96-88fc-c0ec4db48697@oss.qualcomm.com>
 <641421a6-bf42-49f4-8f94-9cb0bce8e97c@linaro.org>
 <f77e0d03-ba4a-4722-b575-7aee8e93f04b@linaro.org>
 <f1c4288f-983f-4a62-82fb-22d1ec56bed0@linaro.org>
 <e94e3391-6fef-4378-b5bd-66aafea95a0c@linaro.org>
 <c3a56645-0399-447c-b7a5-d7af9f567a7d@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c3a56645-0399-447c-b7a5-d7af9f567a7d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/01/2026 09:24, Vladimir Zapolskiy wrote:
> 
>> keep namespace consistency between CSID-TPG and standalone-TPG.
>>
> 
> When "consistency" is not defined, it's just a fine sounding buzzword.

I mean all spoken words /buzz/s//vibrate/ :)

> CSID TPG has:
> * modes, which numbers are continuously incremented,
> * the number of TPG modes for a user is expectedly the number of TPG modes.
> 
> The displayed v8 of the "standalone TPG" broke both assumptions from above,
> so there is no more "consistency" between two TPGs, while I explicitly ask
> to preserve the "consistency".

I'm not sure I really follow what you're saying so, I'll restate what 
I'm saying.

The values that you can set on the TPG from userspace via yavta should 
be the same names/values when talking to the CSID version as the TPG 
version.

Just looking at the list of strings, I think omitting the Reserved 
pretty much does that.

But you certainly shouldn't have one set of strings for the CSID-TPG and 
the dedicated TPG which produce the same test patterns, no matter how 
its implemented under the hood.

---
bod

