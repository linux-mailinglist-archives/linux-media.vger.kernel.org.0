Return-Path: <linux-media+bounces-39016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEE2B1D587
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:11:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 257DB722F07
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 10:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D515825D53B;
	Thu,  7 Aug 2025 10:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gvmgJ6zf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9709112E7F
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 10:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754561497; cv=none; b=EftuzoGdGNkSTlF8BN9k4LEGZCY16sV88nyAWe5SUZ/Gut2Dm5CVwgKr4phHM6x1IleWLs936kueB98RQDDKcvT7T1W1yLaJfmYnWHrXtQXmp267PrJNbf2UHXwunVrFNO2rQdTUu0og9sz/zabtaIwd9Yf82tcA5cXZ08FXaMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754561497; c=relaxed/simple;
	bh=O6Y8cVOuHgA/hdqV1bgBIn4O/CUwlnYyFlCzNIDIYM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ToX8/kjN3764OXzP9jR3qSgiAv/6OYYg50A+xZgm4nDko3cXX4AGmcf2nvARYjjllXHEN3wH3QL3HrgBmSXmFQRBHLI2n0dwN/KGA4WmOAyNGjMMIOqZG/PZsfAFEghFmQC0c1CyKNDIq69rHAeCVhG3C6JikKiBOlhnIFS6LJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gvmgJ6zf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-459e1338565so7669405e9.2
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 03:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754561494; x=1755166294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UCEOeQAX58eFRpMAP8AQskjLHPoD1JzG7voJikyFC+Y=;
        b=gvmgJ6zfWuydL4/n/O1WHIY/Pk2l40OgMcfVxiEJEC3vX3ObpnQ6Tw5HZdpB2Bqbxa
         A3rxPcTOIUq6GBQMCjw7VdOlikB5h6tXxPMAV7LPL7UDcPPip4r0FxjsMAZ0D0U+VQ8Q
         B4k4po9JxcIfgvM01w+dYCZCO57I8WxlgmCaFdRdC48lmHwh831qn7RhORvTB1lyHsoe
         e2BPA9PLYjen6Z/ZYUIfi0lHxfzvBVW5N2nvNrMitbVe08SFrFQWdg5U2fM45HNqS4Cs
         HylUpQvW6iyMZ3dYwxXGrYyUu9xPrlrnDLvB1LPQNI8JL/4jl1wouSILsnrQn9mJYf8H
         15og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754561494; x=1755166294;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UCEOeQAX58eFRpMAP8AQskjLHPoD1JzG7voJikyFC+Y=;
        b=OYWr3Sip+9mkds4Db8yLfhgnO/XPps7NEH4va7a8+fZHkk/sARd0dNDzqMsJgZQiW/
         N6LRHPldybTGjkWVmOlxFUKgK0YL3WBmCwQGj/FJGiykAXVuiuHvL7JkIm+YKpLB6Ny7
         6zPbOGq/jvzbx9v7hOS8OoDY6pNIiorWYeozgq8KW6ZImIO0v8VmMxFwZKGz9bJxKfWi
         XkMExjMEcod6ydRZF3RK30SyUVX7xAJvaB9lCt+gPhi9K8PhlbbQrp1bvhqyXfgXxk6Q
         IV1OMwa42Vj5jovbB6FBoCuhBlsouRbjdDhcapnu4glP24XDHb0ApHvaoOspznTMB7hL
         vYEg==
X-Forwarded-Encrypted: i=1; AJvYcCU72s/t9yIW1SGBRIE6+K6LLAtgam0W3kiorFA5FXxyqamYHKJA7Z45dNaVmNK0IDUWw3aSMRVQ8q1/2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb9wqs7PjLe4TUGNyEtjLzf3OGWGIje4tRgOHy0sHaIsSxlVT+
	e3amU09aEUWZeS9eOIeDbrJywuef1lmheB3JPz4E8NYZZMuQlKjE0P/vh4fxg4xdnxY=
X-Gm-Gg: ASbGncvxSQgA3+5/wI18VvB2XC3oToZeYQEpk5wNkbVUz145gQnHfoq2Cp0pXwdIu4u
	KvxQhv3oc2UtFnFCgP97KNbQS+VX4nbdQinSGc3JGcrikOGQF1lfEB6xZ1yEc3jakCZy3XzNh4c
	dD5xdpFuXe0x8HTJtAUBuwQdiriTRlzmc/m6noxxCBL2fVtELfnMu/FXyFIsB/xWMM1pafhw5q6
	+uVHrlbHZZQGEQ6BaPTH+ozlkletLHshTYo8IXQkKipzKs+8bRL506i9HMfX/kRRGBXkAMMgkkk
	0HLQRw6vj+BALghnsmY0cLizEqoGFkK5VTSAFflYaR+fijjW4p4uc59Y+Y83K0/iDvsJ6xrOqV1
	xSq1iyrtU9liNpuxsBjjEZt5wMuxVyMkfitI9yeuQ8g7k5baKiVUBtVvucp+2h3U=
X-Google-Smtp-Source: AGHT+IHhek7qLMtG/D0lLB216ukv1XprlpVNWNYygMd7NFMy48jfNMcwOJb/6mt3RoRrKwpkALkG4w==
X-Received: by 2002:a05:600c:4f4e:b0:459:e06b:afbd with SMTP id 5b1f17b1804b1-459e74b6367mr50737565e9.29.1754561493918;
        Thu, 07 Aug 2025 03:11:33 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e9464f46sm12001442f8f.19.2025.08.07.03.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 03:11:33 -0700 (PDT)
Message-ID: <40d543e4-e53d-4289-9b87-5ca8c0139bbb@linaro.org>
Date: Thu, 7 Aug 2025 11:11:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
 konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex> <ce9cf017-5447-457c-9579-700782f9f0c2@linaro.org>
 <aJRMUzF0GN2LFIZd@trex>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aJRMUzF0GN2LFIZd@trex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2025 07:48, Jorge Ramirez wrote:
>> There's not alot of value to the user in that configuration.
> I dont know the user base but when I originally did the code (v7) I was
> thinking about security conscious users (signed firmwares) who might not
> be able to switch to the new fw release so easily (unnaccessible key
> management and updates).

Since the driver for the LITE hasn't been upstreamed the # of users must 
be ... zero

---
bod

