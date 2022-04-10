Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCF374FAEE5
	for <lists+linux-media@lfdr.de>; Sun, 10 Apr 2022 18:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240624AbiDJQd0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Apr 2022 12:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240629AbiDJQd0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Apr 2022 12:33:26 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014C2E0EA
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 09:31:15 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id x3so608927wmj.5
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 09:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nz+8z7lU6Hjr3OWaRn2W5qjAwAOaEVnr0lrLZw293X4=;
        b=mwWXe/t6PHzp76YJbHLRZMGszNlbJqWc7bcdaE6QIVsXgSTYuRfzA3E9Ybgq3/TerW
         A6fYqNAi8ItCYxYbs86lWQEx++FLSChNqDd5PZ8ARmRewOT6zhqqYeBLUmtr7co5jxoz
         KMnj65ZKmXcCY4ZijW8uYQf+/vsoQHI0lJftnN1YZIcytiYyfVRJSrK0hp8LFBdw/7zb
         B4A1BkAju091wHwNNkO+KNTE2mMeDgIKWBIBjhS+1oUOJOU+FwnRpNtA4hRFGl0wZ/DK
         9cYIpT3gh0anJNgu1eJDXhtXZqLADDXQxaoHrSA/atWB8HYHQyubjLgbEDYfEKK4wpR1
         BcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nz+8z7lU6Hjr3OWaRn2W5qjAwAOaEVnr0lrLZw293X4=;
        b=UGkpBSh7rVwG5hrOVN7gx+k3jWlCKTRcFtPkU9Z5xbfMnimtYJ/riXcjfBv4B/dCAL
         Z88+orn1xu3ZNIFetkHfdGut1OZr5mAyfD9ety9e+fQKnwE2awaGOeDj4o+XlvuxBA4K
         i5UJd7lk28G/MnHGoVlVA/yMdlrWqTe5tZFa6MKsYZIarAPBwep1gPRzDjcpnUFYawMg
         CcFc7EaECKD7F5AN9A9Xjai4b2Psy1EVVHuzTD/Axr7unrfGO8oIaF1zW/R0zNFiLEG3
         4nVY+7WMXtMnfHGgm9AwcwtMxbbgYW9Q8PCLXb6P/ZIBK1F+jxiAvJeCPPwga/kyP2+1
         wcIQ==
X-Gm-Message-State: AOAM533Za70d0Kt6ca9HjL4OWha9onhedSlaC3awSSURCazPuK/Xx5xo
        CBw8+cVYaVnWhQqGKM+99KVMKQ==
X-Google-Smtp-Source: ABdhPJx+oLREy2MEP4i38p4C0DPnpsBKaRXa8nNl51YGg+o15yDeZY7FHVhLp7tVpgbhzHzQwIetBw==
X-Received: by 2002:a1c:1941:0:b0:38b:4af1:49f8 with SMTP id 62-20020a1c1941000000b0038b4af149f8mr25886614wmz.156.1649608273504;
        Sun, 10 Apr 2022 09:31:13 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l6-20020a1c2506000000b0038e6fe8e8d8sm20616139wml.5.2022.04.10.09.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 09:31:12 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     robert.foss@linaro.org, hfink@snap.com, jgrahsl@snap.com,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org,
        bryan.odonoghue@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH 1/2] media: dt-bindings: imx412: Add regulator descriptions
Date:   Sun, 10 Apr 2022 17:31:08 +0100
Message-Id: <20220410163109.3501513-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410163109.3501513-1-bryan.odonoghue@linaro.org>
References: <20220410163109.3501513-1-bryan.odonoghue@linaro.org>
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

The imx412 like many I2C camera sensors has three voltage rails which
depending on platform may be necessary to switch power onto directly.

Add in as optional rails so as not to break anything for existing users.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/media/i2c/sony,imx412.yaml   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index afcf70947f7e..16869a91ec9a 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -32,6 +32,18 @@ properties:
     description: Clock frequency 6MHz, 12MHz, 18MHz, 24MHz or 27MHz
     maxItems: 1
 
+  dovdd-supply:
+    description:
+      Definition of the regulator used as interface power supply.
+
+  avdd-supply:
+    description:
+      Definition of the regulator used as analog power supply.
+
+  dvdd-supply:
+    description:
+      Definition of the regulator used as digital power supply.
+
   reset-gpios:
     description: Reference to the GPIO connected to the XCLR pin, if any.
     maxItems: 1
-- 
2.35.1

