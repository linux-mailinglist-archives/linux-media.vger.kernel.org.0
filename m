Return-Path: <linux-media+bounces-2356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE550811433
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 15:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DA671C210F2
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 14:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F002E65B;
	Wed, 13 Dec 2023 14:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LZe4Qw9D"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D10CD54
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 06:07:06 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50bce78f145so8023174e87.0
        for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 06:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702476424; x=1703081224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mpP4FYlQiPUrh7uh0fJ6KTyN1gKE2qxwNTY74r7how=;
        b=LZe4Qw9DSx91S8VEjP5F6O/2Mfdwcf5v5CH+yrSQeUVPbLCqxb6saLFtH0gdNDFfXF
         6guQ0eYz9iDwRTK8DkwfeF+WCMyHyVlTQC7Gp2WHK2W1Y+2O/5a6Qn1iy7Q332DEGmwE
         aDL2Mt6RiNoPOlICDtWxXnSqt52VcxdkQogIPKHlPGzwK/W2qcME7jEeRFLF/KNRp/ma
         Qzg9TX7JtDxT0tcRDPJGMO1ZdfeTW7wOTTwLWqfWQDKpaboXZqgomcON1Y1XFw2iDFoz
         9UpplhI7ogKSafB/P7D3XZRv4+D7oSmTP0n60vhqrwNritrc+K5S71z4VyzYhIG92WoY
         +EgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702476424; x=1703081224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mpP4FYlQiPUrh7uh0fJ6KTyN1gKE2qxwNTY74r7how=;
        b=nhK0xc4HiaZbBKuFTDT1jZ28/3Q+A9CNK+PCR+mN4FRJU0pZVc397j6rKbElSr/RMg
         Pr8nBH0Pu4KsrT2HNQ1T8E+f826X1A0tC92YyIZGASkI85vty/Q21CUe7tPaiirDQhZg
         F2qEdAq739SiR1WaeitmuxnbORknQWsO3jNEdhKxRQJFkD9fydbx2BZOAp77VXCsKunf
         iQd23QwTkcw8zOxkLRaENQIzLjZHfhzNvEl2yFPhwLDOkYhng4qLIsJTZyKAvoBI3oGn
         RfYFV4TTvMM00dRAMdBK1stJsJ4Yzi8XA0ptFwmBV95LMjR0kArmFx8Yrv2vjDqdz8pO
         tYeA==
X-Gm-Message-State: AOJu0YxmWZPUO2IHQ9CsdiYNnkAa53OeEZQUIO2mCvDZ4RrFBtpFH9mq
	X55kz/DrMfB3myEhy8nM02GD9A==
X-Google-Smtp-Source: AGHT+IHLaGkIdnxeJBM1wGEeSYqCk0pgJ7QznFWs/siqTln1+v9poui80bpgefiIR9FIPcfUgGi6ww==
X-Received: by 2002:a05:6512:2210:b0:50c:2135:cd4e with SMTP id h16-20020a056512221000b0050c2135cd4emr2244766lfu.14.1702476424112;
        Wed, 13 Dec 2023 06:07:04 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id vk2-20020a170907cbc200b00a1f76acb08fsm7037903ejc.134.2023.12.13.06.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:07:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Aakarsh Jain <aakarsh.jain@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	m.szyprowski@samsung.com,
	andrzej.hajda@intel.com,
	mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	linux-samsung-soc@vger.kernel.org,
	andi@etezian.org,
	gost.dev@samsung.com,
	alim.akhtar@samsung.com,
	aswani.reddy@samsung.com,
	pankaj.dubey@samsung.com,
	ajaykumar.rs@samsung.com,
	linux-fsd@tesla.com,
	Smitha T Murthy <smithatmurthy@gmail.com>
Subject: Re: (subset) [Patch v5 11/11] arm64: dts: fsd: Add MFC related DT enteries
Date: Wed, 13 Dec 2023 15:06:59 +0100
Message-Id: <170247641057.38939.10066985368657963484.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206063045.97234-12-aakarsh.jain@samsung.com>
References: <20231206063045.97234-1-aakarsh.jain@samsung.com> <CGME20231206063140epcas5p1ba86525117f4d9ec9172ae7cb18b7420@epcas5p1.samsung.com> <20231206063045.97234-12-aakarsh.jain@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 06 Dec 2023 12:00:45 +0530, Aakarsh Jain wrote:
> Add MFC DT node and reserve memory node for MFC usage.
> 
> 

Applied, thanks!

[11/11] arm64: dts: fsd: Add MFC related DT enteries
        https://git.kernel.org/krzk/linux/c/a41d9b3287b1d2d737984465e6efbf09a4fb51d2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

