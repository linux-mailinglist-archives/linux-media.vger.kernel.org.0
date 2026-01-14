Return-Path: <linux-media+bounces-50652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF70D1D38C
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 09:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 881D6300D2B4
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 08:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A34337FF70;
	Wed, 14 Jan 2026 08:47:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0B037C0F9
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 08:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768380440; cv=none; b=U3j9ZsvgZdsLODzUBoKXQ0ktJ4n2pLdpUKJ+Gj4Vm4cJaNjyPiNov7bn4hFTV7uV2zFIRwFJSsWnrFPX4WZHhr3XthuP8h+H0yY6iBH6TRe76ZBb5AbOgPt/wz3yKQvxwgA8D/YdlrIKVDMYhk2eFFnXQHTTFarmY7J6R9ycZtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768380440; c=relaxed/simple;
	bh=724MKfbyRVpOlMBiWmZ+VnfVEBQCW/q6CKIp1BMjM/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pL1IwleLXJBTchupnp67laoDf7kBZ3JqQ8U1eFgIDBJpm+BoWrDrySPBqN3AGQRhMHtfUFuicZ6qxpjlhxsN7pAlLmf80Iidt/Bc2EDOFPyZw6fJoq7SoLiV2ZgjcJZ/wU6mvwXes1j4Kt0P8twWKnFX/YBminTep0PW/mSn3UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b791b5584so13946984a12.0
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 00:47:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768380435; x=1768985235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s8k0pXMV1y8Iq4ImwhXf2ahDkvy9IQZJDHOXmgWjWKM=;
        b=LtZYCnQohdpHEbws39MW5Wj9lzSvBWA/l0modSHS2NWxGFNtfkq8XJIChfossB2obx
         XAzqnsVqdlUFK83tjprBzctIYy/+iE3M9Xzb+innQTrwF9VuA5wAEo3XFN170igzlbWd
         u4IXOAWFK+a/89FzX5/mr/DjqYZ7iRyPbYG5aWDeZOf0XbK/v1LsjAhaO7bS27bnF0ZN
         WY4I92/wovP/c6+g6Jiz70SNggWtJp6xCal/4mloNn32AIiP8pirnys/PzGIPfq14iCA
         qOdy6wW0MeVkHPnSL7sA2Z7My06eCVwtzsNVBuxXWAQDXW3P+ra1W3pvDdMT1ileZmbo
         NsEA==
X-Forwarded-Encrypted: i=1; AJvYcCUwRzxNfRBlfF8ntO4tfiFSUK3NcsDC/ga3T+HHr8fgApKuOA6SaHl+MGBI2rfzk6QKi0wXFZzSED7mwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4hMo6QnutenpHch+meMQAoA0mH1RO5lcfUVLnft2798iQw3tE
	nXBztO9p9wA2Iddo8hDY0/RND/7H7NPxD8VWZn5TO/kcCGiNAVDnUTc9
X-Gm-Gg: AY/fxX5xNwTL80vPaRm/mU8iPPHy2LZCLx8JNaJhP87A5KMe/BUbQ8uofoLAZtHlPqi
	LU/KcZtc177H3gPEw2LHGhAdKYuPf1AQrt1yiFiz0rlX9JlowwS0aHvK/czVCaIWgY+0N/uhKJ0
	Emgz9KGlyRRUfnSwCM6RJYTXKE1QYFujWrrbOTQHJWA7T7/3AsmJ/JWRVIYUJt4EdMbWhVm4FeK
	OlQ5F0vVtx2NeBNJO19U1KXpYyWmOi4ODhaNJVhHeiWkTriCv/kEL4ZWlG98SPKCN0x0Ay8atln
	iGGo81DxTu2ICipmHhvz8VWJMqJXoNjXin8ZLI/8qrUZoQHdjJTuJIRmNbFLbuJBubeuLt8/U6e
	HFVT7ndv6QYlQt+ilkLulZrG+XdhrTAq8vcvGAAiNqFtMzg5F48MD72YUAdCV1UswWbNW0acIrw
	fx7dIjRIcbcJdnmaF2fSr9pQZ894BeIrLOnO8TGu2SKLCLY8ou85l3BJBO
X-Received: by 2002:a05:6402:1474:b0:64b:82c8:e7b7 with SMTP id 4fb4d7f45d1cf-653ec45985emr1298237a12.24.1768380435183;
        Wed, 14 Jan 2026 00:47:15 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5d4sm22379136a12.32.2026.01.14.00.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:47:14 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 14 Jan 2026 09:46:48 +0100
Subject: [PATCH v2 1/5] arm64: dts: ti: k3-j722s-ti-ipc-firmware: Add
 memory pool for DSP i/o buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-thames-v2-1-e94a6636e050@tomeuvizoso.net>
References: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
In-Reply-To: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

This memory region is used by the DRM/accel driver to allocate addresses
for buffers that are used for communication with the DSP cores and for
their intermediate results.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index 3fbff927c4c08bce741555aa2753a394b751144f..b80d2a5a157ad59eaed8e57b22f1f4bce4765a85 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -42,6 +42,11 @@ c7x_0_memory_region: memory@a3100000 {
 		no-map;
 	};
 
+	c7x_iova_pool: iommu-pool@a7000000 {
+		reg = <0x00 0xa7000000 0x00 0x18200000>;
+		no-map;
+	};
+
 	c7x_1_dma_memory_region: memory@a4000000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0xa4000000 0x00 0x100000>;
@@ -151,13 +156,15 @@ &main_r5fss0_core0 {
 &c7x_0 {
 	mboxes = <&mailbox0_cluster2 &mbox_c7x_0>;
 	memory-region = <&c7x_0_dma_memory_region>,
-			<&c7x_0_memory_region>;
+			<&c7x_0_memory_region>,
+			<&c7x_iova_pool>;
 	status = "okay";
 };
 
 &c7x_1 {
 	mboxes = <&mailbox0_cluster3 &mbox_c7x_1>;
 	memory-region = <&c7x_1_dma_memory_region>,
-			<&c7x_1_memory_region>;
+			<&c7x_1_memory_region>,
+			<&c7x_iova_pool>;
 	status = "okay";
 };

-- 
2.52.0


