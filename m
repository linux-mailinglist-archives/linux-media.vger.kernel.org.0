Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15036390542
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 17:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbhEYPZL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 11:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232625AbhEYPYe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 11:24:34 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B371CC061346;
        Tue, 25 May 2021 08:22:59 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id p24so46716230ejb.1;
        Tue, 25 May 2021 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uUSm89YnVYY5m++JvqU0akupn8UYyGqAiLVhpP+aRLo=;
        b=cgFhgV1aSQl0X2NElaBOt8i+dOhwIWsRHzkWlleoW7PinBuOKGPhYddsJddOhFcsff
         +AdMNPK7kwJ6W9DlUsEEh1LrD4kyovlSEMUZokol8/B+UUiAuFHF/j2kJFLlDtkc0tXt
         TgfEtSYhegH2dTpYcTRwE1EM4dSOifVXdsscwnRB5tHExaM4ffNJopKBJ14yRWr+zFuq
         9kFtDtp9eqwS8RnIYqTYjTYlHhNo8MP8l/5CNm6JpHzjjWEp7QhOua5o1T0z//NRA3I2
         1MIOM1uGqJeH4GD8yyCPdKNmJ6Y9CZsu5xjmWndXdo39YmesTx8KM0EXT/8zOgTmxHGy
         loNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uUSm89YnVYY5m++JvqU0akupn8UYyGqAiLVhpP+aRLo=;
        b=Vm2clQc6ZthBer6MM7Hb/En3/kVnbIzE/spGWMIy0+5cb4vhiRyHLc3fvauckadssx
         x3BO/gIQJqaXt7ZZ8YqH7XjlaFQCB/28DCzmYMnHlEUXOgv4EpnIeoB7gk3yKGkVVREq
         XZB8EJVJSVM76HGSvsiJJofkP87cdJ0LyAsteKhI9R09fHWYkkukyZLTTHKywHwXwJt1
         b2zRnNjWz4kwfrXhM9Ucwr5lZEa5O27QuuQdaAklZ3di5xRTSvaZ9sJSo8iAdKCYezQm
         eN73Tc2dH2sg1YnmHXUC6Ab5KmGSMPp4JEeYyEgqGU3ztlt2lrudTECKGiSUBZnpWzF7
         YqpQ==
X-Gm-Message-State: AOAM530viXsrD7Bp5CZy+loJuJT4jpYTXZmjKLg5i5FcLqkAtsm/v19q
        139Atd3reS1oMdcSYFT30Q==
X-Google-Smtp-Source: ABdhPJwA172I/k9A3874kTnCJ0KUPtLokMXnEWzh6Nxw5MSf8VbsUDIQJlCNDQ1BRqaD5Y+/MP1+UA==
X-Received: by 2002:a17:906:fa90:: with SMTP id lt16mr28818447ejb.411.1621956178206;
        Tue, 25 May 2021 08:22:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:b55:da44:4fe2:2760])
        by smtp.googlemail.com with ESMTPSA id e23sm11212945eds.2.2021.05.25.08.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:22:57 -0700 (PDT)
From:   Alex Bee <knaerzche@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     Alex Bee <knaerzche@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 07/10] ARM: dts: rockchip: add vpu node for RK322x
Date:   Tue, 25 May 2021 17:22:22 +0200
Message-Id: <20210525152225.154302-8-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210525152225.154302-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VPU IP block of RK322x is the same as RK3399 has and the driver can
be used as-is.

Add the respective nodes to the device tree.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rk322x.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index c8095ede7d7a..62d1113b7804 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -611,6 +611,18 @@ gpu: gpu@20000000 {
 		status = "disabled";
 	};
 
+	vpu: video-codec@20020000 {
+		compatible = "rockchip,rk3228-vpu", "rockchip,rk3399-vpu";
+		reg = <0x20020000 0x800>;
+		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "vepu", "vdpu";
+		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
+		clock-names = "aclk", "hclk";
+		power-domains = <&power RK3228_PD_VPU>;
+		iommus = <&vpu_mmu>;
+	};
+
 	vpu_mmu: iommu@20020800 {
 		compatible = "rockchip,iommu";
 		reg = <0x20020800 0x100>;
@@ -619,7 +631,6 @@ vpu_mmu: iommu@20020800 {
 		clock-names = "aclk", "iface";
 		power-domains = <&power RK3228_PD_VPU>;
 		#iommu-cells = <0>;
-		status = "disabled";
 	};
 
 	vdec_mmu: iommu@20030480 {
-- 
2.27.0

