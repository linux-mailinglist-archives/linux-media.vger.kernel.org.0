Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85DAE4D2D0D
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 11:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbiCIKXh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 05:23:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbiCIKXd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 05:23:33 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9684AD9A
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 02:22:28 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id qt6so3812177ejb.11
        for <linux-media@vger.kernel.org>; Wed, 09 Mar 2022 02:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=srlbObwmq+JdjeVbdOZ+bM1ch969LAtjZiiX7VIPUAw=;
        b=iR9KukxttGqJbJrh6Gl+jQplJWvym6DzUIUr1ns2ie18/qeO+gBNQ1pOKz6Dnm2SDZ
         rYe6NQQKNonasqg4CpCDytvMsKH0YrQNUC5GKpea8s0qFYqlNHrT0/azenrwlSBY29DP
         uqUtvlwzURmgmXQDPphFOAM/mPQQ8AjBzl9IQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=srlbObwmq+JdjeVbdOZ+bM1ch969LAtjZiiX7VIPUAw=;
        b=09+rV6UfBZPoMsMq6W70FRw/keL8BU7bHuyaBtZtP/dpylR1MviCowqxl/uQMEWunC
         tuOD3UrsRBRpzzYN1Yop4cHJDS8kswBFeG5Y5NzKy8Ghs5fcI6zI6UXgqhnzLzN/Q4p3
         5UD31nE7zvrED6K9cGU+Ost4p9XJyyupnDYAUZuTa+tQIV9GRDvMjUW4nupGGAqVsCDh
         KUHxXyMJLFLx8foG7GuoqJO/i4fNHEV6PSoXFEKn3tNBd/1sUbkfXi4PNicZhB/b1k1d
         ggiQ0qJ6+mQ2bfVE2SherAEXHaAYwW2/rvMqJKrQgXecGiHWFKNWTK+TarNzyeC/DRBy
         EYyA==
X-Gm-Message-State: AOAM531sqcZHAkJIUk5H+jenLJSacasSVnrB2uQJF5xloGbjeFSbkri+
        tHD0zdPOq8sLbK4lck710bEwd7vGRKBTdg==
X-Google-Smtp-Source: ABdhPJzipe3g2eIEfSQNc8ZfiqQR8wpfG8QhkBIwhpaC4ybq2N+r40qOVRCy7bwcoZffW0Wb0zQTJQ==
X-Received: by 2002:a17:906:5597:b0:6ce:f3cc:14e8 with SMTP id y23-20020a170906559700b006cef3cc14e8mr17033143ejp.426.1646821346837;
        Wed, 09 Mar 2022 02:22:26 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ce12-20020a170906b24c00b006da824011eesm547229ejb.166.2022.03.09.02.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 02:22:26 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@iki.fi, devicetree@vger.kernel.org,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v5 2/2] dt-bindings: media: add ovti,ovm6211 bindings
Date:   Wed,  9 Mar 2022 12:22:15 +0200
Message-Id: <20220309102215.891001-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220309102215.891001-1-petko.manolov@konsulko.com>
References: <20220309102215.891001-1-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Omnivision OVM6211 MIPI CSI-2 sensor bindings.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 .../devicetree/bindings/media/i2c/ovm6211.txt | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovm6211.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/ovm6211.txt b/Documentation/devicetree/bindings/media/i2c/ovm6211.txt
new file mode 100644
index 000000000000..6883c34106be
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovm6211.txt
@@ -0,0 +1,49 @@
+* Omnivision OVM6211 MIPI CSI-2 sensor
+
+The OVM6211 has an image array capable of operating at up to 120 frames per
+second in 400x400 resolution. All required image processing functions including
+exposure control are programmable through the SCCB interface.
+
+
+Required Properties:
+- compatible: shall be "ovti,ovm6211"
+- clocks: reference to the xvclk input clock
+- clock-names: shall be "xvclk"
+- avdd-supply: Analog voltage supply, 2.9 volts
+- dovdd-supply: Digital I/O voltage supply, 1.8 volts
+- dvdd-supply: Digital core voltage supply, 1.8 volts
+- reset-gpios: Low active reset gpio
+- enable-gpios: High active chip enable gpio
+
+The device node shall contain one 'port' child node with an
+'endpoint' subnode for its digital output video port,
+in accordance with the video interface bindings defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+The endpoint optional property 'data-lanes' shall be "<1>".
+
+
+Example:
+
+	&i2c1 {
+		...
+        
+		camera@60 {
+			compatible = "ovti,ovm6211";
+			reg = <0x60>;
+			clocks = <&clk_cam>;
+			clock-names = "xvclk";
+			dovdd-supply = <&v1v8>;
+			avdd-supply = <&vdda>;
+			reset-gpios = <&gpiof 14 GPIO_ACTIVE_LOW>;
+			enable-gpios = <&gpiof 15 GPIO_ACTIVE_HIGH>;
+
+			status = "okay";
+
+			port {
+				ovm6211_0: endpoint {
+					data-lanes = <1>;
+					clock-lanes = <0>;
+					pclk-max-frequency = <72000000>;
+			};
+		};
+	};
-- 
2.30.2

