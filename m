Return-Path: <linux-media+bounces-34047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBC9ACD919
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 10:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BA651898BBC
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 07:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C3324678F;
	Wed,  4 Jun 2025 07:57:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E40243964;
	Wed,  4 Jun 2025 07:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023862; cv=none; b=ou1InTXKiVWxsqvy2MRcvV74hXt1gAesfBE09OKFfS3jtSDHnamkIkjBKLx2MRvK6d0ocaeL3Nj6sHYgsN0TmzhRO095Bn8eYP2w5GW7AY2HSYctxwtvgp2DpoFvNIRy8DBIrtqJLsK35r3uD9/0dfmD1D3bmfyFtbUb0MUMVg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023862; c=relaxed/simple;
	bh=przKS1HYdu/Bc83LPdPNrzedY1mq/TCgIr/UOHPeOLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rn/jXluw+fK2PTMQubloC+I5fCFvH0RQLABQq0dmH62wHjB0UlOf1emBk//azjpgi8DRIOgjTAgCsFkiUbDKR8NYSUaL4JnpstPcNG5V4Ic3p6/yzkQbKCgQZt3CflvmJtDiC5oosteyJJ4kXN/zUg3RMRcFKKKsrLPsAC6LI50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-604b9c53f6fso2403043a12.2;
        Wed, 04 Jun 2025 00:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023859; x=1749628659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyqlZAcdTFyJYPhP3doh/0zsI0IchLs8FmT00VqXdQ4=;
        b=wJ5mDj8em9bEuvbTT7Ea1tJctpJY+mTm1BVs70Aw0eIMsj6d2qWzuOjbg8l22ls3z1
         xtgeQJd+MPM+jdEBHFeiZqo0gJUlfYRUDJfXa+KlpRbI46ZdNxjR+GiwmySOc+mjifGk
         E5TAd0WMfuO25MRxtGqdOO3810P9GUesfakNNoV12Z1aBQvrKDPVheNkFTvVpsPzzzAe
         pEKGMAPIvWwam/BSQeBw/Z3ZgihzR5fPWqlud7jZyXiM3vaaB/Puhi6O7lS0+xQaoIIk
         3vpagsz+DzR+H/08ZMveHblo8TKen8ggonnPPvsxBGV2x8/ZvOAh9UbS8LhVFNCbf3Y+
         nCpA==
X-Forwarded-Encrypted: i=1; AJvYcCULbeZi8JzuN/OsbP83C9fZb1duqBmNRDpPZQTW7Rq3v9esJu+NvQVe5OvWrreXJhjllhryOndFJcVk8pk=@vger.kernel.org, AJvYcCWMJQxKs9L0kUk5PxyhCt9BisfetyOGWF+7gnkKX/bKYVvKD75iY1IHw4n/ZFIK3YhF1hbx7J4epxGfPGDj@vger.kernel.org, AJvYcCXvuymXQcsskwfagyE+16fYK4T8oqC8x9EUVyRicWCdatpTxut1e/JQBV1fYmgkfMpxuRu1dhZrHNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA64YFL1C39mjOQprCBKnVbE3XgzfN66UgMT1+8Z9v23UydoRB
	dS4IbfWgoMZHSu37oIJBkyHf+4wYrgQxpVQfxmQvS1rKrR9laUv9B7XY
X-Gm-Gg: ASbGncva4ZpE9cQqCYa9ljY0raEwXFD6wSsCE1aSOz1ZkJKOOZpNyU6Q6IosnBcYreP
	rsKZzOZ90JoZxPEIJz3B7YYbYBtNHBHn/ghk8fwOCzMHWjcNSv1fO0J/9UU2WCsTbfguqUs4VkP
	ikceR/rmzX+q43viz7D1fmYyVJlvhyXqX4h7tZ9R0ZXqrT9IJ95dWdo5rrJpMxqRD6bgxyFFjbT
	t3pVG0KGmQEEyYH+3aAvLyk79qXAaKWh5EMgCNGvNcOvfkIW9Q9+EYbc24L337IzpXWQtoDnlbO
	771dT08krFKK4aB2PKaStBvItkw++KliCsnKvRS8E7DauZzcjGBIO0WnY8w0a6zDz5uFJSA+HkV
	2i6KOW/ibkA==
X-Google-Smtp-Source: AGHT+IGSL2u81m44PshHtM7hdBSEpD8DSsBTKjhSOsPhct3tLEmRi8Q1fHTg1PC7eFwd4tUCzQ2s1Q==
X-Received: by 2002:a05:6402:2690:b0:601:fa1b:cb2a with SMTP id 4fb4d7f45d1cf-606ea17e694mr1966918a12.26.1749023858889;
        Wed, 04 Jun 2025 00:57:38 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606fb36a160sm348569a12.45.2025.06.04.00.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:57:38 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 04 Jun 2025 09:57:22 +0200
Subject: [PATCH v6 09/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-6-10-rocket-v6-9-237ac75ddb5e@tomeuvizoso.net>
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
In-Reply-To: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
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
 Kever Yang <kever.yang@rock-chips.com>, 
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
index ea831bb6e2ccc64c811f885a4964da7617c255d7..a44dfb376fdf4c29e1bd307d9a7d1621e11d8c59 100644
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


