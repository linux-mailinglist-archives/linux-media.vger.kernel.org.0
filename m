Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E75C33F0608
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239144AbhHROPM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239433AbhHRONQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:13:16 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B19C0612A5
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:41 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id f3so1901896plg.3
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zcqx/i1R3db3IODFMYP7WV7EnMO91W9GUlRjKdLW1pk=;
        b=JTpML9x0sae59apqcgeDT3t9/2gyhVQRgcGHiU/V2/E4Lhv++Y0Y57xtfynj5SmmPN
         5S1HdTpoquPINBnblVawQCgAJ40x6C0jiPRtwSwtRAVBwNyxCpj4yxf45eWPuUzZggOM
         S+SBsiGhBlXldM9l5OFRkA1Crc+uph2zBDtbkqD54eDV1a4K3VNiFOz0h/h6fTVslFmU
         i/PNo5TdNKurfyN5YEFe8bXYGjaM+iNo0LOvtUZa/1++8/8OgSaZGDE2nO1AN0hJOms1
         9wfLNkCaW7K6POq5nSrdw1VgkwDk1GBtiDfRxTenFKQUaLleiLvyqiwMdm9y2PZFjqAQ
         JPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=zcqx/i1R3db3IODFMYP7WV7EnMO91W9GUlRjKdLW1pk=;
        b=a+ExsZNJ/iG42mSv6Om6JN3O96fmU/ECbuePcnd/z4oYTO7itmSJh1qSZPkRJm6MRC
         AfQrIeMVUm9zNiLp3JgYK+eqzrnc0Xhppj7LH7Zlw/ATf4BnQbkoWurUF5X4brxIR+nY
         dqUHg2E4KcqbBi7lki88IFE8kpHwJiRnGtxNLnLKzxOtoMBXKBxmHnMA1CTENyTG8mAp
         kzby8b2bL1y7kJPYOuaDmKw+yQawpIj4KB5Wh/sZ+tDBEmEz8LnIYwoNgMtKNYjFrI0H
         56qIsxXdKCqcpZGKO6/glFh+QGEMANiMpoltl4uc4GUAO2UhXA+4Dpmyo0PI+VL+Ytno
         RtKg==
MIME-Version: 1.0
X-Gm-Message-State: AOAM531fhQCuC13wD0e2HKTSK04lP/SZVMo1YtBORU3UuHNYYIIxl7yi
        Iyz2U+UXV+yLKepiqAqP3OJyDl+qeW1Rr3rpAQlHu/q1UT8L8Yi45pP1JHJh4NBekJis1PSlYlq
        kPB0OdDYtZQGPto5r
X-Google-Smtp-Source: ABdhPJyrsdLR6dBCgysB/xVeZ+4VLu6KxekJESGQAuKQxCME6OdSt9xr5jfaAVEhy+80aUuLhrQ3+w==
X-Received: by 2002:a17:903:41c2:b0:12d:a7aa:40a8 with SMTP id u2-20020a17090341c200b0012da7aa40a8mr7631961ple.61.1629295960700;
        Wed, 18 Aug 2021 07:12:40 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.181])
        by smtp.gmail.com with ESMTPSA id e8sm8084343pgg.31.2021.08.18.07.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:12:40 -0700 (PDT)
From:   sidraya.bj@pathpartnertech.com
To:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com,
        Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH 14/30] v4l: vxd-dec: Add common headers
Date:   Wed, 18 Aug 2021 19:40:21 +0530
Message-Id: <20210818141037.19990-15-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="US-ASCII"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sidraya <sidraya.bj@pathpartnertech.com>

This patch includes all the common headers which is related
to h264, HEVC and MJPEG firmware data and error defines and pixel format.

Signed-off-by: Amit Makani <amit.makani@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 MAINTAINERS                                   |  14 +
 drivers/staging/media/vxd/common/img_errors.h | 104 +++
 drivers/staging/media/vxd/common/img_mem.h    |  43 +
 .../staging/media/vxd/decoder/fw_interface.h  | 818 ++++++++++++++++++
 .../staging/media/vxd/decoder/h264fw_data.h   | 652 ++++++++++++++
 .../staging/media/vxd/decoder/hevcfw_data.h   | 472 ++++++++++
 .../staging/media/vxd/decoder/img_pixfmts.h   | 195 +++++
 .../media/vxd/decoder/img_profiles_levels.h   |  33 +
 .../staging/media/vxd/decoder/jpegfw_data.h   |  83 ++
 drivers/staging/media/vxd/decoder/mmu_defs.h  |  42 +
 .../staging/media/vxd/decoder/scaler_setup.h  |  59 ++
 drivers/staging/media/vxd/decoder/vdec_defs.h | 548 ++++++++++++
 drivers/staging/media/vxd/decoder/vxd_ext.h   |  74 ++
 .../staging/media/vxd/decoder/vxd_mmu_defs.h  |  30 +
 drivers/staging/media/vxd/decoder/vxd_props.h |  80 ++
 15 files changed, 3247 insertions(+)
 create mode 100644 drivers/staging/media/vxd/common/img_errors.h
 create mode 100644 drivers/staging/media/vxd/common/img_mem.h
 create mode 100644 drivers/staging/media/vxd/decoder/fw_interface.h
 create mode 100644 drivers/staging/media/vxd/decoder/h264fw_data.h
 create mode 100644 drivers/staging/media/vxd/decoder/hevcfw_data.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_pixfmts.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_profiles_levels.h
 create mode 100644 drivers/staging/media/vxd/decoder/jpegfw_data.h
 create mode 100644 drivers/staging/media/vxd/decoder/mmu_defs.h
 create mode 100644 drivers/staging/media/vxd/decoder/scaler_setup.h
 create mode 100644 drivers/staging/media/vxd/decoder/vdec_defs.h
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_ext.h
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_mmu_defs.h
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_props.h

diff --git a/MAINTAINERS b/MAINTAINERS
index baf1f19e21f7..c7a6a0974415 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19545,6 +19545,8 @@ F:	drivers/staging/media/vxd/common/hash.c
 F:	drivers/staging/media/vxd/common/hash.h
 F:	drivers/staging/media/vxd/common/idgen_api.c
 F:	drivers/staging/media/vxd/common/idgen_api.h
+F:	drivers/staging/media/vxd/common/img_errors.h
+F:	drivers/staging/media/vxd/common/img_mem.h
 F:	drivers/staging/media/vxd/common/img_mem_man.c
 F:	drivers/staging/media/vxd/common/img_mem_man.h
 F:	drivers/staging/media/vxd/common/img_mem_unified.c
@@ -19563,26 +19565,38 @@ F:	drivers/staging/media/vxd/common/work_queue.h
 F:	drivers/staging/media/vxd/decoder/bspp.c
 F:	drivers/staging/media/vxd/decoder/bspp.h
 F:	drivers/staging/media/vxd/decoder/bspp_int.h
+F:	drivers/staging/media/vxd/decoder/fw_interface.h
 F:	drivers/staging/media/vxd/decoder/h264_secure_parser.c
 F:	drivers/staging/media/vxd/decoder/h264_secure_parser.h
+F:	drivers/staging/media/vxd/decoder/h264fw_data.h
 F:	drivers/staging/media/vxd/decoder/hevc_secure_parser.c
 F:	drivers/staging/media/vxd/decoder/hevc_secure_parser.h
+F:	drivers/staging/media/vxd/decoder/hevcfw_data.h
 F:	drivers/staging/media/vxd/decoder/hw_control.c
 F:	drivers/staging/media/vxd/decoder/hw_control.h
 F:	drivers/staging/media/vxd/decoder/img_dec_common.h
+F:	drivers/staging/media/vxd/decoder/img_pixfmts.h
+F:	drivers/staging/media/vxd/decoder/img_profiles_levels.h
 F:	drivers/staging/media/vxd/decoder/jpeg_secure_parser.c
 F:	drivers/staging/media/vxd/decoder/jpeg_secure_parser.h
+F:	drivers/staging/media/vxd/decoder/jpegfw_data.h
+F:	drivers/staging/media/vxd/decoder/mmu_defs.h
+F:	drivers/staging/media/vxd/decoder/scaler_setup.h
 F:	drivers/staging/media/vxd/decoder/swsr.c
 F:	drivers/staging/media/vxd/decoder/swsr.h
 F:	drivers/staging/media/vxd/decoder/translation_api.c
 F:	drivers/staging/media/vxd/decoder/translation_api.h
+F:	drivers/staging/media/vxd/decoder/vdec_defs.h
 F:	drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.c
 F:	drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.h
 F:	drivers/staging/media/vxd/decoder/vxd_core.c
 F:	drivers/staging/media/vxd/decoder/vxd_dec.c
 F:	drivers/staging/media/vxd/decoder/vxd_dec.h
+F:	drivers/staging/media/vxd/decoder/vxd_ext.h
 F:	drivers/staging/media/vxd/decoder/vxd_int.c
 F:	drivers/staging/media/vxd/decoder/vxd_int.h
+F:	drivers/staging/media/vxd/decoder/vxd_mmu_defs.h
+F;	drivers/staging/media/vxd/decoder/vxd_props.h
 F:	drivers/staging/media/vxd/decoder/vxd_pvdec.c
 F:	drivers/staging/media/vxd/decoder/vxd_pvdec_priv.h
 F:	drivers/staging/media/vxd/decoder/vxd_pvdec_regs.h
diff --git a/drivers/staging/media/vxd/common/img_errors.h b/drivers/staging/media/vxd/common/img_errors.h
new file mode 100644
index 000000000000..1f583b0284dc
--- /dev/null
+++ b/drivers/staging/media/vxd/common/img_errors.h
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Error codes.
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Amit Makani <amit.makani@ti.com>
+ *
+ * Re-written for upstreamimg
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+#ifndef __IMG_ERRORS__
+#define __IMG_ERRORS__
+
+#include <linux/dma-mapping.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
+
+#define IMG_DBG_ASSERT(expected) ({WARN_ON(!(expected)); 0; })
+
+/**
+ *IMG_SUCCESS - IMG_SUCCESS
+ */
+#define IMG_SUCCESS                                     (0)
+/* @brief Timeout */
+#define IMG_ERROR_TIMEOUT                               (1)
+/* @brief memory allocation failed */
+#define IMG_ERROR_MALLOC_FAILED                         (2)
+/* @brief Unspecified fatal error */
+#define IMG_ERROR_FATAL                                 (3)
+/* @brief Memory allocation failed */
+#define IMG_ERROR_OUT_OF_MEMORY                         (4)
+/* @brief Device is not found */
+#define IMG_ERROR_DEVICE_NOT_FOUND                      (5)
+/* @brief Device is not available/in use */
+#define IMG_ERROR_DEVICE_UNAVAILABLE                    (6)
+/* @brief Generic/unspecified failure */
+#define IMG_ERROR_GENERIC_FAILURE                       (7)
+/* @brief Operation was interrupted - retry */
+#define IMG_ERROR_INTERRUPTED                           (8)
+/* @brief Invalid id  */
+#define IMG_ERROR_INVALID_ID                            (9)
+/* @brief A signature value was found to be incorrect */
+#define IMG_ERROR_SIGNATURE_INCORRECT                   (10)
+/* @brief The provided parameters were inconsistent/incorrect */
+#define IMG_ERROR_INVALID_PARAMETERS                    (11)
+/* @brief A list/pool has run dry     */
+#define IMG_ERROR_STORAGE_TYPE_EMPTY                    (12)
+/* @brief A list is full      */
+#define IMG_ERROR_STORAGE_TYPE_FULL                     (13)
+/* @brief Something has already occurred which the code thinks has not */
+#define IMG_ERROR_ALREADY_COMPLETE                      (14)
+/* @brief A state machine is in an unexpected/illegal state */
+#define IMG_ERROR_UNEXPECTED_STATE                      (15)
+/* @brief A required resource could not be created/locked */
+#define IMG_ERROR_COULD_NOT_OBTAIN_RESOURCE             (16)
+/*
+ * @brief An attempt to access a structure/resource was
+ * made before it was initialised
+ */
+#define IMG_ERROR_NOT_INITIALISED                       (17)
+/*
+ * @brief An attempt to initialise a structure/resource
+ * was made when it has already been initialised
+ */
+#define IMG_ERROR_ALREADY_INITIALISED                   (18)
+/* @brief A provided value exceeded stated bounds */
+#define IMG_ERROR_VALUE_OUT_OF_RANGE                    (19)
+/* @brief The operation has been cancelled */
+#define IMG_ERROR_CANCELLED                             (20)
+/* @brief A specified minimum has not been met */
+#define IMG_ERROR_MINIMUM_LIMIT_NOT_MET                 (21)
+/* @brief The requested feature or mode is not supported */
+#define IMG_ERROR_NOT_SUPPORTED                         (22)
+/* @brief A device or process was idle */
+#define IMG_ERROR_IDLE                                  (23)
+/* @brief A device or process was busy */
+#define IMG_ERROR_BUSY                                  (24)
+/* @brief The device or resource has been disabled */
+#define IMG_ERROR_DISABLED                              (25)
+/* @brief The requested operation is not permitted at this time */
+#define IMG_ERROR_OPERATION_PROHIBITED                  (26)
+/* @brief The entry read from the MMU page directory is invalid */
+#define IMG_ERROR_MMU_PAGE_DIRECTORY_FAULT              (27)
+/* @brief The entry read from an MMU page table is invalid */
+#define IMG_ERROR_MMU_PAGE_TABLE_FAULT                  (28)
+/* @brief The entry read from an MMU page catalogue is invalid */
+#define IMG_ERROR_MMU_PAGE_CATALOGUE_FAULT              (29)
+/* @brief Memory can not be freed as it is still been used */
+#define IMG_ERROR_MEMORY_IN_USE                         (30)
+/* @brief A mismatch has unexpectedly occurred in data */
+#define IMG_ERROR_TEST_MISMATCH                         (31)
+
+#define IMG_ERROR_INVALID_CONTEXT			(32)
+
+#define IMG_ERROR_RETRY					(33)
+#define IMG_ERROR_UNDEFINED				(34)
+#define IMG_ERROR_INVALID_SIZE				(35)
+#define IMG_ERROR_SURFACE_LOCKED			(36)
+
+#endif /* __IMG_ERRORS__ */
diff --git a/drivers/staging/media/vxd/common/img_mem.h b/drivers/staging/media/vxd/common/img_mem.h
new file mode 100644
index 000000000000..c8b5e2311d14
--- /dev/null
+++ b/drivers/staging/media/vxd/common/img_mem.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Typedefs for memory pool and attributes
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Amit Makani <amit.makani@ti.com>
+ *
+ * Re-written for upstreamimg
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+#ifndef __IMG_MEM__
+#define __IMG_MEM__
+
+/*
+ * This type defines the memory attributes.
+ * @0x00000001: Memory to be allocated as cached
+ * @0x00000002: Memory to be allocated as uncached
+ * @0x00000004: Memory to be allocated as write-combined
+ *	(or equivalent buffered/burst writes mechanism)
+ * @0x00001000: Memory can be read only by the core
+ * @0x00002000: Memory can be written only by the core
+ * @0x00010000: Memory should be readable by the cpu
+ * @0x00020000: Memory should be writable by the cpu
+ */
+enum sys_emem_attrib {
+	SYS_MEMATTRIB_CACHED             = 0x00000001,
+	SYS_MEMATTRIB_UNCACHED           = 0x00000002,
+	SYS_MEMATTRIB_WRITECOMBINE       = 0x00000004,
+	SYS_MEMATTRIB_SECURE             = 0x00000010,
+	SYS_MEMATTRIB_INPUT              = 0x00000100,
+	SYS_MEMATTRIB_OUTPUT             = 0x00000200,
+	SYS_MEMATTRIB_INTERNAL           = 0x00000400,
+	SYS_MEMATTRIB_CORE_READ_ONLY     = 0x00001000,
+	SYS_MEMATTRIB_CORE_WRITE_ONLY    = 0x00002000,
+	SYS_MEMATTRIB_CPU_READ           = 0x00010000,
+	SYS_MEMATTRIB_CPU_WRITE          = 0x00020000,
+	SYS_MEMATTRIB_FORCE32BITS = 0x7FFFFFFFU
+};
+
+#endif /* __IMG_MEM__ */
diff --git a/drivers/staging/media/vxd/decoder/fw_interface.h b/drivers/staging/media/vxd/decoder/fw_interface.h
new file mode 100644
index 000000000000..6da3d835b950
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/fw_interface.h
@@ -0,0 +1,818 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * IMG MSVDX core Registers
+ * This file contains the MSVDX_CORE_REGS_H Definitions
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Amit Makani <amit.makani@ti.com>
+ *
+ * Re-written for upstreamimg
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+
+#ifndef FW_INTERFACE_H_
+#define FW_INTERFACE_H_
+
+/* TODO For now this macro defined, need to think and enable */
+#define VDEC_USE_PVDEC_COMPATIBILITY    1
+
+#define MSG_TYPE_PADDING                                (0x00)
+/* Start of parser specific Host->MTX messages */
+#define MSG_TYPE_START_PSR_HOSTMTX_MSG  (0x80)
+/* Start of parser specific MTX->Host message */
+#define MSG_TYPE_START_PSR_MTXHOST_MSG  (0xC0)
+
+enum {
+	FW_DEVA_INIT = MSG_TYPE_START_PSR_HOSTMTX_MSG,
+	FW_DEVA_DECODE_FE,
+	FW_DEVA_RES_0,
+	FW_DEVA_RES_1,
+	FW_DEVA_DECODE_BE,
+	FW_DEVA_HOST_BE_OPP,
+	FW_DEVA_DEBLOCK,
+	FW_DEVA_INTRA_OOLD,
+	FW_DEVA_ENDFRAME,
+
+	FW_DEVA_PARSE,
+	FW_DEVA_PARSE_FRAGMENT,
+	FW_DEVA_BEGINFRAME,
+
+#ifdef VDEC_USE_PVDEC_COMPATIBILITY
+#ifdef VDEC_USE_PVDEC_SEC
+	FWBSP_INIT,
+	FWBSP_PARSE_BITSTREAM,
+	FWDEC_DECODE,
+#endif /* VDEC_USE_PVDEC_SEC */
+#endif /* VDEC_USE_PVDEC_COMPATIBILITY */
+
+	/* Sent by the firmware on the MTX to the host. */
+	FW_DEVA_COMPLETED = MSG_TYPE_START_PSR_MTXHOST_MSG,
+#ifndef VDEC_USE_PVDEC_COMPATIBILITY
+	FW_DEVA_RES_2,
+	FW_DEVA_RES_3,
+	FW_DEVA_RES_4,
+	FW_DEVA_RES_5,
+
+	FW_DEVA_RES_6,
+	FW_DEVA_CONTIGUITY_WARNING,
+	FW_DEVA_PANIC,
+	FW_DEVA_RES_7,
+	FW_DEVA_RES_8,
+#else   /* ndef VDEC_USE_PVDEC_COMPATIBILITY */
+	FW_DEVA_PANIC,
+	FW_ASSERT,
+	FW_PERF,
+	/* An empty completion message sent by new vxd driver */
+	FW_VXD_EMPTY_COMPL,
+	FW_DEC_REQ_RECEIVED,
+	FW_SO,
+#ifdef VDEC_USE_PVDEC_SEC
+	FWBSP_NEW_SEQ,
+	FWBSP_NEW_PIC,
+	FWBSP_BUF_EMPTY,
+	FWBSP_ERROR,
+	FWDEC_COMPLETED,
+#endif /* VDEC_USE_PVDEC_SEC */
+#endif /* VDEC_USE_PVDEC_COMPATIBILITY */
+	FW_DEVA_SIGNATURES_LEGACY      = 0xD0,
+	FW_DEVA_SIGNATURES_HEVC        = 0xE0,
+	FW_DEVA_SIGNATURES_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/* Defines the Host/Firmware communication area */
+#ifndef VDEC_USE_PVDEC_COMPATIBILITY
+#define COMMS_HEADER_SIZE               (0x34)
+#else /* def VDEC_USE_PVDEC_COMPATIBILITY */
+#define COMMS_HEADER_SIZE       (0x40)
+#endif /* def VDEC_USE_PVDEC_COMPATIBILITY */
+/* dwords */
+#define PVDEC_COM_RAM_FW_STATUS_OFFSET                          0x00
+#define PVDEC_COM_RAM_TASK_STATUS_OFFSET                        0x04
+#define PVDEC_COM_RAM_FW_ID_OFFSET                              0x08
+#define PVDEC_COM_RAM_FW_MTXPC_OFFSET                           0x0c
+#define PVDEC_COM_RAM_MSG_COUNTER_OFFSET                        0x10
+#define PVDEC_COM_RAM_SIGNATURE_OFFSET                          0x14
+#define PVDEC_COM_RAM_TO_HOST_BUF_SIZE_AND_OFFSET_OFFSET        0x18
+#define PVDEC_COM_RAM_TO_HOST_RD_INDEX_OFFSET                   0x1c
+#define PVDEC_COM_RAM_TO_HOST_WRT_INDEX_OFFSET                  0x20
+#define PVDEC_COM_RAM_TO_MTX_BUF_SIZE_AND_OFFSET_OFFSET         0x24
+#define PVDEC_COM_RAM_TO_MTX_RD_INDEX_OFFSET                    0x28
+#define PVDEC_COM_RAM_FLAGS_OFFSET                              0x2c
+#define PVDEC_COM_RAM_TO_MTX_WRT_INDEX_OFFSET                   0x30
+#ifdef VDEC_USE_PVDEC_COMPATIBILITY
+#define PVDEC_COM_RAM_STATE_BUF_SIZE_AND_OFFSET_OFFSET          0x34
+#define PVDEC_COM_RAM_FW_MMU_REPORT_OFFSET                      0x38
+#endif /* VDEC_USE_PVDEC_COMPATIBILITY */
+/* fields */
+#define PVDEC_COM_RAM_TO_HOST_BUF_SIZE_AND_OFFSET_SIZE_MASK     0xFFFF
+#define PVDEC_COM_RAM_TO_HOST_BUF_SIZE_AND_OFFSET_SIZE_SHIFT    0
+#define PVDEC_COM_RAM_TO_HOST_BUF_SIZE_AND_OFFSET_OFFSET_MASK   0xFFFF0000
+#define PVDEC_COM_RAM_TO_HOST_BUF_SIZE_AND_OFFSET_OFFSET_SHIFT  16
+
+#define PVDEC_COM_RAM_TO_MTX_BUF_SIZE_AND_OFFSET_SIZE_MASK      0xFFFF
+#define PVDEC_COM_RAM_TO_MTX_BUF_SIZE_AND_OFFSET_SIZE_SHIFT     0
+#define PVDEC_COM_RAM_TO_MTX_BUF_SIZE_AND_OFFSET_OFFSET_MASK    0xFFFF0000
+#define PVDEC_COM_RAM_TO_MTX_BUF_SIZE_AND_OFFSET_OFFSET_SHIFT   16
+#ifdef VDEC_USE_PVDEC_COMPATIBILITY
+#define PVDEC_COM_RAM_STATE_BUF_SIZE_AND_OFFSET_SIZE_MASK       0xFFFF
+#define PVDEC_COM_RAM_STATE_BUF_SIZE_AND_OFFSET_SIZE_SHIFT      0
+#define PVDEC_COM_RAM_STATE_BUF_SIZE_AND_OFFSET_OFFSET_MASK     0xFFFF0000
+#define PVDEC_COM_RAM_STATE_BUF_SIZE_AND_OFFSET_OFFSET_SHIFT    16
+#endif /* VDEC_USE_PVDEC_COMPATIBILITY */
+#define PVDEC_COM_RAM_BUF_GET_SIZE(_reg_, _name_) \
+	(((_reg_) & PVDEC_COM_RAM_ ## _name_ ## _BUF_SIZE_AND_OFFSET_SIZE_MASK) >> \
+	 PVDEC_COM_RAM_ ## _name_ ## _BUF_SIZE_AND_OFFSET_SIZE_SHIFT)
+#define PVDEC_COM_RAM_BUF_GET_OFFSET(_reg_, _name_) \
+	(((_reg_) & \
+	  PVDEC_COM_RAM_ ## _name_ ## _BUF_SIZE_AND_OFFSET_OFFSET_MASK) >> \
+	 PVDEC_COM_RAM_ ## _name_ ## _BUF_SIZE_AND_OFFSET_OFFSET_SHIFT)
+#define PVDEC_COM_RAM_BUF_SET_SIZE_AND_OFFSET(_name_, _size_, _offset_) \
+	((((_size_) << \
+		PVDEC_COM_RAM_ ## _name_ ## _BUF_SIZE_AND_OFFSET_SIZE_SHIFT) \
+	  & PVDEC_COM_RAM_ ## _name_ ## _BUF_SIZE_AND_OFFSET_SIZE_MASK) | \
+	 (((_offset_) << \
+		PVDEC_COM_RAM_ ## _name_ ## _BUF_SIZE_AND_OFFSET_OFFSET_SHIFT) \
+	  & PVDEC_COM_RAM_ ## _name_ ## _BUF_SIZE_AND_OFFSET_OFFSET_MASK))
+/* values */
+/* Firmware ready signature value */
+	#define FW_READY_SIGNATURE                              (0xA5A5A5A5)
+
+/* Firmware status values */
+	#define FW_STATUS_BUSY                                  0
+	#define FW_STATUS_IDLE                                  1
+	#define FW_STATUS_PANIC                                 2
+	#define FW_STATUS_ASSERT                                3
+	#define FW_STATUS_GAMEOVER                              4
+	#define FW_STATUS_FEWATCHDOG                            5
+	#define FW_STATUS_EPWATCHDOG                            6
+	#define FW_STATUS_BEWATCHDOG                            7
+#ifdef VDEC_USE_PVDEC_COMPATIBILITY
+	#define FW_STATUS_SO                                    8
+	#define FW_STATUS_INIT                                  0xF
+#endif
+
+/* Decode Message Flags */
+	#define FW_DEVA_RENDER_IS_FIRST_SLICE                   (0x00000001)
+/* This is H264 Mbaff - required for state store */
+	#define FW_DEVA_FORCE_RECON_WRITE_DISABLE               (0x00000002)
+	#define FW_DEVA_RENDER_IS_LAST_SLICE                    (0x00000004)
+/* Prevents insertion of end of picture or flush at VEC EOS */
+	#define FW_DEVA_DECODE_DISABLE_EOF_DETECTION            (0x00000008)
+
+	#define FW_DEVA_CONTEXT_BUFFER_INVALID                  (0x00000010)
+	#define FW_DEVA_FORCE_ALT_OUTPUT                        (0x00000020)
+	#define FW_SECURE_STREAM                                (0x00000040)
+	#define FW_LOW_LATENCY                                  (0x00000080)
+
+	#define FW_DEVA_CONTIGUITY_DETECTION                    (0x00000100)
+	#define FW_DEVA_FORCE_INIT_CMDS                         (0x00000200)
+	#define FW_DEVA_DEBLOCK_ENABLE                          (0x00000400)
+#ifdef VDEC_USE_PVDEC_COMPATIBILITY
+	#define FW_VDEC_SEND_SIGNATURES                         (0x00000800)
+#else
+/*							(0x00000800) */
+#endif /* VDEC_USE_PVDEC_COMPATIBILITY */
+
+	#define FW_DEVA_FORCE_AUX_LINE_BUF_DISABLE              (0x00001000)
+/*
+ * Cause no response message to be sent, and no interrupt
+ * generation on successful completion
+ */
+	#define FW_DEVA_RENDER_NO_RESPONSE_MSG                  (0x00002000)
+/*
+ * Cause an interrupt if a response message is generated
+ * on successful completion
+ */
+	#define FW_DEVA_RENDER_HOST_INT                         (0x00004000)
+/* Report contiguity errors to host */
+	#define FW_DEVA_CONTIGUITY_REPORTING                    (0x00008000)
+
+	#define FW_DEVA_VC1_SKIPPED_PICTURE                     (0x00010000)
+	#define FW_INTERNAL_RENDER_SWITCH                       (0x00020000)
+	#define FW_DEVA_UNSUPPORTED                             (0x00040000)
+	#define DEBLOCKING_FORCED_OFF                           (0x00080000)
+#ifdef VDEC_USE_PVDEC_COMPATIBILITY
+	#define FW_VDEC_CMD_PENDING                             (0x00100000)
+#else
+/*							(0x00100000) */
+#endif
+/* Only for debug */
+	#define DETECTED_RENDEC_FULL                            (0x00200000)
+/* Only for debug */
+	#define DETECTED_RENDEC_EMPTY                           (0x00400000)
+	#define FW_ONE_PASS_PARSE                               (0x00800000)
+
+	#define FW_DEVA_EARLY_COMPLETE                          (0x01000000)
+	#define FW_DEVA_FE_EP_SIGNATURES_READY                  (0x02000000)
+	#define FW_VEC_EOS                                      (0x04000000)
+/* hardware has reported an error relating to this command */
+	#define FW_DEVA_ERROR_DETECTED_ENT                      (0x08000000)
+
+	#define FW_DEVA_ERROR_DETECTED_PIX                      (0x10000000)
+	#define FW_DEVA_MP_SYNC                                 (0x20000000)
+	#define MORE_THAN_ONE_MB                                (0x40000000)
+	#define REATTEMPT_SINGLEPIPE                            (0x80000000)
+/* end of message flags */
+#ifdef VDEC_USE_PVDEC_COMPATIBILITY
+/* VDEC Decode Message Flags */
+/*
+ * H.264/H.265 are to be configured in SIZE_DELIMITED mode rather than SCP mode.
+ */
+#define FW_VDEC_NAL_SIZE_DELIM                  (0x00000001)
+/* Indicates if MMU cache shall be flushed. */
+#define FW_VDEC_MMU_FLUSH_CACHE                 (0x00000002)
+/* end of message flags */
+#endif /* VDEC_USE_PVDEC_COMPATIBILITY */
+
+/* FW flags */
+/* TODO : Temporary for HW testing */
+	#define FWFLAG_DISABLE_VDEB_PRELOAD             (0x00000001)
+	#define FWFLAG_BIG_TO_HOST_BUFFER               (0x00000002)
+/* FS is default regarless of this flag */
+	#define FWFLAG_FORCE_FS_FLOW                    (0x00000004)
+	#define FWFLAG_DISABLE_WATCHDOG_TIMERS          (0x00000008)
+
+	#define FWFLAG_DISABLE_AEH                      (0x00000020)
+	#define FWFLAG_DISABLE_AUTONOMOUS_RESET         (0x00000040)
+	#define FWFLAG_NON_ACCUMULATING_HWSIGS          (0x00000080)
+
+	#define FWFLAG_DISABLE_2PASS_DEBLOCK            (0x00000100)
+	#define FWFLAG_NO_INT_ON_TOHOST_FULL            (0x00000200)
+	#define FWFLAG_RETURN_VDEB_CR                   (0x00000800)
+
+	#define FWFLAG_DISABLE_AUTOCLOCKGATING          (0x00001000)
+	#define FWFLAG_DISABLE_IDLE_GPIO                (0x00002000)
+	#define FWFLAG_XPL                              (0x00004000)
+	#define FWFLAG_INFINITE_MTX_TIMEOUT             (0x00008000)
+
+	#define FWFLAG_DECOUPLE_BE_FE                   (0x00010000)
+	#define FWFLAG_ENABLE_SECURITY                  (0x00080000)
+
+	#define FWFLAG_ENABLE_CONCEALMENT               (0x00100000)
+/* Not currently supported */
+/*	#define	FWFLAG_PREEMPT				(0x00200000) */
+/* NA in FS */
+	#define FWFLAG_FORCE_FLUSHING                   (0x00400000)
+/* NA in FS */
+	#define FWFLAG_DISABLE_GENC_FLUSHING            (0x00800000)
+
+	#define FWFLAG_DISABLE_COREWDT_TIMERS           (0x01000000)
+	#define FWFLAG_DISABLE_RENDEC_AUTOFLUSH         (0x02000000)
+	#define FWFLAG_FORCE_STRICT_SINGLEPIPE          (0x04000000)
+	#define FWFLAG_CONSISTENT_MULTIPIPE_FLOW        (0x08000000)
+
+	#define FWFLAG_DISABLE_IDLE_FAST_EVAL           (0x10000000)
+	#define FWFLAG_FAKE_COMPLETION                  (0x20000000)
+	#define FWFLAG_MAN_PP_CLK                       (0x40000000)
+	#define FWFLAG_STACK_CHK                        (0x80000000)
+
+/* end of FW flags */
+
+#ifdef FW_STACK_USAGE_TRACKING
+/* FW task identifiers */
+enum task_id {
+	TASK_ID_RX = 0,
+	TASK_ID_TX,
+	TASK_ID_EP1,
+	TASK_ID_FE1,
+	TASK_ID_FE2,
+	TASK_ID_FE3,
+	TASK_ID_BE1,
+	TASK_ID_BE2,
+	TASK_ID_BE3,
+	TASK_ID_PARSER,
+	TASK_ID_MAX,
+	TASK_ID_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/* FW task stack info utility macros */
+#define TASK_STACK_SIZE_MASK   0xFFFF
+#define TASK_STACK_SIZE_SHIFT  0
+#define TASK_STACK_USED_MASK   0xFFFF0000
+#define TASK_STACK_USED_SHIFT  16
+#define TASK_STACK_SET_INFO(_task_id_, _stack_info_, _size_, _used_) \
+	(_stack_info_[_task_id_] = \
+		 ((_size_) << TASK_STACK_SIZE_SHIFT) | \
+		 ((_used_) << TASK_STACK_USED_SHIFT))
+#define TASK_STACK_GET_SIZE(_task_id_, _stack_info_) \
+	((_stack_info_[_task_id_] & TASK_STACK_SIZE_MASK) >> \
+	 TASK_STACK_SIZE_SHIFT)
+#define TASK_STACK_GET_USED(_task_id_, _stack_info_) \
+	((_stack_info_[_task_id_] & TASK_STACK_USED_MASK) >> \
+	 TASK_STACK_USED_SHIFT)
+#endif /* FW_STACK_USAGE_TRACKING */
+
+/* Control Allocation */
+#define CMD_MASK                                (0xF0000000)
+
+/* Ctrl Allocation Header */
+#define CMD_CTRL_ALLOC_HEADER                   (0x90000000)
+
+struct ctrl_alloc_header {
+	unsigned int cmd_additional_params;
+	unsigned int slice_params;
+	union {
+		unsigned int vp8_probability_data;
+		unsigned int h264_pipeintra_buffersize;
+	};
+	unsigned int chroma_strides;
+	unsigned int slice_first_mb_yx;
+	unsigned int pic_last_mb_yx;
+	/* VC1 only : Store Range Map flags in bottom bits of [0] */
+	unsigned int alt_output_addr[2];
+	unsigned int alt_output_flags;
+	/* H264 Only : Extended Operating Mode */
+	unsigned int ext_opmode;
+};
+
+#define CMD_CTRL_ALLOC_HEADER_DWSIZE \
+	(sizeof(struct ctrl_alloc_header) / sizeof(unsigned int))
+
+/* Additional Parameter flags */
+#define VC1_PARSEHDR_MASK               (0x00000001)
+#define VC1_SKIPPIC_MASK                (0x00000002)
+
+#define VP6_BUFFOFFSET_MASK             (0x0000ffff)
+#define VP6_MULTISTREAM_MASK            (0x01000000)
+#define VP6_FRAMETYPE_MASK              (0x02000000)
+
+#define VP8_BUFFOFFSET_MASK             (0x00ffffff)
+#define VP8_PARTITIONSCOUNT_MASK        (0x0f000000)
+#define VP8_PARTITIONSCOUNT_SHIFT       (24)
+
+/* Nop Command */
+#define CMD_NOP                         (0x00000000)
+#define CMD_NOP_DWSIZE                  (1)
+
+/* Register Block */
+#define CMD_REGISTER_BLOCK                      (0x10000000)
+#define CMD_REGISTER_BLOCK_PATCHING_REQUIRED    (0x01000000)
+#define CMD_REGISTER_BLOCK_FLAG_PRELOAD         (0x04000000)
+#define CMD_REGISTER_BLOCK_FLAG_VLC_DATA        (0x08000000)
+
+/* Rendec Command */
+#define CMD_RENDEC_BLOCK                        (0x50000000)
+#define CMD_RENDEC_BLOCK_FLAG_MASK              (0x0F000000)
+#define CMD_RENDEC_FORCE                        (0x08000000)
+#define CMD_RENDEC_PATCHING_REQUIRED            (0x01000000)
+#define CMD_RENDEC_WORD_COUNT_MASK              (0x00ff0000)
+#define CMD_RENDEC_WORD_COUNT_SHIFT             (16)
+#define CMD_RENDEC_ADDRESS_MASK                 (0x0000ffff)
+#define CMD_RENDEC_ADDRESS_SHIFT                (0)
+
+#ifndef VDEC_USE_PVDEC_SEC
+/* Deblock */
+#define CMD_DEBLOCK                             (0x70000000)
+#define CMD_DEBLOCK_TYPE_STD                    (0x00000000)
+#define CMD_DEBLOCK_TYPE_OOLD                   (0x00000001)
+#define CMD_DEBLOCK_TYPE_SKIP                   (0x00000002)
+/* End Of Frame */
+#define CMD_DEBLOCK_TYPE_EF                     (0x00000003)
+
+struct deblock_cmd {
+	unsigned int cmd; /* 0x70000000 */
+	unsigned int source_mb_data;
+	unsigned int address_a[2];
+};
+
+#define CMD_DEBLOCK_DWSIZE              (sizeof(DEBLOCK_CMD) / sizeof(unsigned int))
+#endif /* !VDEC_USE_PVDEC_SEC */
+
+/* Skip */
+#define CMD_CONDITIONAL_SKIP                    (0x80000000)
+#define CMD_CONDITIONAL_SKIP_DWSIZE             (1)
+#define CMD_CONDITIONAL_SKIP_DWORDS             (0x0000ffff)
+#define CMD_CONDITIONAL_SKIP_CONTEXT_SWITCH     BIT(20)
+
+/* DMA */
+#define CMD_DMA                                 (0xE0000000)
+#define CMD_DMA_DMA_TYPE_MASK                   (0x03000000)
+#define CMD_DMA_DMA_TYPE_SHIFT                  (24)
+#define CMD_DMA_FLAG_MASK                       (0x00100000)
+#define CMD_DMA_FLAG_SHIFT                      (20)
+#define CMD_DMA_DMA_SIZE_MASK                   (0x000fffff)
+
+#define CMD_DMA_OFFSET_FLAG                     (0x00100000)
+
+#define CMD_DMA_MAX_OFFSET                      (0xFFF)
+#define CMD_DMA_TYPE_VLC_TABLE                  (0 << CMD_DMA_DMA_TYPE_SHIFT)
+#define CMD_DMA_TYPE_PROBABILITY_DATA           BIT(CMD_DMA_DMA_TYPE_SHIFT)
+
+struct dma_cmd {
+	unsigned int cmd;
+	unsigned int dev_virt_add;
+};
+
+#define CMD_DMA_DWSIZE                          (sizeof(DMA_CMD) / sizeof(unsigned int))
+
+struct dma_cmd_offset_dwsize {
+	unsigned int cmd;
+	unsigned int dev_virt_add;
+	unsigned int byte_offset;
+};
+
+#define CMD_DMA_OFFSET_DWSIZE   (sizeof(DMA_CMD_WITH_OFFSET) / sizeof(unsigned int))
+
+/* HOST COPY */
+#define CMD_HOST_COPY                           (0xF0000000)
+#define CMD_HOST_COPY_SIZE_MASK                 (0x000fffff)
+
+struct host_copy_cmd {
+	unsigned int cmd;
+	unsigned int src_dev_virt_add;
+	unsigned int dst_dev_virt_add;
+};
+
+#define CMD_HOST_COPY_DWSIZE            (sizeof(HOST_COPY_CMD) / sizeof(unsigned int))
+
+/* Shift register setup and Bitstream DMA */
+#define CMD_SR_SETUP                            (0xB0000000)
+#define CMD_SR_ENABLE_RBDU_EXTRACTION           (0x00000001)
+#define CMD_SR_ENABLE_AES_COUNTER               (0x00000002)
+#define CMD_SR_VERIFY_STARTCODE                 (0x00000004)
+#define CMD_SR_BITSTR_ADDR_DEREF                (0x00000008)
+#define CMD_SR_BITSTR_PARSE_KEY                 (0x00000010)
+
+struct sr_setup_cmd {
+	unsigned int cmd;
+	unsigned int bitstream_offset_bits;
+	unsigned int bitstream_size_bytes;
+};
+
+#define CMD_SR_DWSIZE                   (sizeof(SR_SETUP_CMD) / sizeof(unsigned int))
+
+#define CMD_BITSTREAM_DMA                       (0xA0000000)
+#define CMD_BITSTREAM_DMA_DWSIZE                (2)
+/* VC1 Parse Header Command */
+#define CMD_PARSE_HEADER                        (0x30000000)
+#define CMD_PARSE_HEADER_CONTEXT_MASK           (0x000000ff)
+#define CMD_PARSE_HEADER_NEWSLICE               (0x00000001)
+#define CMD_PARSE_HEADER_SKIP_PIC               (0x00000002)
+#define CMD_PARSE_HEADER_ONEPASSPARSE           (0x00000004)
+#define CMD_PARSE_HEADER_NUMSLICE_MINUS1        (0x00ffff00)
+
+struct parse_header_cmd {
+	unsigned int cmd;
+	unsigned int seq_hdr_data;
+	unsigned int pic_dimensions;
+	unsigned int bitplane_addr[3];
+	unsigned int vlc_table_addr;
+};
+
+#define CMD_PARSE_DWSIZE                (sizeof(PARSE_HEADER_CMD) / sizeof(unsigned int))
+
+#define CMD_SLICE_INFO                          (0x20000000)
+#define CMD_SLICE_INFO_SLICENUM                 (0xff000000)
+#define CMD_SLICE_INFO_FIRSTMBY                 (0x00ff0000)
+#define CMD_SLICE_INFO_MBBITOFFSET              (0x0000ffff)
+
+struct slice_info {
+	unsigned char slice_num;
+	unsigned char slice_first_mby;
+	unsigned short slice_mb_bitoffset;
+};
+
+#ifdef VDEC_USE_PVDEC_COMPATIBILITY
+/* VDEC extension */
+#define CMD_VDEC_EXT                            (0xC0000000)
+#ifdef VDEC_USE_PVDEC_SEC
+/*
+ * Used only between firmware secure modules FWBSP->FWDEC,
+ * thus the structure is defined in firmware structures.h
+ */
+#define CMD_VDEC_SECURE_EXT                     (0x40000000)
+#endif/* VDEC_USE_PVDEC_SEC */
+
+#define MEM2REG_SIZE_HOST_PART_MASK 0x0000FFFF
+#define MEM2REG_SIZE_HOST_PART_SHIFT 0
+
+#define MEM2REG_SIZE_BUF_TOTAL_MASK 0xFFFF0000
+#define MEM2REG_SIZE_BUF_TOTAL_SHIFT 16
+
+struct vdec_ext_cmd {
+	unsigned int cmd;
+	unsigned int trans_id;
+	unsigned int hdr_addr;
+	unsigned int hdr_size;
+	unsigned int ctx_save_addr;
+	unsigned int ctx_load_addr;
+	unsigned int buf_ctrl_addr;
+	unsigned int seq_addr;
+	unsigned int pps_addr;
+	unsigned int pps_2addr;
+	unsigned int mem_to_reg_addr;
+	/* 31-16: buff size, 15-0: size filled by host; dwords */
+	unsigned int mem_to_reg_size;
+	unsigned int slice_params_addr;
+	unsigned int slice_params_size;  /* dwords */
+	unsigned int last_luma_recon;
+	unsigned int last_chroma_recon;
+	unsigned int luma_err_base;
+	unsigned int chroma_err_base;
+	unsigned int scaled_display_size;
+	unsigned int horz_scale_control;
+	unsigned int vert_scale_control;
+	unsigned int scale_output_size;
+	unsigned int vlc_idx_table_size;
+	unsigned int vlc_idx_table_addr;
+	unsigned int vlc_tables_size;
+	unsigned int vlc_tables_addr;
+	unsigned int display_picture_size;
+	unsigned int parser_mode;
+	/* needed for separate colour planes */
+	unsigned int intra_buf_base_addr;
+	unsigned int intra_buf_size_per_plane;
+	unsigned int intra_buf_size_per_pipe;
+	unsigned int chroma2reconstructed_addr;
+	unsigned int luma_alt_addr;
+	unsigned int chroma_alt_addr;
+	unsigned int chroma2alt_addr;
+	unsigned int aux_line_buf_size_per_pipe;
+	unsigned int aux_line_buffer_base_addr;
+	unsigned int alt_output_pict_rotation;
+	/* miscellaneous flags */
+	struct {
+		unsigned is_chromainterleaved   : 1;
+		unsigned is_packedformat        : 1;
+		unsigned is_discontinuousmbs    : 1;
+	};
+};
+
+#define CMD_VDEC_EXT_DWSIZE             (sizeof(VDEC_EXT_CMD) / sizeof(unsigned int))
+#endif /* VDEC_USE_PVDEC_COMPATIBILITY */
+
+/* Completion */
+#define CMD_COMPLETION                          (0x60000000)
+#define CMD_COMPLETION_DWSIZE                   (1)
+
+#ifdef VDEC_USE_PVDEC_SEC
+/* Slice done */
+#define CMD_SLICE_DONE                          (0x70000000)
+#define CMD_SLICE_DONE_DWSIZE                   (1)
+#endif /* VDEC_USE_PVDEC_SEC */
+
+/* Bitstream segments */
+#define CMD_BITSTREAM_SEGMENTS                  (0xD0000000)
+#define CMD_BITSTREAM_SEGMENTS_MINUS1_MASK      (0x0000001F)
+#define CMD_BITSTREAM_PARSE_BLK_MASK            (0x0000FF00)
+#ifdef VDEC_USE_PVDEC_COMPATIBILITY
+#define CMD_BITSTREAM_SEGMENTS_MORE_FOLLOW_MASK (0x00000020)
+#define CMD_BITSTREAM_EOP_MASK                  (0x00000040)
+#define CMD_BITSTREAM_BS_TOT_SIZE_WORD_OFFSET   (1)
+#define CMD_BITSTREAM_BS_SEG_LIST_WORD_OFFSET   (2)
+#define CMD_BITSTREAM_HDR_DW_SIZE       CMD_BITSTREAM_BS_SEG_LIST_WORD_OFFSET
+
+#define CMD_BITSTREAM_SEGMENTS_MAX_NUM          (60)
+#endif /* VDEC_USE_PVDEC_COMPATIBILITY */
+
+#ifdef VDEC_USE_PVDEC_COMPATIBILITY
+/* Signatures */
+/* Signature set ids (see hwSignatureModules.c for exact order). */
+/* -- FRONT END/ENTROPY_PIPE ----------------------------------- */
+/*
+ * Signature group 0:
+ * REG(PVDEC_ENTROPY, CR_SR_SIGNATURE)
+ * REG(MSVDX_VEC,     CR_SR_CRC)
+ */
+#define PVDEC_SIGNATURE_GROUP_0  BIT(0)
+/*
+ * Signature group 1:
+ * REG(PVDEC_ENTROPY, CR_HEVC_PARSER_SIGNATURE)
+ * REG(PVDEC_ENTROPY, CR_ENCAP_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_1  BIT(1)
+/*
+ * Signature group 2:
+ * REG(PVDEC_ENTROPY, CR_GENC_ENGINE_OUTPUT_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_2  BIT(2)
+/*
+ * Signature group 3:
+ * REGREP(PVDEC_ENTROPY, CR_GENC_BUFFER_SIGNATURE, 0)
+ * REGREP(PVDEC_ENTROPY, CR_GENC_BUFFER_SIGNATURE, 1)
+ * REGREP(PVDEC_ENTROPY, CR_GENC_BUFFER_SIGNATURE, 2)
+ * REGREP(PVDEC_ENTROPY, CR_GENC_BUFFER_SIGNATURE, 3)
+ * REG(   PVDEC_ENTROPY, CR_GENC_FRAGMENT_SIGNATURE)
+ * REG(   PVDEC_ENTROPY, CR_GENC_FRAGMENT_READ_SIGNATURE)
+ * REG(   PVDEC_ENTROPY, CR_GENC_FRAGMENT_WRADDR_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_3  BIT(3)
+/* -- GENC_DEC -------------------------------------------------- */
+/*
+ * Signature group 4:
+ * REG(   PVDEC_VEC_BE, CR_GDEC_FRAGMENT_REQ_SIGNATURE)
+ * REG(   PVDEC_VEC_BE, CR_GDEC_SYS_WR_SIGNATURE)
+ * REG(   PVDEC_VEC_BE, CR_GDEC_MEM2REG_SYS_WR_SIGNATURE)
+ * REG(   PVDEC_VEC_BE, CR_SLICE_STRUCTURE_REQ_SIGNATURE)
+ * REG(   PVDEC_VEC_BE, CR_SLICE_STRUCTURE_OVER1K_REQ_SIGNATURE)
+ * REG(   PVDEC_VEC_BE, CR_MEM_STRUCTURE_REQ_SIGNATURE)
+ * REGREP(PVDEC_VEC_BE, CR_GDEC_DATA_REQ_SIGNATURE, 0)
+ * REGREP(PVDEC_VEC_BE, CR_GDEC_DATA_REQ_SIGNATURE, 1)
+ * REGREP(PVDEC_VEC_BE, CR_GDEC_DATA_REQ_SIGNATURE, 2)
+ * REGREP(PVDEC_VEC_BE, CR_GDEC_DATA_REQ_SIGNATURE, 3)
+ */
+#define PVDEC_SIGNATURE_GROUP_4  BIT(4)
+/*
+ * Signature group 5:
+ * REG(   PVDEC_VEC_BE, CR_GDEC_FRAGMENT_SIGNATURE)
+ * REG(   PVDEC_VEC_BE, CR_SLICE_STRUCTURE_SIGNATURE)
+ * REG(   PVDEC_VEC_BE, CR_SLICE_STRUCTURE_OVER1K_SIGNATURE)
+ * REG(   PVDEC_VEC_BE, CR_MEM_STRUCTURE_SIGNATURE)
+ * REGREP(PVDEC_VEC_BE, CR_GDEC_BUFFER_SIGNATURE, 0)
+ * REGREP(PVDEC_VEC_BE, CR_GDEC_BUFFER_SIGNATURE, 1)
+ * REGREP(PVDEC_VEC_BE, CR_GDEC_BUFFER_SIGNATURE, 2)
+ * REGREP(PVDEC_VEC_BE, CR_GDEC_BUFFER_SIGNATURE, 3)
+ */
+#define PVDEC_SIGNATURE_GROUP_5  BIT(5)
+/* -- RESIDUAL AND COMMAND DEBUG--------------------------------- */
+/*
+ * Signature group 12:
+ * REG(PVDEC_VEC_BE, CR_DECODE_TO_COMMAND_PRIME_SIGNATURE)
+ * REG(PVDEC_VEC_BE, CR_DECODE_TO_COMMAND_SECOND_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_12  BIT(12)
+/*
+ * Signature group 13:
+ * REG(PVDEC_VEC_BE, CR_DECODE_TO_RESIDUAL_PRIME_SIGNATURE)
+ * REG(PVDEC_VEC_BE, CR_DECODE_TO_RESIDUAL_SECOND_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_13  BIT(13)
+/*
+ * Signature group 14:
+ * REG(PVDEC_VEC_BE, CR_COMMAND_ABOVE_READ_SIGNATURE)
+ * REG(PVDEC_VEC_BE, CR_COMMAND_ABOVE_WRITE_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_14  BIT(14)
+/*
+ * Signature group 15:
+ * REG(PVDEC_VEC_BE, CR_TEMPORAL_READ_SIGNATURE)
+ * REG(PVDEC_VEC_BE, CR_TEMPORAL_WRITE_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_15  BIT(15)
+/* --VEC--------------------------------------------------------- */
+/*
+ * Signature group 16:
+ * REG(PVDEC_VEC_BE, CR_COMMAND_OUTPUT_SIGNATURE)
+ * REG(MSVDX_VEC,    CR_VEC_IXFORM_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_16  BIT(16)
+/*
+ * Signature group 17:
+ * REG(PVDEC_VEC_BE, CR_RESIDUAL_OUTPUT_SIGNATURE)
+ * REG(MSVDX_VEC,    CR_VEC_COMMAND_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_17  BIT(17)
+/* --VDMC-------------------------------------------------------- */
+/*
+ * Signature group 18:
+ * REG(MSVDX_VDMC, CR_VDMC_REFERENCE_CACHE_SIGNATURE)
+ * REG(MSVDX_VDMC, CR_VDMC_REFERENCE_CACHE_MEM_WADDR_SIGNATURE)
+ * REG(MSVDX_VDMC, CR_VDMC_REFERENCE_CACHE_MEM_RADDR_SIGNATURE)
+ * REG(MSVDX_VDMC, CR_VDMC_REFERENCE_CACHE_MEM_WDATA_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_18  BIT(18)
+/*
+ * Signature group 19:
+ * REG(MSVDX_VDMC, CR_VDMC_2D_FILTER_PIPELINE_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_19  BIT(19)
+/*
+ * Signature group 20:
+ * REG(MSVDX_VDMC, CR_VDMC_PIXEL_RECONSTRUCTION_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_20  BIT(20)
+/*
+ * Signature group 21:
+ * REG(MSVDX_VDMC, CR_VDMC_MCU_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_21  BIT(21)
+/* ---VDEB------------------------------------------------------- */
+/*
+ * Signature group 22:
+ * REG(MSVDX_VDEB, CR_VDEB_SYS_MEM_RDATA_LUMA_SIGNATURE)
+ * REG(MSVDX_VDEB, CR_VDEB_SYS_MEM_RDATA_CHROMA_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_22  BIT(22)
+/*
+ * Signature group 23:
+ * REG(MSVDX_VDEB, CR_VDEB_SYS_MEM_ADDR_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_23  BIT(23)
+/*
+ * Signature group 24:
+ * REG(MSVDX_VDEB, CR_VDEB_SYS_MEM_WDATA_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_24  BIT(24)
+/* ---SCALER----------------------------------------------------- */
+/*
+ * Signature group 25:
+ * REG(MSVDX_VDEB, CR_VDEB_SCALE_ADDR_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_25  BIT(25)
+/*
+ * Signature group 26:
+ * REG(MSVDX_VDEB, CR_VDEB_SCALE_WDATA_SIGNATURE)
+ */
+#define PVDEC_SIGNATURE_GROUP_26  BIT(26)
+/* ---PICTURE CHECKSUM------------------------------------------- */
+/*
+ * Signature group 27:
+ * REG(MSVDX_VDEB, CR_VDEB_HEVC_CHECKSUM_LUMA)
+ * REG(MSVDX_VDEB, CR_VDEB_HEVC_CHECKSUM_CB)
+ * REG(MSVDX_VDEB, CR_VDEB_HEVC_CHECKSUM_CR)
+ */
+#define PVDEC_SIGNATURE_GROUP_27  BIT(27)
+#define PVDEC_SIGNATURE_NEW_METHOD  BIT(31)
+
+/* Debug messages */
+#define DEBUG_DATA_TYPE_MASK             0xF
+#define DEBUG_DATA_TYPE_SHIFT            28
+
+#define DEBUG_DATA_MSG_TYPE_MASK         0x1
+#define DEBUG_DATA_MSG_TYPE_SHIFT        15
+
+#define DEBUG_DATA_MSG_ARG_COUNT_MASK    0x7
+#define DEBUG_DATA_MSG_ARG_COUNT_SHIFT   12
+
+#define DEBUG_DATA_MSG_LINE_NO_MASK      0xFFF
+#define DEBUG_DATA_MSG_LINE_NO_SHIFT     0
+
+#define DEBUG_DATA_TYPE_HEADER  (0)
+#define DEBUG_DATA_TYPE_STRING  (1)
+#define DEBUG_DATA_TYPE_PARAMS  (2)
+#define DEBUG_DATA_TYPE_MSG     (3)
+#define DEBUG_DATA_TYPE_PERF    (6)
+
+#define DEBUG_DATA_MSG_TYPE_LOG     0
+#define DEBUG_DATA_MSG_TYPE_ASSERT  1
+
+#define DEBUG_DATA_TAPE_PERF_INC_TIME_MASK   0x1
+#define DEBUG_DATA_TYPE_PERF_INC_TIME_SHIFT  28
+#define DEBUG_DATA_TYPE_PERF_INC_TIME        0x1
+
+#define DEBUG_DATA_SET_TYPE(val, type, data_type) \
+	({ \
+		data_type __val = val; \
+		((__val) = (__val & ~(DEBUG_DATA_TYPE_MASK << DEBUG_DATA_TYPE_SHIFT)) | \
+			   ((type) << DEBUG_DATA_TYPE_SHIFT)); })
+
+#define DEBUG_DATA_MSG_SET_ARG_COUNT(val, ac, data_type) \
+	({ \
+		data_type __val = val; \
+		(__val = (__val & \
+			  ~(DEBUG_DATA_MSG_ARG_COUNT_MASK << DEBUG_DATA_MSG_ARG_COUNT_SHIFT)) \
+			 | ((ac) << DEBUG_DATA_MSG_ARG_COUNT_SHIFT)); })
+
+#define DEBUG_DATA_MSG_SET_LINE_NO(val, ln, type) \
+	({ \
+		type __val = val; \
+		(__val = (__val & \
+			  ~(DEBUG_DATA_MSG_LINE_NO_MASK << DEBUG_DATA_MSG_LINE_NO_SHIFT)) \
+			 | ((ln) << DEBUG_DATA_MSG_LINE_NO_SHIFT)); })
+
+#define DEBUG_DATA_MSG_SET_TYPE(val, tp, type) \
+	({ \
+		type __val = val; \
+		(__val = (__val & \
+			  ~(DEBUG_DATA_MSG_TYPE_MASK << DEBUG_DATA_MSG_TYPE_SHIFT)) \
+			 | ((tp) << DEBUG_DATA_MSG_TYPE_SHIFT)); })
+
+#define DEBUG_DATA_GET_TYPE(val) \
+	(((val) >> DEBUG_DATA_TYPE_SHIFT) & DEBUG_DATA_TYPE_MASK)
+#define DEBUG_DATA_TYPE_PERF_IS_INC_TIME(val) \
+	(((val) >> DEBUG_DATA_TYPE_PERF_INC_TIME_SHIFT) \
+	 & DEBUG_DATA_TAPE_PERF_INC_TIME_MASK)
+#define DEBUG_DATA_MSG_GET_ARG_COUNT(val) \
+	(((val) >> DEBUG_DATA_MSG_ARG_COUNT_SHIFT) \
+	 & DEBUG_DATA_MSG_ARG_COUNT_MASK)
+#define DEBUG_DATA_MSG_GET_LINE_NO(val) \
+	(((val) >> DEBUG_DATA_MSG_LINE_NO_SHIFT) \
+	 & DEBUG_DATA_MSG_LINE_NO_MASK)
+#define DEBUG_DATA_MSG_GET_TYPE(val) \
+	(((val) >> DEBUG_DATA_MSG_TYPE_SHIFT) & DEBUG_DATA_MSG_TYPE_MASK)
+#define DEBUG_DATA_MSG_TYPE_IS_ASSERT(val) \
+	(DEBUG_DATA_MSG_GET_TYPE(val) == DEBUG_DATA_MSG_TYPE_ASSERT \
+	 ? IMG_TRUE : IMG_FALSE)
+#define DEBUG_DATA_MSG_TYPE_IS_LOG(val) \
+	(DEBUG_DATA_MSG_GET_TYPE(val) == DEBUG_DATA_MSG_TYPE_LOG ? \
+	 IMG_TRUE : IMG_FALSE)
+
+#define DEBUG_DATA_MSG_LAT(ln, ac, tp)            \
+	(((ln) << DEBUG_DATA_MSG_LINE_NO_SHIFT) | \
+	 ((ac) << DEBUG_DATA_MSG_ARG_COUNT_SHIFT) | \
+	 ((tp) << DEBUG_DATA_MSG_TYPE_SHIFT))
+/* FWBSP-mode specific defines. */
+#ifdef VDEC_USE_PVDEC_SEC
+/**
+ * FWBSP_ENC_BSTR_BUF_QUEUE_LEN - Suggested number of bitstream buffers submitted (queued)
+ * to firmware for processing at the same time.
+ */
+#define FWBSP_ENC_BSTR_BUF_QUEUE_LEN 1
+
+#endif /* VDEC_USE_PVDEC_SEC */
+
+#endif /* VDEC_USE_PVDEC_COMPATIBILITY */
+#endif /* FW_INTERFACE_H_ */
diff --git a/drivers/staging/media/vxd/decoder/h264fw_data.h b/drivers/staging/media/vxd/decoder/h264fw_data.h
new file mode 100644
index 000000000000..e098d27948d0
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/h264fw_data.h
@@ -0,0 +1,652 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Public data structures for the h264 parser firmware module.
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Amit Makani <amit.makani@ti.com>
+ *
+ * Re-written for upstreamimg
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+
+/* Include shared header version here to replace the standard version */
+#include "h264fw_data_shared.h"
+
+#ifndef _H264FW_DATA_H_
+#define _H264FW_DATA_H_
+
+#include "vdecfw_shared.h"
+
+/* Maximum number of alternative CPB specifications in the stream */
+#define H264_MAXIMUMVALUEOFCPB_CNT  32
+
+/*
+ * The maximum DPB size is related to the number of MVC views supported
+ * The size is defined in H.10.2 for the H.264 spec.
+ * If the number of views needs to be changed the DPB size should be too
+ * The limits are as follows:
+ * NumViews		1,  2,  4,  8, 16
+ * MaxDpbFrames:	16, 16, 32, 48, 64
+ */
+#ifdef H264_ENABLE_MVC
+#define H264FW_MAX_NUM_VIEWS            4
+#define H264FW_MAX_DPB_SIZE             32
+#define H264FW_MAX_NUM_MVC_REFS         16
+#else
+#define H264FW_MAX_NUM_VIEWS            1
+#define H264FW_MAX_DPB_SIZE             16
+#define H264FW_MAX_NUM_MVC_REFS         1
+#endif
+
+/* Maximum value for num_ref_frames_in_pic_order_cnt_cycle */
+#define H264FW_MAX_CYCLE_REF_FRAMES     256
+
+/* 4x4 scaling list size */
+#define H264FW_4X4_SIZE                 16
+/* 8x8 scaling list size */
+#define H264FW_8X8_SIZE                 64
+/* Number of 4x4 scaling lists */
+#define H264FW_NUM_4X4_LISTS            6
+/* Number of 8x8 scaling lists */
+#define H264FW_NUM_8X8_LISTS            6
+
+/* Number of reference picture lists */
+#define H264FW_MAX_REFPIC_LISTS         2
+
+/*
+ * The maximum number of slice groups
+ * remove if slice group map is prepared on the host
+ */
+#define H264FW_MAX_SLICE_GROUPS         8
+
+/* The maximum number of planes for 4:4:4 separate color plane streams */
+#define H264FW_MAX_PLANES               3
+
+#define H264_MAX_SGM_SIZE               8196
+
+#define IS_H264_HIGH_PROFILE(profile_idc, type) \
+	({ \
+		type __profile_idc = profile_idc;       \
+		((__profile_idc) == H264_PROFILE_HIGH) ||      \
+		((__profile_idc) == H264_PROFILE_HIGH10) ||      \
+		((__profile_idc) == H264_PROFILE_HIGH422) ||      \
+		((__profile_idc) == H264_PROFILE_HIGH444) ||      \
+		((__profile_idc) == H264_PROFILE_CAVLC444) ||      \
+		((__profile_idc) == H264_PROFILE_MVC_HIGH) ||      \
+		((__profile_idc) == H264_PROFILE_MVC_STEREO); })        \
+
+/*
+ * This type describes the H.264 NAL unit types
+ */
+enum h264_enaltype {
+	H264FW_NALTYPE_SLICE               = 1,
+	H264FW_NALTYPE_IDRSLICE            = 5,
+	H264FW_NALTYPE_SEI                 = 6,
+	H264FW_NALTYPE_SPS                 = 7,
+	H264FW_NALTYPE_PPS                 = 8,
+	H264FW_NALTYPE_AUD                 = 9,
+	H264FW_NALTYPE_EOSEQ               = 10,
+	H264FW_NALTYPE_EOSTR               = 11,
+	H264FW_NALTYPE_PREFIX              = 14,
+	H264FW_NALTYPE_SUBSET_SPS          = 15,
+	H264FW_NALTYPE_AUXILIARY_SLICE     = 19,
+	H264FW_NALTYPE_EXTSLICE            = 20,
+	H264FW_NALTYPE_EXTSLICE_DEPTH_VIEW = 21,
+	H264FW_NALTYPE_FORCE32BITS         = 0x7FFFFFFFU
+};
+
+/*
+ * AVC Profile IDC definitions
+ */
+enum h264_eprofileidc {
+	/* YUV 4:4:4/14 "CAVLC 4:4:4 */
+	H264_PROFILE_CAVLC444    =       44,
+	/* YUV 4:2:0/8  "Baseline */
+	H264_PROFILE_BASELINE    =       66,
+	/* YUV 4:2:0/8  "Main */
+	H264_PROFILE_MAIN        =       77,
+	/* YUV 4:2:0/8  "Scalable" */
+	H264_PROFILE_SCALABLE    =       83,
+	/* YUV 4:2:0/8  "Extended" */
+	H264_PROFILE_EXTENDED    =       88,
+	/* YUV 4:2:0/8  "High" */
+	H264_PROFILE_HIGH        =       100,
+	/* YUV 4:2:0/10 "High 10" */
+	H264_PROFILE_HIGH10      =       110,
+	/* YUV 4:2:0/8  "Multiview High" */
+	H264_PROFILE_MVC_HIGH    =       118,
+	/* YUV 4:2:2/10 "High 4:2:2" */
+	H264_PROFILE_HIGH422     =       122,
+	/* YUV 4:2:0/8  "Stereo High" */
+	H264_PROFILE_MVC_STEREO  =       128,
+	/* YUV 4:4:4/14 "High 4:4:4" */
+	H264_PROFILE_HIGH444     =       244,
+	H264_PROFILE_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * This type defines the constraint set flags
+ */
+enum h264fw_econstraint_flag {
+	/* Compatible with Baseline profile */
+	H264FW_CONSTRAINT_BASELINE_SHIFT   =       7,
+	/* Compatible with Main profile */
+	H264FW_CONSTRAINT_MAIN_SHIFT       =       6,
+	/* Compatible with Extended profile */
+	H264FW_CONSTRAINT_EXTENDED_SHIFT   =       5,
+	/* Compatible with Intra profiles */
+	H264FW_CONSTRAINT_INTRA_SHIFT      =       4,
+	/* Compatible with Multiview High profile */
+	H264FW_CONSTRAINT_MULTIHIGH_SHIFT  =       3,
+	/* Compatible with Stereo High profile */
+	H264FW_CONSTRAINT_STEREOHIGH_SHIFT =       2,
+	/* Reserved flag */
+	H264FW_CONSTRAINT_RESERVED6_SHIFT  =       1,
+	/* Reserved flag */
+	H264FW_CONSTRAINT_RESERVED7_SHIFT  =       0,
+	H264FW_CONSTRAINT_FORCE32BITS      = 0x7FFFFFFFU
+};
+
+/*
+ * This enum describes the reference status of an H.264 picture.
+ * Unpaired fields should have all eRefStatusX set to the same value
+ *
+ * For Frame, Mbaff, and Pair types individual fields and frame ref status
+ * should be set accordingly.
+ *
+ * eRefStatusFrame    eRefStatusTop   eRefStatusBottom
+ * UNUSED             UNUSED          UNUSED
+ * SHORTTERM          SHORTTERM       SHORTTERM
+ * LONGTERM           LONGTERM        LONGTERM
+ *
+ * UNUSED             SHORT/LONGTERM  UNUSED
+ * UNUSED             UNUSED          SHORT/LONGTERM
+ *
+ * SHORTTERM          LONGTERM        SHORTTERM
+ * SHORTTERM          SHORTTERM       LONGTERM
+ * NB: It is not clear from the spec if the Frame should be marked as short
+ * or long term in this case
+ */
+enum h264fw_ereference {
+	/* Picture is unused for reference */
+	H264FW_REF_UNUSED = 0,
+	/* used for short term reference */
+	H264FW_REF_SHORTTERM,
+	/* used for Long Term reference */
+	H264FW_REF_LONGTERM,
+	H264FW_REF_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * This type defines the picture structure.
+ */
+enum h264fw_epicture_type {
+	/* No valid picture */
+	H264FW_TYPE_NONE = 0,
+	/* Picture contains the top (even) lines of the frame */
+	H264FW_TYPE_TOP,
+	/* Picture contains the bottom (odd) lines of the frame */
+	H264FW_TYPE_BOTTOM,
+	/* Picture contains the entire frame */
+	H264FW_TYPE_FRAME,
+	/* Picture contains an MBAFF frame */
+	H264FW_TYPE_MBAFF,
+	/* Picture contains top and bottom lines of the frame */
+	H264FW_TYPE_PAIR,
+	H264FW_TYPE_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * This describes the SPS header data required by the H264 firmware that should
+ * be supplied by the Host.
+ */
+struct h264fw_sequence_ps {
+	/* syntax elements from SPS */
+	/* syntax element from bitstream - 8 bit */
+	unsigned char profile_idc;
+	/* syntax element from bitstream - 2 bit */
+	unsigned char chroma_format_idc;
+	/* syntax element from bitstream - 1 bit */
+	unsigned char separate_colour_plane_flag;
+	/* syntax element from bitstream - 3 bit */
+	unsigned char bit_depth_luma_minus8;
+	/* syntax element from bitstream - 3 bit */
+	unsigned char bit_depth_chroma_minus8;
+	/* syntax element from bitstream - 1 bit */
+	unsigned char delta_pic_order_always_zero_flag;
+	/* syntax element from bitstream - 4+ bit */
+	unsigned char log2_max_pic_order_cnt_lsb;
+	/* syntax element from bitstream - 5 bit */
+	unsigned char max_num_ref_frames;
+	/* syntax element from bitstream - 4+ bit */
+	unsigned char log2_max_frame_num;
+	/* syntax element from bitstream - 2 bit */
+	unsigned char pic_order_cnt_type;
+	/* syntax element from bitstream - 1 bit */
+	unsigned char frame_mbs_only_flag;
+	/* syntax element from bitstream - 1 bit */
+	unsigned char gaps_in_frame_num_value_allowed_flag;
+
+	/*
+	 * set0--7 flags as they occur in the bitstream (including reserved
+	 * values)
+	 */
+	unsigned char constraint_set_flags;
+	/* syntax element from bitstream - 8 bit */
+	unsigned char level_idc;
+	/* syntax element from bitstream - 8 bit */
+	unsigned char num_ref_frames_in_pic_order_cnt_cycle;
+	/* syntax element from bitstream - 1 bit */
+	unsigned char mb_adaptive_frame_field_flag;
+	/* syntax element from bitstream - 32 bit */
+	int offset_for_non_ref_pic;
+	/* syntax element from bitstream - 32 bit */
+	int offset_for_top_to_bottom_field;
+
+	/* syntax element from bitstream */
+	unsigned int pic_width_in_mbs_minus1;
+	/* syntax element from bitstream */
+	unsigned int pic_height_in_map_units_minus1;
+	/* syntax element from bitstream - 1 bit */
+	unsigned char direct_8x8_inference_flag;
+	/* syntax element from bitstream */
+	unsigned char qpprime_y_zero_transform_bypass_flag;
+
+	/* syntax element from bitstream - 32 bit each */
+	int offset_for_ref_frame[H264FW_MAX_CYCLE_REF_FRAMES];
+
+	/* From VUI information */
+	unsigned char num_reorder_frames;
+	/*
+	 * From VUI/MVC SEI, 0 indicates not set, any actual 0 value will be
+	 * inferred by the firmware
+	 */
+	unsigned char max_dec_frame_buffering;
+
+	/* From SPS MVC Extension - for the current view_id */
+	/* Number of views in this stream */
+	unsigned char num_views;
+	/* a Map in order of VOIdx of view_id's */
+	unsigned short view_ids[H264FW_MAX_NUM_VIEWS];
+
+	/* Disable VDMC horizontal/vertical filtering */
+	unsigned char disable_vdmc_filt;
+	/* Disable CABAC 4:4:4 4x4 transform as not available */
+	unsigned char transform4x4_mb_not_available;
+
+	/* anchor reference list */
+	unsigned short anchor_inter_view_reference_id_list[2]
+	[H264FW_MAX_NUM_VIEWS][H264FW_MAX_NUM_MVC_REFS];
+	/* nonanchor reference list */
+	unsigned short non_anchor_inter_view_reference_id_list[2]
+	[H264FW_MAX_NUM_VIEWS][H264FW_MAX_NUM_MVC_REFS];
+	/* number of elements in aui16AnchorInterViewReferenceIndiciesLX[] */
+	unsigned short num_anchor_refsx[2][H264FW_MAX_NUM_VIEWS];
+	/* number of elements in aui16NonAnchorInterViewReferenceIndiciesLX[] */
+	unsigned short num_non_anchor_refsx[2][H264FW_MAX_NUM_VIEWS];
+};
+
+/*
+ * This structure represents HRD parameters.
+ */
+struct h264fw_hrd {
+	/* cpb_cnt_minus1 */
+	unsigned char cpb_cnt_minus1;
+	/* bit_rate_scale */
+	unsigned char bit_rate_scale;
+	/* cpb_size_scale */
+	unsigned char cpb_size_scale;
+	/* bit_rate_value_minus1 */
+	unsigned int bit_rate_value_minus1[H264_MAXIMUMVALUEOFCPB_CNT];
+	/* cpb_size_value_minus1 */
+	unsigned int cpb_size_value_minus1[H264_MAXIMUMVALUEOFCPB_CNT];
+	/* cbr_flag */
+	unsigned char cbr_flag[H264_MAXIMUMVALUEOFCPB_CNT];
+	/* initial_cpb_removal_delay_length_minus1 */
+	unsigned char initial_cpb_removal_delay_length_minus1;
+	/* cpb_removal_delay_length_minus1 */
+	unsigned char cpb_removal_delay_length_minus1;
+	/* dpb_output_delay_length_minus1 */
+	unsigned char dpb_output_delay_length_minus1;
+	/* time_offset_length */
+	unsigned char time_offset_length;
+};
+
+/*
+ * This structure represents the VUI parameters data.
+ */
+struct h264fw_vui {
+	int aspect_ratio_info_present_flag;
+	unsigned char aspect_ratio_idc;
+	unsigned short sar_width;
+	unsigned short sar_height;
+	int overscan_info_present_flag;
+	int overscan_appropriate_flag;
+	int video_signal_type_present_flag;
+	unsigned char video_format;
+	int video_full_range_flag;
+	int colour_description_present_flag;
+	unsigned char colour_primaries;
+	unsigned char transfer_characteristics;
+	unsigned char matrix_coefficients;
+	int chroma_location_info_present_flag;
+	unsigned int chroma_sample_loc_type_top_field;
+	unsigned int chroma_sample_loc_type_bottom_field;
+	int timing_info_present_flag;
+	unsigned int num_units_in_tick;
+	unsigned int time_scale;
+	int fixed_frame_rate_flag;
+	int nal_hrd_parameters_present_flag;
+	struct h264fw_hrd nal_hrd_params;
+	int vcl_hrd_parameters_present_flag;
+	struct h264fw_hrd vcl_hrd_params;
+	int low_delay_hrd_flag;
+	int pic_struct_present_flag;
+	int bitstream_restriction_flag;
+	int motion_vectors_over_pic_boundaries_flag;
+	unsigned int max_bytes_per_pic_denom;
+	unsigned int max_bits_per_mb_denom;
+	unsigned int log2_max_mv_length_vertical;
+	unsigned int log2_max_mv_length_horizontal;
+	unsigned int num_reorder_frames;
+	unsigned int max_dec_frame_buffering;
+};
+
+/*
+ * This describes the HW specific SPS header data required by the H264
+ * firmware that should be supplied by the Host.
+ */
+struct h264fw_ddsequence_ps {
+	/* pre-packed registers derived from SPS */
+	/* Value for CR_VEC_ENTDEC_FE_CONTROL */
+	unsigned int regentdec_control;
+
+	/* NB: This register should contain the 4-bit SGM flag */
+	/* Value for CR_VEC_H264_FE_SPS0 & CR_VEC_H264_BE_SPS0 combined */
+	unsigned int reg_sps0;
+	/* Value of CR_VEC_H264_BE_INTRA_8x8 */
+	unsigned int reg_beintra;
+	/* Value of CR_VEC_H264_FE_CABAC444 */
+	unsigned int reg_fecaabac444;
+	/* Treat CABAC 4:4:4 4x4 transform as not available */
+	unsigned char transform4x4_mb_notavialbale;
+	/* Disable VDMC horizontal/vertical filtering */
+	unsigned char disable_vdmcfilt;
+};
+
+/*
+ * This describes the PPS header data required by the H264 firmware that should
+ * be supplied by the Host.
+ */
+struct h264fw_picture_ps {
+	/* syntax elements from the PPS */
+	/* syntax element from bitstream - 1 bit */
+	unsigned char deblocking_filter_control_present_flag;
+	/* syntax element from bitstream - 1 bit */
+	unsigned char transform_8x8_mode_flag;
+	/* syntax element from bitstream - 1 bit */
+	unsigned char entropy_coding_mode_flag;
+	/* syntax element from bitstream - 1 bit */
+	unsigned char redundant_pic_cnt_present_flag;
+
+	/* syntax element from bitstream - 2 bit */
+	unsigned char weighted_bipred_idc;
+	/* syntax element from bitstream - 1 bit */
+	unsigned char weighted_pred_flag;
+	/* syntax element from bitstream - 1 bit */
+	unsigned char pic_order_present_flag;
+
+	/* 26 + syntax element from bitstream - 7 bit */
+	unsigned char pic_init_qp;
+	/* syntax element from bitstream - 1 bit */
+	unsigned char constrained_intra_pred_flag;
+	/* syntax element from bitstream - 5 bit each */
+	unsigned char num_ref_lx_active_minus1[H264FW_MAX_REFPIC_LISTS];
+
+	/* syntax element from bitstream - 3 bit */
+	unsigned char slice_group_map_type;
+	/* syntax element from bitstream - 3 bit */
+	unsigned char num_slice_groups_minus1;
+	/* syntax element from bitstream - 13 bit */
+	unsigned short slice_group_change_rate_minus1;
+
+	/* syntax element from bitstream */
+	unsigned int chroma_qp_index_offset;
+	/* syntax element from bitstream */
+	unsigned int second_chroma_qp_index_offset;
+
+	/* scaling lists are derived from both SPS and PPS information */
+	/* but will change whenever the PPS changes */
+	/* The derived set of tables are associated here with the PPS */
+	/* NB: These are in H.264 order */
+	/* derived from SPS and PPS - 8 bit each */
+	unsigned char scalinglist4x4[H264FW_NUM_4X4_LISTS][H264FW_4X4_SIZE];
+	/* derived from SPS and PPS - 8 bit each */
+	unsigned char scalinglist8x8[H264FW_NUM_8X8_LISTS][H264FW_8X8_SIZE];
+};
+
+/*
+ * This describes the HW specific PPS header data required by the H264
+ * firmware that should be supplied by the Host.
+ */
+struct h264fw_dd_picture_ps {
+	/* values derived from the PPS */
+	/* Value for MSVDX_CMDS_SLICE_PARAMS_MODE_CONFIG */
+	unsigned char vdmc_mode_config;
+
+	/* pre-packed registers derived from the PPS */
+	/* Value for CR_VEC_H264_FE_PPS0 & CR_VEC_H264_BE_PPS0 combined */
+	unsigned int reg_pps0;
+
+	/*
+	 * scaling lists are derived from both SPS and PPS information
+	 * but will change whenever the PPS changes
+	 * The derived set of tables are associated here with the PPS
+	 * But this will become invalid if the SPS changes and will have to be
+	 * recalculated
+	 * These tables MUST be aligned on a 32-bit boundary
+	 * NB: These are in MSVDX order
+	 */
+	/* derived from SPS and PPS - 8 bit each */
+	unsigned char scalinglist4x4[H264FW_NUM_4X4_LISTS][H264FW_4X4_SIZE];
+	/* derived from SPS and PPS - 8 bit each */
+	unsigned char scalinglist8x8[H264FW_NUM_8X8_LISTS][H264FW_8X8_SIZE];
+};
+
+/*
+ * This describes the H.264 parser component "Header data", shown in the
+ * Firmware Memory Layout diagram. This data is required by the H264 firmware
+ * and should be supplied by the Host.
+ */
+struct h264fw_header_data {
+	/* Decode buffers and output control for the current picture */
+	/* Primary decode buffer base addresses */
+	struct vdecfw_image_buffer primary;
+	/* buffer base addresses for alternate output */
+	struct vdecfw_image_buffer alternate;
+	/* Output control: rotation, scaling, oold, etc. */
+	unsigned int pic_cmds[VDECFW_CMD_MAX];
+	/* Macroblock parameters base address for the picture */
+	unsigned int mbparams_base_address;
+
+	unsigned int mbparams_size_per_plane;
+
+	/* Buffers for context preload for colour plane switching (6.x.x) */
+	unsigned int preload_buffer_base_address
+	[H264FW_MAX_PLANES];
+
+	/*
+	 * slice group map should be calculated on Host
+	 * (using some slice params) and base address provided here
+	 */
+	/* Base address of active slice group map */
+	/* Base address of active slice group map */
+	unsigned int slicegroupmap_base_address;
+
+	/* H264 specific control */
+	/* do second pass Intra Deblock on frame */
+	unsigned int do_old __attribute__ (aligned(4));
+	/* set to IMG_FALSE to disable second-pass deblock */
+	unsigned int two_pass_flag __attribute__ (aligned(4));
+	/* set to IMG_TRUE to disable MVC */
+	unsigned int disable_mvc __attribute__ (aligned(4));
+	/*
+	 * Do we have second PPS in uipSecondPPSInfoSource provided for the
+	 * second field
+	 */
+	unsigned int second_pps __attribute__ (aligned(4));
+};
+
+/*
+ * This describes an H.264 picture. It is part of the Context data
+ */
+struct h264fw_picture {
+	/* Primary (reconstructed) picture buffers */
+	struct vdecfw_image_buffer primary;
+	/* Secondary (alternative) picture buffers */
+	struct vdecfw_image_buffer alternate;
+	/* Macroblock parameters base address for the picture */
+	unsigned int mbparams_base_address;
+
+	/* Unique ID for this picture */
+	unsigned int transaction_id;
+	/* Picture type */
+	enum h264fw_epicture_type pricture_type;
+
+	/* Reference status of the picture */
+	enum h264fw_ereference ref_status_bottom;
+	/* Reference status of the picture */
+	enum h264fw_ereference ref_status_top;
+	/* Reference status of the picture */
+	enum h264fw_ereference ref_status_frame;
+
+	/* Frame Number */
+	unsigned int frame_number;
+	/* Short term reference info */
+	int fame_number_wrap;
+	/* long term reference number - should be 8-bit */
+	unsigned int longterm_frame_idx;
+
+	/* Top field order count for this picture */
+	int top_field_order_count;
+	/* Bottom field order count for this picture */
+	int bottom_field_order_count;
+	/* MVC view_id */
+	unsigned short view_id;
+	/*
+	 * When picture is in the DPB Offset to use into the MSVDX DPB reg table
+	 * when the current picture is the same view as this.
+	 */
+	unsigned char view_dpb_offset;
+	/* Flags for this picture for the display process */
+	unsigned char display_flags;
+
+	/* IMG_FALSE if sent to display, or otherwise not needed for display */
+	unsigned char needed_for_output;
+};
+
+/*
+ * This structure describes frame data for POC calculation
+ */
+struct h264fw_poc_picture_data {
+	/* type 0,1,2 */
+	unsigned char mmco_5_flag;
+
+	/* type 0 */
+	unsigned char bottom_field_flag;
+	unsigned short pic_order_cnt_lsb;
+	int top_field_order_count;
+	int pic_order_count_msb;
+
+	/* type 1,2 */
+	int16 frame_num;
+	int frame_num_offset;
+
+	/* output */
+	int bottom_filed_order_count;
+};
+
+/*
+ * This structure describes picture data for determining Complementary
+ * Field Pairs
+ */
+struct h264fw_last_pic_data {
+	/* Unique ID for this picture */
+	unsigned int transaction_id;
+	/* Picture type */
+	enum h264fw_epicture_type picture_type;
+	/* Reference status of the picture */
+	enum h264fw_ereference ref_status_frame;
+	/* Frame Number */
+	unsigned int frame_number;
+
+	unsigned int luma_recon;
+	unsigned int chroma_recon;
+	unsigned int chroma_2_recon;
+	unsigned int luma_alter;
+	unsigned int chroma_alter;
+	unsigned int chroma_2_alter;
+	struct vdecfw_image_buffer primary;
+	struct vdecfw_image_buffer alternate;
+	unsigned int mbparams_base_address;
+	/* Top field order count for this picture */
+	int top_field_order_count;
+	/* Bottom field order count for this picture */
+	int bottom_field_order_count;
+};
+
+/*
+ * This describes the H.264 parser component "Context data", shown in the
+ * Firmware Memory Layout diagram. This data is the state preserved across
+ * pictures. It is loaded and saved by the Firmware, but requires the host to
+ * provide buffer(s) for this.
+ */
+struct h264fw_context_data {
+	/* Decoded Picture Buffer */
+	struct h264fw_picture dpb[H264FW_MAX_DPB_SIZE];
+	/*
+	 * Inter-view reference components - also used as detail of the previous
+	 * picture for any particular view, can be used to determine
+	 * complemetary field pairs
+	 */
+	struct h264fw_picture interview_prediction_ref[H264FW_MAX_NUM_VIEWS];
+	/* previous ref pic for type0, previous pic for type1&2 */
+	struct h264fw_poc_picture_data prev_poc_pic_data[H264FW_MAX_NUM_VIEWS];
+	/* previous picture information to detect complementary field pairs */
+	struct h264fw_last_pic_data last_pic_data[H264FW_MAX_NUM_VIEWS];
+	struct h264fw_last_pic_data last_displayed_pic_data
+	[H264FW_MAX_NUM_VIEWS];
+
+	/* previous reference frame number for each view */
+	unsigned short prev_ref_frame_num[H264FW_MAX_NUM_VIEWS];
+	/* Bitmap of used slots in each view DPB */
+	unsigned short dpb_bitmap[H264FW_MAX_NUM_VIEWS];
+
+	/* DPB size */
+	unsigned int dpb_size;
+	/* Number of pictures in DPB */
+	unsigned int dpb_fullness;
+
+	unsigned char prev_display_flags;
+	int prev_display;
+	int prev_release;
+	/* Active parameter sets */
+	/* Sequence Parameter Set data */
+	struct h264fw_sequence_ps sps;
+	/* Picture Parameter Set data */
+	struct h264fw_picture_ps pps;
+	/*
+	 * Picture Parameter Set data for second field when in the same buffer
+	 */
+	struct h264fw_picture_ps second_pps;
+
+	/* Set if stream is MVC */
+	int mvc;
+	/* DPB long term reference information */
+	int max_longterm_frame_idx[H264FW_MAX_NUM_VIEWS];
+};
+
+#endif /* _H264FW_DATA_H_ */
diff --git a/drivers/staging/media/vxd/decoder/hevcfw_data.h b/drivers/staging/media/vxd/decoder/hevcfw_data.h
new file mode 100644
index 000000000000..cdfe8d067d90
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/hevcfw_data.h
@@ -0,0 +1,472 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Public data structures for the hevc parser firmware module.
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Angela Stegmaier <angelabaker@ti.com>
+ *
+ * Re-written for upstreming
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+
+/* Include shared header version here to replace the standard version. */
+#include "hevcfw_data_shared.h"
+
+#ifndef _HEVCFW_DATA_H_
+#define _HEVCFW_DATA_H_
+
+#include "vdecfw_shared.h"
+
+#define HEVC_MAX_SPS_COUNT              16
+#define HEVC_MAX_PPS_COUNT              64
+
+#define HEVCFW_MAX_NUM_PROFILE_IDC 32
+
+#define HEVCFW_MAX_NUM_REF_PICS 16
+#define HEVCFW_MAX_NUM_ST_REF_PIC_SETS 65
+#define HEVCFW_MAX_NUM_LT_REF_PICS 32
+#define HEVCFW_MAX_NUM_SUBLAYERS 7
+#define HEVCFW_SCALING_LISTS_BUFSIZE 256
+#define HEVCFW_MAX_TILE_COLS 20
+#define HEVCFW_MAX_TILE_ROWS 22
+
+#define HEVCFW_MAX_CHROMA_QP 6
+
+#define HEVCFW_MAX_DPB_SIZE HEVCFW_MAX_NUM_REF_PICS
+#define HEVCFW_REF_PIC_LIST0 0
+#define HEVCFW_REF_PIC_LIST1 1
+#define HEVCFW_NUM_REF_PIC_LISTS 2
+#define HEVCFW_NUM_DPB_DIFF_REGS 4
+
+/* non-critical errors */
+#define HEVC_ERR_INVALID_VALUE (20)
+#define HEVC_ERR_CORRECTION_VALIDVALUE (21)
+
+#define HEVC_IS_ERR_CRITICAL(err) \
+	((err) > HEVC_ERR_CORRECTION_VALIDVALUE ? 1 : 0)
+
+/* critical errors */
+#define HEVC_ERR_INV_VIDEO_DIMENSION (22)
+#define HEVC_ERR_NO_SEQUENCE_HDR (23)
+#define HEVC_ERR_SPS_EXT_UNSUPP (24 | VDECFW_UNSUPPORTED_CODE_BASE)
+#define HEVC_ERR_PPS_EXT_UNSUPP (25 | VDECFW_UNSUPPORTED_CODE_BASE)
+
+#define HEVC_ERR_FAILED_TO_STORE_VPS (100)
+#define HEVC_ERR_FAILED_TO_STORE_SPS (101)
+#define HEVC_ERR_FAILED_TO_STORE_PPS (102)
+
+#define HEVC_ERR_FAILED_TO_FETCH_VPS (103)
+#define HEVC_ERR_FAILED_TO_FETCH_SPS (104)
+#define HEVC_ERR_FAILED_TO_FETCH_PPS (105)
+/* HEVC Scaling Lists (all values are maximum possible ones) */
+#define HEVCFW_SCALING_LIST_NUM_SIZES 4
+#define HEVCFW_SCALING_LIST_NUM_MATRICES 6
+#define HEVCFW_SCALING_LIST_MATRIX_SIZE 64
+
+struct hevcfw_scaling_listdata {
+	unsigned char dc_coeffs
+	[HEVCFW_SCALING_LIST_NUM_SIZES - 2]
+	[HEVCFW_SCALING_LIST_NUM_MATRICES];
+	unsigned char lists
+	[HEVCFW_SCALING_LIST_NUM_SIZES]
+	[HEVCFW_SCALING_LIST_NUM_MATRICES]
+	[HEVCFW_SCALING_LIST_MATRIX_SIZE];
+};
+
+/* HEVC Video Profile_Tier_Level */
+struct hevcfw_profile_tier_level {
+	unsigned char general_profile_space;
+	unsigned char general_tier_flag;
+	unsigned char general_profile_idc;
+	unsigned char general_profile_compatibility_flag[HEVCFW_MAX_NUM_PROFILE_IDC];
+	unsigned char general_progressive_source_flag;
+	unsigned char general_interlaced_source_flag;
+	unsigned char general_non_packed_constraint_flag;
+	unsigned char general_frame_only_constraint_flag;
+	unsigned char general_max_12bit_constraint_flag;
+	unsigned char general_max_10bit_constraint_flag;
+	unsigned char general_max_8bit_constraint_flag;
+	unsigned char general_max_422chroma_constraint_flag;
+	unsigned char general_max_420chroma_constraint_flag;
+	unsigned char general_max_monochrome_constraint_flag;
+	unsigned char general_intra_constraint_flag;
+	unsigned char general_one_picture_only_constraint_flag;
+	unsigned char general_lower_bit_rate_constraint_flag;
+	unsigned char general_level_idc;
+	unsigned char sub_layer_profile_present_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_level_present_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_profile_space[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_tier_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_profile_idc[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_profile_compatibility_flag[HEVCFW_MAX_NUM_SUBLAYERS -
+						   1][HEVCFW_MAX_NUM_PROFILE_IDC];
+	unsigned char sub_layer_progressive_source_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_interlaced_source_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_non_packed_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_frame_only_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_max_12bit_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_max_10bit_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_max_8bit_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_max_422chroma_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_max_420chroma_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_max_monochrome_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_intra_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_one_picture_only_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_lower_bit_rate_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+	unsigned char sub_layer_level_idc[HEVCFW_MAX_NUM_SUBLAYERS - 1];
+};
+
+struct hevcfw_video_ps {
+	int is_different;
+	int is_sent;
+	int is_available;
+	unsigned char vps_video_parameter_set_id;
+	unsigned char vps_reserved_three_2bits;
+	unsigned char vps_max_layers_minus1;
+	unsigned char vps_max_sub_layers_minus1;
+	unsigned char vps_temporal_id_nesting_flag;
+	unsigned short vps_reserved_0xffff_16bits;
+	struct hevcfw_profile_tier_level profile_tier_level;
+};
+
+/* HEVC Video Usability Information */
+struct hevcfw_vui_params {
+	unsigned char aspect_ratio_info_present_flag;
+	unsigned char aspect_ratio_idc;
+	unsigned short sar_width;
+	unsigned short sar_height;
+	unsigned char overscan_info_present_flag;
+	unsigned char overscan_appropriate_flag;
+	unsigned char video_signal_type_present_flag;
+	unsigned char video_format;
+	unsigned char video_full_range_flag;
+	unsigned char colour_description_present_flag;
+	unsigned char colour_primaries;
+	unsigned char transfer_characteristics;
+	unsigned char matrix_coeffs;
+	unsigned char chroma_loc_info_present_flag;
+	unsigned char chroma_sample_loc_type_top_field;
+	unsigned char chroma_sample_loc_type_bottom_field;
+	unsigned char neutral_chroma_indication_flag;
+	unsigned char field_seq_flag;
+	unsigned char frame_field_info_present_flag;
+	unsigned char default_display_window_flag;
+	unsigned short def_disp_win_left_offset;
+	unsigned short def_disp_win_right_offset;
+	unsigned short def_disp_win_top_offset;
+	unsigned short def_disp_win_bottom_offset;
+	unsigned char vui_timing_info_present_flag;
+	unsigned int vui_num_units_in_tick;
+	unsigned int vui_time_scale;
+};
+
+/* HEVC Short Term Reference Picture Set */
+struct hevcfw_short_term_ref_picset {
+	unsigned char num_negative_pics;
+	unsigned char num_positive_pics;
+	short delta_poc_s0[HEVCFW_MAX_NUM_REF_PICS];
+	short delta_poc_s1[HEVCFW_MAX_NUM_REF_PICS];
+	unsigned char used_bycurr_pic_s0[HEVCFW_MAX_NUM_REF_PICS];
+	unsigned char used_bycurr_pic_s1[HEVCFW_MAX_NUM_REF_PICS];
+	unsigned char num_delta_pocs;
+};
+
+/*
+ * This describes the SPS header data required by the HEVC firmware that should
+ * be supplied by the Host.
+ */
+struct hevcfw_sequence_ps {
+	/* syntax elements from SPS */
+	unsigned short pic_width_in_luma_samples;
+	unsigned short pic_height_in_luma_samples;
+	unsigned char num_short_term_ref_pic_sets;
+	unsigned char num_long_term_ref_pics_sps;
+	unsigned short lt_ref_pic_poc_lsb_sps[HEVCFW_MAX_NUM_LT_REF_PICS];
+	unsigned char used_by_curr_pic_lt_sps_flag[HEVCFW_MAX_NUM_LT_REF_PICS];
+	struct hevcfw_short_term_ref_picset st_rps_list[HEVCFW_MAX_NUM_ST_REF_PIC_SETS];
+	unsigned char sps_max_sub_layers_minus1;
+	unsigned char sps_max_dec_pic_buffering_minus1[HEVCFW_MAX_NUM_SUBLAYERS];
+	unsigned char sps_max_num_reorder_pics[HEVCFW_MAX_NUM_SUBLAYERS];
+	unsigned int sps_max_latency_increase_plus1[HEVCFW_MAX_NUM_SUBLAYERS];
+	unsigned char max_transform_hierarchy_depth_inter;
+	unsigned char max_transform_hierarchy_depth_intra;
+	unsigned char log2_diff_max_min_transform_block_size;
+	unsigned char log2_min_transform_block_size_minus2;
+	unsigned char log2_diff_max_min_luma_coding_block_size;
+	unsigned char log2_min_luma_coding_block_size_minus3;
+	unsigned char chroma_format_idc;
+	unsigned char separate_colour_plane_flag;
+	unsigned char num_extra_slice_header_bits;
+	unsigned char log2_max_pic_order_cnt_lsb_minus4;
+	unsigned char long_term_ref_pics_present_flag;
+	unsigned char sample_adaptive_offset_enabled_flag;
+	unsigned char sps_temporal_mvp_enabled_flag;
+	unsigned char bit_depth_luma_minus8;
+	unsigned char bit_depth_chroma_minus8;
+	unsigned char pcm_sample_bit_depth_luma_minus1;
+	unsigned char pcm_sample_bit_depth_chroma_minus1;
+	unsigned char log2_min_pcm_luma_coding_block_size_minus3;
+	unsigned char log2_diff_max_min_pcm_luma_coding_block_size;
+	unsigned char pcm_loop_filter_disabled_flag;
+	unsigned char amp_enabled_flag;
+	unsigned char pcm_enabled_flag;
+	unsigned char strong_intra_smoothing_enabled_flag;
+	unsigned char scaling_list_enabled_flag;
+	unsigned char transform_skip_rotation_enabled_flag;
+	unsigned char transform_skip_context_enabled_flag;
+	unsigned char implicit_rdpcm_enabled_flag;
+	unsigned char explicit_rdpcm_enabled_flag;
+	unsigned char extended_precision_processing_flag;
+	unsigned char intra_smoothing_disabled_flag;
+	unsigned char high_precision_offsets_enabled_flag;
+	unsigned char persistent_rice_adaptation_enabled_flag;
+	unsigned char cabac_bypass_alignment_enabled_flag;
+	/* derived elements */
+	unsigned int pic_size_in_ctbs_y;
+	unsigned short pic_height_in_ctbs_y;
+	unsigned short pic_width_in_ctbs_y;
+	unsigned char ctb_size_y;
+	unsigned char ctb_log2size_y;
+	int max_pic_order_cnt_lsb;
+	unsigned int sps_max_latency_pictures[HEVCFW_MAX_NUM_SUBLAYERS];
+	unsigned char pps_seq_parameter_set_id;
+	unsigned char sps_video_parameter_set_id;
+	unsigned char sps_temporal_id_nesting_flag;
+	unsigned char sps_seq_parameter_set_id;
+	/* local */
+	unsigned char conformance_window_flag;
+	unsigned short conf_win_left_offset;
+	unsigned short conf_win_right_offset;
+	unsigned short conf_win_top_offset;
+	unsigned short conf_win_bottom_offset;
+	unsigned char sps_sub_layer_ordering_info_present_flag;
+	unsigned char sps_scaling_list_data_present_flag;
+	unsigned char vui_parameters_present_flag;
+	unsigned char sps_extension_present_flag;
+	struct hevcfw_vui_params vui_params;
+	/* derived elements */
+	unsigned char sub_width_c;
+	unsigned char sub_height_c;
+	struct hevcfw_profile_tier_level profile_tier_level;
+	struct hevcfw_scaling_listdata scaling_listdata;
+};
+
+/*
+ * This describes the HEVC parser component "Header data", shown in the
+ * Firmware Memory Layout diagram. This data is required by the HEVC firmware
+ * and should be supplied by the Host.
+ */
+struct hevcfw_headerdata {
+	/* Decode buffers and output control for the current picture */
+	/* Primary decode buffer base addresses */
+	struct vdecfw_image_buffer primary;
+	/* buffer base addresses for alternate output */
+	struct vdecfw_image_buffer alternate;
+	/* address of buffer for temporal mv params */
+	unsigned int temporal_outaddr;
+};
+
+/*
+ * This describes the PPS header data required by the HEVC firmware that should
+ * be supplied by the Host.
+ */
+struct hevcfw_picture_ps {
+	/* syntax elements from the PPS */
+	unsigned char pps_pic_parameter_set_id;
+	unsigned char num_tile_columns_minus1;
+	unsigned char num_tile_rows_minus1;
+	unsigned char diff_cu_qp_delta_depth;
+	unsigned char init_qp_minus26;
+	unsigned char pps_beta_offset_div2;
+	unsigned char pps_tc_offset_div2;
+	unsigned char pps_cb_qp_offset;
+	unsigned char pps_cr_qp_offset;
+	unsigned char log2_parallel_merge_level_minus2;
+	unsigned char dependent_slice_segments_enabled_flag;
+	unsigned char output_flag_present_flag;
+	unsigned char num_extra_slice_header_bits;
+	unsigned char lists_modification_present_flag;
+	unsigned char cabac_init_present_flag;
+	unsigned char weighted_pred_flag;
+	unsigned char weighted_bipred_flag;
+	unsigned char pps_slice_chroma_qp_offsets_present_flag;
+	unsigned char deblocking_filter_override_enabled_flag;
+	unsigned char tiles_enabled_flag;
+	unsigned char entropy_coding_sync_enabled_flag;
+	unsigned char slice_segment_header_extension_present_flag;
+	unsigned char transquant_bypass_enabled_flag;
+	unsigned char cu_qp_delta_enabled_flag;
+	unsigned char transform_skip_enabled_flag;
+	unsigned char sign_data_hiding_enabled_flag;
+	unsigned char num_ref_idx_l0_default_active_minus1;
+	unsigned char num_ref_idx_l1_default_active_minus1;
+	unsigned char constrained_intra_pred_flag;
+	unsigned char pps_deblocking_filter_disabled_flag;
+	unsigned char pps_loop_filter_across_slices_enabled_flag;
+	unsigned char loop_filter_across_tiles_enabled_flag;
+	/* rewritten from SPS, maybe at some point we could get rid of this */
+	unsigned char scaling_list_enabled_flag;
+	unsigned char log2_max_transform_skip_block_size_minus2;
+	unsigned char cross_component_prediction_enabled_flag;
+	unsigned char chroma_qp_offset_list_enabled_flag;
+	unsigned char diff_cu_chroma_qp_offset_depth;
+	/*
+	 * PVDEC derived elements. HEVCFW_SCALING_LISTS_BUFSIZE is
+	 * multiplied by 2 to ensure that there will be space for address of
+	 * each element. These addresses are completed in lower layer.
+	 */
+	unsigned int scaling_lists[HEVCFW_SCALING_LISTS_BUFSIZE * 2];
+	/* derived elements */
+	unsigned short col_bd[HEVCFW_MAX_TILE_COLS + 1];
+	unsigned short row_bd[HEVCFW_MAX_TILE_ROWS + 1];
+
+	unsigned char chroma_qp_offset_list_len_minus1;
+	unsigned char cb_qp_offset_list[HEVCFW_MAX_CHROMA_QP];
+	unsigned char cr_qp_offset_list[HEVCFW_MAX_CHROMA_QP];
+
+	unsigned char uniform_spacing_flag;
+	unsigned char column_width_minus1[HEVCFW_MAX_TILE_COLS];
+	unsigned char row_height_minus1[HEVCFW_MAX_TILE_ROWS];
+
+	unsigned char pps_seq_parameter_set_id;
+	unsigned char deblocking_filter_control_present_flag;
+	unsigned char pps_scaling_list_data_present_flag;
+	unsigned char pps_extension_present_flag;
+
+	struct hevcfw_scaling_listdata scaling_list;
+};
+
+/* This enum determines reference picture status */
+enum hevcfw_reference_type {
+	HEVCFW_REF_UNUSED      = 0,
+	HEVCFW_REF_SHORTTERM,
+	HEVCFW_REF_LONGTERM,
+	HEVCFW_REF_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/* This describes an HEVC picture. It is part of the Context data */
+struct hevcfw_picture {
+	/* Primary (reconstructed) picture buffers */
+	struct vdecfw_image_buffer primary;
+	/* Secondary (alternative) picture buffers */
+	struct vdecfw_image_buffer alternate;
+	/* Unique ID for this picture */
+	unsigned int transaction_id;
+	/* nut of first ssh of picture, determines picture type */
+	unsigned char nalunit_type;
+	/* Picture Order Count (frame number) */
+	int pic_order_cnt_val;
+	/* Slice Picture Order Count Lsb */
+	int slice_pic_ordercnt_lsb;
+	unsigned char pic_output_flag;
+	/* information about long-term pictures */
+	unsigned short dpb_longterm_flags;
+	unsigned int dpb_pic_order_diff[HEVCFW_NUM_DPB_DIFF_REGS];
+	/* address of buffer for temporal mv params */
+	unsigned int temporal_outaddr;
+	/* worst case Dpb diff for the current pic */
+	unsigned int dpb_diff;
+};
+
+/*
+ * This is a wrapper for a picture to hold it in a Decoded Picture Buffer
+ * for further reference
+ */
+struct hevcfw_picture_in_dpb {
+	/* DPB data about the picture */
+	enum hevcfw_reference_type ref_type;
+	unsigned char valid;
+	unsigned char needed_for_output;
+	unsigned char pic_latency_count;
+	/* Picture itself */
+	struct hevcfw_picture picture;
+};
+
+/*
+ * This describes an HEVC's Decoded Picture Buffer (DPB).
+ * It is part of the Context data
+ */
+#define HEVCFW_DPB_IDX_INVALID  -1
+
+struct hevcfw_decoded_picture_buffer {
+	/* reference pictures */
+	struct hevcfw_picture_in_dpb pictures[HEVCFW_MAX_DPB_SIZE];
+	/* organizational data of DPB */
+	unsigned int fullness;
+};
+
+/*
+ * This describes an HEVC's Reference Picture Set (RPS).
+ * It is part of the Context data
+ */
+struct hevcfw_reference_picture_set {
+	/* sizes of poc lists */
+	unsigned char num_pocst_curr_before;
+	unsigned char num_pocst_curr_after;
+	unsigned char num_pocst_foll;
+	unsigned char num_poclt_curr;
+	unsigned char num_poclt_foll;
+	/* poc lists */
+	int pocst_curr_before[HEVCFW_MAX_NUM_REF_PICS];
+	int pocst_curr_after[HEVCFW_MAX_NUM_REF_PICS];
+	int pocst_foll[HEVCFW_MAX_NUM_REF_PICS];
+	int poclt_curr[HEVCFW_MAX_NUM_REF_PICS];
+	int poclt_foll[HEVCFW_MAX_NUM_REF_PICS];
+	/* derived elements */
+	unsigned char curr_delta_pocmsb_presentflag[HEVCFW_MAX_NUM_REF_PICS];
+	unsigned char foll_delta_pocmsb_presentflag[HEVCFW_MAX_NUM_REF_PICS];
+	/* reference picture sets: indices in DPB */
+	unsigned char ref_picsetlt_curr[HEVCFW_MAX_NUM_REF_PICS];
+	unsigned char ref_picsetlt_foll[HEVCFW_MAX_NUM_REF_PICS];
+	unsigned char ref_picsetst_curr_before[HEVCFW_MAX_NUM_REF_PICS];
+	unsigned char ref_picsetst_curr_after[HEVCFW_MAX_NUM_REF_PICS];
+	unsigned char ref_picsetst_foll[HEVCFW_MAX_NUM_REF_PICS];
+};
+
+/*
+ * This describes the HEVC parser component "Context data", shown in the
+ * Firmware Memory Layout diagram. This data is the state preserved across
+ * pictures. It is loaded and saved by the Firmware, but requires the host to
+ * provide buffer(s) for this.
+ */
+struct hevcfw_ctx_data {
+	struct hevcfw_sequence_ps sps;
+	struct hevcfw_picture_ps pps;
+	/*
+	 * data from last picture with TemporalId = 0 that is not a RASL, RADL
+	 * or sub-layer non-reference picture
+	 */
+	int prev_pic_order_cnt_lsb;
+	int prev_pic_order_cnt_msb;
+	unsigned char last_irapnorasl_output_flag;
+	/*
+	 * Decoded Pictures Buffer holds information about decoded pictures
+	 * needed for further INTER decoding
+	 */
+	struct hevcfw_decoded_picture_buffer dpb;
+	/* Reference Picture Set is determined on per-picture basis */
+	struct hevcfw_reference_picture_set rps;
+	/*
+	 * Reference Picture List is determined using data from Reference
+	 * Picture Set and from Slice (Segment) Header on per-slice basis
+	 */
+	unsigned char ref_pic_list[HEVCFW_NUM_REF_PIC_LISTS][HEVCFW_MAX_NUM_REF_PICS];
+	/*
+	 * Reference Picture List used to send reflist to the host, the only
+	 * difference is that missing references are marked
+	 * with HEVCFW_DPB_IDX_INVALID
+	 */
+	unsigned char ref_pic_listhlp[HEVCFW_NUM_REF_PIC_LISTS][HEVCFW_MAX_NUM_REF_PICS];
+
+	unsigned int pic_count;
+	unsigned int slice_segment_count;
+	/* There was EOS NAL detected and no new picture yet */
+	int eos_detected;
+	/* This is first picture after EOS NAL */
+	int first_after_eos;
+};
+
+#endif /* _HEVCFW_DATA_H_ */
diff --git a/drivers/staging/media/vxd/decoder/img_pixfmts.h b/drivers/staging/media/vxd/decoder/img_pixfmts.h
new file mode 100644
index 000000000000..f21c8f9da4b5
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/img_pixfmts.h
@@ -0,0 +1,195 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * VXD DEC SYSDEV and UI Interface header
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Amit Makani <amit.makani@ti.com>
+ */
+
+#ifndef __IMG_PIXFMTS_H__
+#define __IMG_PIXFMTS_H__
+/*
+ * @brief Old pixel format definition
+ *
+ * @note These definitions are different in HW documentation(current to HW doc):
+ * @li PL8 is defined as PL111
+ * @li PL12 is sometime used wrongly for monochrome formats instead of PL_Y
+ */
+enum img_pixfmt {
+	IMG_PIXFMT_CLUT1              =   0,
+	IMG_PIXFMT_CLUT2              =   1,
+	IMG_PIXFMT_CLUT4              =   2,
+	IMG_PIXFMT_I4A4               =   3,
+	IMG_PIXFMT_I8A8               =   4,
+	IMG_PIXFMT_A8I8               =   51,
+	IMG_PIXFMT_RGB8               =   5,
+	IMG_PIXFMT_RGB332             =   6,
+	IMG_PIXFMT_RGB555             =   7,
+	IMG_PIXFMT_ARGB4444           =   8,
+	IMG_PIXFMT_ABGR4444           =   57,
+	IMG_PIXFMT_RGBA4444           =   58,
+	IMG_PIXFMT_BGRA4444           =   59,
+	IMG_PIXFMT_ARGB1555           =   9,
+	IMG_PIXFMT_ABGR1555           =   60,
+	IMG_PIXFMT_RGBA5551           =   61,
+	IMG_PIXFMT_BGRA5551           =   62,
+	IMG_PIXFMT_RGB565             =   10,
+	IMG_PIXFMT_BGR565             =   63,
+	IMG_PIXFMT_RGB888             =   11,
+	IMG_PIXFMT_RSGSBS888          =   68,
+	IMG_PIXFMT_ARGB8888           =   12,
+	IMG_PIXFMT_ABGR8888           =   41,
+	IMG_PIXFMT_BGRA8888           =   42,
+	IMG_PIXFMT_RGBA8888           =   56,
+	IMG_PIXFMT_ARGB8332           =   43,
+	IMG_PIXFMT_ARGB8161616        =   64,
+	IMG_PIXFMT_ARGB2101010        =   67,
+	IMG_PIXFMT_UYVY8888           =   13,
+	IMG_PIXFMT_VYUY8888           =   14,
+	IMG_PIXFMT_YVYU8888           =   15,
+	IMG_PIXFMT_YUYV8888           =   16,
+	IMG_PIXFMT_UYVY10101010       =   17,
+	IMG_PIXFMT_VYAUYA8888         =   18,
+	IMG_PIXFMT_YUV101010          =   19,
+	IMG_PIXFMT_AYUV4444           =   20,
+	IMG_PIXFMT_YUV888             =   21,
+	IMG_PIXFMT_AYUV8888           =   22,
+	IMG_PIXFMT_AYUV2101010        =   23,
+	IMG_PIXFMT_411PL111YUV8       =   120,
+	IMG_PIXFMT_411PL12YUV8        =   121,
+	IMG_PIXFMT_411PL12YVU8        =   24,
+	IMG_PIXFMT_420PL12YUV8        =   25,
+	IMG_PIXFMT_420PL12YVU8        =   26,
+	IMG_PIXFMT_422PL12YUV8        =   27,
+	IMG_PIXFMT_422PL12YVU8        =   28,
+	IMG_PIXFMT_420PL8YUV8         =   47,
+	IMG_PIXFMT_422PL8YUV8         =   48,
+	IMG_PIXFMT_420PL12YUV8_A8     = 31,
+	IMG_PIXFMT_422PL12YUV8_A8     = 32,
+	IMG_PIXFMT_PL12Y8             =   33,
+	IMG_PIXFMT_PL12YV8            =   35,
+	IMG_PIXFMT_PL12IMC2           =   36,
+	IMG_PIXFMT_A4                 =   37,
+	IMG_PIXFMT_A8                 =   38,
+	IMG_PIXFMT_YUV8               =   39,
+	IMG_PIXFMT_CVBS10             =   40,
+	IMG_PIXFMT_PL12YV12           =   44,
+#if ((!defined(METAG) && !defined(MTXG)) || defined(__linux__))
+	IMG_PIXFMT_F16                = 52,
+	IMG_PIXFMT_F32                = 53,
+	IMG_PIXFMT_F16F16F16F16       = 65,
+#endif
+	IMG_PIXFMT_L16                = 54,
+	IMG_PIXFMT_L32                = 55,
+	IMG_PIXFMT_Y1                 = 66,
+	IMG_PIXFMT_444PL111YUV8       = 69,
+	IMG_PIXFMT_444PL12YUV8        = 137,
+	IMG_PIXFMT_444PL12YVU8        = 138,
+	IMG_PIXFMT_PL12Y10            =   34,
+	IMG_PIXFMT_PL12Y10_LSB        =  96,
+	IMG_PIXFMT_PL12Y10_MSB        =  97,
+	IMG_PIXFMT_420PL8YUV10        =   49,
+	IMG_PIXFMT_420PL111YUV10_LSB  = 71,
+	IMG_PIXFMT_420PL111YUV10_MSB  = 72,
+	IMG_PIXFMT_420PL12YUV10       = 29,
+	IMG_PIXFMT_420PL12YUV10_LSB   = 74,
+	IMG_PIXFMT_420PL12YUV10_MSB   = 75,
+	IMG_PIXFMT_420PL12YVU10       = 45,
+	IMG_PIXFMT_420PL12YVU10_LSB   = 77,
+	IMG_PIXFMT_420PL12YVU10_MSB   = 78,
+	IMG_PIXFMT_422PL8YUV10        =   50,
+	IMG_PIXFMT_422PL111YUV10_LSB  = 122,
+	IMG_PIXFMT_422PL111YUV10_MSB  = 123,
+	IMG_PIXFMT_422PL12YUV10       = 30,
+	IMG_PIXFMT_422PL12YUV10_LSB   = 80,
+	IMG_PIXFMT_422PL12YUV10_MSB   = 81,
+	IMG_PIXFMT_422PL12YVU10       = 46,
+	IMG_PIXFMT_422PL12YVU10_LSB   = 83,
+	IMG_PIXFMT_422PL12YVU10_MSB   = 84,
+	IMG_PIXFMT_444PL111YUV10      = 85,
+	IMG_PIXFMT_444PL111YUV10_LSB  = 86,
+	IMG_PIXFMT_444PL111YUV10_MSB  = 87,
+	IMG_PIXFMT_444PL12YUV10       = 139,
+	IMG_PIXFMT_444PL12YUV10_LSB   = 141,
+	IMG_PIXFMT_444PL12YUV10_MSB   = 142,
+	IMG_PIXFMT_444PL12YVU10       = 140,
+	IMG_PIXFMT_444PL12YVU10_LSB   = 143,
+	IMG_PIXFMT_444PL12YVU10_MSB   = 144,
+	IMG_PIXFMT_420PL12Y8UV10      = 88,
+	IMG_PIXFMT_420PL12Y8UV10_LSB  = 98,
+	IMG_PIXFMT_420PL12Y8UV10_MSB  = 99,
+	IMG_PIXFMT_420PL12Y8VU10      = 89,
+	IMG_PIXFMT_420PL12Y8VU10_LSB  = 100,
+	IMG_PIXFMT_420PL12Y8VU10_MSB  = 101,
+	IMG_PIXFMT_420PL111Y8UV10     = 70,
+	IMG_PIXFMT_420PL111Y8UV10_LSB = 127,
+	IMG_PIXFMT_420PL111Y8UV10_MSB = 125,
+	IMG_PIXFMT_422PL12Y8UV10      = 90,
+	IMG_PIXFMT_422PL12Y8UV10_LSB  = 102,
+	IMG_PIXFMT_422PL12Y8UV10_MSB  = 103,
+	IMG_PIXFMT_422PL12Y8VU10      = 91,
+	IMG_PIXFMT_422PL12Y8VU10_LSB  = 104,
+	IMG_PIXFMT_422PL12Y8VU10_MSB  = 105,
+	IMG_PIXFMT_444PL12Y8UV10      = 151,
+	IMG_PIXFMT_444PL12Y8UV10_LSB  = 153,
+	IMG_PIXFMT_444PL12Y8UV10_MSB  = 154,
+	IMG_PIXFMT_444PL12Y8VU10      = 152,
+	IMG_PIXFMT_444PL12Y8VU10_LSB  = 155,
+	IMG_PIXFMT_444PL12Y8VU10_MSB  = 156,
+	IMG_PIXFMT_420PL12Y10UV8      = 92,
+	IMG_PIXFMT_420PL12Y10UV8_LSB  = 106,
+	IMG_PIXFMT_420PL12Y10UV8_MSB  = 107,
+
+	IMG_PIXFMT_420PL12Y10VU8      = 93,
+	IMG_PIXFMT_420PL12Y10VU8_LSB  = 108,
+	IMG_PIXFMT_420PL12Y10VU8_MSB  = 109,
+
+	IMG_PIXFMT_420PL111Y10UV8     = 129,
+	IMG_PIXFMT_420PL111Y10UV8_LSB = 133,
+	IMG_PIXFMT_420PL111Y10UV8_MSB = 131,
+	IMG_PIXFMT_422PL12Y10UV8      = 94,
+	IMG_PIXFMT_422PL12Y10UV8_LSB  = 110,
+	IMG_PIXFMT_422PL12Y10UV8_MSB  = 111,
+	IMG_PIXFMT_422PL12Y10VU8      = 95,
+	IMG_PIXFMT_422PL12Y10VU8_LSB  = 112,
+	IMG_PIXFMT_422PL12Y10VU8_MSB  = 113,
+
+	IMG_PIXFMT_444PL111Y10UV8     = 114,
+	IMG_PIXFMT_444PL111Y10UV8_LSB = 115,
+	IMG_PIXFMT_444PL111Y10UV8_MSB = 116,
+	IMG_PIXFMT_444PL111Y8UV10     = 117,
+	IMG_PIXFMT_444PL111Y8UV10_LSB = 118,
+	IMG_PIXFMT_444PL111Y8UV10_MSB = 119,
+	IMG_PIXFMT_444PL12Y10UV8      = 145,
+	IMG_PIXFMT_444PL12Y10UV8_LSB  = 147,
+	IMG_PIXFMT_444PL12Y10UV8_MSB  = 148,
+	IMG_PIXFMT_444PL12Y10VU8      = 146,
+	IMG_PIXFMT_444PL12Y10VU8_LSB  = 149,
+	IMG_PIXFMT_444PL12Y10VU8_MSB  = 150,
+	IMG_PIXFMT_422PL111Y8UV10     = 124,
+	IMG_PIXFMT_422PL111Y8UV10_MSB = 126,
+	IMG_PIXFMT_422PL111Y8UV10_LSB = 128,
+
+	IMG_PIXFMT_422PL111Y10UV8     = 130,
+	IMG_PIXFMT_422PL111Y10UV8_LSB = 134,
+	IMG_PIXFMT_422PL111Y10UV8_MSB = 132,
+	IMG_PIXFMT_420PL8YUV12        = 160,
+	IMG_PIXFMT_422PL8YUV12        = 161,
+	IMG_PIXFMT_444PL8YUV12        = 162,
+	IMG_PIXFMT_420PL8YUV14        = 163,
+	IMG_PIXFMT_422PL8YUV14        = 164,
+	IMG_PIXFMT_444PL8YUV14        = 165,
+	IMG_PIXFMT_420PL8YUV16        = 166,
+	IMG_PIXFMT_422PL8YUV16        = 167,
+	IMG_PIXFMT_444PL8YUV16        = 168,
+	IMG_PIXFMT_UNDEFINED          = 255,
+
+	IMG_PIXFMT_ARBPLANAR8         = 65536,
+	IMG_PIXFMT_ARBPLANAR8_LAST    = IMG_PIXFMT_ARBPLANAR8 + 0xffff,
+	IMG_PIXFMT_FORCE32BITS        = 0x7FFFFFFFU
+};
+
+#endif
diff --git a/drivers/staging/media/vxd/decoder/img_profiles_levels.h b/drivers/staging/media/vxd/decoder/img_profiles_levels.h
new file mode 100644
index 000000000000..710b429f7f3e
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/img_profiles_levels.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * VXD DEC SYSDEV and UI Interface header
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Amit Makani <amit.makani@ti.com>
+ *
+ * Re-written for upstreamimg
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+
+#ifndef __IMG_PROFILES_LEVELS_H
+#define __IMG_PROFILES_LEVELS_H
+
+#include "vdecdd_utils.h"
+
+/* Minimum level value for h.264 */
+#define H264_LEVEL_MIN              (9)
+/* Maximum level value for h.264 */
+#define H264_LEVEL_MAX             (52)
+/* Number of major levels for h.264 (5 + 1 for special levels) */
+#define H264_LEVEL_MAJOR_NUM        (6)
+/* Number of minor levels for h.264 */
+#define H264_LEVEL_MINOR_NUM            (4)
+/* Number of major levels for HEVC */
+#define HEVC_LEVEL_MAJOR_NUM        (6)
+/* Number of minor levels for HEVC */
+#define HEVC_LEVEL_MINOR_NUM        (3)
+
+#endif /*__IMG_PROFILES_LEVELS_H */
diff --git a/drivers/staging/media/vxd/decoder/jpegfw_data.h b/drivers/staging/media/vxd/decoder/jpegfw_data.h
new file mode 100644
index 000000000000..d84e5d73f844
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/jpegfw_data.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Public data structures for the h264 parser firmware module.
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Sunita Nadampalli <sunitan@ti.com>
+ *
+ * Re-written for upstreming
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+
+#include "jpegfw_data_shared.h"
+
+#ifndef _JPEGFW_DATA_H_
+#define _JPEGFW_DATA_H_
+
+#define JPEG_VDEC_8x8_DCT_SIZE             64 //!< Number of elements in 8x8 DCT
+#define JPEG_VDEC_MAX_COMPONENTS           4  //!< Maximum number of component in JPEG
+#define JPEG_VDEC_MAX_SETS_HUFFMAN_TABLES  2  //!< Maximum set of huffman table in JPEG
+#define JPEG_VDEC_MAX_QUANT_TABLES         4  //!< Maximum set of quantisation table in JPEG
+#define JPEG_VDEC_TABLE_CLASS_NUM          2  //!< Maximum set of class of huffman table in JPEG
+#define JPEG_VDEC_PLANE_MAX                4  //!< Maximum number of planes
+
+struct hentry {
+	unsigned short code;
+	unsigned char codelen;
+	unsigned char value;
+};
+
+/**
+ * struct vdec_jpeg_huffman_tableinfo - This structure contains JPEG huffmant table
+ * @bits: number of bits
+ * @values: codeword value
+ *
+ * NOTE: Should only contain JPEG specific information.
+ * JPEG Huffman Table Information
+ */
+struct vdec_jpeg_huffman_tableinfo {
+	/* number of bits */
+	unsigned char bits[16];
+	/* codeword value */
+	unsigned char values[256];
+};
+
+/*
+ * This structure contains JPEG DeQunatisation table
+ * NOTE: Should only contain JPEG specific information.
+ * @brief  JPEG Dequantisation Table Information
+ */
+struct vdec_jpeg_de_quant_tableinfo {
+	/* Qunatisation precision */
+	unsigned char precision;
+	/* Qunatisation Value for 8x8 DCT  */
+	unsigned short elements[64];
+};
+
+/*
+ * This describes the JPEG parser component "Header data", shown in the
+ * Firmware Memory Layout diagram. This data is required by the JPEG firmware
+ * and should be supplied by the Host.
+ */
+struct jpegfw_header_data {
+	/* Primary decode buffer base addresses */
+	struct vdecfw_image_buffer primary;
+	/* Reference (output) picture base addresses */
+	unsigned int plane_offsets[JPEG_VDEC_PLANE_MAX];
+	/* SOS fields count value */
+	unsigned char hdr_sos_count;
+};
+
+/*
+ * This describes the JPEG  parser component "Context data".
+ * JPEG does not need any data to be saved between pictures, this structure
+ * is needed only to fit in firmware framework.
+ */
+struct jpegfw_context_data {
+	unsigned int dummy;
+};
+
+#endif /* _JPEGFW_DATA_H_ */
diff --git a/drivers/staging/media/vxd/decoder/mmu_defs.h b/drivers/staging/media/vxd/decoder/mmu_defs.h
new file mode 100644
index 000000000000..0ea65509071d
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/mmu_defs.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * V-DEC MMU Definitions
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Amit Makani <amit.makani@ti.com>
+ */
+
+#ifndef _VXD_MMU_DEF_H_
+#define _VXD_MMU_DEF_H_
+
+/*
+ * This type defines MMU variant.
+ */
+enum mmu_etype {
+	MMU_TYPE_NONE        = 0,
+	MMU_TYPE_32BIT,
+	MMU_TYPE_36BIT,
+	MMU_TYPE_40BIT,
+	MMU_TYPE_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/**
+ * enum mmu_eheap_id - This type defines the MMU heaps.
+ * @MMU_HEAP_IMAGE_BUFFERS_UNTILED: Heap for untiled video buffers
+ * @MMU_HEAP_BITSTREAM_BUFFERS : Heap for bitstream buffers
+ * @MMU_HEAP_STREAM_BUFFERS : Heap for Stream buffers
+ * @MMU_HEAP_MAX : Number of heaps
+ * @MMU_HEAP_FORCE32BITS: MMU_HEAP_FORCE32BITS
+ */
+enum mmu_eheap_id {
+	MMU_HEAP_IMAGE_BUFFERS_UNTILED = 0x00,
+	MMU_HEAP_BITSTREAM_BUFFERS,
+	MMU_HEAP_STREAM_BUFFERS,
+	MMU_HEAP_MAX,
+	MMU_HEAP_FORCE32BITS           = 0x7FFFFFFFU
+};
+
+#endif /* _VXD_MMU_DEFS_H_ */
diff --git a/drivers/staging/media/vxd/decoder/scaler_setup.h b/drivers/staging/media/vxd/decoder/scaler_setup.h
new file mode 100644
index 000000000000..55dc000e07a2
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/scaler_setup.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * VXD DEC constants calculation and scalling coefficients
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Amit Makani <amit.makani@ti.com>
+ */
+
+#ifndef _SCALER_SETUP_H
+#define _SCALER_SETUP_H
+
+#define LOWP                            11
+#define HIGHP                           14
+
+#define FIXED(a, digits)                ((int)((a) * (1 << (digits))))
+
+struct scaler_params {
+	unsigned int vert_pitch;
+	unsigned int vert_startpos;
+	unsigned int vert_pitch_chroma;
+	unsigned int vert_startpos_chroma;
+	unsigned int horz_pitch;
+	unsigned int horz_startpos;
+	unsigned int horz_pitch_chroma;
+	unsigned int horz_startpos_chroma;
+	unsigned char fixed_point_shift;
+};
+
+struct scaler_filter {
+	unsigned char bhoriz_bilinear;
+	unsigned char bvert_bilinear;
+};
+
+struct scaler_pitch {
+	int horiz_luma;
+	int vert_luma;
+	int horiz_chroma;
+	int vert_chroma;
+};
+
+struct scaler_config {
+	enum vdec_vid_std vidstd;
+	const struct vxd_coreprops *coreprops;
+	struct pixel_pixinfo *in_pixel_info;
+	const struct pixel_pixinfo *out_pixel_info;
+	unsigned char bfield_coded;
+	unsigned char bseparate_chroma_planes;
+	unsigned int recon_width;
+	unsigned int recon_height;
+	unsigned int mb_width;
+	unsigned int mb_height;
+	unsigned int scale_width;
+	unsigned int scale_height;
+};
+
+#endif /* _SCALER_SETUP_H */
diff --git a/drivers/staging/media/vxd/decoder/vdec_defs.h b/drivers/staging/media/vxd/decoder/vdec_defs.h
new file mode 100644
index 000000000000..d7f182fd96d3
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/vdec_defs.h
@@ -0,0 +1,548 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * VXD Decoder common header
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Amit Makani <amit.makani@ti.com>
+ *
+ * Re-written for upstreamimg
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+
+#ifndef __VDEC_DEFS_H__
+#define __VDEC_DEFS_H__
+
+#include "img_mem.h"
+#include "img_pixfmts.h"
+#ifdef HAS_JPEG
+#include "jpegfw_data.h"
+#endif
+#include "pixel_api.h"
+#include "vdecfw_shared.h"
+
+#define VDEC_MAX_PANSCAN_WINDOWS        4
+#define VDEC_MB_DIMENSION               (16)
+
+#define MAX_PICS_IN_SYSTEM      (8)
+#define SEQUENCE_SLOTS          (8)
+#define PPS_SLOTS               (8)
+/* Only for HEVC */
+#define VPS_SLOTS               (16)
+#define MAX_VPSS                (MAX_PICS_IN_SYSTEM + VPS_SLOTS)
+#define MAX_SEQUENCES           (MAX_PICS_IN_SYSTEM + SEQUENCE_SLOTS)
+#define MAX_PPSS                (MAX_PICS_IN_SYSTEM + PPS_SLOTS)
+
+#define VDEC_H264_MAXIMUMVALUEOFCPB_CNT 32
+#define VDEC_H264_MVC_MAX_VIEWS         (H264FW_MAX_NUM_VIEWS)
+
+#define VDEC_ASSERT(expected) ({ WARN_ON(!(expected)); 0; })
+
+#define VDEC_ALIGN_SIZE(_val, _alignment, val_type, align_type) \
+	({ \
+		val_type val = _val; \
+		align_type alignment = _alignment; \
+		(((val) + (alignment) - 1) & ~((alignment) - 1)); })
+
+/*
+ * This type defines the video standard.
+ * @brief  VDEC Video Standards
+ */
+enum vdec_vid_std {
+	VDEC_STD_UNDEFINED = 0,
+	VDEC_STD_MPEG2,
+	VDEC_STD_MPEG4,
+	VDEC_STD_H263,
+	VDEC_STD_H264,
+	VDEC_STD_VC1,
+	VDEC_STD_AVS,
+	VDEC_STD_REAL,
+	VDEC_STD_JPEG,
+	VDEC_STD_VP6,
+	VDEC_STD_VP8,
+	VDEC_STD_SORENSON,
+	VDEC_STD_HEVC,
+	VDEC_STD_MAX,
+	VDEC_STD_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * This type defines the bitstream format. Should be done at the
+ * start of decoding.
+ * @brief  VDEC Bitstream Format
+ */
+enum vdec_bstr_format {
+	VDEC_BSTRFORMAT_UNDEFINED = 0,
+	VDEC_BSTRFORMAT_ELEMENTARY,
+	VDEC_BSTRFORMAT_DEMUX_BYTESTREAM,
+	VDEC_BSTRFORMAT_DEMUX_SIZEDELIMITED,
+	VDEC_BSTRFORMAT_MAX,
+	VDEC_BSTRFORMAT_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * This type defines the Type of payload. Could change with every buffer.
+ * @brief  VDEC Bitstream Element Type
+ */
+enum vdec_bstr_element_type {
+	VDEC_BSTRELEMENT_UNDEFINED = 0,
+	VDEC_BSTRELEMENT_UNSPECIFIED,
+	VDEC_BSTRELEMENT_CODEC_CONFIG,
+	VDEC_BSTRELEMENT_PICTURE_DATA,
+	VDEC_BSTRELEMENT_MAX,
+	VDEC_BSTRELEMENT_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * This structure contains the stream configuration details.
+ * @brief  VDEC Stream Configuration Information
+ */
+struct vdec_str_configdata {
+	enum vdec_vid_std vid_std;
+	enum vdec_bstr_format bstr_format;
+	unsigned int user_str_id;
+	unsigned char update_yuv;
+	unsigned char bandwidth_efficient;
+	unsigned char disable_mvc;
+	unsigned char full_scan;
+	unsigned char immediate_decode;
+	unsigned char intra_frame_closed_gop;
+};
+
+/*
+ * This type defines the buffer type categories.
+ * @brief  Buffer Types
+ */
+enum vdec_buf_type {
+	VDEC_BUFTYPE_BITSTREAM,
+	VDEC_BUFTYPE_PICTURE,
+	VDEC_BUFTYPE_ALL,
+	VDEC_BUFTYPE_MAX,
+	VDEC_BUFTYPE_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * This structure contains information related to a picture plane.
+ * @brief  Picture Plane Information
+ */
+struct vdec_plane_info {
+	unsigned int offset;
+	unsigned int stride;
+	unsigned int size;
+};
+
+/*
+ * This structure describes the VDEC picture dimensions.
+ * @brief  VDEC Picture Size
+ */
+struct vdec_pict_size {
+	unsigned int width;
+	unsigned int height;
+};
+
+/*
+ * This enumeration defines the colour plane indices.
+ * @brief  Colour Plane Indices
+ */
+enum vdec_color_planes {
+	VDEC_PLANE_VIDEO_Y     = 0,
+	VDEC_PLANE_VIDEO_YUV   = 0,
+	VDEC_PLANE_VIDEO_U     = 1,
+	VDEC_PLANE_VIDEO_UV    = 1,
+	VDEC_PLANE_VIDEO_V     = 2,
+	VDEC_PLANE_VIDEO_A     = 3,
+	VDEC_PLANE_LIGHT_R     = 0,
+	VDEC_PLANE_LIGHT_G     = 1,
+	VDEC_PLANE_LIGHT_B     = 2,
+	VDEC_PLANE_INK_C       = 0,
+	VDEC_PLANE_INK_M       = 1,
+	VDEC_PLANE_INK_Y       = 2,
+	VDEC_PLANE_INK_K       = 3,
+	VDEC_PLANE_MAX         = 4,
+	VDEC_PLANE_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * This structure describes the rendered region of a picture buffer (i.e. where
+ * the image data is written.
+ * @brief  Picture Buffer Render Information
+ */
+struct vdec_pict_rendinfo {
+	unsigned int rendered_size;
+	struct vdec_plane_info plane_info[VDEC_PLANE_MAX];
+	unsigned int stride_alignment;
+	struct vdec_pict_size rend_pict_size;
+};
+
+/*
+ * This structure contains information required to configure the picture
+ * buffers
+ * @brief  Picture Buffer Configuration
+ */
+struct vdec_pict_bufconfig {
+	unsigned int coded_width;
+	unsigned int coded_height;
+	enum img_pixfmt pixel_fmt;
+	unsigned int stride[IMG_MAX_NUM_PLANES];
+	unsigned int stride_alignment;
+	unsigned char byte_interleave;
+	unsigned int buf_size;
+	unsigned char packed;
+	unsigned int chroma_offset[IMG_MAX_NUM_PLANES];
+	unsigned int plane_size[IMG_MAX_NUM_PLANES];
+};
+
+/*
+ * This structure describes the VDEC Display Rectangle.
+ * @brief  VDEC Display Rectangle
+ */
+struct vdec_rect {
+	unsigned int top_offset;
+	unsigned int left_offset;
+	unsigned int width;
+	unsigned int height;
+};
+
+/*
+ * This structure contains the Color Space Description that may be present
+ * in SequenceDisplayExtn(MPEG2), VUI parameters(H264), Visual Object(MPEG4)
+ * for the application to use.
+ * @brief  Stream Color Space Properties
+ */
+struct vdec_color_space_desc {
+	unsigned char is_present;
+	unsigned char color_primaries;
+	unsigned char transfer_characteristics;
+	unsigned char matrix_coefficients;
+};
+
+/*
+ * This structure contains common (standard agnostic) sequence header
+ * information, which is required for image buffer allocation and display.
+ * @brief  Sequence Header Information (common)
+ */
+struct vdec_comsequ_hdrinfo {
+	unsigned int codec_profile;
+	unsigned int codec_level;
+	unsigned int bitrate;
+	long frame_rate;
+	unsigned int frame_rate_num;
+	unsigned int frame_rate_den;
+	unsigned int aspect_ratio_num;
+	unsigned int aspect_ratio_den;
+	unsigned char interlaced_frames;
+	struct pixel_pixinfo pixel_info;
+	struct vdec_pict_size max_frame_size;
+	unsigned int max_ref_frame_num;
+	struct vdec_pict_size frame_size;
+	unsigned char field_codec_mblocks;
+	unsigned int min_pict_buf_num;
+	unsigned char picture_reordering;
+	unsigned char post_processing;
+	struct vdec_rect orig_display_region;
+	struct vdec_rect raw_display_region;
+	unsigned int num_views;
+	unsigned int max_reorder_picts;
+	unsigned char separate_chroma_planes;
+	unsigned char not_dpb_flush;
+	struct vdec_color_space_desc color_space_info;
+};
+
+/*
+ * This structure contains the standard specific codec configuration
+ * @brief Codec configuration
+ */
+struct vdec_codec_config {
+	unsigned int default_height;
+	unsigned int default_width;
+};
+
+/*
+ * This structure describes the decoded picture attributes (relative to the
+ * encoded, where necessary, e.g. rotation angle).
+ * @brief  Stream Output Configuration
+ */
+struct vdec_str_opconfig {
+	struct pixel_pixinfo pixel_info;
+	unsigned char force_oold;
+};
+
+/*
+ * This type defines the "play" mode.
+ * @brief  Play Mode
+ */
+enum vdec_play_mode {
+	VDEC_PLAYMODE_PARSE_ONLY,
+	VDEC_PLAYMODE_NORMAL_DECODE,
+	VDEC_PLAYMODE_MAX,
+	VDEC_PLAYMODE_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * This type defines the bitstream processing error info.
+ * @brief  Bitstream Processing Error Info
+ */
+struct vdec_bstr_err_info {
+	unsigned int sequence_err;
+	unsigned int picture_err;
+	unsigned int other_err;
+};
+
+/*
+ * This structure describes the VDEC Pan Scan Window.
+ * @brief  VDEC Pan Scan Window
+ */
+struct vdec_window {
+	unsigned int ui32topoffset;
+	unsigned int ui32leftoffset;
+	unsigned int ui32width;
+	unsigned int ui32height;
+};
+
+/*
+ * This structure contains the VDEC picture display properties.
+ * @brief  VDEC Picture Display Properties
+ */
+struct vdec_pict_disp_info {
+	struct vdec_rect enc_disp_region;
+	struct vdec_rect disp_region;
+	struct vdec_rect raw_disp_region;
+	unsigned char top_fld_first;
+	unsigned char out_top_fld_first;
+	unsigned int max_frm_repeat;
+	unsigned int repeat_first_fld;
+	unsigned int num_pan_scan_windows;
+	struct vdec_window pan_scan_windows[VDEC_MAX_PANSCAN_WINDOWS];
+};
+
+/*
+ * This structure contains VXD hardware signatures.
+ * @brief  VXD Hardware signatures
+ */
+struct vdec_pict_hwcrc {
+	unsigned char first_fld_rcvd;
+	unsigned int crc_vdmc_pix_recon;
+	unsigned int vdeb_sysmem_wrdata;
+};
+
+struct vdec_features {
+	unsigned char valid;
+	unsigned char mpeg2;
+	unsigned char mpeg4;
+	unsigned char h264;
+	unsigned char vc1;
+	unsigned char avs;
+	unsigned char real;
+	unsigned char jpeg;
+	unsigned char vp6;
+	unsigned char vp8;
+	unsigned char hevc;
+	unsigned char hd;
+	unsigned char rotation;
+	unsigned char scaling;
+	unsigned char scaling_oold;
+	unsigned char scaling_extnd_strides;
+};
+
+/*
+ * This type defines the auxiliary info for picture queued for decoding.
+ * @brief  Auxiliary Decoding Picture Info
+ */
+struct vdec_dec_pict_auxinfo {
+	unsigned int seq_hdr_id;
+	unsigned int pps_id;
+	unsigned int second_pps_id;
+	unsigned char not_decoded;
+};
+
+/*
+ * This type defines the decoded picture state.
+ * @brief  Decoded Picture State
+ */
+enum vdec_pict_state {
+	VDEC_PICT_STATE_NOT_DECODED,
+	VDEC_PICT_STATE_DECODED,
+	VDEC_PICT_STATE_TERMINATED,
+	VDEC_PICT_STATE_MAX,
+	VDEC_PICT_STATE_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * This type defines the container for various picture tags.
+ * @brief  Picture Tag Container
+ */
+struct vdec_pict_tag_container {
+	enum img_buffer_type pict_type;
+	unsigned long long pict_tag_param;
+	unsigned long long sideband_info;
+	struct vdec_pict_hwcrc pict_hwcrc;
+};
+
+/*
+ * This structure describes raw bitstream data chunk.
+ * @brief  Raw Bitstream Data Chunk
+ */
+struct vdec_raw_bstr_data {
+	unsigned int size;
+	unsigned int bit_offset;
+	unsigned char *data;
+	struct vdec_raw_bstr_data *next;
+};
+
+/*
+ * This type defines the supplementary picture data.
+ * @brief  Supplementary Picture Data
+ */
+struct vdec_pict_supl_data {
+	struct vdec_raw_bstr_data *raw_vui_data;
+	struct vdec_raw_bstr_data *raw_sei_list_first_fld;
+	struct vdec_raw_bstr_data *raw_sei_list_second_fld;
+	union {
+		struct h264_pict_supl_data {
+			unsigned char nal_ref_idc;
+			unsigned short frame_num;
+		} data;
+	};
+};
+
+/*
+ * This structure contains decoded picture information for display.
+ * @brief  Decoded Picture Information
+ */
+struct vdec_dec_pict_info {
+	enum vdec_pict_state pict_state;
+	enum img_buffer_type buf_type;
+	unsigned char interlaced_flds;
+	unsigned int err_flags;
+	unsigned int err_level;
+	struct vdec_pict_tag_container first_fld_tag_container;
+	struct vdec_pict_tag_container second_fld_tag_container;
+	struct vdec_str_opconfig op_config;
+	struct vdec_pict_rendinfo rend_info;
+	struct vdec_pict_disp_info disp_info;
+	unsigned int last_in_seq;
+	unsigned int decode_id;
+	unsigned int id_for_hwcrc_chk;
+	unsigned short view_id;
+	unsigned int timestamp;
+	struct vdec_pict_supl_data pict_supl_data;
+};
+
+struct vdec_pict_rend_config {
+	struct vdec_pict_size coded_pict_size;
+	unsigned char packed;
+	unsigned char byte_interleave;
+	unsigned int stride_alignment;
+};
+
+/*
+ * This structure contains unsupported feature flags.
+ * @brief  Unsupported Feature Flags
+ */
+struct vdec_unsupp_flags {
+	unsigned int str_cfg;
+	unsigned int str_opcfg;
+	unsigned int op_bufcfg;
+	unsigned int seq_hdr;
+	unsigned int pict_hdr;
+};
+
+/*
+ * This type defines the error , error in parsing, error in decoding etc.
+ * @brief  VDEC parsing/decoding error  Information
+ */
+enum vdec_error_type {
+	VDEC_ERROR_NONE                 = (0),
+	VDEC_ERROR_SR_ERROR             = (1 << 0),
+	VDEC_ERROR_FEHW_TIMEOUT         = (1 << 1),
+	VDEC_ERROR_FEHW_DECODE          = (1 << 2),
+	VDEC_ERROR_BEHW_TIMEOUT         = (1 << 3),
+	VDEC_ERROR_SERVICE_TIMER_EXPIRY = (1 << 4),
+	VDEC_ERROR_MISSING_REFERENCES   = (1 << 5),
+	VDEC_ERROR_MMU_FAULT            = (1 << 6),
+	VDEC_ERROR_DEVICE               = (1 << 7),
+	VDEC_ERROR_CORRUPTED_REFERENCE  = (1 << 8),
+	VDEC_ERROR_MMCO                 = (1 << 9),
+	VDEC_ERROR_MBS_DROPPED          = (1 << 10),
+	VDEC_ERROR_MAX                  = (1 << 11),
+	VDEC_ERROR_FORCE32BITS          = 0x7FFFFFFFU
+};
+
+/*
+ * This structure contains information relating to a buffer.
+ * @brief  Buffer Information
+ */
+struct vdec_buf_info {
+	void *cpu_linear_addr;
+	unsigned int buf_id;
+	struct vdec_pict_bufconfig pictbuf_cfg;
+	int fd;
+	/* The following are fields used internally within VDEC... */
+	unsigned int buf_size;
+	enum sys_emem_attrib mem_attrib;
+	void *buf_alloc_handle;
+	void *buf_map_handle;
+};
+
+#ifdef HAS_JPEG
+/*
+ * This structure contains JPEG sequence header information.
+ * NOTE: Should only contain JPEG specific information.
+ * @brief  JPEG sequence header Information
+ */
+struct vdec_jpeg_sequ_hdr_info {
+	/* total component in jpeg */
+	unsigned char num_component;
+	/* precision */
+	unsigned char precision;
+};
+
+/*
+ * This structure contains JPEG start of frame segment header
+ * NOTE: Should only contain JPEG specific information.
+ * @brief  JPEG SOF header Information
+ */
+struct vdec_jpeg_sof_component_hdr {
+	/* component identifier. */
+	unsigned char identifier;
+	/* Horizontal scaling. */
+	unsigned char horz_factor;
+	/* Verticale scaling */
+	unsigned char vert_factor;
+	/* Qunatisation tables . */
+	unsigned char quant_table;
+};
+
+/*
+ * This structure contains JPEG start of scan segment header
+ * NOTE: Should only contain JPEG specific information.
+ * @brief  JPEG SOS header Information
+ */
+struct vdec_jpeg_sos_component_hdr {
+	/* component identifier. */
+	unsigned char component_index;
+	/* Huffman DC tables. */
+	unsigned char dc_table;
+	/* Huffman AC table .*/
+	unsigned char ac_table;
+};
+
+struct vdec_jpeg_pict_hdr_info {
+	/* Start of frame component header */
+	struct vdec_jpeg_sof_component_hdr sof_comp[JPEG_VDEC_MAX_COMPONENTS];
+	/* Start of Scan component header */
+	struct vdec_jpeg_sos_component_hdr sos_comp[JPEG_VDEC_MAX_COMPONENTS];
+	/* Huffman tables */
+	struct vdec_jpeg_huffman_tableinfo huff_tables[JPEG_VDEC_TABLE_CLASS_NUM]
+						[JPEG_VDEC_MAX_SETS_HUFFMAN_TABLES];
+	/* Quantization tables */
+	struct vdec_jpeg_de_quant_tableinfo quant_tables[JPEG_VDEC_MAX_QUANT_TABLES];
+	/* Number of MCU in the restart interval */
+	unsigned short interval;
+	unsigned int test;
+};
+#endif
+
+#endif
diff --git a/drivers/staging/media/vxd/decoder/vxd_ext.h b/drivers/staging/media/vxd/decoder/vxd_ext.h
new file mode 100644
index 000000000000..fa92c9001c73
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/vxd_ext.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * VXD DEC Low-level device interface component
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Amit Makani <amit.makani@ti.com>
+ */
+
+#ifndef _VXD_EXT_H
+#define _VXD_EXT_H
+
+#define VLR_COMPLETION_COMMS_AREA_SIZE             476
+
+/* Word Size of buffer used to pass messages between LISR and HISR */
+#define VXD_SIZE_MSG_BUFFER   (1 * 1024)
+
+/* This structure describes macroblock coordinates. */
+struct vxd_mb_coords {
+	unsigned int x;
+	unsigned int y;
+};
+
+/* This structure contains firmware and decoding pipe state information. */
+struct vxd_pipestate {
+	unsigned char is_pipe_present;
+	unsigned char cur_codec;
+	unsigned int acheck_point[VDECFW_CHECKPOINT_MAX];
+	unsigned int firmware_action;
+	unsigned int fe_slices;
+	unsigned int be_slices;
+	unsigned int fe_errored_slices;
+	unsigned int be_errored_slices;
+	unsigned int be_mbs_dropped;
+	unsigned int be_mbs_recovered;
+	struct vxd_mb_coords fe_mb;
+	struct vxd_mb_coords be_mb;
+};
+
+/* This structure contains firmware and decoder core state information. */
+struct vxd_firmware_state {
+	unsigned int fw_step;
+	struct vxd_pipestate pipe_state[VDECFW_MAX_DP];
+};
+
+/* This structure contains the video decoder device state. */
+struct vxd_states {
+	struct vxd_firmware_state fw_state;
+};
+
+struct vxd_pict_attrs {
+	unsigned int dwrfired;
+	unsigned int mmufault;
+	unsigned int deverror;
+};
+
+/* This type defines the message attributes. */
+enum vxd_msg_attr {
+	VXD_MSG_ATTR_NONE        = 0,
+	VXD_MSG_ATTR_DECODED     = 1,
+	VXD_MSG_ATTR_FATAL       = 2,
+	VXD_MSG_ATTR_CANCELED    = 3,
+	VXD_MSG_ATTR_FORCE32BITS = 0x7FFFFFFFU
+};
+
+enum vxd_msg_flag {
+	VXD_MSG_FLAG_DROP        = 0,
+	VXD_MSG_FLAG_EXCL        = 1,
+	VXD_MSG_FLAG_FORCE32BITS = 0x7FFFFFFFU
+};
+
+#endif /* VXD_EXT_H */
diff --git a/drivers/staging/media/vxd/decoder/vxd_mmu_defs.h b/drivers/staging/media/vxd/decoder/vxd_mmu_defs.h
new file mode 100644
index 000000000000..77d493cb39f2
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/vxd_mmu_defs.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * V-DEC MMU Definitions
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Amit Makani <amit.makani@ti.com>
+ */
+
+#ifndef _VXD_MMU_DEF_H_
+#define _VXD_MMU_DEF_H_
+
+/*
+ * This type defines the MMU heaps.
+ * @0:	Heap for untiled video buffers
+ * @1:	Heap for bitstream buffers
+ * @2:	Heap for Stream buffers
+ * @3:	Number of heaps
+ */
+enum mmu_eheap_id {
+	MMU_HEAP_IMAGE_BUFFERS_UNTILED = 0x00,
+	MMU_HEAP_BITSTREAM_BUFFERS,
+	MMU_HEAP_STREAM_BUFFERS,
+	MMU_HEAP_MAX,
+	MMU_HEAP_FORCE32BITS           = 0x7FFFFFFFU
+};
+
+#endif /* _VXD_MMU_DEFS_H_ */
diff --git a/drivers/staging/media/vxd/decoder/vxd_props.h b/drivers/staging/media/vxd/decoder/vxd_props.h
new file mode 100644
index 000000000000..bdab182859a7
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/vxd_props.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Low-level VXD interface component
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Amit Makani <amit.makani@ti.com>
+ *
+ * Re-written for upstreamimg
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+
+#ifndef _VXD_PROPS_H
+#define _VXD_PROPS_H
+
+#include "vdec_defs.h"
+#include "imgmmu.h"
+
+#define VDEC_MAX_PIXEL_PIPES 2
+
+#define VXD_MAX_CORES    1
+#define VER_STR_LEN      64
+
+#define CORE_REVISION(maj, min, maint) \
+	((((maj) & 0xff) << 16) | (((min) & 0xff) << 8) | (((maint) & 0xff)))
+#define MAJOR_REVISION(rev)     (((rev) >> 16) & 0xff)
+#define MINOR_REVISION(rev)     (((rev) >> 8) & 0xff)
+#define MAINT_REVISION(rev)     ((rev) & 0xff)
+
+#define FROM_REV(maj, min, maint, type) \
+	({ \
+		type __maj = maj; \
+		type __min = min; \
+		(((maj_rev) > (__maj)) || \
+		 (((maj_rev) == (__maj)) && ((min_rev) > (__min))) || \
+		 (((maj_rev) == (__maj)) && ((min_rev) == (__min)) && \
+		  ((int)(maint_rev) >= (maint)))); })
+
+struct vxd_vidstd_props {
+	enum vdec_vid_std vidstd;
+	unsigned int core_rev;
+	unsigned int min_width;
+	unsigned int min_height;
+	unsigned int max_width;
+	unsigned int max_height;
+	unsigned int max_macroblocks;
+	unsigned int max_luma_bitdepth;
+	unsigned int max_chroma_bitdepth;
+	enum pixel_fmt_idc max_chroma_format;
+};
+
+struct vxd_coreprops {
+	unsigned char aversion[VER_STR_LEN];
+	unsigned char mpeg2[VDEC_MAX_PIXEL_PIPES];
+	unsigned char mpeg4[VDEC_MAX_PIXEL_PIPES];
+	unsigned char h264[VDEC_MAX_PIXEL_PIPES];
+	unsigned char vc1[VDEC_MAX_PIXEL_PIPES];
+	unsigned char avs[VDEC_MAX_PIXEL_PIPES];
+	unsigned char real[VDEC_MAX_PIXEL_PIPES];
+	unsigned char jpeg[VDEC_MAX_PIXEL_PIPES];
+	unsigned char vp6[VDEC_MAX_PIXEL_PIPES];
+	unsigned char vp8[VDEC_MAX_PIXEL_PIPES];
+	unsigned char hevc[VDEC_MAX_PIXEL_PIPES];
+	unsigned char rotation_support[VDEC_MAX_PIXEL_PIPES];
+	unsigned char scaling_support[VDEC_MAX_PIXEL_PIPES];
+	unsigned char hd_support;
+	unsigned int num_streams[VDEC_MAX_PIXEL_PIPES];
+	unsigned int num_entropy_pipes;
+	unsigned int num_pixel_pipes;
+	struct vxd_vidstd_props vidstd_props[VDEC_STD_MAX];
+	enum mmu_etype mmu_type;
+	unsigned char mmu_support_stride_per_context;
+	unsigned char mmu_support_secure;
+	/* Range extensions supported by hw -> used only by hevc */
+	unsigned char hevc_range_ext[VDEC_MAX_PIXEL_PIPES];
+};
+
+#endif /* _VXD_PROPS_H */
-- 
2.17.1


-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.
