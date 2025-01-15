Return-Path: <linux-media+bounces-24820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA888A12DD9
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 22:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E06C63A5A29
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 21:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66EDB1DBB19;
	Wed, 15 Jan 2025 21:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yIWggTuo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF80D1DA11B
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 21:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736977166; cv=none; b=Q4S8E7jd457p5koZGlyTOJ025xwfs1dHXDuFHQvFtSO9h/uZ7Xms2ODDzdyuJPUNNmqPeEFpeBIVEFe7l0rGDw57WTF5RSyJxLP/bbytvME+CeCCMx7kKJBgOmSV7aox/zDY9PNB9r+iIcFM0WxFPJGtbJKbCCUdBxUurc2vV6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736977166; c=relaxed/simple;
	bh=kiTN4i34SMo9Tl8cxH30sylIToy8477nlqj6T77NkSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ms6BDcaSin2/Lb5znq02HakZZZj+Y7XeUz3wrg8pwdSqnylHEJ0FOGYYvAa5G/NCww4qqi8N5IsrUXclPKhaWj0sRrv8djUuEHi87I378rheJFxIPKrsZjobIDZxJbNNnPsaWpLMHd5I+lqLeu0Xr5XLdCDXUjXsxQgYZgQkmWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yIWggTuo; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3863703258fso898591f8f.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 13:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736977163; x=1737581963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJhEKZyR6Y1MJZG54e2XdBZbqUxpmQLLEkNR5xDci+I=;
        b=yIWggTuo3geGEp4qwjDMN3h8Z+JbTQ6CCuRz9qCXflj2HzBDAjOZmP2NJc7PD8f5+Z
         7swwV2lCBu+U+vdk22xuDfvdzBgTg7rRnj0o50TUmzKVowsPk92Gd6IZYK4fP1/4H28u
         fHpiIfatFBQfkDb8FYFvQc9xjj44N5ybfNaHUQl7yCzpk/mkc2QCRCWXuun95FRdV6Oe
         0fLr+IsxGfnYODSXn93Q8BO7XFoyUSI0GPboF20UdRicPViwk+KS+dSIMGvirjy0ByUl
         Rshpkt5x9oMV0Aa9d0te73bi+CXgZBq+SzSgdGNaMmTCkxfQY/EZf9qtbzhIsfsUOVam
         OD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736977163; x=1737581963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uJhEKZyR6Y1MJZG54e2XdBZbqUxpmQLLEkNR5xDci+I=;
        b=FU999V+GLb0CcHDD8Kz8l7Y6jM9NlgibndMSTfolgQ2C2F7hNfNr95IKKkPBgetma8
         +sp4eJlD0UGMlKqb02D9/OlpykiQIIpOlWRSP26Sngtibq/SDxN6pyM1pYUBheWhCVH9
         5Q3QhwoWXdYXVTSKRhEV/ZrX0MyP59dzAVmcc8Yo3QQBM1ZWy6AyC8NGkQNaBhZ5nkO9
         xdvXgnCnMtlMiu+KauyPL99jDyVaGR3WE77buvPJ7UZ2rnPMzB0ONXHK7fcs3iZZuqDm
         nwY7ZCXytkTO6R0o751jVxZBYsGf6cCg3B8xnxCdHSJ9XR+e18oGllkX4cc/bXpgHaT7
         3Thg==
X-Forwarded-Encrypted: i=1; AJvYcCXeOAkNXqdYpA9ZMzziHfGUfQUMtHr/bA+IuNYv5ZahLEpBa/d4oYMkhklmP4603mEIs8DS/RywXV3Z2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVXEC3QEWU0r2JwcBNfcS0/o6/h/x6BmOj8dAWG63P/P3g+0/B
	vpKfWg9NDlUd32emhe3k3YMp8cZk530kEFeFd2zhdzBsEHgAmSwlzY1IMF8y/9U=
X-Gm-Gg: ASbGncu3QY4/m983cbfg38CH+c0Ai6YFnfRf+4BxswZaPkfHOZT46gL9OUQGC73t14s
	hAvT0Dlal6dH3rQXRPQXRaFuSxgqpnxdr32meiT/QxVf1Bd3sJdnS2dWvO0Wez9KbrnDdXI0kUc
	HSCuaqP2UaaWIi25xgLp/SdORsGYvLvhCgk1A89QvfhT8HcLOonwqvd5Wa9GxeXwOEqxSJd6dAb
	PCWUWoh+mqDA3fgVhpHzRiG1esaLRXk1D8SevDjtAm/QZdJIu072RqfNJIrQ7FlQzeJLQ==
X-Google-Smtp-Source: AGHT+IFSsMFrbNHvvZc+5y6Gkp+Sw+ZvI7ZCaZxsYZP//hxfDf8z5gCzPOj7cx6FAkq04t1FZ5RjCw==
X-Received: by 2002:a05:6000:1565:b0:38a:88d0:1c9c with SMTP id ffacd0b85a97d-38bec4fcd47mr172464f8f.17.1736977163358;
        Wed, 15 Jan 2025 13:39:23 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d01dsm18513086f8f.9.2025.01.15.13.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 13:39:22 -0800 (PST)
Message-ID: <23c6160a-6570-4798-83ee-bf6d8bb42b07@linaro.org>
Date: Wed, 15 Jan 2025 21:39:21 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/16] media: qcom: camss: csiphy-3ph: Move CSIPHY
 variables to data field inside csiphy struct
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, hverkuil@xs4all.nl
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250108143733.2761200-1-quic_depengs@quicinc.com>
 <20250108143733.2761200-6-quic_depengs@quicinc.com>
 <79b3e4d6-becf-4bcd-91fa-768b4098d01d@gmail.com>
 <238411cd-1bcc-496a-9077-07bb6c4892ec@linaro.org>
 <f268a604-09ed-4150-9401-de82cc206ce7@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f268a604-09ed-4150-9401-de82cc206ce7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/01/2025 21:15, Vladimir Zapolskiy wrote:
>>
>> @Hans could you possibly drop the "default avatar" when applying ?
>>
> 
> FWIW this particular problem has been fixed in v9, while the v9 series
> itself should gain some time to be reviewed/tested.

Ah, this is V8.

I didn't see.

---
bod

