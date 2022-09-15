Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 073BC5B91C8
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 02:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbiIOAgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Sep 2022 20:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbiIOAfw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Sep 2022 20:35:52 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127301F8
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 17:35:36 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id az24-20020a05600c601800b003a842e4983cso12754153wmb.0
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 17:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=JNCmhNSjDRtqxh4AkIUZa3/ErH32E1DP7RCQQKbBQVo=;
        b=PaXiV6Opti5taGzpFNOh9MHEkdywlbYavjfBYBd7rHHVzF++7rw1chOVLBQPMKfJ6b
         v8pZOeTLILKICEN8tWoKgS/7lxmvyddCHTgeurPm8T1gUBQkDZrQClUxuIQA0qE+51Zr
         cyEtbFzG3pZ1BnEHDp9Dh4llR11PK6Qdc11MF9hSsDJiwRZ0u04bGHSBGPT4P9ZRzRSg
         1NOQykDecP2tMoSnGsD6Is5sgniKkVayF4tcuEzKfWwJlwPaPXJqpBKMkF1BJK9ElpoU
         y6hWMpihNa1bsLggFV/VG/2GRsuFHEuLXQpFepZa7ECVZruWCG8A4XkGKiPCA8csVi79
         AM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JNCmhNSjDRtqxh4AkIUZa3/ErH32E1DP7RCQQKbBQVo=;
        b=U7Tw17JyyJ6Q5cOUhGNigm1zlHCwDqS5PsDaWsMU4AOHyhciY8dWNAzOLNNfD6BhhV
         dZdJsT0Gps2w6LLCpcN2kU4Y0S4X6OcK9UqYwoaw+5nFUnIBCXMBrxFWwq2H9GvC0zm7
         jhrge+prCK/zJvCK1vV0KegrGHboUo3PKBlI4toxdg8LKNrErBibIxsBThtf0/VgUCgc
         gGjsjycUn6ttUrfqGavp7herDMXZW5+uWv4jac1SjH8xoFayZvfnP/BslKpLNjXDrxUg
         Gee1lSUoPlRjBprC0NS1KOtXkeYsphtDSe0z23tU4Txf2YTG06YpyF0/tonKFgZrOD38
         +2Kw==
X-Gm-Message-State: ACgBeo3dHZrwsLWSmdOf2aU9rg0B8ko7jbXvdVaIYOOpYFJRoBLpnwiD
        xJI7zb1pXjlxQnfsyaSDq8lBBg==
X-Google-Smtp-Source: AA6agR5/NKkEluKvl5X9RFAAHj5K3AZ7fbkCUfK7XMQJwYZOxKM7kGf3c6jtgY8oNgNJizSH3/A+NA==
X-Received: by 2002:a05:600c:1906:b0:3a5:f9e0:fcb6 with SMTP id j6-20020a05600c190600b003a5f9e0fcb6mr5041533wmq.157.1663202134666;
        Wed, 14 Sep 2022 17:35:34 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d8-20020adff848000000b002253af82fa7sm905235wrq.9.2022.09.14.17.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 17:35:34 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v3 1/5] media: dt-bindings: imx412: Add imx477 compatible string
Date:   Thu, 15 Sep 2022 01:35:18 +0100
Message-Id: <20220915003522.1227073-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220915003522.1227073-1-bryan.odonoghue@linaro.org>
References: <20220915003522.1227073-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Sony imx477 uses the same silicon enabling reference code from Sony in
the available examples provided.

Add an imx477 compatible string to allow for chip differentiation and
accurate description of hardware in dts.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index 26d1807d0bb6..a0da469995db 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -19,7 +19,10 @@ description:
 
 properties:
   compatible:
-    const: sony,imx412
+    items:
+      - enum:
+          - sony,imx412
+          - sony,imx477
   reg:
     description: I2C address
     maxItems: 1
-- 
2.34.1

