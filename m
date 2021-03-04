Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D84CE32D290
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 13:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240229AbhCDMHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 07:07:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240114AbhCDMHH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 07:07:07 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DAB6C0611BF
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 04:06:09 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id hs11so48914596ejc.1
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 04:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L6kqHVgRXcGTejXZV+UwM9uyGX3tx7DzRfC3/Q/v2WM=;
        b=A8YAAwJbPf/mDfZEPle56kQyjHalh7PJYSM0ijYG4qQwZk5lPRSAhvvIx8CWCahSIr
         gjPmVtDOkfy7eOaiDJfdJLdI2yhdyKVVTKAbNZLT9Mg4EyD9G6S2fXRT9zxqfwp9jpYT
         2IXKAiwfWaucGDGv1F4q5l++eipR134GvwLn1s2Rfh0TYSFsqI0pUTDd3LSBozATZHwS
         XfH7ThGKIG5bAQ20eFxqutHCbtBOXiCaNYezOBt/y++QHLXO440cGmL5AAajQ2xN5c+S
         dN3UiLcXw1P4sMUEqyp7Ml1leVxPUx/YFhLYp0c8xT2cJ1gUAt6xdOlzfRLXltLeMxJg
         NZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L6kqHVgRXcGTejXZV+UwM9uyGX3tx7DzRfC3/Q/v2WM=;
        b=YTNPefAzZmwQU4xAMGPL/6bDaABjUPltGsgCsdejPATC3D9ZWN22v6xmQdbuqr5u14
         aN+3d0Ek8+m4XPaloRTNxK6HxcLtPcRkVrEdFSjtiMymUxP5eRKdrsPK9gJNUUjCdDtg
         syAXFCwaVsDFCyg0W294dsWVnEjsF4U3vDsGRj6uokyvSCoCxTBA2N4vjgKg0ItwoGWv
         d7bF2qh1DrcA6ynnYWtsYYeacC4imRPk7O9Wp+xR5/g2v4zJxoZ6hb4/rLqzZ9UtZVHe
         4W2qaahurQ38yoQjZ4YGg6p5xcPxeUeuFCFqibW1voFbBFF8dmKqz6Ffk6+AfWjnsg0W
         M5XA==
X-Gm-Message-State: AOAM530elONfPsN8NgNL23iE4PrN6Q5PoL+m4Qt30AaoxaoNr8ccN6UM
        t9VnEyCQBfG5RJJ/mPrwa4hSLw==
X-Google-Smtp-Source: ABdhPJxZkDF6mr/G1/aQr7MK5ipPu4ir8YUy583pJz1UQL5iuV/1jAqlQga3cHnYIh9ezZKtKH6fwA==
X-Received: by 2002:a17:906:f9db:: with SMTP id lj27mr3881177ejb.399.1614859568051;
        Thu, 04 Mar 2021 04:06:08 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:470a:340b:1b:29dd])
        by smtp.gmail.com with ESMTPSA id cf6sm20464447edb.92.2021.03.04.04.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 04:06:07 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v6 22/22] arm64: dts: sdm845-db845c: Enable ov8856 sensor and connect to ISP
Date:   Thu,  4 Mar 2021 13:03:28 +0100
Message-Id: <20210304120326.153966-23-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210304120326.153966-1-robert.foss@linaro.org>
References: <20210304120326.153966-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable camss & ov8856 DT nodes.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---


Changes since v5
 - Andrey: Add r-b
 - Change CSI clock & data pins


 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 5842ab65789c..ca00be42fe67 100644
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
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
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

