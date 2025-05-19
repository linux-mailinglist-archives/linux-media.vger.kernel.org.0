Return-Path: <linux-media+bounces-32792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BE8ABBFA2
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3FC04A1892
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16774281368;
	Mon, 19 May 2025 13:44:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8631927AC48;
	Mon, 19 May 2025 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747662257; cv=none; b=f94qkSwV0AZQ90P00z34eaXTcoDtH63QKU/eimLC18nxcUBtcYanvP1lOmzyYxMwmIEXopKXCaFYrQInvz1su5NS6f2MyoqcLkrJOOEE9fy8BGSNzVL1Nsy89/0RBjd1UODJtYIka3BkgbrZZ923QsIaFE69BIa74GTjBrv5dCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747662257; c=relaxed/simple;
	bh=EarcetOghNjOL95ZSELTWeu9KU3GK/KWmT1wlFXLQds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LgDgNQQRE6Hy8ieEmMwqPkAdaLnKEQ2ZNJchFNLY3iyRS7WoMANPtq46NwqHrsK/uDSKlZdkdL/3xQ2xXSPORrvRydwnhfXLZF2fGGa2A5lieYyTwVPtPLj0jm5+J8n6WtvUL6inJcoitD6XS5eLZ2+aNO2HU1u/DB1q8uR5VGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442ea95f738so35326745e9.3;
        Mon, 19 May 2025 06:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747662254; x=1748267054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3P/6sXdHxvAwZQAHntU3mNeria1ZXDx/pMQJAoXfL1Y=;
        b=TegsRsYonl+w8AjjlpLMZDGqLw3haQgohvt1Gpun2mGwouDvgzOUnVxN2zNrajfB3w
         /sETT+SlZncISO7UPTz7+gb52L/70rAVa1ez69qfWbj7v95NVLbOR3d+Sl30W06ErSOE
         hcKO6gh/IavXz9M2CDCYaPsijpIz3QsbhwIFjufoeC3HSuxaB5djmUdJLuO0mNbYouh8
         17by6N4gRt5p2eo86KOGE1GzawkRRR/nPhvyBzZ20PBMDfPR52DrZDCcF9E0+So91ojQ
         wYNO6ZNQ8UkIUAcBvuguzPkHXfxtpDicJfwuLaIydvoKRr02GHtSEQCb9/axP4URrxYL
         ZPuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmTn78iZew494P5b9k8WscPK5lYlZJmqQOTbmhuCpD54ckyf03DSMaCA5v/yRuLbqGBc1LJj0t+s2en5J6@vger.kernel.org, AJvYcCVLdZd4IWMHkg+YODBduMwvcOEWf0GD9bNnJvdWip89X/H76vP6Cta3hRBqAJ/T3iiX42LkA5GnpsiMF1Q=@vger.kernel.org, AJvYcCVo0eWQldFKWj6qaZ/yoZYcCyei0dkraDxSZenDftBfo+6NgGsKhINRNp/Qr1A3W04/v1x/9ce2rvE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8CC8ie1sntQLunp3X2xZMGdeRk0542tkJsrER2rboL0TlYVg4
	OV9XMTxYymHvxRPSn4vgRCP9QqTocZFrz0Kc7YmEuJUUqHdUil/gb4Mk
X-Gm-Gg: ASbGncsS/EkFy6eNTrx0KcgO9BG6RQLfnXAYoQXdL9lQYVG7e4gugWvHhiTmxZ/CTjx
	jWA9e8X1uEEs650Oimpq6g7udsvjEiwgyZ9FR+WQ1r5DiXdaOXEjC8/JkHFnFjgfwvHqWN/s2Iy
	Ix/3NkitFXw3GVZX/Hdvpf13HvinRQ2KTGNfoqLBQd6J144oXz2+Ol354rt7IAUJZJjfAnDj/8J
	9IJ44Bvl9Dt3v5m87w9twrmXQ7UkukSweSS1pfyy8frFDGj+NErnU/EzFPRT564lHE/G3trHIvw
	Po3b+Hp91HCbbpr0uDapZAndadE4cUI2c/19K6c4aI4NV2C0gEfrokybO7bMgEho+A9UeEFDxLc
	KdOeCRHkjvw==
X-Google-Smtp-Source: AGHT+IED7kzUlsknohwGAlzr7xKPhQnubsTHrLBV9TQD7zLZAZYPSMl1+k3sZJ6J83oZcqAr5dxyHw==
X-Received: by 2002:a05:600c:1553:b0:43d:17f1:2640 with SMTP id 5b1f17b1804b1-442fd665728mr107456505e9.26.1747662253514;
        Mon, 19 May 2025 06:44:13 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f8ab839esm171263005e9.17.2025.05.19.06.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:44:13 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 15:43:41 +0200
Subject: [PATCH v4 09/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-6-10-rocket-v4-9-d6dff6b4c0ae@tomeuvizoso.net>
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
In-Reply-To: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The NPU of the RK3588 has an external supply. This supply also affects
the power domain of the NPU, not just the NPU device nodes themselves.
Since correctly modelled boards will want the power domain to be aware
of the regulator so that it doesn't always have to be on, add a label to
the NPU power domain node so board files can reference it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index f5e58851047e80b23f9ff3244692ad868ddc1ff6..3e5199355a12f5c9ed8b6aea1dd95dcf8cbf1846 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -837,7 +837,7 @@ power: power-controller {
 			status = "okay";
 
 			/* These power domains are grouped by VD_NPU */
-			power-domain@RK3588_PD_NPU {
+			pd_npu: power-domain@RK3588_PD_NPU {
 				reg = <RK3588_PD_NPU>;
 				#power-domain-cells = <0>;
 				#address-cells = <1>;

-- 
2.49.0


