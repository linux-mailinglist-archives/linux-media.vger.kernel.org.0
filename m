Return-Path: <linux-media+bounces-43316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18104BA8715
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 10:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 359327B248A
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 08:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1854F277C9D;
	Mon, 29 Sep 2025 08:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CmkQYJ9U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A952526529A
	for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759135583; cv=none; b=p+AnVYSuc5Jd494JtAqOTjbpoZpbCUCt/mSkqrziuH0Nc1X3vYvnqXlUt/KsiZ4IrbKLLFOihW2PPtrBbXMNe8XXnDwH6jw2Lr+FqjDYuqkHclZEvBXweiASIDoo5RtCSdMOFKQAiNtqdGJc/JeChDHIttMQSpd1AeZsohXS2Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759135583; c=relaxed/simple;
	bh=elHCX2J+mUL+jknpKGeN90bcu2WaP/CHNiOnbcSUmQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvZtyTDsJJnCymwjfOsr1DovMrnNRoQbPVkLOllPixZ/ipcFLW1j3G4AOSTktuZC4+PmeFSZjMqGZjQ9jLBHXHCS62Zbtg+QHcLbGBO2H3mIlD3NiZNDKJAVR7Cyxh6nD8gqxbI4OeKzC7LBzrnRJe/MWA3rP05DPXula3rhHJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CmkQYJ9U; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57bd7f0e2daso727204e87.0
        for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 01:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759135580; x=1759740380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kxq9PcJJJz0spR6MwcPMvKvnViO9P8tXOB0T4VWVPBQ=;
        b=CmkQYJ9U+GliEz7nRk6vJ/DwAIKRba08MCUMyI5GDxnWaS1mUyUUhRi0VCbXQmk0Cf
         YZKPcnTOb/sNct1CqPhjAGVYakSSDo0Gyp5TdH1wafm/F/D5H/VvIJALB1YqH251ho4+
         duwqQEZwUirV4fpYY0KOwTDqG3JnJHkxvrcVC3FUoxBFJoxEEX3jKj2g2aKUGUwRMZAI
         VxoBMD7Rb6C8XjyzBK+MvQnC4QkG1NGvSgNCGGwBrVin5XgR2hZxUHr1Kac0t7TgupDM
         JRanGLiULD7C5b8YXYoSlIfZyKn2czhrep1aDq+LA3huJlttvrCmRYW8SwLeaen7n9NJ
         W1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759135580; x=1759740380;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kxq9PcJJJz0spR6MwcPMvKvnViO9P8tXOB0T4VWVPBQ=;
        b=KiDvQRU2MQGFyfvbKw4oAuRy4npgGMf5O/khMBEV79MVyN1GUgL0nu3ULZ6uZq5O91
         N3rYh0kwp7sqvEvVUY/bNty1wF/bilIWzCSzaHxK1V415+4eGnBwJKWK5np/mlo2kHOz
         nQFgEd6xPeVOCz1MD0NOpZ4ERetMWiFSk3yvaCgmKR3V/8qevo3xr32lw1M6woHB3vFr
         uvdXoznzu6winyW5w1W0gEBR9ud0ooIwz6TZFmu1kEFM3Z1/bndFRl8BjhfuItUX+y8W
         qb9Qf0829j1/qKr9tcs36fmWktaIfadSJ5FLuBram30AKneTIIoPSRZuFuHzgkCc7BZx
         tfxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFYhNrLE8BMpBEawAGYCvCeXpj0I7cwrSVZir1PLlp3Djrz9Nge5ZA1mULq9W8QIYJxCbOvUziCfwlmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwQ8VmDUAC8jQT/i4nIkmvls++dtTPFRRmsTczM37YI69FdBcX
	JLqPrqGfKkVInt1kKnl9/f1RSNPYSPSeVXmh6Dp2GhzFHCBeDZR0sJ7uAKYZZCH+zHU=
X-Gm-Gg: ASbGncvIZx+chHrZJ+70kR/XIm6UWEvBhgl6aP5wvVB7qi6wURbEbmBML2zBax00JrA
	dFC5Q5wtpksawFDrKVVuIIp+HRCVHX2baL3XWVdrJSboHAcNke7sfrNvrG6+jEOl7LanyXpooVL
	WW/M4CVERrnF9ybpRheonN+Wfgz0GgRy2EsOiZnz7WS+RWXiQ4LKcYfI0+VMGqXQ1YXi9uxfui/
	xw2TXFhUc8Ou2kwDuq6zVjZwxZLK85aszDiroAbSw3dM4cvobXp2Vy4d13NAzaivTcrgEwmru6w
	QlgV+8r1r0D5tR05HJQCcF67PWAi2t6Ll4lcUnyuY60y9ZIYCfopkx+d42B7LLr+HzyzcWMGV0S
	o+xt95GlLzQ5jDQSFL6waEqLCgX31X6GNcwXU0i9mNbHlUogu6eXkKlEJp1CRGwZA2GEfGWJpiw
	pliA==
X-Google-Smtp-Source: AGHT+IFIjTl+y8eSPvSavTSLzI1Q8jLm3uTQFD+1kwjOwgznMH7R9DOWq1dsckUO7nJaFttB2+hYNw==
X-Received: by 2002:a2e:bc0c:0:b0:36b:93b0:2a8a with SMTP id 38308e7fff4ca-36f7ec73bb1mr25499411fa.5.1759135579722;
        Mon, 29 Sep 2025 01:46:19 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb770fdb2sm26762571fa.43.2025.09.29.01.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 01:46:19 -0700 (PDT)
Message-ID: <0bfc50c3-2df7-4e7c-a6b7-99b8e56a65ea@linaro.org>
Date: Mon, 29 Sep 2025 11:46:18 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: i2c: ov9282: Fix reset-gpio logical state
Content-Language: ru-RU
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org, dave.stevenson@raspberrypi.com,
 sakari.ailus@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
 robh@kernel.org
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
 <20250926073421.17408-2-loic.poulain@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250926073421.17408-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/25 10:34, Loic Poulain wrote:
> Ensure reset state is low in the power-on state and high in the
> power-off state (assert reset). Note that the polarity is abstracted
> by the GPIO subsystem, so the logic level reflects the intended reset
> behavior.
> 
> This breaks backward compatibility for any downstream dts using the
> wrong polarity.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

I kindly ask you to specify the intended behaviour in the documentation
Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml

-- 
Best wishes,
Vladimir

