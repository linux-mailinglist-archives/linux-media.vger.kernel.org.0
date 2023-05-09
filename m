Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1106FCE20
	for <lists+linux-media@lfdr.de>; Tue,  9 May 2023 21:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjEITBP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 May 2023 15:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjEITBO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 May 2023 15:01:14 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 713383580
        for <linux-media@vger.kernel.org>; Tue,  9 May 2023 12:01:12 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so61790812a12.1
        for <linux-media@vger.kernel.org>; Tue, 09 May 2023 12:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1683658871; x=1686250871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ytk+V71/AV0BGV2Rs5mHU2upcD/KjA0lh+KGqNo4Tc=;
        b=1bjSD/z/1AbfXl3d0X6ocUksFrxRjue3+gvsgAzECgP46rQ4BSMHJLEgMdg+ojdmjG
         QWmZssbw/m+v7hsi9mEpEgHuip3EvrUkF6QCfs9zUHpvUzq+9oiiHAjPkHsa58eyJckE
         Ne6fGP0r/muCOHQHU3qnFbS4pyq64Oqk4oK6Jsuk/g2mQBwKwKji2W+hk38KwW+4W+DT
         RSOD/PtuAwCYdDy7Ww30HgermZkfO8n43shbCF7tUiLTLdzNB5vr6agzfjkZVWlxJx58
         m489X9kOGxlQuBnGQaSYOf6TzNkr4SBLbyOXhnHlUS0rxmzdv4uq6P88QzrXpzAsDF7S
         prrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683658871; x=1686250871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ytk+V71/AV0BGV2Rs5mHU2upcD/KjA0lh+KGqNo4Tc=;
        b=C6KmUG0bvL6zen+0u7p1BuMwHOaMIPWF+0ue5XEIS+F5BBHc3Uzp8F/mDI3O+f0+Fo
         rfui9c/sG0W3np4bd2cga2CzwGdKJbMe7y7ce43H4uUNi8QfSKkxVti5Cu60th4GmJB/
         F+wXwHQAlRz9jyk2gswA3FT1diZCpRHk/6hmAWANUPk3nEmiee8fbGYFe9Gtks2I2/oX
         OKBTlKO07iHIj+rukughAjZfOjROi+iQ2HlzfvlLSsq2WUSdrTstbca8Fs7ut62sGlRD
         cEdvJnUwNb6E17J+NOlsvHlSLcM+FtYXF0NGxsDH8BxGg/g//7em5KkjrNa1hKNA3fMm
         e7Aw==
X-Gm-Message-State: AC+VfDwRdY1pHxRq5+Mu8i5ls10UWZKloi/VBXSYzhyq122wdkVrzH2u
        I4Kv0dmECT7VX0dVDedv6vqmTw==
X-Google-Smtp-Source: ACHHUZ6wJrXOIO2riLPl9ZDaOHeOgwiS5ZaALBf2+RoE/hN+LBzXNViI3mVhNkHh2SHEtU+tTdzWAA==
X-Received: by 2002:a05:6402:34c9:b0:50b:c350:f9ca with SMTP id w9-20020a05640234c900b0050bc350f9camr14606410edc.10.1683658870820;
        Tue, 09 May 2023 12:01:10 -0700 (PDT)
Received: from sleipner.berto.se (p54ac52fc.dip0.t-ipconnect.de. [84.172.82.252])
        by smtp.googlemail.com with ESMTPSA id n25-20020a056402061900b0050a276e7ba8sm1123181edv.36.2023.05.09.12.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 12:01:10 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] dt-bindings: i2c: maxim,max96712: Require setting bus-type property
Date:   Tue,  9 May 2023 21:00:31 +0200
Message-Id: <20230509190031.769298-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MAX96712 can support both a CSI-2 C-PHY and D-PHY bus. The initial
staging driver however only supported D-PHY and the bus-type property
was left optional.

In preparation for adding C-PHY support to the staging driver make the
bus-type property mandatory as it is needed to select the correct PHY
mode. Without the bus-type property present, the driver falls-back to
D-PHY mode, so the change is functionally backward compatible with old
DTS files lacking the property.

The only in-tree DTS file (renesas/r8a779a0-falcon-csi-dsi.dtsi) that
lacked the property uses D-PHY and have been updated.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Use symbolic names in comments for the bus-type properties.
- Improve the commit message.
- Rebased to v6.4-rc1.
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 444f24838d3d..6c72e77b927c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -65,9 +65,14 @@ properties:
 
             properties:
               data-lanes: true
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
 
             required:
               - data-lanes
+              - bus-type
 
     required:
       - port@4
@@ -82,6 +87,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
 
     i2c@e6508000 {
             #address-cells = <1>;
@@ -101,6 +107,7 @@ examples:
                             port@4 {
                                     reg = <4>;
                                     max96712_out0: endpoint {
+                                            bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
                                             clock-lanes = <0>;
                                             data-lanes = <1 2 3 4>;
                                             remote-endpoint = <&csi40_in>;
-- 
2.40.1

