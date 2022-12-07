Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D97464579D
	for <lists+linux-media@lfdr.de>; Wed,  7 Dec 2022 11:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiLGKXQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Dec 2022 05:23:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbiLGKXE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Dec 2022 05:23:04 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4431B11448
        for <linux-media@vger.kernel.org>; Wed,  7 Dec 2022 02:23:03 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id y25so5757716lfa.9
        for <linux-media@vger.kernel.org>; Wed, 07 Dec 2022 02:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftjSB9JJ8yBkXE+8vCPq7doIFKzD/Pbisdda5DVy8ec=;
        b=WIyixd4HXawkevgN9swStc9TJ6yWZGGmbayM6ArIH6QU1OLmhpDd3KxItyoF9x5zw2
         uKPZvAEgvbygXM3F2LJeDNdN4q/aofkOilIlQaHVR9k9Be7josKZNuB23lQVsEX51RNE
         rhfPr5IeWj/ByE3TGRnjcfyHF2GKQsHUl6m6/X98npaeg00dn/b8r4Z2nUV5X/qpzGBZ
         cqORDrRBpgt9P1uXgj5rQEDdmHXgYysSvfzS5UhoD/Q5NxYJ+FRVSix3EA2iUjwJ+5dD
         ud+j1hZZq0/0U3c2ajWUDhgq/ztWY0Lj2pb/+HTI8UebDMqThOTFut+exVMuNlVGkC8Q
         8xqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftjSB9JJ8yBkXE+8vCPq7doIFKzD/Pbisdda5DVy8ec=;
        b=O1fEmqejp8AZlOvTPWv+LxuymDNf0Qq/bM+zy71BQEuMdWB/HwSmnA5ZK4EiPQNPEl
         VayDuNa/7rGnUL7QjauVHiOUvvEna0Y472lwUojk7Jpns9Gt+jMt1mJcBV77Cm5juQMJ
         ezjxq+ULcZbAvumPjPat+GjA27GT5LN4pI9mnuNDKgi5zqAlAcCQJrYldBapLPMJYBUr
         wc8k7szS/rJPwsYukTrE0zTYsoFQizCIHN4wcm5LvKrCsaSVMjO1HvuUfh/jwEaS7auq
         NADM6ycntg/zo1ZQDCKa1niX82RVN/R+bzqtsl8CsaUl8w0z0ETZLcOYbQYMzCmCzbsu
         6J+A==
X-Gm-Message-State: ANoB5pmIyoNYZWT+E5UbPea2x9IHApD95vdIxHPeZG5wUAMyLrz321Go
        ZEsrqUevLse722i8tCwR1nFpvw==
X-Google-Smtp-Source: AA0mqf4om2ZDcm1wROjWKvlDZ4YHUcOqiqFmBIx5LemQjgt2gr26PuNmCDHVgdcNxCeZZI4G2HTlGA==
X-Received: by 2002:a05:6512:c9:b0:4b5:9055:141 with SMTP id c9-20020a05651200c900b004b590550141mr1145685lfp.200.1670408581624;
        Wed, 07 Dec 2022 02:23:01 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 02:23:01 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Joe Tessler <jrt@google.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 3/9] media: dt-bindings: cec: convert common CEC properties to DT schema
Date:   Wed,  7 Dec 2022 11:22:47 +0100
Message-Id: <20221207102253.26663-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
References: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert common HDMI CEC adapter bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/cec.txt         |  8 ------
 .../bindings/media/cec/cec-common.yaml        | 28 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 29 insertions(+), 9 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/cec.txt
 create mode 100644 Documentation/devicetree/bindings/media/cec/cec-common.yaml

diff --git a/Documentation/devicetree/bindings/media/cec.txt b/Documentation/devicetree/bindings/media/cec.txt
deleted file mode 100644
index 22d7aae3d3d7..000000000000
--- a/Documentation/devicetree/bindings/media/cec.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-Common bindings for HDMI CEC adapters
-
-- hdmi-phandle: phandle to the HDMI controller.
-
-- needs-hpd: if present the CEC support is only available when the HPD
-  is high. Some boards only let the CEC pin through if the HPD is high,
-  for example if there is a level converter that uses the HPD to power
-  up or down.
diff --git a/Documentation/devicetree/bindings/media/cec/cec-common.yaml b/Documentation/devicetree/bindings/media/cec/cec-common.yaml
new file mode 100644
index 000000000000..af6ee5f1c73f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec/cec-common.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cec/cec-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HDMI CEC Adapters Common Properties
+
+maintainers:
+  - Hans Verkuil <hverkuil@xs4all.nl>
+
+properties:
+  $nodename:
+    pattern: "^cec(@[0-9a-f]+|-[0-9]+)?$"
+
+  hdmi-phandle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the HDMI controller.
+
+  needs-hpd:
+    type: boolean
+    description:
+      The CEC support is only available when the HPD is high. Some boards only
+      let the CEC pin through if the HPD is high, for example if there is a
+      level converter that uses the HPD to power up or down.
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 07cb85cac4c3..45402e03cda5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4832,7 +4832,7 @@ S:	Supported
 W:	http://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/ABI/testing/debugfs-cec-error-inj
-F:	Documentation/devicetree/bindings/media/cec.txt
+F:	Documentation/devicetree/bindings/media/cec/cec-common.yaml
 F:	Documentation/driver-api/media/cec-core.rst
 F:	Documentation/userspace-api/media/cec
 F:	drivers/media/cec/
-- 
2.34.1

