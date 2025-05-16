Return-Path: <linux-media+bounces-32650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D4AABA13B
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 18:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FDB41BA86D0
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 16:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34EB20CCD8;
	Fri, 16 May 2025 16:53:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06D7202969;
	Fri, 16 May 2025 16:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747414429; cv=none; b=UofQq27f0PuIJeJow+4mNsPwGRLgJ0xXzadZFob20w1fCbZEoEJoY9KuuEX/YZGSKPzkWCgY51FAHu/0lHl6ICX98NoyUOfL/f1RAHyCAZsYXfQXxpKwclZ6GxEVVC0KWJ3Bl/XXWAlFVkf4lWlfoxmhBGg7kMR17Im1ZAzJXyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747414429; c=relaxed/simple;
	bh=NRMjmQ9hWCJp5QjTRfwn+gdSr4qOoYdUSL6ilt4cUlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLDNf22glhQ9Vx0y2nZ+o7gTdErpNfvuKuYxuSi4Q2CgDrEHtFx5J6vYoKfJfu4j45fs/52P9gxw+1Pvgekks73fTnBs/E+MmbAj9K0QydNTHbNSXjP0nTqYxyw20S/Ov0CQuuy8Vdfj05COVb813y4W0FbN+JSDc1B7ZuTVT3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so16923585e9.3;
        Fri, 16 May 2025 09:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747414426; x=1748019226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTsKYei0TKRuiGpGV/2kNvyJqAo04bcMiePh7aZi7j0=;
        b=FQZwqpwU9PeZODbaxPQfvjijQQKf0JSDK+e5shqXVFvfqpjDwFe7on/XpO0z5KeUj0
         Z5VVysMOQPjMkpldR/W7PQmNJjo/rNRpHSo9XMkRBqdfuVRNJsVNKuuZJ7TuqQ75aCZN
         mzYabLUX/o8k6lVJpUtdBlJIFCCegiA9ynzckL8p+bAg1HtYsf9imkz72ar6UzvkCXdX
         /kE54PtaOGTfvtDCo8UxYGgTJ2TgEMEoqPVkBH3Un/dY/VcWqkJiFsrojTM1AU0/OQOv
         SrIno5PnvKGqOH3TPBytq/kCtVF3SVc25Zta/UZS9IebWY184468xTa9a3vvb/6FIlJW
         jrbA==
X-Forwarded-Encrypted: i=1; AJvYcCVY1DZ6DRgLY7H2JOjXzvF4rSTWPH8rsT51lkNxAVxHGdvkgAjyPOrvYVZPpTu4jvaT8BLJzPjIQCA=@vger.kernel.org, AJvYcCWfr/1JimLLgYqGM/L+cs3ec5EiqxTNTM3qiyIW2LGgMfY1qOYDdVFONVX0jXMRUPMJEAk9rZ4XJCu0iB4=@vger.kernel.org, AJvYcCXxeeTUax5eoHEd6L3mYLzfQSnKdzUd7khOksU8c5KUM2dutiCu5uQM7zjARDm72YdZ4Yn6B59BU5+OtEsQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyko/xkZ7ATcJd8IGMP17dsENIl2FY9hAaB6MBn0GYgPL79ByZH
	DVmi6bNqA3cMCaqjTwOBOeeUBgc+G6nw6Hr8KUCYSD/QJHZGNQ+6zEPiS4kTuA==
X-Gm-Gg: ASbGncuN1KzW/GM02Ca0CIuxnK6mKVmIVgxDBRSqStGtuJdUYI9CfU6HTMuzZmwKCxI
	UHp1pBLHexlMkwlE56wj3qm+jrRfjyHUm3misQklIe8Dv+NQDg6Q39dK65wzJjs3jun39k1ZboL
	Hc1kvmrgTr+l0GhLfRjA9f6Eg2/geASTTskvbO4jEq7M4m7mXHC/Ul6/SELYLZaHRcBt7vGxJ5G
	p2Yqvuacf08Vwh41CBShblUoFxQPIfxxYh1QcZ3YqSfzF1JWUzMtNJ7NKey8Fh1mK4n8Wfnb/9H
	r5yjOO4oxfi1QWer1NI9hU2Ji4UJlMcdcX0i+7hFBu024sOjv7cCFYPSFDJfr1MWf3FcqXLwGFL
	ImRy0igFC/A==
X-Google-Smtp-Source: AGHT+IG6xhwGZJzajazwVgVx2jcHoh4QWUUDGiZvS1m1Ru92pKqvh+bIatIT9YOQeA0bqa0UskoGJA==
X-Received: by 2002:a05:600c:5491:b0:440:6a1a:d8a0 with SMTP id 5b1f17b1804b1-442fefd6da8mr27032725e9.7.1747414425710;
        Fri, 16 May 2025 09:53:45 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380498sm116511755e9.11.2025.05.16.09.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 09:53:45 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 16 May 2025 18:53:23 +0200
Subject: [PATCH v3 09/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-6-10-rocket-v3-9-7051ac9225db@tomeuvizoso.net>
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
In-Reply-To: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
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
index 7b961ab838212fad8e4a70390fdc917a828433a9..d7eebaab78255d34d4bf57d430f4a902e6c1f110 100644
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


