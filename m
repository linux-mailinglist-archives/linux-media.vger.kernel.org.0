Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A59B33C0D9
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 17:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231837AbhCOQBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 12:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbhCOQAh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 12:00:37 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6352C06175F
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:00:36 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id mm21so67056309ejb.12
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yYT2ceoRWvsgZhCccBq3AKEHTLDN7W7uHueZ8AUQyjk=;
        b=wSl2b3eNMFKSGqnBqsRPG4cP+UxwcPac5djWTDvhKxaMPh7SYXXyefYSvEqpV3Hjsc
         tpqqhQNcvHuxi4T9PuQ+E02L3evqPhBnQvleOY2D/s9ed4f3CW9iN8j7B59A9Ov0Tmed
         Kpw1Hp6XPIrZe2BqUjdpF1YGRcxvhtR3kCeJSrogobRY85kKHXtkSs9A764x2ZT6R5iy
         BoUfg1yT7c12BZiJereg7QQqs3SIR6BOiTMigrM+OPu/zvyqoPaCjUaA4QDsFtvH4bpt
         jgzhBRY8S0ZdDO9rOvjC+ZAZ/Z4JXe9uWFd1dCHcVTtXyIkrqxGq0aoKZy8Vf11QjHjc
         iMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yYT2ceoRWvsgZhCccBq3AKEHTLDN7W7uHueZ8AUQyjk=;
        b=kJp/6KVtlqPOpTVlcVfEfCeiqxYGM2zQPdz/J43IZkBfP+7jEHb9wTihsPSAGUOvML
         OV4M9R6H0jmKHXxthtqoSpeGW/qxbB1P+W8Hw+u4M69/vCxZmvGo4dFfY2eh9/MXine2
         RVaNLc/J16fVwbPjn244eAW76CjZ8RO6ldpXxpIfoBwMHdqTq8KO63b0hIm8NEgjU11b
         1VFRbQdYhMhjNWVZXp2YBjhHIFj+UdmrEZv9EbQxICqQfZMnG4OvWXWd7FamVruJYooj
         24CO/inJyAYFzpQwOQmHdVUddYXjvquIJTI6vUg5268Sxr2EBInI2VeJBpSWRcEQLBnY
         di/A==
X-Gm-Message-State: AOAM5307pKJbTYPZeJTEw+PyYub5OrjlWVG/zwQO27UXrEvDW05b+Rzh
        830NyC/+1uN+lfa01e0SHnD5Tg==
X-Google-Smtp-Source: ABdhPJyWOqwiG+WyvgdZNZi3nASHu4A+40SB4YZnvbjuap97kTBTkcGSp6+I2j5FlkMAM5/Qu114ew==
X-Received: by 2002:a17:906:9386:: with SMTP id l6mr24075073ejx.455.1615824030384;
        Mon, 15 Mar 2021 09:00:30 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id r5sm8456445eds.49.2021.03.15.09.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:00:29 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v8 08/22] media: camss: Add missing format identifiers
Date:   Mon, 15 Mar 2021 16:59:29 +0100
Message-Id: <20210315155942.640889-9-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315155942.640889-1-robert.foss@linaro.org>
References: <20210315155942.640889-1-robert.foss@linaro.org>
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
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---


Changes since v5
 - Andrey: Gen 1 & Gen2 devices have different decode/encode/plain
           format definitions, list in separate headers
 - Andrey: Make commit msg more clear about what is in MIPI spec or not

Changes since v6
 - Andrey: Add r-b

Changes since v7:
 - Hans: Fix checkpatch.pl --strict warnings


 .../platform/qcom/camss/camss-csid-gen1.h     | 27 +++++++++++++
 .../platform/qcom/camss/camss-csid-gen2.h     | 39 +++++++++++++++++++
 .../media/platform/qcom/camss/camss-csid.c    | 19 ++-------
 .../media/platform/qcom/camss/camss-csid.h    | 23 +++++++++++
 4 files changed, 92 insertions(+), 16 deletions(-)
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
index cff9759c9158..e76c509f3cda 100644
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
@@ -59,20 +60,6 @@
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
 
 struct csid_format {
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 1824b3745e10..479ac1f83836 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -21,6 +21,29 @@
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
 enum csid_payload_mode {
 	CSID_PAYLOAD_MODE_INCREMENTING = 0,
 	CSID_PAYLOAD_MODE_ALTERNATING_55_AA = 1,
-- 
2.27.0

