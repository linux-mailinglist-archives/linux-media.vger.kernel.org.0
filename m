Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7EBD716B23
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 19:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233509AbjE3RbO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 13:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233498AbjE3RbE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 13:31:04 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA99A103
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:49 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4eed764a10cso5129799e87.0
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685467848; x=1688059848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RTXQRG5bAHWhgIfsGKkL1H4XXRZuZcBB1mAp7EY4Bk=;
        b=LHKx4EECXZPuEFoZFs1qBTv3R6QqfvyJELoJ+fsHLQy0t0ZOOx1tvfhA8DqH94YI+O
         fIfS2QeUNs2m9vUjJuoFtyadgmVoa3KhzNEC+9dW4JSmfsZwqfA2F+H0ddcg18s44ynj
         ZLTdYq3BzqgMx1/oF0aqdFnIGcVRAJff3XspbHuMm1l/pUVOSBA4rgduJvKJ1UJBurqv
         8U9vPlYj9gCjFwTGuw3tnOh5j7XpvW9oVAkBvirTprUBINJlYN5m0jWqBOV91npvCTEH
         4qC5/MuWSikcvWUsiHO9vyhJr+SQxNZY2ubj7K8Xwvs7E54fjMjeU+1lyK6/lLUvMPuX
         u9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467848; x=1688059848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/RTXQRG5bAHWhgIfsGKkL1H4XXRZuZcBB1mAp7EY4Bk=;
        b=gYSwBtdi5yVFDxsxPU5hANdvBtVkEigZjS8dPviOGAnxndjB7W7+TOubaY148k+hMM
         +EFZuABYXhsFck2/jFEQJaBdKExSFLfp/WTKwUObnTyvOsMfZjIVkrSP0RKj5ukwyW7S
         htCrH1dQfAs+AeNBxBMS4BoXAXdhM4X4b0ywMFzjxQV/nta9XC7dlGIVFw477NNVHC9s
         DXFu5NWTqm1Oru/3iPjLLcbYDU149ra8z3G2ypb7CMPdIyINrzBxr89gNmp9OWZyZlmn
         m1vKT3aN/y9ejOgENxldD6R7fySD8MI3+2caT/KJW6q8lr5YSqvi+8nOCmtZOeKbr2F4
         6NwA==
X-Gm-Message-State: AC+VfDxumuYoG7HA4JvsHuGBlhMJs8/FDaJoUGwSHlDvGVn59x6XUVf+
        Tqb+45s85+J1YT0o7dHFNMe/sQ==
X-Google-Smtp-Source: ACHHUZ7UdIvS0DXG7D1yG/oMQikBYA/CxnjEWTgKklZqd+yVUuky2Bypkg87wb0O776dDM7hZYRyIg==
X-Received: by 2002:a19:5506:0:b0:4f2:6ddf:2011 with SMTP id n6-20020a195506000000b004f26ddf2011mr1370790lfe.19.1685467848168;
        Tue, 30 May 2023 10:30:48 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id h14-20020a056000000e00b0030ae901bc54sm3964823wrx.62.2023.05.30.10.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:30:47 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 18/21] dt-bindings: media: imx258: Rename to include vendor prefix
Date:   Tue, 30 May 2023 18:29:57 +0100
Message-Id: <20230530173000.3060865-19-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

imx258.yaml doesn't include the vendor prefix of sony, so
rename to add it.
Update the id entry and MAINTAINERS to match.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/media/i2c/{imx258.yaml => sony,imx258.yaml}        | 2 +-
 MAINTAINERS                                                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{imx258.yaml => sony,imx258.yaml} (97%)

diff --git a/Documentation/devicetree/bindings/media/i2c/imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/media/i2c/imx258.yaml
rename to Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
index 80d24220baa0..bee61a443b23 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/imx258.yaml#
+$id: http://devicetree.org/schemas/media/i2c/sony,imx258.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sony IMX258 13 Mpixel CMOS Digital Image Sensor
diff --git a/MAINTAINERS b/MAINTAINERS
index 26f705e94a41..16d0f64d8ee8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19633,7 +19633,7 @@ M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/imx258.yaml
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
 F:	drivers/media/i2c/imx258.c
 
 SONY IMX274 SENSOR DRIVER
-- 
2.25.1

