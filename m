Return-Path: <linux-media+bounces-31097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5655A9DD94
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 00:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 041F018998F2
	for <lists+linux-media@lfdr.de>; Sat, 26 Apr 2025 22:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6CA1F463C;
	Sat, 26 Apr 2025 22:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="btjxpTOY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A974E49641
	for <linux-media@vger.kernel.org>; Sat, 26 Apr 2025 22:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745707057; cv=none; b=JrEJkoBuAgcVAElzy76fA2q1kfHiKoUvErGmQKo/G/YvhHSZOKkgdc/8nWwwN/Mkc8ZuR/twBZnzj1caeTpwMz6Sl+O2IdqPojBDJ7uwwbHaEnoEGxc/oeYT5ikCPrKIHTidadc3AnqkD6MQtcpbtg7IEtOkwmv7wdi5g4kYfOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745707057; c=relaxed/simple;
	bh=85/xY6zvkdFUSZvI7mZmI2AeuiVB+7x4tW1nYcdkuMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hIFINvolM4JNtoj3IpcucTRn+jkrK3YPgEAcRO39Viu0qJNpY5ukLufee278zNihWdvosUKhO3xZ5+3KbzmLrxLpMwm6414/W5T06pfDuVFBEm8X1UCMypXi8o/ZteYQzPg1vmi6wFsKnKCW/GZP1Zl2CU1PE3mVbjEOZCFVG3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=btjxpTOY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso2836286f8f.2
        for <linux-media@vger.kernel.org>; Sat, 26 Apr 2025 15:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745707053; x=1746311853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H9/3M5OcbCk6cAl9uxHkOTP3E3n9i6GOVsSIzLH01mM=;
        b=btjxpTOYGJS7eZ0OMIr5ncPsl7JSfkPjQbE543HU+i/7iKV2ERMmEmdkdVac/Tgzv6
         6WiGX8hZU2VKiv4m+n5KxJByLe8xJ8d/+rT3Zgf18Z8UVsWpi9ryIuIwXGHe1hR1cLg1
         jxivfnAjg1s4QCUli42cHrQ//nIiSZH5EyYQMCZ21VPc1uy/fT28YNbm4PbRRQ+kb3Bt
         Y7jO3bKPkxD8+6HbBhAlRYvDquZuoEfMNc45lWtQsPE4KgbJ9dCjeIhBbquPRy0zpzIM
         stMFekRcUgJYbcMjOoftU7wkD+o9s/TxS54wTjwgRKlbNuk8z6WAa33kN+vxsjOgpZ4I
         LtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745707053; x=1746311853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H9/3M5OcbCk6cAl9uxHkOTP3E3n9i6GOVsSIzLH01mM=;
        b=Ass9eCAzcY7RV1JRNugO/uMH6OZugUSXlpjnKywuE22NNot0Pl54+6tLLQTxkw8E1p
         iOuV1zdg0clEeAf87icIB9lVOvikmBJsUbvOEIABPZq0mC5luBHhzn2j7r7TFL08T1io
         Z75WdV9vCWQunt5fH4KxR/5HQox1a6b4ADTymFQ3SNbxUa9uJnkPtfzFD4I0AgI5G2tb
         HdLj9GlHkwiceQ7JHTGxIV8jXhi4Zdu3/+6znSaRv+ZfMwbX82lYk+7r/E6QAjgYN5cO
         UZA1M4M8aBFdnVYc+HMJWHl7cUikiLJjACryrq7emzUzEUeaAeZXs43pEoCndIjWU8B0
         IvcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC5m9UBIywaB2yDhh5RM/AjIjgv+3K7vheGaY8xpsCIvJ3lQuePWmkCT3N12/jR9QTcuueu9O0BONhYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIJR0RajUNI4xXdOF7VjSm/Ohz5oOnNPWAh4IQXVaUiGAiLJA0
	MsQJNHVTgJEJ6LqYNeET4rctbDylr2/Ga2NSzv0u28On/dL6DeApnw8ZKS/j3JY=
X-Gm-Gg: ASbGncuMvainNhD6ppSZKdc0E63tvTEoQ68g+mhqpgJ6oGWLb8ErY9RKJREpc5NF4GE
	xO8vmxd96QVW7CG6BZ5Ns9/Q5yiBQSk0rWhCv5Ufw0rB0KX9T2YFee+p5xuiiHkkgAR8F+DQ82T
	IiPLzjoDROMnNIcHoadwB4I+KHTZnVIcQBVTOHMivSY+iSvsDjWL0xPW1CiFVr8aV0ncBvNlKGO
	oM76reidhlk39PUc6lN82jCL0cjgImPDAR6dBYCbspgATBr3Ekb30pAQ9sm0IPwhAsDzIUF6ULM
	j2OMm4v493MGbhKHfCPV2A5ZAi5YHV0eh96c2XmvHZYGiGwgxkcpAjC39Zz55/fZNjC2JVTYOFH
	4VDSRQQ==
X-Google-Smtp-Source: AGHT+IHE6ssyu1VQrTlKw6cJHkbVJwB6l1jTjQ635U27JN6FSieBHegSECT7xHup8qJA28bUuwnvig==
X-Received: by 2002:a5d:64eb:0:b0:39c:dfa:d33e with SMTP id ffacd0b85a97d-3a074e2f21amr5088099f8f.23.1745707052961;
        Sat, 26 Apr 2025 15:37:32 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4742sm6641390f8f.23.2025.04.26.15.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 15:37:32 -0700 (PDT)
Message-ID: <6b3fff75-9ecb-4855-8dc4-9629c96e46ad@linaro.org>
Date: Sat, 26 Apr 2025 23:37:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] media: i2c: Add Omnivision OV02C10 sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Hao Yao <hao.yao@intel.com>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Bingbu Cao <bingbu.cao@intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Ingvar Hagelund <ingvar@redpill-linpro.com>
References: <20250327164927.30741-1-hdegoede@redhat.com>
 <aAs689anIBXqRbyG@kekkonen.localdomain>
 <aAs8seKtD4DUJ7Zi@kekkonen.localdomain>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aAs8seKtD4DUJ7Zi@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2025 08:41, Sakari Ailus wrote:
> On Fri, Apr 25, 2025 at 07:34:11AM +0000, Sakari Ailus wrote:
>> On Thu, Mar 27, 2025 at 05:49:27PM +0100, Hans de Goede wrote:
>>> From: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
>>>
>>> Add a new driver for the Omnivision OV02C10 camera sensor. This is based
>>> on the out of tree driver by Hao Yao <hao.yao@intel.com> from:
>>> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov02c10.c
>>>
>>> This has been tested on a Dell XPS 9440 together with the IPU6 isys CSI
>>> driver and the libcamera software ISP code.
>>
>> Thanks, Hans!
>>
>> I've also added the DT binding file to MAINTAINERS in this patch. I guess
>> that's fine.
> 
> Ignore that. I just recalled why it wasn't there.
> 
> As the driver has a DT compatible string, now it'd be a good time to add
> the device to bindings in
> Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml .
> 
> Bryan?
> 

Done: 
20250426-b4-sailusfor-6-16-1-5-signed-ov02c10-yaml-v1-1-9a46124fae7b@linaro.org

