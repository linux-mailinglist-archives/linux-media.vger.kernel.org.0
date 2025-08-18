Return-Path: <linux-media+bounces-40110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7265CB29CAF
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 10:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2996A4E1F9B
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 08:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26683074B0;
	Mon, 18 Aug 2025 08:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xGlCf3RQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F9A304BD8
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 08:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755506858; cv=none; b=mdUUmt2gLXC2aeE837JYBn4mP/6SYI/aTSIs3UhoL5hLMdus5fsGfhcC2G9hRGjFgV0c07qQHi69KbNpIqIGQKnudroRRRMgaWMh8h6LoI3pYiKfcGSr6HNxUTmmfdGMiSPN6egd8KkOy37EaZeZ6xu4UXWDc9eR71GWJKQ8hUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755506858; c=relaxed/simple;
	bh=cfhhhzhQxZrXxPloRoYunXy+b+gOmZJrF1u84C5Mzbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n4+HIcR3V58drKjD1Vp8ypTa1mDm8gh21AChAdgTTBeb7Th8/lsc9oRfqjkCRvMSZM4LP99TPKIAqvAUSOvRuIO0OJBESj1r7NMR6W9YC2MaQkYB4kO3DYq5vKu3NKPJpxOtceg174Z4vrVG4Nwq7KVez9g010Lgcr33E1xQDd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xGlCf3RQ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61a54560c1fso47293a12.0
        for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755506854; x=1756111654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0L7vCqnemiga4MJSGEdKnywkyS4sL50zcZbVWgOu40=;
        b=xGlCf3RQ4OmYcH5KpurF2OaO1+xexpMa7V1UcD1BKoR60Qyf5OdIGs5eLIfRfjd8sB
         GwoJow6gXrqivJeYhMZ7n3IAPAwP1TrKollsllF/aqm5/S3fRQk8cklGJARp7VMDD7oV
         G2JZvvk4hC6VpCYnYCufufk3nBMESnf600hcp/o8imuSeytayRJgvB8DbsBkZ+FYvvL+
         S0+UzRXh4Sv4ztoWVxjTahRrVZIYAm03B9oWwVizrsxRxSfPvAOrqiT6E2BCMWFBeklJ
         BVuQAmvTlUyhngkfX04Ksi/ZaJq5TW+lWXjWy8tmaziLZYTSm3tbNR8pDoYsmIQHdO/T
         yDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506854; x=1756111654;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0L7vCqnemiga4MJSGEdKnywkyS4sL50zcZbVWgOu40=;
        b=Wrw4Eze4YZJlw4WJyoEUxA2omg8KTYZXhX/cfHSIYrFrnCqBRQ4rY1gIb3vqIn8xG1
         iMemGdBFOWtexZ0YbfTLWI8vz2Xj8/QFRLkmGtgLApoxMBPEuXq7XyiP4qPQ5tevla4V
         kIsvLz+B8hyEC/LAVsHR5cYq3YiIE96/tgj6vDWGfo2K9ro4ulz1ESvR4rQwkvCbt6tr
         NPiNUhzcBjeDcqP48d0UFCPu5TTkmdI6gRAslQDOWQWlCxrLVlet68VGwkhvkG5hYhcD
         fNMyNvzw0xyr5JhxgAZH4InjXnEP4ZHbMRvX4rw3k8UJpViqNbmLSG5zoKXjtrRFI2tF
         rEKA==
X-Forwarded-Encrypted: i=1; AJvYcCVqzuHPHWaeVIOH8y+q02jDMt2lgK1jYs+QJFNK5QVS240rcIy9KhhyORzIGbE3UR/KOkdBh2TL6sXdfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzComCGdNSAIVTPwXZjA4bjeEc6X1Re0t72a4e7JmbY3xCxOxRb
	tfQn+bo5WEgPMwDBA0I+QzI7RQ164NJAzp18fF382kGOUuSMuJr9BZKm3FDcML14Rwk=
X-Gm-Gg: ASbGnctkq/mTvlcwrVmzXCtOjACbh/wAjCiRuTkxQL256PTXNfbKzaLWns9+6TNbSLa
	NlFwZWZyQUypJAMMjYAHMO4xX/UJxNJ7MgxvfuQNg1oUAuuZqWZsF2eRBNzdTaSXLfbaUE1Jdzn
	yO5N69ChMsp1N/Kd6x6ucJB/XM89tzjvaXBqF1Xu0udcGRal835hAFlGJ6woPp1H+b3QBtxOfPE
	zFGirC5acd7+engHN3/JzYhnc9LTdRPJFZfY/VTTTerE1IJvBynZV72K26Q+ue/G5dTw/vlE8AN
	uZ2sd3nXBNCOmCX7A/XglQDYLSoHo0X89rXasjydfePIW24VM3NkXCF8d1bf++meqbWHBW4Vds0
	M5/FwFVF3g3izaWFwcV47Na0YWXjOgA5bK+DSkl4=
X-Google-Smtp-Source: AGHT+IHknpi+jVcAiHPe7qLq8tMu11yKP03M4lXkXrorN3kjMjAvXVfdd/sJwjbdKxYg4VZrpI7G9w==
X-Received: by 2002:a05:6402:1d54:b0:615:5cc1:3446 with SMTP id 4fb4d7f45d1cf-618b0f1c504mr4641443a12.5.1755506853905;
        Mon, 18 Aug 2025 01:47:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618af9da68fsm6627647a12.22.2025.08.18.01.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:47:33 -0700 (PDT)
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
In-Reply-To: <20250814140943.22531-3-inbaraj.e@samsung.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141009epcas5p153e4aacfc1ead3db8c9bb647c6e5c7c4@epcas5p1.samsung.com>
 <20250814140943.22531-3-inbaraj.e@samsung.com>
Subject: Re: (subset) [PATCH v2 02/12] clk: samsung: fsd: Add clk id for
 PCLK and PLL in CAM_CSI block
Message-Id: <175550685171.11777.14695565851704310683.b4-ty@linaro.org>
Date: Mon, 18 Aug 2025 10:47:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 14 Aug 2025 19:39:33 +0530, Inbaraj E wrote:
> Add clock id for PCLK and PLL. These clock id will be used for
> operation of CSI driver. PCLK is AXI2APB clock used for register
> access. PLL clock is main clock source for CAM_CSI block.
> 
> 

Applied, thanks!

[02/12] clk: samsung: fsd: Add clk id for PCLK and PLL in CAM_CSI block
        https://git.kernel.org/krzk/linux/c/1a713bd3b0c60d826bdde633919bedc1fd38df4d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


