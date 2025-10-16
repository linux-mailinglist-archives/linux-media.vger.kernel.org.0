Return-Path: <linux-media+bounces-44653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A582BBE1454
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 04:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD7851A203F1
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 02:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E93320FAAB;
	Thu, 16 Oct 2025 02:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="u9HG+AdM"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw.securemx.jp (mo-csw1121.securemx.jp [210.130.202.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0049C186E2E;
	Thu, 16 Oct 2025 02:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760581869; cv=none; b=r4ddp9M5T7toD7KFxBsm5iB58EFa7nubM8jjb8+YoWs9teXAgI2fT6HS5r9f1gcEZxDBLh9ZxZiQiqunlEr/epZDr5rAmgsDRP0qI0sF/x5yUNBuhKQ+hUOiwT80ma4m0JH/iGHTA3IbX9pPWn1CjstoM0Dree0MGAlPpLLW2OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760581869; c=relaxed/simple;
	bh=Q3GIGCaHqkOz9uiSvaUN8RoukDJb8LHRaswje9aJ/yo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ca3g810WUfoTEbYAV/jiYdBZp+4zMft3or1TrxyWZpAT2kK6EcP3Tfk0TbR8mXFXj6GLPeXBGcTWqzD2+PGDTmMdAbC5uK1gsUasdbVD+8fIFCb7Om4X8kmoT7XRHhtvIDnorB/ySGZS17LpEDm+/TcRueDA/qtOhrP0s+VWfNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=u9HG+AdM; arc=none smtp.client-ip=210.130.202.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:Date:
	Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1760581823;x=1761791423;bh=Q3GIGCaHqkOz9uiSvaUN8RoukDJb8LHRaswje9aJ/yo=;b=u9H
	G+AdMKVkgDt4ZXRG+OrFR1/LiBQcFdqWhGJJ+V1N7MIQHR+V6PJMFwtDl8gmg01ri5stR5xrOPFaB
	co1tNRhXawEUZdcwCZL0rYQDTPAic9xRvWzc1P+SuHnp8lsxmLKBVDJ8qlD5y3yT8AnbU/+IWdkyZ
	RzH70TzZo08C5XurjR06wM5olpbM0hrTWCi2AVyrehC43Z5Fn9uumWlOuGHvvPU3xk4XadGgWt62J
	txKZvCrfVcgIx58xLtG1ygxN7jQKgDQaMRadByw5uqsksZqEYli1Y/LK2V13phfANT9E6hQ8T2J1M
	uiIxa97Q7tvbL5hvHXmxR26PTdjTXLg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1121) id 59G2UNol1207852; Thu, 16 Oct 2025 11:30:23 +0900
X-Iguazu-Qid: 2rWhKtyZUCCoDmu4O0
X-Iguazu-QSIG: v=2; s=0; t=1760581823; q=2rWhKtyZUCCoDmu4O0; m=qxt6Wy7hqLg2VqDbCh3mNVdD89PgwhTiLPjKRCyiAq4=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cnBkk3yflz4vyt; Thu, 16 Oct 2025 11:30:22 +0900 (JST)
X-SA-MID: 53072918
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Date: Thu, 16 Oct 2025 11:24:43 +0900
Subject: [PATCH v13 6/7] media: platform: visconti: Add streaming interface
 for ISP parameters and statistics
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TSB-HOP2: ON
Message-Id: <20251016-visconti-viif-v13-6-ceca656b9194@toshiba.co.jp>
References: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
In-Reply-To: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add support to Image Signal Processors of Visconti's Video Input Interface.
This patch adds two streaming interfaces;
one for passing parameters to the signal processor,
the other for receiving statistics.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
Changelog v2:
- Resend v1 because a patch exceeds size limit.

Changelog v3:
- Adapted to media control framework
- Introduced ISP subdevice, capture device
- Remove private IOCTLs and add vendor specific V4L2 controls
- Change function name avoiding camelcase and uppercase letters

Changelog v4:
- Split patches because the v3 patch exceeds size limit
- Stop using ID number to identify driver instance:
  - Use dynamically allocated structure to hold HW specific context,
    instead of static one.
  - Call HW layer functions with the context structure instead of ID number

Changelog v5:
- no change

Changelog v6:
- remove unused macros
- removed hwd_ and HWD_ prefix
- update source code documentation
- Suggestion from Hans Verkuil
  - pointer to userland memory is removed from uAPI arguments
    - style of structure is now "nested" instead of "chained by pointer";
  - use div64_u64 for 64bit division
  - vendor specific controls support TRY_EXT_CTRLS
  - add READ_ONLY flag to GET_CALIBRATION_STATUS control and similar ones
  - human friendry control names for vendor specific controls
  - add initial value to each vendor specific control
  - GET_LAST_CAPTURE_STATUS control is updated asyncnously from workqueue
  - remove EXECUTE_ON_WRITE flag of vendor specific control
  - uAPI: return value of GET_CALIBRATION_STATUS follows common rules of error codes
  - applied v4l2-compliance
- Suggestion from Sakari Ailus
  - use div64_u64 for 64bit division
  - update copyright's year
  - remove redandunt cast
  - use bool instead of HWD_VIIF_ENABLE/DISABLE
  - simplify comparison to 0
  - simplify statements with trigram operator
  - remove redundant local variables
  - use general integer types instead of u32/s32
- Suggestion from Laurent Pinchart
  - moved VIIF driver to driver/platform/toshiba/visconti
  - change register access: struct-style to macro-style
  - remove unused type definitions
  - define enums instead of successive macro constants
  - remove redundant parenthesis of macro constant
  - embed struct hwd_res into struct viif_device
  - use xxx_dma instead of xxx_paddr for variable names of IOVA
  - literal value: just 0 instead of 0x0
  - use literal 1 or 0 instead of HWD_VIIF_ENABLE, DISABLE for register access
  - use true or false instead of HWD_VIIF_ENABLE, DISABLE for function calls
  - uAPI: return value of GET_CALIBRATION_STATUS follows common rules of error codes

Changelog v7:
- remove unused variables
- split long statements which have multiple logical-OR and trigram operators

Changelog v8:
- define constant V4L2_CTRL_TYPE_VISCONTI_ISP for datatype
  of Visconti specific controls
- Suggestion from Hans Verkuil
  - remove pr_info()
  - use pm_runtime_get_if_in_use() to get power status

Changelog v9:
- fix warning for cast between ptr and dma_addr_t

Changelog v10:
- use parameter buffer instead of vendor specific compound controls
  - add viif_params interface for passing ISP parameters
  - add viif_stats interface for passing ISP status
- remove parameter validation routine; moved to userland library

Changelog v11:
- remove feature VB2_USERPTR from viif_params and viif_stats
- fix strange indents at initializations
- remove a redundant default setting of the ISP: L2_ROI
- update copyright year

Changelog v12:
- use guard(spinlock)(locked_variable) macros
  - also use custom guard macros for viif_isp_guard
- improve cast operations for viif_dev->tables_dma
- add default parameter for undistortion (identical transformation)
- add function to calculate the default scaling
  according to the request from the resizer subdevice

Changelog v13:
- wrap one line at 80 characters
- change banner comment style
- update comment style; spacing at the start and end, capitalize first letter
- remove redundant inline qualifier
- remove unused constants
- use system clock rate obtained from the framework, instead of constant value
- remove U suffix on numeric value
- remove members indicating status; they are moved to debugfs
- remove unused members from statistics interface
- fix v4l-compliance fail: v4l2-test-buffers.cpp(924): q.create_bufs(node, 1, &fmt) != EINVAL
- use ffs() instead of gen_grid_size()
- change signature of viif_apply_queued_parameter; int -> bool
- use ARRAY_SIZE macros for maximum loop iterations
- use scoped_guard() to acquire a lock
- use list_for_each_entry_safe() to modify list
- shorten the names of ISP guard functions.
---
 drivers/media/platform/toshiba/visconti/Makefile   |    2 +-
 drivers/media/platform/toshiba/visconti/viif.c     |   27 +-
 drivers/media/platform/toshiba/visconti/viif_isp.c |    5 +
 .../media/platform/toshiba/visconti/viif_params.c  | 2257 ++++++++++++++++++++
 .../media/platform/toshiba/visconti/viif_params.h  |   20 +
 .../media/platform/toshiba/visconti/viif_stats.c   |  320 +++
 .../media/platform/toshiba/visconti/viif_stats.h   |   16 +
 7 files changed, 2644 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/toshiba/visconti/Makefile b/drivers/media/platform/toshiba/visconti/Makefile
index e9fe874d6447..da493e21532d 100644
--- a/drivers/media/platform/toshiba/visconti/Makefile
+++ b/drivers/media/platform/toshiba/visconti/Makefile
@@ -4,7 +4,7 @@
 #
 
 visconti-csi2rx-objs = csi2rx_drv.o
-visconti-viif-objs = viif.o viif_capture.o viif_common.o viif_isp.o
+visconti-viif-objs = viif.o viif_capture.o viif_common.o viif_isp.o viif_params.o viif_stats.o
 
 obj-$(CONFIG_VIDEO_VISCONTI_CSI2RX) += visconti-csi2rx.o
 obj-$(CONFIG_VIDEO_VISCONTI_VIIF) += visconti-viif.o
diff --git a/drivers/media/platform/toshiba/visconti/viif.c b/drivers/media/platform/toshiba/visconti/viif.c
index 16e8f108d996..04b4e3295645 100644
--- a/drivers/media/platform/toshiba/visconti/viif.c
+++ b/drivers/media/platform/toshiba/visconti/viif.c
@@ -24,7 +24,9 @@
 #include "viif_capture.h"
 #include "viif_common.h"
 #include "viif_isp.h"
+#include "viif_params.h"
 #include "viif_regs.h"
+#include "viif_stats.h"
 
 /*----------------------------------------------
  * Register Access
@@ -144,6 +146,9 @@ static irqreturn_t viif_vsync_irq_handler(int irq, void *dev_id)
 		visconti_viif_capture_switch_buffer(&viif_dev->cap_post1,
 						    status_err,
 						    l2_transfer_status, ts);
+		visconti_viif_stats_isr(viif_dev, viif_dev->cap_post0.sequence,
+					ts);
+		visconti_viif_params_isr(viif_dev);
 	}
 
 	/* Delayed Vsync of SUB unit */
@@ -533,13 +538,25 @@ static int visconti_viif_probe(struct platform_device *pdev)
 		goto error_isp_unregister;
 	}
 
+	ret = visconti_viif_params_register(viif_dev);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to register parameter node\n");
+		goto error_capture_unregister;
+	}
+
+	ret = visconti_viif_stats_register(viif_dev);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to register stat node\n");
+		goto error_params_unregister;
+	}
+
 	ret = visconti_viif_create_links(viif_dev);
 	if (ret)
-		goto error_capture_unregister;
+		goto error_stats_unregister;
 
 	ret = visconti_viif_subdev_notifier_register(viif_dev);
 	if (ret)
-		goto error_capture_unregister;
+		goto error_stats_unregister;
 
 #ifdef CONFIG_DEBUG_FS
 	viif_debug_init(viif_dev);
@@ -547,6 +564,10 @@ static int visconti_viif_probe(struct platform_device *pdev)
 
 	return 0;
 
+error_stats_unregister:
+	visconti_viif_stats_unregister(viif_dev);
+error_params_unregister:
+	visconti_viif_params_unregister(viif_dev);
 error_capture_unregister:
 	visconti_viif_capture_unregister(viif_dev);
 error_isp_unregister:
@@ -576,6 +597,8 @@ static void visconti_viif_remove(struct platform_device *pdev)
 
 	v4l2_async_nf_unregister(&viif_dev->notifier);
 	v4l2_async_nf_cleanup(&viif_dev->notifier);
+	visconti_viif_stats_unregister(viif_dev);
+	visconti_viif_params_unregister(viif_dev);
 	visconti_viif_capture_unregister(viif_dev);
 	visconti_viif_isp_unregister(viif_dev);
 	media_device_unregister(&viif_dev->media_dev);
diff --git a/drivers/media/platform/toshiba/visconti/viif_isp.c b/drivers/media/platform/toshiba/visconti/viif_isp.c
index 6ad4723a37cc..db00db79ab06 100644
--- a/drivers/media/platform/toshiba/visconti/viif_isp.c
+++ b/drivers/media/platform/toshiba/visconti/viif_isp.c
@@ -15,6 +15,7 @@
 #include "viif.h"
 #include "viif_common.h"
 #include "viif_isp.h"
+#include "viif_params.h"
 #include "viif_regs.h"
 
 /* Disable CSI2 capture at viif_mux_start() */
@@ -559,6 +560,9 @@ int visconti_viif_isp_main_set_unit(struct viif_device *viif_dev)
 	/* Enable regbuf */
 	visconti_viif_isp_set_regbuf_auto_transmission(viif_dev);
 
+	/* L2 Undist: enable through mode as default */
+	visconti_viif_l2_undist_through(viif_dev);
+
 	return 0;
 }
 
@@ -612,6 +616,7 @@ static int visconti_viif_isp_enable_streams(struct v4l2_subdev *sd,
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
 	/* Enabling: start ISP, MUX -> start CSI2RX, sensor */
+	visconti_viif_params_eval_queue(viif_dev);
 	viif_dev->masked_gamma_path = 0;
 	viif_mux_start(viif_dev, 0, 0);
 
diff --git a/drivers/media/platform/toshiba/visconti/viif_params.c b/drivers/media/platform/toshiba/visconti/viif_params.c
new file mode 100644
index 000000000000..047ac5e74814
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/viif_params.c
@@ -0,0 +1,2257 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/*
+ * Toshiba Visconti Video Capture Support
+ *
+ * (C) Copyright 2025 TOSHIBA CORPORATION
+ * (C) Copyright 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/pm_runtime.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-vmalloc.h>
+
+#include "viif.h"
+#include "viif_capture.h"
+#include "viif_common.h"
+#include "viif_isp.h"
+#include "viif_params.h"
+#include "viif_regs.h"
+
+/* ISP_L1_SET_HDRC */
+#define VIIF_L1_HDRC_RATIO_OFFSET 10
+#define VIIF_REGBUF_ACCESS_TIME	  15360
+#define VIIF_L1_DELAY_W_HDRC	  31
+
+/* V4L2_CID_VISCONTI_VIIF_ISP_L2_SET_UNDIST */
+#define VIIF_L2_UNDIST_POLY_NUM 11
+
+#define VIIF_PARAMS_REQ_BUFS_MIN 2
+#define VIIF_PARAMS_REQ_BUFS_MAX 8
+
+/*----------------------------------------------
+ * ISP parameter configuration
+ */
+static void viif_l1_set_input_mode(struct viif_device *viif_dev,
+				   const struct viif_l1_input_mode_config *arg)
+{
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	viif_capture_write(viif_dev, REG_L1_SYSM_INPUT_MODE, (u32)arg->mode);
+}
+
+static void
+viif_l1_set_rgb_to_y_coef(struct viif_device *viif_dev,
+			  const struct viif_l1_rgb_to_y_coef_config *arg)
+{
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	viif_capture_write(viif_dev, REG_L1_SYSM_YCOEF_R, (u32)arg->coef_r);
+	viif_capture_write(viif_dev, REG_L1_SYSM_YCOEF_G, (u32)arg->coef_g);
+	viif_capture_write(viif_dev, REG_L1_SYSM_YCOEF_B, (u32)arg->coef_b);
+}
+
+static void viif_l1_set_ag_mode(struct viif_device *viif_dev,
+				const struct viif_l1_ag_mode_config *arg)
+{
+	u32 val;
+
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	/* SYSM_AG_PARAM */
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_PARAM_A,
+			   PACK_L1_SYSM_AG_PARAM(arg->sysm_ag_grad[0],
+						 arg->sysm_ag_ofst[0]));
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_PARAM_B,
+			   PACK_L1_SYSM_AG_PARAM(arg->sysm_ag_grad[1],
+						 arg->sysm_ag_ofst[1]));
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_PARAM_C,
+			   PACK_L1_SYSM_AG_PARAM(arg->sysm_ag_grad[2],
+						 arg->sysm_ag_ofst[2]));
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_PARAM_D,
+			   PACK_L1_SYSM_AG_PARAM(arg->sysm_ag_grad[3],
+						 arg->sysm_ag_ofst[3]));
+
+	/* SYSM_AG_SEL */
+	viif_capture_write(
+		viif_dev, REG_L1_SYSM_AG_SEL_HOBC,
+		PACK_L1_SYSM_AG_SEL_HML(arg->sysm_ag_psel_hobc_high,
+					arg->sysm_ag_psel_hobc_middle_led,
+					arg->sysm_ag_psel_hobc_low));
+	viif_capture_write(
+		viif_dev, REG_L1_SYSM_AG_SEL_ABPC,
+		PACK_L1_SYSM_AG_SEL_HML(arg->sysm_ag_psel_abpc_high,
+					arg->sysm_ag_psel_abpc_middle_led,
+					arg->sysm_ag_psel_abpc_low));
+	viif_capture_write(
+		viif_dev, REG_L1_SYSM_AG_SEL_RCNR,
+		PACK_L1_SYSM_AG_SEL_HML(arg->sysm_ag_psel_rcnr_high,
+					arg->sysm_ag_psel_rcnr_middle_led,
+					arg->sysm_ag_psel_rcnr_low));
+
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_SEL_LSSC,
+			   PACK_L1_SYSM_AG_SEL_SP(arg->sysm_ag_ssel_lssc,
+						  arg->sysm_ag_psel_lssc));
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_SEL_MPRO,
+			   PACK_L1_SYSM_AG_SEL_SP(arg->sysm_ag_ssel_mpro,
+						  arg->sysm_ag_psel_mpro));
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_SEL_VPRO,
+			   PACK_L1_SYSM_AG_SEL_SP(arg->sysm_ag_ssel_vpro,
+						  arg->sysm_ag_psel_vpro));
+
+	/* SYSM_AG_CONT */
+	val = arg->sysm_ag_cont_hobc_en_middle_led ? MASK_L1_SYSM_AG_CONT_M_EN :
+						     0;
+	val |= FIELD_PREP(MASK_L1_SYSM_AG_CONT_M_VAL,
+			  arg->sysm_ag_cont_hobc_test_middle_led);
+	val |= arg->sysm_ag_cont_hobc_en_high ? MASK_L1_SYSM_AG_CONT_H_EN : 0;
+	val |= FIELD_PREP(MASK_L1_SYSM_AG_CONT_H_VAL,
+			  arg->sysm_ag_cont_hobc_test_high);
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_CONT_HOBC01_EN, val);
+
+	val = arg->sysm_ag_cont_hobc_en_low ? MASK_L1_SYSM_AG_CONT_L_EN : 0;
+	val |= FIELD_PREP(MASK_L1_SYSM_AG_CONT_L_VAL,
+			  arg->sysm_ag_cont_hobc_test_low);
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_CONT_HOBC2_EN, val);
+
+	val = arg->sysm_ag_cont_abpc_en_middle_led ? MASK_L1_SYSM_AG_CONT_M_EN :
+						     0;
+	val |= FIELD_PREP(MASK_L1_SYSM_AG_CONT_M_VAL,
+			  arg->sysm_ag_cont_abpc_test_middle_led);
+	val |= arg->sysm_ag_cont_abpc_en_high ? MASK_L1_SYSM_AG_CONT_H_EN : 0;
+	val |= FIELD_PREP(MASK_L1_SYSM_AG_CONT_H_VAL,
+			  arg->sysm_ag_cont_abpc_test_high);
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_CONT_ABPC01_EN, val);
+
+	val = arg->sysm_ag_cont_abpc_en_low ? MASK_L1_SYSM_AG_CONT_L_EN : 0;
+	val |= FIELD_PREP(MASK_L1_SYSM_AG_CONT_L_VAL,
+			  arg->sysm_ag_cont_abpc_test_low);
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_CONT_ABPC2_EN, val);
+
+	val = arg->sysm_ag_cont_rcnr_en_middle_led ? MASK_L1_SYSM_AG_CONT_M_EN :
+						     0;
+	val |= FIELD_PREP(MASK_L1_SYSM_AG_CONT_M_VAL,
+			  arg->sysm_ag_cont_rcnr_test_middle_led);
+	val |= arg->sysm_ag_cont_rcnr_en_high ? MASK_L1_SYSM_AG_CONT_H_EN : 0;
+	val |= FIELD_PREP(MASK_L1_SYSM_AG_CONT_H_VAL,
+			  arg->sysm_ag_cont_rcnr_test_high);
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_CONT_RCNR01_EN, val);
+
+	val = arg->sysm_ag_cont_rcnr_en_low ? MASK_L1_SYSM_AG_CONT_L_EN : 0;
+	val |= FIELD_PREP(MASK_L1_SYSM_AG_CONT_L_VAL,
+			  arg->sysm_ag_cont_rcnr_test_low);
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_CONT_RCNR2_EN, val);
+
+	val = arg->sysm_ag_cont_lssc_en ? MASK_L1_SYSM_AG_CONT_EN : 0;
+	val |= FIELD_PREP(MASK_L1_SYSM_AG_CONT_VAL,
+			  arg->sysm_ag_cont_lssc_test);
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_CONT_LSSC_EN, val);
+
+	val = arg->sysm_ag_cont_mpro_en ? MASK_L1_SYSM_AG_CONT_EN : 0;
+	val |= FIELD_PREP(MASK_L1_SYSM_AG_CONT_VAL,
+			  arg->sysm_ag_cont_mpro_test);
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_CONT_MPRO_EN, val);
+
+	val = arg->sysm_ag_cont_vpro_en ? MASK_L1_SYSM_AG_CONT_EN : 0;
+	val |= FIELD_PREP(MASK_L1_SYSM_AG_CONT_VAL,
+			  arg->sysm_ag_cont_vpro_test);
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_CONT_VPRO_EN, val);
+}
+
+static void viif_l1_set_ag(struct viif_device *viif_dev,
+			   const struct viif_l1_ag_config *arg)
+{
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_H, (u32)arg->gain_h);
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_M, (u32)arg->gain_m);
+	viif_capture_write(viif_dev, REG_L1_SYSM_AG_L, (u32)arg->gain_l);
+}
+
+static void viif_l1_set_hdre(struct viif_device *viif_dev,
+			     const struct viif_l1_hdre_config *arg)
+{
+	int i;
+
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	for (i = 0; i < LEN_L1_HDRE_SRCPOINT; i++)
+		viif_capture_write(viif_dev, REG_L1_HDRE_SRCPOINT(i),
+				   arg->hdre_src_point[i]);
+
+	viif_capture_write(viif_dev, REG_L1_HDRE_SRCBASE(0), 0);
+	for (i = 1; i < LEN_L1_HDRE_SRCBASE; i++)
+		viif_capture_write(viif_dev, REG_L1_HDRE_SRCBASE(i),
+				   arg->hdre_src_point[i - 1]);
+
+	for (i = 0; i < LEN_L1_HDRE_DSTBASE; i++)
+		viif_capture_write(viif_dev, REG_L1_HDRE_DSTBASE(i),
+				   arg->hdre_dst_base[i]);
+
+	for (i = 0; i < LEN_L1_HDRE_RATIO; i++)
+		viif_capture_write(viif_dev, REG_L1_HDRE_RATIO(i),
+				   arg->hdre_ratio[i]);
+
+	viif_capture_write(viif_dev, REG_L1_HDRE_DSTMAXVAL,
+			   arg->hdre_dst_max_val);
+}
+
+static void
+viif_l1_set_img_extraction(struct viif_device *viif_dev,
+			   const struct viif_l1_img_extraction_config *arg)
+{
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	viif_capture_write(viif_dev, REG_L1_SLIC_SRCBLACKLEVEL_GR,
+			   arg->input_black_gr);
+	viif_capture_write(viif_dev, REG_L1_SLIC_SRCBLACKLEVEL_R,
+			   arg->input_black_r);
+	viif_capture_write(viif_dev, REG_L1_SLIC_SRCBLACKLEVEL_B,
+			   arg->input_black_b);
+	viif_capture_write(viif_dev, REG_L1_SLIC_SRCBLACKLEVEL_GB,
+			   arg->input_black_gb);
+}
+
+static void viif_config_vdm_tgroup(struct viif_device *viif_dev, int idx)
+{
+	const struct {
+		u32 cfg;
+		u32 sram_base;
+		u32 sram_size;
+	} conf[] = {
+		/* T01: L1_SET_DPC, L1_SET_LSC */
+		{ VAL_TGROUP_CFG_64BIT_RD, 0x600, 0x20 },
+		/* T02: L2_UNDIST grid table */
+		{ VAL_TGROUP_CFG_32BIT_RD, 0x620, 0x20 },
+		/* T02: L2_GAMMA (path0) */
+		{ VAL_TGROUP_CFG_32BIT_RD, 0x640, 0x20 },
+		/* T03: L2 GAMMA (path1) */
+		{ VAL_TGROUP_CFG_32BIT_RD, 0x660, 0x20 },
+	};
+
+	viif_capture_write(viif_dev, REG_VDM_TGROUP_X_CFG(idx), conf[idx].cfg);
+	viif_capture_write(viif_dev, REG_VDM_TGROUP_X_SRAM_BASE(idx),
+			   conf[idx].sram_base);
+	viif_capture_write(viif_dev, REG_VDM_TGROUP_X_SRAM_SIZE(idx),
+			   conf[idx].sram_size);
+}
+
+static void dpc_table_transmission(struct viif_device *viif_dev,
+				   uintptr_t table_h, uintptr_t table_m,
+				   uintptr_t table_l)
+{
+	u32 val = 0;
+
+	viif_config_vdm_tgroup(viif_dev, IDX_TGROUP_L1_ISP);
+
+	if (table_h) {
+		viif_capture_write(viif_dev,
+				   REG_VDM_TPORT_X_STADR(IDX_TPORT_L1_DPC_H),
+				   (u32)table_h);
+		viif_capture_write(viif_dev,
+				   REG_VDM_TPORT_X_SIZE(IDX_TPORT_L1_DPC_H),
+				   VIIF_DPC_TABLE_BYTES);
+		val |= MASK_VDM_T_ENABLE_L1_DPC_H;
+	}
+
+	if (table_m) {
+		viif_capture_write(viif_dev,
+				   REG_VDM_TPORT_X_STADR(IDX_TPORT_L1_DPC_M),
+				   (u32)table_m);
+		viif_capture_write(viif_dev,
+				   REG_VDM_TPORT_X_SIZE(IDX_TPORT_L1_DPC_M),
+				   VIIF_DPC_TABLE_BYTES);
+		val |= MASK_VDM_T_ENABLE_L1_DPC_M;
+	}
+
+	if (table_l) {
+		viif_capture_write(viif_dev,
+				   REG_VDM_TPORT_X_STADR(IDX_TPORT_L1_DPC_L),
+				   (u32)table_l);
+		viif_capture_write(viif_dev,
+				   REG_VDM_TPORT_X_SIZE(IDX_TPORT_L1_DPC_L),
+				   VIIF_DPC_TABLE_BYTES);
+		val |= MASK_VDM_T_ENABLE_L1_DPC_L;
+	}
+
+	val |= (viif_capture_read(viif_dev, REG_VDM_T_ENABLE) &
+		~MASK_VDM_T_ENABLE_L1_DPC);
+	viif_capture_write(viif_dev, REG_VDM_T_ENABLE, val);
+}
+
+static void viif_l1_set_dpc(struct viif_device *viif_dev,
+			    const struct viif_l1_dpc_config *arg)
+{
+	const struct viif_l1_dpc *param_h, *param_m, *param_l;
+	dma_addr_t table_h = 0, table_m = 0, table_l = 0;
+	u32 val;
+
+	if (arg->param_h.abpc_sta_en) {
+		memcpy(viif_dev->tables->dpc_table_h, arg->table_h,
+		       VIIF_DPC_TABLE_BYTES);
+		table_h = viif_dev->tables_dma +
+			  offsetof(struct viif_table_area, dpc_table_h);
+	}
+	if (arg->param_m.abpc_sta_en) {
+		memcpy(viif_dev->tables->dpc_table_m, arg->table_m,
+		       VIIF_DPC_TABLE_BYTES);
+		table_m = viif_dev->tables_dma +
+			  offsetof(struct viif_table_area, dpc_table_m);
+	}
+	if (arg->param_l.abpc_sta_en) {
+		memcpy(viif_dev->tables->dpc_table_l, arg->table_l,
+		       VIIF_DPC_TABLE_BYTES);
+		table_l = viif_dev->tables_dma +
+			  offsetof(struct viif_table_area, dpc_table_l);
+	}
+
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	dpc_table_transmission(viif_dev, table_h, table_m, table_l);
+
+	param_h = &arg->param_h;
+	param_m = &arg->param_m;
+	param_l = &arg->param_l;
+
+	val = (param_h->abpc_sta_en) ? MASK_L1_ABPC_ENABLE_H : 0;
+	val |= (param_m->abpc_sta_en) ? MASK_L1_ABPC_ENABLE_M : 0;
+	val |= (param_l->abpc_sta_en) ? MASK_L1_ABPC_ENABLE_L : 0;
+	viif_capture_write(viif_dev, REG_L1_ABPC012_STA_EN, val);
+
+	val = (param_h->abpc_dyn_en) ? MASK_L1_ABPC_ENABLE_H : 0;
+	val |= (param_m->abpc_dyn_en) ? MASK_L1_ABPC_ENABLE_M : 0;
+	val |= (param_l->abpc_dyn_en) ? MASK_L1_ABPC_ENABLE_L : 0;
+	viif_capture_write(viif_dev, REG_L1_ABPC012_DYN_EN, val);
+
+	val = (param_h->abpc_dyn_mode == VIIF_L1_DPC_2PIXEL) ?
+		      MASK_L1_ABPC_DYN_MODE_2PIXEL_H :
+		      0;
+	val |= (param_m->abpc_dyn_mode == VIIF_L1_DPC_2PIXEL) ?
+		       MASK_L1_ABPC_DYN_MODE_2PIXEL_M :
+		       0;
+	val |= (param_l->abpc_dyn_mode == VIIF_L1_DPC_2PIXEL) ?
+		       MASK_L1_ABPC_DYN_MODE_2PIXEL_L :
+		       0;
+	viif_capture_write(viif_dev, REG_L1_ABPC012_DYN_MODE, val);
+
+	/* Setup param_h */
+	viif_capture_write(viif_dev, REG_L1_ABPC0_RATIO_LIMIT,
+			   param_h->abpc_ratio_limit);
+	viif_capture_write(viif_dev, REG_L1_ABPC0_DARK_LIMIT,
+			   param_h->abpc_dark_limit);
+	viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_W_AG_MIN,
+			   param_h->abpc_sn_coef_w_ag_min);
+	viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_W_AG_MID,
+			   param_h->abpc_sn_coef_w_ag_mid);
+	viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_W_AG_MAX,
+			   param_h->abpc_sn_coef_w_ag_max);
+	viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_B_AG_MIN,
+			   param_h->abpc_sn_coef_b_ag_min);
+	viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_B_AG_MID,
+			   param_h->abpc_sn_coef_b_ag_mid);
+	viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_B_AG_MAX,
+			   param_h->abpc_sn_coef_b_ag_max);
+	viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_W_TH_MIN,
+			   param_h->abpc_sn_coef_w_th_min);
+	viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_W_TH_MAX,
+			   param_h->abpc_sn_coef_w_th_max);
+	viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_B_TH_MIN,
+			   param_h->abpc_sn_coef_b_th_min);
+	viif_capture_write(viif_dev, REG_L1_ABPC0_SN_COEF_B_TH_MAX,
+			   param_h->abpc_sn_coef_b_th_max);
+
+	/* Setup param_m */
+	viif_capture_write(viif_dev, REG_L1_ABPC1_RATIO_LIMIT,
+			   param_m->abpc_ratio_limit);
+	viif_capture_write(viif_dev, REG_L1_ABPC1_DARK_LIMIT,
+			   param_m->abpc_dark_limit);
+	viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_W_AG_MIN,
+			   param_m->abpc_sn_coef_w_ag_min);
+	viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_W_AG_MID,
+			   param_m->abpc_sn_coef_w_ag_mid);
+	viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_W_AG_MAX,
+			   param_m->abpc_sn_coef_w_ag_max);
+	viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_B_AG_MIN,
+			   param_m->abpc_sn_coef_b_ag_min);
+	viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_B_AG_MID,
+			   param_m->abpc_sn_coef_b_ag_mid);
+	viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_B_AG_MAX,
+			   param_m->abpc_sn_coef_b_ag_max);
+	viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_W_TH_MIN,
+			   param_m->abpc_sn_coef_w_th_min);
+	viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_W_TH_MAX,
+			   param_m->abpc_sn_coef_w_th_max);
+	viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_B_TH_MIN,
+			   param_m->abpc_sn_coef_b_th_min);
+	viif_capture_write(viif_dev, REG_L1_ABPC1_SN_COEF_B_TH_MAX,
+			   param_m->abpc_sn_coef_b_th_max);
+
+	/* Setup param_l */
+	viif_capture_write(viif_dev, REG_L1_ABPC2_RATIO_LIMIT,
+			   param_l->abpc_ratio_limit);
+	viif_capture_write(viif_dev, REG_L1_ABPC2_DARK_LIMIT,
+			   param_l->abpc_dark_limit);
+	viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_W_AG_MIN,
+			   param_l->abpc_sn_coef_w_ag_min);
+	viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_W_AG_MID,
+			   param_l->abpc_sn_coef_w_ag_mid);
+	viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_W_AG_MAX,
+			   param_l->abpc_sn_coef_w_ag_max);
+	viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_B_AG_MIN,
+			   param_l->abpc_sn_coef_b_ag_min);
+	viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_B_AG_MID,
+			   param_l->abpc_sn_coef_b_ag_mid);
+	viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_B_AG_MAX,
+			   param_l->abpc_sn_coef_b_ag_max);
+	viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_W_TH_MIN,
+			   param_l->abpc_sn_coef_w_th_min);
+	viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_W_TH_MAX,
+			   param_l->abpc_sn_coef_w_th_max);
+	viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_B_TH_MIN,
+			   param_l->abpc_sn_coef_b_th_min);
+	viif_capture_write(viif_dev, REG_L1_ABPC2_SN_COEF_B_TH_MAX,
+			   param_l->abpc_sn_coef_b_th_max);
+}
+
+static void viif_l1_set_preset_white_balance(
+	struct viif_device *viif_dev,
+	const struct viif_l1_preset_white_balance_config *arg)
+{
+	const struct viif_l1_preset_wb *param_h, *param_m, *param_l;
+
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	param_h = &arg->param_h;
+	param_m = &arg->param_m;
+	param_l = &arg->param_l;
+
+	viif_capture_write(viif_dev, REG_L1_PWHB_DSTMAXVAL, arg->dstmaxval);
+
+	viif_capture_write(viif_dev, REG_L1_PWHB_H_GR, param_h->gain_gr);
+	viif_capture_write(viif_dev, REG_L1_PWHB_HR, param_h->gain_r);
+	viif_capture_write(viif_dev, REG_L1_PWHB_HB, param_h->gain_b);
+	viif_capture_write(viif_dev, REG_L1_PWHB_H_GB, param_h->gain_gb);
+
+	viif_capture_write(viif_dev, REG_L1_PWHB_M_GR, param_m->gain_gr);
+	viif_capture_write(viif_dev, REG_L1_PWHB_MR, param_m->gain_r);
+	viif_capture_write(viif_dev, REG_L1_PWHB_MB, param_m->gain_b);
+	viif_capture_write(viif_dev, REG_L1_PWHB_M_GB, param_m->gain_gb);
+
+	viif_capture_write(viif_dev, REG_L1_PWHB_L_GR, param_l->gain_gr);
+	viif_capture_write(viif_dev, REG_L1_PWHB_LR, param_l->gain_r);
+	viif_capture_write(viif_dev, REG_L1_PWHB_LB, param_l->gain_b);
+	viif_capture_write(viif_dev, REG_L1_PWHB_L_GB, param_l->gain_gb);
+}
+
+static void viif_l1_set_raw_color_noise_reduction(
+	struct viif_device *viif_dev,
+	const struct viif_l1_raw_color_noise_reduction_config *arg)
+{
+	const struct viif_l1_raw_color_noise_reduction *params[] = {
+		&arg->param_h,
+		&arg->param_m,
+		&arg->param_l,
+	};
+	int i;
+
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	for (i = 0; i < 3; i++) {
+		const struct viif_l1_raw_color_noise_reduction *param =
+			params[i];
+		/* param_h */
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_SW(i),
+				   param->rcnr_sw ? 1 : 0);
+
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_CNF_DARK_AG0(i),
+				   param->rcnr_cnf_dark_ag0);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_CNF_DARK_AG1(i),
+				   param->rcnr_cnf_dark_ag1);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_CNF_DARK_AG2(i),
+				   param->rcnr_cnf_dark_ag2);
+
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_CNF_RATIO_AG0(i),
+				   param->rcnr_cnf_ratio_ag0);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_CNF_RATIO_AG1(i),
+				   param->rcnr_cnf_ratio_ag1);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_CNF_RATIO_AG2(i),
+				   param->rcnr_cnf_ratio_ag2);
+
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_CNF_CLIP_GAIN_R(i),
+				   param->rcnr_cnf_clip_gain_r);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_CNF_CLIP_GAIN_G(i),
+				   param->rcnr_cnf_clip_gain_g);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_CNF_CLIP_GAIN_B(i),
+				   param->rcnr_cnf_clip_gain_b);
+
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_A1L_DARK_AG0(i),
+				   param->rcnr_a1l_dark_ag0);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_A1L_DARK_AG1(i),
+				   param->rcnr_a1l_dark_ag1);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_A1L_DARK_AG2(i),
+				   param->rcnr_a1l_dark_ag2);
+
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_A1L_RATIO_AG0(i),
+				   param->rcnr_a1l_ratio_ag0);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_A1L_RATIO_AG1(i),
+				   param->rcnr_a1l_ratio_ag1);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_A1L_RATIO_AG2(i),
+				   param->rcnr_a1l_ratio_ag2);
+
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_INF_ZERO_CLIP(i),
+				   param->rcnr_inf_zero_clip);
+
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_MERGE_D2BLEND_AG0(i),
+				   param->rcnr_merge_d2blend_ag0);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_MERGE_D2BLEND_AG1(i),
+				   param->rcnr_merge_d2blend_ag1);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_MERGE_D2BLEND_AG2(i),
+				   param->rcnr_merge_d2blend_ag2);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_MERGE_BLACK(i),
+				   param->rcnr_merge_black);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_MERGE_MINDIV(i),
+				   param->rcnr_merge_mindiv);
+
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_HRY_TYPE(i),
+				   param->rcnr_hry_type);
+
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_ANF_BLEND_AG0(i),
+				   param->rcnr_anf_blend_ag0);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_ANF_BLEND_AG1(i),
+				   param->rcnr_anf_blend_ag1);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_ANF_BLEND_AG2(i),
+				   param->rcnr_anf_blend_ag2);
+
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_LPF_THRESHOLD(i),
+				   param->rcnr_lpf_threshold);
+
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_MERGE_HLBLEND_AG0(i),
+				   param->rcnr_merge_hlblend_ag0);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_MERGE_HLBLEND_AG1(i),
+				   param->rcnr_merge_hlblend_ag1);
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_MERGE_HLBLEND_AG2(i),
+				   param->rcnr_merge_hlblend_ag2);
+
+		viif_capture_write(viif_dev, REG_L1_RCNR_X_GNR_SW(i),
+				   param->rcnr_gnr_sw ? 1 : 0);
+
+		if (param->rcnr_gnr_sw) {
+			viif_capture_write(viif_dev, REG_L1_RCNR_X_GNR_RATIO(i),
+					   param->rcnr_gnr_ratio);
+			viif_capture_write(viif_dev,
+					   REG_L1_RCNR_X_GNR_WIDE_EN(i),
+					   param->rcnr_gnr_wide_en ? 1 : 0);
+		}
+	}
+}
+
+static void viif_l1_set_hdrs(struct viif_device *viif_dev,
+			     const struct viif_l1_hdrs_config *arg)
+{
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	viif_capture_write(viif_dev, REG_L1_HDRS_HDRMODE, arg->hdrs_hdr_mode);
+
+	viif_capture_write(viif_dev, REG_L1_HDRS_HDRRATIO_M,
+			   arg->hdrs_hdr_ratio_m);
+	viif_capture_write(viif_dev, REG_L1_HDRS_HDRRATIO_L,
+			   arg->hdrs_hdr_ratio_l);
+	viif_capture_write(viif_dev, REG_L1_HDRS_HDRRATIO_E,
+			   arg->hdrs_hdr_ratio_e);
+
+	viif_capture_write(viif_dev, REG_L1_HDRS_DG_H, arg->hdrs_dg_h);
+	viif_capture_write(viif_dev, REG_L1_HDRS_DG_M, arg->hdrs_dg_m);
+	viif_capture_write(viif_dev, REG_L1_HDRS_DG_L, arg->hdrs_dg_l);
+	viif_capture_write(viif_dev, REG_L1_HDRS_DG_E, arg->hdrs_dg_e);
+
+	viif_capture_write(viif_dev, REG_L1_HDRS_BLENDEND_H,
+			   arg->hdrs_blendend_h);
+	viif_capture_write(viif_dev, REG_L1_HDRS_BLENDEND_M,
+			   arg->hdrs_blendend_m);
+	viif_capture_write(viif_dev, REG_L1_HDRS_BLENDEND_E,
+			   arg->hdrs_blendend_e);
+
+	viif_capture_write(viif_dev, REG_L1_HDRS_BLENDBEG_H,
+			   arg->hdrs_blendbeg_h);
+	viif_capture_write(viif_dev, REG_L1_HDRS_BLENDBEG_M,
+			   arg->hdrs_blendbeg_m);
+	viif_capture_write(viif_dev, REG_L1_HDRS_BLENDBEG_E,
+			   arg->hdrs_blendbeg_e);
+
+	viif_capture_write(viif_dev, REG_L1_HDRS_LEDMODE_ON,
+			   arg->hdrs_led_mode_on ? 1 : 0);
+	viif_capture_write(viif_dev, REG_L1_HDRS_DSTMAXVAL,
+			   arg->hdrs_dst_max_val);
+}
+
+static void viif_l1_set_black_level_correction(
+	struct viif_device *viif_dev,
+	const struct viif_l1_black_level_correction_config *arg)
+{
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	viif_capture_write(viif_dev, REG_L1_BLVC_SRCBLACKLEVEL_GR,
+			   arg->srcblacklevel_gr);
+	viif_capture_write(viif_dev, REG_L1_BLVC_SRCBLACKLEVEL_R,
+			   arg->srcblacklevel_r);
+	viif_capture_write(viif_dev, REG_L1_BLVC_SRCBLACKLEVEL_B,
+			   arg->srcblacklevel_b);
+	viif_capture_write(viif_dev, REG_L1_BLVC_SRCBLACKLEVELGB,
+			   arg->srcblacklevel_gb);
+
+	viif_capture_write(viif_dev, REG_L1_BLVC_MULTVAL_GR, arg->mulval_gr);
+	viif_capture_write(viif_dev, REG_L1_BLVC_MULTVAL_R, arg->mulval_r);
+	viif_capture_write(viif_dev, REG_L1_BLVC_MULTVAL_B, arg->mulval_b);
+	viif_capture_write(viif_dev, REG_L1_BLVC_MULTVAL_GB, arg->mulval_gb);
+
+	viif_capture_write(viif_dev, REG_L1_BLVC_DSTMAXVAL, arg->dstmaxval);
+}
+
+static void lsc_table_transmission(struct viif_device *viif_dev,
+				   dma_addr_t table_gr, dma_addr_t table_r,
+				   dma_addr_t table_b, dma_addr_t table_gb)
+{
+	u32 val = 0;
+
+	viif_config_vdm_tgroup(viif_dev, IDX_TGROUP_L1_ISP);
+
+	if (table_gr) {
+		viif_capture_write(viif_dev,
+				   REG_VDM_TPORT_X_STADR(IDX_TPORT_L1_LSSC_GR),
+				   (u32)table_gr);
+		viif_capture_write(viif_dev,
+				   REG_VDM_TPORT_X_SIZE(IDX_TPORT_L1_LSSC_GR),
+				   VIIF_LSC_TABLE_BYTES);
+		val |= MASK_VDM_T_ENABLE_L1_LSSC_GR;
+	}
+
+	if (table_r) {
+		viif_capture_write(viif_dev,
+				   REG_VDM_TPORT_X_STADR(IDX_TPORT_L1_LSSC_R),
+				   (u32)table_r);
+		viif_capture_write(viif_dev,
+				   REG_VDM_TPORT_X_SIZE(IDX_TPORT_L1_LSSC_R),
+				   VIIF_LSC_TABLE_BYTES);
+		val |= MASK_VDM_T_ENABLE_L1_LSSC_R;
+	}
+
+	if (table_b) {
+		viif_capture_write(viif_dev,
+				   REG_VDM_TPORT_X_STADR(IDX_TPORT_L1_LSSC_B),
+				   (u32)table_b);
+		viif_capture_write(viif_dev,
+				   REG_VDM_TPORT_X_SIZE(IDX_TPORT_L1_LSSC_B),
+				   VIIF_LSC_TABLE_BYTES);
+		val |= MASK_VDM_T_ENABLE_L1_LSSC_B;
+	}
+
+	if (table_gb) {
+		viif_capture_write(viif_dev,
+				   REG_VDM_TPORT_X_STADR(IDX_TPORT_L1_LSSC_GB),
+				   (u32)table_gb);
+		viif_capture_write(viif_dev,
+				   REG_VDM_TPORT_X_SIZE(IDX_TPORT_L1_LSSC_GB),
+				   VIIF_LSC_TABLE_BYTES);
+		val |= MASK_VDM_T_ENABLE_L1_LSSC_GB;
+	}
+
+	val |= (viif_capture_read(viif_dev, REG_VDM_T_ENABLE) &
+		~MASK_VDM_T_ENABLE_L1_LSSC);
+	viif_capture_write(viif_dev, REG_VDM_T_ENABLE, val);
+}
+
+#define PACK_PARA_COEF(max, min) \
+	(FIELD_PREP(0x1fff0000, (max)) | FIELD_PREP(0x1fff, (min)))
+
+static void viif_l1_set_lsc(struct viif_device *viif_dev,
+			    const struct viif_l1_lsc_config *arg)
+{
+	dma_addr_t table_gr = 0, table_gb = 0, table_r = 0, table_b = 0;
+	u32 val;
+
+	if (!arg->enable) {
+		guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+		guard(viif_isp)(viif_dev);
+
+		viif_capture_write(viif_dev, REG_L1_LSSC_EN, 0);
+
+		return;
+	}
+
+	if (arg->enable & VIIF_L1_LSC_GRID_EN_MASK) {
+		memcpy(viif_dev->tables->lsc_table_gr, arg->table_gr,
+		       VIIF_LSC_TABLE_BYTES);
+		memcpy(viif_dev->tables->lsc_table_r, arg->table_r,
+		       VIIF_LSC_TABLE_BYTES);
+		memcpy(viif_dev->tables->lsc_table_b, arg->table_b,
+		       VIIF_LSC_TABLE_BYTES);
+		memcpy(viif_dev->tables->lsc_table_gb, arg->table_gb,
+		       VIIF_LSC_TABLE_BYTES);
+		table_gr = viif_dev->tables_dma +
+			   offsetof(struct viif_table_area, lsc_table_gr);
+		table_r = viif_dev->tables_dma +
+			  offsetof(struct viif_table_area, lsc_table_r);
+		table_b = viif_dev->tables_dma +
+			  offsetof(struct viif_table_area, lsc_table_b);
+		table_gb = viif_dev->tables_dma +
+			   offsetof(struct viif_table_area, lsc_table_gb);
+	}
+
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	lsc_table_transmission(viif_dev, table_gr, table_r, table_b, table_gb);
+
+	/* Parabola shading */
+	if (arg->enable & VIIF_L1_LSC_PARABOLA_EN_MASK) {
+		const struct viif_l1_lsc_parabola_param *parabola_param =
+			&arg->param.lssc_parabola_param;
+		const struct viif_l1_lsc_parabola_ag_param *params[] = {
+			&parabola_param->r_2d,	&parabola_param->r_4d,
+			&parabola_param->gr_2d, &parabola_param->gr_4d,
+			&parabola_param->gb_2d, &parabola_param->gb_4d,
+			&parabola_param->b_2d,	&parabola_param->b_4d,
+		};
+		int i;
+
+		viif_capture_write(viif_dev, REG_L1_LSSC_PARA_EN, 1);
+
+		viif_capture_write(viif_dev, REG_L1_LSSC_PARA_H_CENTER,
+				   parabola_param->lssc_para_h_center);
+		viif_capture_write(viif_dev, REG_L1_LSSC_PARA_V_CENTER,
+				   parabola_param->lssc_para_v_center);
+
+		viif_capture_write(viif_dev, REG_L1_LSSC_PARA_H_GAIN,
+				   parabola_param->lssc_para_h_gain);
+		viif_capture_write(viif_dev, REG_L1_LSSC_PARA_V_GAIN,
+				   parabola_param->lssc_para_v_gain);
+
+		viif_capture_write(viif_dev, REG_L1_LSSC_PARA_MGSEL2,
+				   parabola_param->lssc_para_mgsel2);
+		viif_capture_write(viif_dev, REG_L1_LSSC_PARA_MGSEL4,
+				   parabola_param->lssc_para_mgsel4);
+
+		for (i = 0; i < ARRAY_SIZE(params); i++) {
+			const struct viif_l1_lsc_parabola_ag_param *p =
+				params[i];
+
+			viif_capture_write(
+				viif_dev, REG_L1_LSSC_PARA_COEF_X_H_L(i),
+				PACK_PARA_COEF(p->lssc_paracoef_h_l_max,
+					       p->lssc_paracoef_h_l_min));
+			viif_capture_write(
+				viif_dev, REG_L1_LSSC_PARA_COEF_X_H_R(i),
+				PACK_PARA_COEF(p->lssc_paracoef_h_r_max,
+					       p->lssc_paracoef_h_r_min));
+			viif_capture_write(
+				viif_dev, REG_L1_LSSC_PARA_COEF_X_V_U(i),
+				PACK_PARA_COEF(p->lssc_paracoef_v_u_max,
+					       p->lssc_paracoef_v_u_min));
+			viif_capture_write(
+				viif_dev, REG_L1_LSSC_PARA_COEF_X_V_D(i),
+				PACK_PARA_COEF(p->lssc_paracoef_v_d_max,
+					       p->lssc_paracoef_v_d_min));
+			viif_capture_write(
+				viif_dev, REG_L1_LSSC_PARA_COEF_X_HV_LU(i),
+				PACK_PARA_COEF(p->lssc_paracoef_hv_lu_max,
+					       p->lssc_paracoef_hv_lu_min));
+			viif_capture_write(
+				viif_dev, REG_L1_LSSC_PARA_COEF_X_HV_RU(i),
+				PACK_PARA_COEF(p->lssc_paracoef_hv_ru_max,
+					       p->lssc_paracoef_hv_ru_min));
+			viif_capture_write(
+				viif_dev, REG_L1_LSSC_PARA_COEF_X_HV_LD(i),
+				PACK_PARA_COEF(p->lssc_paracoef_hv_ld_max,
+					       p->lssc_paracoef_hv_ld_min));
+			viif_capture_write(
+				viif_dev, REG_L1_LSSC_PARA_COEF_X_HV_RD(i),
+				PACK_PARA_COEF(p->lssc_paracoef_hv_rd_max,
+					       p->lssc_paracoef_hv_rd_min));
+		}
+	} else {
+		viif_capture_write(viif_dev, REG_L1_LSSC_PARA_EN, 0);
+	}
+
+	/* Grid shading */
+	if (arg->enable & VIIF_L1_LSC_GRID_EN_MASK) {
+		const struct viif_l1_lsc_grid_param *grid_param =
+			&arg->param.lssc_grid_param;
+
+		viif_capture_write(viif_dev, REG_L1_LSSC_GRID_EN, 1);
+		viif_capture_write(viif_dev, REG_L1_LSSC_GRID_H_SIZE,
+				   ffs(grid_param->lssc_grid_h_size));
+		viif_capture_write(viif_dev, REG_L1_LSSC_GRID_V_SIZE,
+				   ffs(grid_param->lssc_grid_v_size));
+		viif_capture_write(viif_dev, REG_L1_LSSC_GRID_H_CENTER,
+				   grid_param->lssc_grid_h_center);
+		viif_capture_write(viif_dev, REG_L1_LSSC_GRID_V_CENTER,
+				   grid_param->lssc_grid_v_center);
+		viif_capture_write(viif_dev, REG_L1_LSSC_GRID_MGSEL,
+				   grid_param->lssc_grid_mgsel);
+	} else {
+		viif_capture_write(viif_dev, REG_L1_LSSC_GRID_EN, 0);
+	}
+
+	/* Preset white balance */
+	val = (arg->param.lssc_pwhb_r_gain_max << 16) |
+	      (arg->param.lssc_pwhb_r_gain_min);
+	viif_capture_write(viif_dev, REG_L1_LSSC_PWHB_R_GAIN, val);
+
+	val = (arg->param.lssc_pwhb_gr_gain_max << 16) |
+	      (arg->param.lssc_pwhb_gr_gain_min);
+	viif_capture_write(viif_dev, REG_L1_LSSC_PWHB_GR_GAIN, val);
+
+	val = (arg->param.lssc_pwhb_gb_gain_max << 16) |
+	      (arg->param.lssc_pwhb_gb_gain_min);
+	viif_capture_write(viif_dev, REG_L1_LSSC_PWHB_GB_GAIN, val);
+
+	val = (arg->param.lssc_pwhb_b_gain_max << 16) |
+	      (arg->param.lssc_pwhb_b_gain_min);
+	viif_capture_write(viif_dev, REG_L1_LSSC_PWHB_B_GAIN, val);
+
+	viif_capture_write(viif_dev, REG_L1_LSSC_EN, 1);
+}
+
+static void
+viif_l1_set_main_process(struct viif_device *viif_dev,
+			 const struct viif_l1_main_process_config *arg)
+{
+	u32 val;
+
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	viif_capture_write(viif_dev, REG_L1_MPRO_CONF, arg->damp_lsbsel << 4);
+	viif_capture_write(viif_dev, REG_L1_MPRO_LCS_MODE, arg->demosaic_mode);
+
+	if (arg->colormat_enable) {
+		const struct viif_l1_color_matrix_correction *color_matrix =
+			&arg->colormat_param;
+
+		viif_capture_write(viif_dev, REG_L1_MPRO_SW, 1);
+
+		val = (u32)color_matrix->coef_rmg_min & 0xffffU;
+		viif_capture_write(viif_dev, REG_L1_MPRO_LM0_RMG_MIN, val);
+
+		val = (u32)color_matrix->coef_rmg_max & 0xffffU;
+		viif_capture_write(viif_dev, REG_L1_MPRO_LM0_RMG_MAX, val);
+
+		val = (u32)color_matrix->coef_rmb_min & 0xffffU;
+		viif_capture_write(viif_dev, REG_L1_MPRO_LM0_RMB_MIN, val);
+
+		val = (u32)color_matrix->coef_rmb_max & 0xffffU;
+		viif_capture_write(viif_dev, REG_L1_MPRO_LM0_RMB_MAX, val);
+
+		val = (u32)color_matrix->coef_gmr_min & 0xffffU;
+		viif_capture_write(viif_dev, REG_L1_MPRO_LM0_GMR_MIN, val);
+
+		val = (u32)color_matrix->coef_gmr_max & 0xffffU;
+		viif_capture_write(viif_dev, REG_L1_MPRO_LM0_GMR_MAX, val);
+
+		val = (u32)color_matrix->coef_gmb_min & 0xffffU;
+		viif_capture_write(viif_dev, REG_L1_MPRO_LM0_GMB_MIN, val);
+
+		val = (u32)color_matrix->coef_gmb_max & 0xffffU;
+		viif_capture_write(viif_dev, REG_L1_MPRO_LM0_GMB_MAX, val);
+
+		val = (u32)color_matrix->coef_bmr_min & 0xffffU;
+		viif_capture_write(viif_dev, REG_L1_MPRO_LM0_BMR_MIN, val);
+
+		val = (u32)color_matrix->coef_bmr_max & 0xffffU;
+		viif_capture_write(viif_dev, REG_L1_MPRO_LM0_BMR_MAX, val);
+
+		val = (u32)color_matrix->coef_bmg_min & 0xffffU;
+		viif_capture_write(viif_dev, REG_L1_MPRO_LM0_BMG_MIN, val);
+
+		val = (u32)color_matrix->coef_bmg_max & 0xffffU;
+		viif_capture_write(viif_dev, REG_L1_MPRO_LM0_BMG_MAX, val);
+
+		viif_capture_write(viif_dev, REG_L1_MPRO_DST_MINVAL,
+				   (u32)color_matrix->dst_minval);
+	} else {
+		viif_capture_write(viif_dev, REG_L1_MPRO_SW, 0);
+	}
+
+	viif_capture_write(viif_dev, REG_L1_MPRO_DST_MAXVAL, arg->dst_maxval);
+}
+
+static void viif_l1_set_awb(struct viif_device *viif_dev,
+			    const struct viif_l1_awb_config *arg)
+{
+	const struct viif_l1_awb *param = &arg->param;
+	u32 val, ygate_data;
+
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	viif_capture_write(viif_dev, REG_L1_AWHB_WBMRG, arg->awhb_wbmrg);
+	viif_capture_write(viif_dev, REG_L1_AWHB_WBMGG, arg->awhb_wbmgg);
+	viif_capture_write(viif_dev, REG_L1_AWHB_WBMBG, arg->awhb_wbmbg);
+
+	val = viif_capture_read(viif_dev, REG_L1_AWHB_SW) & ~MASK_L1_AWHB_SW_EN;
+
+	/* Disabling AWB */
+	if (!arg->enable) {
+		viif_capture_write(viif_dev, REG_L1_AWHB_SW, val);
+		return;
+	}
+
+	/* Enabling AWB */
+	viif_capture_write(viif_dev, REG_L1_AWHB_SW, val | MASK_L1_AWHB_SW_EN);
+
+	if (param->awhb_ygate_data == 64)
+		ygate_data = 0;
+	else if (param->awhb_ygate_data == 128)
+		ygate_data = 1;
+	else if (param->awhb_ygate_data == 256)
+		ygate_data = 2;
+	else
+		ygate_data = 3;
+
+	val = param->awhb_ygate_sel ? MASK_L1_AWHB_GATE_YGATE_SEL : 0;
+	val |= FIELD_PREP(MASK_L1_AWHB_GATE_YGATE_DATA, ygate_data);
+	val |= FIELD_PREP(MASK_L1_AWHB_GATE_CGRANGE, param->awhb_cgrange);
+	viif_capture_write(viif_dev, REG_L1_AWHB_GATE_CONF0, val);
+
+	val = param->awhb_ygatesw ? MASK_L1_AWHB_GATE_YGATESW : 0;
+	val |= param->awhb_hexsw ? MASK_L1_AWHB_GATE_HEXSW : 0;
+	val |= FIELD_PREP(MASK_L1_AWHB_GATE_AREAMODE, param->awhb_areamode);
+	viif_capture_write(viif_dev, REG_L1_AWHB_GATE_CONF1, val);
+
+	viif_capture_write(viif_dev, REG_L1_AWHB_AREA_HSIZE,
+			   param->awhb_area_hsize);
+	viif_capture_write(viif_dev, REG_L1_AWHB_AREA_VSIZE,
+			   param->awhb_area_vsize);
+	viif_capture_write(viif_dev, REG_L1_AWHB_AREA_HOFS,
+			   param->awhb_area_hofs);
+	viif_capture_write(viif_dev, REG_L1_AWHB_AREA_VOFS,
+			   param->awhb_area_vofs);
+
+	viif_capture_write(viif_dev, REG_L1_AWHB_AREA_MASKH,
+			   param->awhb_area_maskh);
+	viif_capture_write(viif_dev, REG_L1_AWHB_AREA_MASKL,
+			   param->awhb_area_maskl);
+
+	val = param->awhb_sq_sw[0] ? MASK_L1_AWHB_SQ_CONF_SQ1SW : 0;
+	val |= param->awhb_sq_pol[0] ? MASK_L1_AWHB_SQ_CONF_SQ1POL : 0;
+	val |= param->awhb_sq_sw[1] ? MASK_L1_AWHB_SQ_CONF_SQ2SW : 0;
+	val |= param->awhb_sq_pol[1] ? MASK_L1_AWHB_SQ_CONF_SQ2POL : 0;
+	val |= param->awhb_sq_sw[2] ? MASK_L1_AWHB_SQ_CONF_SQ3SW : 0;
+	val |= param->awhb_sq_pol[2] ? MASK_L1_AWHB_SQ_CONF_SQ3POL : 0;
+	viif_capture_write(viif_dev, REG_L1_AWHB_SQ_CONF, val);
+
+	viif_capture_write(viif_dev, REG_L1_AWHB_YGATEH,
+			   (u32)param->awhb_ygateh);
+	viif_capture_write(viif_dev, REG_L1_AWHB_YGATEL,
+			   (u32)param->awhb_ygatel);
+
+	viif_capture_write(viif_dev, REG_L1_AWHB_BYCUT0P, param->awhb_bycut0p);
+	viif_capture_write(viif_dev, REG_L1_AWHB_BYCUT0N, param->awhb_bycut0n);
+	viif_capture_write(viif_dev, REG_L1_AWHB_RYCUT0P, param->awhb_rycut0p);
+	viif_capture_write(viif_dev, REG_L1_AWHB_RYCUT0N, param->awhb_rycut0n);
+
+	val = (u32)param->awhb_rbcut0h & 0xffU;
+	viif_capture_write(viif_dev, REG_L1_AWHB_RBCUT0H, val);
+	val = (u32)param->awhb_rbcut0l & 0xffU;
+	viif_capture_write(viif_dev, REG_L1_AWHB_RBCUT0L, val);
+
+	val = (u32)param->awhb_bycut_h[0] & 0xffU;
+	viif_capture_write(viif_dev, REG_L1_AWHB_BYCUT1H, val);
+	viif_capture_write(viif_dev, REG_L1_AWHB_BYCUT1L,
+			   param->awhb_bycut_l[0]);
+	val = (u32)param->awhb_bycut_h[1] & 0xffU;
+	viif_capture_write(viif_dev, REG_L1_AWHB_BYCUT2H, val);
+	viif_capture_write(viif_dev, REG_L1_AWHB_BYCUT2L,
+			   param->awhb_bycut_l[1]);
+	val = (u32)param->awhb_bycut_h[2] & 0xffU;
+	viif_capture_write(viif_dev, REG_L1_AWHB_BYCUT3H, val);
+	viif_capture_write(viif_dev, REG_L1_AWHB_BYCUT3L,
+			   param->awhb_bycut_l[2]);
+
+	val = (u32)param->awhb_rycut_h[0] & 0xffU;
+	viif_capture_write(viif_dev, REG_L1_AWHB_RYCUT1H, val);
+	viif_capture_write(viif_dev, REG_L1_AWHB_RYCUT1L,
+			   param->awhb_rycut_l[0]);
+	val = (u32)param->awhb_rycut_h[1] & 0xffU;
+	viif_capture_write(viif_dev, REG_L1_AWHB_RYCUT2H, val);
+	viif_capture_write(viif_dev, REG_L1_AWHB_RYCUT2L,
+			   param->awhb_rycut_l[1]);
+	val = (u32)param->awhb_rycut_h[2] & 0xffU;
+	viif_capture_write(viif_dev, REG_L1_AWHB_RYCUT3H, val);
+	viif_capture_write(viif_dev, REG_L1_AWHB_RYCUT3L,
+			   param->awhb_rycut_l[2]);
+
+	val = (u32)param->awhb_awbsftu & 0xffU;
+	viif_capture_write(viif_dev, REG_L1_AWHB_AWBSFTU, val);
+	val = (u32)param->awhb_awbsftv & 0xffU;
+	viif_capture_write(viif_dev, REG_L1_AWHB_AWBSFTV, val);
+
+	val = (param->awhb_awbhuecor ? MASK_L1_AWHB_AWBSPD_HUECOR : 0);
+	val |= FIELD_PREP(MASK_L1_AWHB_AWBSPD_SPD, param->awhb_awbspd);
+	viif_capture_write(viif_dev, REG_L1_AWHB_AWBSPD, val);
+
+	viif_capture_write(viif_dev, REG_L1_AWHB_AWBULV, param->awhb_awbulv);
+	viif_capture_write(viif_dev, REG_L1_AWHB_AWBVLV, param->awhb_awbvlv);
+	viif_capture_write(viif_dev, REG_L1_AWHB_AWBWAIT,
+			   (u32)param->awhb_awbwait);
+
+	viif_capture_write(viif_dev, REG_L1_AWHB_AWBONDOT,
+			   param->awhb_awbondot);
+	viif_capture_write(viif_dev, REG_L1_AWHB_AWBFZTIM,
+			   param->awhb_awbfztim);
+
+	viif_capture_write(viif_dev, REG_L1_AWHB_WBGRMAX,
+			   (u32)param->awhb_wbgrmax);
+	viif_capture_write(viif_dev, REG_L1_AWHB_WBGBMAX,
+			   (u32)param->awhb_wbgbmax);
+	viif_capture_write(viif_dev, REG_L1_AWHB_WBGRMIN,
+			   (u32)param->awhb_wbgrmin);
+	viif_capture_write(viif_dev, REG_L1_AWHB_WBGBMIN,
+			   (u32)param->awhb_wbgbmin);
+}
+
+static void viif_l1_lock_awb_gain(struct viif_device *viif_dev,
+				  const u32 *enable)
+{
+	u32 val;
+
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	val = viif_capture_read(viif_dev, REG_L1_AWHB_SW) &
+	      ~MASK_L1_AWHB_SW_LOCK;
+	val |= (*enable ? MASK_L1_AWHB_SW_LOCK : 0);
+	viif_capture_write(viif_dev, REG_L1_AWHB_SW, val);
+}
+
+/* Convert the unit of time-period (from sysclk, to num lines in the image) */
+static u32 sysclk_to_numlines(u32 time_in_sysclk, unsigned long sys_rate,
+			      const struct viif_img_clk *img_clk)
+{
+	u64 v1 = (u64)time_in_sysclk * img_clk->pixel_clock;
+	u64 v2 = (u64)img_clk->htotal_size * sys_rate;
+
+	return (u32)div64_u64(v1, v2);
+}
+
+static void viif_l1_set_hdrc(struct viif_device *viif_dev,
+			     const struct viif_l1_hdrc_config *arg)
+{
+	const struct viif_l1_hdrc *param = &arg->param;
+	u32 val, sw_delay1;
+	int i;
+
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	/* Disabling HDRC */
+	if (!arg->enable) {
+		viif_capture_write(viif_dev, REG_L1_HDRC_THR_SFT_AMT,
+				   arg->hdrc_thr_sft_amt);
+		viif_capture_write(viif_dev, REG_L1_HDRC_EN, 0);
+		return;
+	}
+
+	/* Enabling HDRC */
+	viif_capture_write(viif_dev, REG_L1_HDRC_RATIO,
+			   (param->hdrc_ratio - VIIF_L1_HDRC_RATIO_OFFSET));
+	viif_capture_write(viif_dev, REG_L1_HDRC_PT_RATIO,
+			   param->hdrc_pt_ratio);
+
+	viif_capture_write(viif_dev, REG_L1_HDRC_PT_BLEND,
+			   param->hdrc_pt_blend);
+	viif_capture_write(viif_dev, REG_L1_HDRC_PT_BLEND2,
+			   param->hdrc_pt_blend2);
+
+	viif_capture_write(viif_dev, REG_L1_HDRC_PT_SAT, param->hdrc_pt_sat);
+	viif_capture_write(viif_dev, REG_L1_HDRC_TN_TYPE, param->hdrc_tn_type);
+
+	for (i = 0; i < LEN_L1_HDRC_UTN_TBL; i++)
+		viif_capture_write(viif_dev, REG_L1_HDRC_UTN_TBL(i),
+				   param->hdrc_utn_tbl[i]);
+
+	viif_capture_write(viif_dev, REG_L1_HDRC_FLR_VAL, param->hdrc_flr_val);
+	viif_capture_write(viif_dev, REG_L1_HDRC_FLR_ADP,
+			   param->hdrc_flr_adp ? 1 : 0);
+
+	viif_capture_write(viif_dev, REG_L1_HDRC_YBR_OFF,
+			   param->hdrc_ybr_off ? 1 : 0);
+	viif_capture_write(viif_dev, REG_L1_HDRC_ORGY_BLEND,
+			   param->hdrc_orgy_blend);
+
+	val = ((viif_capture_read(viif_dev, REG_L1_SYSM_HEIGHT)) % 64) / 2;
+	viif_capture_write(viif_dev, REG_L1_HDRC_MAR_TOP, val);
+	val = ((viif_capture_read(viif_dev, REG_L1_SYSM_WIDTH)) % 64) / 2;
+	viif_capture_write(viif_dev, REG_L1_HDRC_MAR_LEFT, val);
+
+	viif_capture_write(viif_dev, REG_L1_HDRC_EN, 1);
+
+	/* Update of sw_delay1 must be done when MAIN unit is NOT running. */
+	if (!viif_dev->run_flag_main) {
+		sw_delay1 = sysclk_to_numlines(VIIF_REGBUF_ACCESS_TIME,
+					       viif_dev->clkrate,
+					       &viif_dev->img_clk) +
+			    VIIF_L1_DELAY_W_HDRC + 1;
+		val = viif_capture_read(viif_dev, REG_INT_M1_LINE) & 0xffffU;
+		val |= (sw_delay1 << 16);
+		viif_capture_write(viif_dev, REG_INT_M1_LINE, val);
+		/* M2_LINE is the same condition as M1_LINE */
+		viif_capture_write(viif_dev, REG_INT_M2_LINE, val);
+	}
+}
+
+static void viif_l1_set_hdrc_ltm(struct viif_device *viif_dev,
+				 const struct viif_l1_hdrc_ltm_config *arg)
+{
+	int i;
+
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	viif_capture_write(viif_dev, REG_L1_HDRC_TNP_MAX, arg->tnp_max);
+	viif_capture_write(viif_dev, REG_L1_HDRC_TNP_MAG, arg->tnp_mag);
+
+	for (i = 0; i < LEN_L1_HDRC_TNP_FIL; i++)
+		viif_capture_write(viif_dev, REG_L1_HDRC_TNP_FIL(i),
+				   (u32)arg->tnp_fil[i]);
+}
+
+static void viif_l1_set_gamma(struct viif_device *viif_dev,
+			      const struct viif_l1_gamma_config *arg)
+{
+	const struct viif_l1_gamma *param = &arg->param;
+	int i;
+
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	/* Disabling L1 gamma */
+	if (!arg->enable) {
+		viif_capture_write(viif_dev, REG_L1_VPRO_PGC_SW, 0);
+		return;
+	}
+
+	/* Enabling L1 gamma */
+	for (i = 0; i < 44; i++)
+		viif_capture_write(viif_dev, REG_L1_VPRO_GAMxP(i),
+				   param->gam_p[i]);
+	viif_capture_write(viif_dev, REG_L1_VPRO_BLKADJ, param->blkadj);
+	viif_capture_write(viif_dev, REG_L1_VPRO_PGC_SW, 1);
+}
+
+static void viif_l1_set_img_quality_adjustment(
+	struct viif_device *viif_dev,
+	const struct viif_l1_img_quality_adjustment_config *arg)
+{
+	u32 val;
+
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	/* RGB to YUV (enabled by default, should be enabled) */
+	viif_capture_write(viif_dev, REG_L1_VPRO_YUVC_SW, 1);
+	viif_capture_write(viif_dev, REG_L1_VPRO_CB_MAT, (u32)arg->coef_cb);
+	viif_capture_write(viif_dev, REG_L1_VPRO_CR_MAT, (u32)arg->coef_cr);
+
+	/* Brightness */
+	val = (u32)arg->brightness & 0xffffU;
+	if (val) {
+		viif_capture_write(viif_dev, REG_L1_VPRO_BRIGHT_SW, 1);
+		viif_capture_write(viif_dev, REG_L1_VPRO_BRIGHT, val);
+	} else {
+		viif_capture_write(viif_dev, REG_L1_VPRO_BRIGHT_SW, 0);
+	}
+
+	/* Linear contrast */
+	if ((u32)arg->linear_contrast != 128) {
+		viif_capture_write(viif_dev, REG_L1_VPRO_LCNT_SW, 1);
+		viif_capture_write(viif_dev, REG_L1_VPRO_LCONT_LEV,
+				   arg->linear_contrast);
+	} else {
+		viif_capture_write(viif_dev, REG_L1_VPRO_LCNT_SW, 0);
+	}
+
+	/* Nonlinear contrast */
+	if (arg->enable & VIIF_L1_IQA_NONLINEAR_CONTRAST_EN_MASK) {
+		const struct viif_l1_nonlinear_contrast *nonlinear_contrast =
+			&arg->nonlinear_contrast;
+
+		viif_capture_write(viif_dev, REG_L1_VPRO_NLCNT_SW, 1);
+		viif_capture_write(viif_dev, REG_L1_VPRO_BLK_KNEE,
+				   nonlinear_contrast->blk_knee);
+		viif_capture_write(viif_dev, REG_L1_VPRO_WHT_KNEE,
+				   nonlinear_contrast->wht_knee);
+
+		viif_capture_write(viif_dev, REG_L1_VPRO_BLK_CONT0,
+				   nonlinear_contrast->blk_cont[0]);
+		viif_capture_write(viif_dev, REG_L1_VPRO_BLK_CONT1,
+				   nonlinear_contrast->blk_cont[1]);
+		viif_capture_write(viif_dev, REG_L1_VPRO_BLK_CONT2,
+				   nonlinear_contrast->blk_cont[2]);
+
+		viif_capture_write(viif_dev, REG_L1_VPRO_WHT_CONT0,
+				   nonlinear_contrast->wht_cont[0]);
+		viif_capture_write(viif_dev, REG_L1_VPRO_WHT_CONT1,
+				   nonlinear_contrast->wht_cont[1]);
+		viif_capture_write(viif_dev, REG_L1_VPRO_WHT_CONT2,
+				   nonlinear_contrast->wht_cont[2]);
+	} else {
+		viif_capture_write(viif_dev, REG_L1_VPRO_NLCNT_SW, 0);
+	}
+
+	/* Luminance noise reduction */
+	if (arg->enable & VIIF_L1_IQA_LUM_NOISE_REDUCTION_EN_MASK) {
+		const struct viif_l1_lum_noise_reduction *lum_noise_reduction =
+			&arg->lum_noise_reduction;
+
+		viif_capture_write(viif_dev, REG_L1_VPRO_YNR_SW, 1);
+		viif_capture_write(viif_dev, REG_L1_VPRO_YNR_GAIN_MIN,
+				   lum_noise_reduction->gain_min);
+		viif_capture_write(viif_dev, REG_L1_VPRO_YNR_GAIN_MAX,
+				   lum_noise_reduction->gain_max);
+		viif_capture_write(viif_dev, REG_L1_VPRO_YNR_LIM_MIN,
+				   lum_noise_reduction->lim_min);
+		viif_capture_write(viif_dev, REG_L1_VPRO_YNR_LIM_MAX,
+				   lum_noise_reduction->lim_max);
+	} else {
+		viif_capture_write(viif_dev, REG_L1_VPRO_YNR_SW, 0);
+	}
+
+	/* Edge enhancement */
+	if (arg->enable & VIIF_L1_IQA_EDGE_ENHANCEMENT_EN_MASK) {
+		const struct viif_l1_edge_enhancement *edge_enhancement =
+			&arg->edge_enhancement;
+
+		viif_capture_write(viif_dev, REG_L1_VPRO_ETE_SW, 1);
+		viif_capture_write(viif_dev, REG_L1_VPRO_ETE_GAIN_MIN,
+				   edge_enhancement->gain_min);
+		viif_capture_write(viif_dev, REG_L1_VPRO_ETE_GAIN_MAX,
+				   edge_enhancement->gain_max);
+		viif_capture_write(viif_dev, REG_L1_VPRO_ETE_LIM_MIN,
+				   edge_enhancement->lim_min);
+		viif_capture_write(viif_dev, REG_L1_VPRO_ETE_LIM_MAX,
+				   edge_enhancement->lim_max);
+		viif_capture_write(viif_dev, REG_L1_VPRO_ETE_CORING_MIN,
+				   edge_enhancement->coring_min);
+		viif_capture_write(viif_dev, REG_L1_VPRO_ETE_CORING_MAX,
+				   edge_enhancement->coring_max);
+	} else {
+		viif_capture_write(viif_dev, REG_L1_VPRO_ETE_SW, 0);
+	}
+
+	/* UV suppression */
+	if (arg->enable & VIIF_L1_IQA_UV_SUPPRESSION_EN_MASK) {
+		const struct viif_l1_uv_suppression *uv_suppression =
+			&arg->uv_suppression;
+
+		viif_capture_write(viif_dev, REG_L1_VPRO_CSUP_UVSUP_SW, 1);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CSUP_BK_SLV,
+				   uv_suppression->bk_slv);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CSUP_BK_MP,
+				   uv_suppression->bk_mp);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CSUP_BLACK,
+				   uv_suppression->black);
+
+		viif_capture_write(viif_dev, REG_L1_VPRO_CSUP_WH_SLV,
+				   uv_suppression->wh_slv);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CSUP_WH_MP,
+				   uv_suppression->wh_mp);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CSUP_WHITE,
+				   uv_suppression->white);
+	} else {
+		viif_capture_write(viif_dev, REG_L1_VPRO_CSUP_UVSUP_SW, 0);
+	}
+
+	/* Coring suppression */
+	if (arg->enable & VIIF_L1_IQA_CORING_SUPPRESSION_EN_MASK) {
+		const struct viif_l1_coring_suppression *coring_suppression =
+			&arg->coring_suppression;
+
+		viif_capture_write(viif_dev, REG_L1_VPRO_CSUP_CORING_SW, 1);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CSUP_CORING_LV_MIN,
+				   coring_suppression->lv_min);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CSUP_CORING_LV_MAX,
+				   coring_suppression->lv_max);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CSUP_CORING_GAIN_MIN,
+				   coring_suppression->gain_min);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CSUP_CORING_GAIN_MAX,
+				   coring_suppression->gain_max);
+	} else {
+		viif_capture_write(viif_dev, REG_L1_VPRO_CSUP_CORING_SW, 0);
+	}
+
+	/* Edge suppression */
+	if (arg->enable & VIIF_L1_IQA_EDGE_SUPPRESSION_EN_MASK) {
+		const struct viif_l1_edge_suppression *edge_suppression =
+			&arg->edge_suppression;
+
+		viif_capture_write(viif_dev, REG_L1_VPRO_EDGE_SUP_SW, 1);
+		viif_capture_write(viif_dev, REG_L1_VPRO_EDGE_SUP_GAIN,
+				   edge_suppression->gain);
+		viif_capture_write(viif_dev, REG_L1_VPRO_EDGE_SUP_LIM,
+				   edge_suppression->lim);
+	} else {
+		viif_capture_write(viif_dev, REG_L1_VPRO_EDGE_SUP_SW, 0);
+	}
+
+	/* Color level */
+	if (arg->enable & VIIF_L1_IQA_COLOR_LEVEL_EN_MASK) {
+		const struct viif_l1_color_level *color_level =
+			&arg->color_level;
+
+		viif_capture_write(viif_dev, REG_L1_VPRO_CB_GAIN,
+				   color_level->cb_gain);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CR_GAIN,
+				   color_level->cr_gain);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CBR_MGAIN_MIN,
+				   color_level->cbr_mgain_min);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CB_P_GAIN_MAX,
+				   color_level->cbp_gain_max);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CB_M_GAIN_MAX,
+				   color_level->cbm_gain_max);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CR_P_GAIN_MAX,
+				   color_level->crp_gain_max);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CR_M_GAIN_MAX,
+				   color_level->crm_gain_max);
+	} else {
+		viif_capture_write(viif_dev, REG_L1_VPRO_CB_GAIN, 1024U);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CR_GAIN, 1024U);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CBR_MGAIN_MIN, 1024U);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CB_P_GAIN_MAX, 0U);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CB_M_GAIN_MAX, 0U);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CR_P_GAIN_MAX, 0U);
+		viif_capture_write(viif_dev, REG_L1_VPRO_CR_M_GAIN_MAX, 0U);
+	}
+
+	/* Color noise reduction */
+	viif_capture_write(
+		viif_dev, REG_L1_VPRO_CNR_SW,
+		arg->enable & VIIF_L1_IQA_COLOR_NOISE_REDUCTION_EN_MASK ? 1 :
+									  0);
+}
+
+static u32 pack_weight(const u32 *vec)
+{
+	return (vec[0] << 14) | (vec[1] << 12) | (vec[2] << 10) |
+	       (vec[3] << 8) | (vec[4] << 6) | (vec[5] << 4) | (vec[6] << 2) |
+	       (vec[7]);
+}
+
+static void viif_l1_set_avg_lum_generation(
+	struct viif_device *viif_dev,
+	const struct viif_l1_avg_lum_generation_config *arg)
+{
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	/* Disabling aggregation */
+	if (!arg->enable) {
+		viif_capture_write(viif_dev, REG_L1_AEXP_ON, 0);
+		return;
+	}
+
+	/* Enabling aggregation */
+	viif_capture_write(viif_dev, REG_L1_AEXP_ON, 1);
+	viif_capture_write(viif_dev, REG_L1_AEXP_START_X, arg->aexp_start_x);
+	viif_capture_write(viif_dev, REG_L1_AEXP_START_Y, arg->aexp_start_y);
+	viif_capture_write(viif_dev, REG_L1_AEXP_BLOCK_WIDTH,
+			   arg->aexp_block_width);
+	viif_capture_write(viif_dev, REG_L1_AEXP_BLOCK_HEIGHT,
+			   arg->aexp_block_height);
+
+	viif_capture_write(viif_dev, REG_L1_AEXP_WEIGHT_0,
+			   pack_weight(arg->aexp_weight[0]));
+	viif_capture_write(viif_dev, REG_L1_AEXP_WEIGHT_1,
+			   pack_weight(arg->aexp_weight[1]));
+	viif_capture_write(viif_dev, REG_L1_AEXP_WEIGHT_2,
+			   pack_weight(arg->aexp_weight[2]));
+	viif_capture_write(viif_dev, REG_L1_AEXP_WEIGHT_3,
+			   pack_weight(arg->aexp_weight[3]));
+	viif_capture_write(viif_dev, REG_L1_AEXP_WEIGHT_3,
+			   pack_weight(arg->aexp_weight[4]));
+	viif_capture_write(viif_dev, REG_L1_AEXP_WEIGHT_4,
+			   pack_weight(arg->aexp_weight[5]));
+	viif_capture_write(viif_dev, REG_L1_AEXP_WEIGHT_5,
+			   pack_weight(arg->aexp_weight[6]));
+	viif_capture_write(viif_dev, REG_L1_AEXP_WEIGHT_7,
+			   pack_weight(arg->aexp_weight[7]));
+
+	viif_capture_write(viif_dev, REG_L1_AEXP_SATUR_RATIO,
+			   arg->aexp_satur_ratio);
+	viif_capture_write(viif_dev, REG_L1_AEXP_BLACK_RATIO,
+			   arg->aexp_black_ratio);
+	viif_capture_write(viif_dev, REG_L1_AEXP_SATUR_LEVEL,
+			   arg->aexp_satur_level);
+
+	viif_capture_write(viif_dev, REG_L1_AEXP_AVE4LINESY0,
+			   arg->aexp_ave4linesy[0]);
+	viif_capture_write(viif_dev, REG_L1_AEXP_AVE4LINESY1,
+			   arg->aexp_ave4linesy[1]);
+	viif_capture_write(viif_dev, REG_L1_AEXP_AVE4LINESY2,
+			   arg->aexp_ave4linesy[2]);
+	viif_capture_write(viif_dev, REG_L1_AEXP_AVE4LINESY3,
+			   arg->aexp_ave4linesy[3]);
+}
+
+static void undist_table_transmission(struct viif_device *viif_dev,
+				      dma_addr_t write_g, dma_addr_t read_b,
+				      dma_addr_t read_g, dma_addr_t read_r,
+				      u32 size)
+{
+	u32 val = 0;
+
+	if (read_b) {
+		viif_capture_write(
+			viif_dev,
+			REG_VDM_TPORT_X_STADR(IDX_TPORT_L2_UNDIST_RD_B),
+			(u32)read_b);
+		viif_capture_write(
+			viif_dev,
+			REG_VDM_TPORT_X_SIZE(IDX_TPORT_L2_UNDIST_RD_B), size);
+		val |= MASK_VDM_T_ENABLE_L2_UNDIST_RD_B;
+	}
+	if (read_g) {
+		viif_capture_write(
+			viif_dev,
+			REG_VDM_TPORT_X_STADR(IDX_TPORT_L2_UNDIST_RD_G),
+			(u32)read_g);
+		viif_capture_write(
+			viif_dev,
+			REG_VDM_TPORT_X_SIZE(IDX_TPORT_L2_UNDIST_RD_G), size);
+		val |= MASK_VDM_T_ENABLE_L2_UNDIST_RD_G;
+	}
+	if (read_r) {
+		viif_capture_write(
+			viif_dev,
+			REG_VDM_TPORT_X_STADR(IDX_TPORT_L2_UNDIST_RD_R),
+			(u32)read_r);
+		viif_capture_write(
+			viif_dev,
+			REG_VDM_TPORT_X_SIZE(IDX_TPORT_L2_UNDIST_RD_R), size);
+		val |= MASK_VDM_T_ENABLE_L2_UNDIST_RD_R;
+	}
+	if (write_g) {
+		viif_capture_write(
+			viif_dev,
+			REG_VDM_TPORT_X_STADR(IDX_TPORT_L2_UNDIST_WR_G),
+			(u32)write_g);
+		viif_capture_write(
+			viif_dev,
+			REG_VDM_TPORT_X_SIZE(IDX_TPORT_L2_UNDIST_WR_G), size);
+		val |= MASK_VDM_T_ENABLE_L2_UNDIST_WR_G;
+	}
+
+	if (val)
+		viif_config_vdm_tgroup(viif_dev, IDX_TGROUP_L2_UNDIST);
+
+	val |= viif_capture_read(viif_dev, REG_VDM_T_ENABLE) &
+	       ~MASK_VDM_T_ENABLE_L2_UNDIST;
+	viif_capture_write(viif_dev, REG_VDM_T_ENABLE, val);
+}
+
+static void undist_setup(struct viif_device *viif_dev,
+			 const struct viif_l2_undist *param)
+{
+	u32 val;
+	unsigned int i;
+
+	/* Undist through mode */
+	if (param->through_mode) {
+		/* Enable through mode */
+		viif_capture_write(viif_dev, REG_L2_MODE, 1);
+		return;
+	}
+
+	/* Undist operation */
+	val = (param->roi_mode[0] << 1) | (param->roi_mode[1] << 3);
+	viif_capture_write(viif_dev, REG_L2_MODE, val);
+	val = (u32)param->sensor_crop_ofs_h & GENMASK(13, 0);
+	viif_capture_write(viif_dev, REG_L2_SENSOR_CROP_OFS_H, val);
+	val = (u32)param->sensor_crop_ofs_v & GENMASK(12, 0);
+	viif_capture_write(viif_dev, REG_L2_SENSOR_CROP_OFS_V, val);
+	viif_capture_write(viif_dev, REG_L2_NORM_SCALE, param->norm_scale);
+	viif_capture_write(viif_dev, REG_L2_VALID_R_NORM2_POLY,
+			   param->valid_r_norm2_poly);
+	viif_capture_write(viif_dev, REG_L2_VALID_R_NORM2_GRID,
+			   param->valid_r_norm2_grid);
+	viif_capture_write(viif_dev, REG_L2_ROI_WRITE_AREA_DELTA(0),
+			   param->roi_write_area_delta[0]);
+	viif_capture_write(viif_dev, REG_L2_ROI_WRITE_AREA_DELTA(1),
+			   param->roi_write_area_delta[1]);
+
+	for (i = 0; i < VIIF_L2_UNDIST_POLY_NUM; i++) {
+		val = (u32)param->poly_write_g_coef[i];
+		viif_capture_write(viif_dev, REG_L2_POLY10_WRITE_G_COEF(i),
+				   val);
+		val = (u32)param->poly_read_b_coef[i];
+		viif_capture_write(viif_dev, REG_L2_POLY10_READ_B_COEF(i), val);
+		val = (u32)param->poly_read_g_coef[i];
+		viif_capture_write(viif_dev, REG_L2_POLY10_READ_G_COEF(i), val);
+		val = (u32)param->poly_read_r_coef[i];
+		viif_capture_write(viif_dev, REG_L2_POLY10_READ_R_COEF(i), val);
+	}
+	viif_capture_write(viif_dev, REG_L2_GRID_NODE_NUM_H,
+			   param->grid_node_num_h);
+	viif_capture_write(viif_dev, REG_L2_GRID_NODE_NUM_V,
+			   param->grid_node_num_v);
+	viif_capture_write(viif_dev, REG_L2_GRID_PATCH_HSIZE_INV,
+			   param->grid_patch_hsize_inv);
+	viif_capture_write(viif_dev, REG_L2_GRID_PATCH_VSIZE_INV,
+			   param->grid_patch_vsize_inv);
+}
+
+static void viif_l2_set_undist(struct viif_device *viif_dev,
+			       const struct viif_l2_undist_config *arg)
+{
+	dma_addr_t table_write_g = 0;
+	dma_addr_t table_read_b = 0;
+	dma_addr_t table_read_g = 0;
+	dma_addr_t table_read_r = 0;
+
+	if (arg->param.roi_mode[0] != VIIF_L2_UNDIST_POLY ||
+	    arg->param.roi_mode[1] != VIIF_L2_UNDIST_POLY) {
+		memcpy(viif_dev->tables->undist_write_g, arg->write_g,
+		       arg->size);
+		memcpy(viif_dev->tables->undist_read_b, arg->read_b, arg->size);
+		memcpy(viif_dev->tables->undist_read_g, arg->read_g, arg->size);
+		memcpy(viif_dev->tables->undist_read_r, arg->read_r, arg->size);
+
+		table_write_g =
+			viif_dev->tables_dma +
+			offsetof(struct viif_table_area, undist_write_g);
+		table_read_b = viif_dev->tables_dma +
+			       offsetof(struct viif_table_area, undist_read_b);
+		table_read_g = viif_dev->tables_dma +
+			       offsetof(struct viif_table_area, undist_read_g);
+		table_read_r = viif_dev->tables_dma +
+			       offsetof(struct viif_table_area, undist_read_r);
+	}
+
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	undist_table_transmission(viif_dev, table_write_g, table_read_b,
+				  table_read_g, table_read_r, arg->size);
+	undist_setup(viif_dev, &arg->param);
+}
+
+void visconti_viif_l2_undist_through(struct viif_device *viif_dev)
+{
+	struct viif_l2_undist undist = { 0 };
+
+	undist.through_mode = VIIF_ENABLE;
+	undist.sensor_crop_ofs_h =
+		1 -
+		FIELD_GET(0x1fff, viif_capture_read(viif_dev,
+						    REG_L2_SENSOR_CROP_HSIZE));
+	undist.sensor_crop_ofs_v =
+		1 -
+		FIELD_GET(0x0fff, viif_capture_read(viif_dev,
+						    REG_L2_SENSOR_CROP_VSIZE));
+	undist.grid_node_num_h = 16;
+	undist.grid_node_num_v = 16;
+
+	undist_setup(viif_dev, &undist);
+}
+
+static void viif_l2_set_roi(struct viif_device *viif_dev,
+			    const struct viif_l2_roi_config *roi)
+{
+	u32 val;
+	int i;
+
+	/* Update ROI parameter */
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	/* Set the number of ROI and update resource info with roi_num */
+	viif_capture_write(viif_dev, REG_L2_ROI_NUM, roi->roi_num);
+	viif_dev->l2_roi_path_info.roi_num = roi->roi_num;
+
+	/* Update ROI area and input to each POST */
+	visconti_viif_l2_set_roi_path(viif_dev);
+
+	/* Set the remaining parameters */
+	for (i = 0; i < 2; i++) {
+		viif_capture_write(viif_dev, REG_L2_ROI_X_SCALE(i),
+				   roi->roi_scale[i]);
+		viif_capture_write(viif_dev, REG_L2_ROI_X_SCALE_INV(i),
+				   roi->roi_scale_inv[i]);
+		val = (roi->corrected_wo_scale_hsize[i] << 13) |
+		      roi->corrected_hsize[i];
+		viif_capture_write(viif_dev, REG_L2_ROI_X_CORRECTED_HSIZE(i),
+				   val);
+		val = (roi->corrected_wo_scale_vsize[i] << 12) |
+		      roi->corrected_vsize[i];
+		viif_capture_write(viif_dev, REG_L2_ROI_X_CORRECTED_VSIZE(i),
+				   val);
+	}
+}
+
+struct viif_l2_gamma_table {
+	dma_addr_t table[VIIF_L2_GAMMA_TABLE_CH_NUM];
+};
+
+static void
+l2_gamma_table_transmission(struct viif_device *viif_dev, u32 post_id,
+			    const struct viif_l2_gamma_table *gamma_table)
+{
+	u32 vdm_enable = 0;
+	u32 i;
+
+	/* 0: LUT0-G/Y, 1: LUT1-G/Y, 2: LUT0-B/U */
+	/* 3: LUT1-B/U, 4: LUT0-R/V, 5: LUT1-R/V */
+	for (i = 0; i < VIIF_L2_GAMMA_TABLE_CH_NUM; i++) {
+		if (gamma_table->table[i]) {
+			int idx = IDX_TPORT_L2_GAMMA_LUT(post_id, i);
+
+			viif_capture_write(viif_dev, REG_VDM_TPORT_X_STADR(idx),
+					   (u32)gamma_table->table[i]);
+			viif_capture_write(viif_dev, REG_VDM_TPORT_X_SIZE(idx),
+					   VIIF_L2_GAMMA_TABLE_BYTES);
+			vdm_enable |= MASK_VDM_T_ENABLE_L2_GAMMA(post_id, i);
+		}
+	}
+	if (vdm_enable)
+		viif_config_vdm_tgroup(viif_dev,
+				       IDX_TGROUP_L2_GAMMA_LUT(post_id));
+
+	vdm_enable |= viif_capture_read(viif_dev, REG_VDM_T_ENABLE) &
+		      ~MASK_VDM_T_ENABLE_L2_GAMMA_ALL(post_id);
+
+	viif_capture_write(viif_dev, REG_VDM_T_ENABLE, vdm_enable);
+}
+
+static void viif_l2_set_gamma(struct viif_device *viif_dev, int pathid,
+			      const struct viif_l2_gamma_config *l2_gamma)
+{
+	struct viif_l2_gamma_table dma_table = { 0 };
+	int postid = (pathid == CAPTURE_PATH_MAIN_POST0) ? VIIF_L2ISP_POST_0 :
+							   VIIF_L2ISP_POST_1;
+	int table_en;
+	u32 val;
+	int i;
+
+	table_en = l2_gamma->table_en;
+	for (i = 0; i < 6; i++) {
+		if (table_en & BIT(i)) {
+			memcpy(viif_dev->tables->l2_gamma_table[pathid][i],
+			       l2_gamma->table[i], VIIF_L2_GAMMA_TABLE_BYTES);
+			dma_table.table[i] =
+				viif_dev->tables_dma +
+				offsetof(struct viif_table_area,
+					 l2_gamma_table[pathid][i]);
+		}
+	}
+
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	l2_gamma_table_transmission(viif_dev, postid, &dma_table);
+
+	val = (l2_gamma->vsplit << 16) | (l2_gamma->mode << 4) |
+	      (table_en != 0 ? 1 : 0);
+	viif_capture_write(viif_dev, REG_L2_POST_X_GAMMA_M(postid), val);
+}
+
+static void viif_l2_set_crop(struct viif_device *viif_dev, int pathid,
+			     const struct viif_l2_crop_config *l2_crop)
+{
+	struct cap_dev *cap_dev = (pathid == CAPTURE_PATH_MAIN_POST0) ?
+					  &viif_dev->cap_post0 :
+					  &viif_dev->cap_post1;
+
+	cap_dev->img_area.left = l2_crop->left;
+	cap_dev->img_area.top = l2_crop->top;
+}
+
+static const struct viif_l1_input_mode_config defval_l1_set_input_mode = {
+	.mode = VIIF_L1_INPUT_HDR,
+};
+
+static const struct viif_l1_rgb_to_y_coef_config defval_l1_set_rgb_to_y_coef = {
+	/* ITU-R BT.601 */
+	.coef_r = 0x4c8c,
+	.coef_g = 0x9644,
+	.coef_b = 0x1d30,
+};
+
+static const struct viif_l1_ag_mode_config defval_l1_set_ag_mode = { 0 };
+
+static const struct viif_l1_ag_config defval_l1_set_ag = { 0 };
+
+static const struct viif_l1_hdre_config defval_l1_set_hdre = {
+	.hdre_src_point[0] = 0x3fff,
+	.hdre_dst_max_val = 0xffffff,
+};
+
+static const struct viif_l1_img_extraction_config defval_l1_set_img_extraction = {
+	.input_black_gr = 256,
+	.input_black_r = 256,
+	.input_black_b = 256,
+	.input_black_gb = 256,
+};
+
+static const struct viif_l1_dpc_config defval_l1_set_dpc = { 0 };
+
+static const struct viif_l1_preset_white_balance_config
+defval_l1_set_preset_white_balance = {
+	.dstmaxval = 0x0fff,
+	.param_h = {
+		.gain_gr = 0x4000,
+		.gain_r = 0x4000,
+		.gain_b = 0x4000,
+		.gain_gb = 0x4000,
+	},
+	.param_m = {
+		.gain_gr = 0x4000,
+		.gain_r = 0x4000,
+		.gain_b = 0x4000,
+		.gain_gb = 0x4000,
+	},
+	.param_l = {
+		.gain_gr = 0x4000,
+		.gain_r = 0x4000,
+		.gain_b = 0x4000,
+		.gain_gb = 0x4000,
+	},
+};
+
+static const struct viif_l1_raw_color_noise_reduction_config
+defval_l1_set_raw_color_noise_reduction = {
+	.param_h = {
+		.rcnr_cnf_clip_gain_r = 3,
+		.rcnr_cnf_clip_gain_g = 2,
+		.rcnr_cnf_clip_gain_b = 3,
+		.rcnr_merge_black = 0x20,
+		.rcnr_merge_mindiv = 4,
+		.rcnr_anf_blend_ag0 = 1,
+		.rcnr_anf_blend_ag1 = 2,
+		.rcnr_anf_blend_ag2 = 2,
+		.rcnr_lpf_threshold = 8,
+	},
+	.param_m = {
+		.rcnr_cnf_clip_gain_r = 3,
+		.rcnr_cnf_clip_gain_g = 2,
+		.rcnr_cnf_clip_gain_b = 3,
+		.rcnr_merge_black = 0x20,
+		.rcnr_merge_mindiv = 4,
+		.rcnr_anf_blend_ag0 = 1,
+		.rcnr_anf_blend_ag1 = 2,
+		.rcnr_anf_blend_ag2 = 2,
+		.rcnr_lpf_threshold = 8,
+	},
+	.param_l = {
+		.rcnr_cnf_clip_gain_r = 3,
+		.rcnr_cnf_clip_gain_g = 2,
+		.rcnr_cnf_clip_gain_b = 3,
+		.rcnr_merge_black = 0x20,
+		.rcnr_merge_mindiv = 4,
+		.rcnr_anf_blend_ag0 = 1,
+		.rcnr_anf_blend_ag1 = 2,
+		.rcnr_anf_blend_ag2 = 2,
+		.rcnr_lpf_threshold = 8,
+	},
+};
+
+static const struct viif_l1_hdrs_config defval_l1_set_hdrs = {
+	.hdrs_hdr_mode = 1,
+	.hdrs_hdr_ratio_m = 0x10000,
+	.hdrs_hdr_ratio_l = 0x400000,
+	.hdrs_hdr_ratio_e = 0x400,
+	.hdrs_dg_h = 0x400,
+	.hdrs_dg_m = 0x400,
+	.hdrs_dg_l = 0x400,
+	.hdrs_dg_e = 0x400,
+	.hdrs_blendend_h = 0xfa0,
+	.hdrs_blendend_m = 0xfa0,
+	.hdrs_blendend_e = 0xfa0,
+	.hdrs_blendbeg_h = 0x12c,
+	.hdrs_blendbeg_m = 0x12c,
+	.hdrs_blendbeg_e = 0x12c,
+	.hdrs_dst_max_val = 0xffffff,
+};
+
+static const struct viif_l1_black_level_correction_config
+	defval_l1_set_black_level_correction = {
+		.srcblacklevel_gr = 0x40,
+		.srcblacklevel_r = 0x40,
+		.srcblacklevel_b = 0x40,
+		.srcblacklevel_gb = 0x40,
+		.mulval_gr = 0x40000,
+		.mulval_r = 0x40000,
+		.mulval_b = 0x40000,
+		.mulval_gb = 0x40000,
+		.dstmaxval = 0xffffff,
+	};
+
+static const struct viif_l1_lsc_config defval_l1_set_lsc = { 0 };
+
+static const struct viif_l1_main_process_config defval_l1_set_main_process = {
+	.damp_lsbsel = 0x8,
+	.demosaic_mode = 1,
+	.colormat_enable = 0,
+	.dst_maxval = 0xffffff,
+};
+
+static const struct viif_l1_awb_config defval_l1_set_awb = {
+	.enable = 0,
+	.awhb_wbmrg = 256,
+	.awhb_wbmgg = 256,
+	.awhb_wbmbg = 256,
+};
+
+static const u32 defval_l1_lock_awb_gain;
+
+static const struct viif_l1_hdrc_config defval_l1_set_hdrc = {
+	.enable = 1,
+	.param = {
+		.hdrc_ratio = 0x0e + VIIF_L1_HDRC_RATIO_OFFSET,
+		.hdrc_pt_ratio = 7,
+		.hdrc_pt_sat = 0xffc0,
+		.hdrc_tn_type = 1,
+	},
+};
+
+static const struct viif_l1_hdrc_ltm_config defval_l1_set_hdrc_ltm = {
+	.tnp_max = 0x3fffff,
+	.tnp_mag = 0x40,
+	.tnp_fil = { 0x88, 0x84, 0x7a, 0x6a, 0x54 },
+};
+
+static const struct viif_l1_gamma_config defval_l1_set_gamma = {
+	.enable = 1,
+	.param = {
+		.gam_p = {0x02f, 0x01b, 0x02a, 0x023, 0x020, 0x037, 0x031, 0x057,
+			  0x04d, 0x088, 0x078, 0x0d6, 0x0bd, 0x14f, 0x12a, 0x20d,
+			  0x1d3, 0x1ab, 0x18d, 0x2dc, 0x29e, 0x271, 0x47c, 0x41b,
+			  0x3d4, 0x70a, 0x672, 0x601, 0xb0c, 0xa1d, 0x96c, 0x8e2,
+			  0x874, 0xfdd, 0xec9, 0xdf2, 0xd42, 0xcb1, 0xc35, 0xbc9,
+			  0xb6a, 0xb16, 0xacb, 0xa86},
+		.blkadj = 0x1000,
+	},
+};
+
+static const struct viif_l1_img_quality_adjustment_config
+	defval_l1_set_img_quality_adjustment = {
+		.enable = 0,
+		.coef_cb = 0x9078,
+		.coef_cr = 0xb699,
+		.brightness = 0,
+		.linear_contrast = 128,
+	};
+
+static const struct viif_l1_avg_lum_generation_config
+	defval_l1_set_avg_lum_generation = { .enable = 0 };
+
+static const struct viif_l2_undist_config defval_l2_set_undist = {
+	.param = {
+		.through_mode = 1,
+		.roi_mode = {0, 0},
+		.grid_node_num_h = 0x10,
+		.grid_node_num_v = 0x10,
+	},
+};
+
+static const struct viif_l2_gamma_config defval_l2_set_gamma = { 0 };
+
+static const struct viif_l2_crop_config defval_l2_set_crop = { 0, 0 };
+
+static void viif_apply_default_parameter(struct viif_device *viif_dev)
+{
+	viif_l1_set_input_mode(viif_dev, &defval_l1_set_input_mode);
+	viif_l1_set_rgb_to_y_coef(viif_dev, &defval_l1_set_rgb_to_y_coef);
+	viif_l1_set_ag_mode(viif_dev, &defval_l1_set_ag_mode);
+	viif_l1_set_ag(viif_dev, &defval_l1_set_ag);
+	viif_l1_set_hdre(viif_dev, &defval_l1_set_hdre);
+	viif_l1_set_img_extraction(viif_dev, &defval_l1_set_img_extraction);
+	viif_l1_set_dpc(viif_dev, &defval_l1_set_dpc);
+	viif_l1_set_preset_white_balance(viif_dev,
+					 &defval_l1_set_preset_white_balance);
+	viif_l1_set_raw_color_noise_reduction(
+		viif_dev, &defval_l1_set_raw_color_noise_reduction);
+	viif_l1_set_hdrs(viif_dev, &defval_l1_set_hdrs);
+	viif_l1_set_black_level_correction(
+		viif_dev, &defval_l1_set_black_level_correction);
+	viif_l1_set_lsc(viif_dev, &defval_l1_set_lsc);
+	viif_l1_set_main_process(viif_dev, &defval_l1_set_main_process);
+	viif_l1_set_awb(viif_dev, &defval_l1_set_awb);
+	viif_l1_lock_awb_gain(viif_dev, &defval_l1_lock_awb_gain);
+	viif_l1_set_hdrc(viif_dev, &defval_l1_set_hdrc);
+	viif_l1_set_hdrc_ltm(viif_dev, &defval_l1_set_hdrc_ltm);
+	viif_l1_set_gamma(viif_dev, &defval_l1_set_gamma);
+	viif_l1_set_img_quality_adjustment(
+		viif_dev, &defval_l1_set_img_quality_adjustment);
+	viif_l1_set_avg_lum_generation(viif_dev,
+				       &defval_l1_set_avg_lum_generation);
+	viif_l2_set_undist(viif_dev, &defval_l2_set_undist);
+	viif_l2_set_gamma(viif_dev, CAPTURE_PATH_MAIN_POST0,
+			  &defval_l2_set_gamma);
+	viif_l2_set_gamma(viif_dev, CAPTURE_PATH_MAIN_POST1,
+			  &defval_l2_set_gamma);
+	viif_l2_set_crop(viif_dev, CAPTURE_PATH_MAIN_POST0,
+			 &defval_l2_set_crop);
+	viif_l2_set_crop(viif_dev, CAPTURE_PATH_MAIN_POST1,
+			 &defval_l2_set_crop);
+}
+
+/*----------------------------------------------
+ * Parameter buffer streaming interface
+ */
+struct viif_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head queue;
+};
+
+static bool viif_params_get_buffer(struct params_dev *params_dev,
+				   struct viif_buffer **buf,
+				   struct visconti_viif_isp_config **cfg)
+{
+	if (list_empty(&params_dev->params_queue))
+		return false;
+
+	*buf = list_first_entry(&params_dev->params_queue, struct viif_buffer,
+				queue);
+	*cfg = vb2_plane_vaddr(&(*buf)->vb.vb2_buf, 0);
+
+	return true;
+}
+
+static bool viif_apply_queued_parameter(struct viif_device *viif_dev,
+					bool initial_cfg)
+{
+	struct params_dev *params_dev = &viif_dev->params_dev;
+	struct visconti_viif_isp_config *new_params;
+	struct viif_buffer *cur_buf;
+
+	guard(spinlock)(&params_dev->params_lock);
+
+	if (!viif_params_get_buffer(params_dev, &cur_buf, &new_params))
+		return false;
+
+	/* Evaluate new_params */
+	if (initial_cfg) {
+		if (new_params->update_cfg &
+		    VISCONTI_VIIF_CFG_ISP_L1_INPUT_MODE)
+			viif_l1_set_input_mode(viif_dev,
+					       &new_params->l1_input_mode);
+	}
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_RGB_TO_Y_COEF)
+		viif_l1_set_rgb_to_y_coef(viif_dev,
+					  &new_params->l1_rgb_to_y_coef);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_AG_MODE)
+		viif_l1_set_ag_mode(viif_dev, &new_params->l1_ag_mode);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_AG)
+		viif_l1_set_ag(viif_dev, &new_params->l1_ag);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_HDRE)
+		viif_l1_set_hdre(viif_dev, &new_params->l1_hdre);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_IMG_EXTRACTION)
+		viif_l1_set_img_extraction(viif_dev,
+					   &new_params->l1_img_extraction);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_DPC)
+		viif_l1_set_dpc(viif_dev, &new_params->l1_dpc);
+	if (new_params->update_cfg &
+	    VISCONTI_VIIF_CFG_ISP_L1_PRESET_WHITE_BALANCE)
+		viif_l1_set_preset_white_balance(
+			viif_dev, &new_params->l1_preset_white_balance);
+	if (new_params->update_cfg &
+	    VISCONTI_VIIF_CFG_ISP_L1_RAW_COLOR_NOISE_REDUCTION)
+		viif_l1_set_raw_color_noise_reduction(
+			viif_dev, &new_params->l1_raw_color_noise_reduction);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_HDRS)
+		viif_l1_set_hdrs(viif_dev, &new_params->l1_hdrs);
+	if (new_params->update_cfg &
+	    VISCONTI_VIIF_CFG_ISP_L1_BLACK_LEVEL_CORRECTION)
+		viif_l1_set_black_level_correction(
+			viif_dev, &new_params->l1_black_level_correction);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_LSC)
+		viif_l1_set_lsc(viif_dev, &new_params->l1_lsc);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_MAIN_PROCESS)
+		viif_l1_set_main_process(viif_dev,
+					 &new_params->l1_main_process);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_AWB)
+		viif_l1_set_awb(viif_dev, &new_params->l1_awb);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_LOCK_AWB_GAIN)
+		viif_l1_lock_awb_gain(viif_dev, &new_params->lock_awb_gain);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_HDRC)
+		viif_l1_set_hdrc(viif_dev, &new_params->l1_hdrc);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_HDRC_LTM)
+		viif_l1_set_hdrc_ltm(viif_dev, &new_params->l1_hdrc_ltm);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_GAMMA)
+		viif_l1_set_gamma(viif_dev, &new_params->l1_gamma);
+	if (new_params->update_cfg &
+	    VISCONTI_VIIF_CFG_ISP_L1_IMG_QUALITY_ADJUSTMENT)
+		viif_l1_set_img_quality_adjustment(
+			viif_dev, &new_params->l1_img_quality_adjustment);
+	if (new_params->update_cfg &
+	    VISCONTI_VIIF_CFG_ISP_L1_AVG_LUM_GENERATION)
+		viif_l1_set_avg_lum_generation(
+			viif_dev, &new_params->l1_avg_lum_generation);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L2_UNDIST)
+		viif_l2_set_undist(viif_dev, &new_params->l2_undist);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L2_ROI)
+		viif_l2_set_roi(viif_dev, &new_params->l2_roi);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L2_GAMMA_POST0)
+		viif_l2_set_gamma(viif_dev, CAPTURE_PATH_MAIN_POST0,
+				  &new_params->l2_gamma_post0);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L2_GAMMA_POST1)
+		viif_l2_set_gamma(viif_dev, CAPTURE_PATH_MAIN_POST1,
+				  &new_params->l2_gamma_post1);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L2_CROP_POST0)
+		viif_l2_set_crop(viif_dev, CAPTURE_PATH_MAIN_POST0,
+				 &new_params->l2_crop_post0);
+	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L2_CROP_POST1)
+		viif_l2_set_crop(viif_dev, CAPTURE_PATH_MAIN_POST1,
+				 &new_params->l2_crop_post1);
+
+	/* Release buffer */
+	list_del(&cur_buf->queue);
+	cur_buf->vb.sequence = 0;
+	vb2_buffer_done(&cur_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+
+	return true;
+}
+
+void visconti_viif_params_isr(struct viif_device *viif_dev)
+{
+	viif_apply_queued_parameter(viif_dev, false);
+}
+
+void visconti_viif_params_eval_queue(struct viif_device *viif_dev)
+{
+	if (!viif_apply_queued_parameter(viif_dev, true))
+		viif_apply_default_parameter(viif_dev);
+}
+
+static int viif_params_enum_fmt_meta_out(struct file *file, void *priv,
+					 struct v4l2_fmtdesc *f)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (f->index > 0 || f->type != vdev->queue->type)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_META_FMT_VISCONTI_VIIF_PARAMS;
+
+	return 0;
+}
+
+static int viif_params_g_fmt_meta_out(struct file *file, void *fh,
+				      struct v4l2_format *f)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct v4l2_meta_format *meta = &f->fmt.meta;
+
+	if (f->type != vdev->queue->type)
+		return -EINVAL;
+
+	memset(meta, 0, sizeof(*meta));
+	meta->dataformat = V4L2_META_FMT_VISCONTI_VIIF_PARAMS;
+	meta->buffersize = sizeof(struct visconti_viif_isp_config);
+
+	return 0;
+}
+
+static int viif_params_querycap(struct file *file, void *priv,
+				struct v4l2_capability *cap)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	strscpy(cap->driver, VIIF_DRIVER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, vdev->name, sizeof(cap->card));
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops viif_params_ioctl = {
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_enum_fmt_meta_out = viif_params_enum_fmt_meta_out,
+	.vidioc_g_fmt_meta_out = viif_params_g_fmt_meta_out,
+	.vidioc_s_fmt_meta_out = viif_params_g_fmt_meta_out,
+	.vidioc_try_fmt_meta_out = viif_params_g_fmt_meta_out,
+	.vidioc_querycap = viif_params_querycap,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_file_operations viif_params_fops = {
+	.mmap = vb2_fop_mmap,
+	.unlocked_ioctl = video_ioctl2,
+	.poll = vb2_fop_poll,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+};
+
+static int viif_params_vb2_queue_setup(struct vb2_queue *q,
+				       unsigned int *num_buffers,
+				       unsigned int *num_planes,
+				       unsigned int sizes[],
+				       struct device *alloc_devs[])
+{
+	if (*num_planes) {
+		if (*num_planes != 1)
+			return -EINVAL;
+		if (sizes[0] < sizeof(struct visconti_viif_isp_config))
+			return -EINVAL;
+	} else {
+		*num_planes = 1;
+		*num_buffers = clamp_t(u32, *num_buffers,
+				       VIIF_PARAMS_REQ_BUFS_MIN,
+				       VIIF_PARAMS_REQ_BUFS_MAX);
+		sizes[0] = sizeof(struct visconti_viif_isp_config);
+	}
+
+	return 0;
+}
+
+static inline struct viif_buffer *vb2_to_viif(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct viif_buffer, vb);
+}
+
+static inline struct params_dev *vb2queue_to_paramsdev(struct vb2_queue *vq)
+{
+	return (struct params_dev *)vb2_get_drv_priv(vq);
+}
+
+static void viif_params_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct params_dev *params_dev = vb2queue_to_paramsdev(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct viif_buffer *buf = vb2_to_viif(vbuf);
+
+	guard(spinlock_irq)(&params_dev->params_lock);
+	list_add_tail(&buf->queue, &params_dev->params_queue);
+}
+
+static int viif_params_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	if (vb2_plane_size(vb, 0) < sizeof(struct visconti_viif_isp_config))
+		return -EINVAL;
+
+	vb2_set_plane_payload(vb, 0, sizeof(struct visconti_viif_isp_config));
+	return 0;
+}
+
+static int viif_params_vb2_start_streaming(struct vb2_queue *q,
+					   unsigned int arg)
+{
+	return 0;
+}
+
+static void viif_params_vb2_stop_streaming(struct vb2_queue *q)
+{
+	struct params_dev *params_dev = vb2queue_to_paramsdev(q);
+	struct viif_buffer *buf;
+	LIST_HEAD(tmp_list);
+
+	scoped_guard(spinlock_irq, &params_dev->params_lock)
+		list_splice_init(&params_dev->params_queue, &tmp_list);
+
+	list_for_each_entry(buf, &tmp_list, queue)
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+}
+
+static const struct vb2_ops viif_params_vb2_ops = {
+	.queue_setup = viif_params_vb2_queue_setup,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.buf_queue = viif_params_vb2_buf_queue,
+	.buf_prepare = viif_params_vb2_buf_prepare,
+	.start_streaming = viif_params_vb2_start_streaming,
+	.stop_streaming = viif_params_vb2_stop_streaming,
+};
+
+int visconti_viif_params_register(struct viif_device *viif_dev)
+{
+	struct params_dev *params_dev = &viif_dev->params_dev;
+	struct video_device *vdev = &params_dev->vdev;
+	struct vb2_queue *q = &params_dev->vb2_vq;
+	int ret;
+
+	mutex_init(&params_dev->vlock);
+	INIT_LIST_HEAD(&params_dev->params_queue);
+	spin_lock_init(&params_dev->params_lock);
+
+	strscpy(vdev->name, "viif_params", sizeof(vdev->name));
+
+	/* Register the video device */
+	video_set_drvdata(vdev, params_dev);
+	vdev->ioctl_ops = &viif_params_ioctl;
+	vdev->fops = &viif_params_fops;
+	vdev->release = video_device_release_empty;
+	vdev->lock = &params_dev->vlock;
+	vdev->v4l2_dev = &viif_dev->v4l2_dev;
+	vdev->queue = &params_dev->vb2_vq;
+	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
+	vdev->vfl_dir = VFL_DIR_TX;
+
+	/* Initialize vb2 queue */
+	q->type = V4L2_BUF_TYPE_META_OUTPUT;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	q->drv_priv = params_dev;
+	q->ops = &viif_params_vb2_ops;
+	q->mem_ops = &vb2_vmalloc_memops;
+	q->buf_struct_size = sizeof(struct viif_buffer);
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->lock = &params_dev->vlock;
+	q->dev = viif_dev->v4l2_dev.dev;
+
+	ret = vb2_queue_init(q);
+	if (ret)
+		return ret;
+
+	params_dev->params_pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&vdev->entity, VIIF_PARAMS_PAD_NUM,
+				     &params_dev->params_pad);
+	if (ret)
+		goto error;
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(viif_dev->v4l2_dev.dev,
+			"video_register_device failed: %d\n", ret);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	media_entity_cleanup(&vdev->entity);
+	mutex_destroy(&params_dev->vlock);
+
+	return ret;
+}
+
+void visconti_viif_params_unregister(struct viif_device *viif_dev)
+{
+	struct params_dev *params = &viif_dev->params_dev;
+	struct video_device *vdev = &params->vdev;
+
+	if (!video_is_registered(vdev))
+		return;
+
+	vb2_video_unregister_device(vdev);
+	media_entity_cleanup(&vdev->entity);
+	mutex_destroy(&params->vlock);
+}
diff --git a/drivers/media/platform/toshiba/visconti/viif_params.h b/drivers/media/platform/toshiba/visconti/viif_params.h
new file mode 100644
index 000000000000..a244459b6530
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/viif_params.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Toshiba Visconti Video Capture Support
+ *
+ * (C) Copyright 2025 TOSHIBA CORPORATION
+ * (C) Copyright 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef __VIIF_PARAMS_H__
+#define __VIIF_PARAMS_H__
+
+struct viif_device;
+
+void visconti_viif_params_eval_queue(struct viif_device *viif_dev);
+void visconti_viif_params_isr(struct viif_device *viif_dev);
+int visconti_viif_params_register(struct viif_device *viif_dev);
+void visconti_viif_params_unregister(struct viif_device *viif_dev);
+
+void visconti_viif_l2_undist_through(struct viif_device *viif_dev);
+#endif /* __VIIF_PARAMS_H__ */
diff --git a/drivers/media/platform/toshiba/visconti/viif_stats.c b/drivers/media/platform/toshiba/visconti/viif_stats.c
new file mode 100644
index 000000000000..da20824e64a5
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/viif_stats.c
@@ -0,0 +1,320 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/*
+ * Toshiba Visconti Video Capture Support
+ *
+ * (C) Copyright 2025 TOSHIBA CORPORATION
+ * (C) Copyright 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/pm_runtime.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-vmalloc.h>
+
+#include "viif.h"
+#include "viif_common.h"
+#include "viif_isp.h"
+#include "viif_regs.h"
+#include "viif_stats.h"
+
+#define VIIF_STATS_REQ_BUFS_MIN 2
+#define VIIF_STATS_REQ_BUFS_MAX 8
+
+struct viif_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head queue;
+};
+
+static void viif_stats_read_isp_regs(struct viif_l1_info *l1_info,
+				     struct viif_device *viif_dev)
+{
+	int i, j;
+	u32 val;
+
+	guard(spinlock_irqsave)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	/* Change register buffer to regbuf0 where driver gets information */
+	viif_capture_write(viif_dev, REG_L1_CRGBF_ACC_CONF,
+			   VAL_L1_CRGBF_ACC_CONF_MODE_BUFFER0);
+
+	l1_info->awb_ave_u = viif_capture_read(viif_dev, REG_L1_AWHB_AVE_USIG);
+	l1_info->awb_ave_v = viif_capture_read(viif_dev, REG_L1_AWHB_AVE_VSIG);
+	l1_info->awb_accumulated_pixel =
+		viif_capture_read(viif_dev, REG_L1_AWHB_NUM_UVON);
+	l1_info->awb_gain_r = viif_capture_read(viif_dev, REG_L1_AWHB_AWBGAINR);
+	l1_info->awb_gain_g = viif_capture_read(viif_dev, REG_L1_AWHB_AWBGAING);
+	l1_info->awb_gain_b = viif_capture_read(viif_dev, REG_L1_AWHB_AWBGAINB);
+	val = viif_capture_read(viif_dev, REG_L1_AWHB_R_CTR_STOP);
+	l1_info->awb_status_u = (FIELD_GET(BIT(1), val) != 0);
+	l1_info->awb_status_v = (FIELD_GET(BIT(0), val) != 0);
+
+	l1_info->avg_lum_weight =
+		viif_capture_read(viif_dev, REG_L1_AEXP_RESULT_AVE);
+	val = viif_capture_read(viif_dev, REG_L1_AEXP_SATUR_BLACK_PIXNUM);
+	l1_info->avg_satur_pixnum = FIELD_GET(GENMASK(31, 16), val);
+	l1_info->avg_black_pixnum = FIELD_GET(GENMASK(15, 0), val);
+	for (i = 0; i < 8; i++) {
+		for (j = 0; j < 8; j++) {
+			l1_info->avg_lum_block[i][j] = viif_capture_read(
+				viif_dev, REG_L1_AEXP_AVE(i, j));
+		}
+	}
+	l1_info->avg_lum_four_line_lum[0] =
+		viif_capture_read(viif_dev, REG_L1_AEXP_AVE4LINES0);
+	l1_info->avg_lum_four_line_lum[1] =
+		viif_capture_read(viif_dev, REG_L1_AEXP_AVE4LINES1);
+	l1_info->avg_lum_four_line_lum[2] =
+		viif_capture_read(viif_dev, REG_L1_AEXP_AVE4LINES2);
+	l1_info->avg_lum_four_line_lum[3] =
+		viif_capture_read(viif_dev, REG_L1_AEXP_AVE4LINES3);
+
+	/* Revert to register access from register buffer access */
+	viif_capture_write(viif_dev, REG_L1_CRGBF_ACC_CONF,
+			   VAL_L1_CRGBF_ACC_CONF_MODE_BYPASS);
+}
+
+void visconti_viif_stats_isr(struct viif_device *viif_dev,
+			     unsigned int sequence, u64 timestamp)
+{
+	struct visconti_viif_isp_stat *cur_stat_buf;
+	struct stats_dev *stats_dev = &viif_dev->stats_dev;
+	struct viif_buffer *cur_buf;
+
+	guard(spinlock)(&stats_dev->stats_lock);
+
+	if (list_empty(&stats_dev->stats_queue))
+		return;
+
+	cur_buf = list_first_entry(&stats_dev->stats_queue, struct viif_buffer,
+				   queue);
+	list_del(&cur_buf->queue);
+	cur_stat_buf = (struct visconti_viif_isp_stat *)vb2_plane_vaddr(
+		&cur_buf->vb.vb2_buf, 0);
+
+	viif_stats_read_isp_regs(&cur_stat_buf->isp_capture.l1_info, viif_dev);
+	cur_stat_buf->stat_type |= VISCONTI_VIIF_STAT_L1_INFO;
+
+	vb2_set_plane_payload(&cur_buf->vb.vb2_buf, 0,
+			      sizeof(struct visconti_viif_isp_stat));
+
+	cur_buf->vb.sequence = sequence;
+	cur_buf->vb.vb2_buf.timestamp = timestamp;
+	vb2_buffer_done(&cur_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+}
+
+static int viif_stats_enum_fmt_meta_cap(struct file *file, void *priv,
+					struct v4l2_fmtdesc *f)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (f->index > 0 || f->type != vdev->queue->type)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_META_FMT_VISCONTI_VIIF_STATS;
+
+	return 0;
+}
+
+static int viif_stats_g_fmt_meta_cap(struct file *file, void *priv,
+				     struct v4l2_format *f)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct v4l2_meta_format *meta = &f->fmt.meta;
+
+	if (f->type != vdev->queue->type)
+		return -EINVAL;
+
+	memset(meta, 0, sizeof(*meta));
+	meta->dataformat = V4L2_META_FMT_VISCONTI_VIIF_STATS;
+	meta->buffersize = sizeof(struct visconti_viif_isp_stat);
+
+	return 0;
+}
+
+static int viif_stats_querycap(struct file *file, void *priv,
+			       struct v4l2_capability *cap)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	strscpy(cap->driver, VIIF_DRIVER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, vdev->name, sizeof(cap->card));
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops viif_stats_ioctl = {
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_enum_fmt_meta_cap = viif_stats_enum_fmt_meta_cap,
+	.vidioc_g_fmt_meta_cap = viif_stats_g_fmt_meta_cap,
+	.vidioc_s_fmt_meta_cap = viif_stats_g_fmt_meta_cap,
+	.vidioc_try_fmt_meta_cap = viif_stats_g_fmt_meta_cap,
+	.vidioc_querycap = viif_stats_querycap,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_file_operations viif_stats_fops = {
+	.mmap = vb2_fop_mmap,
+	.unlocked_ioctl = video_ioctl2,
+	.poll = vb2_fop_poll,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+};
+
+static int viif_stats_vb2_queue_setup(struct vb2_queue *vq,
+				      unsigned int *num_buffers,
+				      unsigned int *num_planes,
+				      unsigned int sizes[],
+				      struct device *alloc_devs[])
+{
+	if (*num_planes) {
+		if (*num_planes != 1)
+			return -EINVAL;
+		if (sizes[0] < sizeof(struct visconti_viif_isp_stat))
+			return -EINVAL;
+	} else {
+		*num_planes = 1;
+		*num_buffers = clamp_t(u32, *num_buffers,
+				       VIIF_STATS_REQ_BUFS_MIN,
+				       VIIF_STATS_REQ_BUFS_MAX);
+		sizes[0] = sizeof(struct visconti_viif_isp_stat);
+	}
+
+	return 0;
+}
+
+static inline struct viif_buffer *vb2_to_viif(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct viif_buffer, vb);
+}
+
+static inline struct stats_dev *vb2queue_to_statsdev(struct vb2_queue *q)
+{
+	return (struct stats_dev *)vb2_get_drv_priv(q);
+}
+
+static void viif_stats_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct stats_dev *stats_dev = vb2queue_to_statsdev(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct viif_buffer *buf = vb2_to_viif(vbuf);
+
+	guard(spinlock_irq)(&stats_dev->stats_lock);
+	list_add_tail(&buf->queue, &stats_dev->stats_queue);
+}
+
+static int viif_stats_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	if (vb2_plane_size(vb, 0) < sizeof(struct visconti_viif_isp_stat))
+		return -EINVAL;
+
+	vb2_set_plane_payload(vb, 0, sizeof(struct visconti_viif_isp_stat));
+
+	return 0;
+}
+
+static void viif_stats_vb2_stop_streaming(struct vb2_queue *q)
+{
+	struct stats_dev *stats_dev = vb2queue_to_statsdev(q);
+	struct viif_buffer *buf, *tmp;
+
+	guard(spinlock_irq)(&stats_dev->stats_lock);
+
+	list_for_each_entry_safe(buf, tmp, &stats_dev->stats_queue, queue) {
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+}
+
+static const struct vb2_ops viif_stats_vb2_ops = {
+	.queue_setup = viif_stats_vb2_queue_setup,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.buf_queue = viif_stats_vb2_buf_queue,
+	.buf_prepare = viif_stats_vb2_buf_prepare,
+	.stop_streaming = viif_stats_vb2_stop_streaming,
+};
+
+int visconti_viif_stats_register(struct viif_device *viif_dev)
+{
+	struct stats_dev *stats_dev = &viif_dev->stats_dev;
+	struct video_device *vdev = &stats_dev->vdev;
+	struct vb2_queue *q = &stats_dev->vb2_vq;
+	int ret;
+
+	mutex_init(&stats_dev->vlock);
+	INIT_LIST_HEAD(&stats_dev->stats_queue);
+	spin_lock_init(&stats_dev->stats_lock);
+
+	strscpy(vdev->name, "viif_stats", sizeof(vdev->name));
+
+	/* Register the video device */
+	video_set_drvdata(vdev, stats_dev);
+	vdev->ioctl_ops = &viif_stats_ioctl;
+	vdev->fops = &viif_stats_fops;
+	vdev->release = video_device_release_empty;
+	vdev->lock = &stats_dev->vlock;
+	vdev->v4l2_dev = &viif_dev->v4l2_dev;
+	vdev->queue = &stats_dev->vb2_vq;
+	vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
+	vdev->vfl_dir = VFL_DIR_RX;
+
+	/* Initialize vb2 queue */
+	q->type = V4L2_BUF_TYPE_META_CAPTURE;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	q->drv_priv = stats_dev;
+	q->ops = &viif_stats_vb2_ops;
+	q->mem_ops = &vb2_vmalloc_memops;
+	q->buf_struct_size = sizeof(struct viif_buffer);
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->lock = &stats_dev->vlock;
+	q->dev = viif_dev->v4l2_dev.dev;
+
+	ret = vb2_queue_init(q);
+	if (ret)
+		return ret;
+
+	stats_dev->stats_pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&vdev->entity, VIIF_STATS_PAD_NUM,
+				     &stats_dev->stats_pad);
+	if (ret)
+		goto error;
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(viif_dev->v4l2_dev.dev,
+			"video_register_device failed: %d\n", ret);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	media_entity_cleanup(&vdev->entity);
+	mutex_destroy(&stats_dev->vlock);
+
+	return ret;
+}
+
+void visconti_viif_stats_unregister(struct viif_device *viif_dev)
+{
+	struct stats_dev *stats_dev = &viif_dev->stats_dev;
+	struct video_device *vdev = &stats_dev->vdev;
+
+	if (!video_is_registered(vdev))
+		return;
+
+	vb2_video_unregister_device(vdev);
+	media_entity_cleanup(&vdev->entity);
+	mutex_destroy(&stats_dev->vlock);
+}
diff --git a/drivers/media/platform/toshiba/visconti/viif_stats.h b/drivers/media/platform/toshiba/visconti/viif_stats.h
new file mode 100644
index 000000000000..ca83d45e3b39
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/viif_stats.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Toshiba Visconti Video Capture Support
+ *
+ * (C) Copyright 2025 TOSHIBA CORPORATION
+ * (C) Copyright 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef __VIIF_STATS_H__
+#define __VIIF_STATS_H__
+
+void visconti_viif_stats_isr(struct viif_device *viif_dev,
+			     unsigned int sequence, u64 timestamp);
+int visconti_viif_stats_register(struct viif_device *viif_dev);
+void visconti_viif_stats_unregister(struct viif_device *viif_dev);
+#endif /* __VIIF_STATS_H__ */

-- 
2.34.1



