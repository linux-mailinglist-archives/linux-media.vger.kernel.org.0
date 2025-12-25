Return-Path: <linux-media+bounces-49554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0975ECDE069
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 19:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F76D3013EA9
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 18:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F2A285CB3;
	Thu, 25 Dec 2025 18:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggjZjQEz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BA0224B15
	for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 18:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766687167; cv=none; b=AJVV2fAFC9OcNnxH5gcDTyaytLTZhNcmMa3+mkElvLvdDKaHcH33AiSpDWS10hr38gFT07HLpxlUPGKu0TlSzdKYgkP7f1e39frOPZ5o1zJAfCEHbpGfLRD6+SZshxMSGZYcepQDo6zKZqWqvE1K5kH0rFZ5McwbOOlb+PfL6RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766687167; c=relaxed/simple;
	bh=ZRS4iPJtbrzdg81ZX6d4fTat/ANIV4w3CMAdVITNz0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TML7NgmamxyAPVAHt+57BA9dO5HyEMXNn8JMW7f1ckdWYqvamOjdwEy3InksjzQBnex5PcfUOjAE8CMtVaz2Ut5bZ9fH/GGQncAbQy/sK4QPu93+ln+pDJSyTzrrvYL+aKl+xe3Tqgaeqp+pJofEgdEnzIkT9F5Z0V8SWF6k+Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggjZjQEz; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b9cb94ff5so7509096a12.2
        for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 10:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766687162; x=1767291962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRS4iPJtbrzdg81ZX6d4fTat/ANIV4w3CMAdVITNz0Y=;
        b=ggjZjQEzgpSYtMe7FsBkCI7BtmbDxk5b/G0z4XxlIgU2zrCKDzBVLgXnsm07I6k8/q
         f6ilR70to4MvJH3GIVvBXy6e5QOMoIeqPyPlmLqYbEK9XoaYdXPnRi13ohnjVG0MZNa4
         ffknMmwYcpFEpDSUD/tqxofkGr6mmKTjlSBuqBbTZVxN7+0tWia3WX5yvb4eXITPIkGZ
         kSnn88R2jd4sMF+ujzg91c787i2KGZLUbhdZ8XvfKu7UwRmEmo8mJl4Y6/fR6tET5Q33
         P+Y9z0RksDmZDlClkWtTSS0jPx3cWcmAKThpqL5cT0BeorzB9zevoNDVbl6QqkuioSO+
         zEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766687162; x=1767291962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZRS4iPJtbrzdg81ZX6d4fTat/ANIV4w3CMAdVITNz0Y=;
        b=iSOCHFHO8LUI0AbO7uUg3pvz2pKOah586pIeAKDgQT8Hc/D1lRlH0FseOuCR4Kkmz1
         xuxVqi8IHzTszobjY+XOE39rPiRYlIF64kaw8+BlEWUxPoMtu2gIy44uXeSJ/V4uzrFD
         NlkA7nHfpmOmMJLcNbH//FRmTLYzlnBkN8imDAO6Wfh6wzMZdKqESQBcWqFvWeitiEQq
         jmIjppVvV8FdUlHPOpyfKPg8Mrw23Ppx5TAR3cGkSC0QKnDPc+cAoIcgkgI4ih4qvqny
         GkAIaWaUwbQ/7tcgN0K0Wm43UH4S7harHNE/e0REcF6Pt1gURQlHYRDWep35fyoT/Z9l
         rDFA==
X-Forwarded-Encrypted: i=1; AJvYcCWrxGMgIlpQeXk+VevYGX2uXC9VY4cQhYyqgBDssL1J3y3MPnvQ++mugo/x/YeYV0aHw2wQTy4WyUyBjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxyUC9+8Drql4Yto+xMomWNpiwKoRYAkwksgu5vqhvYXBUrmZC
	y+WOUaCtdhk7hy00IryKgC0oBvKkt4kYf+RH7QPJbBphwMhbAhDIrlS5
X-Gm-Gg: AY/fxX55aggfN74fO8CpS1/Wc9A4c8yhm8mejjtc3AvSJzGSHRGYRbctCF7nYzcweFc
	pXf19zHW2StQzko9tjGrDQqSek/prluodwwLVGotblH9pfbB8D3p8XR53tEJAqwHfh20U2n3dXg
	1yZRrP6kD1IFH6juI7NoNZFRzx9mw8tisJNnJkPdETTKfPo8GlD3qyjbBpDI2CVqk2LB9IYCqDp
	nrjMoonLmtFI4phPulsP/ra3Iu+aJsxliprASTnE53eulzuwO3SHQFbaqHrE+cTGw7DsvvbMF0Z
	xI4Ev5PVszo2chDFKQGtqF4A4TZC7nw9kETwdjyR3+mtrg7n4sGiV6vL9ZPL1Vuz0sR3RmDMjcw
	J+hZwctO4CgKCre3WlznaD+IPLk1jTzI/Rx6+WvpwgLpb1YEnjLvs/fZY/bMbFQ4AOAvI7x6GLu
	9kU3p7Q2xbAIrZg1nIzeaHey6pG2BMwrbB
X-Google-Smtp-Source: AGHT+IET7IQnJW9NBpb65OlItl1guG9woVszRJ+kZSW9RdHnKQccOHSFq/Loyd3FgIyi5fOFPYZV2g==
X-Received: by 2002:a05:6402:1ed5:b0:641:966d:82ba with SMTP id 4fb4d7f45d1cf-64b8e944ef3mr17759280a12.1.1766687162003;
        Thu, 25 Dec 2025 10:26:02 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b372esm20774242a12.32.2025.12.25.10.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 10:26:00 -0800 (PST)
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
 Re: [PATCH 1/4] dt-bindings: media: sun4i-a10-video-engine: Add interconnect
 properties
Date: Thu, 25 Dec 2025 19:25:57 +0100
Message-ID: <5967161.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20251225103616.3203473-2-wens@kernel.org>
References:
 <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. december 2025 ob 11:36:12 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The Allwinner video engine sits behind the MBUS that is represented as
> an interconnect.
>=20
> Make sure that the interconnect properties are valid in the binding.
>=20
> Fixes: d41662e52a03 ("media: dt-bindings: media: allwinner,sun4i-a10-vide=
o-engine: Add R40 compatible")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



