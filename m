Return-Path: <linux-media+bounces-21598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C57C49D295E
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 16:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FDB41F21FB5
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 15:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEF41D0DF6;
	Tue, 19 Nov 2024 15:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fTafX3XF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A331CF5D0
	for <linux-media@vger.kernel.org>; Tue, 19 Nov 2024 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732029262; cv=none; b=FA8/AeLnhgQw/6YEpzdYcklp/OqNoJNW+0ASSUsIMNc7hG+SoOqONd4KXQFKlsWuQ5A6LdBgZfDs5Um1kYyZ10e3Y7RA6EpQwYXFHQwFasC4vJEQqUsuWRIlNL3JZQ22t7fuKI3xbBfAZ/FuAjVDOxKIemtwfAkAhalSY+CTB0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732029262; c=relaxed/simple;
	bh=byCRkpmcjLYOiYuZ9sbi5crcjmK3Ichis8Fw/UWZ0gY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ieuP414UuZzxARg1JHsgWSBNUF7ZdFSzsvkWgWn33Q+LymOhywLfov1TsbAoRAGPcIZvWkGVV2OJItxS076asU9KqfhHlLXWl4DZ5czFZIuS0UUXq5slUzSTT8hIy3PJ5sYF20BIlFK6wP8xGKiUm7I+xfr+a4CG5lD7YAgh0+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fTafX3XF; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53d9ff92b14so1321741e87.1
        for <linux-media@vger.kernel.org>; Tue, 19 Nov 2024 07:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732029259; x=1732634059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XApoDteQx8uwLmT1djRy37kdLKoweLorD9+kK8kGqhI=;
        b=fTafX3XFObAZyuMsqXEblfjYiF2gStJXvv6q7oXGfA5SSmVKJDd0t1nLfdobmoSuNZ
         Q+cYF3e6t+hclfhrSafgT0LtFtOv7FF9k7U0+F6mKMEbNpPipa8aQqBj1y8Ce/6Pq406
         gKWbdSiiYLCN5MY/D+J1ChAtCYxCLTuKZN76Y5qukjnydrNgc9WgLS1mn11Uj5iw3ccF
         N3XxzML01+2m9GvEJFX3T04XzZ7quAFWB4jYUNzGGrkBvutbonvTiNDFtWhE4RTu3Gn1
         U0vovqKSltYLi4fUegJs/Sst6BWWthxDCD+KzRrsL0BbX3r9BRg3AZeoUH3JHoat0MxU
         fWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732029259; x=1732634059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XApoDteQx8uwLmT1djRy37kdLKoweLorD9+kK8kGqhI=;
        b=OAlcjf4irH5yT6zHXne0iRniybXUHtwghdNgA+/79LM8m3pK7+8ulLmprCZg5DDMXe
         p4Y4aLO7+jTbXcgSOgN6WqDQtgpMI+b3v3gh/1EEMdn5hRFePkESJJV8yPZgYH8OEiP+
         MaUxRXTUy5OA85Sy5OPM/fE3LkkLXYay/SX+Q/fQOwT/E/5J2pUaLYENBc08n7BpvbR+
         vEmNQeEfHNSAvI2S0NemnG5kiEWrgwsh9lFEyTLNAUBsMK45kJszw4ntqmp02d6lXG8m
         hqw5HdF5CFW0SlbiijmROmCSqMZoZvrll12PxLuB3lZevK29Ou/FMsU460ngibw2Byoe
         fynw==
X-Forwarded-Encrypted: i=1; AJvYcCUcAi9E3Piu8v25J3GDf4V1KsFwDttu73QT636kGClPycF6/NvqW1t2LCblGYoUmrVBYy/qM3EAMTFC2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy16U0FAQ+Z4yUVyYRRJQZyEGze2sZ+Y4lN6AgbFBK4eMCC/6eR
	DqklcWSZnycfZ6CpA0JT6bIH00uv7WNn9R1dUFrPzSxHduuuYMPh81D5aG8Uznc=
X-Google-Smtp-Source: AGHT+IEUE1NmZYZC2AMtwb4y1seGjwr4lW0GYMgyKEoTqI2PAHQa8nbgWJxlnLMXfbEliJM6t9Jb8A==
X-Received: by 2002:a05:6512:2389:b0:53b:1625:bcf8 with SMTP id 2adb3069b0e04-53dab2a71bcmr7430240e87.30.1732029258740;
        Tue, 19 Nov 2024 07:14:18 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da2946a3sm196687005e9.35.2024.11.19.07.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 07:14:18 -0800 (PST)
Message-ID: <1aa56690-1cd0-40e4-ab88-9445ad5b1877@linaro.org>
Date: Tue, 19 Nov 2024 15:14:17 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-6-54075d75f654@linaro.org>
 <b91972e9-5cae-4a8c-b672-5b8d96d442d5@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b91972e9-5cae-4a8c-b672-5b8d96d442d5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/11/2024 14:44, Vladimir Zapolskiy wrote:
>> +            interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> 
> I've forgot to mention that you need to correct the interrupt type
> to rising edge, that's been disucssed.

Ah yes, I forgot about that.

Thanks

---
bod

