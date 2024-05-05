Return-Path: <linux-media+bounces-10779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD348BBFBC
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 10:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCCC0B211D3
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 08:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8EA6FC5;
	Sun,  5 May 2024 08:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vYQua+oi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024D263B8
	for <linux-media@vger.kernel.org>; Sun,  5 May 2024 08:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714897249; cv=none; b=Pbe5d+OEmNzHp2sO7mPiBQcr/GMav6ZbjX+wPBdjq84HItOasaBwt56kh+VryfA60eYvV0otONtUkwtZOMYfTuP+z1tbBiUBBC11pnuK0vyE9gi9rPCfvoE6AVzKUTpIT1HiFEIDio4qBP7q4yKCU026altvS58m9FEMq4XpUjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714897249; c=relaxed/simple;
	bh=GeVEQWJYP5IcsKim/Yc+ELRPBw7AQeG6VwIg+4rZtkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ddggXwg+rWd5eSZVifOzoHxKCZvj4RYjugC42CK3SYElLN9o1e0CMZm9N+UszEGr22DEuF414uG5/MGLCWQtNOezcVh5XxproniBa93flbDe5I0ufUxQubvEm1OegPq8dJ2TVJ8vvdIRNZsAM5cqSxd1Y3DoTuv2cGKXtQhiz5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vYQua+oi; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a5200afe39eso224804766b.1
        for <linux-media@vger.kernel.org>; Sun, 05 May 2024 01:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714897246; x=1715502046; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GeVEQWJYP5IcsKim/Yc+ELRPBw7AQeG6VwIg+4rZtkg=;
        b=vYQua+oiMMxxhou2Jao189X/ALaI1wYBCkqRJC/PkrriWnwlCXaziUEhi7Qzp/L1Q3
         evBsmGqEU0RbU4tbE02f/40BmC2s2Y2g+8Vnkvg9YrhQTdfIbj0N4t2O0SXAXeqfb5Kg
         OCQDIwe9GI0mBHApFJSfHSaXp1Pifind/WRvKhk3jn08HDQDluhAIUp2AgQZ+O4eb5T6
         FLGuANQ1ZuC9ndXBOpq/iUPO/lUjlWcgR3+CG5VkSIRNOM6nHXuZtwNqApjWwwSoAEtq
         q7PnQxLw3sOgjfwS6oS03vVTwJFSJEe1cmyf38uBgYYpBvL0gNyx2dgszCrNAHDkgkgq
         o1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714897246; x=1715502046;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeVEQWJYP5IcsKim/Yc+ELRPBw7AQeG6VwIg+4rZtkg=;
        b=ZCTL6HW1VYbMvVEO73/QHoOKmP9C/sg+9Sk0ECasNx5QHJldISZ/kDRRju0bnauyzE
         UXTxhHoseung1IbdY3P4E4j1GRRbXfpX++QBXmhMekjKtXSXWp8sclbpfjtEpzDEQVpn
         6HXdRUFrmWHnYyDbeNP+qlLeJL7xNonMf5yHSGGozvfycrTF8jke4eFehWzMkHFNXzau
         dCYDkyFotRfxxUlIr/y75CKB4ejLGA6VzIq70O1SMgMhtZFZI3XAZ85nz/fKLTV9L7JJ
         X6iCKyR2qYyHzMbAWDLnQXogtvspdMctJaA9WQeDEGuRCAwb6AyfawVFeFlqgCInrFtz
         MV0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0qroadjicsLUGEGCHy0BvlQFURNOaiO6VciFT0pEmlVDE3hBYdJ0Xb/7qenrP1d5FdpS0ztDNJFMGyDc6rjzWrdnI0xhz7cet90w=
X-Gm-Message-State: AOJu0YyXOPFTnHK1SC77CIIKsugcDeDdQTEslLdH93iK10o8Pn1dwf7b
	cHUDB/fPuvpsOhzOY5GjSamXY7DXT8xC93jj349BJkXBoDGb/ryLSh7xbsmKKvA=
X-Google-Smtp-Source: AGHT+IFEpDf85+gd45EcXvG5zICPw/EbPGaAfGY1dn2QVAlpX67GNg02V86BwUPM8q3owEqqP5lwhA==
X-Received: by 2002:a17:906:a890:b0:a59:a091:ec73 with SMTP id ha16-20020a170906a89000b00a59a091ec73mr3936693ejb.23.1714897246256;
        Sun, 05 May 2024 01:20:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id la6-20020a170906ad8600b00a59aa18c685sm1496555ejb.173.2024.05.05.01.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 May 2024 01:20:45 -0700 (PDT)
Message-ID: <2d96a3d4-c361-4aac-b97f-0d408d39ae45@linaro.org>
Date: Sun, 5 May 2024 10:20:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: add galaxycore,gc2145 DVP
 bus support
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
 <20240504164115.64603-2-andrej.skvortzov@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240504164115.64603-2-andrej.skvortzov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/05/2024 18:41, Andrey Skvortsov wrote:
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Not true. I never acked patch with empty commit and such content.

Drop fake tag and send new version with proper commit msg and proper
changelog under ---.

Best regards,
Krzysztof


