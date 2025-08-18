Return-Path: <linux-media+bounces-40109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E339B29CA0
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 10:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE6887B3222
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 08:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8A5304972;
	Mon, 18 Aug 2025 08:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JwUdK/5n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB173009F0
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 08:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755506856; cv=none; b=Wf7s7wRdPeNziS1I5Troxl2ainx1A7BIGSILvKMa2qtMHzrFAf9wgw4gvrxzk1idQpdCat4zobZ9Nuh00ptUph2xG5Jrtr9WMz6ljleaR51/XMNniEZbDB9ntjE097fC5WuKbPK13gi+q8GiomAe9zRxqIpLPJ8YX5hvUMj2+eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755506856; c=relaxed/simple;
	bh=BFqb772XKvnkGz/X/GiHYC9tY0Kc1FlOx29S2g2BP6k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MbHWEY27x7UkuSz1d+YOT3YOntdCdW0GkjZ4c6Uo6N9N3JP0QZA3w7js47IwxSyBRVZ2rtaGDCrqc1a/Hq9PrqV4PN9gEp2y3ZSJAEL2WoyMFH1jE8t+J/MoJzTNLn4zlyqdWui0A4TD+zny++uPWBcSCIjR77Z0igtE5lY36xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JwUdK/5n; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6188b761d74so687829a12.3
        for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 01:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755506851; x=1756111651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeuayamteocopIdawkFz8GBgWsuO6jcTjJdO7tqQ9I0=;
        b=JwUdK/5nUdkGf0zbwUKOLs+S0/DASbi0UqaDUkEU3nwHR+Ki8Z8Jfsv7aJy0kJ0ABx
         5xaFtRBJpyIdqZthpPCUnb+I5wVK+kQR8UgrdDAt756aGl5ruv44ArgHOKGcjHyhZ74w
         IvkSP2pKgTk3a2OofaEF3+HKt0zyjgCZSKW9FIpQTXEVFTZv3bPE2VerVme+5wX5hEJ8
         3wjbr2HascFvi2Fau6qL+OZiOiSCRVegWe+cWc60BNs5CPSXA5vAwFDPYOyBiW2lRwHp
         NHxR5cvdwiKAgfn8rZ4SZ7CfEy8DC4NKuYDDEWRi2Ke/742SVuw696yP0Fbw40/M8jFq
         XH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506851; x=1756111651;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeuayamteocopIdawkFz8GBgWsuO6jcTjJdO7tqQ9I0=;
        b=C/NeA8JJMlIcHflfvrBDeouL/cCaF2wICfbHyG+D+nmQqB9O2eA/XAof9edUeW5fyq
         iFwhNc5dIv/zCGHXZ4OsrOvpBs1rhpITFG1POf5100GRjc1HsWM8SVcjZnOgBP9OPogk
         itHNJD68xZ4mnfow2euo24Evfv/7e+Q1r/3TR7d9jV+qO1qXclroSonr4tCeq12tfH+G
         Y5CuFYih1Pt8niffXvDZfdoD78Y4YbuHRU62mPlVfvu6LLfdxChOFexhmqtOsJ29hwVd
         ugFRdLnLqVZexsO9eYUaeHBYiVFShymUsA2CZoat9cwZX+wVSyWZCpGJkL/f6xWkbPMj
         A0Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVMK6ipPmw3GhN1RAaqmAH6Trtf8HJAtFDOaMauKbhs7yJRJlTpLRJZWBy7pT+fOVvVL2oO6deZjnxe+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzylFyGWKAdzE244aEbId4yI6bS3dUuhNRksRnR67KZJGaUctmW
	krSTt5OY1HydtPvreUVRGY5PLU+fktb5fGJbVtqfc3pqbApwohKJTIFYvIxjw9HnIQs=
X-Gm-Gg: ASbGnctK65k37aR3mmIUOe4JXjOFfaj+nGfWwEvSm4j1fYGG9scvD4vj7RSI/E0gqXX
	IcrpmOpjbCkKVAtpQPNXB+zrGBR6vyAW38BmeRdSDJwNtlPmEoTaVctrj22vf/vOOnkrLZV850v
	CkoZVUSi0OfhlOvLEkM+eQBlwAxkfvjfbHA3CLP9Zh0y0rcSUM8XJDFSzrOE9xV4jqAGZwgS322
	stA4+KOkmG2LowTLR8n40cPF7nRxjIFAlwI+yiOwx0p+KN+Y4VqB9Bxtjol57POwayYxGpDOsC5
	E3fhvzkgQklg5KbmnfJW2xJC6YOnJB2JHTub1vEvuSu14oBBFQUDhdKNb6/xmQJU6a5TNFROo1p
	qgv6nwX4z65OO9AoXVAnSabGtO7m+eqnjXXnCZG+ZLMQjpZoWUA==
X-Google-Smtp-Source: AGHT+IHnFT/QiiX+/jyxr6JrjJHBnX2ZgiTGkz6V56Qs5+zyrhsCVsoAqUSeVCMOf8wng75ASWqViQ==
X-Received: by 2002:a05:6402:440a:b0:617:be23:1111 with SMTP id 4fb4d7f45d1cf-618b0865203mr4787283a12.7.1755506851453;
        Mon, 18 Aug 2025 01:47:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618af9da68fsm6627647a12.22.2025.08.18.01.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:47:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org, 
 cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, 
 martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org, 
 catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 ravi.patel@samsung.com, Inbaraj E <inbaraj.e@samsung.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de, 
 festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250814140943.22531-2-inbaraj.e@samsung.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141003epcas5p167e0a3d0ecc52fd8af17151cdddd031a@epcas5p1.samsung.com>
 <20250814140943.22531-2-inbaraj.e@samsung.com>
Subject: Re: (subset) [PATCH v2 01/12] dt-bindings: clock: Add CAM_CSI
 clock macro for FSD
Message-Id: <175550684881.11777.14718777449068060989.b4-ty@linaro.org>
Date: Mon, 18 Aug 2025 10:47:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 14 Aug 2025 19:39:32 +0530, Inbaraj E wrote:
> CAM_CSI block has ACLK, PCLK and PLL clocks. PCLK id is already
> assigned. To use PCLK and PLL clock in driver add id macro for CAM_CSI_PLL
> and CAM_CSI_PCLK.
> 
> 

Applied, thanks!

[01/12] dt-bindings: clock: Add CAM_CSI clock macro for FSD
        https://git.kernel.org/krzk/linux/c/5576d8098052952a6c95af86ad3dcb341554ac75

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


