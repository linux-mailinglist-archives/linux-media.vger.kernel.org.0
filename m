Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E135B3F05E3
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238483AbhHROMh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238487AbhHROMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:12:31 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A3BC0613CF
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:11:57 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id fa24-20020a17090af0d8b0290178bfa69d97so2486277pjb.0
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nbJfLcBBh0T7Dc0N+cilO3+FM2vIRTLzi1Egk/lT5Q0=;
        b=m9fkuRUpcoy9zsrCZobM1MB5TyNmRahBWDCWcHACkVpwyjwylvzEfgIU/MDoV8t+OX
         tTQcXFuvpxwipitv4J/VpasrG51QyB0o0fVLc+BZfXDlTZXHsNLRNiNxIQZTxhUwWPvy
         HfzcuQjdALg3LmZlCEEdRMGU1kRWKxF6oeTx/HeEutDZtFQcVik+kB3kuX/03q4SlPq5
         cP2O9ib7DrSHxxvueqnGcvM/iO7qnqlV0CvraGo+WhxMfRFeSC6Gnl3AiIpCyP+0uEfT
         JhXR8fesTzX0VK9gr0Sj4FtK35RHc/gIF7l4rEVyFMEDIH/3WQR6Q975ei2j7LbxIy61
         r7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=nbJfLcBBh0T7Dc0N+cilO3+FM2vIRTLzi1Egk/lT5Q0=;
        b=cewvFQlmdLs35xLhwS8eMzaRi9Yk8ydxKDHqXXUVRyyMz6sUO5JclIaSEGTeceD1f2
         WpiI0PndXxebJqBSfmTOhPe01YMCuccNW+JMEBR104hv5O0LbuPgTpfERZ6F0/ANxzl+
         gWsIJwS1W184p8eCijX/HdJyEWLc96dtF/kIoAbkel7f1NCgO9CYiq3a9P31RS5q4kMt
         WEPYwinkI9rZSfQd70YkMWpMnUEDeYXe1rvVrio0TDMEAKw9GqxzVlct5FD/mKRg70PX
         sKeEc4228Bn3RdCEcGk3cl3jS/zcVmpePxzh6bOioO1iUUr/w2AbFgz9TwXU3qKu3V1U
         pmRw==
MIME-Version: 1.0
X-Gm-Message-State: AOAM5323i0CTujyEo5DXeWx6EuyM/6eKtzGchKEFoaQ3fjKSxMEv4wcy
        Wv9434VJl7S6yvmpORbanHdBpxP0MewUHYbnb8EeV7pCyp7k6ZMWVkPetxKJtSU3AGGmIfU4rJT
        iWT1bscJIkKT+pkr+
X-Google-Smtp-Source: ABdhPJyrmEZJ7YjlE9bPn0TfMvr4ag2Dd80gBPUmH/OoCxGa0YhSuKBbDHUhIHhYQPf+IeUNPASB8Q==
X-Received: by 2002:a17:90b:3694:: with SMTP id mj20mr9341705pjb.5.1629295916640;
        Wed, 18 Aug 2021 07:11:56 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.181])
        by smtp.gmail.com with ESMTPSA id e8sm8084343pgg.31.2021.08.18.07.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:11:56 -0700 (PDT)
From:   sidraya.bj@pathpartnertech.com
To:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com,
        Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH 01/30] dt-bindings: Add binding for img,d5500-vxd for DRA8x
Date:   Wed, 18 Aug 2021 19:40:08 +0530
Message-Id: <20210818141037.19990-2-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="US-ASCII"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sidraya <sidraya.bj@pathpartnertech.com>

Add the dt-binding for the img,d5500-vxd node for DRA8x.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 .../bindings/media/img,d5520-vxd.yaml         | 52 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/img,d5520-vxd.yaml

diff --git a/Documentation/devicetree/bindings/media/img,d5520-vxd.yaml b/Documentation/devicetree/bindings/media/img,d5520-vxd.yaml
new file mode 100644
index 000000000000..812a431336a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/img,d5520-vxd.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/img,d5520-vxd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination D5520-VXD Driver
+
+maintainers:
+  - Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+  - Prashanth Kumar Amai <prashanth.ka@pathpartnertech.com>
+
+description: |
+ The IMG VXD video decode driver for the D5500-VXD is a video decoder for
+ multiple video formats including H.264 and HEVC on the TI J721E family
+ of SoCs.
+
+properties:
+  compatible:
+    const: img,d5500-vxd
+
+  reg:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    d5520: video-decoder@4300000 {
+            /* IMG D5520 driver configuration */
+            compatible = "img,d5500-vxd";
+            reg = <0x00 0x04300000>,
+                  <0x00 0x100000>;
+            power-domains = <&k3_pds 144>;
+            interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index fd25e4ecf0b9..163b3176ccf9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19531,6 +19531,13 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/test-drivers/vicodec/*
 
+VIDEO DECODER DRIVER FOR TI DRA8XX/J721E
+M:	Prashant Amai <prashanth.ka@pathpartnertech.com>
+M:	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/img,d5520-vxd.yaml
+
 VIDEO I2C POLLING DRIVER
 M:	Matt Ranostay <matt.ranostay@konsulko.com>
 L:	linux-media@vger.kernel.org
-- 
2.17.1


-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.
