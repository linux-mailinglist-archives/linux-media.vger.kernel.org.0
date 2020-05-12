Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83E641CF326
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 13:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729486AbgELLNY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 07:13:24 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:27963 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728990AbgELLNX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 07:13:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589282003; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=HNMNvE1RKyVaf0z8m4G3vU23gxuWwcMYFNc8gKBsWwQ=; b=ttCu1JFSrBfLTZ2C5EqJvPnQkAFAS22BJNe7LCX/z5JuN4Nk9pWa6fi3r6Oa7+zQFWOB9wPY
 BWV2cS3RMWyvZ8ovkGxXFF3mtKoLeij/Fx1FEXtAHkuIA8Vl9CNYfMOX2aP7E9bs6uiuzaO4
 9z0AOYq604/u+WArkamNp13SeIM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eba84c7.7f0061264500-smtp-out-n02;
 Tue, 12 May 2020 11:13:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EF36AC43637; Tue, 12 May 2020 11:13:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5ECEBC433CB;
        Tue, 12 May 2020 11:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5ECEBC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH] dt-bindings: media: venus: Add an optional power domain for perf voting
Date:   Tue, 12 May 2020 16:42:46 +0530
Message-Id: <1589281966-13436-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an optional power domain which when specified can be used for
setting the performance state of Venus.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml    | 4 +++-
 Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index 764affa..d5babcd 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -25,12 +25,14 @@ properties:
     maxItems: 1
 
   power-domains:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   power-domain-names:
     items:
       - const: venus
       - const: vcodec0
+      - const: opp-pd
 
   clocks:
     maxItems: 5
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
index 8552f4a..b82321c 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
@@ -25,13 +25,15 @@ properties:
     maxItems: 1
 
   power-domains:
-    maxItems: 3
+    minItems: 3
+    maxItems: 4
 
   power-domain-names:
     items:
       - const: venus
       - const: vcodec0
       - const: vcodec1
+      - const: opp-pd
 
   clocks:
     maxItems: 7
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
