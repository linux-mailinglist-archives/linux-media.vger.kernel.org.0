Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23BDA433155
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 10:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234788AbhJSIp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 04:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234797AbhJSIp5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 04:45:57 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13BAC06161C;
        Tue, 19 Oct 2021 01:43:44 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id m26so17027512pff.3;
        Tue, 19 Oct 2021 01:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8KHGup7Rpu6QrYrymBE1Zjq70+Yty5ooxNn1hTc6qIk=;
        b=fYShuE0Y8HhsmW0xrkpC4XrkGoUBnf+34kxtCIAra4E+VKNJ8AgNyj3E/u3ObIkES+
         GvG7fowi7pUvv6XeRsZ1BVWgJH1e+YbCVwq1VxIzvduTt22WGlUxBIHTK4ddPaOBalJl
         63jZPxXVb0kcoqSJ5SAdI7eMFeJvC91GDrI46opjQx9FzyumOBevM3mn8eNOn8vcCzlL
         nGttdz9HrGluNqJepukh2PIlkUYMZiSfBFA1YWYSkImovV6byim/AQ7O3sdb+1fhCp/V
         bJzAeLVi7jP6QL8OfydnG7fBpF4+OPuELCKmgelG8XaUUJOM7fMXr9OVCph9Gh0/FGQf
         fApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8KHGup7Rpu6QrYrymBE1Zjq70+Yty5ooxNn1hTc6qIk=;
        b=pdKCtH+22Vyi1cwiidCDytwPrkXcagzfv8BJ+WlavboX16W5zTPuqTfCzivta6T3YP
         HpFgMdD0BcGhyrCfx4AaDNkyM9B23vGpxMwFjPosjKkpscrDJDWM5FFrw80rd/y13BU7
         nWrL58Ggs2JglZw9anDK4wMHqVBJaFGJbE7m3Ma8A5HmtcwgPGEh/9PLRn3lSl+vLpAv
         ro6597Ar+H9G31OwpfqnOEMF0qCm0XVKU9fRHFdkgvtsqi4bWOyNJtXUKgLBiUbF2B1f
         brS+AC8XYMdd7CPmtFWMhliu6dGkFyu+DN0Dvbwer7tseGgKhb9vHCjwFBTPMJoiSIoB
         YmGA==
X-Gm-Message-State: AOAM532S9X7fJQKtFY+021f1YV1PWoDpgty4AyZOuXhgzjB5dGwsYh6Z
        NSvquhNHDXqtJpO1H3U+KN+dvXq5yBno2i0I
X-Google-Smtp-Source: ABdhPJy7/unRPgOuTDXgHc4DcSGF2Mul2NmVpFRCzLO1l8unixtr5OXI8I2y8rZALj+g6tMSZ6d3Xw==
X-Received: by 2002:a63:d2:: with SMTP id 201mr27681869pga.400.1634633024391;
        Tue, 19 Oct 2021 01:43:44 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id c11sm1824716pji.38.2021.10.19.01.43.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Oct 2021 01:43:44 -0700 (PDT)
From:   Dillon Min <dillon.minfei@gmail.com>
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 03/10] ARM: dts: stm32: Add DMA2D support for STM32F429 series soc
Date:   Tue, 19 Oct 2021 16:43:16 +0800
Message-Id: <1634633003-18132-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
References: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add DMA2D for STM32F429 series soc.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v6: no change.

 arch/arm/boot/dts/stm32f429.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 8748d5850298..1d8be5e7c8b8 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -743,6 +743,16 @@
 			st,mem2mem;
 		};
 
+		dma2d: dma2d@4002b000 {
+			compatible = "st,stm32-dma2d";
+			reg = <0x4002b000 0xc00>;
+			interrupts = <90>;
+			resets = <&rcc STM32F4_AHB1_RESET(DMA2D)>;
+			clocks = <&rcc 0 STM32F4_AHB1_CLOCK(DMA2D)>;
+			clock-names = "dma2d";
+			status = "disabled";
+		};
+
 		mac: ethernet@40028000 {
 			compatible = "st,stm32-dwmac", "snps,dwmac-3.50a";
 			reg = <0x40028000 0x8000>;
-- 
2.7.4

