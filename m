Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8833932C4
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 17:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236962AbhE0PrP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 11:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236171AbhE0PrI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 11:47:08 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B241C061763;
        Thu, 27 May 2021 08:45:29 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id gb17so804894ejc.8;
        Thu, 27 May 2021 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9kGg6mgXV7FtlTslQDxVXLeRt/Pl+NMx0FiHr4993Xw=;
        b=SJSq5gDc9cJqzrtBIeoHUABqAbJXF1WgqcFwRqccTMI885ta1aFLGfTZwXfb2KJ7O3
         nJqDnUY5RqpDAUXTrkLnTkMRTLAGhLcqdzN/JgjJndnfKxdj2ZcSGjM1860ItjSIcu32
         2yce1vMAuXjAxhBpZNF8BpavC+JvUO+HL1TdURtRu48DIkAdPAfjIesACyBShvSDmUv3
         as7bLCSxEXLZMG/dbmVWmRIQ3DOna1tdcr8hC6c/YXylhLTzk9p6Hj9X6fXJthMyTski
         +Ypv3neMpHtoxutXKbJ3sJ0YMnV6bDbdH8BGnf0uSOMisaJXSGhLWynn5pDimCeBB1OS
         NtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9kGg6mgXV7FtlTslQDxVXLeRt/Pl+NMx0FiHr4993Xw=;
        b=mjsRb6L03702u9EEYcH1fTojQeof/Fr+ONn1ekczGOiIoa3GIl+S67hyRm2OUcXao/
         K1v/PCYN0zZNzXlhJeoYaindRujEzIedrlh5/tCq3B1IYrAq+uuqnnf61TbhjTbeXuPJ
         ZdulUxIH2IvJ9DMDHtO+kWs9cphttJWYL41cJVDx0376NhDzLtcQnhfllIuA9W7d3Ipo
         3mgorzpy6PTDVJijHl4fX2u2+934b7Zej1E2LF9QAgIA8Km7ecxCErOoV3s57LEBGu/7
         WjiR+2v/IeN1u2dHwiMw7vNe0DZHXty3WUXqU9/jNOgNkLWHpcEypQYH51p1Ypy6Wqm1
         x14Q==
X-Gm-Message-State: AOAM532ylDrJ7+MiQKrX9hBeBxpzCbxBEoP2p+1uPBAwwAxRPiRMFS1F
        Vy2onFB5DyCvTmeeeFwC+A==
X-Google-Smtp-Source: ABdhPJzl5JDhEkcjJ1OIMd8jUhx4sOX++iKQ4claQLkF+8FKKTYfKLs16MMzLfV41QKc9wia1n4MoQ==
X-Received: by 2002:a17:907:961e:: with SMTP id gb30mr4643145ejc.58.1622130328207;
        Thu, 27 May 2021 08:45:28 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:fefd:4d98:c981:7f97])
        by smtp.googlemail.com with ESMTPSA id u6sm1178826ejr.55.2021.05.27.08.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 08:45:27 -0700 (PDT)
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
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/12] ARM: dts: rockchip: add vpu nodes for RK3066 and RK3188
Date:   Thu, 27 May 2021 17:44:54 +0200
Message-Id: <20210527154455.358869-12-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210527154455.358869-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the vpu node to the common rk3xxx.dtsi and only the powerdomain
property to the SoC specific device trees.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

 (no changes since v1)

 arch/arm/boot/dts/rk3066a.dtsi |  4 ++++
 arch/arm/boot/dts/rk3188.dtsi  |  5 +++++
 arch/arm/boot/dts/rk3xxx.dtsi  | 12 ++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index 30dcf557ec33..67d54d88fe53 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -869,6 +869,10 @@ &uart3 {
 	pinctrl-0 = <&uart3_xfer>;
 };
 
+&vpu {
+	power-domains = <&power RK3066_PD_VIDEO>;
+};
+
 &wdt {
 	compatible = "rockchip,rk3066-wdt", "snps,dw-wdt";
 };
diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index 3a0c50026b07..9d982bc0170e 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -802,6 +802,11 @@ &uart3 {
 	pinctrl-0 = <&uart3_xfer>;
 };
 
+&vpu {
+	compatible = "rockchip,rk3188-vpu", "rockchip,rk3066-vpu";
+	power-domains = <&power RK3188_PD_VIDEO>;
+};
+
 &wdt {
 	compatible = "rockchip,rk3188-wdt", "snps,dw-wdt";
 };
diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index d473552e8547..e974b49cff1e 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -50,6 +50,18 @@ gpu: gpu@10090000 {
 		status = "disabled";
 	};
 
+	vpu: video-codec@10104000 {
+		compatible = "rockchip,rk3066-vpu";
+		reg = <0x10104000 0x800>;
+		interrupts = <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "vepu", "vdpu";
+		clocks = <&cru ACLK_VDPU>, <&cru HCLK_VDPU>,
+			 <&cru ACLK_VEPU>, <&cru HCLK_VEPU>;
+		clock-names = "aclk_vdpu", "hclk_vdpu",
+			      "aclk_vepu", "hclk_vepu";
+	};
+
 	L2: cache-controller@10138000 {
 		compatible = "arm,pl310-cache";
 		reg = <0x10138000 0x1000>;
-- 
2.27.0

