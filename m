Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0798390541
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 17:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231901AbhEYPZJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 11:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232587AbhEYPYd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 11:24:33 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9239DC06138F;
        Tue, 25 May 2021 08:22:57 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id lz27so47956230ejb.11;
        Tue, 25 May 2021 08:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5ixCuhkxgjGYv26vAQhmjGOwIvZpVeA5pt5eYFotcBs=;
        b=DB8Wur9B3YKbvG95JM5U+vC+Vc6lHhFHFLWiCmKUjyjroTtA22QI/wE0qNw/JjK4D1
         qbkL5TIOzqNJuksGZ9TmQaMJ4mo5y504eQuUMRcI6qjskGzvSoDd9/CIhEXtzDpchihL
         FTGCmEgc3ZGpK9SEqkjrcOW+tcsYLtjJjqe3PJSg12failQUsuQKZKOKMcGwT4sLtSn7
         KCOwrPU8MVou6v5bES9sv+/n8zJqPteBeSgzrVCvO7laRQl4cNKOCbF/MduI/4j8QEJc
         Adu2hmnYl/i5oO+gsRIokZlk4h7DK69pGI3sZsbwqAs3fYcuzS0/UnapTrkZnPxbRcR4
         MA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ixCuhkxgjGYv26vAQhmjGOwIvZpVeA5pt5eYFotcBs=;
        b=TJ0mCi9/XnoeUukf5mvTZUw5Bnm3K6CLRrwbZJg39Bn1BXtOL1t7cpaopOXlQG7gwQ
         xT7FyXyOhMHwRzbBId6njvpadsWJ7zid9A9iVtZyiKMJoNm+17gVp3t/12kOFmITyab3
         rAMMewY6PErtt33rtEHq5V0QWYYg/lBrjWzoLS+Cxd1RhGms5akPMKGnUjDrIkDqyjc4
         f+7gkGMOVQKICbcUEj119QIg71pBdmIKN/+eguVzElttUPcNnggkNX3q+oNsgTZ2xKCi
         aii+FoaGG6MQNWWNIhhSNDF17M5rS3tX33caSpwZrnYDNf638cDILOjJQTwSwW/GhPM9
         Me3w==
X-Gm-Message-State: AOAM530wTBPdnqRevS5rFCJhQwGGLP3zbwbcPkJhclD5TOhjguqNZ4Gy
        GOFwuzGnKhGRl6+4iIGDiQ==
X-Google-Smtp-Source: ABdhPJxBH9jYjC4YpeA7UcQJQXz/aX6+kXeGggQ/mN6D0rwwD0nlYm7Hts6QL1q2ZG0xKF5BjUGuYA==
X-Received: by 2002:a17:906:ce49:: with SMTP id se9mr30130211ejb.92.1621956176154;
        Tue, 25 May 2021 08:22:56 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:b55:da44:4fe2:2760])
        by smtp.googlemail.com with ESMTPSA id e23sm11212945eds.2.2021.05.25.08.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:22:55 -0700 (PDT)
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
Subject: [PATCH 06/10] ARM: dts: rockchip: add vpu nodes for RK3066 and RK3188
Date:   Tue, 25 May 2021 17:22:21 +0200
Message-Id: <20210525152225.154302-7-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210525152225.154302-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the vpu node to the common rk3xxx.dtsi and only the powerdomain
property to the SoC specific device trees.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
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

