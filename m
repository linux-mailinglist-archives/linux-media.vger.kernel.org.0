Return-Path: <linux-media+bounces-27568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EABBAA4FA4C
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E602A1891166
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 09:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891D52054FB;
	Wed,  5 Mar 2025 09:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jjLVv2zL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBBE1FBCB4
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 09:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741167461; cv=none; b=kircb3YO9TQbm4vZvzeUTOgKDqNMoIHXlToug+An8ujrgDmzzR2auv8fgM/OqRJn+z3d8RyIV64V6xbELPt3I4uYv6U5cakiS9kJuBktkGUTzt4+1oc/6kPWxNLjGI8TutPUrYk9+jjUaBwVo1+SRJj8++3ImfevG0/uXoFf3T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741167461; c=relaxed/simple;
	bh=f/YM8elcYOSd+yUfoQceb/I+xg93FNhGvdv8uLMVd/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ih1azzp9bAy9iCipreKHd87b1ICgOs6Vysjm4Nf3q1CN9KOeFqpTTocnhS+dW6DMaCFrjK8Nvbb6eT1PsOVGYr9Qeo8QZqXMg+rx1ukfZQIL7DBudvyLUGMJH07l2km5RWI7U7PVTs+0Z5S2H1HS/4e3sHhr6aIGZVA+KLuwiwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jjLVv2zL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43bcb1a9890so3725775e9.0
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 01:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741167457; x=1741772257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DlMAIxbaLxEVqrgBKFsUbTgWZrSdfR0A9Q1RePUhWM4=;
        b=jjLVv2zLD8XMQF7Ym5DgkTtVaFISxzWVRxbZA/kVlKdKwIJ/tQndEMXhbIfdWb1OzH
         mzjkb2RAsZKlZd4sv3QwcmKFOhR9EfgA3f8o+NPzUT8N7P7U8wvTTSawtwJ9l9EXXi4T
         aoXDpqJJl5R7RTh8lilcKUZ//C75+g8AvjlTdgzpNPoWLrNcLOmISmlpK2Q9+i9KoFMy
         gusNaIqZqFZqn/AhCPIlKuQ7ZQaUuvedMA3dgPABfiT2VzKfRDVpsllsnyC2JOCDoGYK
         FtVmNJMRx4alWDmb0TVAxiYVDpRRI4Nmsmk41LZhxQyVVm1fuNOCBtWhKjbDo66eb2nK
         l5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741167457; x=1741772257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DlMAIxbaLxEVqrgBKFsUbTgWZrSdfR0A9Q1RePUhWM4=;
        b=xHUl6PlZb54272q3IKq4Ln+FyZN4iIihKOUEUVKelZX+9mH24bp19bQ2eUavaq11x9
         l5zokRWK19xd4q8XUaaI/5rtmaYx5w7+FOkwx8YUrhmxO2tVfvx9RE6iODG0xLmaYxpP
         gZYUOkt26oVJOyeMJb76wnuAxNLRC2QGr5qFkVqwq1YtyRVU9Ef6rz70xzva/viDJCeK
         QMl67/uVDI+5Bjx0Nu8dlEwKVv+BG4dNFXkzpr0FAe1kEfGGhknVdkIlXAdbwHgTiFu0
         IzEs294E9zWmXhYMgqYkDSiA1M+9ih0yxg4U5WuT0W+NgEgwEXP2YFZiD7DNeB1e/qu4
         G1mg==
X-Gm-Message-State: AOJu0YxzG/agSFUYnqPOWvjBs84Yhtd9cnbw8wWGDTwUZn8BZdxkWwS2
	nKA2yPus34l8UlTvDxqlWLbs4O/JByYIhDRdy3h7OXlBPRv59MBfNVIUCcQeaI8=
X-Gm-Gg: ASbGnct+kROFhrX+CcJLd5y3mZ03xyNq5Ufg81eb3v8ul08KmktBs4ikRof360eStFT
	EyY4CMjVHopJwI10h7E7UiUlDcdx0/j269XdU+eFj1XNVsxydvMNT+2OeIw+zqa4xXxKqA09FLf
	J38jpLg+mKWXB5vyaEyl4EoEhO3SguHA/LJ5iQEvy8YwIn/rTsCSNNI7RxPUGgt2sWfzODry6ai
	Wi2B/35cUSyuzoIHv3SwQRkTtIyCrh/ukpFhS4V6WfwF6wGE4mU+ZxE1Y+mkmXqKKNc1yeFhUM5
	7ZD//jh/6M6FdYmWrFx5f+fDs2CfHyK0puvyNyWsTl5HVvO0BZaclHUmucNPVWgZLHielQ1ARvt
	/CVEEj11doQ==
X-Google-Smtp-Source: AGHT+IFmN6TeDKmjpgD7xPBfMAW6BMdRHuVJd+Orgg/yUW6nDI0BKPDiyYdeZaHiB3YJo+Czk4nwww==
X-Received: by 2002:a5d:5848:0:b0:390:ef45:1a36 with SMTP id ffacd0b85a97d-3911ea413a4mr1912238f8f.19.1741167457477;
        Wed, 05 Mar 2025 01:37:37 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e479609asm20159886f8f.2.2025.03.05.01.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 01:37:37 -0800 (PST)
Message-ID: <38257fe8-e592-46c7-893e-e61ef229a607@linaro.org>
Date: Wed, 5 Mar 2025 09:37:36 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Reup: SM8350 and SC8280XP venus support
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <8cfaeb25-2657-9df4-5cea-018aad62f579@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <8cfaeb25-2657-9df4-5cea-018aad62f579@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2025 03:19, Vikash Garodia wrote:
>> This series is a re-up of Konrad's original venus series for sc8280xp and
>> sm8350.Why this is enabled on venus driver ? Why not iris driver ? This needs an
> explanation on was this even tried to bring up on iris driver.
> 
> How different is this from sm8250 which is already enabled on iris driver ?

Ah let me parse the previous feedback, I don't have the full context of 
this series in my head yet.

thx

---
bod

