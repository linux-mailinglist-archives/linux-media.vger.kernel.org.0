Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 020FE5E6014
	for <lists+linux-media@lfdr.de>; Thu, 22 Sep 2022 12:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbiIVKmw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Sep 2022 06:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiIVKmu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Sep 2022 06:42:50 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A4AAB196
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 03:42:48 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id l8so6492247wmi.2
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 03:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=mQ+WNR4+ZoBFRpRt6BX4yAkPkUqFNL1hRrx7xYLMtk8=;
        b=PgWdZgfrJefnWF/n4ifxlIEjRffqFfIoc3y4HiJxPtzvttkQBtH/r2gfE3duDFqKvL
         sUKB8zBmXge77vqh8v3MrdBvtF3u9LU6K++qY4YDeoDzx95zqUf6IqhF/yh+Z3aSwKLS
         /FlSKBDozGC7dTYGLAWJ/gAjoUZ0P0J56PWxHaLXhfEHGcwk1ULAxrZr2ypgQV3uuYt8
         94viaLtZAuD80nicqmJbWg/lXRVZ/CRii5ivaa6Inigh76qhsOwce/028S9OwKrAlj2o
         1OkYR2GU7+R5cydLbPnr+bz6aEjsJQfB+qkkcxNTmODqXbl28Dbw78BwraZgL/6MzRif
         JK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mQ+WNR4+ZoBFRpRt6BX4yAkPkUqFNL1hRrx7xYLMtk8=;
        b=S6RgNPQ/6SKDAAyHrohQDH+pb8fVFOKXOvoWUNSB90obdjSTuB9z0n6DchJGUd4PMn
         s7R1cbFjuxC/gSlNdl9nur3jK7KKxD6yKGX1l9UC+cWkGR6xQ+ZV4E259OsJm613IDDm
         pg1gkBgCvb40k/JLGflh75oTBdQoAUKKafXyMNS0HwQ9ZqxYxlsLA0ehoyH31kgdE5Q9
         8mTL/TKFQaN/XBMRYMMJpLkAljJnKODtpZc+JkdRqL5PlEWRp+btikc2tOh57woZ8ACx
         a1gjyt511xmSguvmWKav77BO1Fbgez4YrpFcSgkU2NqtSZKdfRUvy2BXUclhGBKIiPuC
         jzqw==
X-Gm-Message-State: ACrzQf08j8i3BxGy9fabq2b2hqxOlimTKZ5h49B1eP8JG31KkEJFMqbw
        8e9k7F92KizTJ89GQiE4EHHo3A==
X-Google-Smtp-Source: AMsMyM4g1PzDnLatQtptROUHPkEKU+6SmG/6W1gYw8Lt1FC+tukxL2CrnObjKmTj99K/Ed96OCP7bA==
X-Received: by 2002:a7b:c404:0:b0:3b4:faca:cf50 with SMTP id k4-20020a7bc404000000b003b4facacf50mr4779575wmi.67.1663843367145;
        Thu, 22 Sep 2022 03:42:47 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x12-20020adfffcc000000b0022ac672654dsm4647150wrs.58.2022.09.22.03.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 03:42:46 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v4 RESEND 1/3] media: dt-bindings: imx412: Extend compatible strings
Date:   Thu, 22 Sep 2022 11:42:23 +0100
Message-Id: <20220922104225.1375331-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922104225.1375331-1-bryan.odonoghue@linaro.org>
References: <20220922104225.1375331-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add compatible bindings for imx477 and imx577 both of which use the
same silicon enabling reference code from Sony in the available examples
provided.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/media/i2c/sony,imx412.yaml          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index 26d1807d0bb6..ebb649c5e4c5 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: sony,imx412
+    items:
+      - enum:
+          - sony,imx412
+          - sony,imx477
+          - sony,imx577
   reg:
     description: I2C address
     maxItems: 1
-- 
2.34.1

