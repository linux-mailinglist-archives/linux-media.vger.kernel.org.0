Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D484F3482D4
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 21:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238104AbhCXUXR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 16:23:17 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:41719 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238058AbhCXUW4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 16:22:56 -0400
Received: by mail-il1-f176.google.com with SMTP id r8so186355ilo.8;
        Wed, 24 Mar 2021 13:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ym9wQJ835EhicfJs2Z/0AiEJTDHIWA8h8IYBIVzB34I=;
        b=T8A0FHcCIWiyBuOlIz/O5+Ot5ut0YUNRhcFHly0k5BZPhvhOla6W/rGXyFo91iEwXT
         BA0HhMM66Edy1877SVp7cPo9twuOqAejBlafaVIEdc1ivwCK2U/CnaQwNh5Sf0m2+sGa
         NaKT09qBexiid1s1pW+YQkiLHvNj3RNN5sVIyVr3YHr3/UHC0Nm2nLA8Gb5U1P5U4KVO
         J5s5BNiA4fWU6pcg2utG/Hu9FLDDx93dna3ixAKgjF73umAFnwgGkL6qFQEaeqbmka1W
         1V9MCFuEQCiwuX4RznarezLD0O0n3J1I/6pyzBetlE7R8C+YsQIm6Jqz1doqJ37QjcBv
         I6Hg==
X-Gm-Message-State: AOAM531rM5HS8l6mp30oTwuRwEhZ9Y09N/b0B+jyU6HrUMj798HCfNag
        3IRPxVxavG/obXHIgWR60/SPZBAEZLKo
X-Google-Smtp-Source: ABdhPJx3LwNgG+pEwKPSbbPIAocbEobG0kVRkstX/EHtFKqufLF2VaRE6e/EzOizKuOO3upBFpe2XA==
X-Received: by 2002:a05:6e02:128c:: with SMTP id y12mr3996206ilq.7.1616617375356;
        Wed, 24 Mar 2021 13:22:55 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.253])
        by smtp.googlemail.com with ESMTPSA id p5sm1544811iod.31.2021.03.24.13.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 13:22:54 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2] dt-bindings: media: video-interfaces: Drop the example
Date:   Wed, 24 Mar 2021 14:22:53 -0600
Message-Id: <20210324202253.3576798-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The example in video-interfaces.yaml uses a bunch of undocumented
bindings which will cause warnings when undocumented compatible checks
are enabled. The example could be fixed to use documented bindings, but
doing so would just duplicate other examples. So let's just remove the
example.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2: Drop instead of fixing the example

 .../bindings/media/video-interfaces.yaml      | 127 ------------------
 1 file changed, 127 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
index 0a7a73fd59f2..4391dce2caee 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
+++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
@@ -215,130 +215,3 @@ properties:
       CCP2, for instance.
 
 additionalProperties: true
-
-examples:
-  # The example snippet below describes two data pipelines.  ov772x and imx074
-  # are camera sensors with a parallel and serial (MIPI CSI-2) video bus
-  # respectively. Both sensors are on the I2C control bus corresponding to the
-  # i2c0 controller node.  ov772x sensor is linked directly to the ceu0 video
-  # host interface. imx074 is linked to ceu0 through the MIPI CSI-2 receiver
-  # (csi2). ceu0 has a (single) DMA engine writing captured data to memory.
-  # ceu0 node has a single 'port' node which may indicate that at any time
-  # only one of the following data pipelines can be active:
-  # ov772x -> ceu0 or imx074 -> csi2 -> ceu0.
-  - |
-    ceu@fe910000 {
-        compatible = "renesas,sh-mobile-ceu";
-        reg = <0xfe910000 0xa0>;
-        interrupts = <0x880>;
-
-        mclk: master_clock {
-            compatible = "renesas,ceu-clock";
-            #clock-cells = <1>;
-            clock-frequency = <50000000>;  /* Max clock frequency */
-            clock-output-names = "mclk";
-        };
-
-        port {
-            #address-cells = <1>;
-            #size-cells = <0>;
-
-            /* Parallel bus endpoint */
-            ceu0_1: endpoint@1 {
-                reg = <1>;    /* Local endpoint # */
-                remote-endpoint = <&ov772x_1_1>;  /* Remote phandle */
-                bus-width = <8>;  /* Used data lines */
-                data-shift = <2>;  /* Lines 9:2 are used */
-
-                /* If hsync-active/vsync-active are missing,
-                   embedded BT.656 sync is used */
-                hsync-active = <0>;  /* Active low */
-                vsync-active = <0>;  /* Active low */
-                data-active = <1>;  /* Active high */
-                pclk-sample = <1>;  /* Rising */
-            };
-
-            /* MIPI CSI-2 bus endpoint */
-            ceu0_0: endpoint@0 {
-                reg = <0>;
-                remote-endpoint = <&csi2_2>;
-            };
-        };
-    };
-
-    i2c {
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        camera@21 {
-            compatible = "ovti,ov772x";
-            reg = <0x21>;
-            vddio-supply = <&regulator1>;
-            vddcore-supply = <&regulator2>;
-
-            clock-frequency = <20000000>;
-            clocks = <&mclk 0>;
-            clock-names = "xclk";
-
-            port {
-                /* With 1 endpoint per port no need for addresses. */
-                ov772x_1_1: endpoint {
-                    bus-width = <8>;
-                    remote-endpoint = <&ceu0_1>;
-                    hsync-active = <1>;
-                    vsync-active = <0>; /* Who came up with an
-                               inverter here ?... */
-                    data-active = <1>;
-                    pclk-sample = <1>;
-                };
-            };
-        };
-
-        camera@1a {
-            compatible = "sony,imx074";
-            reg = <0x1a>;
-            vddio-supply = <&regulator1>;
-            vddcore-supply = <&regulator2>;
-
-            clock-frequency = <30000000>;  /* Shared clock with ov772x_1 */
-            clocks = <&mclk 0>;
-            clock-names = "sysclk";    /* Assuming this is the
-                       name in the datasheet */
-            port {
-                imx074_1: endpoint {
-                    clock-lanes = <0>;
-                    data-lanes = <1 2>;
-                    remote-endpoint = <&csi2_1>;
-                };
-            };
-        };
-    };
-
-    csi2: csi2@ffc90000 {
-        compatible = "renesas,sh-mobile-csi2";
-        reg = <0xffc90000 0x1000>;
-        interrupts = <0x17a0>;
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        port@1 {
-            compatible = "renesas,csi2c";  /* One of CSI2I and CSI2C. */
-            reg = <1>;      /* CSI-2 PHY #1 of 2: PHY_S,
-                       PHY_M has port address 0,
-                       is unused. */
-            csi2_1: endpoint {
-                clock-lanes = <0>;
-                data-lanes = <2 1>;
-                remote-endpoint = <&imx074_1>;
-            };
-        };
-        port@2 {
-            reg = <2>;      /* port 2: link to the CEU */
-
-            csi2_2: endpoint {
-                remote-endpoint = <&ceu0_0>;
-            };
-        };
-    };
-
-...
-- 
2.27.0

