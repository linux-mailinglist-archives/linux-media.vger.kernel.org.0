Return-Path: <linux-media+bounces-42082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC66FB4A703
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 11:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5101A188D291
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 09:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AA024338F;
	Tue,  9 Sep 2025 09:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aZXUjAh5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887962765C1
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409016; cv=none; b=U5vpvvMpGL1fZNQjJ+TPzeuvIwv9aMRuldA5wfJ3gv6Q0loGagd4ponva0qvAfwmdnhgW/wb/qgY3wEoAwgTYSg3i8WdJEvzkOolht7QZsxIqw2qYGG52fmfHvde/alGjTO+GPlk1oeCXu983uFXqKaj7qOCJ0yYc4zO6YA4v0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409016; c=relaxed/simple;
	bh=VLE9FplhQ6lDitRlXymWZCJ8Fc4/CeLS2ID2UGtqpbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aWOvrXP5fnGWiZwN6L1C5/QxWGvoPVAf+16lbpx/3zQy3sIoNweEJfJxbOkWmhzooyXZsm5Fj4OcKCeGIGSPzk210qwH5+BFQi7Axiw1OjeR2i+n7umzr6Yjn4wMTW21imxP3PSU/aFGl1epv+Crli+I++eKn0W1zQOtXc5GGCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aZXUjAh5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f6d63afb5so737128e87.1
        for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757409012; x=1758013812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I2qd2T+JXYNAvNRWDPsoxIO3KI39MwSeylvIiluAMGU=;
        b=aZXUjAh5FH5e9XxyeJZnfHVMHl+5VgVGeLwitoHPIFOwXHEvwkcxmK7twFu90q/3eG
         0erTUKgTqEtFpv4Neac+RGmlkbR6Xdt6GaD0p7B9uUrDOh5WTqERudS0tAQh15vEL59J
         iDsfoIEoTfy/AXZtqWHC61FYeBBjq81Guy68BU43TbPZ7BIEfCgjN6lsXl2gLkENHBAZ
         suJOQb1mdEodFgL8oczFZKtgafJfpojeQncRKtYVEUSDQwHz2aUTlKf/bGzrlwPlQo2K
         z+yD4SuryN4d9QU9JuW63BcBLhlMuGIpEwqwxDEDFGkogo+tHBf45FP3/7f6YafmKbZ4
         iOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409012; x=1758013812;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I2qd2T+JXYNAvNRWDPsoxIO3KI39MwSeylvIiluAMGU=;
        b=IOZwWglPCBzvmWSdePr5nCKPRZ0YLN5xB2AV9MzG4wR4G7v2SQu7pOlBiq5Z/OWEg2
         d44MmCbos+DXMo7PuHVEW/3LZKOukkHkAFE+Ql5xislnaAVTMBoenkVgT+zRBbVAoDeQ
         9qEEWFh4tLOZXBtwjI0k2cqsyH0x9Ik0fqoGGwmaKAMp9uw3pOIsUn4M6Zszi1QNU+rL
         1SdeVpG9m3tQIK9GTV+Po3cCxo+CN64gS00veP5XhG+iT0c569L0i5E4Az4uBuWoCw2C
         f/ZBl/ESUM80VQyb7QRrqo+4zg7RnX9gkh3FsNEdk5LCAHtMaiwUJ08wH5X9vGev7wGf
         TTZw==
X-Forwarded-Encrypted: i=1; AJvYcCVH3Y51ey6eiJQsGgE3MGBjvl8IqmyqsaI+2bRqb846lEWoQtTcnDdA4qr/4pLUu0E7aBzFxNuKR9vpPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKJc80itAHwEChCNF6edGn8hM6IHs1Mysd6mRGhWVnSsPYprQC
	tb8sSBP5cvcf2Srq2lOtRsm4lmXf+1KDk4FT9vODrjDoSXTpXt21rOeHPSvgaCOKdJ0=
X-Gm-Gg: ASbGnctv7jmGy/eW5emwJgx81OB7zmUqIZIJAAroORrMinSPsX0a+RPUS3kK0f7tbdW
	NFHTfG5IPlB8OI7YsXSnXgATOcWw1wHhPeM9Hi/L2PCvc4bPfbseZHosraxTobrDS0Ol22EoLoM
	qW5ChrFRE1pPHXsrl940Dgnptdg3TkE/vhmlEICTTocHOIudAIOA9kJbMh3bx9nyVluackM5TT0
	7x1mMD0H/jYqveynTQg2W4jasa2jc6n9158Ubd651ovjfkTpKPqKGlifezJ/6dRtVy1pyz3vby5
	Br0ddjLQzug0Ed+WAxYBG7UzX9P38Txy0mrLd3g9CoToOuWvdO2RH4k4wRN0De21cjD2ZnWgRbH
	wPbtK6c9/rQzLMQ8+oQ6/JkZJxvjrgDTuFzBMf1jiQAzG+djgD/EQIW/ysN36fOMi6xtJ/p7/V2
	KWweAKpSHGMfk=
X-Google-Smtp-Source: AGHT+IFKp0e6rYFkPuP5GOUGQG9IaL/DYm2C2+J//H0beXwbIEHVqSkMcbQxgd+CI1PI/N1zvlwtiA==
X-Received: by 2002:a05:6512:3f18:b0:55f:612b:b350 with SMTP id 2adb3069b0e04-56260e42abcmr1454991e87.3.1757409012532;
        Tue, 09 Sep 2025 02:10:12 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-568188224d7sm387477e87.120.2025.09.09.02.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 02:10:12 -0700 (PDT)
Message-ID: <5ea25a21-2379-455d-aec3-9a559e54d577@linaro.org>
Date: Tue, 9 Sep 2025 12:10:10 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] media: qcom: camss: change internals of endpoint
 parsing to fwnode handling
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
 <20250903002255.346026-5-vladimir.zapolskiy@linaro.org>
 <1d72c06a-1a44-4364-bde1-afc4514520a1@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <1d72c06a-1a44-4364-bde1-afc4514520a1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/25 15:38, Bryan O'Donoghue wrote:
> On 03/09/2025 01:22, Vladimir Zapolskiy wrote:
>> Since a few called V4L2 functions operate with fwnode arguments the change
>> from OF device nodes to fwnodes brings a simplification to the code.
>>
>> The camss_parse_endpoint_node() function is called once by camss_probe(),
>> and there is no use of knowing a number of asynchronously registered
>> remote devices, so it makes sense to remove the related computation from
>> the function.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> I think we should keep the code as is here until after merging csiphy
> changes.
> 

The logic above is inverted, a status of changes intended for the mainline
Linux shall not depend on some out-of-tree project with no defined merge
date.

The change shown is this changeset does not contradict "csiphy changes"
added to arm64-laptops/linux, merging of these light changes to upstream
can be done immediately, and in a very unexpected case of a mess with
arm64-laptops/linux project you may revert/update any mainline changes.

The mainline Linux kernel should gain a priority over its forks IMO.

-- 
Best wishes,
Vladimir

