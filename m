Return-Path: <linux-media+bounces-39032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCB8B1D647
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 13:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 040B9561E98
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 11:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A90021A440;
	Thu,  7 Aug 2025 11:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tlza04o7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CE21C5496
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 11:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754564546; cv=none; b=r+kS0ZOCXZ5y3nP4nhfn8+aJ8f4LnQFRENYszOOdlA4mmAGo+kZeVdrgbGAvqQ1nJ3j2DSlexmtorHDH6n1t/T3GJzOg6eWwkNEwivPoGvgI4fHieVlYCyPfniZsjGoyLDVONGCjAx4Unc2aMKluqriRMYjmoYrnGYCw/BOYsUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754564546; c=relaxed/simple;
	bh=r6tDG+AbJN1HgjRV+2/Hx5PHw82masXWUHrUDGuJ7fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JIHSKcaQ+TgNJuBQQXO0CGEJfQJECpoDyB17mXIco68rovEj8oPqnxzU1+oDKT9rdyKtvQlPawRGkDcAP75qDE1YdSrOjBAVIOgPmqvnGKW+hokfIYbiEKrsZ6p884taqiG4yuNFoOuBVk4DYNAoFuaZISnfdiO9LufeDA8bYnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tlza04o7; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-617c64512a7so31714a12.3
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 04:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754564543; x=1755169343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CObGEyXsBl5ckArYvb62OQgoq3Ny+zC7kyISSXYr+yM=;
        b=Tlza04o7qZ6ee63+t+cjszmH1LSuGQmWE2E3cHBECGKalUg7cUIpRKAXpsfxJmRZO5
         uGz39086G4vwdZIpRHo+yBv6G2YLIL8YKw7Mq/Vl8jfAqcU/NkqROvio8UW7pXA6v/Az
         7okyID8a2qGymSUYBE39j+SjSQo5hw8vSep4GYrcVcS6+R0myWp3Jh85wwzWHLxCu6Dd
         Q2Zi4re+vnbeVGPn/9YmZLVWfrAaFNH3oIjS8KzGSxMbmh7giuQRE1mILy/nyUK8egnQ
         E5T3fiXr7CHTsTw+AYUs+O16ujbpgK9xid8dJH0m0wy7JJrmNbOxc3+uPhghDOYiYm2c
         weTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754564543; x=1755169343;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CObGEyXsBl5ckArYvb62OQgoq3Ny+zC7kyISSXYr+yM=;
        b=KBa6WYKxbDZ/hebMpZSm+5YKcN/HIHJLX7cQ53K8slh6ZRwiJUusz/RhQmCGSUUKrw
         LRyejgTTdS2xb57Z6dhwUdgj9Sui1TTuZEkch4jYLjHX3phWRv0+ns3Qi84umOLhIidW
         rVG9qlb8fjg0VHWemgeuHxgHLWlJ3k623g7RIo+jTkTFticdM2KNmiXGOxqTqwbZkj/X
         mR7NXjwag08l6yFD/ke1eQk6x87sflOoOkkSzxXZSdQ+Agla3iO3I8pdI2k9VFxKrZvK
         dY9KCb0vNlyJlZifLPyqCHVnZazpWQXE4x0e/zb9gv4bj7eOXpN3T6Tk2CtPcQOMfrWn
         ILWw==
X-Forwarded-Encrypted: i=1; AJvYcCX+kdt2bmGjfUW2X+s9ZiaespedhjG2sDdk4spSydigoFJoMHXM2AysQikrWbh6n2hBpbz8ft44jO+gMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmaqRPef1PhIQJcpZom8ar/vXOtM5DWljPzd92X0ToPRBKzIwt
	xbk4F4hsuCxk+EpI4c+oyUek3AL5Fmiqifs7pw8zVOyWuV19HzN8WApkInIWBbSKS7o=
X-Gm-Gg: ASbGncsnzO6zWWxvaSOcVOwIIzEpWfZkaWFalYdvpqxIuSV5FZvHKNIhxjoHVWVpENm
	x5YHx+AJlSld02uwv9KxokWxYtlB6Lsb54zCdGRAV6wFOmrU04zbPmrvwoYnccL7FlmlldXRRqQ
	hWwq2x9dcXDMbK/oiRuoxDW6bX/t9ePp0LOyoqmil/LxUp+gNpZHiR33znEXgiy1BRfxyLAfEEq
	a8KP5ukr/QSsvwA4cfHTrte8n4tIz3ic/f+ndUwwKA3FAsSchi2OqC52YKl22ijez255W8wjbZf
	iYN70MJeBOFCY4X92XqznoAoGDpyaiaPGk21mA++SPzK4ayT0+NVvwcXKyzzekEKiOYDtzGUHrX
	b2pJFILxdKXLTOVJky1BgpxJ/LniP/zSHyrGTlyK2f7w=
X-Google-Smtp-Source: AGHT+IHxxXvgiIBcVo2bRXpywTm3YPRpmc1P0j9HlD/oGdag2IrL12KHdTRAWZTF1ygVNW+NegUEJg==
X-Received: by 2002:a05:6402:3595:b0:612:e262:929c with SMTP id 4fb4d7f45d1cf-61795fbbd25mr2327171a12.0.1754564543182;
        Thu, 07 Aug 2025 04:02:23 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615c57f9fd0sm10434591a12.11.2025.08.07.04.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:02:22 -0700 (PDT)
Message-ID: <4150c213-b99a-4862-9e60-f374e40f97c8@linaro.org>
Date: Thu, 7 Aug 2025 13:02:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] media: s5p-mfc: Modify compatible string check for
 SoC-specific support
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
 andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
 anindya.sg@samsung.com
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
 <CGME20250807032520epcas5p47545f2b03e29296b583248f8315abf45@epcas5p4.samsung.com>
 <20250807032449.92770-8-aakarsh.jain@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250807032449.92770-8-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2025 05:24, Aakarsh Jain wrote:
> Modify the compatible string handling in the MFC driver
> to explicitly match SoC-specific identifiers.
> 
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>

Please read maintainer soc profile, submitting patches in DT dir and
writing bindings. You just broke all platforms without even admitting it
and without providing rationale.

Best regards,
Krzysztof

