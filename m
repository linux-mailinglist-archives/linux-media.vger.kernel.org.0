Return-Path: <linux-media+bounces-2985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A391F81DB38
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 16:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7F491C2159A
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 15:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE8A14F6B;
	Sun, 24 Dec 2023 15:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PqzgX+HO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB3010A38
	for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 15:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a2345aaeb05so357466366b.0
        for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 07:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703432679; x=1704037479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bB5P1aRSNpWIuuX+zo5w+ihjvQ+Oy95yE9zNnTm6uhU=;
        b=PqzgX+HOMbm4RrJ1JbVLALs/0o0Jfdd8cIVSaTmNSfXOC5DkBNEi50cnTpPYL76hLF
         YoZ56CTipo21wWX7Ssdvrzu2HIKtUikaL3L4egvPx2cJxazrAmWI/ydntiRntlPKoyLy
         HLFc/y9jemvC9lf41oeyqk7F1kW1S5fwCXcJKhvq+SGXOY9XOhp5S08z6Wqsap3fUo95
         whUNb40Rmxj7dLoUGTsgzwjN8np3LcEknf3LkbBXhLZrrbFdYOc5FYm6v3txvmr01JtC
         7xjKYS9GIug1x9VdCnoMVpjWddgOoIvNNFRaDARWYQC0eVwUXD42uXxLSF3iGyDrJxEu
         MMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703432679; x=1704037479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bB5P1aRSNpWIuuX+zo5w+ihjvQ+Oy95yE9zNnTm6uhU=;
        b=JCM10B+XMBJMB7F7g2VCJ7TxyYVdLNo32vfbGHS2X6mbtT3aCXes4ZEtM30vaAi8Xk
         joCur4anWYSmXFXXkXA38YHHeTFzmxYMkfq+FTeuoCx8zHoMhaDgkHmDDjPzN6AKMtFq
         pJ0VY6TMz4rTk1qZSBQtfW/0G269ot8gd8VBsub3expQqdUYfL2UkEq59HfX6xbZbY5k
         ZNVGHEwXdZKxIhNs419gPgA2E0/LqM5zGEW3auJPr7L4iLsZGAmpft/bCFqbDwmPkwLx
         JNRHr4jc69z9hgDQOgfuygTYi4fGX/7PtcVbVIeIX4BCi9PzVIk4pR4tO2oaso3onevN
         HJuw==
X-Gm-Message-State: AOJu0YwbfQFMEncYKNRUrWN9As86sHWHC58c+LafBO1CQ8rsjq1/oZ+r
	szBendYF6PCD/k8epTBwKjzR3zgKoWTYBA==
X-Google-Smtp-Source: AGHT+IE3IwxCSoLG3da3FmkL17i0iJicpSX61cBEK5nLjXw7pKwvspI2EWPB1zDxavjrFOIhOojSIg==
X-Received: by 2002:a17:906:57c4:b0:a1f:9f48:6cbf with SMTP id u4-20020a17090657c400b00a1f9f486cbfmr1463631ejr.92.1703432679492;
        Sun, 24 Dec 2023 07:44:39 -0800 (PST)
Received: from [127.0.1.1] ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id ge12-20020a170907908c00b00a26ac403032sm3325901ejb.65.2023.12.24.07.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 07:44:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 24 Dec 2023 16:44:07 +0100
Subject: [PATCH 08/15] media: s5p-mfc: constify s5p_mfc_hw_ops structures
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231224-n-s5p-mfc-const-v1-8-a3b246470fe4@linaro.org>
References: <20231224-n-s5p-mfc-const-v1-0-a3b246470fe4@linaro.org>
In-Reply-To: <20231224-n-s5p-mfc-const-v1-0-a3b246470fe4@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Aakarsh Jain <aakarsh.jain@samsung.com>, linux-fsd@tesla.coma, 
 linux-samsung-soc@vger.kernel.org, 
 Smitha T Murthy <smithatmurthy@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4347;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uQAmb+g3KeDVt3o+p0dQ4AcE1+B7a7naXcwp4q77ZiI=;
 b=owEBfgKB/ZANAwAKAcE3ZuaGi4PXAcsmYgBliFHV91xKfyDQA9sClD71SzcHsxzDNAIYBudkm
 +0DIyGSqyeJAkQEAAEKAC4WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZYhR1RAca3J6a0BrZXJu
 ZWwub3JnAAoJEME3ZuaGi4PXd9cP/1SDMWxyTBuAREfIFlmkGANgJHIYzaNHJS0J5D6d9RfDw+Z
 Y3ceG+f40jcX1saTlotfqGOInLzDj6Y17RTAJm4fQx/04L12lwkmhry36/uxp7Iv68vSl1HIcXP
 v68PJC9ohYAYR8BgyPm7yqPwpXbFBXDhK/hqUdQiKm983bOq10OhHgCDGjx1Rcdew+apjIH0Fjv
 kk5isY3KguAErZ7wGYp8CTYE+dGMG2GcoKFJBE2qt1hCpJ2XyvCn95mNepzyq6b814hKfWHCC4F
 99Qi+4mWkgjLddJXTPoJYqW/aPbMndSLr56LWbX3geABeAKQbmiRsDQY2YfpK28sEZJMrVI0Tga
 0TZXQ9dCbJuceTXXPdZgXdnMRNIopG1v+ozrFDjn+uwZ43KaQlQ9dolOrrmWqS+3lP8owQDxEcT
 aOsh5gX7y7zf8/pF8irEe3hOHlY3WZ4L9+3ayfLwH9ZP6rLMgGctKgtTGDxSN2HeHJlAsDO7RN1
 hepSphE2TX/Oz7E9VE3jZcPIrXOaVsNtRGM6pA/71AbOTSY9fz/qlyCSbT4IN4GRs7Ey2Em4Buo
 gvnQ/xVrGhNptjqJR9tOI3wrWpmJE82uUQUo3lbdpR+VcQOaxoB2nsdrLZXUDYLA+YpOdreu0Rz
 zLop3HG0lnGKaDrRpvUeX9JZk8+BAUprp9QLk
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Static "s5p_mfc_hw_ops" structures are not modified by the driver, so
they can be made const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h | 2 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c | 4 ++--
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.h | 2 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c | 4 ++--
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.h | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
index 9278ed537e9c..fa556f27fa06 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
@@ -338,7 +338,7 @@ struct s5p_mfc_dev {
 
 	struct s5p_mfc_priv_buf ctx_buf;
 	int warn_start;
-	struct s5p_mfc_hw_ops *mfc_ops;
+	const struct s5p_mfc_hw_ops *mfc_ops;
 	const struct s5p_mfc_hw_cmds *mfc_cmds;
 	const struct s5p_mfc_regs *mfc_regs;
 	enum s5p_mfc_fw_ver fw_ver;
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c
index 13a3ff55e547..2a0fb78e8e82 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c
@@ -1591,7 +1591,7 @@ static unsigned int s5p_mfc_get_crop_info_v_v5(struct s5p_mfc_ctx *ctx)
 }
 
 /* Initialize opr function pointers for MFC v5 */
-static struct s5p_mfc_hw_ops s5p_mfc_ops_v5 = {
+static const struct s5p_mfc_hw_ops s5p_mfc_ops_v5 = {
 	.alloc_dec_temp_buffers = s5p_mfc_alloc_dec_temp_buffers_v5,
 	.release_dec_desc_buffer = s5p_mfc_release_dec_desc_buffer_v5,
 	.alloc_codec_buffers = s5p_mfc_alloc_codec_buffers_v5,
@@ -1631,7 +1631,7 @@ static struct s5p_mfc_hw_ops s5p_mfc_ops_v5 = {
 	.get_crop_info_v = s5p_mfc_get_crop_info_v_v5,
 };
 
-struct s5p_mfc_hw_ops *s5p_mfc_init_hw_ops_v5(void)
+const struct s5p_mfc_hw_ops *s5p_mfc_init_hw_ops_v5(void)
 {
 	return &s5p_mfc_ops_v5;
 }
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.h
index b53d376ead60..0b98c619676e 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.h
@@ -78,5 +78,5 @@ enum MFC_SHM_OFS {
 	FRAME_PACK_SEI_INFO	= 0x17c, /* E */
 };
 
-struct s5p_mfc_hw_ops *s5p_mfc_init_hw_ops_v5(void);
+const struct s5p_mfc_hw_ops *s5p_mfc_init_hw_ops_v5(void);
 #endif /* S5P_MFC_OPR_H_ */
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
index 70a62400908e..6157c5f97707 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
@@ -2484,7 +2484,7 @@ const struct s5p_mfc_regs *s5p_mfc_init_regs_v6_plus(struct s5p_mfc_dev *dev)
 }
 
 /* Initialize opr function pointers for MFC v6 */
-static struct s5p_mfc_hw_ops s5p_mfc_ops_v6 = {
+static const struct s5p_mfc_hw_ops s5p_mfc_ops_v6 = {
 	.alloc_dec_temp_buffers = s5p_mfc_alloc_dec_temp_buffers_v6,
 	.release_dec_desc_buffer = s5p_mfc_release_dec_desc_buffer_v6,
 	.alloc_codec_buffers = s5p_mfc_alloc_codec_buffers_v6,
@@ -2528,7 +2528,7 @@ static struct s5p_mfc_hw_ops s5p_mfc_ops_v6 = {
 	.get_e_min_scratch_buf_size = s5p_mfc_get_e_min_scratch_buf_size,
 };
 
-struct s5p_mfc_hw_ops *s5p_mfc_init_hw_ops_v6(void)
+const struct s5p_mfc_hw_ops *s5p_mfc_init_hw_ops_v6(void)
 {
 	return &s5p_mfc_ops_v6;
 }
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.h
index e4dd03c5454c..e4b651a8d590 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.h
@@ -52,6 +52,6 @@
 
 #define FRAME_DELTA_DEFAULT		1
 
-struct s5p_mfc_hw_ops *s5p_mfc_init_hw_ops_v6(void);
+const struct s5p_mfc_hw_ops *s5p_mfc_init_hw_ops_v6(void);
 const struct s5p_mfc_regs *s5p_mfc_init_regs_v6_plus(struct s5p_mfc_dev *dev);
 #endif /* S5P_MFC_OPR_V6_H_ */

-- 
2.34.1


