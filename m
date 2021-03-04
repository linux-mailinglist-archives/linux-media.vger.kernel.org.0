Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3D7832D24E
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 13:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239967AbhCDMGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 07:06:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239897AbhCDMGO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 07:06:14 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75DD5C0613DC
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 04:05:45 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id l12so34459975edt.3
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 04:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MB3dOJa39frP9xpZiMDFriIvbU9lQpyDrWXbisCqGu0=;
        b=T+mDDzm1wYz7eSQmaJjty9RDkXXDtHQ9w1yFZcqTLZkkwEp6metBtmQwi6O8P2shw1
         zCNhtSm8pV6vwzs/a/dUzsYB+BzgF/thXu83m4PCI8y7n8DYJaiAWBlkBS57Us+Lon3P
         RkHZwagTSftlYe9Oes5rSUPaWD8j65IppIw/Ds7X8e09lmgELGrjb9uqJu7hVmfDM/97
         0ZaR6P6UyPfjQo1qB8Dqfs0bdUA9/q5VgoOT2/Tp2YFPifVQHvmqDfEA456IsFXUatYe
         dc7oNaqwGFvl5cPhUYY0dUd6d3KZguF/b5HgBN/Tjy3B/22f0o2rtH4mOVKeapIuSnMh
         Uvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MB3dOJa39frP9xpZiMDFriIvbU9lQpyDrWXbisCqGu0=;
        b=aQnjcyoxzJrhnsvdGHJk3xtvx8F/9o2FtRkSqMhdRwHwDDU46vtNm5rktx52gWdCz0
         5KBISzl2fCx6y4g606gO8sADMm1uZ70bf1MDK8zb/xghGa3gSnFZkPa0mppmpY1bACLQ
         FwdEW7jog6NnCI1klRzxJj4RgvmYEpLrZdpt1nJrXCR+V0FFyq4rZed+/NUFH1vyPR1s
         Bvk8uJFngiUoPF2kqmDZc8zRLYR/XJdYgOQjYqUKaRPTwkn4u9hjopIgFsocbSuUKMt3
         /cV48JVxmwtVfjo64moozxt8vX+a1FnyakaiqM1IZBtOLq/HC2QtwJLLYLA0PMgSJ7AP
         RosQ==
X-Gm-Message-State: AOAM532NGBH4uunw7g/LFT5L3kJJiIPcNjf5fyV4vgggaoaPTQVOE+jV
        SEsd+hWgQKzrKPSJNX3h4FnBmRcbchUxxJ5w
X-Google-Smtp-Source: ABdhPJxy/xK/TtuZCRz+n34Uwzg69GXf8ZJcWKSDK+NdCh00p5XyEEou8wiRWatp45mYDKzDPFrVew==
X-Received: by 2002:aa7:c5c4:: with SMTP id h4mr3765036eds.375.1614859544199;
        Thu, 04 Mar 2021 04:05:44 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:470a:340b:1b:29dd])
        by smtp.gmail.com with ESMTPSA id cf6sm20464447edb.92.2021.03.04.04.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 04:05:43 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v6 08/22] media: camss: Add missing format identifiers
Date:   Thu,  4 Mar 2021 13:03:14 +0100
Message-Id: <20210304120326.153966-9-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210304120326.153966-1-robert.foss@linaro.org>
References: <20210304120326.153966-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSI-2 spec defines format identifier for Data Type (DT),
and how the Decode Format (DF) & Encode Format (EF) are implemented.
The spec does however not define the DF, EF or Plain Format (PF)
identifiers, as those are vendor specific.

Plain formats describe the size of the pixels written by the RDI
units to memory. PLAIN8 for example has the size 8 bits, and
PLAIN32 32 bits. The appropriate Plain Format is determined by
the Decode Format used. The smallest Plain Format that is able
to contain a pixel of the used Decode Format is the appropriate
one to use.

As the vendor specific identifiers differ between hardware
generations, split them out into separate headers.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

Changes since v5
 - Andrey: Gen 1 & Gen2 devices have different decode/encode/plain
           format definitions, list in separate headers
 - Andrey: Make commit msg more clear about what is in MIPI spec or not


 .../platform/qcom/camss/camss-csid-gen1.h     | 27 +++++++++++++
 .../platform/qcom/camss/camss-csid-gen2.h     | 39 +++++++++++++++++++
 .../media/platform/qcom/camss/camss-csid.c    | 20 ++--------
 .../media/platform/qcom/camss/camss-csid.h    | 24 ++++++++++++
 4 files changed, 94 insertions(+), 16 deletions(-)
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen1.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen2.h

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen1.h b/drivers/media/platform/qcom/camss/camss-csid-gen1.h
new file mode 100644
index 000000000000..80a2bc6efff6
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen1.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * camss-csid-gen1.h
+ *
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module Generation 1
+ *
+ * Copyright (C) 2021 Linaro Ltd.
+ */
+#ifndef QC_MSM_CAMSS_CSID_GEN1_H
+#define QC_MSM_CAMSS_CSID_GEN1_H
+
+#define DECODE_FORMAT_UNCOMPRESSED_6_BIT	0x0
+#define DECODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
+#define DECODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
+#define DECODE_FORMAT_UNCOMPRESSED_12_BIT	0x3
+#define DECODE_FORMAT_DPCM_10_6_10		0x4
+#define DECODE_FORMAT_DPCM_10_8_10		0x5
+#define DECODE_FORMAT_DPCM_12_6_12		0x6
+#define DECODE_FORMAT_DPCM_12_8_12		0x7
+#define DECODE_FORMAT_UNCOMPRESSED_14_BIT	0x8
+#define DECODE_FORMAT_DPCM_14_8_14		0x9
+#define DECODE_FORMAT_DPCM_14_10_14		0xa
+
+#define PLAIN_FORMAT_PLAIN8	0x0 /* supports DPCM, UNCOMPRESSED_6/8_BIT */
+#define PLAIN_FORMAT_PLAIN16	0x1 /* supports DPCM, UNCOMPRESSED_10/16_BIT */
+
+#endif /* QC_MSM_CAMSS_CSID_GEN1_H */
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.h b/drivers/media/platform/qcom/camss/camss-csid-gen2.h
new file mode 100644
index 000000000000..3a8ad001b3e8
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * camss-csid-gen1.h
+ *
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module Generation 1
+ *
+ * Copyright (C) 2021 Linaro Ltd.
+ */
+#ifndef QC_MSM_CAMSS_CSID_GEN2_H
+#define QC_MSM_CAMSS_CSID_GEN2_H
+
+#define DECODE_FORMAT_UNCOMPRESSED_6_BIT	0x0
+#define DECODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
+#define DECODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
+#define DECODE_FORMAT_UNCOMPRESSED_12_BIT	0x3
+#define DECODE_FORMAT_UNCOMPRESSED_14_BIT	0x4
+#define DECODE_FORMAT_UNCOMPRESSED_16_BIT	0x5
+#define DECODE_FORMAT_UNCOMPRESSED_20_BIT	0x6
+#define DECODE_FORMAT_DPCM_10_6_10		0x7
+#define DECODE_FORMAT_DPCM_10_8_10		0x8
+#define DECODE_FORMAT_DPCM_12_6_12		0x9
+#define DECODE_FORMAT_DPCM_12_8_12		0xa
+#define DECODE_FORMAT_DPCM_14_8_14		0xb
+#define DECODE_FORMAT_DPCM_14_10_14		0xc
+#define DECODE_FORMAT_DPCM_12_10_12		0xd
+#define DECODE_FORMAT_USER_DEFINED		0xe
+#define DECODE_FORMAT_PAYLOAD_ONLY		0xf
+
+#define ENCODE_FORMAT_RAW_8_BIT		0x1
+#define ENCODE_FORMAT_RAW_10_BIT	0x2
+#define ENCODE_FORMAT_RAW_12_BIT	0x3
+#define ENCODE_FORMAT_RAW_14_BIT	0x4
+#define ENCODE_FORMAT_RAW_16_BIT	0x5
+
+#define PLAIN_FORMAT_PLAIN8	0x0 /* supports DPCM, UNCOMPRESSED_6/8_BIT */
+#define PLAIN_FORMAT_PLAIN16	0x1 /* supports DPCM, UNCOMPRESSED_10/16_BIT */
+#define PLAIN_FORMAT_PLAIN32	0x2 /* supports UNCOMPRESSED_20_BIT */
+
+#endif /* QC_MSM_CAMSS_CSID_GEN2_H */
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index be3fe76f3dc3..697b51d6ad38 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -22,6 +22,7 @@
 #include <media/v4l2-subdev.h>
 
 #include "camss-csid.h"
+#include "camss-csid-gen1.h"
 #include "camss.h"
 
 #define MSM_CSID_NAME "msm_csid"
@@ -37,8 +38,8 @@
 #define CAMSS_CSID_CID_n_CFG_ISPIF_EN	BIT(0)
 #define CAMSS_CSID_CID_n_CFG_RDI_EN	BIT(1)
 #define CAMSS_CSID_CID_n_CFG_DECODE_FORMAT_SHIFT	4
-#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_8		(0 << 8)
-#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_16		(1 << 8)
+#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_8		(PLAIN_FORMAT_PLAIN8 << 8)
+#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_16		(PLAIN_FORMAT_PLAIN16 << 8)
 #define CAMSS_CSID_CID_n_CFG_PLAIN_ALIGNMENT_LSB	(0 << 9)
 #define CAMSS_CSID_CID_n_CFG_PLAIN_ALIGNMENT_MSB	(1 << 9)
 #define CAMSS_CSID_CID_n_CFG_RDI_MODE_RAW_DUMP		(0 << 10)
@@ -59,22 +60,9 @@
 #define CAMSS_CSID_TG_DT_n_CGG_2(v, n)	\
 			(((v) == CAMSS_8x16 ? 0x0b4 : 0x0bc) + 0xc * (n))
 
-#define DATA_TYPE_EMBEDDED_DATA_8BIT	0x12
-#define DATA_TYPE_YUV422_8BIT		0x1e
-#define DATA_TYPE_RAW_6BIT		0x28
-#define DATA_TYPE_RAW_8BIT		0x2a
-#define DATA_TYPE_RAW_10BIT		0x2b
-#define DATA_TYPE_RAW_12BIT		0x2c
-#define DATA_TYPE_RAW_14BIT		0x2d
-
-#define DECODE_FORMAT_UNCOMPRESSED_6_BIT	0x0
-#define DECODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
-#define DECODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
-#define DECODE_FORMAT_UNCOMPRESSED_12_BIT	0x3
-#define DECODE_FORMAT_UNCOMPRESSED_14_BIT	0x8
-
 #define CSID_RESET_TIMEOUT_MS 500
 
+
 struct csid_format {
 	u32 code;
 	u8 data_type;
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 1824b3745e10..318c19bb26c9 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -21,6 +21,30 @@
 #define MSM_CSID_PAD_SRC 1
 #define MSM_CSID_PADS_NUM 2
 
+#define DATA_TYPE_EMBEDDED_DATA_8BIT	0x12
+#define DATA_TYPE_YUV420_8BIT		0x18
+#define DATA_TYPE_YUV420_10BIT		0x19
+#define DATA_TYPE_YUV420_8BIT_LEGACY	0x1a
+#define DATA_TYPE_YUV420_8BIT_SHIFTED	0x1c /* Chroma Shifted Pixel Sampling */
+#define DATA_TYPE_YUV420_10BIT_SHIFTED	0x1d /* Chroma Shifted Pixel Sampling */
+#define DATA_TYPE_YUV422_8BIT		0x1e
+#define DATA_TYPE_YUV422_10BIT		0x1f
+#define DATA_TYPE_RGB444		0x20
+#define DATA_TYPE_RGB555		0x21
+#define DATA_TYPE_RGB565		0x22
+#define DATA_TYPE_RGB666		0x23
+#define DATA_TYPE_RGB888		0x24
+#define DATA_TYPE_RAW_24BIT		0x27
+#define DATA_TYPE_RAW_6BIT		0x28
+#define DATA_TYPE_RAW_7BIT		0x29
+#define DATA_TYPE_RAW_8BIT		0x2a
+#define DATA_TYPE_RAW_10BIT		0x2b
+#define DATA_TYPE_RAW_12BIT		0x2c
+#define DATA_TYPE_RAW_14BIT		0x2d
+#define DATA_TYPE_RAW_16BIT		0x2e
+#define DATA_TYPE_RAW_20BIT		0x2f
+
+
 enum csid_payload_mode {
 	CSID_PAYLOAD_MODE_INCREMENTING = 0,
 	CSID_PAYLOAD_MODE_ALTERNATING_55_AA = 1,
-- 
2.27.0

