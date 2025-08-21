Return-Path: <linux-media+bounces-40609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D26B2FBC7
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 16:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 565AF16DF0F
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9D11A9FB7;
	Thu, 21 Aug 2025 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DpuhgHNs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E4D1A9FAD
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 14:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755784857; cv=none; b=rUdPaSDj0V3DlvnU1mCWIaC2/JCOJWtGB3pBNpEFS1f2q0iFCoqrpsZH1fEPoD9T82caK7a1BFTGr0gpPQn4kBnIzR+719PvVTmhX6uQOdHD198dhrHfrOrK+fQgH8Mzg5ZEHCrwP+c/O2os4eOs0oV8JRJaAKS/dyotdE8C1hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755784857; c=relaxed/simple;
	bh=n8EeR8AlRHg9lyRDsjg6aUEaZNeYvKvFAxGGH0Dl8PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNXiei8HZ0jhOPsXxlEgwfXCYNN4OQlMViyRhS2uqTGsThTUJFvlcZkQAUzz+lbLkEXC5SxWmJ+fVfm8s9MNz2b9tfoSORNTvt9ys8011h8Fa+9BHV4KEPbFVBLrjrdg5Sy/keAbHjV6fRSxHf+8hsdkkjYpdK1VO/kef+USp+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DpuhgHNs; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b0c8867so7702705e9.3
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 07:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755784854; x=1756389654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8EeR8AlRHg9lyRDsjg6aUEaZNeYvKvFAxGGH0Dl8PE=;
        b=DpuhgHNsOHT65Vei5tB/ZB30cwg4KJLeNLOztB1MDSGorv5MCbJZlG++uRsV3H5Jr2
         gVYqtrxDLBrDh/CtasgWJXUeUetYIHNlY+A7L/fNEDmk5kJnhW0LYXEWP29JW1f8zzek
         KEM47op/Swxzfy/AJtcWq0Owfv974khND0fm6evYn4qOicuahcyEYvGYrk0bi0kRzDHZ
         710hALMOUbWX8HPfxWwNX7U6JIULGluTl7U5yHVxb1FOejycOwyESTQDTNYiI3SdUpC0
         DRcek3NXySP78HjLtk0W3x1UuS1pyGOmTWHmnruE4AqkOsOKWoxbMH0YIBoKKAmVxM0q
         Li5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755784854; x=1756389654;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8EeR8AlRHg9lyRDsjg6aUEaZNeYvKvFAxGGH0Dl8PE=;
        b=sku7cJdaEZtpPLhhF8HyZmJi26nPmSvkejG6jEEuKxSVwBTFRremRZnQMfMJ7sWLKa
         N1H/2WK2jV1saM6dXaV+RitM689s13oAWT8TKapNXCAPIth+uvhg4rXDEXXRpLrdc9Z2
         Eki6VyvQBNrRp+q9qOXTbkbM2216R6TZIreppgQy1M5WZ/lsoIzsgEGnBY2NfnB2A6A2
         CFOBrB3ahgh0x/UO4kJz5NJwW3lwBvJ8BYdI8ElqgDkG85z/2ax3MmoazLUA8ldb+lvk
         UaodNnuQM89pS6z1vZej+EDZe2frXDSY2T3+LF2tXxl3CZi5afpU/OrxT6ANAXr8KKRg
         YF2Q==
X-Gm-Message-State: AOJu0YzcDb6SYhbQkeOUSUC68PZHAgN+4xxE4ckXShlFpgVqrZwn2dOt
	XM7mCZzcajdaW9NI+defMysty7d5VAuu0hgwF7amRI3qaxKeDD61SbMHmjYJSz9zT6Y=
X-Gm-Gg: ASbGnct6BqhKm8ZF25BhI6ScAddjCqzn5J4a+YZ88c/GXHmNRyOkAR3zUPYuaw9vt6F
	7cu7hFUIGlY+u37s8NqA8lcegqbyqZFhAPmMnex5VKtq4xZ9iGouArsK+I3mYW5vBarZc8xlaXZ
	OTJGgjr0yLbjYJlbUVssSu5DqcT9bkJr6mvYRs24q+GjJgPUgHbLxzqfm4KgdJO9ZoukHo0q3Sb
	6AhY98NGBbBbln4b7wj+bO/Qcs2w7giqBo3/Rr2exXLeqsYkgwiFsy7Vj3BbRT3UrOlhab5TreW
	WpmEgYRIu3i5Ruaj6zvGchrlXxYBbsd9edoKL2SJfve4NdRikpqjn1qtxQxOcWfLs8utCAoXT1I
	Pn6FNbdUBCuJWDahHajBY41hf0jo9bAHbz2DBYUXdwo8hklElz9ibZWGJ8QsPqgTg
X-Google-Smtp-Source: AGHT+IHkgchaFKWj5e1UqRbNztw1zXa8xxHeaBCgL2s4YsQqE8YJMTF31NEBDYvPnsH/XtrEWLoDDw==
X-Received: by 2002:a05:600c:a43:b0:456:1d4e:c127 with SMTP id 5b1f17b1804b1-45b4d7d687amr24197735e9.8.1755784854158;
        Thu, 21 Aug 2025 07:00:54 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e8de85bsm12008615e9.7.2025.08.21.07.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 07:00:53 -0700 (PDT)
Message-ID: <9863f7e7-ef3e-4f57-bbbe-9ac4aa88a426@linaro.org>
Date: Thu, 21 Aug 2025 15:00:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: iris: vpu3x: Add MNoC low power handshake
 during hardware power-off
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
References: <20250821-sm8650-power-sequence-fix-v3-1-645816ba3826@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250821-sm8650-power-sequence-fix-v3-1-645816ba3826@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/08/2025 11:54, Dikshita Agarwal wrote:
> Add the missing write to AON_WRAPPER_MVP_NOC_LPI_CONTROL before
> reading the LPI status register. Introduce a handshake loop to ensure
> MNoC enters low power mode reliably during VPU3 hardware power-off with
> timeout handling.

So right now upstream we have an incorrect power-off sequence.

In which case this is a bug fix and needs a Fixes: tag.

---
bod

