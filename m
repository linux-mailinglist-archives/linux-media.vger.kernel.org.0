Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 811051143A3
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 16:34:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729772AbfLEPeX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 10:34:23 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37461 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729808AbfLEPeT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 10:34:19 -0500
Received: by mail-wr1-f65.google.com with SMTP id w15so4160296wru.4
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2019 07:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cvIKYbv02jfkUFc5yq+y3wt+kyYSZpa4lPRFM3efvsQ=;
        b=Vtzf6YNqgoAaCepibQJqB+oRUraYuYM4z8tSKK59qmq5stMUvAdB+5q+XIdsKOABIl
         VpP08vBGgGPR8Y5f3xG1AMOHGvmMkWvU/Oca1xY6ANqlBPb8nVAqzxNEmOAcv+3QICm5
         T0VME75HypIlfAukkXmcATSTMQkKMZlFi4y652RFyDNg8fbpq6ZzJWp/9mQ1Epdo0iS3
         RPsYVfmjJiH+w4INMrHQRt1bgSz6bJlx4OQRxRdyhIPmSeH0g2k3bnxVlyeYoZC7KwdE
         ZVyzhB5UG+UTEHwz1loKwzmn0BA6e6oPkpKaEcfbyaeo2O9txuwXlZAvzkF/hqw13RVR
         6lYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cvIKYbv02jfkUFc5yq+y3wt+kyYSZpa4lPRFM3efvsQ=;
        b=IklYVpc2/yJ5LLzT3zsyfrOxiRgknFetGEZ4RbzmyhVPiLdrMF8boEOk+CoEQbjS9R
         ZqRkTNy4cBKsdudkFX06jY8fSSZmIqPdFGAkflwUjcnVJVN2wVLxJlnDV/kKUpgVMUXR
         Uh0+obSjsS47q7wF48j81naXcEWv1W36fWgwwstGcAN3FGjeVL4DHRQG48FQxAEsXieI
         jZG0TO7aYtJbCgtG/tGG69YxR8ytytl34BQMPZxepPn4RQpQhti/7tE6y90Udv+1rBQs
         3q2zYASgj9LJl89E6pNixlNAGZhNtVaPmm0HwoHxMHy4fuyY/JBa7LE6p+64gm1cvYEL
         Yb5g==
X-Gm-Message-State: APjAAAXO/o8b+OAzDkP3udvNHp2pmfHi/VZKBsDmEaAQsgk7jWev8ae7
        F/7gJrclW1mfhx+afloujm0Uzw==
X-Google-Smtp-Source: APXvYqyHR+QR60eFIPYWpUC+I+EzJhKER/8/scWXEk6o2dHPHZQW02oXEkm5YTJXCK4A04iQ0bW1wA==
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr10388098wrw.391.1575560057417;
        Thu, 05 Dec 2019 07:34:17 -0800 (PST)
Received: from bender.baylibre.local (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id u26sm191894wmj.9.2019.12.05.07.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 07:34:16 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mjourdan@baylibre.com
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 4/4] arm64: dts: meson-g12-common: add video decoder node
Date:   Thu,  5 Dec 2019 16:34:08 +0100
Message-Id: <20191205153408.26500-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191205153408.26500-1-narmstrong@baylibre.com>
References: <20191205153408.26500-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Add the video decoder node for the Amlogic G12A and compatible SoC.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 3f39e020f74e..6fe7dead5a92 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2152,6 +2152,29 @@
 			};
 		};
 
+		vdec: video-decoder@ff620000 {
+			compatible = "amlogic,g12a-vdec";
+			reg = <0x0 0xff620000 0x0 0x10000>,
+			      <0x0 0xffd0e180 0x0 0xe4>;
+			reg-names = "dos", "esparser";
+			interrupts = <GIC_SPI 44 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "vdec", "esparser";
+
+			amlogic,ao-sysctrl = <&rti>;
+			amlogic,canvas = <&canvas>;
+
+			clocks = <&clkc CLKID_PARSER>,
+				 <&clkc CLKID_DOS>,
+				 <&clkc CLKID_VDEC_1>,
+				 <&clkc CLKID_VDEC_HEVC>,
+				 <&clkc CLKID_VDEC_HEVCF>;
+			clock-names = "dos_parser", "dos", "vdec_1",
+				      "vdec_hevc", "vdec_hevcf";
+			resets = <&reset RESET_PARSER>;
+			reset-names = "esparser";
+		};
+
 		vpu: vpu@ff900000 {
 			compatible = "amlogic,meson-g12a-vpu";
 			reg = <0x0 0xff900000 0x0 0x100000>,
-- 
2.22.0

