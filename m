Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62FBB8324E
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 15:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731151AbfHFNJ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Aug 2019 09:09:56 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42750 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfHFNJ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Aug 2019 09:09:56 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so41477128pff.9
        for <linux-media@vger.kernel.org>; Tue, 06 Aug 2019 06:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=C4Azk3N1QldkmkijyZBaYZs0K+xeT/HqprwCHyNXS4g=;
        b=esx00ei9uxuWTFn3HN0Cfx7KK7QzWhNoYu3IVDf3Cd9cBS9onLD3xbhIAB5h+eoEXl
         KFHq1lVRB+oS5BGkF2ucwnScf1XKmbtFXJGZ8uYYYBS+pjAt9Iv8l9jyQDG1gXABXmM1
         HwAOhfVUBDGx2A7qQlOG0oigCdSnWsUxtmIn9WhUXke71aBLvQuJmAg9qplwpK+LWq27
         GfXmH1+AjWKH3tBU1XH22jOoJvCeJL/iibHxtdD+FlEx2qyfacdxDBlTtlFIFMhhirnZ
         NtxwY3O5HodQ6SKXPIhCX9z9j0/mVZdIVGo++hn9oFwBfclZqguc99dTOM+boDACcR1f
         xNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=C4Azk3N1QldkmkijyZBaYZs0K+xeT/HqprwCHyNXS4g=;
        b=ZueZUXshRvO5eB03xRJWXIaqQd2mtiZONGzGkA+FTwjSTA/QaVdcsMQVOUurXNElvH
         k2a66cQ7wv+sq2Ctoc22m7sjcxGkIgt2jAYFRrSPGTtRM88KdOD0dUli9MWpdJi5X1FX
         a8xWUSnTYpo6XkPxswn9wnjv22T13ondrrs5Nyv6VoHN+lkTJVZFYjblJgr6BKe7/vJF
         oUu0ezbKkUVOvP2RxjtJKVjmDckDM6tKuRYFL/o4S9Cv95xRzX7N8ITPunQ0wWzIsSKN
         yKqH7/80KAYrWO67X/iH8QMXmfgPXIpXusicVVMhy0sYJyJu5fcGRuRwVutjI55wYSZ5
         c+Jg==
X-Gm-Message-State: APjAAAU5XS9WQudbRLzh70BrEI8jtKbFZ9h5vyUz61bM8V03swb3n92N
        jIwAyPZlhkk3uQWLg3f5M2Hi
X-Google-Smtp-Source: APXvYqyVw0eUyqoyVUidAiq1F670HWkNCzwAqJlQ+kXljU8Bn7Utb4NHlePOEGT0+QHolZwwFdAdGA==
X-Received: by 2002:aa7:9819:: with SMTP id e25mr3490211pfl.47.1565096995489;
        Tue, 06 Aug 2019 06:09:55 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7180:928a:153d:caa0:477e:f9fd])
        by smtp.gmail.com with ESMTPSA id v8sm73715371pgs.82.2019.08.06.06.09.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 06 Aug 2019 06:09:54 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: media: i2c: Add IMX290 CMOS sensor binding
Date:   Tue,  6 Aug 2019 18:39:36 +0530
Message-Id: <20190806130938.19916-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
References: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add devicetree binding for IMX290 CMOS image sensor.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/imx290.txt  | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/imx290.txt b/Documentation/devicetree/bindings/media/i2c/imx290.txt
new file mode 100644
index 000000000000..7535b5b5b24b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imx290.txt
@@ -0,0 +1,51 @@
+* Sony IMX290 1/2.8-Inch CMOS Image Sensor
+
+The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with
+Square Pixel for Color Cameras. It is programmable through I2C and 4-wire
+interfaces. The sensor output is available via CMOS logic parallel SDR output,
+Low voltage LVDS DDR output and CSI-2 serial data output.
+
+Required Properties:
+- compatible: Should be "sony,imx290"
+- reg: I2C bus address of the device
+- clocks: Reference to the xclk clock.
+- clock-names: Should be "xclk".
+- clock-frequency: Frequency of the xclk clock.
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
+Example:
+	&i2c1 {
+		...
+		imx290: imx290@1a {
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
+					clock-lanes = <1>;
+					data-lanes = <0 2 3 4>;
+					remote-endpoint = <&csiphy0_ep>;
+				};
+			};
+		};
-- 
2.17.1

