Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDFB35297A
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235174AbhDBKFq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234626AbhDBKFk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:40 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC642C06178C
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:39 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id o16so4331736wrn.0
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b46nTbsZeh6iAZ6HbCYVxnlS3c8ZIKectHfSK1nlNZU=;
        b=Txmm2M/Uvq/RjX25n3ccoHvfLHBzOJtNvk/wxa2+pz6ca52d7kKZZ0SLLEIOOEjNXk
         mn8jCwoeLl29tDGmP+FnwwqebL2tOoo/qegfqhxDEECCPQviAU/I2msSbpyvQ7Fvy5dH
         9JegzgApLACjcoc1tV/tMjE7PKZ6rnVMQ4fVPlxFWDU2owk6BgqGb7aaR9WAj7bH2QZx
         BwYALDGOKVYLpEuEFnZiAbHci1wn8S6XEnJ+p32DjaDqzX20mbd2+fl2OaojeYIU3Lqi
         erIg3P7TeDJ6nZRwjs+6Drnzk7KmLo3A/qfdOduzJYpQ0lIExXRNVwWNCKaGy74K5nom
         PtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b46nTbsZeh6iAZ6HbCYVxnlS3c8ZIKectHfSK1nlNZU=;
        b=Jd3809C1CjfwhnJB0A2GiwhmArvWAlXmvLGzKwNhqEAZmSkKBV4wMHg7ai5XZLIlAg
         kgG5E4i5pdwfOxSGQc+acwTMJBZuGt/0ydTc+vos8eLASdUznbk/QtidsSLTc2NvU0cC
         j0fg9DY9BkeadtFOmM+uePkDJOZZKmD0oanlhZ2XpuVj8G5QzrYKxX5JA/PwRE4sB9lW
         POn4Fa9y1oDudk64dsQHGLmCEbJd+wy9FswP9jiJyYAMdXs5ypzKYsk6lQ/KvNO3OsmS
         +bdR5irBOOwO8GMvRq4lQslBb7lpoBUKi/tLqIRuAdp+JowxaVlWHbJt3VUE13J3OwWr
         Wgkg==
X-Gm-Message-State: AOAM530oayqZM7LGvx8gOEdISmw5crUwpEBTsyhoalMNdhATMMhEMgZ+
        n5yuCgGGnLTSHH77MZ436N3ehg==
X-Google-Smtp-Source: ABdhPJx+By/3uU6xnJLHZlv7nzadMqu30Y73RgvnxX5ec1pGT03Nj6hUWDE8MyjPEm7KkIR5SjU9lw==
X-Received: by 2002:adf:e843:: with SMTP id d3mr14758931wrn.56.1617357938402;
        Fri, 02 Apr 2021 03:05:38 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:38 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 21/25] media: venus: helpers: Add internal buffer list for v6
Date:   Fri,  2 Apr 2021 11:06:44 +0100
Message-Id: <20210402100648.1815854-22-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
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
 drivers/media/platform/qcom/venus/helpers.c         | 13 ++++++++++++-
 drivers/media/platform/qcom/venus/hfi_helper.h      |  9 ++++++---
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c    |  4 ++--
 3 files changed, 20 insertions(+), 6 deletions(-)

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
diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
index d43d1a53e72d..776581b99cd3 100644
--- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
@@ -1233,7 +1233,7 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
 	} else if (buftype == HFI_BUFFER_INTERNAL_PERSIST_1) {
 		bufreq->size = dec_ops->persist1();
 	} else {
-		return -EINVAL;
+		bufreq->size = 0;
 	}
 
 	return 0;
@@ -1301,7 +1301,7 @@ static int bufreq_enc(struct hfi_plat_buffers_params *params, u32 buftype,
 	} else if (buftype == HFI_BUFFER_INTERNAL_PERSIST) {
 		bufreq->size = enc_ops->persist();
 	} else {
-		return -EINVAL;
+		bufreq->size = 0;
 	}
 
 	return 0;
-- 
2.30.1

