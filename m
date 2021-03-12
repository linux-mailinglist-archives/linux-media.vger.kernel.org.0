Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED9493394EE
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbhCLRaB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:30:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232834AbhCLR3e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:34 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1CDC061761
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:34 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id k8so2201159wrc.3
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H+VWOzX67+CEjyIdRpA0ujBUTlfl5OrO0AA2YdHipuU=;
        b=mM19z4gyGVmoJQgOPOL3LtyrsrXFCUog79ECvDECuO0J6xLzCKAXkq8EgKxyMuQhan
         vSAgum4M7EH46L90EAHiQ3eTUUbbukcXHP5Gzn7LXTJRoosRY6lGLDs5uq+nry2SCNCU
         UE+LiyStqY+wYXjAIMQFlLXS70tQ9DFxb1GJO+y+eCQWPsL04UWfmadRGtmnQ2BzWngi
         P7uJfIQiYXuTakuwkZ90Sy3jePAYFCD1SMMBDahKzBhzdwz51pNfaGSuQZA7Zi2d5E1K
         4FGss8rpli7Kff+mV8xKUR09uN2uC7U4E5PVVR3n+yoa30q418smgdIQSJJiNLKzvYt5
         i5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H+VWOzX67+CEjyIdRpA0ujBUTlfl5OrO0AA2YdHipuU=;
        b=cmAmRChGIPAOqdRPzSOJyuRJNDZwJCfBtZZEdDS8esrImS1yh2TcJo6ZGeWZKXBepP
         AtuxDLmnUyIaZ5dgcpEOmOuUGi0Y97fTzEZRrb0g/T8KRkQoEc8Pfz55h+4eSCIK06d5
         YtaFwf9ebOM49DZRg0iG5uQKQs9bugQ7FFRuU4X7yQNO/Gb62QLvaRT48ZyZVmYfLsjp
         Bis/J1NLFsPXuCyx/xSKOVhlxq61N5U49pqn2hCChGUTy2G2bOWTrKsNc7n9/Olbs5sX
         nivYGMsjxkFDaZ3FyUoEpKeGJKJQrOIcJMQiXn45lN/FUxJt8n6yWcowU9BptbRisezx
         khJg==
X-Gm-Message-State: AOAM530Xf+eDJ2+gJlWwkhuArGbRIixo+52gbeb+v+D0VhNGpJWdXJC/
        HelVNFbw17CiU9ykNvJrMKoshQ==
X-Google-Smtp-Source: ABdhPJzyxsGnagBqaGVi977ydCKKdQ5pYkOAhhVCPN6AVDRqnye6KZL9A9IuwhDKwD/0WaimS2pzWA==
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr15369274wrw.334.1615570172914;
        Fri, 12 Mar 2021 09:29:32 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:32 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 21/25] media: venus: helpers: Add internal buffer list for v6
Date:   Fri, 12 Mar 2021 17:30:35 +0000
Message-Id: <20210312173039.1387617-22-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

- Internal buffers required by v6 are different than v4,
  add new list of internal buffers for v6.
- Differentiate encoder/decoder buffers for 6xx

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c    | 13 ++++++++++++-
 drivers/media/platform/qcom/venus/hfi_helper.h |  9 ++++++---
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 2515a2225614..8b08632b0296 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -279,13 +279,24 @@ static const unsigned int intbuf_types_4xx[] = {
 	HFI_BUFFER_INTERNAL_PERSIST_1,
 };
 
+static const unsigned int intbuf_types_6xx[] = {
+	HFI_BUFFER_INTERNAL_SCRATCH(HFI_VERSION_6XX),
+	HFI_BUFFER_INTERNAL_SCRATCH_1(HFI_VERSION_6XX),
+	HFI_BUFFER_INTERNAL_SCRATCH_2(HFI_VERSION_6XX),
+	HFI_BUFFER_INTERNAL_PERSIST,
+	HFI_BUFFER_INTERNAL_PERSIST_1,
+};
+
 int venus_helper_intbufs_alloc(struct venus_inst *inst)
 {
 	const unsigned int *intbuf;
 	size_t arr_sz, i;
 	int ret;
 
-	if (IS_V4(inst->core)) {
+	if (IS_V6(inst->core)) {
+		arr_sz = ARRAY_SIZE(intbuf_types_6xx);
+		intbuf = intbuf_types_6xx;
+	} else if (IS_V4(inst->core)) {
 		arr_sz = ARRAY_SIZE(intbuf_types_4xx);
 		intbuf = intbuf_types_4xx;
 	} else {
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 6b524c7cde5f..f367f43c9fb7 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -395,11 +395,14 @@
 #define HFI_BUFFER_INTERNAL_PERSIST		0x4
 #define HFI_BUFFER_INTERNAL_PERSIST_1		0x5
 #define HFI_BUFFER_INTERNAL_SCRATCH(ver)	\
-	(((ver) == HFI_VERSION_4XX) ? 0x6 : 0x1000001)
+	(((ver) == HFI_VERSION_4XX ||		\
+	(ver) == HFI_VERSION_6XX) ? 0x6 : 0x1000001)
 #define HFI_BUFFER_INTERNAL_SCRATCH_1(ver)	\
-	(((ver) == HFI_VERSION_4XX) ? 0x7 : 0x1000005)
+	(((ver) == HFI_VERSION_4XX ||		\
+	(ver) == HFI_VERSION_6XX) ? 0x7 : 0x1000005)
 #define HFI_BUFFER_INTERNAL_SCRATCH_2(ver)	\
-	(((ver) == HFI_VERSION_4XX) ? 0x8 : 0x1000006)
+	(((ver) == HFI_VERSION_4XX ||		\
+	(ver) == HFI_VERSION_6XX) ? 0x8 : 0x1000006)
 #define HFI_BUFFER_EXTRADATA_INPUT(ver)		\
 	(((ver) == HFI_VERSION_4XX) ? 0xc : 0x1000002)
 #define HFI_BUFFER_EXTRADATA_OUTPUT(ver)	\
-- 
2.30.1

