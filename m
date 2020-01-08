Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9BA1339A2
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 04:26:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgAHD0d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 22:26:33 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44391 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbgAHD0d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 22:26:33 -0500
Received: by mail-pf1-f196.google.com with SMTP id 195so869962pfw.11
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2020 19:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1xOSp/kO5RUHbhgM95X1/1jyAywCmLEOyBUx87fFFtw=;
        b=YfjvWjsaaKSbVwMhWV4e2o2UhVmKdwk3YsOZGjWpCogvoGsPWrQNsyJorRN6s8wfgN
         A85ZEmclMJYvt2/41/sVuGiUkdi/SXwXQY6qW7HuF+q9QkWp2hRZRITST6+4z4vW9W3c
         SONMWPY5/FwsyIQDvtO00HuOxmyjd1HOhKXis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1xOSp/kO5RUHbhgM95X1/1jyAywCmLEOyBUx87fFFtw=;
        b=b9TAfaukz7RdoHzDfI3wYUa3Wz80SupUnNHy61KVKoFLCtsg/O3fBOQjWDzR/HAeGe
         wMji96uzL4KhdQI92yr6Yrk2fCc557brLwAk8UO9RoE3fWAqeyMzxJmKcaG+fSBWGZk9
         yf9ojJnuUAof/gYpdTLL+RZBpKGcAKmSjkZ8olNQ30NC0aHgpn6fFLo6pWv/496naKzY
         qWbj/tu6O+tE7++FlVVoSfy/Jw/SujIYxN1jeReYLi5GbkCm9OmmTmMNx7igwETc3EhZ
         bVz1oSPuF3FlFlWXGQeCFF/HKZ1gyn5umviF5DWLOSPg8m5BtQSqu6vRmikpwnhk6meB
         mRHg==
X-Gm-Message-State: APjAAAVS1zAxfuak2U6SU8kAo9MKxZtyKpFLHhY/hlyiv3J0o04Tdjki
        GR0N8VMNSeh8o1DvOGTwVCoKoA==
X-Google-Smtp-Source: APXvYqyUT6VsXxCtYuElv5Y3o6IQMdGzsPCyousxOHbeS/ntlyTO3M2XSD2NtvvArGznvirU2k991Q==
X-Received: by 2002:a62:3086:: with SMTP id w128mr2755138pfw.58.1578453992605;
        Tue, 07 Jan 2020 19:26:32 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id 80sm1056157pfw.123.2020.01.07.19.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 19:26:31 -0800 (PST)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v2] arm64: dts: qcom: add Venus firmware node on Cheza
Date:   Wed,  8 Jan 2020 12:26:23 +0900
Message-Id: <20200108032623.113921-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cheza boards require this node to probe, so add it.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 6 ++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 9a4ff57fc877..8c2e3aeacac4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -1279,3 +1279,9 @@ config {
 		};
 	};
 };
+
+&venus {
+	video-firmware {
+		iommus = <&apps_smmu 0x10b2 0x0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index ddb1f23c936f..8f1d19c5a098 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2567,7 +2567,7 @@ usb_2_dwc3: dwc3@a800000 {
 			};
 		};
 
-		video-codec@aa00000 {
+		venus: video-codec@aa00000 {
 			compatible = "qcom,sdm845-venus";
 			reg = <0 0x0aa00000 0 0xff000>;
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.24.1.735.g03f4e72817-goog

