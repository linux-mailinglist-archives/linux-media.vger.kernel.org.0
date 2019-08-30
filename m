Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1C2A339F
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 11:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbfH3JUD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 05:20:03 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46095 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbfH3JUC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 05:20:02 -0400
Received: by mail-pl1-f194.google.com with SMTP id o3so3074227plb.13
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2019 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mF/OnrJ00SbahU15HvzXY+I7DAqSAdHto9JRdxhPxic=;
        b=Ux+jFtwdTk9Ronis0odb2Ycgp0S8vbePlVivVxngSn0nWhes+7VjYfxqI7v38XNJAq
         z+L5xNuAA2giKtmAcBW78A7RMcdyvoy57MuKHKukH36N/z4WPVhWysQdDAkW9LuCdz2T
         XUxGYTUK0VAhAHj20aNla4/UKJDnBUqLk0xWFFI5oSDzx48wqtTtk0xJtMvqvpkgurNM
         eHqQVSWE9gqvLdAJh4mZvqpqiEoYLVJGLLtBLQKuwy0g0U9crR/G+hqVjqQNXO9K+0Wh
         uWonQsDM7nfyk96SON7K1ri2/YJhyEOSS5yQNm2NVphighYDB8AvbP6A2BJdlAaKfjtY
         XIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mF/OnrJ00SbahU15HvzXY+I7DAqSAdHto9JRdxhPxic=;
        b=Ip/ICEi/MQ/oLZUxGyffKavJR7lEQfLk1vP2TxAq7FQdFX0RvBi7s6IAud3lirmclT
         rsRKS07rPWJ5PE5RmF/zuoD/6kowwFRS+WO9oYb8sHLoUcVSLbloY13fkmUif/xRDndr
         Yc1rbGrGLHlERXvjyLs4PzQJHAiNugRagEG3ALg2HddKN3WMUpqZM4XJ+K061oWpy+hw
         m47MVqhRIk+BoN6JDYWl/nPJ1ME7Y5C5/Jr8QMY+lBwaYOMK9VEeeLEAn8QMql6VpRKz
         rcVJahlH4QM+HyzaH/rFhMQW43FDVz/kK/OMU6jYHEddWp7bOPsat6HtBWk8cIZ2Spv7
         xX1g==
X-Gm-Message-State: APjAAAW46WtIoPDMLe53LLpTiMcJ5oe5AVY5DlgbldHebJaO2LlS3vAz
        pypteyqoOlXPloVnW4aAruQy
X-Google-Smtp-Source: APXvYqz5A+CcX7gq9fWKGI9UWFItRu3q1idaB7iqtUj4bbysDpItsyNSNqG0GqxsFoPU+L2K5PUflw==
X-Received: by 2002:a17:902:e506:: with SMTP id ck6mr14969628plb.132.1567156801843;
        Fri, 30 Aug 2019 02:20:01 -0700 (PDT)
Received: from localhost.localdomain ([103.59.132.163])
        by smtp.googlemail.com with ESMTPSA id g202sm3142676pfb.155.2019.08.30.02.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 02:20:01 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: media: i2c: Add IMX290 CMOS sensor binding
Date:   Fri, 30 Aug 2019 14:49:41 +0530
Message-Id: <20190830091943.22646-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190830091943.22646-1-manivannan.sadhasivam@linaro.org>
References: <20190830091943.22646-1-manivannan.sadhasivam@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add devicetree binding for IMX290 CMOS image sensor.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/imx290.txt  | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/imx290.txt b/Documentation/devicetree/bindings/media/i2c/imx290.txt
new file mode 100644
index 000000000000..a3cc21410f7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imx290.txt
@@ -0,0 +1,57 @@
+* Sony IMX290 1/2.8-Inch CMOS Image Sensor
+
+The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with
+Square Pixel for Color Cameras. It is programmable through I2C and 4-wire
+interfaces. The sensor output is available via CMOS logic parallel SDR output,
+Low voltage LVDS DDR output and CSI-2 serial data output. The CSI-2 bus is the
+default. No bindings have been defined for the other busses.
+
+Required Properties:
+- compatible: Should be "sony,imx290"
+- reg: I2C bus address of the device
+- clocks: Reference to the xclk clock.
+- clock-names: Should be "xclk".
+- clock-frequency: Frequency of the xclk clock in Hz.
+- vdddo-supply: Sensor digital IO regulator.
+- vdda-supply: Sensor analog regulator.
+- vddd-supply: Sensor digital core regulator.
+
+Optional Properties:
+- reset-gpios: Sensor reset GPIO
+
+The imx290 device node should contain one 'port' child node with
+an 'endpoint' subnode. For further reading on port node refer to
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Required Properties on endpoint:
+- data-lanes: check ../video-interfaces.txt
+- link-frequencies: check ../video-interfaces.txt
+- remote-endpoint: check ../video-interfaces.txt
+
+Example:
+	&i2c1 {
+		...
+		imx290: camera-sensor@1a {
+			compatible = "sony,imx290";
+			reg = <0x1a>;
+
+			reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&camera_rear_default>;
+
+			clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+			clock-names = "xclk";
+			clock-frequency = <37125000>;
+
+			vdddo-supply = <&camera_vdddo_1v8>;
+			vdda-supply = <&camera_vdda_2v8>;
+			vddd-supply = <&camera_vddd_1v5>;
+
+			port {
+				imx290_ep: endpoint {
+					data-lanes = <1 2 3 4>;
+					link-frequencies = /bits/ 64 <445500000>;
+					remote-endpoint = <&csiphy0_ep>;
+				};
+			};
+		};
-- 
2.17.1

