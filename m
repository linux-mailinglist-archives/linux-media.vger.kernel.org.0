Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD50ED3820
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 05:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfJKD4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 23:56:33 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43714 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbfJKD4d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 23:56:33 -0400
Received: by mail-pl1-f194.google.com with SMTP id f21so3811282plj.10
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2019 20:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1cUKYd2JGuOPb29vx0RY5RciC85cA8yW6+caoygW+J0=;
        b=aWuycG4LboxAq7KuhuLikokhD/yMdUvlgY6lN1NrGhIhuXttaZ/skjSMPHQ6DMHOcW
         f45MuDy63ux0Y0y0K4otxgKbPAS/acxq25kJzWDxNcEjUeQnqYUiKmGpXgUPhZqU46fd
         PI4rDcnM7AcOK2EOEuw82O2dmWvBIxDlPHu8l+Z2P3kKXmOo+KkIBhvWcs7lAwdRu73E
         nYR0AkaduIwE2d7Zg8X2Fy5SjQ4Yx4jTucCui11XylJseHg0lp6BN0ugdXalySWH6nij
         EFDcrwkc0AaatAdq6vXIgzxHYoYy325iFvP8nAG30i9R1pfJkdARxa76Nd/l1WZ5g0AJ
         oJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1cUKYd2JGuOPb29vx0RY5RciC85cA8yW6+caoygW+J0=;
        b=H3lmmiImnbxG23ftkEMYRWHSK6sKUlOsW3RgPybQI/M170fGd7bh2bLqc52U3aUmvL
         aja83uJzG06DgQRacqcbLZkAvBUkfUXn1GjNvLfv608NyYSim2k4js+mx2hGDSxbBLle
         k5T59nkme/0QiwkR3YUaJlDmn4Aq0tCE6rc/NO6nr4toVIrWAcvLbdafFJPPjWuel7x8
         Xc2NL2du8ALRpi92V3UsIoYjsNPu60erT0rChazvXXLNC09hhBn0YKGrYJaZJ7WrcCr2
         m5N5mf6lqNPnyjbERO29YQmLTzIzuvYlUcgxQ5jQRXD1OnRNPyQxcmEFXX7BqJfaDwFC
         Ndhg==
X-Gm-Message-State: APjAAAX47WqmKmDtBczeZoscGv0N5rwgsyqXu+5W1+2HUmi0Z04UeUO3
        Fo7cECYPqb6/umm5geEzNBwT
X-Google-Smtp-Source: APXvYqybv4dUMKgehLfH8auvSwt7/o2lRH+/cZX47WXX599yek7j6tmTPlwDYhmglObLBsJJ9dUh5g==
X-Received: by 2002:a17:902:904b:: with SMTP id w11mr11183843plz.182.1570766192428;
        Thu, 10 Oct 2019 20:56:32 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:638c:660b:18a3:ff6e:e66c:65b0])
        by smtp.gmail.com with ESMTPSA id b185sm9534210pfg.14.2019.10.10.20.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 20:56:31 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor binding
Date:   Fri, 11 Oct 2019 09:26:12 +0530
Message-Id: <20191011035613.13598-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011035613.13598-1-manivannan.sadhasivam@linaro.org>
References: <20191011035613.13598-1-manivannan.sadhasivam@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add devicetree binding for IMX296 CMOS image sensor.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/media/i2c/imx296.txt  | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/imx296.txt b/Documentation/devicetree/bindings/media/i2c/imx296.txt
new file mode 100644
index 000000000000..25d3b15162c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imx296.txt
@@ -0,0 +1,55 @@
+* Sony IMX296 1/2.8-Inch CMOS Image Sensor
+
+The Sony IMX296 is a 1/2.9-Inch active pixel type CMOS Solid-state image
+sensor with square pixel array and 1.58 M effective pixels. This chip features
+a global shutter with variable charge-integration time. It is programmable
+through I2C and 4-wire interfaces. The sensor output is available via CSI-2
+serial data output (1 Lane).
+
+Required Properties:
+- compatible: Should be "sony,imx296"
+- reg: I2C bus address of the device
+- clocks: Reference to the mclk clock.
+- clock-names: Should be "mclk".
+- clock-frequency: Frequency of the mclk clock in Hz.
+- vddo-supply: Interface power supply.
+- vdda-supply: Analog power supply.
+- vddd-supply: Digital power supply.
+
+Optional Properties:
+- reset-gpios: Sensor reset GPIO
+
+The imx296 device node should contain one 'port' child node with
+an 'endpoint' subnode. For further reading on port node refer to
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Required Properties on endpoint:
+- data-lanes: check ../video-interfaces.txt
+- remote-endpoint: check ../video-interfaces.txt
+
+Example:
+	&i2c1 {
+		...
+		imx296: camera-sensor@1a {
+			compatible = "sony,imx296";
+			reg = <0x1a>;
+
+			reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&camera_rear_default>;
+
+			clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+			clock-names = "mclk";
+			clock-frequency = <37125000>;
+
+			vddo-supply = <&camera_vddo_1v8>;
+			vdda-supply = <&camera_vdda_3v3>;
+			vddd-supply = <&camera_vddd_1v2>;
+
+			port {
+				imx296_ep: endpoint {
+					data-lanes = <1>;
+					remote-endpoint = <&csiphy0_ep>;
+				};
+			};
+		};
-- 
2.17.1

