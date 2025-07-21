Return-Path: <linux-media+bounces-38138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF707B0C001
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 11:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F78018C0127
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 09:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D172228B7C3;
	Mon, 21 Jul 2025 09:18:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D3B28AAF6;
	Mon, 21 Jul 2025 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753089503; cv=none; b=LQGAeBTnBdnZ+tT+U9ruEc1w0ZHmMTOQdlZGEdJGldHOFnYexSbY8jsVag6Ou8E2RF9ZZqRIMhO5OQ92jOyeRZqpEH0bKe9h4qwzRVcMzk6rbMtLlg8sWVp0EqJtSJAWWZBqP5sNwYZyt9DnBteYGibWTJaCp8FIWG4HiPhXVmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753089503; c=relaxed/simple;
	bh=i/fHQRnfQ4PnrfRpaOchlf1nbeZp2wZMv7uAO/2P9OQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NOWG3b6qKzHWPs7uSfnk4c8N0T/kP8OOgDhPNSgwIYIwrmRCezzEYizaXlh95JusX9XtdewgELoYrexClwW+NGcw1MqyNSf8xqzYEy1leEQmshBw+PUs6pPGjyknzlgyw3kIa6FnVmnYypPa+7T2XwmS+lr5Yrzi4euV3wGlO0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae360b6249fso626989166b.1;
        Mon, 21 Jul 2025 02:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753089500; x=1753694300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=petoWFIc1yVrUA7vb5hl0SJbICvldq7drqIuMNaVr3w=;
        b=wfa0RdoHTuJCD8GkVjNhzF9hOnUsnM7srOe8lpGwwTrDF9PYvlbz04U5o8ZJWX3acb
         mkAVzu+i6DYE62buL67ZGx/LlWU2kKGfvwV159MtA+BuGNkHnTaFvFdxhlg7VeIQ+ubZ
         ky1p+flVyTf0Qp4Qhi21ciNK3zmfZtbuVKv5zLEX7BTTUgyRtCDQVtckwvbLp9xlGKsH
         yZ103Z47RROflD3hK+qMdyixg6uyrgI4Y1nKQaruHz4+lzwVZuCdhtobR7FLdiLWbWkN
         1PWDgIrM+o10N3zs5q5hPev1e+YobSjINjMCK4bssj4sol60wA0Le20zhSUscF8JvjMF
         Dn4w==
X-Forwarded-Encrypted: i=1; AJvYcCUx7EQ3l+gSsp/BMiH/GfscT8kqkLupNhdqDiJTsOuB6F6iXlb3y8rCyUAG2FrMovA8dBzGxH6NTueP38s=@vger.kernel.org, AJvYcCVgN1sXdS3QXMOipsnstl8ahPCmjoj/kqNgIGCC82seJqhJhFBrTCRUOWKx5VrJ7U9neqfNpsj/Sxs=@vger.kernel.org, AJvYcCWq1j9r2rRh8HeM5c4nOYLQvUHjgbtGmllZZyeLY650ciSsSlGcKEYzvgvxsTRqLaJpS62fIsiEGK5aWoPQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwEyOsT1ku+ZewOx0XHgncunIYSM9LVYDEFrmkQxMZHhRY9Xqd8
	1bgmZC54fNIlbwR4sg/Ct7rJpqdRK7KG7u+T6ghKZYgps01JQZm1fkiW
X-Gm-Gg: ASbGncvNIqjHYVvHhcH6mS8v4CC7MvQQs1AZlFExMmeN3E60PiK0+B+BSMeHUROBeKu
	3v2n4J+sSKVKtQ4YtAPXsyz7z01dRSuOJItzl6d/Roa0KyiWkSnUHQuQ9mwTLW/8lZvNAK2wYui
	83leuwVUFSkoAx5r2Ygu33B2fD0lbNue12yBCXX00KMF8qWjVByeJHUIxCGbkGy7/TCTK0SFnOK
	TLeiSj7JYjjABp5WT9xy6h8mhA6YgaFCzdcnruFtdgOQ5K0HD+2aeALfzzJbP04qEEpR2cn6Q/Q
	wW4LVeBXmPD9nmFEv6WXttkO91/LgtW3eAMRFsMLA7ce3EvsQEd4SOc4aEhjf6OIKkOpWbvLUM7
	QeNyNZ5QIJ9bX1NfTOAq98rYDyL145XW0h3s7jQ1d9kSO96Jb8+teFaaB
X-Google-Smtp-Source: AGHT+IGczU3qNrxFunoCGEDGeA0G1E/ZGSoC4F1+GJF6HBHUDUmYhKpCzIqdyOaA9bUQmJSSnrGq0Q==
X-Received: by 2002:a17:907:7b8f:b0:ae0:b33d:2a4a with SMTP id a640c23a62f3a-ae9c9ac0695mr1863454666b.35.1753089499696;
        Mon, 21 Jul 2025 02:18:19 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2efc1sm643125266b.83.2025.07.21.02.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 02:18:19 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 21 Jul 2025 11:17:34 +0200
Subject: [PATCH v9 07/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-6-10-rocket-v9-7-77ebd484941e@tomeuvizoso.net>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
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


