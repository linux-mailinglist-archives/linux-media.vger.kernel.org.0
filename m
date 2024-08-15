Return-Path: <linux-media+bounces-16355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7137A95381B
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 18:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2EAA1C237DA
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 16:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B541AED25;
	Thu, 15 Aug 2024 16:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S9OSXTYE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B560B1AD401
	for <linux-media@vger.kernel.org>; Thu, 15 Aug 2024 16:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723738656; cv=none; b=p0Kj6nHbbXZDdsfAFsFhEK6/lfmUKV+pStQDsjLcu0Vn0Pzx6QIdY3+EPfsHhkSq3gWkN6+O5qSh+ft10teazq8YI9dp/XXHddNrLUkxoAgPYthNhwTrKOmEtfKGooucbgy0AuDBJOprLI3slh6zDXdr9lPLxCUWiylalgTyswQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723738656; c=relaxed/simple;
	bh=ch0gsCNYQOMynpBENOSF85XS+ArOiHaWiv+clzji3uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eQqZb/NS0+i+ZPFYnuEouYE/+DRf/L88fN68MNJJWE1EFthX3F15wAyxNlhBcgV32S8Sp+gjYFIsDyQ9PanVyVokuzIpYau8bq8qV9Rq1KK2wpdtsWpf55wuScIaS0uC5PLNsrPtp7yz3jdoGywcoiUNPwYmT+Fg6WO8hpanHY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S9OSXTYE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-368440b073bso602444f8f.0
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2024 09:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723738653; x=1724343453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3hW92T01FcWfSoB3fp+6O6t1qTB3U1ClSBO9lOUWmw8=;
        b=S9OSXTYEkEy6kHkvzX0PWCbOMNOmeSgadzmq6Ra19SXEM52P0tmjxhXAc8SnTjH9o5
         OwLd55YzmlGAelwv6JiByhzEb59Zoy4zHuUTZbq0XBvhx+U2+1ng+lPn/btwz3Xp7HVb
         nv1tbIPsev3nN7XT7VJHbYxMfUo/5C/rWwIEWK9zrdUPiSiU7o0kE1XUORMsQSa6iioB
         0xVkxaYh7pAXMBbsNganGrsWMcxN2b2G17rGJbQCShRAwG/Qgb8Vh+By4yrP4+M91tc9
         HV8U+iliy0/CbUmNsKt5hkKAGCNspwENK/R3VEsIdKq0s0JVtvQ4MbYazv4yCNxeRWQx
         BxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723738653; x=1724343453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3hW92T01FcWfSoB3fp+6O6t1qTB3U1ClSBO9lOUWmw8=;
        b=k7dMqbWn/z2vkewVxFoId5lNb3e+w4ktM/KNs8z3R4OkbKb641cPXP37dlbrGSZpcj
         scShYq2veSGM4joyq/QpNW8b1recT5Cdbql3CFkV6bYt7Wz7XRQTIcwqgbwesV+BSGeC
         h/DMHBeWfiWDn42KQLfQZAh2/ynXdaZfi0LLQ6886/XSBAC7xA/StLQdBfkuWLwVM92B
         n9xdv9vg1Yw2FTXVZKDydluVZ3Gzhi4XsDm13Zoa3c0t59L7L0AHiKd3o0exp7ZgnfQ5
         JkepsskCy9wu1FK3YxGLsg0koFvM94qQsB7lRt1prnFtcfr/5dch6NNYt7r1fIBi07yT
         gh0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbDs24WfBMRzTfN6MPRsQegjgUMrlRWDaiUntg03SGPjyvPERAKYxhy5WmZ3/Rxs7pIm0GCQFxksF6U7sy/+pkKES9l58+3G+mQrQ=
X-Gm-Message-State: AOJu0YzYo0LQbGifV2xBTs+ZgR14SF7HrrBGH/qKbkei/9mAAlIvRPEp
	PGzqrqpWR2GdcaqdJvDTx3ozi78CQdB+x4XtnwssaNlKE9vol5THvfzRWJBCfyk=
X-Google-Smtp-Source: AGHT+IHOOQxFcTUyQDe12F+tfGVl/ysCvLAsJZ3nvierP2793j1ord1DrqBYtqgug10FWIcgBgcpgA==
X-Received: by 2002:adf:9785:0:b0:371:6fb8:8fe3 with SMTP id ffacd0b85a97d-37186c05737mr2340402f8f.12.1723738652898;
        Thu, 15 Aug 2024 09:17:32 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189896a9csm1876781f8f.79.2024.08.15.09.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 09:17:32 -0700 (PDT)
Message-ID: <71acbe5a-d9f1-443b-adc6-4557cd2737fc@linaro.org>
Date: Thu, 15 Aug 2024 17:17:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
 <6ddaa41b-86cf-44e5-a671-fd70f266642b@linaro.org>
 <eb77972c-9c9a-48f9-b850-21e6c2df005a@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <eb77972c-9c9a-48f9-b850-21e6c2df005a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/08/2024 15:21, Depeng Shao wrote:
> Thanks for catching this, I forget to add the rup irq, so this logic is 
> also missed. I have tried it just now, the logic works good, will add it 
> in next version patch.

Cool.

Thanks for sticking with this.

---
bod

