Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FAD22FDBA7
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 22:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387445AbhATU5D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 15:57:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731488AbhATNyC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 08:54:02 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53781C061368
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:45:10 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id i63so2887569wma.4
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UlBA+jrFoLLefklW/JXu8ZcQb+a+i4EuznUW8mxqVQQ=;
        b=YOWJ/QSfCwPu5AKsDbQTv93fq1IJxtz9qrJuAL3ZE/GO8Z5uCTsjkb3nJeQLb9x1/A
         vJiaj9ifUExUwrM4HIJiZYNcoMueYov11qOmzV0GNyuEdzyHOvA4ubwgkDVXDV69Thut
         Aau1BINo7I15eA5keY3kVx7LQOGVSDensdfdXcAwQ59OeY+oer16BKDT4jlZTSRM2Maf
         1+FC4DXlrd1qHviBsVbIc8uW1rauj5eIX2+3wIfKLHifLz+knAMsiQk9BEfzgDNUG3yj
         JSullwoyLCG9e4pCkLY5lkJI4Y96xS/LAiq+U7c+yQPsGi6hNyZNV/J3NuB0XmU0EYhX
         6ftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UlBA+jrFoLLefklW/JXu8ZcQb+a+i4EuznUW8mxqVQQ=;
        b=H1tQE5O5MvJjmv21D+HiOjBOWa+oJIdqbQMNLOOeK9xwxVERvS6Em2/ZoYlsFw03i2
         t71QzqKFVypJyCMxSAWgNRd1tiZBTACAB5oFPH6qMTFmDGx/mG5CxNmhY77yRxVscuTw
         MYC0cneAxgMOrfvnst29STZxftPceQ3YlJgSjouBaMp6CWM6+PXEliAvyO4mgpj3KgWl
         gnlNAt6yTm9Pi3OhG83B6ZnDcSU8lDPFV7kKMgj1Ma25AChz4jwohwR4owF0h9SAM0Fv
         uDSFINVQ+mqxqIf1KsitjXxmkXNFM0hvGzFZVvhb4h+7tanfKgVcxoJIdFUIIqbpXAN0
         fVHA==
X-Gm-Message-State: AOAM533EWsVeM5OEkaWa+TsDQCiM9muPqpkrTBIUbxXY8B4dYSofzM8l
        yLrIb6XzPE4Yjuv2l+n4R755Wg==
X-Google-Smtp-Source: ABdhPJxyuaJ74/nQdJuyAGH8vGzesMdLOtUmQatDRmLixQ7HAUtct0vVX2J1/Aa57UuAPyM3+hQ6SA==
X-Received: by 2002:a1c:740b:: with SMTP id p11mr4520239wmc.34.1611150309125;
        Wed, 20 Jan 2021 05:45:09 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:93b3:1f80:ae7b:a5c6])
        by smtp.gmail.com with ESMTPSA id t67sm4224075wmt.28.2021.01.20.05.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 05:45:08 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        vkoul@kernel.org, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v2 22/22] arm64: dts: sdm845-db845c: Enable ov8856 sensor and connect to ISP
Date:   Wed, 20 Jan 2021 14:43:57 +0100
Message-Id: <20210120134357.1522254-22-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120134357.1522254-1-robert.foss@linaro.org>
References: <20210120134357.1522254-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable camss & ov8856 DT nodes.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 5842ab65789c..d89286f6aacb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1108,6 +1108,21 @@ &cci {
 
 &camss {
 	vdda-supply = <&vreg_l1a_0p875>;
+
+	status = "ok";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			csiphy0_ep: endpoint {
+				clock-lanes = <1>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&ov8856_ep>;
+			};
+		};
+	};
 };
 
 &cci_i2c0 {
@@ -1139,7 +1154,7 @@ camera@10 {
 		avdd-supply = <&cam0_avdd_2v8>;
 		dvdd-supply = <&cam0_dvdd_1v2>;
 
-		status = "disable";
+		status = "ok";
 
 		port {
 			ov8856_ep: endpoint {
@@ -1147,7 +1162,7 @@ ov8856_ep: endpoint {
 				link-frequencies = /bits/ 64
 					<360000000 180000000>;
 				data-lanes = <1 2 3 4>;
-//				remote-endpoint = <&csiphy0_ep>;
+				remote-endpoint = <&csiphy0_ep>;
 			};
 		};
 	};
-- 
2.27.0

