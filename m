Return-Path: <linux-media+bounces-49555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F74ACDE086
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 19:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2A7730012E0
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 18:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCB928469F;
	Thu, 25 Dec 2025 18:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7Hl5DzG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2881D5CC6
	for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 18:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766687773; cv=none; b=srLiqwT3rU9xd53VR8dexYLZ68VwsqS3ACdE8Nd54hb4jsacSAXP28QYNyowVLs6zJ/aXpTpAo9sbJkrBJ9m+74ctYQ73NGVrnM/cviG5QYLIg7SyJqzZkQJ8MNgTUns9k+DHSTu2Z8gsr23Hh/z9+/0jZFaCpDMEx8dY/MEz4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766687773; c=relaxed/simple;
	bh=7JUOyMg8Or8uhrVC4CD+kMcOGeXL28oIZJIkKzR4J1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bJKHY6CBlc/BTN0nmOqSv7pCOyFdA+6ZtWxKgov7OJzNp07jQvhXtwl0T5kAj/OA8IkUXx7CAyu7sRaB0lwzmJJ9nzWjpx9YWVGZD26e5ARb6kZcEph90dauWl/h9GVH9vhicCJlOxhfUpyOR75bc/NI2J/ilD1cqp5pEhYzrSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7Hl5DzG; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b804646c718so633899366b.2
        for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 10:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766687769; x=1767292569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JUOyMg8Or8uhrVC4CD+kMcOGeXL28oIZJIkKzR4J1E=;
        b=a7Hl5DzGX/VND598QcCWZ9gPceIhGhboJIXRtCEoZ4swuU7teT7UtlaKw+Qtdh3/RN
         TPjGTQ5+nd6hWVRpeRSGxF92o3mUJKn/cuPqrRfW16XkjRZZdaWSvJyRcIYzj5Uk0zUa
         f8w1uAvxqB+iK6zIJkNfSgmCqnS5LQjRtyxgUn1dvUBQ1bR5cPfrdu4lnOVegv5X9nTI
         xx/Li3Z8mHwh0w+sXPgq80+gZgxf8U/TlqffsZ854pRYNQzvBqCUR0wGEd8AHprtQOwF
         SUqpYiudnDGPz0ccD+n+USk4PDgK7eWPzBjqdeytQRimjvALbYwLaz55ck/qKwQo12/D
         9lPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766687769; x=1767292569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7JUOyMg8Or8uhrVC4CD+kMcOGeXL28oIZJIkKzR4J1E=;
        b=bT/+qV0WNCl7lWcO+FjnvsqDcxrQQI2IR9iVCH08kYBTXitxHY7AqfC9r4qrgpbyda
         D7OiDFVGcTXMBrtKGF9OIzlQe1i2iJPIUeMncXrrQvcmSisyCZeVoxtCITnESdN1Qbos
         7KG8NHnjbxot4Wf0MNPGnR10Z+iflAPNmXaWrLk2KgB0B/GGfi9hVhr0JnIV1OlRXZ3N
         9ftuL97RJ4kcBzn+pm7SMyo1gHYJm30mh10rYSbTTLfiNO8mZNI9NJeIBS/C+sViFmpF
         qTwHdk6W8/tbvOnO+0sz8OcQpzDT4AZKrwIPGHPOw7+RRzCu1z52AwYHm9fasFvRLMoG
         oozQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqSgKpY1hEIGqs2pliPqPfer8HUPOdBtCi6i+V9p7rVe/Sq8GXjlxKyDp3g9IEX+q77v5odE5a197Nqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLZBW4BldlqDX1TybeqghBqkTlWDATQ6KEOtcIqWzwa0PCs4Xi
	emRCyNw94oZv8PvFZCfBQ9g91L+H41gsXETNokE/orx9ANkOGprkOMj7
X-Gm-Gg: AY/fxX55s77Of9KPZHqTZrnF0zvAjMQCBoY4naGBQJ+OL3SyH5Y0a6LFBDSeFXTzvOH
	pNA+3uCTF441/RaN82cEI7kUlnRrfjNDWMUxaN0kQrImIE99NxvSIRmK3WsmZyZwrycKAoUFdtU
	d0CuRD/EtrsbprysuKt9chr0khlqjGiyPjJuRxR1hIi25TH/LeAROzhi2Xh40mBR0OxEtBBL/o6
	I6x6M2bhHmD8ma/v91Zag0KZFIhisn+9UG69Ycf5nUiMQAWz7gRpNGxqLl+p3nFp/IIiaVGwLc+
	WcZAEqV2SDqojY76s9fhi8KFmISvsha5UX78MpgiNSoB4tgD/uD2q2BrLKB4mz2Xg79YakiYh26
	qOrU2oUCCCGZjkHF8+eVCzTijxtVMbBAkLXIBjFCqrvYP7fuOxHsNOd7HRBFoOZQc9ixOAltCiP
	zGGy6jdu6qFGA5xNUFBYChUGmpTrHV13dSumJezUfQj40=
X-Google-Smtp-Source: AGHT+IHEIjHpbPASvhXMCNryNTALHso5yEhVN2Zt1Wti83jtrsqyLd89aktdU3iFdV+yBgA6+HZu7g==
X-Received: by 2002:a17:906:d54d:b0:b83:1400:482c with SMTP id a640c23a62f3a-b8314005538mr450270266b.64.1766687769040;
        Thu, 25 Dec 2025 10:36:09 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad806asm2154858066b.23.2025.12.25.10.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 10:36:08 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linusw@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/4] dt-bindings: pinctrl: sunxi: Allow pinmux sub-pattern with
 leading numbers
Date: Thu, 25 Dec 2025 19:36:06 +0100
Message-ID: <5080862.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20251225103616.3203473-3-wens@kernel.org>
References:
 <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-3-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. december 2025 ob 11:36:13 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The pattern for pinmux node names is typically the peripheral name and
> instance number, followed by pingroup name if there are multiple options.
>=20
> Normally the instance number is directly appended to the peripheral
> name, like "mmc0" or "i2c2". But if the peripheral name ends with a
> number, then it becomes confusing.
>=20
> On the A20, the PS2 interface controller has two instances. This
> produces pinmux node names like "ps2-0-pins". Make the sub-pattern
> "[0-9]-" valid to fit this pattern. Avoid having to confusing "ps20-pins"
> name.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



