Return-Path: <linux-media+bounces-28311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C68CDA63294
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 22:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA5601728F1
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 21:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FFF19CC1C;
	Sat, 15 Mar 2025 21:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zKf84hpH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27A913AD22
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 21:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742073323; cv=none; b=fWi/QQmmc3nV4AebF0FnGmOExQNfPpmHARm2UPQcv2Ng7fhMJWMnwxn9mmu5C5ag0LZVhUf5AoIHE008VNCV0WWBU0VS+4emlBZci6e3aA/J2ZqY/hYybEfjOHYy9yOZrrCyu8F+7WdMV2Hlp22aTz2MaCyedNa1xQUwZphBb+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742073323; c=relaxed/simple;
	bh=4HcqAfSIoM5zYXk4yifgIWjaQrENFkms6x8+28acleQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cb9AfzMF5qss/HRWKfRhMBw9RY/URrWM7otmn0ZaV+/DaVh0mANRdWMmAoXcFRBgA8KihlWJDsdupVPOLxtsSMV9b28Gr4kw/wdQgNHb6GNvCoZyL0XJ4ITgBW1yg3RD03lNRdreNP+41L0oa8PbiD1aeK95lixabDiXuMe8ryQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zKf84hpH; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso577130166b.1
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 14:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742073319; x=1742678119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ROj216o3N9NIrqi8Fjx1+gCRTSuFyetUON+RRlcFjk=;
        b=zKf84hpHulJnpsvobT5t7Dt2GPchFYn03arFIIo1h4bVEWJCvdPBlWnxXGjAXBUa8U
         K5NCQqYqCfd9O4ePr/6rZ3hfLI8y7nBGwRU1CZBmMRqs19+JbRfzEb+SR/HLK/rBNrYf
         Xx72DoCAUPX5Ka4Ozq142+OL/zGaRaOB3td3blDS84PC+0F48dApsELTwbgayd821iuI
         E3HUEqh+NoD7YKyzGvLemRzCdXX/wCX0A++2rHt9YlKdYR8CZW8lqsVGtQ/9A3kacD7A
         qHv/aft9YX1ujJhy2C95elAf4GK08ShmSt3yOM0V5FDB1y7adgW29Qfak2Dh2xWDKmu8
         UmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742073319; x=1742678119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ROj216o3N9NIrqi8Fjx1+gCRTSuFyetUON+RRlcFjk=;
        b=jeGik9ooaAXfFG5yovVz75Jz3VF8+rFWJ5YfZiAj5xl1kx9f1CyR6aK9YAWHCOiv9i
         0Ju7rIckwMcj6B+4LMKlsEFVEQqgWa4BZYQtKqRc0xL9GiWbSyTO2B1CEQtaWFoM8OKq
         IMT9FE5u1osCA/QMzvwPdwtOTR6Y48yBu0lvz2UDq2BdxZ0k9M61qIpZHaUGDihASpFU
         /8cDcy7hENJ2Tom7BpQ0tzwO/NaME+/NazE0QzA0P2CzxDhE8bMe8HT+U49ICcnHySl+
         IbwX7QIGYT7wR7O+dZ05AQGNcS8DIZXtqhq2UcJPt/OYdajr8fKcw7RjMA2VOdIsCct1
         NVVg==
X-Forwarded-Encrypted: i=1; AJvYcCVxYEnSrXxRE1SZTn7HqCOyp9PS1aXq2eotaad+BC4UO7PArz7oF3JQpdGAMwzHK+uazxT1VFFYeFyAPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVauDdGOWKi0X2Be3W8vF3OgEHrk7kFOEjj27+fz8uY6MiyZu2
	2ST1GinDUqxiR19vH2c2kQ7wO8BpVLi8YKZw7cW4K2V2VqRcg5d8C4t3nBLf0/o=
X-Gm-Gg: ASbGncucXyHalZPK4IgEwCeEX1YMgqaBwWYP1lK6KJUgWVR861EUwuvI2m56GfB8D1Z
	NfnsWeEuwFK1OIot76g+fQ2WsD5kTzjiooMeFXw3VOcFLGmJidXxsi1DmnYx2DbIzdFx7nCVAiR
	Tv4fT9GA1nTp+MabvKqxSy7e2qr/zQMsFaIvPV27akzD0tGCXGkA2qwnz/HV8QNbVluOBu+N8Hk
	1DB6ElEvM5d+uGHjciaabWUifosxM2KmGjkStLG+E4camapFk7N9yAP6Q3cYvL5KEwI+SHEHzzm
	rsOxXR9vXA5zELS5EVaCJlICPok+zgfHHWgMRHFnoF3jdxpt1TrgnJQkr7Qg1N6ySKyfFOG6FkT
	1nDbeNdNvWQLUqgY2IRDXAT0+dXPZWpKozZv1eW/NJlUheCoxVQqcIoS++5Rtie+OWwqS7qskW0
	ugFNQJnUPlzKAIA5XtoHsHwEwOeR4IuG0=
X-Google-Smtp-Source: AGHT+IH0bAABeoUpgSN/b+SOv7g52vQT6B/odxUI4Fi5X2Gn+NFjX6xOZmzKvWBy8HLL+4chSe3TDg==
X-Received: by 2002:a17:907:178c:b0:ac2:b813:ac25 with SMTP id a640c23a62f3a-ac3123415b4mr1274450066b.14.1742073319069;
        Sat, 15 Mar 2025 14:15:19 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a3fc7asm417160466b.135.2025.03.15.14.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 14:15:18 -0700 (PDT)
Message-ID: <1e046d3c-8610-4027-88d7-56f73f95260b@linaro.org>
Date: Sat, 15 Mar 2025 21:15:17 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: i2c: ov02c10: Implement power-on reset
To: Hans de Goede <hdegoede@redhat.com>
Cc: sakari.ailus@linux.intel.com, heimir.sverrisson@gmail.com,
 linux-media@vger.kernel.org, stanislaw.gruszka@linux.intel.com,
 ingvar@redpill-linpro.com, hao.yao@intel.com, mchehab@kernel.org
References: <20250314101125.9853-1-hdegoede@redhat.com>
 <20250315134009.157132-1-bryan.odonoghue@linaro.org>
 <20250315134009.157132-4-bryan.odonoghue@linaro.org>
 <54b4b5e6-06fe-46f8-8484-3c86aaa46cad@redhat.com>
 <c9c6858f-a250-45d1-ac0c-3aeaa56fcdc5@linaro.org>
 <e8d5161c-1a33-4c7c-aa85-ff5eb2d33374@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e8d5161c-1a33-4c7c-aa85-ff5eb2d33374@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/03/2025 21:12, Hans de Goede wrote:
> Except for explictly driving the GPIO high before
> the 2ms sleep, it should always be high when we enter
> the power_on() helper since power_on() / off() calls
> are guaranteed to be paired (and we request it to be
> high initially).

Yeah I agree it should work.

The important part is t5 => making sure we give enough time for the chip 
to "boot up" basically.

---
bod

