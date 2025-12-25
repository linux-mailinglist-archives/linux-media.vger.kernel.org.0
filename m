Return-Path: <linux-media+bounces-49556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C85CDE098
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 19:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7972F300F594
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 18:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123CD283FE2;
	Thu, 25 Dec 2025 18:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkJb9XCU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6886218596
	for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 18:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766687845; cv=none; b=sriYZNH67A3siwCCwHNKTq6R2izq8KMppsLstXLuj2k06NAJ1sCkrtNSxMyou4VHE83FgnGJU+qpbHsNXGI+XuVkJgNnWE8RQgrQYoSsYK+P821FAMSr2fRhLtIdAN/wjKksO8vpnCUMDBiVFxvgtK0ckqHB9d9G1y0Jx7yGDSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766687845; c=relaxed/simple;
	bh=EeP3w6mxZsd240QO+T3jiig23vz+oT72Plo2mHGY5pE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kDaAwWQE9tzxN9r/Ji90u5yDNn8mlGzmL01FvtvKOL7WML3Vm2NWOpYDe3PxRXcLdWvhAPm3RO9wCWW2xl6p4ErPCF9P5H0Zvm1lSUsLqtMapymlFRaMWOqGMBZL4liU3CFcQSntdtx5D9Uv6tV+wk1rJtV5UKh/2vO+bC86Z70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkJb9XCU; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b73161849e1so1312562766b.2
        for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 10:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766687841; x=1767292641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeP3w6mxZsd240QO+T3jiig23vz+oT72Plo2mHGY5pE=;
        b=JkJb9XCUAWeiTcMq7ESspZPfSsOgKBWu/brlSnUIZFwXWE2q9i7iixd2K0CF62grQl
         0qBQnU7BdEfoAt+s9TwV7Kgp27qW0tgwjsm9+qKAWDVmNAVMNz5xJ30fOVTG/XmCgPzK
         lD7/o2nVn0cDUnrU2ANLIAO6pHh7DURb3tRLYKS5L/T3eo72BfoL/MPXIAtKtZIhydac
         v2LGmtCIA+PJGlD/IrL+1qIzpyvghqtt1pI6E6bntfV0qnBYpAeMnjElJPIIhMh0CP1d
         1YszRu3IBy08gXRX5gpb9fsW7AQPZoEPjVv446x5+UZSKt/IyudW7ykAWmc2/dRmRwWC
         DGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766687841; x=1767292641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EeP3w6mxZsd240QO+T3jiig23vz+oT72Plo2mHGY5pE=;
        b=YHDry/F4lskP9luCZVRvoQCIIfbayd9DOSHQ2PEchf3o90FBVTvCaNBQBCcRdc9hYL
         DpAWSMeH7Ag/9gZ0DDgzCEuMi2MqSoDCQ240KfYTwdBzsJQFW6KorjMQknPJGRAuizu9
         yGTLOmrze2caWbOnbJaeTlwmMEUMHSsVF+/1udh6CfF8xQaACDyx6sMbUYoaZasHXIwQ
         Oc3ZbcK+dT+WnF4FoVGeEV9T+rzD3r7Poyt1T/o6gxN/MMjFviAf2FA9vikSY99Ot9pe
         PesAAVI2PdfqcprFnOkxtsnf3bxAiMtvgnfzvkWUsqfiFZIn9dcVCtE8ruVG0eI5lEzh
         igIA==
X-Forwarded-Encrypted: i=1; AJvYcCVIWF50I7DPSquYW8P37fzoEF8ktehgoZOfFzxxEpyQrC6nqpUULGPg3eOFIJWUEzuXxUTrvUX8YU+IHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuUxPDTZc5yUc/Hp2f+N/xrBaHf6HAJLdYk8gZ6siWQ/6b7X5b
	ijEWx30cvEmTA7VIUTKmdVUWjaXW/bQyiRHSBA7126yZV4CSXqIzfNCe
X-Gm-Gg: AY/fxX4NZLkaQOJMubr/s7JGhYs1UgKJYZWzkTVkBiUniVXt94xoTurQGii3Jh/+NFI
	vpll9Zo/WuA54etfs7tVWG0FR2GjSWSJgESZ6qIF/s5VVdUOeiW+t7FBZzZXL2/azOs14YN26/4
	zNT9hvIYTfwcuXbcnaZxgNHho5NFbvD34R1yCtbGRiR3zLDlrWDocXYDnH0ypxQdKk1PjpgQk3D
	m/t2dfCIA29N91Pzfm3IVfp7LaFREmi4cj5gR7g87mFaCZuY0KKgAiy7pFhMIlKgParc8UD5k2Z
	tvD6TNfS6n899otzAXjqYuZP1W+dEXccs9Jgi51rBdSXS84ton8RI0FPnxW5lktHsh1LM1SU3Th
	y4ECY0jYipNPshu28Pflfh/7y5mOuRxhYDDnmSQ+cmj4GS3D1aiy64k7dvsiRIqdfR0wj1LykEa
	hpn0VetMU3M8kUULPRqsr6fVh2+m3CZGWI
X-Google-Smtp-Source: AGHT+IH4B3XzX8QXujzZunFfKEc/cY4W3MiVUX7/1rzA6qLulDTYIhj8orR5H1uD8QCD+qBxL3d2xw==
X-Received: by 2002:a17:907:1c27:b0:b7c:eb19:6a3f with SMTP id a640c23a62f3a-b803705e31cmr2146669666b.35.1766687841205;
        Thu, 25 Dec 2025 10:37:21 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b803d3cea32sm2033127866b.34.2025.12.25.10.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 10:37:20 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linusw@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>
Subject:
 Re: [PATCH 3/4] ARM: dts: allwinner: sun5i-a13-utoo-p66: delete "power-gpios"
 property
Date: Thu, 25 Dec 2025 19:37:18 +0100
Message-ID: <2409366.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20251225103616.3203473-4-wens@kernel.org>
References:
 <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-4-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. december 2025 ob 11:36:14 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The P66's device tree includes the reference design dtsi files, which
> defines a node and properties for the touchpanel in the common design.
> The P66 dts file then overrides all the properties to match its own
> design, but as the touchpanel model is different, a different schema
> is matched. This other schema uses a different name for the GPIO.
>=20
> The original submission added the correct GPIO property, but did not
> delete the one inherited from the reference design, causing validation
> errors.
>=20
> Explicitly delete the incorrect GPIO property.
>=20
> Fixes: 2a53aff27236 ("ARM: dts: sun5i: Enable touchscreen on Utoo P66")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
>=20

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



