Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75EC9488767
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 03:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235094AbiAICrF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jan 2022 21:47:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235100AbiAICrE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Jan 2022 21:47:04 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC6D4C061401
        for <linux-media@vger.kernel.org>; Sat,  8 Jan 2022 18:47:03 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id k18so19452530wrg.11
        for <linux-media@vger.kernel.org>; Sat, 08 Jan 2022 18:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZhVNeBs7vzyROSZpuaXTYGD6xm3M8v73/QT84NJecB8=;
        b=ciMo0djpXFXBlackzsTMPliC28rb6byUGCUJp01rgrVj4PYlSXt4v7yCmh4bKfk2r6
         tvZIcT/hYKYodpwqXJ9nUd8KGaYXYbpO9SwbBet2F1b0hmpsHm5pEyY1I/lF27R2UEMw
         zhim6znrmafogvpr9FQrxZfrXkswgRmfoiUeEiMsokaI81Ty+ZTu2tD3FsXUlu8dWT+Q
         ht50ZYJUkq+NTXd9JZvUGCxFKR3YObvEXUsC6vFBOXsMJ5Z4plP+Mf8RaTHNE8hJG1Uc
         l1AiuVt0YHXl3nCKZyDM3y2mN2IBrcYBTfodNMLh5DRp2ouwkeEQRe8YMx6ekZNpjk6Z
         hOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZhVNeBs7vzyROSZpuaXTYGD6xm3M8v73/QT84NJecB8=;
        b=C880bHpseVfe5BLLdH6+4sKlz1DZm8PVajWXFIkNTjv+s6V6DPH2yt6HO0fs/sV3/f
         yoYUvgrdsXhaWcI3R2k6tyhf6PtrFigrDBcWSClLwnfL1B2ufFRTvvkjJS1nmPHqaZ12
         p6NJOHmx/p1m2MeW1DeGoCRvvOZ1w+X7o4VauJ9x3PD15upriiCaDuxZG1pBKXifUs7p
         mlEfb9IQRS9Wyts/UagBDGiQPAacTgsK1dSIfHFN8pnk+2knOCRFVVVW0b4n2UpKisxw
         nOd6HiHVPHyD56kI2mzxH0GE6qn3kGWkGZMccrBNwIooapgdEDjENttbQWOo55yi0v+1
         oXvg==
X-Gm-Message-State: AOAM533tAfwPOzzOysIW/ZdO/YudaueGCgSod/kh90Eg/VkGw9BIXy8h
        hgaGtNI2lvAP4117Tr4ySouTPg==
X-Google-Smtp-Source: ABdhPJwY30Ib6h3mW2+HA2MZmdHyS2szKOqpIHzgIJZ2Ek6wEVXfTxOQZXvjWBTTeBHjzmF5XVfFRQ==
X-Received: by 2002:adf:f90c:: with SMTP id b12mr53550210wrr.123.1641696422424;
        Sat, 08 Jan 2022 18:47:02 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l13sm3341748wrs.73.2022.01.08.18.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 18:47:02 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org,
        devicetree@vger.kernel.org, robh@kernel.org
Subject: [PATCH v2 1/8] media: dt-bindings: media: camss: Fixup vdda regulator descriptions sdm845
Date:   Sun,  9 Jan 2022 02:49:03 +0000
Message-Id: <20220109024910.2041763-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
References: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If we review the schematic for RB3 Thundercomm document Turbox-845 we see
that the CAMSS CSI PHY has the same basic power-rail layout as UFS, PCIe
and USB PHYs.

We should therefore have two regulator declarations as is the case for UFS,
PCIe and USB.

Cc: devicetree@vger.kernel.org
Cc: robh@kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,sdm845-camss.yaml          | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index 9ca5dfa7f2260..ae0642b9ae5ec 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -203,9 +203,13 @@ properties:
       - const: vfe1
       - const: vfe_lite
 
-  vdda-supply:
+  vdda-phy-supply:
     description:
-      Definition of the regulator used as analog power supply.
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
 
 required:
   - clock-names
@@ -217,7 +221,8 @@ required:
   - power-domains
   - reg
   - reg-names
-  - vdda-supply
+  - vdda-phy-supply
+  - vdda-pll-supply
 
 additionalProperties: false
 
@@ -361,7 +366,8 @@ examples:
           "vfe1",
           "vfe_lite";
 
-        vdda-supply = <&reg_2v8>;
+        vdda-phy-supply = <&vreg_l1a_0p875>;
+        vdda-pll-supply = <&vreg_l26a_1p2>;
 
         ports {
           #address-cells = <1>;
-- 
2.33.0

