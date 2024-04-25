Return-Path: <linux-media+bounces-10158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1519C8B2D2C
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 00:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B00228343D
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 22:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F993EA9B;
	Thu, 25 Apr 2024 22:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MBX6/cO3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB272599
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 22:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714084623; cv=none; b=kjdt2b3c3oPeKJw796BPdbksCy04aPxtZ+eqLIUUUMln0g6Z3cCga3qzTXQ6vsLVkVjL8VmKYJAFoGwMtSJzH20hsVNVWLpDtXhz78x3+Csmc+Mpe9olM2c6zX6cv/qo+y5kZ24bVcizll42UXRjJYX15FeQiqxvgiaBUuFJ4xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714084623; c=relaxed/simple;
	bh=fgYCqBDdsgL3TUYMV6KL67WzWgZ9C9IO/XvDEZ8F4x8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cehiuGbXteyIaOYBqIgWt1sKxek2lCSG3ywhmq1bzOr1chLBUyzHE7iChSCXn8sV8ZiD3wS/pZXkNI2U/JNOhiix6aLU3vFOG8Du+yf9qLk+9TTZ1rEcihSAhvY8VxGVZfyo9mQdOzjlRGzkO+6htMcH+CXfJv/d9mtBh0Ea9q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MBX6/cO3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-346b146199eso1127651f8f.0
        for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 15:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714084620; x=1714689420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4CBqUoCuF4O5Eh6sI6A8BEF5uavxSU2H/HBETvhMl/s=;
        b=MBX6/cO3xdQHUDBzwq/3SvLSmxgOrZlmTdyZ2M46fGc/eV8mSZ8601UcQQ4kLriPZt
         +v9DDdIaSlyEPRUxq/MhbO8ztb79Y4mO7HA8jNTOZx/qF4AE8UHTOKMSm2MxhtPEHZwe
         sAle7eXKi954HwFpsyXE7DNPwzqaTkmAQQi7G5utvalQiRN4VGHnDkp74mFDnTQAjCpJ
         Xr3o3kYhq5unTJK5mjxqVjFrIgdnVBI/WnEX4HBixS6NkwioqFzuTjlc8otU5hreyPQD
         pcGRfzTc5HFB4s1DLUZah6oyrx7Yl05w61POmRvg7MF+DUicCM39Jl5osO8Pr9d+ldUj
         4ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714084620; x=1714689420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4CBqUoCuF4O5Eh6sI6A8BEF5uavxSU2H/HBETvhMl/s=;
        b=DdnhTarJ9ZZuCdCjeXwI7hkjKYQx/y+KK4w9aAK8JJKFHsIT+ICNbJvASVKaoplR8J
         +zYxFG4gEMwMKXbg8LfH1hWDZs5OqpHBS9cDqCOwoEqw7FP8jyutlb91+LjpFXO6hlzy
         RdULw4wybQASNjdFXoofO03Blj55mVnWRXqiNZtGT3u6knMyjCO4OM4a/HChuXpDkVLu
         bGQX5FLXLE8/FziW8KIqRkO0eHZwBqZqqp6/UCIeIwVscb0MoXHVX8saEHiDnXLXeCJI
         QMG+vWn1zYTnCNhKALZywzQqNwaNkzw6j4bvQWI+Nwv0rS3xCjiCrHXRiCcRr7ROTX27
         fF2g==
X-Forwarded-Encrypted: i=1; AJvYcCX4h99OaS5mJXEx2MIB832OJA2Uizo4+PtfiqUPDjLzs1SayN/oQ4OUGJh/Ik6NyytOsKEuiEkeWNZM8OJICW1yMA3p25RrnelwT1E=
X-Gm-Message-State: AOJu0Yw6hS7MAfNyhsYtDwJ0NhkHsFD3XPaKCeC7cIrFb93mjafWFPBN
	pvjGoKEgumM2wDWJSrzIhlQwqECtYsbllkln+cCkRU8qImf7Qbz9XO9yLLMcfhE=
X-Google-Smtp-Source: AGHT+IEj1KqhGA6FhnDPwscUjPiLe0XOqsAkCC9t+dPUSczfdPKmS5JH70aBVwFx8ei4v/vRmHcubA==
X-Received: by 2002:a5d:584a:0:b0:34b:58a2:dea3 with SMTP id i10-20020a5d584a000000b0034b58a2dea3mr644562wrf.64.1714084619779;
        Thu, 25 Apr 2024 15:36:59 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d67cc000000b0034a51283404sm18438538wrw.72.2024.04.25.15.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 15:36:59 -0700 (PDT)
Message-ID: <a510d3c5-039c-45c3-b134-84da8a37dc6e@linaro.org>
Date: Thu, 25 Apr 2024 23:36:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] media: venus: add msm8998 support
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <df6859ec-9fe1-4768-987e-cdb14a887b9c@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <df6859ec-9fe1-4768-987e-cdb14a887b9c@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2024 17:53, Marc Gonzalez wrote:
> Based on similar msm8996 code.
> 

Looks like something that should be turned into a proper submission.

---
bod


