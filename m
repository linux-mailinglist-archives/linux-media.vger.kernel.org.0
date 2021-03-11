Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C20FA337C1E
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 19:11:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbhCKSLL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 13:11:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbhCKSKn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 13:10:43 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5A2C061760
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 10:10:42 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ox4so32541558ejb.11
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 10:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v9ovWZgFAlWGGQ1sxyZ9+Em1R2VKteToFFiptWzU7k4=;
        b=gcDGTvBujfFZRgC/WdDFBpjH9uaBhx31fYT2zDELYY74u7Iarug+JmeDQDr9StlIZv
         /Vwqy5WWpWD9Mz2z8S1uw78VCaBOk4J9BiJtSwwCRt/DBg8mLdtRa5MNNYNflYwUCY53
         iCPaTrdFnNti+4yV5obwLmOpVMQyjDtzVV3jS0DoTVcJceV7X2hfno5jKccoUGLVgA4Z
         My8iJ9UZXUFaa5QNKvDsWfpg3JdZXPOraGFQ004U0AvzOXZxXgntIjbjLpJPrgcOGGcT
         RjhCjmINOEqzOsvDWWU/SgxOWgGvdQOkaPoqwGtqLDvCgFEQ3Fpc9VspyZ5CL+ymnyDe
         bp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v9ovWZgFAlWGGQ1sxyZ9+Em1R2VKteToFFiptWzU7k4=;
        b=uKJslFO28+r6Hbi9o3Xz5Jt3KNsriG3/0vpOgphsCofG0AhT5JF9TgdPRYdbeWAU8p
         bERhn+viUI5YqL5/eGIjQRS04fjvLTdoKRMdXPxFJ0axZiOSKswHMgtsQ8V/5vBAsReg
         EzI5LtSnohwq6FDbHG4CaMh6LQCnLZuJsElUtZ2Mm5gV/a423C66d/FAkS0NIBrt6JRX
         F00YOXxX3Dd89aN29TKT1alD7uZdI9XVvCi5UvS/XhiR+SEwchq7EGS2d9hq4BCPTk1U
         kc1JVT5nbcXiTcszVkc/Vt5ktyFUMjz1GHOAEkpagF+bJSxW/ymlDNXId+FY+tpSIxIT
         r7lQ==
X-Gm-Message-State: AOAM532E4Ija63BnGIbIPVVJL1jTUEsqaGAJFEpPr69U19us/8dSSRXW
        rcqfOSxkMtV3LQDJLf/7WuLnOg==
X-Google-Smtp-Source: ABdhPJxpnyNz+lZqsEVQ8JyNg53Lql0Z7S1212PUFiT/HK26y1BgNFm2X07rGryMW9f9V3UHpjaDAA==
X-Received: by 2002:a17:907:2054:: with SMTP id pg20mr4285492ejb.213.1615486241362;
        Thu, 11 Mar 2021 10:10:41 -0800 (PST)
Received: from localhost.localdomain ([2a02:2454:3e3:5f00:8e01:34c:da50:eb7e])
        by smtp.gmail.com with ESMTPSA id a22sm1741290ejr.89.2021.03.11.10.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 10:10:40 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v7 22/22] arm64: dts: sdm845-db845c: Enable ov8856 sensor and connect to ISP
Date:   Thu, 11 Mar 2021 19:09:48 +0100
Message-Id: <20210311180948.268343-23-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311180948.268343-1-robert.foss@linaro.org>
References: <20210311180948.268343-1-robert.foss@linaro.org>
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
index 7e3c9fe4955d..e5a693c8dc42 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1110,6 +1110,21 @@ &cci {
 
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
@@ -1141,7 +1156,7 @@ camera@10 {
 		avdd-supply = <&cam0_avdd_2v8>;
 		dvdd-supply = <&cam0_dvdd_1v2>;
 
-		status = "disable";
+		status = "ok";
 
 		port {
 			ov8856_ep: endpoint {
@@ -1149,7 +1164,7 @@ ov8856_ep: endpoint {
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

