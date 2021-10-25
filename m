Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 460A04393C5
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 12:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbhJYKf5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 06:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232880AbhJYKf5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 06:35:57 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F73C061745
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 03:33:34 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id r4so16176556edi.5
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 03:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gtXEbVNAEMP2fIX0FN1mTXTkNu2gxV03Z7XtTW5qZGI=;
        b=lud7xTvvv7SSrJ4ZVXj4n3sTCtB3XgEGe/pZjUgBinjzWS0BK3cVapFx5YDEAOqYdy
         OMa5Cswx0p19NFK5dFDY8h/nfxMLZKPq+LncN10pzMOoxAvrgPjr0+Mfkdrznsl+LTGL
         Tj2t99Iarp1TbcuSis/PKVBrMlZFmdBPkXKPdbRzq0rGGB1ZqRQIKhk90sE6k72oQNEw
         CLV8p+aKFkVG0+RQAUuW+XhO6iM8GH2ElYoJsuYq5pmxXbbz1h5YtjqjMabev06tPD+6
         JVPxw/g9j/9yZ4EmPTdFkZiByNfACqahmBxslZPO7SVk88NKbs52svQAMHcxu4eQcPMO
         nFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gtXEbVNAEMP2fIX0FN1mTXTkNu2gxV03Z7XtTW5qZGI=;
        b=7DcJD7rjiH2n6a6UziYqCzxNSsMfw5osjxOSrFnwdPbqKnrQqWqdI9rCyK7JSu5gLH
         x+4fOjVFd4tJ34WSbHDCXHAKu/9cYiW/a0MMsRLs+HK/OCql5SA8EQJpj/4Nii06DWEp
         m0ChzlFsdva5Dp4Q/muXlO26YO0MEkyZmnYCrD3rbrmtpDgrKvPtQ7mCCVA9gtTNIDOF
         qOaL+vV5WY7C8C1uQNPCpViH2WNqnWfpri4RMsWWzlLvJenPHEj20HnSt5Vb83glpJn0
         oRMCPDVui/Z6NPBQ10KSGuSS2fFc5MOYR50ixRzP0xSGfDiNBahS2ZlGX3L4+rHTMnI3
         BzQQ==
X-Gm-Message-State: AOAM533BIcHa26FGJ6n1++jg44Tu619ZdcJo03uQuv6bM5AwwyxB5whV
        4TLFlpM6KQwlWVrF/PaZ7FqGpg==
X-Google-Smtp-Source: ABdhPJxyz8wed5e9lJ191A1Sw4zknkZdq0E6LTsECxkZVJ5Wcllj8LVVRVx/s+8UcU0o7+aWqpzimw==
X-Received: by 2002:a17:907:7b9e:: with SMTP id ne30mr5200109ejc.531.1635158013466;
        Mon, 25 Oct 2021 03:33:33 -0700 (PDT)
Received: from localhost.localdomain (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id k23sm8562822edv.22.2021.10.25.03.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 03:33:33 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v1 1/2] media: dt-bindings: media: camss: sdm845: Make clock-lanes property const
Date:   Mon, 25 Oct 2021 12:33:21 +0200
Message-Id: <20211025103322.160913-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mistakenly only one out of four CSI ports had the clock-lane marked as
const.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../devicetree/bindings/media/qcom,sdm845-camss.yaml     | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index 9ca5dfa7f226..d8fb6ce1d7f9 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -106,7 +106,8 @@ properties:
 
             properties:
               clock-lanes:
-                maxItems: 1
+                items:
+                  - const: 7
 
               data-lanes:
                 minItems: 1
@@ -153,7 +154,8 @@ properties:
 
             properties:
               clock-lanes:
-                maxItems: 1
+                items:
+                  - const: 7
 
               data-lanes:
                 minItems: 1
@@ -176,7 +178,8 @@ properties:
 
             properties:
               clock-lanes:
-                maxItems: 1
+                items:
+                  - const: 7
 
               data-lanes:
                 minItems: 1
-- 
2.30.2

