Return-Path: <linux-media+bounces-15680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4FD94464F
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 10:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D1AE1C20C2C
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 08:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DC316C85F;
	Thu,  1 Aug 2024 08:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OvIFEuGp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4AA38DE0
	for <linux-media@vger.kernel.org>; Thu,  1 Aug 2024 08:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722500219; cv=none; b=mZDh/cY4aTD6VKth0eDp6CcTISNHF47d83ozpvs9+VTvlQYIkBsWg19a81NPwzhZw90e8w5JIvvrAos13Uh4EgQ+8eCqcpjIsPc3JP4EljIzHnD1uR6Dmzabi7Zvm3vrX3oIt0v8rUfhofnELtLXle9IgLSNQydlTsxiNaZwMd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722500219; c=relaxed/simple;
	bh=q5fun1stuBG+6UPuqpS76nEA11lt40c4cJptlg3SGjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L2sobKZfoc6ETuaqEmIWAV25J8QSjOJ848Bu9N2rWVI2rw0o3nupTSjRLFWQCXXHYtwBFPhDOM49/nW4MLdaHcx8M9fPmVFBIp7Z0VSKEqGvQXEfzw0uu6n91WMOtxPkdC+wBW5aNk98Av1A5n4qyMUnBkbPAn3sOLUsYrnybxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OvIFEuGp; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42817f1eb1fso38654465e9.1
        for <linux-media@vger.kernel.org>; Thu, 01 Aug 2024 01:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722500217; x=1723105017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XP9tpFtaN6upuW6t7vjYg0wgdfL/oQQOrVIWRer9/9A=;
        b=OvIFEuGplgnRFbJ71Y7Zv14yuDJHIDp2TaVBF9QaIvJqNhPv287Uzi009ebJWh7OSE
         KSR8mEK5balCEEuXd9Y0iI7Ob7DOpE1NGOdYAFGVRrn2IIajPrb6V7+2HrmgLx8fuw/d
         N4DlAN34bHFRHGGi5Z9rw9JC2tv0Cp8VSpsuKGFhGu52Z5MMeBY73MVdnOSy2Y2SFtUU
         MREb0se2+bmDOHoCmH4Dq9VQcNJ0+QNivAtlNhjeNIa7YW/nbHeWpk8rnbQjjLJrvQow
         N2NbBG20TyHHSMLWOeJHZBIKwpNi0LR6GqdAJ+/YZkldgFkII/ttZi5vQh99o+f6RcMq
         vjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722500217; x=1723105017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XP9tpFtaN6upuW6t7vjYg0wgdfL/oQQOrVIWRer9/9A=;
        b=lmwzO8XCLU7RLpCs807PGTgXeWgiyoxWM7V0JHnyaFXxHe5L8YR6vhvru5QjnBj4GT
         4CsNSWJJK2lckNx8abHK89E84VGVB3VS3qGhQnIY6Ka7FU/07fZfDiwPZj7LDluZWnA3
         FMm3Ve9B9g6S6fgARKelxQ/3jeNjYlFiNCtA5iFLus52pRtXNe1pvCRqy12BSNTAOkEV
         LVK8mzbf4xZIuZiqfIkcwLXHcxhsR1Q6E54FV/soNDegFkEb4SgJTNbE85jrsjWS97x4
         s4UvG+3ywWqlvX7cMauaS2nZYDcv8t7ekQk0T+LxYIL5Xe2lHtMHmCRqJRGD6OUvqRg4
         9n0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtXUlPJvK4EnndIxKbnbCskD0A8AEXG4uUhq3eO43RY1HKyMUFOPypNZOyQ9NmHGLtO6ewIfQOstLJiqHytzhSoLOujhqwkWM28CY=
X-Gm-Message-State: AOJu0YzRvdAxYqvC23JzVwhjTVDgSNQ2nAKXaa01OFLWhrSXJ3rm3qoC
	3z7UZekeNIb2AEAqgDWmcYJlsV+8toW02wq0a3+UMm4ctr19dXP4u/ryS3ibNWhCyOb6dflmClE
	Q/58=
X-Google-Smtp-Source: AGHT+IEZ6N3OkZhSfrB0OlObra87UiMAZT58iQxNd4nFWX93KOp+dwXPH4pd9kz7+mSHV+7alm6HBQ==
X-Received: by 2002:a05:6000:1364:b0:367:9ce3:1667 with SMTP id ffacd0b85a97d-36baacc7d04mr1233681f8f.15.1722500216713;
        Thu, 01 Aug 2024 01:16:56 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367d9b30sm18869773f8f.40.2024.08.01.01.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 01:16:56 -0700 (PDT)
Message-ID: <fafda7d5-3853-428a-b0eb-9993fc2d4f56@linaro.org>
Date: Thu, 1 Aug 2024 09:16:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] media: qcom: camss: csiphy: Add an init callback to
 CSI PHY devices
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-5-quic_depengs@quicinc.com>
 <6dfc2c79-fc6d-4eed-bf3f-94396130cb4f@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <6dfc2c79-fc6d-4eed-bf3f-94396130cb4f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/08/2024 00:43, Vladimir Zapolskiy wrote:
>> +    ret = csiphy->res->hw_ops->init(csiphy);
> 
> Here.

What name would make more sense to you ?

---
bod

