Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 498A048876B
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 03:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235116AbiAICrI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jan 2022 21:47:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235097AbiAICrF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Jan 2022 21:47:05 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45D3C061401
        for <linux-media@vger.kernel.org>; Sat,  8 Jan 2022 18:47:04 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id r9so17737451wrg.0
        for <linux-media@vger.kernel.org>; Sat, 08 Jan 2022 18:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NN+qWCSZGy/v8XPK3GfGhOOy6vI+oH7th5UvnDASdeQ=;
        b=G4wydvmhsMtwEXblMclU4FB3nnA+Ese5Pu+NQ0o2lTvXMcypQwzoWcrvHajhRIlCUU
         oaktWengCEVd/+JTUGQHk3SX+lsGbIf3DdCPd9yCLreIEcgOVm1tZNlv9Q0+59ILOIUx
         maGvsnhMPKXaW6Xhq4pn6kcxQmqObu5NdX1NMgKmwMF+wjuvnXjKJ4Xswv+GMvCPANfX
         FGlJxxqR2FV6doIQHYB4+1kGpAaQ1EdRQxLyX0KF6Wl2tFa0P85pRk1B85ggLyLIO3Jn
         hBPp3Sk99s/vqZMjUc0BLqncBYQjaK8J6U++qavEx3A9lnFclRB5EU2s2t0WdqoGtUoN
         EbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NN+qWCSZGy/v8XPK3GfGhOOy6vI+oH7th5UvnDASdeQ=;
        b=5sTKXA415nl0Qd7E7dELZRRN+k4WAuasa6kiMfmOtsEPiCLRdbQj+VdGziVllImD41
         QNBXxJ0wTugmSuWPgZmTGkVl0E4+vkc6u+wG7KCk36sXqFTV5xGkcdWSYwS2w9u5hRtO
         jm9BKVyfWTz93DQjg9mtQuePSungwm4WHsBaFdz9SH0MzAHi4gwigdQ6KVPGrI8/Q/bu
         CLmYbebnbp2Jh4LjXSO/FUPkxV8Sfh0c257oRZqvS+tAAp8Q66URgvAxo8TNKJLeN/2y
         mhhANUz7yAbuwqKCf/QrTEzzjzIZRVmLEkl4CNzGl/L+o1KzGKx33uALQizrAenFa2FC
         JPxQ==
X-Gm-Message-State: AOAM530n/LCnoaRtXJEzLjNx50Ix7qXqyt7XTmZOYN1SqXeHw4hXwMjU
        C1DA57lM93biXL5BeQZ8IST9NQ==
X-Google-Smtp-Source: ABdhPJw/T5mXUPSCkjZK/erWzsqn7AJxaU27D5ezP5+PMEPL4njH1YDAzj6kOAJs60p3dMn0fQsSmA==
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr9019527wrn.290.1641696423489;
        Sat, 08 Jan 2022 18:47:03 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l13sm3341748wrs.73.2022.01.08.18.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 18:47:03 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org,
        devicetree@vger.kernel.org, robh@kernel.org
Subject: [PATCH v2 2/8] media: dt-bindings: media: camss: Add vdda supply declarations sm8250
Date:   Sun,  9 Jan 2022 02:49:04 +0000
Message-Id: <20220109024910.2041763-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
References: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add in missing vdda-phy-supply and vdda-pll-supply declarations. The
sm8250 USB, PCIe, UFS, DSI and CSI PHYs use a common set of vdda rails.
Define the CSI vdda regulators in the same way the qmp PHY does.

Cc: devicetree@vger.kernel.org
Cc: robh@kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,sm8250-camss.yaml           | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index af877d61b607d..07a2af12f37df 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -265,6 +265,14 @@ properties:
       - const: vfe_lite0
       - const: vfe_lite1
 
+  vdda-phy-supply:
+    description:
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
+
 required:
   - clock-names
   - clocks
@@ -277,6 +285,8 @@ required:
   - power-domains
   - reg
   - reg-names
+  - vdda-phy-supply
+  - vdda-pll-supply
 
 additionalProperties: false
 
@@ -316,6 +326,9 @@ examples:
                         "vfe_lite0",
                         "vfe_lite1";
 
+            vdda-phy-supply = <&vreg_l5a_0p88>;
+            vdda-pll-supply = <&vreg_l9a_1p2>;
+
             interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.33.0

