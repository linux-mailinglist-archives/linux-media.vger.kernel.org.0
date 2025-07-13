Return-Path: <linux-media+bounces-37564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3742BB03021
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 10:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6ABA84A0A09
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 08:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745A92222B4;
	Sun, 13 Jul 2025 08:39:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F24221FF50;
	Sun, 13 Jul 2025 08:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752395960; cv=none; b=JNZ5DVjcayDQdxrq2LlHQcpovsJpaBG6rpWvNwuQlEWk+wdUXqigJQp39ffD+ma9oEdsekz1du/DwypqqrYR/eNtTiT2rEM3poH80u/RiFYfS5zQ2nl/cxPW+dWJ6vylTVQ4xF/EOAsLPktGhyUqmiGTrCzUAowTW7csFUbPwEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752395960; c=relaxed/simple;
	bh=i/fHQRnfQ4PnrfRpaOchlf1nbeZp2wZMv7uAO/2P9OQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JDUeuNYwjOVpUjpJ6+nAoCvG2xfnhbHXMTmJUIjl8lokzwe/I7zkwnkoYvHuNQlN0zoKkjHZMHwrW1U/fqwzq3Ayu6HgxH/5FOdtmSlXnXzNZpAFbPaUrMKmMtdg8ikZkM3oo01spj/bb5eL/7h6nt8Wz3GrQCXo3nVd4PMTREY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so662099366b.2;
        Sun, 13 Jul 2025 01:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752395956; x=1753000756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=petoWFIc1yVrUA7vb5hl0SJbICvldq7drqIuMNaVr3w=;
        b=ftth9cHJmh2sG1ct8lUweSbjzYcgUGJHpnY2hYlwMuCGrl36mbh1PnA5xBBR0B8nfb
         EN4Fzl22ZeWmbFg91lArTeBGkaKJgOgkWOnqV23VhmlUyV2wdvy5YaIVv2I/L0v51NxS
         EbSnS7dbz2jrrQWfyV0YtXqc2DUnlp0F9/w2Y8EVVe0VWQJ/Mrob98I74UjZloVy4fKH
         ffpsRaf+O04zYrgSsUNSHkVtaXKD1XuIGt3SRT4ivnYkcVkaFA11UQXSbV40mJEEc7yn
         kmL2o41YJ7qUIcSwCVTPDnLTyUWjiy2Zqiqd9IXyxPbOwj1w8zX2GlpW19DH0oj2jsmP
         YN+A==
X-Forwarded-Encrypted: i=1; AJvYcCVEhsP+o808c9dP/Kamz8NamPeMI7YDucZLJVsqaoXlDqDZa+ZfTrNGZRkTpLcRK4RJmNKL5A5zr3kOyiY=@vger.kernel.org, AJvYcCWI6Dqr6rFbhT5p4gBwFK2D6WRpUHhQU6uCQrEnZlS9TwPVJjW3VLfcz3dXdB5reoK+R8E2J3pOQV5CM+fO@vger.kernel.org, AJvYcCX7ZuYF770SToFqzbw01EAKES20R3K4kbTlJGd/J+pDJ9sss55AD7AFGjJHwfwiD9/c59Dk/hafyr8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsv0iGvU+eBpz0ZvSzjj7TN0FhFECL4X4NqYxpw21Nh2YvjQgx
	Gh5dr+uLSbg4O73sl90R1GwkHOV3n/IpDrl2E8tUzxdHj/2HMt+8OeVX
X-Gm-Gg: ASbGncvW7C9jOcE1uCE0hlk8iqqe6FRQs5kLQupWa/gB+G51lZSOUE8SxXsE5XlzhbX
	ZHdxx19bh4/ZTAr+n2ZjlIg+Ck+IvCQHNs8MiRCJjNqSQJpVitr47zgLWR3RFBLT+4swpEmswbB
	t6LBExRMuhCg2Iy1Js+GJe2d8DQSj/83XyKhLOrej6fnowZTo6Z8S9rPlsstbQAaKq3oS2HNEKZ
	Iufb1+66yKkEgxZyTYxzvwrjVcDAwbIsjxDgfFFHXjUXGjLBsa3Grh1/v+WMlMw0T3OEzP6rzDQ
	lDbamJw8AQOVw9/lF7dZviSihdtGEmN6V5QMiuSkaWhwQnvYJy0LLhv7fhuUgd8UR44baz9sQD2
	ZZsVkWO+Bh4Aeo1rQqnbyZJBxTf5llpXkApdIkjcInvviViE+sOBqwK4v
X-Google-Smtp-Source: AGHT+IEOh5WdKdbW0T6J6UmEk9cmBDAiAC1DtupfJxwpMjim3iRySIz9Y05XcPSJrFS/GFvgalD80Q==
X-Received: by 2002:a17:906:9fc9:b0:adb:229f:6b71 with SMTP id a640c23a62f3a-ae6fbc13b33mr938047266b.5.1752395955356;
        Sun, 13 Jul 2025 01:39:15 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:39:14 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 13 Jul 2025 10:38:57 +0200
Subject: [PATCH v8 07/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-6-10-rocket-v8-7-64fa3115e910@tomeuvizoso.net>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
In-Reply-To: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
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
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
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
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 70f03e68ba550d6b9142131dcca86e8ded36e2f1..1eddc69fd9c9ed95cdc810ba48d9683e3f82489a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -841,7 +841,7 @@ power: power-controller {
 			status = "okay";
 
 			/* These power domains are grouped by VD_NPU */
-			power-domain@RK3588_PD_NPU {
+			pd_npu: power-domain@RK3588_PD_NPU {
 				reg = <RK3588_PD_NPU>;
 				#power-domain-cells = <0>;
 				#address-cells = <1>;

-- 
2.50.0


