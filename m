Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD4019F0C7
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 09:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgDFHak (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 03:30:40 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41389 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbgDFHak (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 03:30:40 -0400
Received: by mail-pl1-f196.google.com with SMTP id d24so5570728pll.8
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 00:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eeV64KF8EzeWB1sPtni4tsOc6wcRgaWFJWWM75CERRA=;
        b=SflXx+0ef+78xdPDfBXkYFU0A/3xMKDBIi/+bX6AWMjPlEXQTreB3Hadce34ZQOcqy
         oo2wGWvKF/8IpeS6ahumzedWi2HPQuVK7w9w2ereAbvVj+gFkfLGtFuKT1TpML3DocwD
         NPjGwMyofTaBKM6zFoyI8Qi/H9T+XdUv+nIGe0MRJfKbbpSEPt1DeJBtdoSyAKYv3mWe
         x4vSRPQ5FebKCEYBHQewBNG4/AQQYdjWa9hzZxTAxvwCpU4IyKqz/sCm847letb6hJoM
         e4dQ+NrCYTY2IRaq+9q3Oq2zTjSbuzrG0C2dE3i/0sFz3GozxzR4CqyB+jxgUUUJsdyi
         lQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eeV64KF8EzeWB1sPtni4tsOc6wcRgaWFJWWM75CERRA=;
        b=DhIbam5DMvZL6C6OpQsOAyuLesyeL5JeiKatIjVBMK3U9/h1/EtYirGw2wJe741F4j
         q7Fq72aeKNXJnaCE3tqSWFZ7k4+vsLZ2+JC5RUGbpmNqtb/cIsRDgeul+Tp34zq1Hrqr
         mQh70FmPB7fQexShtROC0ZINPkU8fgHbls7qDpScemp0gjuxPXn0n3MnEb7tJqTWS9mz
         W04PFiZK86/Nxh49VK2Ao2i0gsCh2GypdvEolC6+CsMUoIJndkE+0RkQkIf8/2v+EnTd
         /etVJtt7LE79K99+tEmRO5bDR09HSslZsoMKL+nmtAZoxkkoZTh5w22lb3TsJlHgbbr1
         OMjg==
X-Gm-Message-State: AGi0PuZ96vtGLb8y++owpCoF7chBd0eKIylcSX1P59C/r4kX9FjyiFsv
        eh5oBnON5cD93s+flRjtCWhtH6Na
X-Google-Smtp-Source: APiQypIg4r88Ug9/WLRkPWolJVDWVc/22Qd8de1E0AHaGSbTfqLjEz+W12AJNkY38HrNyfgohHn1Aw==
X-Received: by 2002:a17:90a:b395:: with SMTP id e21mr25541123pjr.33.1586158237600;
        Mon, 06 Apr 2020 00:30:37 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-174-82.hsd1.ca.comcast.net. [24.4.174.82])
        by smtp.googlemail.com with ESMTPSA id z6sm10170179pgg.39.2020.04.06.00.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 00:30:37 -0700 (PDT)
From:   Karthik Poduval <karthik.poduval@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Karthik Poduval <karthik.poduval@gmail.com>
Subject: [PATCH v2 3/3] ARM: dts: rockchip: add rk3288 ISP and DPHY
Date:   Mon,  6 Apr 2020 00:30:17 -0700
Message-Id: <20200406073017.19462-4-karthik.poduval@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406073017.19462-1-karthik.poduval@gmail.com>
References: <karthik.poduval@gmail.com>
 <20200406073017.19462-1-karthik.poduval@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ISP and DPHY device entries missing so add them.

tested on tinkerbaord with ov5647 using command
cam -c 1 -C -F cap

Reported-by: Karthik Poduval <karthik.poduval@gmail.com>
Signed-off-by: Karthik Poduval <karthik.poduval@gmail.com>
---
 arch/arm/boot/dts/rk3288.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 9beb662166aa..adea8189abd9 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -247,6 +247,23 @@
 		ports = <&vopl_out>, <&vopb_out>;
 	};
 
+	isp: isp@ff910000 {
+		compatible = "rockchip,rk3288-rkisp1";
+		reg = <0x0 0xff910000 0x0 0x4000>;
+		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_ISP>, <&cru ACLK_ISP>,
+			 <&cru HCLK_ISP>, <&cru PCLK_ISP_IN>,
+			 <&cru SCLK_ISP_JPE>;
+		clock-names = "clk_isp", "aclk_isp",
+			      "hclk_isp", "pclk_isp_in",
+			      "sclk_isp_jpe";
+		assigned-clocks = <&cru SCLK_ISP>, <&cru SCLK_ISP_JPE>;
+		assigned-clock-rates = <400000000>, <400000000>;
+		power-domains = <&power RK3288_PD_VIO>;
+		iommus = <&isp_mmu>;
+		status = "disabled";
+	};
+
 	sdmmc: mmc@ff0c0000 {
 		compatible = "rockchip,rk3288-dw-mshc";
 		max-frequency = <150000000>;
@@ -891,6 +908,14 @@
 			status = "disabled";
 		};
 
+		mipi_phy_rx0: mipi-phy-rx0 {
+			compatible = "rockchip,rk3288-mipi-dphy-rx0";
+			clocks = <&cru SCLK_MIPIDSI_24M>, <&cru PCLK_MIPI_CSI>;
+			clock-names = "dphy-ref", "pclk";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		io_domains: io-domains {
 			compatible = "rockchip,rk3288-io-voltage-domain";
 			status = "disabled";
-- 
2.17.1

