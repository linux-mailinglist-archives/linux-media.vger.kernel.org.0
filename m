Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64F3834363
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 11:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfFDJh5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 05:37:57 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33390 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbfFDJh5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 05:37:57 -0400
Received: by mail-pl1-f193.google.com with SMTP id g21so8133431plq.0
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 02:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sIoU7gP/ydA8ZV1fiZDJ6HrGNHmRPDa9rv/vIiUfTF0=;
        b=Uot+9vJdEmTcuRxGvdr7qc/RGnNFcr7op28BWnivJPgW82bw6tEgF6E6LlZEdE9JCt
         oBeEBqsuqZWKOy9CsGjFsMeo0Ca/sOgQX+xz1jcWjWFM7/3pAdTkNXW7Hwz8iiHQq7uV
         H8vGkLEUE4M2VX5PCEmS7IIesdhcsj/CiOFnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sIoU7gP/ydA8ZV1fiZDJ6HrGNHmRPDa9rv/vIiUfTF0=;
        b=PcWxNbLcP1LMucIKBZxyMS6rAyyg32xE1Jbw4L2X82ZQ8iB0tHo7NeA2VvNE5u9KA6
         dTcyGIKQVCdBbya3MoN9oVSmxjgPY86qBhw1xw4wINgSmP63VZnXbp58v1rTK3AY9taN
         eKPoY4/Z4kfOcZCQKN/BqqP/M4vEVnVTBlBiIrLyyzsjpct0PE0CcqXiseNqwqvi2rzN
         7xgX26tI+nIrL2Uibprs4Wl6ox6J9stq2LRL9w4qIg2P2iDvDu2geamCsykK+ka5rdtU
         Ix2y6tZ9NeVGOe5wXGzU+AZTldfOtRHSH9ZcunxpQiM6VkUk4Wjtsno2kNqR1Bnp+xad
         Srwg==
X-Gm-Message-State: APjAAAVCf0T22tgmDIXam/aw+YZ3+6kRHq8gwoYPOsx70NL9puG0pArj
        GyYaIY/GGonkayxBuACToGCN59W49phe4A==
X-Google-Smtp-Source: APXvYqyN6yP+NVUuTXtw8S0QhFEh5VzUmCz8tELAB76Wi0bFYCCuEzqXSab9bnJK9NxgtHyCBLEU0w==
X-Received: by 2002:a17:902:aa0a:: with SMTP id be10mr28007931plb.27.1559641075391;
        Tue, 04 Jun 2019 02:37:55 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id j7sm17431588pfa.184.2019.06.04.02.37.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 02:37:54 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH 1/5] media: mtk-vcodec: replace GPLv2 with SPDX
Date:   Tue,  4 Jun 2019 18:37:33 +0900
Message-Id: <20190604093737.172599-2-acourbot@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190604093737.172599-1-acourbot@chromium.org>
References: <20190604093737.172599-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace the GPLv2 boilerplate with the corresponding SPDX reference.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec.c  | 15 +--------------
 .../media/platform/mtk-vcodec/mtk_vcodec_dec.h  | 15 +--------------
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c    | 15 +--------------
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c     | 14 +-------------
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h     | 14 +-------------
 .../media/platform/mtk-vcodec/mtk_vcodec_drv.h  | 15 +--------------
 .../media/platform/mtk-vcodec/mtk_vcodec_enc.c  | 15 +--------------
 .../media/platform/mtk-vcodec/mtk_vcodec_enc.h  | 15 +--------------
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c    | 15 +--------------
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c     | 14 +-------------
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h     | 14 +-------------
 .../media/platform/mtk-vcodec/mtk_vcodec_intr.c | 14 +-------------
 .../media/platform/mtk-vcodec/mtk_vcodec_intr.h | 14 +-------------
 .../media/platform/mtk-vcodec/mtk_vcodec_util.c | 15 +--------------
 .../media/platform/mtk-vcodec/mtk_vcodec_util.h | 15 +--------------
 .../platform/mtk-vcodec/vdec/vdec_h264_if.c     | 14 +-------------
 .../platform/mtk-vcodec/vdec/vdec_vp8_if.c      | 15 +--------------
 .../platform/mtk-vcodec/vdec/vdec_vp9_if.c      | 16 +---------------
 .../media/platform/mtk-vcodec/vdec_drv_base.h   | 14 +-------------
 drivers/media/platform/mtk-vcodec/vdec_drv_if.c | 15 +--------------
 drivers/media/platform/mtk-vcodec/vdec_drv_if.h | 15 +--------------
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h    | 15 +--------------
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.c | 14 +-------------
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.h | 14 +-------------
 .../platform/mtk-vcodec/venc/venc_h264_if.c     | 17 +----------------
 .../platform/mtk-vcodec/venc/venc_vp8_if.c      | 16 +---------------
 .../media/platform/mtk-vcodec/venc_drv_base.h   | 17 +----------------
 drivers/media/platform/mtk-vcodec/venc_drv_if.c | 17 +----------------
 drivers/media/platform/mtk-vcodec/venc_drv_if.h | 17 +----------------
 .../media/platform/mtk-vcodec/venc_ipi_msg.h    | 17 +----------------
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c | 15 +--------------
 drivers/media/platform/mtk-vcodec/venc_vpu_if.h | 15 +--------------
 32 files changed, 32 insertions(+), 450 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 851903867bc9..371e70d6a803 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -1,17 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: PC Chen <pc.chen@mediatek.com>
- *         Tiffany Lin <tiffany.lin@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+// SPDX-License-Identifier: GPL-2.0
 
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index e4984edec4f8..a18268694646 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -1,17 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: PC Chen <pc.chen@mediatek.com>
- *         Tiffany Lin <tiffany.lin@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #ifndef _MTK_VCODEC_DEC_H_
 #define _MTK_VCODEC_DEC_H_
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 4334b7394861..dbe957aa138d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -1,17 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: PC Chen <pc.chen@mediatek.com>
- *         Tiffany Lin <tiffany.lin@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+// SPDX-License-Identifier: GPL-2.0
 
 #include <linux/slab.h>
 #include <linux/interrupt.h>
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 11c45c556e88..b09242b1470d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -1,16 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: Tiffany Lin <tiffany.lin@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+// SPDX-License-Identifier: GPL-2.0
 
 #include <linux/clk.h>
 #include <linux/of_address.h>
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
index 86a7825353e3..b44621ad15d8 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
@@ -1,16 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: Tiffany Lin <tiffany.lin@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #ifndef _MTK_VCODEC_DEC_PM_H_
 #define _MTK_VCODEC_DEC_PM_H_
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 662a84b822af..d7b43caf7988 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -1,17 +1,4 @@
-/*
-* Copyright (c) 2016 MediaTek Inc.
-* Author: PC Chen <pc.chen@mediatek.com>
-*         Tiffany Lin <tiffany.lin@mediatek.com>
-*
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License version 2 as
-* published by the Free Software Foundation.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-* GNU General Public License for more details.
-*/
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #ifndef _MTK_VCODEC_DRV_H_
 #define _MTK_VCODEC_DRV_H_
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 50351adafc47..1a3845809b92 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -1,17 +1,4 @@
-/*
-* Copyright (c) 2016 MediaTek Inc.
-* Author: PC Chen <pc.chen@mediatek.com>
-*         Tiffany Lin <tiffany.lin@mediatek.com>
-*
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License version 2 as
-* published by the Free Software Foundation.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-* GNU General Public License for more details.
-*/
+// SPDX-License-Identifier: GPL-2.0
 
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
index d7a154a97510..e372e5ddff8a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
@@ -1,17 +1,4 @@
-/*
-* Copyright (c) 2016 MediaTek Inc.
-* Author: PC Chen <pc.chen@mediatek.com>
-*         Tiffany Lin <tiffany.lin@mediatek.com>
-*
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License version 2 as
-* published by the Free Software Foundation.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-* GNU General Public License for more details.
-*/
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #ifndef _MTK_VCODEC_ENC_H_
 #define _MTK_VCODEC_ENC_H_
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 83f859e8509c..b6d7c602c2ad 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -1,17 +1,4 @@
-/*
-* Copyright (c) 2016 MediaTek Inc.
-* Author: PC Chen <pc.chen@mediatek.com>
-*	Tiffany Lin <tiffany.lin@mediatek.com>
-*
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License version 2 as
-* published by the Free Software Foundation.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-* GNU General Public License for more details.
-*/
+// SPDX-License-Identifier: GPL-2.0
 
 #include <linux/slab.h>
 #include <linux/interrupt.h>
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 39375b8ea27c..90bdad5c71b0 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -1,16 +1,4 @@
-/*
-* Copyright (c) 2016 MediaTek Inc.
-* Author: Tiffany Lin <tiffany.lin@mediatek.com>
-*
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License version 2 as
-* published by the Free Software Foundation.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-* GNU General Public License for more details.
-*/
+// SPDX-License-Identifier: GPL-2.0
 
 #include <linux/clk.h>
 #include <linux/of_address.h>
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
index f32167138976..dddbbe02a109 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
@@ -1,16 +1,4 @@
-/*
-* Copyright (c) 2016 MediaTek Inc.
-* Author: Tiffany Lin <tiffany.lin@mediatek.com>
-*
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License version 2 as
-* published by the Free Software Foundation.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-* GNU General Public License for more details.
-*/
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #ifndef _MTK_VCODEC_ENC_PM_H_
 #define _MTK_VCODEC_ENC_PM_H_
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
index 113b2097f061..693888e4987f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
@@ -1,16 +1,4 @@
-/*
-* Copyright (c) 2016 MediaTek Inc.
-* Author: Tiffany Lin <tiffany.lin@mediatek.com>
-*
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License version 2 as
-* published by the Free Software Foundation.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-* GNU General Public License for more details.
-*/
+// SPDX-License-Identifier: GPL-2.0
 
 #include <linux/errno.h>
 #include <linux/wait.h>
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
index 12131855b46a..55f046cd93a5 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
@@ -1,16 +1,4 @@
-/*
-* Copyright (c) 2016 MediaTek Inc.
-* Author: Tiffany Lin <tiffany.lin@mediatek.com>
-*
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License version 2 as
-* published by the Free Software Foundation.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-* GNU General Public License for more details.
-*/
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #ifndef _MTK_VCODEC_INTR_H_
 #define _MTK_VCODEC_INTR_H_
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
index 060c0ad6243a..e1a9ac9694e3 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
@@ -1,17 +1,4 @@
-/*
-* Copyright (c) 2016 MediaTek Inc.
-* Author: PC Chen <pc.chen@mediatek.com>
-*	Tiffany Lin <tiffany.lin@mediatek.com>
-*
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License version 2 as
-* published by the Free Software Foundation.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-* GNU General Public License for more details.
-*/
+// SPDX-License-Identifier: GPL-2.0
 
 #include <linux/module.h>
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
index 9bf6e8d1b9c9..daabb63548d0 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
@@ -1,17 +1,4 @@
-/*
-* Copyright (c) 2016 MediaTek Inc.
-* Author: PC Chen <pc.chen@mediatek.com>
-*	Tiffany Lin <tiffany.lin@mediatek.com>
-*
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License version 2 as
-* published by the Free Software Foundation.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-* GNU General Public License for more details.
-*/
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #ifndef _MTK_VCODEC_UTIL_H_
 #define _MTK_VCODEC_UTIL_H_
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
index cdbcd6909728..d725ea54b1c1 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
@@ -1,16 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: PC Chen <pc.chen@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+// SPDX-License-Identifier: GPL-2.0
 
 #include <linux/module.h>
 #include <linux/slab.h>
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
index ba79136421ef..8de997875b6b 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
@@ -1,17 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: Jungchang Tsao <jungchang.tsao@mediatek.com>
- *	   PC Chen <pc.chen@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+// SPDX-License-Identifier: GPL-2.0
 
 #include <linux/slab.h>
 #include "../vdec_drv_if.h"
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
index 939ea14bf6c5..02b65298c87e 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
@@ -1,18 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: Daniel Hsiao <daniel.hsiao@mediatek.com>
- *	Kai-Sean Yang <kai-sean.yang@mediatek.com>
- *	Tiffany Lin <tiffany.lin@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+// SPDX-License-Identifier: GPL-2.0
 
 #include <linux/fs.h>
 #include <linux/slab.h>
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_base.h b/drivers/media/platform/mtk-vcodec/vdec_drv_base.h
index 7e4c1a92bbd8..014712b1312e 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_base.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_base.h
@@ -1,16 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: PC Chen <pc.chen@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #ifndef _VDEC_DRV_BASE_
 #define _VDEC_DRV_BASE_
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
index 5ffc468dd910..6835cb7d090a 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
@@ -1,17 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: PC Chen <pc.chen@mediatek.com>
- *         Tiffany Lin <tiffany.lin@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+// SPDX-License-Identifier: GPL-2.0
 
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.h b/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
index 9a21591f3818..ceba7f55a526 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
@@ -1,17 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: PC Chen <pc.chen@mediatek.com>
- *		   Tiffany Lin <tiffany.lin@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #ifndef _VDEC_DRV_IF_H_
 #define _VDEC_DRV_IF_H_
diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
index 5a8a629f4ac9..6370f1285a63 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
@@ -1,17 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: PC Chen <pc.chen@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #ifndef _VDEC_IPI_MSG_H_
 #define _VDEC_IPI_MSG_H_
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index 1abd14e79565..9b240d325a84 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -1,16 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: PC Chen <pc.chen@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+// SPDX-License-Identifier: GPL-2.0
 
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_util.h"
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
index 79d8eac7f5e2..3c417493ccca 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
@@ -1,16 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: PC Chen <pc.chen@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #ifndef _VDEC_VPU_IF_H_
 #define _VDEC_VPU_IF_H_
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
index 6cf31b366aad..0cf08dd7b6e3 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
@@ -1,19 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: Jungchang Tsao <jungchang.tsao@mediatek.com>
- *         Daniel Hsiao <daniel.hsiao@mediatek.com>
- *         PoChun Lin <pochun.lin@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+// SPDX-License-Identifier: GPL-2.0
 
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
index 957420dd60de..3fb9e0c79b4f 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
@@ -1,18 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: Daniel Hsiao <daniel.hsiao@mediatek.com>
- *         PoChun Lin <pochun.lin@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+// SPDX-License-Identifier: GPL-2.0
 
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_base.h b/drivers/media/platform/mtk-vcodec/venc_drv_base.h
index 6308d44dedf6..2de37b47fe73 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_base.h
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_base.h
@@ -1,19 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: Daniel Hsiao <daniel.hsiao@mediatek.com>
- *	Jungchang Tsao <jungchang.tsao@mediatek.com>
- *	Tiffany Lin <tiffany.lin@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #ifndef _VENC_DRV_BASE_
 #define _VENC_DRV_BASE_
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.c b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
index d02d5f1df279..25c1e100f5a1 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
@@ -1,19 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: Daniel Hsiao <daniel.hsiao@mediatek.com>
- *	Jungchang Tsao <jungchang.tsao@mediatek.com>
- *	Tiffany Lin <tiffany.lin@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+// SPDX-License-Identifier: GPL-2.0
 
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.h b/drivers/media/platform/mtk-vcodec/venc_drv_if.h
index 55ecda844894..d6605812ebb0 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_if.h
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.h
@@ -1,19 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: Daniel Hsiao <daniel.hsiao@mediatek.com>
- *		Jungchang Tsao <jungchang.tsao@mediatek.com>
- *		Tiffany Lin <tiffany.lin@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #ifndef _VENC_DRV_IF_H_
 #define _VENC_DRV_IF_H_
diff --git a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
index 4c869cb6fbf7..d5282f24f934 100644
--- a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
@@ -1,19 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: Jungchang Tsao <jungchang.tsao@mediatek.com>
- *	   Daniel Hsiao <daniel.hsiao@mediatek.com>
- *	   Tiffany Lin <tiffany.lin@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #ifndef _VENC_IPI_MSG_H_
 #define _VENC_IPI_MSG_H_
diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
index 0d882acf8830..a6906db74718 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
@@ -1,17 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: PoChun Lin <pochun.lin@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+// SPDX-License-Identifier: GPL-2.0
 
 #include "mtk_vpu.h"
 #include "venc_ipi_msg.h"
diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
index 215d1e01362e..fd4f85646aa5 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
@@ -1,17 +1,4 @@
-/*
- * Copyright (c) 2016 MediaTek Inc.
- * Author: PoChun Lin <pochun.lin@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #ifndef _VENC_VPU_IF_H_
 #define _VENC_VPU_IF_H_
-- 
2.22.0.rc1.311.g5d7573a151-goog

