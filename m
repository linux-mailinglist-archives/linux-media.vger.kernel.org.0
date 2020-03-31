Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19488198D99
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 09:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730011AbgCaHzM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 03:55:12 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:43580 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729958AbgCaHzM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 03:55:12 -0400
Received: by mail-vs1-f68.google.com with SMTP id w185so12851352vsw.10
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2020 00:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=XcxlC8voK3BCMRemt7h4Fpo2KAEmkZNdF08SwZmVQSg=;
        b=W7pF7TIAJMFQUvYSTescrHivllYVvta5fegnpDwEjneZstS/87dClTNUVYDV9o3E9m
         6WKy+TKIB7N7n5Xkccg+QmgZsyW1W7WdqggbZ2q4Ze33BePedl2dV/sEXBuxrVJEeTgZ
         BEVZab4XBwuXONX8JdBatM2fNqxA/vtwgeGO46xXZucaGNwXb6xNsUVPMV1efSA+qeDs
         CLchZKVC4Tj06MyL6Vlni++1DPui1f8J0Wx5rntrMXUuo1xiNe2xLNoR+TpPkWJQFGi0
         lFFwIbxAQci9+hH+lMxMM1ZJ4sz5Z1PEh1TpnQlU0hAXaE+iaLVsDn3zLVPM5UWi6+yT
         1/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=XcxlC8voK3BCMRemt7h4Fpo2KAEmkZNdF08SwZmVQSg=;
        b=GBzAHyVrVSVTWT8EsvJAdBs7VN8KZrcKER8qEiFl1WFT+7Q35xRbkdQgJzkGe/hYwW
         CL/yhdx6leYIUiyM0f0fP8NL7OYZ7v38sdmHanr/SBnCh/f/Jt6cTaYlGacS96N+s80n
         B+WwgOlQkOA6TU5pDuPzDyXemOICHJHY/ye2lP2wfJaUtJ+Cr2DOYhveC827UwalyTE0
         h8Rzrh+1C6A/mkji0XlOuZpY/cTDahNrOyklgpTdTHD0h7yWW4Tv2NYAjqJnpt9PAzwJ
         W1wlwKstD18N93V57P889mS6UL16sHJ6GDaJNdZ5Y/kPNkaZAHL4QtITjvb2AS91L7t2
         KxEg==
X-Gm-Message-State: AGi0PubHSuiih7ZBfV94A2DWtl5FcApR+pOa5FxselU7j6v6dwjIpKqy
        y8KU7LUAINci44q6yjEwfmxIbn+tc7KA1Intr5RxJw6P
X-Google-Smtp-Source: APiQypJhx1UxmATWsmmS/eNb29nIubMpyR0pOMDHkp9zddY2gcOcO5kwq6+qlZKGlC//AAlX6chNYoo7XfTJFWaKitk=
X-Received: by 2002:a05:6102:31b7:: with SMTP id d23mr11344203vsh.25.1585641309853;
 Tue, 31 Mar 2020 00:55:09 -0700 (PDT)
MIME-Version: 1.0
From:   karthik poduval <karthik.poduval@gmail.com>
Date:   Tue, 31 Mar 2020 00:54:59 -0700
Message-ID: <CAFP0Ok-MXSYMe=-SKrgS-ng2f1uKwT0eed4uKc0rSOXzEoEXig@mail.gmail.com>
Subject: [PATCH 3/4] ARM: dts: rockchip: add rk3288 ISP and DPHY
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ISP and DPHY device entries missing so add them.
ported over from https://github.com/TinkerBoard/debian_kernel.git

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

+    isp: isp@ff910000 {
+        compatible = "rockchip,rk3288-rkisp1";
+        reg = <0x0 0xff910000 0x0 0x4000>;
+        interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cru SCLK_ISP>, <&cru ACLK_ISP>,
+             <&cru HCLK_ISP>, <&cru PCLK_ISP_IN>,
+             <&cru SCLK_ISP_JPE>;
+        clock-names = "clk_isp", "aclk_isp",
+                  "hclk_isp", "pclk_isp_in",
+                  "sclk_isp_jpe";
+        assigned-clocks = <&cru SCLK_ISP>, <&cru SCLK_ISP_JPE>;
+        assigned-clock-rates = <400000000>, <400000000>;
+        power-domains = <&power RK3288_PD_VIO>;
+        iommus = <&isp_mmu>;
+        status = "disabled";
+    };
+
     sdmmc: mmc@ff0c0000 {
         compatible = "rockchip,rk3288-dw-mshc";
         max-frequency = <150000000>;
@@ -891,6 +908,14 @@
             status = "disabled";
         };

+        mipi_phy_rx0: mipi-phy-rx0 {
+            compatible = "rockchip,rk3288-mipi-dphy-rx0";
+            clocks = <&cru SCLK_MIPIDSI_24M>, <&cru PCLK_MIPI_CSI>;
+            clock-names = "dphy-ref", "pclk";
+            #phy-cells = <0>;
+            status = "disabled";
+        };
+
         io_domains: io-domains {
             compatible = "rockchip,rk3288-io-voltage-domain";
             status = "disabled";
-- 
2.17.1
