Return-Path: <linux-media+bounces-31578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDC4AA71B9
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 14:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE6091BA4F02
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 12:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC8E241667;
	Fri,  2 May 2025 12:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qu+snUZf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A7124BBFD
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 12:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188835; cv=none; b=ac6MDj68vYtSq5eGZvD4EvcWQJxu4qsU9zlguIBo53gXSDteZ71uF81e4bL9RzM9Wt8u+R0IoN96mgbbOu/E6Wv8WmaZrH+5WtoZhO7XIpAhebIZaNuWtKVwnz2YeANgeYeERNyBC8LmL57yI8WM6CPcRavtXznojICoMX42f9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188835; c=relaxed/simple;
	bh=4j0ke6M74LzeHhABdWPG4BsNF7G/ublzVqyQ3s3Ax4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Af/AV9i6b2q6vP+obVYROr/tqqJxeUeXWYsk9EhIO18FabHRJupAY4cuzSIjbTb7CzfAewlhKLkOzqZxFcNiPRDg4c87nxO+ZSyxPQCwpEbk2oOQJbsEeNmFWCMxNpSsgjr7IatIqY3AVmOjyZppB+QJN1NSfAq8UB7cKRnxLAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qu+snUZf; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso12405395e9.0
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 05:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746188832; x=1746793632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iiq8j9Pd47tWgmGC+T98j/M88SapfZV3x181EBl9QGk=;
        b=Qu+snUZfbjtoVHbcYIQkh66FZYcCBl7m5EF3ECu929XCegVlhLstjeSVuXsnOSmYPu
         uK3OrOwh9X1eM9ft7gxS+vycMgMzSh/yRCFtydnKZNhlCYg9GjpU+W0fJtmadP6ri8lY
         TX+XpboqoObN+oLy9oMPr/E0kjSbSh1l3ILCcVUCS0BBP1q3/2Ftsk042J6+LvdC/Stw
         jRUEbok951xF3NkH1LZ1vPc53qli4lt5pHLGAI9cKK/thS2W7PE4d7bBG6CL1HOE8uKt
         41bb76B8KJXkL03ezEXzv+/BxblbOxKjXTlTc/8J/qK5Rmw8JAoSGzrrpUCaX9BVgrDW
         13/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188832; x=1746793632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iiq8j9Pd47tWgmGC+T98j/M88SapfZV3x181EBl9QGk=;
        b=A1qPUmUSkJ+6qA3+cYq7AMvUEFAB4kEDqEjHYhlmGI3nEVEjnYqQQzRrQr55MLbbDH
         kX9YiyWsbdUwAJWxFFnb0mvbIo3lkaL/2eTUDraQpI0Ao5Ks6ZqRFEn0QSFMZvjZj9gm
         7NGj9p7+jk7piidPT8BpzfWDsA+CCU4rp9+jXKcBzc1u6trdOsCn06xHW1b5uYMZmzBC
         DSRAkS5kaiKXLLYe705sdwiMXTqmx0h7fVOe94zbfopPzY2Irq/jsLITAu6M2tewWJLR
         agvVeF28z41j7txFV6mZ6F5aIvNO2ll79/zrMyl8VSLGbhPjwOYKNkA+B3HFWEcobfzG
         ZriQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3CgrizU2GEisXYioMMVKJOFT8RB1S8Xk4SlVOsEBQYUdCciYWynclFeDyZCz1S+Ajqv5aMwSTDxOEhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn7OQwYwuSaRZGrREVGdUO4hTehpMVZo/7VwhOvjeKGoBaXRdF
	EhkDzC/bhLKzgPnA3ewbi6oZPspwvM078BLtcArYSzcVtIj0xy/+RlysXHGLPYo=
X-Gm-Gg: ASbGncs3+kb9p3adqYmDv+Zp2scYEawRnM1kNUBTSs67Kaq1oiK6rhXhGJ7hAnd6pAM
	tw2UePHG5SVdbDrb+wWHQ+LOi6V4k9WjuVPHbVzQi52plTtg5n+GDSlHg5S4bAK77RAI8IS4SB9
	FwLhe9tHYhmU9LjUttT+yAa5Jr5lw2UOipkL+2Tu71s6p1ijFl0oq790pOEQ0AfMhpGC8G4Jg8e
	LdunA+lI6uSFYD36P9pfT25k4IlhHwajPoAEVdIca+h+KbfEEkC5v4rEOuA69ib1Rcb9LgT7PuA
	7+TvbeB4uYsCFVu6PltWL2bf1g5qyEUFC3dOS5gDvQjjaV1ieu6ijK8qnLz8GFbBb74/pd+mout
	SKgxDwQ==
X-Google-Smtp-Source: AGHT+IGffAlOpctwFrMNNY2tP4nZNI3nScrTpOCK1t0L/nEK+69qoAbndAyafnHVDnbgh0OsuB9ujA==
X-Received: by 2002:a05:600c:15d3:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-441b72dc612mr34423725e9.12.1746188831814;
        Fri, 02 May 2025 05:27:11 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm2052074f8f.92.2025.05.02.05.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:27:11 -0700 (PDT)
Message-ID: <f9aacef3-eed2-4a0b-a543-b26342c4d3f1@linaro.org>
Date: Fri, 2 May 2025 13:27:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/23] media: iris: Remove deprecated property setting
 to firmware
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com, stable@vger.kernel.org
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-6-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-6-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER is deprecated and no longer
> supported on current firmware, remove setting the same to firmware.

What about older firmware - what's the effect there ?

> At the same time, remove the check for non-zero number of v4l2 controls
> as some SOC might not expose any capability which requires v4l2 control.

Please break up patches like this one patch removing your legacy 
functionality - assuming that makes sense another patch amending your 
non-zero number of v4l2 controls.

Generally any commit log or patch title that requires "do this and do 
that" should be broken up @ the and.

---
bod

