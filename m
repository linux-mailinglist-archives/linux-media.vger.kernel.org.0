Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D65492DD718
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730141AbgLQSIn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:08:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729977AbgLQSIa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:08:30 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C625C0611C5;
        Thu, 17 Dec 2020 10:07:28 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id s26so25132674lfc.8;
        Thu, 17 Dec 2020 10:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kj7GIF+uJIxlrnFvjrN1VqMHS/QleXXRwa7p10T8PcE=;
        b=kP7PHY6U8z1UY31KMv3z/cd4fSHYhATI3ExPOUCA2tZru2WKCyeTd2UP8TlwgAp1M6
         m3gKgbjGMcs+s5oOOkkKRg5uLBYrKlTd+fICyDzeWlVMS8TJLKcBOPihhJWpu+AU9087
         BB/WHFvb13FuPmlwTMx7QgLcXn2/Ad1/eGMuph5p4IXpPVqJSz4M2F28QQ7j5D3NT9Pe
         SKPb+8KyQFL1FQLuLtECc7uWAD8qFTVYL6Rf2IuNbEgYvORPTvGDGfDYaX2QnYwn0Rgx
         FmpTg2+9oH4Y9ij9LQu4ybJ+DxcuDbYI0ihxUQcWcjKPtcTSS6c8GDtx5aNyj2kNgujh
         8knA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kj7GIF+uJIxlrnFvjrN1VqMHS/QleXXRwa7p10T8PcE=;
        b=DS3H+EyW7GR0Xux/52Alt3JjHmfxjSgBo+9yavybjaTCXeVw9cAUIV428yJhMWcGq4
         5mDg10FkiVh+0GLyGQfcH2DQYODlOSLIeSdzdfoBvqUrLeidgqo26XIMaiXjo2hWqwpS
         Pei9cHo0GOkUeaWoqn50HM8CRnyE6cNoMDB7/1Xc2vWunZO6nRg5eBNl0+I2n+LFqbMY
         XUeSqxrjbr+YzeutO61MwUlfaO+yd3o7udUd6B7D5PiBYbq7kSMg/LMx0/VrSPrFbxfC
         6jsAn04G8Rk/ghw26GNgBqThRlfhf2FHm+Z0efU9rJ1+cBELGVdKF+FY15JnMlpdHV4x
         sKvQ==
X-Gm-Message-State: AOAM530zAtEJGPJAZ1dCbGPZviiPse/AdCnLL8AQgapRCRgslN80Z6Rj
        1RiVyeIk5jTn50FqwjHKkDo=
X-Google-Smtp-Source: ABdhPJwIfOmllgVrz8dHRr+2J5z3WatJHYxi2dLPJpEQkNdVwjNkmxMLIP17neNyCZHg4jvjqXoFpw==
X-Received: by 2002:a05:6512:32a2:: with SMTP id q2mr7511267lfe.625.1608228446970;
        Thu, 17 Dec 2020 10:07:26 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:26 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 06/48] dt-bindings: clock: tegra: Document clocks sub-node
Date:   Thu, 17 Dec 2020 21:05:56 +0300
Message-Id: <20201217180638.22748-7-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document "clocks" sub-node which describes Tegra SoC clocks that require
a higher voltage of the core power domain in order to operate properly on
a higher rates.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/clock/nvidia,tegra20-car.txt     | 26 +++++++++++++++++++
 .../bindings/clock/nvidia,tegra30-car.txt     | 26 +++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
index 6c5901b503d0..353354477785 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
@@ -19,6 +19,16 @@ Required properties :
   In clock consumers, this cell represents the bit number in the CAR's
   array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
 
+Optional child sub-node "clocks" should contain nodes matching the clocks
+on the Tegra SoC. Refer to Tegra TRM for mode details on the clock nodes.
+
+Required properties :
+- compatible : Should be "nvidia,tegra20-clock".
+- operating-points-v2: See ../bindings/opp/opp.txt for details.
+- clocks : Should contain clock which corresponds to the node.
+- power-domains: Phandle to a power domain node as described by generic
+                 PM domain bindings.
+
 Example SoC include file:
 
 / {
@@ -27,6 +37,22 @@ Example SoC include file:
 		reg = <0x60006000 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+
+		clocks {
+			hdmi {
+				compatible = "nvidia,tegra20-clock";
+				operating-points-v2 = <&hdmi_opp_table>;
+				clocks = <&tegra_car TEGRA20_CLK_HDMI>;
+				power-domains = <&domain>;
+			};
+
+			pll_m {
+				compatible = "nvidia,tegra20-clock";
+				operating-points-v2 = <&pll_m_opp_table>;
+				clocks = <&tegra_car TEGRA20_CLK_PLL_M>;
+				power-domains = <&domain>;
+			};
+		};
 	};
 
 	usb@c5004000 {
diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
index 63618cde12df..bc7bbdaa9d3f 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
@@ -19,6 +19,16 @@ Required properties :
   In clock consumers, this cell represents the bit number in the CAR's
   array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
 
+Optional child sub-node "clocks" should contain nodes matching the clocks
+on the Tegra SoC. Refer to Tegra TRM for mode details on the clock nodes.
+
+Required properties :
+- compatible : Should be "nvidia,tegra30-clock".
+- operating-points-v2: See ../bindings/opp/opp.txt for details.
+- clocks : Should contain clock which corresponds to the node.
+- power-domains: Phandle to a power domain node as described by generic
+                 PM domain bindings.
+
 Example SoC include file:
 
 / {
@@ -31,6 +41,22 @@ Example SoC include file:
 
 	usb@c5004000 {
 		clocks = <&tegra_car TEGRA30_CLK_USB2>;
+
+		clocks {
+			hdmi {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&hdmi_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_HDMI>;
+				power-domains = <&domain>;
+			};
+
+			pll_m {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&pll_m_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_PLL_M>;
+				power-domains = <&domain>;
+			};
+		};
 	};
 };
 
-- 
2.29.2

