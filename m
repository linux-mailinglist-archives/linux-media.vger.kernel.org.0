Return-Path: <linux-media+bounces-10780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1128BBFBF
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 10:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B660C1F2165C
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 08:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7977462;
	Sun,  5 May 2024 08:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WuyJz6sp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5533FF1
	for <linux-media@vger.kernel.org>; Sun,  5 May 2024 08:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714897279; cv=none; b=OdogrtUAppX/QkRuUdqQWbNbJOo6D0GB+OuEeNRieR06ZFy+j81W1iE5QLmLjiqTlNHhxgk3dQv6OG/NQwIhRkvRfqleEuGRR9nRsAqbLNjffdK9lTP0JbWtbLSIpgMNrBO4Drklny3S1RIcKd5rCt9G0q5B5hqvdFXTBcTiZYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714897279; c=relaxed/simple;
	bh=0JpmG0pIcgVeHw+i2pFtmm6Dw3Q2/Rd+pfb71CqXHok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rc4XTh19TmSIptf17AU9Hv2ce1MABp59ys2Dui72ezv6vYvlWN/Rz++NURiUzuDkO0C29JYPrSL7hpQTm/ldU7wNKpbXCCQfDmMoXn9FkIZme6yAQb2IV/nAgWYFnkxTLF8MTgp0qOAEZ0zI34G44Fm4YIfmIY100tjSAIPEFEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WuyJz6sp; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a599af16934so206896366b.1
        for <linux-media@vger.kernel.org>; Sun, 05 May 2024 01:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714897276; x=1715502076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0JpmG0pIcgVeHw+i2pFtmm6Dw3Q2/Rd+pfb71CqXHok=;
        b=WuyJz6splKZHm/5mxZd2mo8y0z4A0w8C+3IIGd04k7Sw5DP+VbBc4HmphNRb1KqwHW
         lVEyIREqhvb7kYY/759jKhhKVn+uQ6i5GSR/MFBfBQWiE4BxZvaBQ49mmd/SnLlXo2XM
         +jcz58Qi7Mz5uUjjKt4MNzrg4mA2RTFAqRUNjb/YXPD2KiQ6ASLs1pwE3GflbWDxq5lZ
         S9Qf50jcJ0ZLB8XpNEjbYllbWVzLOlljOtjyMK51XgrVVOBXdBURNPUBZqXTNzzpd3AL
         By2U4/kUbc5hnwJ8CoxUWO/T9d9Dcz4tSB2BqCAfb34nDpIUmV86E4Z0xiTvze1MCm3j
         HEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714897276; x=1715502076;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JpmG0pIcgVeHw+i2pFtmm6Dw3Q2/Rd+pfb71CqXHok=;
        b=ijFCpqqyy+2mFuEW4aA4ujm7v9dK2dCflupmsBVj7MaEmuEwxmA7VyMrKicVEg2tfR
         gXOsXLnSGbWr5PfdF79IXlxF9V+IJ2h2/s+VDnktiBa//5Ne/df392W+unft8YxG3CIj
         XeNkP88HUKnRD8RnvbcnT4faTJAT2HoEWGcpo+FImzSG8vicqn3C5bGjc8XMmh7nIxYm
         UfwZmkoOKYgvg/o7lcz3eiSahom5hfDu5/lgxVeRFEE5YblyJZNfUGzU+l/ZnyiQIdhA
         twdM3we3MkU02z1ztJAlyW1a1nc/Rvj73ib94z5GwyKenNIsPV9cla5rYdKlrMXKDW0H
         wseA==
X-Forwarded-Encrypted: i=1; AJvYcCUTirx/g/TcQMDdOvspoTomTVr5L5+FTgb0Owvhhj++1WUcBc/pgDEt/8w53sVNyy0mW33WgIdg11Gm89qsLhtPb6srfve3tLQgIMo=
X-Gm-Message-State: AOJu0Yz1h57vz5E9cidLx43OvK+zsmA5er5NbuzgYesUOc66vWq0zhnn
	BK8jb9J6yw6k28ZbejREVE0JYjOV35/DwIjn0fAaDjtyN4Oew16O7cdI+pv2/fI=
X-Google-Smtp-Source: AGHT+IFLrBEYzXw46oeDZ5nNQ4Sgpdxm3SPwOem3NG+KW9JOrnE9jZK26Jb5ayn5NGktvDzfCRw9IQ==
X-Received: by 2002:a50:ab18:0:b0:572:46db:8fa with SMTP id s24-20020a50ab18000000b0057246db08famr5034152edc.33.1714897276088;
        Sun, 05 May 2024 01:21:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id q28-20020a50aa9c000000b00572469a7948sm3867176edc.45.2024.05.05.01.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 May 2024 01:21:15 -0700 (PDT)
Message-ID: <966282ee-c2b1-4c3a-a99f-1d6304e62ec5@linaro.org>
Date: Sun, 5 May 2024 10:21:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: gc2145: implement basic dvp bus support
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, Pavel Machek
 <pavel@ucw.cz>, Arnaud Ferraris <arnaud.ferraris@collabora.com>
References: <20240504164115.64603-1-andrej.skvortzov@gmail.com>
 <20240504164115.64603-3-andrej.skvortzov@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240504164115.64603-3-andrej.skvortzov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/05/2024 18:41, Andrey Skvortsov wrote:
> That was tested on PinePhone with libcamera-based GNOME
> screenshot (45.2).

This tells me nothing why and what you are doing...


Best regards,
Krzysztof


