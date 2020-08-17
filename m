Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12233245FFB
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 10:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbgHQI15 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 04:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728406AbgHQI1u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 04:27:50 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51166C061343
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 01:27:49 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 9so12515290wmj.5
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 01:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dHHx8tCCD/f7cY2UrgoF5DI2HEp6u7sbKILLzlEPxJo=;
        b=I1AE04mm3Cu7IVOIi8qpjZg6MCi5n70hUykAwGaeJFE7bwTb1gQIAVIHzAEv+Y5Omw
         RgkVQw4b5L5iE8LKIL7w01TK18n0Ok1yjMshCjuYyWy0LDrw0ZsaQo8TfFAmVNpxY1tH
         Jm+2/+r+1CQygJMbY13/L1uQGIz5EhYgNSN3Il0PbNQnO13KFO4TlExBROgkRBXhTCJF
         joeA2bowB5XNZJKTSt/puj/2resoPZsPs33XpWLXO0gzTkPQoMru2iaMbszx+kjWKAwe
         vx/b2t17P5kYM0HlbPra4N5Pxr/TZ/Do62wZQDPDy1P1yYu2JTZAAMWYEKaS4Pv9d6hH
         DWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dHHx8tCCD/f7cY2UrgoF5DI2HEp6u7sbKILLzlEPxJo=;
        b=Cjh/4sORSDR1E55Usf0A/SuPlCtFRJxSRYbkRcUtMfEGtkV+MHFWwnRd08YWc4R/BW
         2Z8o8/AvAYi0UhVGVwOhpKtKvEFSKw3f9Siu7zxNvs4YOpbL1BNhVLMRsuqakrQlHUkI
         KY7aiUH3SC5UsSKQ6PzY/4ibJJ7lbe0p6fJS1bE0ceg4ZaSUO8n0bL9gCCjrRyxkaI9x
         4yDioP9jVSMY1HehuY7FQHw8LQ4X/ocy0uO5IPvFxIgpjW1t8jf2H4cPVMT+/AS+hGbB
         gR7Q41izQd/0dXsVdveHxSOEgJrp6mz0iAEEouQTCxFt8mfjRvdee0Kto1CQENV12PJm
         qSPw==
X-Gm-Message-State: AOAM530DF24gI4qyXJuOtyfFNAJTYnCkDH/zLG/AtB+YLndkzU58528h
        Z0Gm9rQhMij4Hhkh2tx5oQCHqw==
X-Google-Smtp-Source: ABdhPJygsWhnExsJ/xP1fb11YBvOMxcj7El2Fr8xMQQ66XknjoVoYJbBPz4hWT/idFpM2qhQ3mVQ2A==
X-Received: by 2002:a05:600c:202:: with SMTP id 2mr12754388wmi.147.1597652868062;
        Mon, 17 Aug 2020 01:27:48 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id h5sm33270888wrc.97.2020.08.17.01.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:27:47 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Elliot Berman <eberman@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 1/2] firmware: qcom_scm: Add memory protect virtual address ranges
Date:   Mon, 17 Aug 2020 11:27:22 +0300
Message-Id: <20200817082723.17458-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817082723.17458-1-stanimir.varbanov@linaro.org>
References: <20200817082723.17458-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds a new SCM memprotect command to set virtual address ranges.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/firmware/qcom_scm.c | 24 ++++++++++++++++++++++++
 drivers/firmware/qcom_scm.h |  1 +
 include/linux/qcom_scm.h    |  8 +++++++-
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 0e7233a20f34..dec8dc42a6bc 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -757,6 +757,30 @@ int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
 }
 EXPORT_SYMBOL(qcom_scm_iommu_secure_ptbl_init);
 
+int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
+				   u32 cp_nonpixel_start,
+				   u32 cp_nonpixel_size)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_VIDEO_VAR,
+		.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_VAL, QCOM_SCM_VAL,
+					 QCOM_SCM_VAL, QCOM_SCM_VAL),
+		.args[0] = cp_start,
+		.args[1] = cp_size,
+		.args[2] = cp_nonpixel_start,
+		.args[3] = cp_nonpixel_size,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	struct qcom_scm_res res;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+
+	return ret ? : res.result[0];
+}
+EXPORT_SYMBOL(qcom_scm_mem_protect_video_var);
+
 static int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 				 size_t mem_sz, phys_addr_t src, size_t src_sz,
 				 phys_addr_t dest, size_t dest_sz)
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index d9ed670da222..14da834ac593 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -97,6 +97,7 @@ extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 #define QCOM_SCM_MP_RESTORE_SEC_CFG		0x02
 #define QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE	0x03
 #define QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT	0x04
+#define QCOM_SCM_MP_VIDEO_VAR			0x08
 #define QCOM_SCM_MP_ASSIGN			0x16
 
 #define QCOM_SCM_SVC_OCMEM		0x0f
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index 3d6a24697761..ba45537f688b 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -77,11 +77,13 @@ extern bool qcom_scm_restore_sec_cfg_available(void);
 extern int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
 extern int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
 extern int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
+extern int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
+					  u32 cp_nonpixel_start,
+					  u32 cp_nonpixel_size);
 extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 			       unsigned int *src,
 			       const struct qcom_scm_vmperm *newvm,
 			       unsigned int dest_cnt);
-
 extern bool qcom_scm_ocmem_lock_available(void);
 extern int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset,
 			       u32 size, u32 mode);
@@ -128,6 +130,10 @@ static inline int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
 		{ return -ENODEV; }
 static inline int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
 		{ return -ENODEV; }
+extern inline int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
+						 u32 cp_nonpixel_start,
+						 u32 cp_nonpixel_size)
+		{ return -ENODEV; }
 static inline int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 		unsigned int *src, const struct qcom_scm_vmperm *newvm,
 		unsigned int dest_cnt) { return -ENODEV; }
-- 
2.17.1

