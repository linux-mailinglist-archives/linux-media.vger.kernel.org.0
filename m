Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F31B433159
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 10:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234791AbhJSIqF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 04:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234829AbhJSIqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 04:46:02 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5F6C061745;
        Tue, 19 Oct 2021 01:43:49 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id g5so13207378plg.1;
        Tue, 19 Oct 2021 01:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=11a8WRrodjbs6jBFryNK3TjxLIaCNHB0kvSxxWVC7xU=;
        b=pkLBJsi1UWn3VAvo3wtiy8xCGLHvs5IramWPxjf9aNuWZr/PZN0ZBeAAzxfafQYKIB
         65/S1/pSkht3Qk6fsATWUUj9551mL+6Pi6bp48AAGvVu0Kp05weiKfkC1kCtp8QmDqhM
         S+WvBLlcEblTx8KTomo/BN98wGgOBvaq7tx7idEU/DZtDPhDoDPw8BK5iQgLx8Q9fGu6
         cAdpQi+souzjcE99QcLB1oXpbWBztRxNzgUK4iMvzfbIylgMmfQyFCbwB4GSoctTXsbj
         KlX6AQ12jQBM/jYSnV7b02YB6yoipyG/BlnjHRdCOVm5rLP8GP2XyPqL+MKQBvDfbLpf
         GqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=11a8WRrodjbs6jBFryNK3TjxLIaCNHB0kvSxxWVC7xU=;
        b=pUy7/WEBAZS/idAgIjAHyfs+UIF876uogokem7y/7pAbzypobySLdYvjRADSg9rdL3
         SfLSxk0XdnSQBMWvAppmoZ3Eh8aOQ8vDkF9hwwW1epO9W5U2t1qpuyM0A0bypc5bzbMu
         5xjl/C238AvnE47+YL09qMtUqLa05mHsoIgqxFJsB/leS7Rx+CFI0i+VgDIZ3gy91pDF
         q0HdFuevT3+L8xAlwgCVghcfRt2TF9xkEMPwVuVg2+ZKL/uKgghBChm0oWhPI0q913H0
         enxYGaGauIFoED26xSQZdEw6h2uudthyzXwpaIHoQpRXOVMWYEAqdzwPHXtPn5JuM4BS
         EVpA==
X-Gm-Message-State: AOAM530VLHmM4QqxkBlY031u1nv4KMmJr3et8TbYtA8npJGNPZkaV0l9
        MXGTDdEX8DgycZRAwEy2BIo=
X-Google-Smtp-Source: ABdhPJwHL5p1H61EJ3d4KyVTH03HqMFuRWtSVTUkocgmfhLnXv0zCMAf7KKIuxNyWJClLmmjT/43Ow==
X-Received: by 2002:a17:90b:4a88:: with SMTP id lp8mr5020595pjb.226.1634633029293;
        Tue, 19 Oct 2021 01:43:49 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id c11sm1824716pji.38.2021.10.19.01.43.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Oct 2021 01:43:49 -0700 (PDT)
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
Subject: [PATCH v6 04/10] ARM: dts: stm32: Enable DMA2D on STM32F469-DISCO board
Date:   Tue, 19 Oct 2021 16:43:17 +0800
Message-Id: <1634633003-18132-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
References: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable DMA2D on STM32F469-DISCO board.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v6: no change.

 arch/arm/boot/dts/stm32f469-disco.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 30905ce672a0..ba26a3375b0d 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -132,6 +132,10 @@
 	clock-frequency = <8000000>;
 };
 
+&dma2d {
+	status = "okay";
+};
+
 &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.7.4

