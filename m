Return-Path: <linux-media+bounces-21053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C10369C054E
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 13:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DC85B226E5
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 12:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3850209F4B;
	Thu,  7 Nov 2024 12:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V5hSW08C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F092076A5
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730981277; cv=none; b=owZkLYGlken5HF0ekhj8ZgQUxlod+nRHZHUa8fTYGOHAKX3pJnn6zFGCqzjo3vv9lYH77Ul5riDw+xae+TA/stVKnTul5Wv+xsysHCmHdZBFv1u9HrzLGuy+mWUhwy+Vjym34XSCABukmcMZc47ZiEWvHes5YwU5LStHiQjclIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730981277; c=relaxed/simple;
	bh=rKbiX0VIxrlLI+Q9P5b/AZEQ9UB2kI1F2AvhStrh5jU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUg65Y5nffcpMelyctKPYhHbNwB+vn0KCq9t/wm62jnHT9PBLqfUCIyxHZwuyJfWYyPWWvCpi9kQd0xhdWlHUFAXtZYU1q1Rw4EjLU33IYnv0YwPSUu1hIcbuDOThV7rOxJO1/r9OGS6JP6PYrTmxV+lj1Lo8xUW0SQGjG/6NN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V5hSW08C; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso476765f8f.3
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2024 04:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730981274; x=1731586074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hAbn1Ykfp9his+u2uJIIvTrMc5YEiO1rQix+MP16MdI=;
        b=V5hSW08CxTRHpnGrMua0u5xJDFUFtemXuMEYbZH5EB+KgW/WyULtQJZ1pKTPyQ4E4Y
         +ztffunDMug5OBAntPcVllbVTn1JRARdi19QA5+Fm791IqtEprATHEjwMSH8qzXr+0i0
         dEQ+RYHV+pUb+bWcOVffw6/fTpfixk05vlrEwmk7LDLXa5Q2C51OjxNze6KBJmNNJzE/
         iw6xBWXN8IgXG+f6ePYDdIow6qmNmTFSXSYFKxPPDE69OirLDvx3bs5dNMaOl2cUx9QI
         kj6Fk/SYo4P8WuPpDp4bG8C7pPajSQI3+aernUbSEV13rR+iu3wYuIS/ICTEKzyGYIKd
         vzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730981274; x=1731586074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hAbn1Ykfp9his+u2uJIIvTrMc5YEiO1rQix+MP16MdI=;
        b=UfInt3xGQIA51lNJSKf3vesvepATyQCv2lF9wTppCWClnZoPcVaxX1QWJaAXGm8vMT
         jRQTv/ouCNb/sju8lRUHK2Ap7dqiuhh3G69b9VdTuVG8I9Zg8Uhu1OWbDBdO0h1790il
         1jYb2gg8d5UVerIQRXNB7YoHRC1cP6m9sjyZBe2lhtFKZwQVNXGkRH2jzC3boV1gdMOt
         VlK06yXud5Pp5Llm9kD7/wKL+qpdUFIruFSAwWehvO+cidNHf2RFPPSbRTvdpHb7z3A2
         ukNrFBnvzsUgas+shqfZqcEUSU4jo1dpdsGAS+vkg7SUsYM/ri7tsSLMB6XSVOvAtvpI
         tOeA==
X-Forwarded-Encrypted: i=1; AJvYcCU85mV7rrA1uJfhJlv+qwB0pHOgyOA6lrsgbmjT8UVMAG5CQObXguGvAiiouqvKEIRy4vv5qWuRdm1TWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkC520TADWK/N1G2XqjiI7MMK/ZIOGqoAMN55c3liSE6W80s3k
	C4V7BtjcCO+JINYMoFfMrGs3H+nWtIQjBUPUM/dBYFYuoDUb7jv95qpc9VcB4Xk=
X-Google-Smtp-Source: AGHT+IHC6ikPOTItf1oVoB8X5+KaaDLzrKVpzqSOI+8Bg2xedEwzv5KM2i7ux46gHe49N/Qx305z0A==
X-Received: by 2002:a5d:6508:0:b0:37d:5084:b667 with SMTP id ffacd0b85a97d-380611593b8mr27756363f8f.33.1730981274007;
        Thu, 07 Nov 2024 04:07:54 -0800 (PST)
Received: from [172.16.24.72] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9719easm1599755f8f.9.2024.11.07.04.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 04:07:53 -0800 (PST)
Message-ID: <975f4ecd-2029-469a-8ecf-fbd6397547d4@linaro.org>
Date: Thu, 7 Nov 2024 12:07:52 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
 <b2yvyaycylsxo2bmynlrqp3pzhge2tjvtvzhmpvon2lzyx3bb4@747g3erapcro>
 <81d6a054-e02a-7c98-0479-0e17076fabd7@quicinc.com>
 <ndlf4bsijb723cctkvd7hkwmo7plbzr3q2dhqc3tpyujbfcr3z@g4rvg5p7vhfs>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ndlf4bsijb723cctkvd7hkwmo7plbzr3q2dhqc3tpyujbfcr3z@g4rvg5p7vhfs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2024 10:41, Dmitry Baryshkov wrote:
>> init_codecs() parses the payload received from firmware and . I don't think we
>> can control this part when we have something like this from a malicious firmware
>> payload
>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
>> ...
>> Limiting it to second iteration would restrict the functionality when property
>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED is sent for supported number of codecs.
> If you can have a malicious firmware (which is owned and signed by
> Qualcomm / OEM), then you have to be careful and skip duplicates. So
> instead of just adding new cap to core->caps, you have to go through
> that array, check that you are not adding a duplicate (and report a
> [Firmware Bug] for duplicates), check that there is an empty slot, etc.
> 
> Just ignoring the "extra" entries is not enough.

+1

This is a more rational argument. If you get a second message, you 
should surely reinit the whole array i.e. update the array with the new 
list, as opposed to throwing away the second message because it 
over-indexes your local storage..

---
bod

