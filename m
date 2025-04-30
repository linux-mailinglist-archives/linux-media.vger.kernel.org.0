Return-Path: <linux-media+bounces-31365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F355AA42FE
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F8744E2109
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 06:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CF91E98F8;
	Wed, 30 Apr 2025 06:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IXTCtJVO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2431E2853
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 06:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745993732; cv=none; b=M8QNucHgGnp1QmVJtYvKCNXr7pHnxWMxwlpOqXIke9oItNRKIoW8Lnq1GEVSccpUFb86X6VyRqSwX2FUAOdvb512V0fprwk6lWV0Zf8+P/RQKRT03Vv33ZeuKm/nbZSL9XQ6sDkIsKcP/Up806SeeCqM2PYsYnOZbVjF/FkvdWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745993732; c=relaxed/simple;
	bh=h/Dm1V3IY7c+A7v/oWkqv8G4jkeeLzXn+J22wkUSrrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kamepWTGH1Rhes+KU2JIb44VW79gBOz0WkwjEALhEU6iUoy9F3cT81cwn+t4BCZhk8ebTtavsqbhDTwp4F+XW/j+hCLGPEv7OocWQ2l2zaxz2ndxShSqLo3Vh46At3AneTPNx9hR3xBj+lCUh3E8h4HGddVBMiGL3KRhFQmsGxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IXTCtJVO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf861f936so12064225e9.3
        for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 23:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745993729; x=1746598529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CQ8+byTHBbZULcISnPo+4EWHJovs157yAJJR0xdIOvU=;
        b=IXTCtJVOXnM+O3wOfmLln/1AjdjPV8CTWAzKlbPAkXUxNnQp84EbL+U7HCcK4xbbyo
         smLa0YTfYUa8lbHADY00KXklW2zRK/ZhiI+y576kU++Ee79Om8pEDmx9apFcKFRKe0rm
         xdmM+lVtohQfXTH04KLWQ90nMPjXVM8K946I61zZCBunYzY3jyQ4/lqCEJrPyZMl4DN0
         kC7MCg5npb+WNl3vEgA7LW8eCbjWpEk+Am8y2mwPPMR1vMO3pH9hwaEwQdOOQucgKJwB
         Y+MsA6nj8AtTf5ZqyAzWxdFx8UAtCCqNZFUWZCgIIJqlOHIc8JZZOSTCdwnaLT3x4GFc
         qVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745993729; x=1746598529;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CQ8+byTHBbZULcISnPo+4EWHJovs157yAJJR0xdIOvU=;
        b=IlKIrkwtEovUlu6rQQX9XzPxNJ59uqwBIZD9nHABfQYJvsOzpdjggVOisb9VtnrxwW
         zmPwYrO+CQBtg4OxisME2AQ9Dj4qeng82e8LkttFX42s5/Qi7pFblevvvbCsntBL6OVE
         USANto195BkRh9kcTwIIdf+2QOtLMGYQ3CoR8IcV0ydRh8S/PVvO6vOtIVN4YuJ5606u
         nP7nRoLLFyZk5FialVc8yUoHFhedEDZLqJcuHoq/1NBaU/ygjBmjsGA3gu/u6tiHK+80
         8QORR0DV4wpm85Y6R+Hn/JmGvRmmVDhSTPe0ZsYUTkWR9lgyTXlTJ74K2Yey0OOenW/n
         5tKw==
X-Forwarded-Encrypted: i=1; AJvYcCVV3dADJrOQGE5rbmFpKA4f9PjjH2ZrKX7pbu+sF9SKI87VoC0urTFnqxaaz+rEYgkiBt8XSZXTyn6MiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY/8Rfwu7mIRdZotsSNKVPk0Au9Ux0FpeiY7NK8mncKyNZOtal
	MWULusREn9pR86R4S9QGICmhGXCMNuY9JE4DoxLJxLB9wSSg2dydeL7WotI7s7U=
X-Gm-Gg: ASbGncsezJYvVeeRwlCEm1+g479K4hUtK/DGwNPFF+YMB1T2BZi8+QOy/AKyC2bz15r
	XN7bf0p/gO+yJi4h7XcFN2jC1ZGe6glorbibfXiFKOP4N6nRaZBm3ym9u78pppo+0dZyh6FuJuS
	yfHBnepH9GFOImBF6PTdN0PPx4L/f3cO1MoVCbbsFTgi7NeJmQenll2VGSyheKAwSHiUeGS/YKK
	AjFLNciYZkK7l3Rg2/WQHUjzF9oSDV/Nr0wQNswUe13zRFno12qcL5syywseyjcLfDXd+2ZrfSV
	YkAt5lQWFmbZ/O1tJjRkpJFhTcF7h06GowiSQMcS6S111RgYHG6DS6tukE0=
X-Google-Smtp-Source: AGHT+IFQZNbrXkVIS3uNOK0FA6fZlLhkJ0C67COIWvsSffD85H8GkDXmfIwEvlABZICaa2nLWYoJLQ==
X-Received: by 2002:a05:6000:18a4:b0:390:dba1:9589 with SMTP id ffacd0b85a97d-3a08ff80793mr289211f8f.8.1745993729322;
        Tue, 29 Apr 2025 23:15:29 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46976sm16103498f8f.63.2025.04.29.23.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 23:15:28 -0700 (PDT)
Message-ID: <c611add2-bb79-4cdb-a612-0f47d427c905@linaro.org>
Date: Wed, 30 Apr 2025 08:15:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <000934a5-4934-4d21-8859-897fe48474dc@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <000934a5-4934-4d21-8859-897fe48474dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2025 21:40, Bryan O'Donoghue wrote:
> On 29/04/2025 19:08, Krzysztof Kozlowski wrote:
>> -	dev_dbg(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
>> -		vfe->id, gen, rev, step);
> 
> Please just change to dev_dbg_once() instead of entirely removing.

Why?

This is entirely useless message, isn't it? Version is deducible from
the compatible.

> 
> Same comment with the other patches.
> 
> ---
> bod


Best regards,
Krzysztof

