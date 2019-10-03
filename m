Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 375E1C9B4D
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 11:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729337AbfJCJzf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 05:55:35 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33469 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728894AbfJCJzf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 05:55:35 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so1439557pfl.0
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2019 02:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mF/OnrJ00SbahU15HvzXY+I7DAqSAdHto9JRdxhPxic=;
        b=LfdYYcFIQHIwaf5sUf2pjOpgY07IahMZdLDiRgn3d4b3XE8x3Hw3FollPplUWtmtx1
         jIrH3KxhGy7fnRVwJSDNTV1lJ6isrfOzQvmWEPHVUElCUYDsqVbaYPQZzVmIBL3XOpXF
         j/kimQ8aSE9ipOJ9dgqOCMmCkPKf9/Ai4i5YlIP2FSBABhmB3g4Ql76gyVhZ1APWiwG4
         nsRVTqIHbQgHDRuyYTTXt1Oi6NawFyeDtWNaNnVLWeddb6ZopOwAxeU2/Llh4JbtZfw0
         TkuoBx8hIl7R8rexQ7YAJiY4G3bSymX6NXtq8J+A0/z4/161bK4bRfu1XmjOkluxV7jf
         2Kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mF/OnrJ00SbahU15HvzXY+I7DAqSAdHto9JRdxhPxic=;
        b=NBXpASHdvFfD0ALLwxevLGHhUKl95W0bmplAAy+5LoUmMI3NG474zlaPNhIWP/EyM1
         v4gSJ2bF6aKotqiEQQ4s8Zje3QopWXu8VtfPx5bF7kGwp5N+x8mNwGvD9SsaT7csg/3S
         iDoum0ieaL6qblmum0tZu8777xZIdlW9cSvfWKGhvzDshIipFirc6gSMBQMI5bX3gPhu
         10WJjuPANGO2N/uiUj/ugZWOi9vN63+tLzBwR7jVD8W5mFrjYd4St7CcOEnOM2Cu5v2v
         Hu4L8E/YG2uvN7oVkkFP8eTTfZURKaEeME2YTQIxRCY6GrTG4aSwjg1p0w2+jZNFi+xV
         kV4A==
X-Gm-Message-State: APjAAAU2NFqoilS06ROeX+LegkSoDX3curagaPs/guzU/5yGPwO9Cf3V
        cMpscVy+6/BD3+S/zUaRoxmm
X-Google-Smtp-Source: APXvYqwVL6jU1EIuGWRSFQLQqzB7ut3zFEA/Ujk3BGChKGNjrLA59u3xDa6jeqlx0a6IZhKVUV3zKA==
X-Received: by 2002:a62:7a94:: with SMTP id v142mr10259174pfc.121.1570096533516;
        Thu, 03 Oct 2019 02:55:33 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:801:ac5d:fca3:6f38:70fb:67fc])
        by smtp.gmail.com with ESMTPSA id v3sm2346171pfn.18.2019.10.03.02.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 02:55:33 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: Add IMX290 CMOS sensor binding
Date:   Thu,  3 Oct 2019 15:25:02 +0530
Message-Id: <20191003095503.12614-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003095503.12614-1-manivannan.sadhasivam@linaro.org>
References: <20191003095503.12614-1-manivannan.sadhasivam@linaro.org>
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

