Return-Path: <linux-media+bounces-40010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D484B28CFA
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 12:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AAF81C2303B
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 10:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BAC298CA1;
	Sat, 16 Aug 2025 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fm1nCaGu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A905221FB2
	for <linux-media@vger.kernel.org>; Sat, 16 Aug 2025 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755340814; cv=none; b=W0QKJuiksVYjG/o6y65usY0uGJLOiBoVLUj1SNHH9nbyQN6okdILotIyWBQkt8WbbI4QmGVB/AdZMuk/OxY4gosgzVAxdF2wQFA7waLq2E4FL70wNgxhrjg1pQJrX3XjSqJYfbDe2+jJzpxJiP4MNXzmPNJF6Wkz5qrwmnWicKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755340814; c=relaxed/simple;
	bh=xDCesgs8bOhRL6/nEJLkgt+FdBHD+t772CYVE3HpMUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=drQjuU5hP1VTF1IJt5BpN3OlRJowLusiMIekeQuelc7tFJPJyHcHFh6L+3IrAWXgWKeNDJB9UNzZwme65Q/weyeAn5b1+fY5K/rHn2nABTX2YL019h3EEDpIJwZDtzialVnGp9AgAiM/s0nrqqRmkYXz4F1MUQRG+dSQsHv85nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fm1nCaGu; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b9edf0e4efso1737825f8f.2
        for <linux-media@vger.kernel.org>; Sat, 16 Aug 2025 03:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755340811; x=1755945611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CNCJA6QUUK+uVCAqEH7BdfhhLl78MFNK1pDau4L8ozU=;
        b=fm1nCaGuljRPEG4A/ROUxdOCeYefn3O3kYdgZicfzRY3e5jgmMPZmEWHjFp6utUO/2
         ecGrRvMfOm6kJ48GRv2dlV6MdiD1X9JZriUEyqpt2nY9UiAnnWxWDc3OdynDs3CKV0yE
         9C8DZ6Ur65P1YNBFdQfLdrM652X7kkttt+3x5MCML7dkBao6t+o5hFi7TnNhtAQdhNV6
         RHjNTc50V1GNO+PLORvxjy/6waGTz+d12jRGyfUXUdg+uhaBOfhWDphCc+3TMLfqIBD2
         zfAfujPf3AgykBX7T8hYDp6aJOSfU2RU5Fmr9ybJX9mNKo+blQQ7MJtG2dIF3qWJxs5Q
         xYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755340811; x=1755945611;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNCJA6QUUK+uVCAqEH7BdfhhLl78MFNK1pDau4L8ozU=;
        b=izH2ysRfqQklkqfQdA7+Qlqr0x6TbVlYCgjHKo97WLHXelVTLCJWLDiloOpy3i2vgW
         kYEnXpKwWGMQVrWQcPCYyykZy3j0ydGx3dk/L7ItVV2QwwVFVCeDhvBAw+TmKNM1yF7o
         amozGkwBrtFmJmuwGWZAyiA84odtHrwomOXAYJAmcGcgUKevc6+zecl86CCROHr6NaD5
         IXDsDURkFkpCjpkYjnLEVZRRyjkuo7sopWJ+Z7rKGF6tGs4FvKbl3dPTah1o4qy20P8A
         ahk8AwOvttkHrU79A6lmuoR0/KikzeYPbSndXTfkczEL6Cj/K9ubhDWiHac92LE6f6Ow
         /7GA==
X-Gm-Message-State: AOJu0Yzi1Hc7AVkSDGnExS6/fIHmHeG6CKzuVOSK+lB2UC/tDdrZaoR5
	n0ceQraYAN35byF7eCbfVsxY8CsxY/JGO/zLwvZUfO3VEjUeDLTMliU6o2AKApxt/Rpe1Y29LGu
	78L/3nWU=
X-Gm-Gg: ASbGnct10S0UL+SdKyWj0FomJghF2ED5Jr0ht0dQm2FGBoivPHzXDgZtz7Ey25rGA8p
	tnjSoUjQOLlPZCxnj2LWoKPNnJKuL6hBRHac5ihpiQOm/GGX/klb+YbRXu8P2pLzgWprNTonAM/
	OUxqKJ7dDqBFkMVMn16FWddDm2YsTar26xw5y5OIRFVgIJ2GQuzHiPJTJ7yAqDe+rADSC1Dru5A
	dbfcPK3foLGvfJNnMjyJ9MiJhcMfBMjV8zaVU8fVxW1gbBFQzZEhq9XnBrIq/w5+Jhyck7WDcg3
	kcHaixMLDnM2U/xA2CVEinX6SLrT26lxnfykTHL5Cdo36jojO8CIVBqHxlVoJY8cFKr1VcpIl6x
	HnOar5tnA2KI+tppv5DB1K2YzUVEP3WtILk2UjR3c6rPJhm7FpnhXc/KyzEnxRo3e
X-Google-Smtp-Source: AGHT+IH9y5g9eDW3ZyR31wyNx8tU7SHMvCmkDzRQOX9w5fpIXbwluXssS0cmo4xuR8VXa39wuXAquA==
X-Received: by 2002:a05:6000:2005:b0:3b9:1056:dfad with SMTP id ffacd0b85a97d-3bb66567b2bmr3798630f8f.3.1755340811496;
        Sat, 16 Aug 2025 03:40:11 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c748a9esm90820815e9.19.2025.08.16.03.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 03:40:10 -0700 (PDT)
Message-ID: <40673a17-a19c-4722-ae5b-272082af917b@linaro.org>
Date: Sat, 16 Aug 2025 11:40:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/24] media: iris: Fix port streaming handling
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-4-c725ff673078@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813-iris-video-encoder-v2-4-c725ff673078@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 10:37, Dikshita Agarwal wrote:
> +	if (!ret)

I think you should have a consistent error pattern

if (ret)
	goto error;

Once amended

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

