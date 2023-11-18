Return-Path: <linux-media+bounces-543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B40007EFF7C
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 13:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 203E2B20E05
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 12:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E62114287;
	Sat, 18 Nov 2023 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zncfqTX3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1A910EF
	for <linux-media@vger.kernel.org>; Sat, 18 Nov 2023 04:11:49 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c523ac38fbso36513311fa.0
        for <linux-media@vger.kernel.org>; Sat, 18 Nov 2023 04:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700309508; x=1700914308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BR+YBWVQ86ytjIlOGmAW4/tQxNcN+mCsodRc3VxcTJs=;
        b=zncfqTX3Nvxwo2AFLAxC5Yn1v3ZzJvYY+M/7ID/N/OdrhcO4h6X59h4oSWXxia0srC
         jaXXK2QgP0NUeN+bW2u8TiSyGYYk7McC2iZsAp2Sw9j8036ZOZDPcihLurFbfG7HKcfg
         pZkp5MaDXMIcOj/zThyNBI0jyipETaVZ8eNXCfJR9Fs5XzXuzPLt5iU48g4QYbVnwQ9/
         fGnufvgIAbs9BNrEDZQtPIJH/CaJ+HNXpA3TlGgQBiEuY8NRXOFKU5QuynR4Wqzg5Jek
         3r9gKbhF+5vx3KyIUUV2C7gFDrbVeNk9B78eIrFXHb03m8W0auwZUXZr/OWsy059k/M/
         znBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700309508; x=1700914308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BR+YBWVQ86ytjIlOGmAW4/tQxNcN+mCsodRc3VxcTJs=;
        b=oNxHpnphNywd5o32kElpDyUCGi6a4QumylfLis1tAf5NQyfpqZHd6o37B7u4GsYrMl
         x90UC4r5MoM/0cZDFERQ5atWmTt2VOGYIq9ifflXemIj7aWP4G9faig6uVCor45U6BQ5
         P0Yr76mG0kGLly9DEOsa28/LF5yN+VretJt+f0IA8IIG0ZwZL0mdappLWLjlCdeHe5PW
         rqZyPsWkgYWLPXgC+TuEC69V4YLA89+rkSudnszele0cNV3K7/k0OdAmM9679zYIvOlP
         iA+jg7SNyb9IQyu9MsKSrrOwLA8cuvBuCfnwMhA/HqqNGwP472S7381y/Q9cmGp44zU0
         e8LQ==
X-Gm-Message-State: AOJu0YxgO/C7wYcekJGtRQyUtoPZSwYmSaBbKgCMGvBKzY9zkJBa51q9
	h0zPaDofMMTkK3K4XPjH6Wmhcw==
X-Google-Smtp-Source: AGHT+IEwFLtIvB7rdi/2cIANfML23FJgQwzpDWS30semnBmuFWv4znpRQ54wyWrQGkPPS687i3IDHQ==
X-Received: by 2002:a2e:b0f1:0:b0:2c6:edfd:658a with SMTP id h17-20020a2eb0f1000000b002c6edfd658amr1607592ljl.31.1700309508101;
        Sat, 18 Nov 2023 04:11:48 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c3b9200b00407efbc4361sm10955775wms.9.2023.11.18.04.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 04:11:47 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 18 Nov 2023 12:11:41 +0000
Subject: [PATCH v5 7/7] media: qcom: camss: Flag CSID-lites to support more
 CSIDs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231118-b4-camss-named-power-domains-v5-7-55eb0f35a30a@linaro.org>
References: <20231118-b4-camss-named-power-domains-v5-0-55eb0f35a30a@linaro.org>
In-Reply-To: <20231118-b4-camss-named-power-domains-v5-0-55eb0f35a30a@linaro.org>
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com, 
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13-dev-26615

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Some platforms such as SC7280 have 3 CSIDs and 2 CSID-lites but current
code has hardcoded 2 as the maximum number of CSIDs. Remove the hardcoded
maximum number of VFEs to handle all possible combinations of CSIDs and
CSID-lites.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-csid-gen2.c    | 31 +++++++++++-----------
 drivers/media/platform/qcom/camss/camss-csid.c     |  5 ++++
 drivers/media/platform/qcom/camss/camss-csid.h     |  7 +++++
 drivers/media/platform/qcom/camss/camss.c          |  3 +++
 4 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 05ff5fa8095a8..b11de4797ccae 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -21,7 +21,6 @@
  * interface support. As a result of that it has an
  * alternate register layout.
  */
-#define IS_LITE		(csid->id >= 2 ? 1 : 0)
 
 #define CSID_HW_VERSION		0x0
 #define		HW_VERSION_STEPPING	0
@@ -35,13 +34,13 @@
 #define	CSID_CSI2_RX_IRQ_MASK	0x24
 #define CSID_CSI2_RX_IRQ_CLEAR	0x28
 
-#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)		((IS_LITE ? 0x30 : 0x40) \
+#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)		((csid_is_lite(csid) ? 0x30 : 0x40) \
 						 + 0x10 * (rdi))
-#define CSID_CSI2_RDIN_IRQ_MASK(rdi)		((IS_LITE ? 0x34 : 0x44) \
+#define CSID_CSI2_RDIN_IRQ_MASK(rdi)		((csid_is_lite(csid) ? 0x34 : 0x44) \
 						 + 0x10 * (rdi))
-#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)		((IS_LITE ? 0x38 : 0x48) \
+#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)		((csid_is_lite(csid) ? 0x38 : 0x48) \
 						 + 0x10 * (rdi))
-#define CSID_CSI2_RDIN_IRQ_SET(rdi)		((IS_LITE ? 0x3C : 0x4C) \
+#define CSID_CSI2_RDIN_IRQ_SET(rdi)		((csid_is_lite(csid) ? 0x3C : 0x4C) \
 						 + 0x10 * (rdi))
 
 #define CSID_TOP_IRQ_STATUS	0x70
@@ -73,7 +72,7 @@
 #define			CGC_MODE_DYNAMIC_GATING		0
 #define			CGC_MODE_ALWAYS_ON		1
 
-#define CSID_RDI_CFG0(rdi)			((IS_LITE ? 0x200 : 0x300) \
+#define CSID_RDI_CFG0(rdi)			((csid_is_lite(csid) ? 0x200 : 0x300) \
 						 + 0x100 * (rdi))
 #define		RDI_CFG0_BYTE_CNTR_EN		0
 #define		RDI_CFG0_FORMAT_MEASURE_EN	1
@@ -98,32 +97,32 @@
 #define		RDI_CFG0_PACKING_FORMAT		30
 #define		RDI_CFG0_ENABLE			31
 
-#define CSID_RDI_CFG1(rdi)			((IS_LITE ? 0x204 : 0x304)\
+#define CSID_RDI_CFG1(rdi)			((csid_is_lite(csid) ? 0x204 : 0x304)\
 						+ 0x100 * (rdi))
 #define		RDI_CFG1_TIMESTAMP_STB_SEL	0
 
-#define CSID_RDI_CTRL(rdi)			((IS_LITE ? 0x208 : 0x308)\
+#define CSID_RDI_CTRL(rdi)			((csid_is_lite(csid) ? 0x208 : 0x308)\
 						+ 0x100 * (rdi))
 #define		RDI_CTRL_HALT_CMD		0
 #define			HALT_CMD_HALT_AT_FRAME_BOUNDARY		0
 #define			HALT_CMD_RESUME_AT_FRAME_BOUNDARY	1
 #define		RDI_CTRL_HALT_MODE		2
 
-#define CSID_RDI_FRM_DROP_PATTERN(rdi)			((IS_LITE ? 0x20C : 0x30C)\
+#define CSID_RDI_FRM_DROP_PATTERN(rdi)			((csid_is_lite(csid) ? 0x20C : 0x30C)\
 							+ 0x100 * (rdi))
-#define CSID_RDI_FRM_DROP_PERIOD(rdi)			((IS_LITE ? 0x210 : 0x310)\
+#define CSID_RDI_FRM_DROP_PERIOD(rdi)			((csid_is_lite(csid) ? 0x210 : 0x310)\
 							+ 0x100 * (rdi))
-#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)		((IS_LITE ? 0x214 : 0x314)\
+#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)		((csid_is_lite(csid) ? 0x214 : 0x314)\
 							+ 0x100 * (rdi))
-#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)		((IS_LITE ? 0x218 : 0x318)\
+#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)		((csid_is_lite(csid) ? 0x218 : 0x318)\
 							+ 0x100 * (rdi))
-#define CSID_RDI_RPP_PIX_DROP_PATTERN(rdi)		((IS_LITE ? 0x224 : 0x324)\
+#define CSID_RDI_RPP_PIX_DROP_PATTERN(rdi)		((csid_is_lite(csid) ? 0x224 : 0x324)\
 							+ 0x100 * (rdi))
-#define CSID_RDI_RPP_PIX_DROP_PERIOD(rdi)		((IS_LITE ? 0x228 : 0x328)\
+#define CSID_RDI_RPP_PIX_DROP_PERIOD(rdi)		((csid_is_lite(csid) ? 0x228 : 0x328)\
 							+ 0x100 * (rdi))
-#define CSID_RDI_RPP_LINE_DROP_PATTERN(rdi)		((IS_LITE ? 0x22C : 0x32C)\
+#define CSID_RDI_RPP_LINE_DROP_PATTERN(rdi)		((csid_is_lite(csid) ? 0x22C : 0x32C)\
 							+ 0x100 * (rdi))
-#define CSID_RDI_RPP_LINE_DROP_PERIOD(rdi)		((IS_LITE ? 0x230 : 0x330)\
+#define CSID_RDI_RPP_LINE_DROP_PERIOD(rdi)		((csid_is_lite(csid) ? 0x230 : 0x330)\
 							+ 0x100 * (rdi))
 
 #define CSID_TPG_CTRL		0x600
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 95873f988f7e2..d393618ed54cb 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -897,3 +897,8 @@ void msm_csid_unregister_entity(struct csid_device *csid)
 	media_entity_cleanup(&csid->subdev.entity);
 	v4l2_ctrl_handler_free(&csid->ctrls);
 }
+
+inline bool csid_is_lite(struct csid_device *csid)
+{
+	return csid->camss->res->csid_res[csid->id].is_lite;
+}
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 30d94eb2eb041..fddccb69da13a 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -215,5 +215,12 @@ extern const struct csid_hw_ops csid_ops_4_1;
 extern const struct csid_hw_ops csid_ops_4_7;
 extern const struct csid_hw_ops csid_ops_gen2;
 
+/*
+ * csid_is_lite - Check if CSID is CSID lite.
+ * @csid: CSID Device
+ *
+ * Return whether CSID is CSID lite
+ */
+bool csid_is_lite(struct csid_device *csid);
 
 #endif /* QC_MSM_CAMSS_CSID_H */
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ea0038f62b807..a0fbbfccf3b7e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -638,6 +638,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 				{ 384000000 } },
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
+		.is_lite = true,
 		.ops = &csid_ops_gen2
 	}
 };
@@ -812,6 +813,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 				{ 0 } },
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
+		.is_lite = true,
 		.ops = &csid_ops_gen2
 	},
 	/* CSID3 */
@@ -824,6 +826,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 				{ 0 } },
 		.reg = { "csid3" },
 		.interrupt = { "csid3" },
+		.is_lite = true,
 		.ops = &csid_ops_gen2
 	}
 };

-- 
2.42.0


