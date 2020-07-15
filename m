Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0621F22110A
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 17:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgGOPbe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 11:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgGOPbd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 11:31:33 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97CCEC08C5DB
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2020 08:31:33 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id gc9so3231835pjb.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2020 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:cc:from:message-id;
        bh=hHyDEZPQlCj7ez8zgl+iUOU2RB2eEYLvFrd87IMuq64=;
        b=FUOGjWIq+UH0Dj6G7Jka3jH2vi0nFXHsYfJ5q/c5I8GbuUL9LurO6gwlwuRa+xr0Sb
         SQRUgG0ezG69Fjd5TIkHMtxk0RUhRp6NhlPV0rppoYOiBY94G08ZjWCUanin33jSfvep
         Wy6Fyv1PfVb3IUJmBl0+MNhzgl7gvfK2BVgr9kcC+kRCfikdYovv3W2x1qP4+6lUa6zm
         yUtxaDez4Qmib67LjGIuSVmgVotG+ibnrHPTeiAIviCTehOc4iYNdWBILBXJnVv/C3Gu
         hmhyoVJ0NUNLLUJSfFwyi785c00rCYA0aAa1FvPQl7r408SLVvk1z8bgoMFcBoMFXBXU
         n8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:user-agent:in-reply-to:references
         :mime-version:content-transfer-encoding:subject:to:cc:from
         :message-id;
        bh=hHyDEZPQlCj7ez8zgl+iUOU2RB2eEYLvFrd87IMuq64=;
        b=dbnquOZuCt8phwTpYdeGJJhdZgLXm5Sbga9BzWz9dxrbZqqS/awMXUPEKUi+zMr+0c
         h8FYik0zsDy9gCX8N910iW3mOlIMaD0bZPMT9URk/PR+Ao08LzkHzYmZgIY+p/OrcSWG
         Xnj7LBFmgtwJzlEM3sQkMFLAfXSeey6ZwlcW/CedLl8zOipviKtcQ3XRNHhcnRPLfzm2
         tVsptvvsPkbX5xrgtdpwDBpzbPIf8ExFsON0wb0UiCClUXVP6ris29sZxjMCdMQKGam4
         2XvslxXOriwb+0gQfy4TmJ764jsuD+SI1EgslaIFjVrJRnbjldF4uPUZzOn4DLjnNvQh
         sLMw==
X-Gm-Message-State: AOAM532q3hpSJyx0msDIBzXZmj5vmuu/mmRmIrGpzKyCSg4ZIjRoVkzz
        uu14bPaLasbrZ5K+/bJgrq12
X-Google-Smtp-Source: ABdhPJzip+5iJSceNcg2pkLh+MNocaL8b2GFKczVRGn+4ev8O22viDzJr9m3e5nGW8nd6r9B0My4sw==
X-Received: by 2002:a17:90b:4d10:: with SMTP id mw16mr163423pjb.143.1594827092724;
        Wed, 15 Jul 2020 08:31:32 -0700 (PDT)
Received: from ?IPv6:2409:4072:6d16:31bf:7111:6428:1bdc:7edc? ([2409:4072:6d16:31bf:7111:6428:1bdc:7edc])
        by smtp.gmail.com with ESMTPSA id n62sm2683570pjb.28.2020.07.15.08.31.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jul 2020 08:31:32 -0700 (PDT)
Date:   Wed, 15 Jul 2020 21:01:23 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <20200715140951.90753-3-jacopo+renesas@jmondi.org>
References: <20200715140951.90753-1-jacopo+renesas@jmondi.org> <20200715140951.90753-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/8] dt-bindings: media: ov5645: Convert to json-schema
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org
CC:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org,
        Todor Tomov <todor.too@gmail.com>
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <60FF8603-ACA1-4CAF-B43B-04E974A8E4C4@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,=20

On 15 July 2020 7:39:45 PM IST, Jacopo Mondi <jacopo+renesas@jmondi=2Eorg>=
 wrote:
>Convert the ov5645 bindings document to json-schema and update
>the MAINTAINERS file accordingly, as the entry was not documented=2E
>
>Add myself as maintainer for odd fixes only, as I don't have the
>sensor to test with=2E
>
>Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi=2Eorg>
>---
>
>Hello Todor, Manivannan
>   I've added in this patch an entry for ov5645 in the MAINTAINERS
>file, and I've added myself as maintainers for Odd Fixes only=2E
>
>As you seem to be the author and committers of this bindings
>respectively,
>would you be interested in maintaining this driver ?

I've worked on this driver in the past=2E So yeah, feel free to add myself=
 and since Todor has authored the driver, it makes sense to add him too=2E=
=20

Thanks,=20
Mani

>
>---
> =2E=2E=2E/devicetree/bindings/media/i2c/ov5645=2Etxt  |  54 --------
> =2E=2E=2E/devicetree/bindings/media/i2c/ov5645=2Eyaml | 123 ++++++++++++=
++++++
> MAINTAINERS                                   |   8 ++
> 3 files changed, 131 insertions(+), 54 deletions(-)
>delete mode 100644
>Documentation/devicetree/bindings/media/i2c/ov5645=2Etxt
>create mode 100644
>Documentation/devicetree/bindings/media/i2c/ov5645=2Eyaml
>
>diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645=2Etxt
>b/Documentation/devicetree/bindings/media/i2c/ov5645=2Etxt
>deleted file mode 100644
>index 72ad992f77be=2E=2E000000000000
>--- a/Documentation/devicetree/bindings/media/i2c/ov5645=2Etxt
>+++ /dev/null
>@@ -1,54 +0,0 @@
>-* Omnivision 1/4-Inch 5Mp CMOS Digital Image Sensor
>-
>-The Omnivision OV5645 is a 1/4-Inch CMOS active pixel digital image
>sensor with
>-an active array size of 2592H x 1944V=2E It is programmable through a
>serial I2C
>-interface=2E
>-
>-Required Properties:
>-- compatible: Value should be "ovti,ov5645"=2E
>-- clocks: Reference to the xclk clock=2E
>-- clock-names: Should be "xclk"=2E
>-- clock-frequency: Frequency of the xclk clock=2E
>-- enable-gpios: Chip enable GPIO=2E Polarity is GPIO_ACTIVE_HIGH=2E This
>corresponds
>-  to the hardware pin PWDNB which is physically active low=2E
>-- reset-gpios: Chip reset GPIO=2E Polarity is GPIO_ACTIVE_LOW=2E This
>corresponds to
>-  the hardware pin RESETB=2E
>-- vdddo-supply: Chip digital IO regulator=2E
>-- vdda-supply: Chip analog regulator=2E
>-- vddd-supply: Chip digital core regulator=2E
>-
>-The device node must contain one 'port' child node for its digital
>output
>-video port, in accordance with the video interface bindings defined in
>-Documentation/devicetree/bindings/media/video-interfaces=2Etxt=2E
>-
>-Example:
>-
>-	&i2c1 {
>-		=2E=2E=2E
>-
>-		ov5645: ov5645@3c {
>-			compatible =3D "ovti,ov5645";
>-			reg =3D <0x3c>;
>-
>-			enable-gpios =3D <&gpio1 6 GPIO_ACTIVE_HIGH>;
>-			reset-gpios =3D <&gpio5 20 GPIO_ACTIVE_LOW>;
>-			pinctrl-names =3D "default";
>-			pinctrl-0 =3D <&camera_rear_default>;
>-
>-			clocks =3D <&clks 200>;
>-			clock-names =3D "xclk";
>-			clock-frequency =3D <24000000>;
>-
>-			vdddo-supply =3D <&camera_dovdd_1v8>;
>-			vdda-supply =3D <&camera_avdd_2v8>;
>-			vddd-supply =3D <&camera_dvdd_1v2>;
>-
>-			port {
>-				ov5645_ep: endpoint {
>-					clock-lanes =3D <1>;
>-					data-lanes =3D <0 2>;
>-					remote-endpoint =3D <&csi0_ep>;
>-				};
>-			};
>-		};
>-	};
>diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645=2Eyaml
>b/Documentation/devicetree/bindings/media/i2c/ov5645=2Eyaml
>new file mode 100644
>index 000000000000=2E=2Eff52d0fffb74
>--- /dev/null
>+++ b/Documentation/devicetree/bindings/media/i2c/ov5645=2Eyaml
>@@ -0,0 +1,123 @@
>+# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>+%YAML 1=2E2
>+---
>+$id: http://devicetree=2Eorg/schemas/media/i2c/ov5645=2Eyaml#
>+$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
>+
>+title: Omnivision OV5645 1/4 Inch 5Mp CMOS Digital Image Sensor
>+
>+maintainers:
>+  - Jacopo Mondi <jacopo@jmondi=2Eorg>
>+
>+description: -|
>+  The Omnivision OV5645 is a 1/4-Inch CMOS active pixel digital image
>sensor
>+  with an active array size of 2592H x 1944V=2E It is programmable
>through a
>+  serial I2C interface=2E
>+
>+properties:
>+  compatible:
>+    const: ovti,ov5645
>+
>+  reg:
>+    description: I2C device address
>+    maxItems: 1
>+
>+  clocks:
>+    description: Reference to the xclk clock=2E
>+    maxItems: 1
>+
>+  clock-names:
>+    description: Should be "xclk"=2E
>+    maxItems: 1
>+
>+  clock-frequency:
>+    description: Frequency of the xclk clock=2E
>+
>+  enable-gpios:
>+    description: |
>+      Chip enable GPIO=2E Polarity is GPIO_ACTIVE_HIGH=2E This correspon=
ds
>+      to the hardware pin PWDNB which is physically active low=2E
>+    maxItems: 1
>+
>+  reset-gpios:
>+    description: |
>+      Chip reset GPIO=2E Polarity is GPIO_ACTIVE_LOW=2E This corresponds
>to
>+      the hardware pin RESETB=2E
>+    maxItems: 1
>+
>+  vdddo-supply:
>+    description: Chip digital IO regulator=2E
>+    maxItems: 1
>+
>+  vdda-supply:
>+    description: Chip analog regulator=2E
>+    maxItems: 1
>+
>+  vddd-supply:
>+    description: Chip digital core regulator=2E
>+    maxItems: 1
>+
>+  port:
>+    type: object
>+    description: |
>+      The device node must contain one 'port' child node for its
>digital output
>+      video port, in accordance with the video interface bindings
>defined in
>+      Documentation/devicetree/bindings/media/video-interfaces=2Etxt=2E
>+
>+    properties:
>+      endpoint:
>+        type: object
>+        properties:
>+          remote-endpoint:
>+            description: A phandle to the bus receiver's endpoint
>node=2E
>+
>+        required:
>+          - remote-endpoint
>+
>+    additionalProperties: false
>+
>+required:
>+  - compatible
>+  - reg
>+  - clocks
>+  - clock-names
>+  - clock-frequency
>+  - vdddo-supply
>+  - vdda-supply
>+  - vddd-supply
>+  - port
>+
>+examples:
>+  - |
>+    #include <dt-bindings/gpio/gpio=2Eh>
>+
>+    i2c0 {
>+        #address-cells =3D <1>;
>+        #size-cells =3D <0>;
>+
>+        camera@3c {
>+            compatible =3D "ovti,ov5645";
>+            reg =3D <0x3c>;
>+
>+            enable-gpios =3D <&gpio1 6 GPIO_ACTIVE_HIGH>;
>+            reset-gpios =3D <&gpio5 20 GPIO_ACTIVE_LOW>;
>+
>+            clocks =3D <&clks 200>;
>+            clock-names =3D "xclk";
>+            clock-frequency =3D <24000000>;
>+
>+            vdddo-supply =3D <&camera_dovdd_1v8>;
>+            vdda-supply =3D <&camera_avdd_2v8>;
>+            vddd-supply =3D <&camera_dvdd_1v2>;
>+
>+            port {
>+                ov5645_ep: endpoint {
>+                    clock-lanes =3D <1>;
>+                    data-lanes =3D <0 2>;
>+                    remote-endpoint =3D <&csi0_ep>;
>+                };
>+            };
>+        };
>+    };
>+
>+=2E=2E=2E
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 0160d7567ed3=2E=2Ebf8902ebbe30 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -12607,6 +12607,14 @@ T:	git git://linuxtv=2Eorg/media_tree=2Egit
> F:	drivers/media/i2c/ov5640=2Ec
> F:	Documentation/devicetree/bindings/media/i2c/ov5640=2Eyaml
>
>+OMNIVISION OV5645 SENSOR DRIVER
>+M:	Jacopo Mondi <jacopo@jmondi=2Eorg>
>+L:	linux-media@vger=2Ekernel=2Eorg
>+S:	Odd Fixes
>+T:	git git://linuxtv=2Eorg/media_tree=2Egit
>+F:	drivers/media/i2c/ov5645=2Ec
>+F:	Documentation/devicetree/bindings/media/i2c/ov5645=2Eyaml
>+
> OMNIVISION OV5647 SENSOR DRIVER
> M:	Jacopo Mondi <jacopo@jmondi=2Eorg>
> M:	Dave Stevenson <dave=2Estevenson@raspberrypi=2Ecom>
>--
>2=2E27=2E0

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
