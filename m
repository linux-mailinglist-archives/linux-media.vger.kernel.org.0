Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA257B1BD8
	for <lists+linux-media@lfdr.de>; Thu, 28 Sep 2023 14:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232286AbjI1MPH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Sep 2023 08:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjI1MPG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Sep 2023 08:15:06 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBB9180;
        Thu, 28 Sep 2023 05:15:03 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3af59a017a5so399971b6e.1;
        Thu, 28 Sep 2023 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695903302; x=1696508102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VpmJ802FoQOjA2VHA2wPii0E71iasRWO8yv5CT65q40=;
        b=Du2H1deE+4Do2KCSM2o+871eEtC/5cNSOSmes150lxkc8ys+i9H2Je1FfL4iSnmlqj
         rNh2L/x6fUPBypKwpzi/dPsn19g4xLU3H2lU/rTcJfJZGBz6TKZNc1dBaQi2chcwQuqd
         m0avzEgbgH4puNcGfEeEHw3QNaDlb0N/UapjugNSPAoheT9T1UwTfPbL3c2L2C+FLGQM
         6ADigPc3CGnrdZquNyydEq6MMmNrttJAjeCFEZE99GxgPGcXQTZ3sFH8J8nVzYHuZ3un
         pwUGM2eC2MWttgTceziOrYdWRA+btSxOiuULq/AlXVg5KXaoL4T3r6X1lOGL5HFfrjTs
         idDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695903302; x=1696508102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpmJ802FoQOjA2VHA2wPii0E71iasRWO8yv5CT65q40=;
        b=L2clbbKgUNHMNj3FraX0U1viNk5N5HnXecyBcvzb6zSuiE4eF/70tiGEwzV+sD0S1y
         ATZXHYkvdqkSq01PK1ZhX6q7XFfmNNBS333xgxATCky0hCdDz3fLOQwvTxNPah3fAHEg
         g5nMMvQokYcTfnc7QlQ55+PQ+zl2wD2rAMYmHxh2Zsir6Tqo46rCdgtkg2XMJFGcjvXx
         zvLp8YgHm8WYrk5ZSpDwfm3N81azaT2lY911LVtrfCy79iFh6MMFyaP774br+Jl5oHEr
         h78Nps5Cc3GMIK3mgrpGiOrqvfGp62PsrvPafh9NWCOgBHkvJ5lSjvCl8TC7thGAH6ep
         /EJA==
X-Gm-Message-State: AOJu0YzbUJqtzJw+1r+UlDafrkaKco7VSG7PRMDVL++QW/CIDpJzJx8c
        tOSjc6zcyKi9se4SamNtX4g=
X-Google-Smtp-Source: AGHT+IGqhB7ZvZva14eLkHHm5jugmC8qdD8PvABRqOqc6m38fb6L5vVVMXDlrOBhL2OwsRmSQhHejg==
X-Received: by 2002:a05:6808:1818:b0:3ae:5e6a:5693 with SMTP id bh24-20020a056808181800b003ae5e6a5693mr1421015oib.0.1695903302453;
        Thu, 28 Sep 2023 05:15:02 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:386c:ba81:a385:9374])
        by smtp.gmail.com with ESMTPSA id 11-20020aa7910b000000b0068842ebfd10sm5706265pfh.160.2023.09.28.05.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 05:15:01 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     mchehab@kernel.org
Cc:     sakari.ailus@linux.intel.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        martink@posteo.de, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] media: dt-bindings: hynix,hi846: Document orientation and rotation
Date:   Thu, 28 Sep 2023 09:14:24 -0300
Message-Id: <20230928121424.388019-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

Document the 'orientation' and 'rotation' properties, which
are valid for the SK Hynix Hi-846 sensor.

Their definitions come from video-interface-devices.yaml, so add
a reference to it.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Martin Kepplinger <martink@posteo.de>
---
Changes since v1:
- Also pass a ref to video-interface-devices.yaml. (Martin)

 .../devicetree/bindings/media/i2c/hynix,hi846.yaml         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
index 1e2df8cf2937..8b7a46a15458 100644
--- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
@@ -14,6 +14,9 @@ description: |-
   interface and CCI (I2C compatible) control bus. The output format
   is raw Bayer.
 
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
 properties:
   compatible:
     const: hynix,hi846
@@ -48,6 +51,10 @@ properties:
   vddd-supply:
     description: Definition of the regulator used for the VDDD power supply.
 
+  orientation: true
+
+  rotation: true
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     unevaluatedProperties: false
-- 
2.34.1

