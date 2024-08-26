Return-Path: <linux-media+bounces-16795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0487495F15F
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6B7E2816C5
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EA0176242;
	Mon, 26 Aug 2024 12:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qNivducv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CB1145B10
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724675742; cv=none; b=naPnb/BBYQi01P2ThCkljLMGvB5gQg5llK937JWlf0S6injsJcfpKrWsiyfZGK5pMHDkvb2lirqqmLZCr9VVp3ZK7qK15R7sMzgzI3PEDDkjN5qipCk+6hZTNyOWzsi8Ldr7IkyqNAn0KoZvi3mlj26ilLASKFs8rTBDHb22trA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724675742; c=relaxed/simple;
	bh=DeKboTFaIRylI5cauzCxni28LIIe4ZjJTqGzGYlOr08=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KjlM3Ht/LmeFsEqgv0gn8cr59ZOL2Fn6M83vRa5CqwR61cYhOHok0BrTE/H9BikTeoVHUeW/U8zwydEXLollQ4JtKDb10W+6X6mW0aSmk8D3Lh99sc7G1Gb3cXYWwVO8s3Fp9HKQoy5eQSAlu3Mi8Ls3kDRYXGDWNFujW1oNbBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qNivducv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4280692835dso6497465e9.1
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 05:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724675738; x=1725280538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjbU7iYaf5gNBv6BUFQzfjGHnybRTGE3Py8s/+lGcUY=;
        b=qNivducvmpYCjxiwStmOrbsbCS6NuBarghvk+Pi+CPEt1zJ8qhxgSVIyT4C2D9YM8w
         gghK2BwEoGlWU/1s9p9QD9Y76EemFKokOY3MPzff2mmDZY6/6FdEOagpxX57n1yujZ/g
         SIa900s8y+PyfhE9NNSi6di9Ik86E+G0u+mcQ2UAAU76KWwFN4F+4HOsdt30bIGrjGu7
         BxIGt5Zp90k6/u5+tmOB4t/gpbCxU7XyI3q8qr4JZbm7+cAcfDbC63uSNTvU+gx6gjll
         tyI4Z/uzEXt33pvxjFySCUvTGcCgc8ewLbobqz/cjdalb0jgeezreONfmzSahYAuqyvN
         4Wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724675738; x=1725280538;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjbU7iYaf5gNBv6BUFQzfjGHnybRTGE3Py8s/+lGcUY=;
        b=vZDYQXyoq9FhbpTuug2Mz9HSlArW8vpauGXj4m4LjFUjvNaF3bFrh/8Jz3XqbrDxqi
         HPe4KyXy6FmOBnGKH2BRAasP6KAhH6BdcY0y42q6ZP9guk9aoCHUDBj9k1i734qQZbJo
         ZnRmc+830eRBUYNFenD0Qm1ejK1wFevxsklD1h4T1CGu0jk9CQ7d2AHCFwZSfVBhk700
         YkD5c9W2lyX+6pjQfy78evRufV4QPAJd7CKWxrtMMJEGctbJUiQDUrouhcGm1nteLyfI
         zHg7yr3KqtV26EGBYlXgx8WGfEjNIiOEYI9sLpSviCvcTwM7GcVeN1zroAa1Bfu92x1a
         karQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7p/lPQJDPWzgibvUyCVHg9jFsZDG8eCjMUCWce147GI+b+D/1fQOyn8+ujKlai8T0SXW0wMqj/mp+Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlUAjlYkOFFEyzV+LY5unuCOUmzvV/I/haTR/cvjgLaXnYrtTL
	4mm0nKAmEwyubfx/eJkvgtHlYDERxjeqHie6oTi6as9ymQxwn3zgmHWLkf6M/DU=
X-Google-Smtp-Source: AGHT+IGdjTP13X5IrWLlNDrXyTJ+ob2cRg1i3qlAQ9iN9q2w4Z2poHnIMKCtuwo9FYF2nia+vxYQ8A==
X-Received: by 2002:a05:6000:402a:b0:367:95e3:e4c6 with SMTP id ffacd0b85a97d-373118310a2mr3659561f8f.1.1724675737954;
        Mon, 26 Aug 2024 05:35:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730821a898sm10658048f8f.96.2024.08.26.05.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 05:35:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aakarsh Jain <aakarsh.jain@samsung.com>
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org, 
 hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org, 
 linux-samsung-soc@vger.kernel.org, gost.dev@samsung.com, 
 aswani.reddy@samsung.com, pankaj.dubey@samsung.com
In-Reply-To: <20240808134432.50073-1-aakarsh.jain@samsung.com>
References: <CGME20240808135645epcas5p37c6bf0c6ad8efbe43e8451874900c111@epcas5p3.samsung.com>
 <20240808134432.50073-1-aakarsh.jain@samsung.com>
Subject: Re: [PATCH v4] dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt
 binding
Message-Id: <172467573565.54173.12707172575604889412.b4-ty@linaro.org>
Date: Mon, 26 Aug 2024 14:35:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Thu, 08 Aug 2024 19:14:32 +0530, Aakarsh Jain wrote:
> s5p-mfc bindings to json-schema is already merged with
> this commit 538af6e5856b ("dt-bindings: media: s5p-mfc:
> convert bindings to json-schema"). Remove s5p-mfc.txt
> file.
> 
> 

Applied, thanks!

[1/1] dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt binding
      https://git.kernel.org/krzk/linux/c/259f5082721f1d17b4e5b9dc2bb430821afd95aa

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


