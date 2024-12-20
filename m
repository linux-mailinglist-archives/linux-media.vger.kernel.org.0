Return-Path: <linux-media+bounces-23927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B78409F9473
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E83C4164AC9
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C09217708;
	Fri, 20 Dec 2024 14:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AKfzQa2j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0752165E6
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705197; cv=none; b=RktJm/Fqszzf8xCKuQdtYBNywcei9F3IiHU/ESPsx3dcL0j/bCKjq+JFQZhmgCGEQfwJhcUN2uxUETy4myNbWhpBRyMvsumn6hRapx9PaOlzBatUImUJIfIy0B7oFASDXlElo+CBugC44tKO9SnoMz9hWRTIrdOA4WtmHx/BLSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705197; c=relaxed/simple;
	bh=agfLyDmBFtO/hRfGKHrqlTlsQawt1rRYkgglu5aI+Po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O7DqGwLmGUlIwRwop7YtCA7Oa1h/SDP4KPIdQhqSP5oa+MeR1vYWOEZuJQXyd1MXGVAqEEgrjOt/CYM2GUT/SXpWam//EVt655JnwhVkNWZMJk4yzcDHw/Xs6J4t4V0j7yKEkHBUACzHwJUl/CzIaUdIL30j27hCMXXVpiLsTrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AKfzQa2j; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3863c36a731so1588044f8f.1
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 06:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705194; x=1735309994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CmDOaP+NMml74CdpVmpjy5SUSD3CmmDCKUra4lUv1Sw=;
        b=AKfzQa2jiUD6c4vSTOy8Uqvoa5IHL2V0eYMnqTE43/BnSLIe55ZCN2DavTVcg+uIoT
         20KNl4J+LQ0g22ox/PAnO2ArdCHQDhNgX1xP5EEqwhM7L4/Pd+oLZYOmiZfZFhqmtHov
         GSTlvUAbyevevqdOyzzozcMFXzlZPGWUEswRDl+EeBI8eUDbBMN6ROTvy3PA06Otvqqh
         pENuwXWuv4JZ2LD4slMo7VqM9Lp5UWybK27wpq8SWPNvfxsWk6hbhdGmKOF3sy/Me7wm
         a3sB+zHTFX+b72AC2LryziZm/oNQ1HS/DWzWrSJDTyKmI5doxW4J8wrwP7rB1xKeikJ6
         AMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705194; x=1735309994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmDOaP+NMml74CdpVmpjy5SUSD3CmmDCKUra4lUv1Sw=;
        b=N/0v9CkEq1CN82+10iaRRYvr0hDlA0443KQZwtbAvwO2gxiWTbeX5GU5FFPgDwcdcJ
         A4pZ7z/EBhQlivqjBFD5lyxHZ1361YefSY6ZPf83rdoVP7eHS/SXdOiLHW8uvtvhZvFb
         GJtu9a9BoBL7EpTjJ4JTa2F4L6r9Vnq7fn3v6FJTFRHhCZh63NKGHtJhVUy+EewP6111
         8069xrWvD0RgCfcuG9hBz+F76VoRmLaaEZC4ufpOWhwv19TAPBKK7V1u7TGCF1WGcB/Q
         +emwznMtQdWolO6NnIlXgyUbWg5o9F95m86TdulcWbb0CN9dTqpfoN5EGCHmhMxeqhjR
         Nf+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtbtN6YfrxTbVgZceEX7UUVfnhGo+HfYjOxQAYULrPBHM1opaevB3IUeTMaALyDC24D4xzOExPk70fHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3XiS7nQmKcKmAyNtlHHPRY+JxBI7qnnVakQFn13wzQWmRuvFp
	KdUzXImmnIAbeVFMh0Ad2AZD4KqsVCXEu6jZCya7B63xK4mVvb6qq+ha6sOvVtA=
X-Gm-Gg: ASbGncvGizaCRERmoNLu2rc3Dut+JpGLqOcdYCe1OjMZ0NCR+l41h824Z0+2OdJu/PA
	E8G+J8DcTqX5qUAsmZPIlG1F/nqhySJAiBW9lb4JAR/m+Rc88ZL8MoDtD/iCZiUBeK9LcvMa2ir
	l2HHNeRO9xm4h4h2T0FvD8RCbH9d/O/V1JDD8jsXLVF3ST5mGVleUZ5ZOEtLh0/B4aynxL9sgOW
	iDbUGN4nwKzruOSRxBb7mABU1aRfNdYTbXGSO83m9ZCmWPnwHPQRS43V0alcEHoRcGwQQ==
X-Google-Smtp-Source: AGHT+IG17zX1yWQ82jRGwcn/tlWtzt2BsVRaO3TXXOsracQCsIn4KkQLnViNRUIFet0t+1U6Rvp1nw==
X-Received: by 2002:a05:6000:4021:b0:385:f6b9:e762 with SMTP id ffacd0b85a97d-38a223f760bmr2873815f8f.36.1734705194068;
        Fri, 20 Dec 2024 06:33:14 -0800 (PST)
Received: from [192.168.0.10] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a6dd3sm4186902f8f.96.2024.12.20.06.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:33:13 -0800 (PST)
Message-ID: <736b2b44-bff0-4dbf-9f2e-20fb5a4aea71@linaro.org>
Date: Fri, 20 Dec 2024 14:33:12 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: ov08x40: Properly turn sensor on/off when
 runtime-suspended
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241219134940.15472-1-hdegoede@redhat.com>
 <20241219134940.15472-2-hdegoede@redhat.com>
 <a2efc7e7-6e73-41b0-b8df-ae28175d7dda@linaro.org>
 <e3573352-f73e-43f5-8e21-6c313dc54057@redhat.com>
 <c9f237bc-40c6-4b41-a963-abac306458bd@linaro.org>
 <a2fd753f-a999-4d17-b799-be4a6ece7bea@redhat.com>
 <2349c1b9-0cdd-4759-9f2a-68ae53f22391@linaro.org>
 <1bf92f43-91ff-4c2f-8b86-cf7618333725@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1bf92f43-91ff-4c2f-8b86-cf7618333725@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/12/2024 14:29, Hans de Goede wrote:
> Hi,
> 
> On 20-Dec-24 3:27 PM, Bryan O'Donoghue wrote:
>> On 20/12/2024 13:59, Hans de Goede wrote:
>>> I guess you are going to test the rest of the series and then provided
>>> a Tested-by?
>>>
>>> If yes then I'll wait with posting v2 until you're done testing.
>>
>> I can give you Tested-by: for the series now + the change we discussed.
> 
> Yes please, then I can include it in the v2 posting.
> 
> Regards,
> 
> Hans
> 

With the change discussed

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

