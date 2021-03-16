Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65BF833DAD3
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 18:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239123AbhCPRVi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 13:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239201AbhCPRU6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 13:20:58 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 965A5C061764
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:20:41 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id b16so9728728eds.7
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/XB5/PYr+gM9dCUnpwZrVC+N0EakV1SQIdmfOjtLP+g=;
        b=SooMopyFEXzM7T2ZqhupISjYtyPSt8nmqen/c8f7DaKneJF/7CYcS1aa+I/Q7N97QN
         Xrn3siZIhY2TTSue2YWbTYLjQTwcLs28BaTPfmtt5PHfNc5gq49GNgRDutSvz/DINSP6
         Ix1znNjI8x0Xgd0VAzXP9/IbjjpSVr9nmOVBMjiZ96Iq3sFrv8/kSB+9mc7X9mg0jSjX
         AIy8tZbCIL5zpnb8G9+yyzgDSJeoTbYj+UrbTQ5hjR5FQAg00gFXU73jRslpa5mlQYkz
         zmZeqQ+/e8mASzVQDCc7H35Tqy3WqgR7mnUBacGD2Ozx5wapSWeUnNo/TnPomAVdLQFj
         I3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/XB5/PYr+gM9dCUnpwZrVC+N0EakV1SQIdmfOjtLP+g=;
        b=IMM+tfcfwzN/VWBqlByuJz34DMmdblYvlRc1kDFINMs1NTqG5uGkyxJ14soQg8+/Am
         AGXmQ4kVp+nOGzHt0fPG+SVqAK0GTAQovhD6Sx2hjqXj7dU0F6ElrsqAvZjyc7w+voWt
         qtAM5SVF1tkOT1pTidlBu8BZFCxSSnB639hjklwaXtI4/ObhY7vTiA1kSTGvS3jEvN6K
         urEXM+jcQvC/Mo1a9mLV1VZdOVID7RmTRN8Hkm3vEHokbZMHcekN3yi6VtNWgCFrib/i
         42RIejHsJhJvV6fiOD2EoVFgsEhAeNwy7PeeM6b/ZkpUYc5nRuTEq3IPqh7Dkb3Skcgu
         GwOg==
X-Gm-Message-State: AOAM532royRNnXazbp5NQn1nqWIyQKoLomY2lsZcl8mvzYw5mYt3Qw5k
        7GJNisvMKrTJ2HoVIMlxpicJAA==
X-Google-Smtp-Source: ABdhPJwXIVQBnt8J0dl8zckmTs7ih1GrbEuw9Es9sUj/rQKH5skI7toJLHs6lqvscoLiNlMFH1loMg==
X-Received: by 2002:aa7:da48:: with SMTP id w8mr36508971eds.81.1615915240402;
        Tue, 16 Mar 2021 10:20:40 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id u1sm10571584edv.90.2021.03.16.10.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 10:20:39 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v9 22/22] arm64: dts: sdm845-db845c: Enable ov8856 sensor and connect to ISP
Date:   Tue, 16 Mar 2021 18:19:31 +0100
Message-Id: <20210316171931.812748-23-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210316171931.812748-1-robert.foss@linaro.org>
References: <20210316171931.812748-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable camss & ov8856 DT nodes.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---


Changes since v5:
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

