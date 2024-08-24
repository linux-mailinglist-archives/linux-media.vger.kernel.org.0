Return-Path: <linux-media+bounces-16698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4B895DE1F
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 15:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00C281F21E79
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 13:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99E517A5A7;
	Sat, 24 Aug 2024 13:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="roKMWXNA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636031BDDB
	for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 13:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724506545; cv=none; b=N87lhfd1DEjqeDy2awdh6tL08QikzPMDNp6NowhGW/0ZhH8KOO2rnZq0GxC8lPSoQZJJlWcQoPD/iJfHdWSL55LuTI3nX+t3TPKhvvtxIHOtaYLvbEopopc3EFwwao1VAPF1BMNQUqjF8sEofi3dIpq7clnarBGjhtxmOsVcIGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724506545; c=relaxed/simple;
	bh=79Tiz52+xqEOBlU0RvSHk8QhP2WBZBFqY8YHuGWnFn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1GVXgSjassJTBSH75B7OQcTBin6YlPXo8/QBUcF2GHTAOTPAsbh3jBwPMTDLLKtrGEkAeNAQMG2LB99zetpY7KGrQAeOR8Ag82UQVTeO0mnxK5LyipkUG4nfvKFp+03kly/lKWHUxm0KAhafuftCboFHsTpE+oPGU1McOKW9AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=roKMWXNA; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53341decf9aso265163e87.3
        for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 06:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724506541; x=1725111341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hf0CHgZF0U3/k2Z/X7b9K/c4oBA/TQkBIZ+OykVc3wY=;
        b=roKMWXNAwmzMunDo/3fdHtigRNMi8TqVsykbSu64v+3/wO5aklKIp4NV3QrftR5abB
         Q/njVB0zZy6f1ego3czVfF0U67j7aRvSkWL6afJtPjBMavfP8MNfcFdnxYthKGpfQW8i
         ofz6hmsw3XG9uw9OTSCuZvjEeIWtX/kklf6rR5keijxqMnjRXgLfvFIuuHCMN3bj7Icr
         cXjM36bQXlDOcnNFJ1y1hMvb1pj7eZanuYceBCgbhN9WlxZpQ3kcwawjPiYBiE2kMVPW
         gBkuPKGzIrhUwHtyVYlFtVYWTzt/ZWe6n/fnHI5Ws0B4Rs3T7trlAWxzq2IqQLmhSS2i
         mJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724506541; x=1725111341;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hf0CHgZF0U3/k2Z/X7b9K/c4oBA/TQkBIZ+OykVc3wY=;
        b=MbiP1766F1hs/xy4R9Zg28XcJqLyCQ4qiTcxE274wKdXMyFuVjMFuDW7EKt8Cj66oV
         9rlJx7ZeAcNXQg9QhId9zdu7DgEAO9a0tArzf42jATs2ntjhcsK6/6xB5qLkpI4rXnif
         jqviKVf34B7hz3/sd+qECTK2CsiosyFb6IMktNGPCU1euLpj6PshQM/ZJxQIdgM7Gukt
         MUa3/UF+n0fUrTS9TZx+pZi3qgqqBwV/94QYsPjmGj4eAFU6ZVlMAcTbdBGAABP0zPif
         NkpEjyxE39BagRV6jmn3PABUrUDUBoKTIrRFFtKEK/D+UcDTA0Crds9IHQpzcTG14Xqu
         aiFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr+naGKTBN1cpHSNqux953ag0cFhrrZXCdA6EGZ6wvRBw0//uKsAuOm9Riqw84MX07cf5wO2i+UJu6GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoBl7zK/kjmV9yHJCY/UA19x9I2k+3FCYdbKCmVis5W8+a1ta4
	817eo/eGTB7IVTnbaiNKNUn2KimIsd7tgssZMVEuE8ILNI32ip0890T0jagetps=
X-Google-Smtp-Source: AGHT+IEoY+XIYVOy+Fkv5pbYvByRxrlxKUkUoTi6ALCl/UsGiOIvmhV3W92nrl3Oif3aNpkjd5DT1A==
X-Received: by 2002:a05:651c:551:b0:2ef:307d:1f with SMTP id 38308e7fff4ca-2f4f48ef73amr19526901fa.1.1724506540621;
        Sat, 24 Aug 2024 06:35:40 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f40487f7e7sm7157211fa.108.2024.08.24.06.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 06:35:40 -0700 (PDT)
Message-ID: <8f3786d9-c04a-43e7-839b-5f1aed585643@linaro.org>
Date: Sat, 24 Aug 2024 16:35:39 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] media: dt-bindings: Add OmniVision OG01A1B image
 sensor
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20240823102731.2240857-1-vladimir.zapolskiy@linaro.org>
 <20240823102731.2240857-2-vladimir.zapolskiy@linaro.org>
 <3ed33fa8-bf51-452c-854a-53de9a158ccd@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <3ed33fa8-bf51-452c-854a-53de9a158ccd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/23/24 16:46, Krzysztof Kozlowski wrote:
> On 23/08/2024 12:27, Vladimir Zapolskiy wrote:
>> Add device tree bindings documentation for OmniVision OG01A1B image
>> sensor.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
> 
> Missing DT list which is needed for automation. Please just use b4 or
> scripts/get_maintainers.pl.

That's my fault, shall I resend the series, or just this one patch?

There is no code changes from v2 to v3, and fortunately v2 passed the DT
integration checks.

--
Best wishes,
Vladimir

