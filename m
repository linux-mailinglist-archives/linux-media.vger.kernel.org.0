Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3649C33C113
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 17:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbhCOQDV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 12:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233799AbhCOQDC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 12:03:02 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B29CC061762
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:03:02 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id mm21so67072324ejb.12
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VIkFmC8zL3nBFAyP2xM+evUK65sXcVPt8xmmOI32A/E=;
        b=AUMYjxKb0SzBdeREj1ZPjSdamj1+cF1YoKeL/JnJiNqzy63W2BCcGxv3MEUqD1n2tl
         9pHigDfdQkZcU8Ic+zdjb/KejrNKp2RcFAT8XL4KtEbxtLxicYgadZXUYWyex7rXreMn
         XactuxnB5YfbDi2AvrR/qlcs42K09X3SV9jg3STuoFrQFSbPG+lgvhVAAiLHAkLp3oRb
         M6aH/zFaoHmiJ//4MNWajFa1FJrKcH6y2z3hBfxxqSvHliRVLUfPQtFtkdEKGJbG5qDO
         IaZqMdfVfiGFG98Q1MSJkxu67ioIrwmL1MjyIeBAV1mnL0JFEETQmnYu3HtKaT1MQvJY
         qIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VIkFmC8zL3nBFAyP2xM+evUK65sXcVPt8xmmOI32A/E=;
        b=rG39l0pH110UEmVp3dS+MvCUMx8gHELJywEzGqm0EoiD4SiDqAuCjdaEJ9fGhu2i04
         k2Z+yltqSgS4mGBPOf3X5dXQSymyAqhOghGaLGIpIPTegh2XTkU3dppZcQPI84K2muip
         3Pv/cMJrLHroKCr7iEnFcSih5vVm5NSjfmFSZxlm2SXjbUs0tsoq21lf4Zu4dU6sGbUu
         8yLWr2Kx4UkABbjbEGvoGO/l6UQCblnDfkdefV5CJ2VOKApFLpxMg3cwYqVUvwCVq7Ff
         UJrlRnkPno11r4q8Zs+5jEnaMw+vmYAN2rziwyS/FGxKap2TjaLm5Pns6VnfSuZrEqJ7
         HZmg==
X-Gm-Message-State: AOAM532F4ZNGkqWlrvzwuJgSu0gyvIP6S2ZKXNNbDMqa6ncKvAtXu9xF
        Q1eFc97BTyZ/1TF9luWlXDK2Pg==
X-Google-Smtp-Source: ABdhPJzgNihT4ZiFny0+P+smID+6wHIUjE9sfKPOlsipibpUYZ/CFdYWfYB5NEqDQ5Ykl3hx79kXGg==
X-Received: by 2002:a17:906:3f88:: with SMTP id b8mr14023861ejj.36.1615824180880;
        Mon, 15 Mar 2021 09:03:00 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id r5sm8456445eds.49.2021.03.15.09.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:03:00 -0700 (PDT)
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
Subject: [PATCH v8 22/22] arm64: dts: sdm845-db845c: Enable ov8856 sensor and connect to ISP
Date:   Mon, 15 Mar 2021 16:59:49 +0100
Message-Id: <20210315155942.640889-23-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315155942.640889-1-robert.foss@linaro.org>
References: <20210315155942.640889-1-robert.foss@linaro.org>
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

