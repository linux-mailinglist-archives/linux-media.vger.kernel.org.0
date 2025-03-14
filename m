Return-Path: <linux-media+bounces-28272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBAFA621E1
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 00:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52E80880DA8
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 23:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8570D1F8BAC;
	Fri, 14 Mar 2025 23:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cwhpLoR3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792161F5616
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 23:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741995366; cv=none; b=TQLLeqpePpVpLfw68NGItK/8Bd1uMDxVnnCJk/I+w3KuJNqPwdf11l/cfgiXZHTOcCCbBIdLT3kOBumartMxA3xJcaWjUAN2WXSiijcsbgq/bQ2VHvjwTqXlxFsch0rjcvcxjTAVDJaNmMfNFmOKodgDQUZMTJtHpU/3iqJ/24s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741995366; c=relaxed/simple;
	bh=O7xWFJc5+4ujWnOHiT/qvQxKGnZsRKBl3BYu8xK4Zi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lom9EdXSympOiJhKmp0wXV2NdbFvay5mieTfI3JzQrq4SwWYGZ7CtmkbqcJzJb+N7uiWsVs/zvCPVfp7ov1fRZJtByVLv972JUutJBCt8Wj0uOmqKByghBzhm2S6tGrtOLBygk5w0zMPprh7H3EDUfDgtIjhun9FyZ1Url0EmMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cwhpLoR3; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so379497066b.1
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 16:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741995361; x=1742600161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Hc0d6eFecdsJvWli5NDhIDXrT6X3XLnxW35pcwgovo=;
        b=cwhpLoR3VulOLgsHfeNbmUMIwBWMOqDwFGMOXBmNE7H5H/AKuYU5zgEpPK0UAL3WBW
         MjNd6ZNOUEj2gPnZISXt7kyDvuymi4otwq9RE5P7eZFgHFJ17cH7uiHT5kzKumSxJAFV
         PPQFaz4O9kk5tt5bm3lwRCe0Rc628/gPzCfak3B66ncB7pTezJR23AXAsQ4ZcgrW6MZk
         92YLRtJBJSwBq0UvMiJ2tIsH/E9iteHQSlNrOZndvLB9ed+Za3E8swWwBEshkugq0bhI
         OhWxNzCLzkxa8hGzNQQbky7hpxlbKIgEik+Xmx3H4M4cNXoGyw3DraR5SJvqHy50s5+J
         /w3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741995361; x=1742600161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Hc0d6eFecdsJvWli5NDhIDXrT6X3XLnxW35pcwgovo=;
        b=KryjtxuPjuftbeWRLFVTZm4CEgWHdtuFgO0QBlTPLCVSXsuuWu9ysIg9dIxk17wKTC
         zUJV4tEi+SM/3pjOl9XIvwnWF7u+/q/BkiDtXqdv+ytMcK1LU22vS3Pu4v1AfoL3waZv
         msksBWR2rJdxANWQx2PpGeOi0cta2nqxYvON1hUGklNdKSjO35jizq33M8bo+QsSFGjv
         e6iwlIyE1vLuNJ6MxfvmANHXJeyWhAkL6nS6M78EXHiH6OQW/P6MiBd+7uAiyboKYN81
         JwXLVc0eZvraDYkQ0HEY3dQcyTSuTmXEcwa8t0OhP1n2LubvO9lT8tyxV6PyEodxnpPS
         08CA==
X-Gm-Message-State: AOJu0YzpWzoiAs0HkKAUoga1T0M8EKmKh6PpS2lHnMEINc1+fKJBSlFq
	23UP1MRjxvPZ4io3KXck5wfzwN25nsxmqXE7+O2F8wJE9YrCBGXYIOvTnF/M9Yg=
X-Gm-Gg: ASbGnctpzdoo7wXwjPTXsfQuVFnnGnKDj/qpIQAu09n8fDtSje54kQdeeGoJo7d3Ygt
	70LGt0wwpwL6p/lhgXyNuHlOsvUwfSIvEv0jBP33GInNXyVzFnVg2AcbERb4L6OlcvG8v35EH67
	DvAYOh4RfgVx+oe/Tm1HUuxGThpeJRQLCjGU1omaQqCYQQaqXnNvJhAk7PcsVOGUE1hV4SFzC6/
	dbxd9k3pldp5DQsn3KP533d5Ua03Hnzsk2jYNPmsMeyyGkIF4I1/PX0YeVKuKdwZdHwFxaIEzMr
	NHmhHAQ/hsa5qo2XITHMReu92mV22i/dQS2bXBzYzBDsajYmwTYO/63NIo4QgUy1P6J/YVI4/ZH
	qrRScORPIwfMYLut4uYo6dsYH5rNPQVLepb+PmItACrag4Zz4F5a8XkQyAghjaR5xdFGNpuObCo
	qeTEU=
X-Google-Smtp-Source: AGHT+IEhC9g8Jad94HvaXLG+3lIX4tP2GlsKy0wlQWEIgTOnPJQQ1rYcluS+cjHlemsmrncF1sU+Gg==
X-Received: by 2002:a17:907:7241:b0:ac1:e332:b1f5 with SMTP id a640c23a62f3a-ac330371508mr558125866b.37.1741995361523;
        Fri, 14 Mar 2025 16:36:01 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeadbsm284246966b.29.2025.03.14.16.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 16:36:00 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 14 Mar 2025 23:35:56 +0000
Subject: [PATCH v2 3/7] media: qcom: camss: Add CSID 680 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-3-d163d66fcc0d@linaro.org>
References: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-0-d163d66fcc0d@linaro.org>
In-Reply-To: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-0-d163d66fcc0d@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

Add CSI Decoder (CSID) 680 support to CAMSS. This version of CSID has been
shipped with SM8450 and x1e chips.

References work from Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-csid-680.c | 422 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 3 files changed, 424 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index f6db5b3b5ace3bc1cd06fd8e08a639e5a34ee4a0..71797745f2f712929f76f6b97f75457bc59e35ab 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -6,6 +6,7 @@ qcom-camss-objs += \
 		camss-csid.o \
 		camss-csid-4-1.o \
 		camss-csid-4-7.o \
+		camss-csid-680.o \
 		camss-csid-gen2.o \
 		camss-csid-780.o \
 		camss-csiphy-2ph-1-0.o \
diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
new file mode 100644
index 0000000000000000000000000000000000000000..3ad3a174bcfb8c0d319930d0010df92308cb5ae4
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -0,0 +1,422 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
+ *
+ * Copyright (C) 2020-2025 Linaro Ltd.
+ */
+#include <linux/completion.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+
+#include "camss.h"
+#include "camss-csid.h"
+#include "camss-csid-gen2.h"
+
+#define CSID_TOP_IO_PATH_CFG0(csid)				(0x4 * (csid))
+#define		CSID_TOP_IO_PATH_CFG0_INTERNAL_CSID		BIT(0)
+#define		CSID_TOP_IO_PATH_CFG0_SFE_0			BIT(1)
+#define		CSID_TOP_IO_PATH_CFG0_SFE_1			GENMASK(1, 0)
+#define		CSID_TOP_IO_PATH_CFG0_SBI_0			BIT(4)
+#define		CSID_TOP_IO_PATH_CFG0_SBI_1			GENMASK(3, 0)
+#define		CSID_TOP_IO_PATH_CFG0_SBI_2			GENMASK(3, 1)
+#define		CSID_TOP_IO_PATH_CFG0_OUTPUT_IFE_EN		BIT(8)
+#define		CSID_TOP_IO_PATH_CFG0_SFE_OFFLINE_EN		BIT(12)
+
+#define CSID_RESET_CMD						0x10
+#define		CSID_RESET_CMD_HW_RESET				BIT(0)
+#define		CSID_RESET_CMD_SW_RESET				BIT(1)
+#define		CSID_RESET_CMD_IRQ_CTRL				BIT(2)
+
+#define CSID_IRQ_CMD						0x14
+#define		CSID_IRQ_CMD_CLEAR				BIT(0)
+#define		CSID_IRQ_CMD_SET				BIT(4)
+
+#define CSID_REG_UPDATE_CMD					0x18
+
+#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)					(0xec + 0x10 * (rdi))
+#define		CSID_CSI2_RDIN_CCIF_VIOLATION				BIT(29)
+#define		CSID_CSI2_RDIN_SENSOR_SWITCH_OUT_OF_SYNC_FRAME_DROP	BIT(28)
+#define		CSID_CSI2_RDIN_ERROR_REC_WIDTH_VIOLATION		BIT(27)
+#define		CSID_CSI2_RDIN_ERROR_REC_HEIGHT_VIOLATION		BIT(26)
+#define		CSID_CSI2_RDIN_BATCH_END_MISSING_VIOLATION		BIT(25)
+#define		CSID_CSI2_RDIN_ILLEGAL_BATCH_ID_IRQ			BIT(24)
+#define		CSID_CSI2_RDIN_RUP_DONE					BIT(23)
+#define		CSID_CSI2_RDIN_CAMIF_EPOCH_1_IRQ			BIT(22)
+#define		CSID_CSI2_RDIN_CAMIF_EPOCH_0_IRQ			BIT(21)
+#define		CSID_CSI2_RDIN_ERROR_REC_OVERFLOW_IRQ			BIT(19)
+#define		CSID_CSI2_RDIN_ERROR_REC_FRAME_DROP			BIT(18)
+#define		CSID_CSI2_RDIN_VCDT_GRP_CHANG				BIT(17)
+#define		CSID_CSI2_RDIN_VCDT_GRP_0_SEL				BIT(16)
+#define		CSID_CSI2_RDIN_VCDT_GRP_1_SEL				BIT(15)
+#define		CSID_CSI2_RDIN_ERROR_LINE_COUNT				BIT(14)
+#define		CSID_CSI2_RDIN_ERROR_PIX_COUNT				BIT(13)
+#define		CSID_CSI2_RDIN_INFO_INPUT_SOF				BIT(12)
+#define		CSID_CSI2_RDIN_INFO_INPUT_SOL				BIT(11)
+#define		CSID_CSI2_RDIN_INFO_INPUT_EOL				BIT(10)
+#define		CSID_CSI2_RDIN_INFO_INPUT_EOF				BIT(9)
+#define		CSID_CSI2_RDIN_INFO_FRAME_DROP_SOF			BIT(8)
+#define		CSID_CSI2_RDIN_INFO_FRAME_DROP_SOL			BIT(7)
+#define		CSID_CSI2_RDIN_INFO_FRAME_DROP_EOL			BIT(6)
+#define		CSID_CSI2_RDIN_INFO_FRAME_DROP_EOF			BIT(5)
+#define		CSID_CSI2_RDIN_INFO_CAMIF_SOF				BIT(4)
+#define		CSID_CSI2_RDIN_INFO_CAMIF_EOF				BIT(3)
+#define		CSID_CSI2_RDIN_INFO_FIFO_OVERFLOW			BIT(2)
+#define		CSID_CSI2_RDIN_RES1					BIT(1)
+#define		CSID_CSI2_RDIN_RES0					BIT(0)
+
+#define CSID_CSI2_RDIN_IRQ_MASK(rdi)				(0xf0 + 0x10 * (rdi))
+#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)				(0xf4 + 0x10 * (rdi))
+#define CSID_CSI2_RDIN_IRQ_SET(rdi)				(0xf8 + 0x10 * (rdi))
+
+#define CSID_TOP_IRQ_STATUS					0x7c
+#define CSID_TOP_IRQ_MASK					0x80
+#define CSID_TOP_IRQ_CLEAR					0x84
+#define		CSID_TOP_IRQ_RESET				BIT(0)
+#define		CSID_TOP_IRQ_RX					BIT(2)
+#define		CSID_TOP_IRQ_LONG_PKT(rdi)			(BIT(8) << (rdi))
+#define		CSID_TOP_IRQ_BUF_DONE				BIT(13)
+
+#define CSID_BUF_DONE_IRQ_STATUS				0x8c
+#define	BUF_DONE_IRQ_STATUS_RDI_OFFSET				(csid_is_lite(csid) ? 1 : 14)
+#define CSID_BUF_DONE_IRQ_MASK					0x90
+#define CSID_BUF_DONE_IRQ_CLEAR					0x94
+
+#define CSID_CSI2_RX_IRQ_STATUS					0x9c
+#define CSID_CSI2_RX_IRQ_MASK					0xa0
+#define CSID_CSI2_RX_IRQ_CLEAR					0xa4
+
+#define CSID_RESET_CFG						0xc
+#define		CSID_RESET_CFG_MODE_IMMEDIATE			BIT(0)
+#define		CSID_RESET_CFG_LOCATION_COMPLETE		BIT(4)
+
+#define CSID_CSI2_RDI_IRQ_STATUS(rdi)				(0xec + 0x10 * (rdi))
+#define CSID_CSI2_RDI_IRQ_MASK(rdi)				(0xf0 + 0x10 * (rdi))
+#define CSID_CSI2_RDI_IRQ_CLEAR(rdi)				(0xf4 + 0x10 * (rdi))
+
+#define CSID_CSI2_RX_CFG0					0x200
+#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES			0
+#define		CSI2_RX_CFG0_DL0_INPUT_SEL			4
+#define		CSI2_RX_CFG0_DL1_INPUT_SEL			8
+#define		CSI2_RX_CFG0_DL2_INPUT_SEL			12
+#define		CSI2_RX_CFG0_DL3_INPUT_SEL			16
+#define		CSI2_RX_CFG0_PHY_NUM_SEL			20
+#define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX			1
+#define		CSI2_RX_CFG0_PHY_TYPE_SEL			24
+
+#define CSID_CSI2_RX_CFG1					0x204
+#define		CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN		BIT(0)
+#define		CSI2_RX_CFG1_DE_SCRAMBLE_EN			BIT(1)
+#define		CSI2_RX_CFG1_VC_MODE				BIT(2)
+#define		CSI2_RX_CFG1_COMPLETE_STREAM_EN			BIT(4)
+#define		CSI2_RX_CFG1_COMPLETE_STREAM_FRAME_TIMING	BIT(5)
+#define		CSI2_RX_CFG1_MISR_EN				BIT(6)
+#define		CSI2_RX_CFG1_CGC_MODE				BIT(7)
+
+#define CSID_CSI2_RX_CAPTURE_CTRL				0x208
+#define		CSI2_RX_CAPTURE_CTRL_LONG_PKT_EN		BIT(0)
+#define		CSI2_RX_CAPTURE_CTRL_SHORT_PKT_EN		BIT(1)
+#define		CSI2_RX_CAPTURE_CTRL_CPHY_PKT_EN		BIT(2)
+#define		CSI2_RX_CAPTURE_CTRL_LONG_PKT_DT		GENMASK(9, 4)
+#define		CSI2_RX_CAPTURE_CTRL_LONG_PKT_VC		GENMASK(14, 10)
+#define		CSI2_RX_CAPTURE_CTRL_SHORT_PKT_VC		GENMASK(19, 15)
+#define		CSI2_RX_CAPTURE_CTRL_CPHY_PKT_DT		GENMASK(20, 25)
+#define		CSI2_RX_CAPTURE_CTRL_CPHY_PKT_VC		GENMASK(30, 26)
+
+#define CSID_CSI2_RX_TOTAL_PKTS_RCVD				0x240
+#define CSID_CSI2_RX_STATS_ECC					0x244
+#define CSID_CSI2_RX_CRC_ERRORS					0x248
+
+#define CSID_RDI_CFG0(rdi)					(0x500 + 0x100 * (rdi))
+#define		RDI_CFG0_DECODE_FORMAT				12
+#define		RDI_CFG0_DATA_TYPE				16
+#define		RDI_CFG0_VIRTUAL_CHANNEL			22
+#define		RDI_CFG0_DT_ID					27
+#define		RDI_CFG0_ENABLE					BIT(31)
+
+#define CSID_RDI_CTRL(rdi)					(0x504 + 0x100 * (rdi))
+#define		CSID_RDI_CTRL_HALT_CMD_HALT_AT_FRAME_BOUNDARY	0
+#define		CSID_RDI_CTRL_HALT_CMD_RESUME_AT_FRAME_BOUNDARY	1
+
+#define CSID_RDI_CFG1(rdi)					(0x510 + 0x100 * (rdi))
+#define		RDI_CFG1_TIMESTAMP_STB_FRAME			BIT(0)
+#define		RDI_CFG1_TIMESTAMP_STB_IRQ			BIT(1)
+#define		RDI_CFG1_BYTE_CNTR_EN				BIT(2)
+#define		RDI_CFG1_TIMESTAMP_EN				BIT(4)
+#define		RDI_CFG1_DROP_H_EN				BIT(5)
+#define		RDI_CFG1_DROP_V_EN				BIT(6)
+#define		RDI_CFG1_CROP_H_EN				BIT(7)
+#define		RDI_CFG1_CROP_V_EN				BIT(8)
+#define		RDI_CFG1_MISR_EN				BIT(9)
+#define		RDI_CFG1_PLAIN_ALIGN_MSB			BIT(11)
+#define		RDI_CFG1_EARLY_EOF_EN				BIT(14)
+#define		RDI_CFG1_PACKING_MIPI				BIT(15)
+
+#define CSID_RDI_ERR_RECOVERY_CFG0(rdi)				(0x514 + 0x100 * (rdi))
+#define CSID_RDI_EPOCH_IRQ_CFG(rdi)				(0x52c + 0x100 * (rdi))
+#define CSID_RDI_FRM_DROP_PATTERN(rdi)				(0x540 + 0x100 * (rdi))
+#define CSID_RDI_FRM_DROP_PERIOD(rdi)				(0x544 + 0x100 * (rdi))
+#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)			(0x548 + 0x100 * (rdi))
+#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)			(0x54c + 0x100 * (rdi))
+#define CSID_RDI_PIX_DROP_PATTERN(rdi)				(0x558 + 0x100 * (rdi))
+#define CSID_RDI_PIX_DROP_PERIOD(rdi)				(0x55c + 0x100 * (rdi))
+#define CSID_RDI_LINE_DROP_PATTERN(rdi)				(0x560 + 0x100 * (rdi))
+#define CSID_RDI_LINE_DROP_PERIOD(rdi)				(0x564 + 0x100 * (rdi))
+
+static inline int reg_update_rdi(struct csid_device *csid, int n)
+{
+	return BIT(4 + n) + BIT(20 + n);
+}
+
+static void csid_reg_update(struct csid_device *csid, int port_id)
+{
+	csid->reg_update |= reg_update_rdi(csid, port_id);
+	writel(csid->reg_update, csid->base + CSID_REG_UPDATE_CMD);
+}
+
+static inline void csid_reg_update_clear(struct csid_device *csid,
+					 int port_id)
+{
+	csid->reg_update &= ~reg_update_rdi(csid, port_id);
+	writel(csid->reg_update, csid->base + CSID_REG_UPDATE_CMD);
+}
+
+static void __csid_configure_rx(struct csid_device *csid,
+				struct csid_phy_config *phy, int vc)
+{
+	u32 val;
+
+	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
+	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
+	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
+
+	writel(val, csid->base + CSID_CSI2_RX_CFG0);
+
+	val = CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
+	if (vc > 3)
+		val |= CSI2_RX_CFG1_VC_MODE;
+	writel(val, csid->base + CSID_CSI2_RX_CFG1);
+}
+
+static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
+{
+	u32 val;
+
+	if (enable)
+		val = CSID_RDI_CTRL_HALT_CMD_RESUME_AT_FRAME_BOUNDARY;
+	else
+		val = CSID_RDI_CTRL_HALT_CMD_HALT_AT_FRAME_BOUNDARY;
+
+	writel(val, csid->base + CSID_RDI_CTRL(rdi));
+}
+
+static void __csid_configure_top(struct csid_device *csid)
+{
+	u32 val;
+
+	val = CSID_TOP_IO_PATH_CFG0_OUTPUT_IFE_EN | CSID_TOP_IO_PATH_CFG0_INTERNAL_CSID;
+	writel(val, csid->camss->csid_wrapper_base +
+	    CSID_TOP_IO_PATH_CFG0(csid->id));
+}
+
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
+{
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
+	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
+								   csid->res->formats->nformats,
+								   input_format->code);
+	u8 lane_cnt = csid->phy.lane_cnt;
+	u8 dt_id;
+	u32 val;
+
+	if (!lane_cnt)
+		lane_cnt = 4;
+
+	val = 0;
+	writel(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(vc));
+
+	/*
+	 * DT_ID is a two bit bitfield that is concatenated with
+	 * the four least significant bits of the five bit VC
+	 * bitfield to generate an internal CID value.
+	 *
+	 * CSID_RDI_CFG0(vc)
+	 * DT_ID : 28:27
+	 * VC    : 26:22
+	 * DT    : 21:16
+	 *
+	 * CID   : VC 3:0 << 2 | DT_ID 1:0
+	 */
+	dt_id = vc & 0x03;
+
+	/* note: for non-RDI path, this should be format->decode_format */
+	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
+	val |= format->data_type << RDI_CFG0_DATA_TYPE;
+	val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
+	val |= dt_id << RDI_CFG0_DT_ID;
+	writel(val, csid->base + CSID_RDI_CFG0(vc));
+
+	val = RDI_CFG1_TIMESTAMP_STB_FRAME;
+	val |= RDI_CFG1_BYTE_CNTR_EN;
+	val |= RDI_CFG1_TIMESTAMP_EN;
+	val |= RDI_CFG1_DROP_H_EN;
+	val |= RDI_CFG1_DROP_V_EN;
+	val |= RDI_CFG1_CROP_H_EN;
+	val |= RDI_CFG1_CROP_V_EN;
+	val |= RDI_CFG1_PACKING_MIPI;
+
+	writel(val, csid->base + CSID_RDI_CFG1(vc));
+
+	val = 0;
+	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
+
+	val = 1;
+	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
+
+	val = 0;
+	writel(val, csid->base + CSID_RDI_CTRL(vc));
+
+	val = readl(csid->base + CSID_RDI_CFG0(vc));
+	if (enable)
+		val |= RDI_CFG0_ENABLE;
+	else
+		val &= ~RDI_CFG0_ENABLE;
+	writel(val, csid->base + CSID_RDI_CFG0(vc));
+}
+
+static void csid_configure_stream(struct csid_device *csid, u8 enable)
+{
+	int i;
+
+	__csid_configure_top(csid);
+
+       /* Loop through all enabled VCs and configure stream for each */
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
+		if (csid->phy.en_vc & BIT(i)) {
+			__csid_configure_rdi_stream(csid, enable, i);
+			__csid_configure_rx(csid, &csid->phy, i);
+			__csid_ctrl_rdi(csid, enable, i);
+		}
+	}
+}
+
+/*
+ * csid_reset - Trigger reset on CSID module and wait to complete
+ * @csid: CSID device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csid_reset(struct csid_device *csid)
+{
+	unsigned long time;
+	u32 val;
+	int i;
+
+	reinit_completion(&csid->reset_complete);
+
+	writel(CSID_IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
+
+	/* preserve registers */
+	val = CSID_RESET_CFG_MODE_IMMEDIATE | CSID_RESET_CFG_LOCATION_COMPLETE;
+	writel(val, csid->base + CSID_RESET_CFG);
+
+	val = CSID_RESET_CMD_HW_RESET | CSID_RESET_CMD_SW_RESET;
+	writel(val, csid->base + CSID_RESET_CMD);
+
+	time = wait_for_completion_timeout(&csid->reset_complete,
+					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
+	if (!time) {
+		dev_err(csid->camss->dev, "CSID reset timeout\n");
+		return -EIO;
+	}
+
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
+		/* Enable RUP done for the client port */
+		writel(CSID_CSI2_RDIN_RUP_DONE, csid->base + CSID_CSI2_RDIN_IRQ_MASK(i));
+	}
+
+	/* Clear RDI status */
+	writel(~0u, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+
+	/* Enable BUF_DONE bit for all write-master client ports */
+	writel(~0u, csid->base + CSID_BUF_DONE_IRQ_MASK);
+
+	/* Unmask all TOP interrupts */
+	writel(~0u, csid->base + CSID_TOP_IRQ_MASK);
+
+	return 0;
+}
+
+static void csid_rup_complete(struct csid_device *csid, int rdi)
+{
+	csid_reg_update_clear(csid, rdi);
+}
+
+/*
+ * csid_isr - CSID module interrupt service routine
+ * @irq: Interrupt line
+ * @dev: CSID device
+ *
+ * Return IRQ_HANDLED on success
+ */
+static irqreturn_t csid_isr(int irq, void *dev)
+{
+	struct csid_device *csid = dev;
+	u32 buf_done_val, val, val_top;
+	int i;
+
+	/* Latch and clear TOP status */
+	val_top = readl(csid->base + CSID_TOP_IRQ_STATUS);
+	writel(val_top, csid->base + CSID_TOP_IRQ_CLEAR);
+
+	/* Latch and clear CSID_CSI2 status */
+	val = readl(csid->base + CSID_CSI2_RX_IRQ_STATUS);
+	writel(val, csid->base + CSID_CSI2_RX_IRQ_CLEAR);
+
+	/* Latch and clear top level BUF_DONE status */
+	buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
+	writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+
+	/* Process state for each RDI channel */
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
+		val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
+		if (val)
+			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+
+		if (val & CSID_CSI2_RDIN_RUP_DONE)
+			csid_rup_complete(csid, i);
+
+		if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
+			camss_buf_done(csid->camss, csid->id, i);
+	}
+
+	/* Issue clear command */
+	writel(CSID_IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
+
+	/* Reset complete */
+	if (val_top & CSID_TOP_IRQ_RESET)
+		complete(&csid->reset_complete);
+
+	return IRQ_HANDLED;
+}
+
+static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool is_clear)
+{
+	if (is_clear)
+		csid_reg_update_clear(csid, port_id);
+	else
+		csid_reg_update(csid, port_id);
+}
+
+static void csid_subdev_init(struct csid_device *csid) {}
+
+const struct csid_hw_ops csid_ops_680 = {
+	.configure_testgen_pattern = NULL,
+	.configure_stream = csid_configure_stream,
+	.hw_version = csid_hw_version,
+	.isr = csid_isr,
+	.reset = csid_reset,
+	.src_pad_code = csid_src_pad_code,
+	.subdev_init = csid_subdev_init,
+	.reg_update = csid_subdev_reg_update,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 90b8fc5852be32d5617e9bc64458f3484d21a6e2..9dc826d8c8f6a9251b5d0fc4f698e0968c57cc6d 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -213,6 +213,7 @@ extern const struct csid_formats csid_formats_gen2;
 
 extern const struct csid_hw_ops csid_ops_4_1;
 extern const struct csid_hw_ops csid_ops_4_7;
+extern const struct csid_hw_ops csid_ops_680;
 extern const struct csid_hw_ops csid_ops_gen2;
 extern const struct csid_hw_ops csid_ops_780;
 

-- 
2.48.1


