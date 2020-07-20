Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4355C225823
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 09:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgGTHHq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 03:07:46 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:12338 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726307AbgGTHHq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 03:07:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595228865; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=yXX+zDjtzoUhuag45GK9cAM42D+4eQLi+FQrdJPM7bk=; b=Xzutq3nJbm4I+NTZFh+7vYB5bSecoG27xHJJJF1SB6tzG5YNJcMYdO0MYVEv0x8ExT8bHfRL
 sy/i5iXZ+drA0JogpZiVUDUaKmIxWXztFai1wj4dfST6R4ECQc8Em0ZVMs7QbDHVVUVYr+n/
 kdKa/wIIZ9AGjVfRkz21Wv8jEFY=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f1542c1b35196d59d2c1ee9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 07:07:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EC1A0C433C9; Mon, 20 Jul 2020 07:07:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E182BC433CA;
        Mon, 20 Jul 2020 07:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E182BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 1/4] dt-bindings: media: venus: Add an optional power domain for perf voting
Date:   Mon, 20 Jul 2020 12:37:19 +0530
Message-Id: <1595228842-9826-2-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595228842-9826-1-git-send-email-rnayak@codeaurora.org>
References: <1595228842-9826-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Venus needs to vote for the performance state of a power domain (cx)
to be able to support DVFS. This 'cx' power domain is controlled by
rpmh and is a common power domain (scalable) not specific to
venus alone. This is optional in the sense that, leaving this power
domain out does not really impact the functionality but just makes
the platform a little less power efficient.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml    | 6 +++++-
 Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index 55f2d67..04e303b 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -25,12 +25,16 @@ properties:
     maxItems: 1
 
   power-domains:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   power-domain-names:
+    minItems: 2
+    maxItems: 3
     items:
       - const: venus
       - const: vcodec0
+      - const: cx
 
   clocks:
     maxItems: 5
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
index 157dff8..90013d4 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
@@ -25,13 +25,17 @@ properties:
     maxItems: 1
 
   power-domains:
-    maxItems: 3
+    minItems: 3
+    maxItems: 4
 
   power-domain-names:
+    minItems: 3
+    maxItems: 4
     items:
       - const: venus
       - const: vcodec0
       - const: vcodec1
+      - const: cx
 
   clocks:
     maxItems: 7
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

