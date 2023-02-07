Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD9968E135
	for <lists+linux-media@lfdr.de>; Tue,  7 Feb 2023 20:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbjBGTaA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Feb 2023 14:30:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbjBGT3q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Feb 2023 14:29:46 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9CE3CE3A
        for <linux-media@vger.kernel.org>; Tue,  7 Feb 2023 11:29:21 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d14so14623936wrr.9
        for <linux-media@vger.kernel.org>; Tue, 07 Feb 2023 11:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8w0MpZ2V4rLYFppvKGuA9m6PNERjPDODLlDLq+kfjPs=;
        b=woz3ID5u3YeS4AXaGqdutfXO9eSzuXNOLyF41ssaOAEufE0kNsS7bUpAFGyGgpjxLe
         WZDFzfdrIX7h1KW9flxdSs4Br6vTZXw5mzKNcP2mhKfiOd0MqN3f/mTB3bkjcv5WH+6I
         UCLx77fWQkMqeXO0Mh6o37OsY7D9/M7trF9GFJ/HsylJ3PFJNGep88m4kQExYGnLTEoU
         nuDL779dgdLlpnLHsKz5Uk+yBrOLzZYLDdu4KT6OGflkYGuVISrSl4VaT7kZTZb+NZO0
         MNHH6z25P9Zx4RAeLrqy9JleX+epp6urvAtQfTe4pTlESBDld2Ptql1h3BGU4flOKYgh
         Rcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8w0MpZ2V4rLYFppvKGuA9m6PNERjPDODLlDLq+kfjPs=;
        b=1/edfpKWXeA3rR4tAlsBj15cvQag2PaFJE93pgGKaaUVWqLHwb/8YWtzS6RBYssEom
         SFUFdEwhK4Hv6OqGs0ATl7CKdeTO/ITlxS3hn4jgToMUIISz/OAW4ZiWTMVCiEH59GXF
         AeiApFZHFUZCUsJwHwJwYkKQoGWZwrDPDwiDgfQIdYxpgF2f8CNDEKBmDYYkYYUnP565
         gxVCY6/VPKuCdl2EOCCO+5vbAKOxAOp0iI1+IM2fKaocCc0U9CeeSMWm/qKfTptadMKP
         uyMyq3KYD+Kk1T7tO6LYvS2ZwNVDzIBB8EPtkqhQAQnU7DPG+GVe14SWI2J6G5yzrTVY
         NCUg==
X-Gm-Message-State: AO0yUKV0bXc9svyWGN/ELiHbceP+t2nqmbIQSA2JCKJWX4l7NgPJCihw
        MnEATuA1RQAhoYE/aBHjkwCJkA==
X-Google-Smtp-Source: AK7set+fKDoZgdl0m3cHJ1U/S0ylQq/28w1ACr5wlTWMsE+Xd2BplfMkuCaDRrTX7zGGg4M/ccU6pQ==
X-Received: by 2002:a5d:4cc6:0:b0:242:800:9a7f with SMTP id c6-20020a5d4cc6000000b0024208009a7fmr3911742wrt.65.1675798159433;
        Tue, 07 Feb 2023 11:29:19 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bd16-20020a05600c1f1000b003db0ee277b2sm19858623wmb.5.2023.02.07.11.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 11:29:19 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] media: dt-bindings: samsung-fimc: drop simple-bus
Date:   Tue,  7 Feb 2023 20:29:14 +0100
Message-Id: <20230207192914.549309-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207192914.549309-1-krzysztof.kozlowski@linaro.org>
References: <20230207192914.549309-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The FIMC camera node wrapper is not a bus, so using simple-bus fallback
compatible just to instantiate its children nodes was never correct.
Drop the simple-bus compatible and expect driver to explicitly populate
children devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/media/samsung-fimc.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/samsung-fimc.txt b/Documentation/devicetree/bindings/media/samsung-fimc.txt
index 20447529c985..f90267f1180e 100644
--- a/Documentation/devicetree/bindings/media/samsung-fimc.txt
+++ b/Documentation/devicetree/bindings/media/samsung-fimc.txt
@@ -15,7 +15,7 @@ Common 'camera' node
 
 Required properties:
 
-- compatible: must be "samsung,fimc", "simple-bus"
+- compatible: must be "samsung,fimc"
 - clocks: list of clock specifiers, corresponding to entries in
   the clock-names property;
 - clock-names : must contain "sclk_cam0", "sclk_cam1", "pxl_async0",
@@ -156,8 +156,8 @@ Example:
 		};
 	};
 
-	camera {
-		compatible = "samsung,fimc", "simple-bus";
+	camera@11800000 {
+		compatible = "samsung,fimc";
 		clocks = <&clock 132>, <&clock 133>, <&clock 351>,
 			 <&clock 352>;
 		clock-names = "sclk_cam0", "sclk_cam1", "pxl_async0",
@@ -166,6 +166,7 @@ Example:
 		clock-output-names = "cam_a_clkout", "cam_b_clkout";
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam_port_a_clk_active>;
+		ranges;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-- 
2.34.1

