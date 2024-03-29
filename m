Return-Path: <linux-media+bounces-8189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 002F2891BA7
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 14:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60EB9B2712B
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 13:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9AEB143C5D;
	Fri, 29 Mar 2024 12:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S/7vRAno"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB16613664E
	for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 12:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711715877; cv=none; b=HlgH+MywJEm+GBveFYzjFUlakQHn4vrHTB1D5H8lok+SXRVtNwfz8MEysYgt0xHNooT0Yq0Z+2GvjMiuZqEmH0xizEY3Dh57yqyYF7dd+gsNzmdbaPw7MMIJZXQxxRMET/k9kzEbIsFBC/wte/lMeDfWYcOjQq9+SQmM9wuT0kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711715877; c=relaxed/simple;
	bh=GXCKvJSacEr76ILtadyX8iI/oNde89ZTd7bZ40s3fRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJmsa3Qwr1bNQ0d8+f8gokLei0tlKvetYMsMa2MaPdVP8Mp7EQtglZ3eaf0IsH3PyaookRTokLfWOtEJQKs0VX2HHRVvpIYA1fUHzYloXxu3ThoYmM83stRwQWg6cMW9RxGaW8T4AoIIangYEhj4sdTs0xJZLu8pJeAB4PSUr8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S/7vRAno; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41549a9dcbaso8738925e9.0
        for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 05:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711715873; x=1712320673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YQYTaBWIRs545VTga8H4e53bI07t8lxtkJ5ubRYH2xs=;
        b=S/7vRAno0Ru07idC4/CvJYsNEoB71RNkhRSoLAYDb7wrG81lbKRJfTL4+PTuTOcmm9
         y14bqC8qq7ZBow/sopiQZ68OXojHV+Fqz/+MPshGeQ6XibQz5/VKNpqHRBRz3SUB+Xt1
         SbrHsSNKBrChJZ42Kz+n8rMpTwZRaThFATTBRTP2fInKbJq5+tsgo/k0bRJL6Dz8QLSb
         l3l27DVGp9G1JczFmmcGahoDoEBDBr4MK/YvgDgRbaGyqr3ZqffgSQxuiTu/0bIsg730
         H9oLfl2B8rGNUf/8qGABhrkiPOBlLJpoVS1w8MeuWIH3a2BODebuj6PVPFDYgKwUJFDB
         Jipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711715873; x=1712320673;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQYTaBWIRs545VTga8H4e53bI07t8lxtkJ5ubRYH2xs=;
        b=nBvYYbdLV6UHFLLv0fWYBNq1tKz6H0Hgiw7SJOlPIheoeI8CF/N5HG+ZSUo9W41u8o
         P+hEnWTFRZgpOxkQCLe5AH5tcucQhFOsawvDzslTqMabjvmA/G4mfhL8IUN55HJUc2bd
         Mg+tfrvEwypqZLuNxNA2+DF0hiVIwq00nJy82DWgfY4rVz6gI3QCMroTO8D9JYJgxIIf
         g8GLLBIbh4UNKkVZ16qAI3U/KkODjNza/XAswG8eKjEVF2adpTxyNhc/Wlf2/D89TH/6
         iYaehaAAKEkzq2Pe2SvWMxHmLb7VgfqpwTPIwDkgWA1uaw9HI0bwu/qcE81yoAX6qoGz
         ly8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3RZ7V7GGRkk62rQsKTZRMuS34ihaoysUw7/b5Bth3Y+Sk7B5hwNeB6End0YTp71p42UtVYTlSkUbTKD/RE2wtfUtKxp5ZS05prLM=
X-Gm-Message-State: AOJu0YyggURiMTOfIsIUabQwitOpX/LuqbCKNinbof2UY+aiphyq3l27
	1Jt0WYRQ1WZMCFfNNQZ9z3uF2H2iTPT61LjZWYTguE+bC1O/97krHt/HEb3EEjA=
X-Google-Smtp-Source: AGHT+IFkPCkbNhnhxRURlKdyw4Y0Gn1PuJKF9drJi6QVbCLHdN0DRKv02YjFe7A1GVH/o1fk8KKWLQ==
X-Received: by 2002:a05:600c:46c9:b0:415:5343:cc6c with SMTP id q9-20020a05600c46c900b004155343cc6cmr480816wmo.33.1711715873164;
        Fri, 29 Mar 2024 05:37:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.50])
        by smtp.gmail.com with ESMTPSA id n14-20020a05600c4f8e00b0041493e21844sm8405040wmq.27.2024.03.29.05.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 05:37:52 -0700 (PDT)
Message-ID: <925d1ebc-e81a-4989-b458-b0fc0b6d1a32@linaro.org>
Date: Fri, 29 Mar 2024 13:37:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/18] platform/chrome: cros_ec_sysfs: provide ID table
 for avoiding fallback match
To: Tzung-Bi Shih <tzungbi@kernel.org>, bleung@chromium.org,
 groeck@chromium.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 hverkuil-cisco@xs4all.nl, mchehab@kernel.org, sre@kernel.org,
 alexandre.belloni@bootlin.com
Cc: chrome-platform@lists.linux.dev, pmalani@chromium.org,
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-11-tzungbi@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240329075630.2069474-11-tzungbi@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/03/2024 08:56, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
> 
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c#L1353
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


