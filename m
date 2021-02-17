Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E5731D871
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 12:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232054AbhBQLbp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 06:31:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231995AbhBQL2w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 06:28:52 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E3DC035479
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:22:35 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ly28so1534190ejb.13
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sjijWu2CS7yMTPf9NU8eeAhJBb7+bRB7LViznamY/28=;
        b=VKry+78BKA4xuVWTSa0tDNkkQENThiMS14KSD9XhbYDeHNhTFvbyLpoP9QMKaFLI3w
         uEr8cRtndFXwd3jd6GHBNPL2r4C8wj52Wcq+Mf4Gv5SmDsCVy7FI1MdBBRZbu9g1HKhL
         1f5ukkEf4uDyWk68KPyIVZ6Pw5aXNjLHpxUiscR8kFF1Gf8EMPzbVZBZmPNtHjRCSGwz
         ZVs76FePyV4/HvGkXchv7aOr0rZFkUtZny+7EdGofz6vUAghKgri88FuOrrfmkw/2XAG
         x0jeRFkH3vsGzcs4lQT87G560llSjzujzoxa4EqZDYcBUGpvcdYyZvWtu49E7Nc7iQQp
         YqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sjijWu2CS7yMTPf9NU8eeAhJBb7+bRB7LViznamY/28=;
        b=pYYPElExLrOjnf68GoRZjq7OeRlG1IA7OmM0480rKtW+xEV0L+ZyU4WUVPFcQ5PXrZ
         06ub4l6ePSMvWxsKF/s+9eVciwMWaX5jUbq1m22hiTlkZXl5fN/sHNYsbuwW+lXgTCS0
         1NzSYsFQeFv1tQU5NSMdHNUQ05DVgrkazJAW46LMS4WLo2jLXkN/v7UCbTZsTrwG6yof
         ppZ5B36IoUj5b+Dcs1OOmzed8XGm4YDShtMqZZRnIu1OrFwCLroXPnYl3aKOEK6xhbOh
         gO+yFI1ZuseyKqvY7goXAFyThqsSSFXxks7shWZLd0VpQc0dNqS1OxoFgwL4onoOAnJ+
         SaDQ==
X-Gm-Message-State: AOAM5301jXWyS6KoSj9jAl+/J5tIFBDodORND+uREwySKcC1EDHyHP6H
        zh6DWKyqBvLJuSYK6f9eJJSNZw==
X-Google-Smtp-Source: ABdhPJxDvkv4b6iHuxj/xb/7fQYyp523dkeOIgNDIXRRcg9XGji694JymxprKHaXxCyueJE64omQcw==
X-Received: by 2002:a17:907:724a:: with SMTP id ds10mr24319729ejc.28.1613560954268;
        Wed, 17 Feb 2021 03:22:34 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:4815:d4dc:ff5a:704a])
        by smtp.gmail.com with ESMTPSA id h10sm934344edk.45.2021.02.17.03.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 03:22:33 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v5 22/22] arm64: dts: sdm845-db845c: Enable ov8856 sensor and connect to ISP
Date:   Wed, 17 Feb 2021 12:21:22 +0100
Message-Id: <20210217112122.424236-23-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210217112122.424236-1-robert.foss@linaro.org>
References: <20210217112122.424236-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable camss & ov8856 DT nodes.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

Changes since v1
 - Laurent: Fix subject
 - Laurent: Remove redundant regulator labels
 - Laurent: Remove empty line

Changes since v3
 - Fixed ordering of IRQs
 - Add newlines for better readability

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

