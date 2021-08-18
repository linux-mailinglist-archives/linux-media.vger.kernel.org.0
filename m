Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADFB63F0631
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239340AbhHROQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239645AbhHROOL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:14:11 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADCBBC0612AD
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:45 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d17so1847744plr.12
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Batt2nhsVQjKsMfdRfW/cew9eUVfrx3QUnVyIa6Zsnc=;
        b=ZWwIaJLJ0zLij7Idwki2QEQbKe9y0yUKDAGEnx9IXIHSJsTTJ3JPz2l4rrNbzMyRKY
         kr67b3o0vZn/lTZfLmisqxS4m7+sDoPELij4nm7CT+bLGAyVJtQrT/qHUAULZWS58dSN
         6z2VD02z0COaZzzTFcD/e/9Z+kRfAbnUJyvEqmD0Nb5pl3wrRz7LTcNPdbwL8DRNmTYp
         wJ2tC7yQ7ZToHypPXdzFFyJMRnagscmHS1LQfiW4lRyUcjP7E1gAx4IYzEnm1++R0rdX
         xMsIXWPQU9BOcy/t8h0T8RdIDGPnK9tw0SbUkVHDlTbJsqPd7/py4hhdVvwVWb/GFfU9
         yHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=Batt2nhsVQjKsMfdRfW/cew9eUVfrx3QUnVyIa6Zsnc=;
        b=DO5ImwsfBj/PUPeDt+pVyU4l3QIBjZuOnmso0epUfhWow7KSUoC+xYK+H6kmHQn4jn
         KNFXlTsICQhqcvu/A1PUcDOdyz6GVXKIlGUs/1tF1opwY/dVWwqCOnvxpHIA5JC8BMan
         oks4f7UY6abJR6dcTgi2M+E3Yw8tCxg8mTaWltBAZEmz2u88tJjwsaKJ7AHBKpSvnpZC
         6L+vt1ptQ+2XWiv7hX3PwqesJHc6As3W/qytwTNucqMwFsq91u6D5Zs4Pb2dRX6rnSjL
         m4q86qiBL9rQ7bIinQsASDRL+fqNzHb/lzcsae4oNjP7VYyps2+OHpqerTsSha+tnwYP
         S4WA==
MIME-Version: 1.0
X-Gm-Message-State: AOAM532nSbqNBup7f2KvrGBVKDR13RQ8BvN3o7KE2vEIuZQMC9UnpBpF
        p1bMFW5xGTsm/nXx7/4sw1nNzQ6N+/c9DcRAQw6tKvTD7IkkC2rb+Enk774kYSgqImU1aD4YyfP
        vG7M38RZRTj3b6iv3HXbQSsq+oEo=
X-Google-Smtp-Source: ABdhPJzGhfRMFvbZfbIVumJxME2GqjrKX2THBXOu/UVgPn6LnZMK8Pk+DFp8/ssNvFycoJfatWGkKQ==
X-Received: by 2002:a17:90a:bc84:: with SMTP id x4mr9788014pjr.36.1629295964524;
        Wed, 18 Aug 2021 07:12:44 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.181])
        by smtp.gmail.com with ESMTPSA id e8sm8084343pgg.31.2021.08.18.07.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:12:43 -0700 (PDT)
From:   sidraya.bj@pathpartnertech.com
To:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com,
        Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH 15/30] v4l: vxd-dec: Add firmware interface headers
Date:   Wed, 18 Aug 2021 19:40:22 +0530
Message-Id: <20210818141037.19990-16-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="US-ASCII"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sidraya <sidraya.bj@pathpartnertech.com>

This patch includes IMG D5520 registers and firmware
headers and utility to decode the registers.

Signed-off-by: Amit Makani <amit.makani@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 MAINTAINERS                                   |  21 +
 drivers/staging/media/vxd/decoder/h264_idx.h  |  60 ++
 drivers/staging/media/vxd/decoder/h264_vlc.h  | 604 ++++++++++++
 .../media/vxd/decoder/h264fw_data_shared.h    | 759 +++++++++++++++
 .../media/vxd/decoder/hevcfw_data_shared.h    | 767 +++++++++++++++
 .../media/vxd/decoder/img_msvdx_cmds.h        | 279 ++++++
 .../media/vxd/decoder/img_msvdx_core_regs.h   |  22 +
 .../media/vxd/decoder/img_msvdx_vdmc_regs.h   |  26 +
 .../media/vxd/decoder/img_msvdx_vec_regs.h    |  60 ++
 .../media/vxd/decoder/img_pvdec_core_regs.h   |  60 ++
 .../media/vxd/decoder/img_pvdec_pixel_regs.h  |  35 +
 .../media/vxd/decoder/img_pvdec_test_regs.h   |  39 +
 .../media/vxd/decoder/img_vdec_fw_msg.h       | 192 ++++
 .../vxd/decoder/img_video_bus4_mmu_regs.h     | 120 +++
 .../media/vxd/decoder/jpegfw_data_shared.h    |  84 ++
 drivers/staging/media/vxd/decoder/mem_io.h    |  42 +
 .../media/vxd/decoder/pvdec_entropy_regs.h    |  33 +
 drivers/staging/media/vxd/decoder/pvdec_int.h |  82 ++
 .../media/vxd/decoder/pvdec_vec_be_regs.h     |  35 +
 drivers/staging/media/vxd/decoder/reg_io2.h   |  74 ++
 .../staging/media/vxd/decoder/vdecfw_share.h  |  36 +
 .../staging/media/vxd/decoder/vdecfw_shared.h | 893 ++++++++++++++++++
 22 files changed, 4323 insertions(+)
 create mode 100644 drivers/staging/media/vxd/decoder/h264_idx.h
 create mode 100644 drivers/staging/media/vxd/decoder/h264_vlc.h
 create mode 100644 drivers/staging/media/vxd/decoder/h264fw_data_shared.h
 create mode 100644 drivers/staging/media/vxd/decoder/hevcfw_data_shared.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_msvdx_cmds.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_msvdx_core_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_msvdx_vdmc_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_msvdx_vec_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_pvdec_core_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_pvdec_pixel_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_pvdec_test_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_vdec_fw_msg.h
 create mode 100644 drivers/staging/media/vxd/decoder/img_video_bus4_mmu_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/jpegfw_data_shared.h
 create mode 100644 drivers/staging/media/vxd/decoder/mem_io.h
 create mode 100644 drivers/staging/media/vxd/decoder/pvdec_entropy_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/pvdec_int.h
 create mode 100644 drivers/staging/media/vxd/decoder/pvdec_vec_be_regs.h
 create mode 100644 drivers/staging/media/vxd/decoder/reg_io2.h
 create mode 100644 drivers/staging/media/vxd/decoder/vdecfw_share.h
 create mode 100644 drivers/staging/media/vxd/decoder/vdecfw_shared.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c7a6a0974415..a00ac0852b2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19566,21 +19566,40 @@ F:	drivers/staging/media/vxd/decoder/bspp.c
 F:	drivers/staging/media/vxd/decoder/bspp.h
 F:	drivers/staging/media/vxd/decoder/bspp_int.h
 F:	drivers/staging/media/vxd/decoder/fw_interface.h
+F:	drivers/staging/media/vxd/decoder/h264_idx.h
 F:	drivers/staging/media/vxd/decoder/h264_secure_parser.c
 F:	drivers/staging/media/vxd/decoder/h264_secure_parser.h
+F:	drivers/staging/media/vxd/decoder/h264_vlc.h
 F:	drivers/staging/media/vxd/decoder/h264fw_data.h
+F:	drivers/staging/media/vxd/decoder/h264fw_data_shared.h
 F:	drivers/staging/media/vxd/decoder/hevc_secure_parser.c
 F:	drivers/staging/media/vxd/decoder/hevc_secure_parser.h
 F:	drivers/staging/media/vxd/decoder/hevcfw_data.h
+F:	drivers/staging/media/vxd/decoder/hevcfw_data_shared.h
 F:	drivers/staging/media/vxd/decoder/hw_control.c
 F:	drivers/staging/media/vxd/decoder/hw_control.h
 F:	drivers/staging/media/vxd/decoder/img_dec_common.h
+F:	drivers/staging/media/vxd/decoder/img_msvdx_cmds.h
+F:	drivers/staging/media/vxd/decoder/img_msvdx_core_regs.h
+F:	drivers/staging/media/vxd/decoder/img_msvdx_vdmc_regs.h
+F:	drivers/staging/media/vxd/decoder/img_msvdx_vec_regs.h
 F:	drivers/staging/media/vxd/decoder/img_pixfmts.h
 F:	drivers/staging/media/vxd/decoder/img_profiles_levels.h
+F:	drivers/staging/media/vxd/decoder/img_pvdec_core_regs.h
+F:	drivers/staging/media/vxd/decoder/img_pvdec_pixel_regs.h
+F:	drivers/staging/media/vxd/decoder/img_pvdec_test_regs.h
+F:	drivers/staging/media/vxd/decoder/img_vdec_fw_msg.h
+F:	drivers/staging/media/vxd/decoder/img_video_bus4_mmu_regs.h
 F:	drivers/staging/media/vxd/decoder/jpeg_secure_parser.c
 F:	drivers/staging/media/vxd/decoder/jpeg_secure_parser.h
 F:	drivers/staging/media/vxd/decoder/jpegfw_data.h
+F:	drivers/staging/media/vxd/decoder/jpegfw_data_shared.h
+F:	drivers/staging/media/vxd/decoder/mem_io.h
 F:	drivers/staging/media/vxd/decoder/mmu_defs.h
+F:	drivers/staging/media/vxd/decoder/pvdec_entropy_regs.h
+F:	drivers/staging/media/vxd/decoder/pvdec_int.h
+F:	drivers/staging/media/vxd/decoder/pvdec_vec_be_regs.h
+F:	drivers/staging/media/vxd/decoder/reg_io2.h
 F:	drivers/staging/media/vxd/decoder/scaler_setup.h
 F:	drivers/staging/media/vxd/decoder/swsr.c
 F:	drivers/staging/media/vxd/decoder/swsr.h
@@ -19589,6 +19608,8 @@ F:	drivers/staging/media/vxd/decoder/translation_api.h
 F:	drivers/staging/media/vxd/decoder/vdec_defs.h
 F:	drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.c
 F:	drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.h
+F:	drivers/staging/media/vxd/decoder/vdecfw_share.h
+F:	drivers/staging/media/vxd/decoder/vdecfw_shared.h
 F:	drivers/staging/media/vxd/decoder/vxd_core.c
 F:	drivers/staging/media/vxd/decoder/vxd_dec.c
 F:	drivers/staging/media/vxd/decoder/vxd_dec.h
diff --git a/drivers/staging/media/vxd/decoder/h264_idx.h b/drivers/staging/media/vxd/decoder/h264_idx.h
new file mode 100644
index 000000000000..5fd050f664b3
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/h264_idx.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * h264 idx table definitions
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Angela Stegmaier <angelabaker@ti.com>
+ */
+
+#ifndef __H264_IDX_H__
+#define __H264_IDX_H__
+
+#include <linux/types.h>
+
+static unsigned short h264_vlc_index_data[38][3] = {
+	{ 2, 5, 0   },  /* NumCoeffTrailingOnes_Table9-5_nC_0-1.out */
+	{ 0, 3, 76  },  /* NumCoeffTrailingOnes_Table9-5_nC_2-3.out */
+	{ 0, 3, 160 },  /* NumCoeffTrailingOnes_Table9-5_nC_4-7.out */
+	{ 0, 2, 231 },  /* NumCoeffTrailingOnesFixedLen.out */
+	{ 2, 2, 244 },  /* NumCoeffTrailingOnesChromaDC_YUV420.out */
+	{ 2, 5, 261 },  /* NumCoeffTrailingOnesChromaDC_YUV422.out */
+	{ 2, 5, 301 },  /* TotalZeros_00.out */
+	{ 0, 2, 326 },  /* TotalZeros_01.out */
+	{ 0, 2, 345 },  /* TotalZeros_02.out */
+	{ 0, 2, 363 },  /* TotalZeros_03.out */
+	{ 0, 2, 379 },  /* TotalZeros_04.out */
+	{ 0, 2, 394 },  /* TotalZeros_05.out */
+	{ 0, 2, 406 },  /* TotalZeros_06.out */
+	{ 0, 1, 418 },  /* TotalZeros_07.out */
+	{ 0, 1, 429 },  /* TotalZeros_08.out */
+	{ 0, 1, 438 },  /* TotalZeros_09.out */
+	{ 2, 2, 446 },  /* TotalZeros_10.out */
+	{ 2, 2, 452 },  /* TotalZeros_11.out */
+	{ 2, 1, 456 },  /* TotalZeros_12.out */
+	{ 0, 0, 459 },  /* TotalZeros_13.out */
+	{ 0, 0, 461 },  /* TotalZeros_14.out */
+	{ 2, 2, 463 },  /* TotalZerosChromaDC_YUV420_00.out */
+	{ 2, 1, 467 },  /* TotalZerosChromaDC_YUV420_01.out */
+	{ 0, 0, 470 },  /* TotalZerosChromaDC_YUV420_02.out */
+	{ 0, 0, 472 },  /* Run_00.out */
+	{ 2, 1, 474 },  /* Run_01.out */
+	{ 0, 1, 477 },  /* Run_02.out */
+	{ 0, 1, 481 },  /* Run_03.out */
+	{ 1, 1, 487 },  /* Run_04.out */
+	{ 0, 2, 494 },  /* Run_05.out */
+	{ 0, 2, 502 },  /* Run_06.out */
+	{ 2, 4, 520 },  /* TotalZerosChromaDC_YUV422_00.out */
+	{ 2, 2, 526 },  /* TotalZerosChromaDC_YUV422_01.out */
+	{ 0, 1, 530 },  /* TotalZerosChromaDC_YUV422_02.out */
+	{ 1, 2, 534 },  /* TotalZerosChromaDC_YUV422_03.out */
+	{ 0, 0, 538 },  /* TotalZerosChromaDC_YUV422_04.out */
+	{ 0, 0, 540 },  /* TotalZerosChromaDC_YUV422_05.out */
+	{ 0, 0, 542 },  /* TotalZerosChromaDC_YUV422_06.out */
+};
+
+static const unsigned char h264_vlc_index_size = 38;
+
+#endif
diff --git a/drivers/staging/media/vxd/decoder/h264_vlc.h b/drivers/staging/media/vxd/decoder/h264_vlc.h
new file mode 100644
index 000000000000..7cd79ada8ecc
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/h264_vlc.h
@@ -0,0 +1,604 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * h264 vlc table definitions
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Angela Stegmaier <angelabaker@ti.com>
+ */
+
+#ifndef __H264_VLC_H__
+#define __H264_VLC_H__
+
+#include <linux/types.h>
+
+static unsigned short h264_vlc_table_data[] = {
+/* NumCoeffTrailingOnes_Table9-5_nC_0-1.out */
+	4, 0, 0,
+	4, 1, 5,
+	4, 2, 10,
+	2, 1, 4,
+	2, 1, 6,
+	0, 1, 8,
+	0, 2, 11,
+	4, 0, 15,
+	4, 1, 4,
+	4, 1, 9,
+	4, 0, 19,
+	4, 1, 14,
+	4, 1, 23,
+	4, 1, 27,
+	4, 1, 18,
+	4, 1, 13,
+	4, 1, 8,
+	2, 5, 8,
+	0, 1, 50,
+	0, 0, 53,
+	0, 0, 54,
+	4, 2, 31,
+	4, 2, 22,
+	4, 2, 17,
+	4, 2, 12,
+	0, 2, 7,
+	0, 2, 14,
+	0, 2, 21,
+	0, 2, 28,
+	0, 1, 35,
+	4, 5, 53,
+	3, 5, 0,
+	4, 2, 32,
+	4, 2, 38,
+	4, 2, 33,
+	4, 2, 28,
+	4, 2, 43,
+	4, 2, 34,
+	4, 2, 29,
+	4, 2, 24,
+	4, 2, 51,
+	4, 2, 46,
+	4, 2, 41,
+	4, 2, 40,
+	4, 2, 47,
+	4, 2, 42,
+	4, 2, 37,
+	4, 2, 36,
+	4, 2, 59,
+	4, 2, 54,
+	4, 2, 49,
+	4, 2, 48,
+	4, 2, 55,
+	4, 2, 50,
+	4, 2, 45,
+	4, 2, 44,
+	4, 2, 67,
+	4, 2, 62,
+	4, 2, 61,
+	4, 2, 56,
+	4, 2, 63,
+	4, 2, 58,
+	4, 2, 57,
+	4, 2, 52,
+	4, 1, 64,
+	4, 1, 66,
+	4, 1, 65,
+	4, 1, 60,
+	4, 1, 39,
+	4, 1, 30,
+	4, 1, 25,
+	4, 1, 20,
+	4, 0, 35,
+	4, 0, 26,
+	4, 0, 21,
+	4, 0, 16,
+/* NumCoeffTrailingOnes_Table9-5_nC_2-3.out */
+	0, 2, 16,
+	0, 1, 73,
+	0, 1, 76,
+	0, 0, 79,
+	4, 3, 19,
+	4, 3, 15,
+	4, 2, 10,
+	4, 2, 10,
+	4, 1, 5,
+	4, 1, 5,
+	4, 1, 5,
+	4, 1, 5,
+	4, 1, 0,
+	4, 1, 0,
+	4, 1, 0,
+	4, 1, 0,
+	2, 5, 8,
+	0, 1, 49,
+	0, 0, 52,
+	0, 0, 53,
+	4, 2, 35,
+	4, 2, 22,
+	4, 2, 21,
+	4, 2, 12,
+	0, 2, 7,
+	0, 2, 14,
+	0, 2, 21,
+	1, 1, 28,
+	0, 1, 34,
+	4, 5, 63,
+	3, 5, 0,
+	4, 2, 47,
+	4, 2, 38,
+	4, 2, 37,
+	4, 2, 32,
+	4, 2, 43,
+	4, 2, 34,
+	4, 2, 33,
+	4, 2, 28,
+	4, 2, 44,
+	4, 2, 46,
+	4, 2, 45,
+	4, 2, 40,
+	4, 2, 51,
+	4, 2, 42,
+	4, 2, 41,
+	4, 2, 36,
+	4, 2, 59,
+	4, 2, 54,
+	4, 2, 53,
+	4, 2, 52,
+	4, 2, 55,
+	4, 2, 50,
+	4, 2, 49,
+	4, 2, 48,
+	0, 1, 3,
+	4, 1, 58,
+	4, 1, 56,
+	4, 1, 61,
+	4, 1, 60,
+	4, 1, 62,
+	4, 1, 57,
+	4, 1, 67,
+	4, 1, 66,
+	4, 1, 65,
+	4, 1, 64,
+	4, 1, 39,
+	4, 1, 30,
+	4, 1, 29,
+	4, 1, 24,
+	4, 0, 20,
+	4, 0, 26,
+	4, 0, 25,
+	4, 0, 16,
+	4, 1, 31,
+	4, 1, 18,
+	4, 1, 17,
+	4, 1, 8,
+	4, 1, 27,
+	4, 1, 14,
+	4, 1, 13,
+	4, 1, 4,
+	4, 0, 23,
+	4, 0, 9,
+/* NumCoeffTrailingOnes_Table9-5_nC_4-7.out */
+	2, 1, 16,
+	0, 2, 50,
+	0, 1, 57,
+	0, 1, 60,
+	6, 0, 10,
+	6, 0, 8,
+	0, 0, 61,
+	0, 0, 62,
+	4, 3, 31,
+	4, 3, 27,
+	4, 3, 23,
+	4, 3, 19,
+	4, 3, 15,
+	4, 3, 10,
+	4, 3, 5,
+	4, 3, 0,
+	0, 2, 3,
+	0, 2, 10,
+	0, 3, 17,
+	4, 2, 51,
+	4, 2, 46,
+	4, 2, 41,
+	4, 2, 36,
+	4, 2, 47,
+	4, 2, 42,
+	4, 2, 37,
+	4, 2, 32,
+	4, 2, 48,
+	4, 2, 54,
+	4, 2, 49,
+	4, 2, 44,
+	4, 2, 55,
+	4, 2, 50,
+	4, 2, 45,
+	4, 2, 40,
+	3, 3, 0,
+	4, 3, 64,
+	4, 3, 67,
+	4, 3, 66,
+	4, 3, 65,
+	4, 3, 60,
+	4, 3, 63,
+	4, 3, 62,
+	4, 3, 61,
+	4, 3, 56,
+	4, 3, 59,
+	4, 3, 58,
+	4, 3, 57,
+	4, 3, 52,
+	4, 2, 53,
+	4, 2, 53,
+	4, 2, 28,
+	4, 2, 24,
+	4, 2, 38,
+	4, 2, 20,
+	4, 2, 43,
+	4, 2, 34,
+	4, 2, 33,
+	4, 2, 16,
+	4, 1, 12,
+	4, 1, 30,
+	4, 1, 29,
+	4, 1, 8,
+	4, 1, 39,
+	4, 1, 26,
+	4, 1, 25,
+	4, 1, 4,
+	4, 0, 13,
+	4, 0, 35,
+	4, 0, 14,
+	4, 0, 9,
+/* NumCoeffTrailingOnesFixedLen.out */
+	2, 1, 8,
+	5, 2, 6,
+	5, 2, 10,
+	5, 2, 14,
+	5, 2, 18,
+	5, 2, 22,
+	5, 2, 26,
+	5, 2, 30,
+	5, 1, 4,
+	0, 0, 2,
+	5, 0, 2,
+	3, 0, 0,
+	4, 0, 0,
+/* NumCoeffTrailingOnesChromaDC_YUV420.out */
+	4, 0, 5,
+	4, 1, 0,
+	4, 2, 10,
+	0, 2, 1,
+	1, 1, 8,
+	0, 0, 10,
+	4, 2, 16,
+	4, 2, 12,
+	4, 2, 8,
+	4, 2, 15,
+	4, 2, 9,
+	4, 2, 4,
+	4, 0, 19,
+	4, 1, 18,
+	4, 1, 17,
+	4, 0, 14,
+	4, 0, 13,
+/* NumCoeffTrailingOnesChromaDC_YUV422.out */
+	4, 0, 0,
+	4, 1, 5,
+	4, 2, 10,
+	0, 2, 4,
+	4, 4, 15,
+	4, 5, 19,
+	2, 3, 9,
+	4, 2, 27,
+	4, 2, 23,
+	4, 2, 18,
+	4, 2, 14,
+	4, 2, 13,
+	4, 2, 9,
+	4, 2, 8,
+	4, 2, 4,
+	0, 1, 5,
+	0, 1, 8,
+	0, 1, 11,
+	0, 1, 14,
+	1, 2, 17,
+	4, 1, 22,
+	4, 1, 17,
+	4, 1, 16,
+	4, 1, 12,
+	4, 1, 31,
+	4, 1, 26,
+	4, 1, 21,
+	4, 1, 20,
+	4, 1, 35,
+	4, 1, 30,
+	4, 1, 25,
+	4, 1, 24,
+	4, 1, 34,
+	4, 1, 33,
+	4, 1, 29,
+	4, 1, 28,
+	3, 2, 0,
+	3, 2, 0,
+	3, 2, 0,
+	4, 2, 32,
+/* TotalZeros_00.out */
+	4, 0, 0,
+	0, 0, 6,
+	0, 0, 7,
+	0, 0, 8,
+	0, 0, 9,
+	0, 0, 10,
+	0, 2, 11,
+	4, 0, 2,
+	4, 0, 1,
+	4, 0, 4,
+	4, 0, 3,
+	4, 0, 6,
+	4, 0, 5,
+	4, 0, 8,
+	4, 0, 7,
+	4, 0, 10,
+	4, 0, 9,
+	3, 2, 0,
+	4, 2, 15,
+	4, 2, 14,
+	4, 2, 13,
+	4, 1, 12,
+	4, 1, 12,
+	4, 1, 11,
+	4, 1, 11,
+/* TotalZeros_01.out */
+	1, 1, 8,
+	0, 0, 14,
+	0, 0, 15,
+	4, 2, 4,
+	4, 2, 3,
+	4, 2, 2,
+	4, 2, 1,
+	4, 2, 0,
+	0, 1, 3,
+	4, 1, 10,
+	4, 1, 9,
+	4, 1, 14,
+	4, 1, 13,
+	4, 1, 12,
+	4, 1, 11,
+	4, 0, 8,
+	4, 0, 7,
+	4, 0, 6,
+	4, 0, 5,
+/* TotalZeros_02.out */
+	0, 1, 8,
+	0, 0, 13,
+	0, 0, 14,
+	4, 2, 7,
+	4, 2, 6,
+	4, 2, 3,
+	4, 2, 2,
+	4, 2, 1,
+	0, 0, 4,
+	4, 1, 12,
+	4, 1, 10,
+	4, 1, 9,
+	4, 0, 13,
+	4, 0, 11,
+	4, 0, 8,
+	4, 0, 5,
+	4, 0, 4,
+	4, 0, 0,
+/* TotalZeros_03.out */
+	0, 1, 8,
+	0, 0, 11,
+	0, 0, 12,
+	4, 2, 8,
+	4, 2, 6,
+	4, 2, 5,
+	4, 2, 4,
+	4, 2, 1,
+	4, 1, 12,
+	4, 1, 11,
+	4, 1, 10,
+	4, 1, 0,
+	4, 0, 9,
+	4, 0, 7,
+	4, 0, 3,
+	4, 0, 2,
+/* TotalZeros_04.out */
+	2, 1, 8,
+	0, 0, 10,
+	0, 0, 11,
+	4, 2, 7,
+	4, 2, 6,
+	4, 2, 5,
+	4, 2, 4,
+	4, 2, 3,
+	4, 0, 10,
+	4, 1, 9,
+	4, 1, 11,
+	4, 0, 8,
+	4, 0, 2,
+	4, 0, 1,
+	4, 0, 0,
+/* TotalZeros_05.out */
+	2, 2, 8,
+	4, 2, 9,
+	4, 2, 7,
+	4, 2, 6,
+	4, 2, 5,
+	4, 2, 4,
+	4, 2, 3,
+	4, 2, 2,
+	4, 0, 8,
+	4, 1, 1,
+	4, 2, 0,
+	4, 2, 10,
+/* TotalZeros_06.out */
+	2, 2, 8,
+	4, 2, 8,
+	4, 2, 6,
+	4, 2, 4,
+	4, 2, 3,
+	4, 2, 2,
+	4, 1, 5,
+	4, 1, 5,
+	4, 0, 7,
+	4, 1, 1,
+	4, 2, 0,
+	4, 2, 9,
+/* TotalZeros_07.out */
+	2, 3, 4,
+	0, 0, 8,
+	4, 1, 5,
+	4, 1, 4,
+	4, 0, 7,
+	4, 1, 1,
+	4, 2, 2,
+	4, 3, 0,
+	4, 3, 8,
+	4, 0, 6,
+	4, 0, 3,
+/* TotalZeros_08.out */
+	2, 3, 4,
+	4, 1, 6,
+	4, 1, 4,
+	4, 1, 3,
+	4, 0, 5,
+	4, 1, 2,
+	4, 2, 7,
+	4, 3, 0,
+	4, 3, 1,
+/* TotalZeros_09.out */
+	2, 2, 4,
+	4, 1, 5,
+	4, 1, 4,
+	4, 1, 3,
+	4, 0, 2,
+	4, 1, 6,
+	4, 2, 0,
+	4, 2, 1,
+/* TotalZeros_10.out */
+	4, 0, 4,
+	0, 0, 3,
+	4, 2, 2,
+	5, 0, 0,
+	4, 0, 3,
+	4, 0, 5,
+/* TotalZeros_11.out */
+	4, 0, 3,
+	4, 1, 2,
+	4, 2, 4,
+	5, 0, 0,
+/* TotalZeros_12.out */
+	4, 0, 2,
+	4, 1, 3,
+	5, 0, 0,
+/* TotalZeros_13.out */
+	5, 0, 0,
+	4, 0, 2,
+/* TotalZeros_14.out */
+	4, 0, 0,
+	4, 0, 1,
+/* TotalZerosChromaDC_YUV420_00.out */
+	4, 0, 0,
+	4, 1, 1,
+	4, 2, 2,
+	4, 2, 3,
+/* TotalZerosChromaDC_YUV420_01.out */
+	4, 0, 0,
+	4, 1, 1,
+	4, 1, 2,
+/* TotalZerosChromaDC_YUV420_02.out */
+	4, 0, 1,
+	4, 0, 0,
+/* Run_00.out */
+	4, 0, 1,
+	4, 0, 0,
+/* Run_01.out */
+	4, 0, 0,
+	4, 1, 1,
+	4, 1, 2,
+/* Run_02.out */
+	4, 1, 3,
+	4, 1, 2,
+	4, 1, 1,
+	4, 1, 0,
+/* Run_03.out */
+	0, 0, 4,
+	4, 1, 2,
+	4, 1, 1,
+	4, 1, 0,
+	4, 0, 4,
+	4, 0, 3,
+/* Run_04.out */
+	0, 1, 3,
+	4, 1, 1,
+	4, 1, 0,
+	4, 1, 5,
+	4, 1, 4,
+	4, 1, 3,
+	4, 1, 2,
+/* Run_05.out */
+	4, 2, 1,
+	4, 2, 2,
+	4, 2, 4,
+	4, 2, 3,
+	4, 2, 6,
+	4, 2, 5,
+	4, 1, 0,
+	4, 1, 0,
+/* Run_06.out */
+	2, 5, 8,
+	4, 2, 6,
+	4, 2, 5,
+	4, 2, 4,
+	4, 2, 3,
+	4, 2, 2,
+	4, 2, 1,
+	4, 2, 0,
+	4, 0, 7,
+	4, 1, 8,
+	4, 2, 9,
+	4, 3, 10,
+	4, 4, 11,
+	4, 5, 12,
+	2, 1, 1,
+	4, 0, 13,
+	4, 1, 14,
+	3, 1, 0,
+/* TotalZerosChromaDC_YUV422_00.out */
+	4, 0, 0,
+	6, 0, 0,
+	6, 0, 1,
+	4, 3, 5,
+	4, 4, 6,
+	4, 4, 7,
+/* TotalZerosChromaDC_YUV422_01.out */
+	6, 1, 1,
+	4, 1, 1,
+	4, 2, 2,
+	4, 2, 0,
+/* TotalZerosChromaDC_YUV422_02.out */
+	5, 0, 0,
+	4, 1, 2,
+	4, 1, 3,
+	5, 0, 2,
+/* TotalZerosChromaDC_YUV422_03.out */
+	6, 0, 0,
+	4, 1, 3,
+	4, 2, 0,
+	4, 2, 4,
+/* TotalZerosChromaDC_YUV422_04.out */
+	5, 0, 0,
+	5, 0, 1,
+/* TotalZerosChromaDC_YUV422_05.out */
+	5, 0, 0,
+	4, 0, 2,
+/* TotalZerosChromaDC_YUV422_06.out */
+	4, 0, 0,
+	4, 0, 1
+};
+
+static const unsigned short h264_vlc_table_size = 544;
+
+#endif
diff --git a/drivers/staging/media/vxd/decoder/h264fw_data_shared.h b/drivers/staging/media/vxd/decoder/h264fw_data_shared.h
new file mode 100644
index 000000000000..b8efd5f4c2f5
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/h264fw_data_shared.h
@@ -0,0 +1,759 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Public data structures for the h264 parser firmware module
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
+#ifdef USE_SHARING
+#endif
+
+#ifndef _H264FW_DATA_H_
+#define _H264FW_DATA_H_
+
+#include "vdecfw_share.h"
+#include "vdecfw_shared.h"
+
+#define H264_MAX_SPS_COUNT 32
+#define H264_MAX_PPS_COUNT 256
+
+#define H264_SCALING_LISTS_NUM_CHROMA_IDC_NON_3 (8)
+#define H264_SCALING_LISTS_NUM_CHROMA_IDC_3 (12)
+#define MAX_PIC_SCALING_LIST (12)
+
+/* Maximum number of alternative CPB specifications in the stream */
+#define H264_MAXIMUMVALUEOFCPB_CNT 32
+
+/*
+ * The maximum DPB size is related to the number of MVC views supported
+ * The size is defined in H.10.2 for the H.264 spec.
+ * If the number of views needs to be changed the DPB size should be too
+ * The limits are as follows:
+ * NumViews: 1, 2, 4, 8, 16
+ * MaxDpbFrames: 16, 16, 32, 48, 64
+ */
+
+#define H264FW_MAX_NUM_VIEWS 1
+#define H264FW_MAX_DPB_SIZE 16
+#define H264FW_MAX_NUM_MVC_REFS 1
+
+/* Number of H264 VLC table configuration registers */
+#define H264FW_NUM_VLC_REG 22
+
+/* Maximum value for num_ref_frames_in_pic_order_cnt_cycle */
+#define H264FW_MAX_CYCLE_REF_FRAMES 256
+
+/* 4x4 scaling list size */
+#define H264FW_4X4_SIZE 16
+/* 8x8 scaling list size */
+#define H264FW_8X8_SIZE 64
+/* Number of 4x4 scaling lists */
+#define H264FW_NUM_4X4_LISTS 6
+/* Number of 8x8 scaling lists */
+#define H264FW_NUM_8X8_LISTS 6
+
+/* Number of reference picture lists */
+#define H264FW_MAX_REFPIC_LISTS 2
+
+/*
+ * The maximum number of slice groups
+ * remove if slice group map is prepared on the host
+ */
+#define H264FW_MAX_SLICE_GROUPS 8
+
+/* The maximum number of planes for 4:4:4 separate colour plane streams */
+#define H264FW_MAX_PLANES 3
+
+#define H264_MAX_SGM_SIZE 8196
+
+#define IS_H264_HIGH_PROFILE(profile_idc, type) \
+	({ \
+		type __profile_idc = profile_idc; \
+		(__profile_idc == H264_PROFILE_HIGH) || \
+		(__profile_idc == H264_PROFILE_HIGH10) || \
+		(__profile_idc == H264_PROFILE_HIGH422) || \
+		(__profile_idc == H264_PROFILE_HIGH444) || \
+		(__profile_idc == H264_PROFILE_CAVLC444) || \
+		(__profile_idc == H264_PROFILE_MVC_HIGH) || \
+		(__profile_idc == H264_PROFILE_MVC_STEREO); })  \
+
+/* This type describes the H.264 NAL unit types */
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
+/* AVC Profile IDC definitions */
+enum h264_eprofileidc {
+	H264_PROFILE_CAVLC444    = 44,
+	H264_PROFILE_BASELINE    = 66,
+	H264_PROFILE_MAIN        = 77,
+	H264_PROFILE_SCALABLE    = 83,
+	H264_PROFILE_EXTENDED    = 88,
+	H264_PROFILE_HIGH        = 100,
+	H264_PROFILE_HIGH10      = 110,
+	H264_PROFILE_MVC_HIGH    = 118,
+	H264_PROFILE_HIGH422     = 122,
+	H264_PROFILE_MVC_STEREO  = 128,
+	H264_PROFILE_HIGH444     = 244,
+	H264_PROFILE_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/* This type defines the constraint set flags */
+enum h264fw_econstraint_flag {
+	H264FW_CONSTRAINT_BASELINE_SHIFT   = 7,
+	H264FW_CONSTRAINT_MAIN_SHIFT       = 6,
+	H264FW_CONSTRAINT_EXTENDED_SHIFT   = 5,
+	H264FW_CONSTRAINT_INTRA_SHIFT      = 4,
+	H264FW_CONSTRAINT_MULTIHIGH_SHIFT  = 3,
+	H264FW_CONSTRAINT_STEREOHIGH_SHIFT = 2,
+	H264FW_CONSTRAINT_RESERVED6_SHIFT  = 1,
+	H264FW_CONSTRAINT_RESERVED7_SHIFT  = 0,
+	H264FW_CONSTRAINT_FORCE32BITS      = 0x7FFFFFFFU
+};
+
+/*
+ * This enum describes the reference status of an H.264 picture.
+ *
+ * Unpaired fields should have all eRefStatusX set to the same value
+ *
+ * For Frame, Mbaff, and Pair types individual fields and frame ref status
+ * should be set accordingly.
+ *
+ * eRefStatusFrame eRefStatusTop eRefStatusBottom
+ * UNUSED UNUSED UNUSED
+ * SHORTTERM SHORTTERM SHORTTERM
+ * LONGTERM LONGTERM LONGTERM
+ *
+ * UNUSED SHORT/LONGTERM UNUSED
+ * UNUSED UNUSED SHORT/LONGTERM
+ *
+ * SHORTTERM LONGTERM SHORTTERM
+ * SHORTTERM SHORTTERM LONGTERM
+ * - NB: It is not clear from the spec if the Frame should be marked as short
+ * or long term in this case
+ */
+enum h264fw_ereference {
+	H264FW_REF_UNUSED      = 0,
+	H264FW_REF_SHORTTERM,
+	H264FW_REF_LONGTERM,
+	H264FW_REF_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/* This type defines the picture structure. */
+enum h264fw_epicture_type {
+	H264FW_TYPE_NONE = 0,
+	H264FW_TYPE_TOP,
+	H264FW_TYPE_BOTTOM,
+	H264FW_TYPE_FRAME,
+	H264FW_TYPE_MBAFF,
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
+
+	/* syntax element from bitstream - 8 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, profile_idc);
+	/* syntax element from bitstream - 2 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, chroma_format_idc);
+	/* syntax element from bitstream - 1 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, separate_colour_plane_flag);
+	/* syntax element from bitstream - 3 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, bit_depth_luma_minus8);
+	/* syntax element from bitstream - 3 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, bit_depth_chroma_minus8);
+	/* syntax element from bitstream - 1 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, delta_pic_order_always_zero_flag);
+	/* syntax element from bitstream - 4+ bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, log2_max_pic_order_cnt_lsb);
+
+	/* syntax element from bitstream - 5 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, max_num_ref_frames);
+	/* syntax element from bitstream - 4+ bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, log2_max_frame_num);
+	/* syntax element from bitstream - 2 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, pic_order_cnt_type);
+	/* syntax element from bitstream - 1 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, frame_mbs_only_flag);
+	/* syntax element from bitstream - 1 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, gaps_in_frame_num_value_allowed_flag);
+
+	/*
+	 * set0--7 flags as they occur in the bitstream
+	 * (including reserved values)
+	 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, constraint_set_flags);
+	/* syntax element from bitstream - 8 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, level_idc);
+	/* syntax element from bitstream - 8 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_ref_frames_in_pic_order_cnt_cycle);
+
+	/* syntax element from bitstream - 1 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, mb_adaptive_frame_field_flag);
+	/* syntax element from bitstream - 32 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, offset_for_non_ref_pic);
+	/* syntax element from bitstream - 32 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, offset_for_top_to_bottom_field);
+
+	/* syntax element from bitstream */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, pic_width_in_mbs_minus1);
+	/* syntax element from bitstream */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, pic_height_in_map_units_minus1);
+	/* syntax element from bitstream - 1 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, direct_8x8_inference_flag);
+	/* syntax element from bitstream */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, qpprime_y_zero_transform_bypass_flag);
+
+	/* syntax element from bitstream - 32 bit each */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, offset_for_ref_frame[H264FW_MAX_CYCLE_REF_FRAMES]);
+
+	/* From VUI information */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_reorder_frames);
+	/*
+	 * From VUI/MVC SEI, 0 indicates not set, any actual 0
+	 * value will be inferred by the firmware
+	 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, max_dec_frame_buffering);
+
+	/* From SPS MVC Extension - for the current view_id */
+
+	/* Number of views in this stream */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_views);
+	/* a Map in order of VOIdx of view_id's */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, view_ids[H264FW_MAX_NUM_VIEWS]);
+
+	/* Disable VDMC horizontal/vertical filtering */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, disable_vdmc_filt);
+	/* Disable CABAC 4:4:4 4x4 transform as not available */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, transform4x4_mb_not_available);
+
+	/* anchor reference list */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned short,
+			anchor_inter_view_reference_id_list[2][H264FW_MAX_NUM_VIEWS]
+			[H264FW_MAX_NUM_MVC_REFS]);
+	/* nonanchor reference list */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned short,
+			non_anchor_inter_view_reference_id_list[2][H264FW_MAX_NUM_VIEWS]
+			[H264FW_MAX_NUM_MVC_REFS]);
+	/* number of elements in aui16AnchorInterViewReferenceIndiciesLX[] */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned short,
+			num_anchor_refsx[2][H264FW_MAX_NUM_VIEWS]);
+	/* number of elements in aui16NonAnchorInterViewReferenceIndiciesLX[] */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned short,
+			num_non_anchor_refsx[2][H264FW_MAX_NUM_VIEWS]);
+};
+
+/*
+ * This structure represents HRD parameters.
+ */
+struct h264fw_hrd {
+	/* cpb_cnt_minus1; */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, cpb_cnt_minus1);
+	/* bit_rate_scale; */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, bit_rate_scale);
+	/* cpb_size_scale; */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, cpb_size_scale);
+	/* bit_rate_value_minus1 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned int,
+			bit_rate_value_minus1[H264_MAXIMUMVALUEOFCPB_CNT]);
+	/* cpb_size_value_minus1 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned int,
+			cpb_size_value_minus1[H264_MAXIMUMVALUEOFCPB_CNT]);
+	/* cbr_flag */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			cbr_flag[H264_MAXIMUMVALUEOFCPB_CNT]);
+	/* initial_cpb_removal_delay_length_minus1; */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			initial_cpb_removal_delay_length_minus1);
+	/* cpb_removal_delay_length_minus1; */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			cpb_removal_delay_length_minus1);
+	/* dpb_output_delay_length_minus1; */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			dpb_output_delay_length_minus1);
+	/* time_offset_length; */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, time_offset_length);
+};
+
+/*
+ * This structure represents the VUI parameters data.
+ */
+struct h264fw_vui {
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, aspect_ratio_info_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, aspect_ratio_idc);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, sar_width);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, sar_height);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, overscan_info_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, overscan_appropriate_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, video_signal_type_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, video_format);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, video_full_range_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, colour_description_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, colour_primaries);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, transfer_characteristics);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, matrix_coefficients);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, chroma_location_info_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, chroma_sample_loc_type_top_field);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, chroma_sample_loc_type_bottom_field);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, timing_info_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, num_units_in_tick);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, time_scale);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, fixed_frame_rate_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, nal_hrd_parameters_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			struct h264fw_hrd, nal_hrd_params);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, vcl_hrd_parameters_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			struct h264fw_hrd, vcl_hrd_params);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, low_delay_hrd_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, pic_struct_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, bitstream_restriction_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, motion_vectors_over_pic_boundaries_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, max_bytes_per_pic_denom);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, max_bits_per_mb_denom);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, log2_max_mv_length_vertical);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, log2_max_mv_length_horizontal);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, num_reorder_frames);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, max_dec_frame_buffering);
+};
+
+/*
+ * This describes the HW specific SPS header data required by the H264
+ * firmware that should be supplied by the Host.
+ */
+struct h264fw_ddsequence_ps {
+	/* Value for CR_VEC_ENTDEC_FE_CONTROL */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, regentdec_control);
+
+	/* NB: This register should contain the 4-bit SGM flag */
+
+	/* Value for CR_VEC_H264_FE_SPS0 & CR_VEC_H264_BE_SPS0 combined */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned int, reg_sps0);
+	/* Value of CR_VEC_H264_BE_INTRA_8x8 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, reg_beintra);
+	/* Value of CR_VEC_H264_FE_CABAC444 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, reg_fecaabac444);
+
+	/* Treat CABAC 4:4:4 4x4 transform as not available */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			transform4x4_mb_notavialbale);
+	/* Disable VDMC horizontal/vertical filtering */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			disable_vdmcfilt);
+};
+
+/*
+ * This describes the PPS header data required by the H264 firmware that should
+ * be supplied by the Host.
+ */
+struct h264fw_picture_ps {
+	/* syntax element from bitstream - 1 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			deblocking_filter_control_present_flag);
+	/* syntax element from bitstream - 1 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			transform_8x8_mode_flag);
+	/* syntax element from bitstream - 1 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			entropy_coding_mode_flag);
+	/* syntax element from bitstream - 1 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			redundant_pic_cnt_present_flag);
+
+	/* syntax element from bitstream - 2 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			weighted_bipred_idc);
+	/* syntax element from bitstream - 1 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			weighted_pred_flag);
+	/* syntax element from bitstream - 1 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			pic_order_present_flag);
+
+	/* 26 + syntax element from bitstream - 7 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char, pic_init_qp);
+	/* syntax element from bitstream - 1 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			constrained_intra_pred_flag);
+	/* syntax element from bitstream - 5 bit each */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			num_ref_lx_active_minus1[H264FW_MAX_REFPIC_LISTS]);
+
+	/* syntax element from bitstream - 3 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			slice_group_map_type);
+	/* syntax element from bitstream - 3 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			num_slice_groups_minus1);
+	/* syntax element from bitstream - 13 bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned short,
+			slice_group_change_rate_minus1);
+
+	/* syntax element from bitstream */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, int,
+			chroma_qp_index_offset);
+	/* syntax element from bitstream */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, int,
+			second_chroma_qp_index_offset);
+
+	/*
+	 * scaling lists are derived from both SPS and PPS information
+	 * but will change whenever the PPS changes
+	 * The derived set of tables are associated here with the PPS
+	 * NB: These are in H.264 order
+	 */
+
+	/* derived from SPS and PPS - 8 bit each */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			scalinglist4x4[H264FW_NUM_4X4_LISTS][H264FW_4X4_SIZE]);
+	/* derived from SPS and PPS - 8 bit each */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			scalinglist8x8[H264FW_NUM_8X8_LISTS][H264FW_8X8_SIZE]);
+};
+
+/*
+ * This describes the HW specific PPS header data required by the H264
+ * firmware that should be supplied by the Host.
+ */
+struct h264fw_dd_picture_ps {
+	/* Value for MSVDX_CMDS_SLICE_PARAMS_MODE_CONFIG */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			vdmc_mode_config);
+	/* Value for CR_VEC_H264_FE_PPS0 & CR_VEC_H264_BE_PPS0 combined */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned int, reg_pps0);
+
+	/*
+	 * Scaling lists are derived from both SPS and PPS information
+	 * but will change whenever the PPS changes. The derived set of tables
+	 * are associated here with the PPS, but this will become invalid if
+	 * the SPS changes and will have to be recalculated.
+	 * These tables MUST be aligned on a 32-bit boundary
+	 * NB: These are in MSVDX order
+	 */
+
+	/* derived from SPS and PPS - 8 bit each */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			scalinglist4x4[H264FW_NUM_4X4_LISTS][H264FW_4X4_SIZE]);
+	/* derived from SPS and PPS - 8 bit each */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			scalinglist8x8[H264FW_NUM_8X8_LISTS][H264FW_8X8_SIZE]);
+};
+
+/*
+ * This describes the H.264 parser component "Header data", shown in the
+ * Firmware Memory Layout diagram. This data is required by the H264 firmware
+ * and should be supplied by the Host.
+ */
+struct h264fw_header_data {
+	struct vdecfw_image_buffer primary;
+	struct vdecfw_image_buffer alternate;
+
+	/* Output control: rotation, scaling, oold, etc. */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned int,
+			pic_cmds[VDECFW_CMD_MAX]);
+	/* Macroblock parameters base address for the picture */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned int,
+			mbparams_base_address);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned int,
+			mbparams_size_per_plane);
+	/* Buffers for context preload for colour plane switching (6.x.x) */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned int,
+			preload_buffer_base_address[H264FW_MAX_PLANES]);
+	/* Base address of active slice group map */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned int,
+			slicegroupmap_base_address);
+
+	/* do second pass Intra Deblock on frame */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char, do_old);
+	/* set to IMG_FALSE to disable second-pass deblock */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			two_pass_flag);
+	/* set to IMG_TRUE to disable MVC */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			disable_mvc);
+	/*
+	 * Do we have second PPS in uipSecondPPSInfoSource provided
+	 * for the second field.
+	 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			second_pps);
+};
+
+/* This describes an H.264 picture. It is part of the Context data */
+struct h264fw_picture {
+	/* Primary (reconstructed) picture buffers */
+	struct vdecfw_image_buffer primary;
+	/* Secondary (alternative) picture buffers */
+	struct vdecfw_image_buffer alternate;
+	/* Macroblock parameters base address for the picture */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, mbparams_base_address);
+
+	/* Unique ID for this picture */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, transaction_id);
+	/* Picture type */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			enum h264fw_epicture_type, pricture_type);
+
+	/* Reference status of the picture */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			enum h264fw_ereference, ref_status_bottom);
+	/* Reference status of the picture */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			enum h264fw_ereference, ref_status_top);
+	/* Reference status of the picture */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			enum h264fw_ereference, ref_status_frame);
+
+	/* Frame Number */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, frame_number);
+	/* Short term reference info */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, frame_number_wrap);
+	/* long term reference number - should be 8-bit */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, longterm_frame_idx);
+
+	/* Top field order count for this picture */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, top_field_order_count);
+	/* Bottom field order count for this picture */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, bottom_field_order_count);
+
+	/* MVC view_id */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, view_id);
+
+	/*
+	 * When picture is in the DPB Offset to use into
+	 * the MSVDX DPB reg table when the current
+	 * picture is the same view as this.
+	 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, view_dpb_offset);
+	/* Flags for this picture for the display process */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, display_flags);
+
+	/* IMG_FALSE if sent to display, or otherwise not needed for display */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, needed_for_output);
+};
+
+/* This structure describes frame data for POC calculation */
+struct h264fw_poc_picture_data {
+	/* type 0,1,2 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, mmco_5_flag);
+
+	/* type 0 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, bottom_field_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, pic_order_cnt_lsb);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, top_field_order_count);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, pic_order_count_msb);
+
+	/* type 1,2 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, short, frame_num);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, int, frame_num_offset);
+
+	/* output */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, bottom_filed_order_count);
+};
+
+/*
+ * This structure describes picture data for determining
+ * Complementary Field Pairs
+ */
+struct h264fw_last_pic_data {
+	/* Unique ID for this picture */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, transaction_id);
+	/* Picture type */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			enum h264fw_epicture_type, picture_type);
+	/* Reference status of the picture */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			enum h264fw_ereference, ref_status_frame);
+	/* Frame Number */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, frame_number);
+
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, luma_recon);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, chroma_recon);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, chroma_2_recon);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, luma_alter);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, chroma_alter);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, chroma_2_alter);
+
+	struct vdecfw_image_buffer primary;
+	struct vdecfw_image_buffer alternate;
+
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, mbparams_base_address);
+	/* Top field order count for this picture */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, top_field_order_count);
+	/* Bottom field order count for this picture */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, bottom_field_order_count);
+};
+
+/*
+ * This describes the H.264 parser component "Context data", shown in the
+ * Firmware Memory Layout diagram. This data is the state preserved across
+ * pictures. It is loaded and saved by the Firmware, but requires the host to
+ * provide buffer(s) for this.
+ */
+struct h264fw_context_data {
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
+	struct h264fw_last_pic_data
+		last_displayed_pic_data[H264FW_MAX_NUM_VIEWS];
+
+	/* previous reference frame number for each view */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned short,
+			prev_ref_frame_num[H264FW_MAX_NUM_VIEWS]);
+	/* Bitmap of used slots in each view DPB */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned short,
+			dpb_bitmap[H264FW_MAX_NUM_VIEWS]);
+
+	/* DPB size */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned int, dpb_size);
+	/* Number of pictures in DPB */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned int,
+			dpb_fullness);
+
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			prev_display_flags);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, int, prev_display);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, int, prev_release);
+	/* Sequence Parameter Set data */
+	struct h264fw_sequence_ps sps;
+	/* Picture Parameter Set data */
+	struct h264fw_picture_ps pps;
+	/* Picture Parameter Set data for second field if in the same buffer */
+	struct h264fw_picture_ps second_pps;
+
+	/* Set if stream is MVC */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, int, mvc);
+	/* DPB long term reference information */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, int,
+			max_longterm_frame_idx[H264FW_MAX_NUM_VIEWS]);
+};
+
+#endif /* _H264FW_DATA_H_ */
diff --git a/drivers/staging/media/vxd/decoder/hevcfw_data_shared.h b/drivers/staging/media/vxd/decoder/hevcfw_data_shared.h
new file mode 100644
index 000000000000..d57008fd96f8
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/hevcfw_data_shared.h
@@ -0,0 +1,767 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Public data structures for the hevc parser firmware module
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
+#ifdef USE_SHARING
+#endif
+
+#ifndef _HEVCFW_DATA_H_
+#define _HEVCFW_DATA_H_
+
+#include "vdecfw_share.h"
+#include "vdecfw_shared.h"
+
+#define HEVC_MAX_VPS_COUNT 16
+#define HEVC_MAX_SPS_COUNT 16
+#define HEVC_MAX_PPS_COUNT 64
+
+#define HEVCFW_MAX_NUM_PROFILE_IDC 32
+#define HEVCFW_MAX_VPS_OP_SETS_PLUS1 1024
+#define HEVCFW_MAX_VPS_NUH_RESERVED_ZERO_LAYER_ID_PLUS1 1
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
+/* non-critical errors*/
+#define HEVC_ERR_INVALID_VALUE (20)
+#define HEVC_ERR_CORRECTION_VALIDVALUE (21)
+
+#define HEVC_IS_ERR_CRITICAL(err) \
+	((err) > HEVC_ERR_CORRECTION_VALIDVALUE ? 1 : 0)
+
+/* critical errors*/
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
+
+	unsigned char lists
+	[HEVCFW_SCALING_LIST_NUM_SIZES]
+	[HEVCFW_SCALING_LIST_NUM_MATRICES]
+	[HEVCFW_SCALING_LIST_MATRIX_SIZE];
+};
+
+/* HEVC Video Profile_Tier_Level */
+struct hevcfw_profile_tier_level {
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, general_profile_space);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, general_tier_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, general_profile_idc);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			general_profile_compatibility_flag
+			[HEVCFW_MAX_NUM_PROFILE_IDC]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, general_progressive_source_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, general_interlaced_source_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, general_non_packed_constraint_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, general_frame_only_constraint_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, general_max_12bit_constraint_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, general_max_10bit_constraint_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, general_max_8bit_constraint_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, general_max_422chroma_constraint_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, general_max_420chroma_constraint_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, general_max_monochrome_constraint_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, general_intra_constraint_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			general_one_picture_only_constraint_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, general_lower_bit_rate_constraint_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, general_level_idc);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_profile_present_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_level_present_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_profile_space[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_tier_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_profile_idc[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_profile_compatibility_flag
+			[HEVCFW_MAX_NUM_SUBLAYERS - 1][HEVCFW_MAX_NUM_PROFILE_IDC]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_progressive_source_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_interlaced_source_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_non_packed_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_frame_only_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_max_12bit_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_max_10bit_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_max_8bit_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_max_422chroma_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_max_420chroma_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_max_monochrome_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_intra_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_one_picture_only_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_lower_bit_rate_constraint_flag[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sub_layer_level_idc[HEVCFW_MAX_NUM_SUBLAYERS - 1]);
+};
+
+struct hevcfw_video_ps {
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, is_different);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, is_sent);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, is_available);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, vps_video_parameter_set_id);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, vps_reserved_three_2bits);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, vps_max_layers_minus1);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, vps_max_sub_layers_minus1);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, vps_temporal_id_nesting_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, vps_reserved_0xffff_16bits);
+	struct hevcfw_profile_tier_level profile_tier_level;
+};
+
+/* HEVC Video Usability Information */
+struct hevcfw_vui_params {
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, aspect_ratio_info_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, aspect_ratio_idc);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, sar_width);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, sar_height);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, overscan_info_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, overscan_appropriate_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, video_signal_type_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, video_format);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, video_full_range_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, colour_description_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, colour_primaries);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, transfer_characteristics);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, matrix_coeffs);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, chroma_loc_info_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, chroma_sample_loc_type_top_field);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, chroma_sample_loc_type_bottom_field);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, neutral_chroma_indication_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, field_seq_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, frame_field_info_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, default_display_window_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, def_disp_win_left_offset);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, def_disp_win_right_offset);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, def_disp_win_top_offset);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, def_disp_win_bottom_offset);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, vui_timing_info_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, vui_num_units_in_tick);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, vui_time_scale);
+};
+
+/* HEVC Short Term Reference Picture Set */
+struct hevcfw_short_term_ref_picset {
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_negative_pics);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_positive_pics);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			short, delta_poc_s0[HEVCFW_MAX_NUM_REF_PICS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			short, delta_poc_s1[HEVCFW_MAX_NUM_REF_PICS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, used_bycurr_pic_s0[HEVCFW_MAX_NUM_REF_PICS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, used_bycurr_pic_s1[HEVCFW_MAX_NUM_REF_PICS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_delta_pocs);
+};
+
+/*
+ * This describes the SPS header data required by the HEVC firmware that should
+ * be supplied by the Host.
+ */
+struct hevcfw_sequence_ps {
+	/* syntax elements from SPS */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, pic_width_in_luma_samples);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, pic_height_in_luma_samples);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_short_term_ref_pic_sets);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_long_term_ref_pics_sps);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short,
+			lt_ref_pic_poc_lsb_sps[HEVCFW_MAX_NUM_LT_REF_PICS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			used_by_curr_pic_lt_sps_flag[HEVCFW_MAX_NUM_LT_REF_PICS]);
+	struct hevcfw_short_term_ref_picset st_rps_list[HEVCFW_MAX_NUM_ST_REF_PIC_SETS];
+
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, sps_max_sub_layers_minus1);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sps_max_dec_pic_buffering_minus1[HEVCFW_MAX_NUM_SUBLAYERS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			sps_max_num_reorder_pics[HEVCFW_MAX_NUM_SUBLAYERS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int,
+			sps_max_latency_increase_plus1[HEVCFW_MAX_NUM_SUBLAYERS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, max_transform_hierarchy_depth_inter);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, max_transform_hierarchy_depth_intra);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, log2_diff_max_min_transform_block_size);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, log2_min_transform_block_size_minus2);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			log2_diff_max_min_luma_coding_block_size);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, log2_min_luma_coding_block_size_minus3);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, chroma_format_idc);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, separate_colour_plane_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_extra_slice_header_bits);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, log2_max_pic_order_cnt_lsb_minus4);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, long_term_ref_pics_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, sample_adaptive_offset_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, sps_temporal_mvp_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, bit_depth_luma_minus8);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, bit_depth_chroma_minus8);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, pcm_sample_bit_depth_luma_minus1);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, pcm_sample_bit_depth_chroma_minus1);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			log2_min_pcm_luma_coding_block_size_minus3);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			log2_diff_max_min_pcm_luma_coding_block_size);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, pcm_loop_filter_disabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, amp_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, pcm_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, strong_intra_smoothing_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, scaling_list_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, transform_skip_rotation_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, transform_skip_context_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, implicit_rdpcm_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, explicit_rdpcm_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, extended_precision_processing_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, intra_smoothing_disabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, high_precision_offsets_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, persistent_rice_adaptation_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, cabac_bypass_alignment_enabled_flag);
+	/* derived elements */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, pic_size_in_ctbs_y);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, pic_height_in_ctbs_y);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, pic_width_in_ctbs_y);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, ctb_size_y);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, ctb_log2size_y);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, max_pic_order_cnt_lsb);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int,
+			sps_max_latency_pictures[HEVCFW_MAX_NUM_SUBLAYERS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, pps_seq_parameter_set_id);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, sps_video_parameter_set_id);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, sps_temporal_id_nesting_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, sps_seq_parameter_set_id);
+
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, conformance_window_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, conf_win_left_offset);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, conf_win_right_offset);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, conf_win_top_offset);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, conf_win_bottom_offset);
+
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, sps_sub_layer_ordering_info_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, sps_scaling_list_data_present_flag);
+
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, vui_parameters_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, sps_extension_present_flag);
+
+	struct hevcfw_vui_params vui_params;
+	/* derived elements */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, sub_width_c);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, sub_height_c);
+
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
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, temporal_outaddr);
+};
+
+/*
+ * This describes the PPS header data required by the HEVC firmware that should
+ * be supplied by the Host.
+ */
+struct hevcfw_picture_ps {
+	/* syntax elements from the PPS */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, pps_pic_parameter_set_id);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_tile_columns_minus1);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_tile_rows_minus1);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, diff_cu_qp_delta_depth);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, init_qp_minus26);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, pps_beta_offset_div2);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, pps_tc_offset_div2);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, pps_cb_qp_offset);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, pps_cr_qp_offset);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, log2_parallel_merge_level_minus2);
+
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, dependent_slice_segments_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, output_flag_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_extra_slice_header_bits);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, lists_modification_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, cabac_init_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, weighted_pred_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, weighted_bipred_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			pps_slice_chroma_qp_offsets_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			deblocking_filter_override_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, tiles_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, entropy_coding_sync_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			slice_segment_header_extension_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, transquant_bypass_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, cu_qp_delta_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, transform_skip_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, sign_data_hiding_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_ref_idx_l0_default_active_minus1);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_ref_idx_l1_default_active_minus1);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, constrained_intra_pred_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, pps_deblocking_filter_disabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			pps_loop_filter_across_slices_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, loop_filter_across_tiles_enabled_flag);
+
+	/* rewritten from SPS, maybe at some point we could get rid of this */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, scaling_list_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			log2_max_transform_skip_block_size_minus2);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			cross_component_prediction_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, chroma_qp_offset_list_enabled_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, diff_cu_chroma_qp_offset_depth);
+	/*
+	 * PVDEC derived elements. HEVCFW_SCALING_LISTS_BUFSIZE is
+	 * multiplied by 2 to ensure that there will be space for address of
+	 * each element. These addresses are completed in lower layer.
+	 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int,
+			scaling_lists[HEVCFW_SCALING_LISTS_BUFSIZE * 2]);
+	/* derived elements */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, col_bd[HEVCFW_MAX_TILE_COLS + 1]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, row_bd[HEVCFW_MAX_TILE_ROWS + 1]);
+
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, chroma_qp_offset_list_len_minus1);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, cb_qp_offset_list[HEVCFW_MAX_CHROMA_QP]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, cr_qp_offset_list[HEVCFW_MAX_CHROMA_QP]);
+
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, uniform_spacing_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			column_width_minus1[HEVCFW_MAX_TILE_COLS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			row_height_minus1[HEVCFW_MAX_TILE_ROWS]);
+
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, pps_seq_parameter_set_id);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, deblocking_filter_control_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, pps_scaling_list_data_present_flag);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, pps_extension_present_flag);
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
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, transaction_id);
+	/* nut of first ssh of picture, determines picture type */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, nalunit_type);
+	/* Picture Order Count (frame number) */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, pic_order_cnt_val);
+	/* Slice Picture Order Count Lsb */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, slice_pic_ordercnt_lsb);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, pic_output_flag);
+	/* information about long-term pictures */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, dpb_longterm_flags);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int,
+			dpb_pic_order_diff[HEVCFW_NUM_DPB_DIFF_REGS]);
+	/* address of buffer for temporal mv params */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, temporal_outaddr);
+	/* worst case Dpb diff for the current pic */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, dpb_diff);
+};
+
+/*
+ * This is a wrapper for a picture to hold it in a Decoded Picture Buffer
+ * for further reference
+ */
+struct hevcfw_picture_in_dpb {
+	/* DPB data about the picture */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			enum hevcfw_reference_type, ref_type);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, valid);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, needed_for_output);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, pic_latency_count);
+	/* Picture itself */
+	struct hevcfw_picture picture;
+};
+
+/*
+ * This describes an HEVC's Decoded Picture Buffer (DPB).
+ * It is part of the Context data
+ */
+
+#define HEVCFW_DPB_IDX_INVALID -1
+
+struct hevcfw_decoded_picture_buffer {
+	/* reference pictures */
+	struct hevcfw_picture_in_dpb pictures[HEVCFW_MAX_DPB_SIZE];
+	/* organizational data of DPB */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned int, fullness);
+};
+
+/*
+ * This describes an HEVC's Reference Picture Set (RPS).
+ * It is part of the Context data
+ */
+struct hevcfw_reference_picture_set {
+	/* sizes of poc lists */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_pocst_curr_before);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_pocst_curr_after);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_pocst_foll);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_poclt_curr);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, num_poclt_foll);
+	/* poc lists */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, pocst_curr_before[HEVCFW_MAX_NUM_REF_PICS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, pocst_curr_after[HEVCFW_MAX_NUM_REF_PICS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, pocst_foll[HEVCFW_MAX_NUM_REF_PICS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, poclt_curr[HEVCFW_MAX_NUM_REF_PICS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, poclt_foll[HEVCFW_MAX_NUM_REF_PICS]);
+	/* derived elements */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			curr_delta_pocmsb_presentflag[HEVCFW_MAX_NUM_REF_PICS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			foll_delta_pocmsb_presentflag[HEVCFW_MAX_NUM_REF_PICS]);
+	/* reference picture sets: indices in DPB */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, ref_picsetlt_curr[HEVCFW_MAX_NUM_REF_PICS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, ref_picsetlt_foll[HEVCFW_MAX_NUM_REF_PICS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			ref_picsetst_curr_before[HEVCFW_MAX_NUM_REF_PICS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			ref_picsetst_curr_after[HEVCFW_MAX_NUM_REF_PICS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, ref_picsetst_foll[HEVCFW_MAX_NUM_REF_PICS]);
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
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, prev_pic_order_cnt_lsb);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, prev_pic_order_cnt_msb);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, last_irapnorasl_output_flag);
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
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char,
+			ref_pic_list[HEVCFW_NUM_REF_PIC_LISTS][HEVCFW_MAX_NUM_REF_PICS]);
+	/*
+	 * Reference Picture List used to send reflist to the host, the only
+	 * difference is that missing references are marked
+	 * with HEVCFW_DPB_IDX_INVALID
+	 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char,
+			ref_pic_listhlp[HEVCFW_NUM_REF_PIC_LISTS][HEVCFW_MAX_NUM_REF_PICS]);
+
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, pic_count);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, slice_segment_count);
+	/* There was EOS NAL detected and no new picture yet */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, eos_detected);
+	/* This is first picture after EOS NAL */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, first_after_eos);
+};
+
+#endif /* _HEVCFW_DATA_H_ */
diff --git a/drivers/staging/media/vxd/decoder/img_msvdx_cmds.h b/drivers/staging/media/vxd/decoder/img_msvdx_cmds.h
new file mode 100644
index 000000000000..2748ff44624e
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/img_msvdx_cmds.h
@@ -0,0 +1,279 @@
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
+#ifndef _IMG_MSVDX_CMDS_H
+#define _IMG_MSVDX_CMDS_H
+
+#define MSVDX_CMDS_HORIZONTAL_LUMA_COEFFICIENTS_OFFSET          (0x0060)
+#define MSVDX_CMDS_VERTICAL_LUMA_COEFFICIENTS_OFFSET            (0x0070)
+/**
+ * MSVDX_CMDS_HORIZONTAL_CHROMA_COEFFICIENTS_OFFSET -
+ *		MSVDX_CMDS, VERTICAL_LUMA_COEFFICIENTS, VER_LUMA_COEFF_0
+ */
+#define MSVDX_CMDS_HORIZONTAL_CHROMA_COEFFICIENTS_OFFSET                (0x0080)
+/* MSVDX_CMDS, HORIZONTAL_CHROMA_COEFFICIENTS, HOR_CHROMA_COEFF_0 */
+#define MSVDX_CMDS_VERTICAL_CHROMA_COEFFICIENTS_OFFSET          (0x0090)
+/* MSVDX_CMDS, DISPLAY_PICTURE_SIZE, DISPLAY_PICTURE_HEIGHT */
+#define MSVDX_CMDS_DISPLAY_PICTURE_SIZE_DISPLAY_PICTURE_HEIGHT_LSBMASK          (0x00000FFF)
+#define MSVDX_CMDS_DISPLAY_PICTURE_SIZE_DISPLAY_PICTURE_HEIGHT_SHIFT            (12)
+/* MSVDX_CMDS, DISPLAY_PICTURE_SIZE, DISPLAY_PICTURE_WIDTH */
+#define MSVDX_CMDS_DISPLAY_PICTURE_SIZE_DISPLAY_PICTURE_WIDTH_LSBMASK           (0x00000FFF)
+#define MSVDX_CMDS_DISPLAY_PICTURE_SIZE_DISPLAY_PICTURE_WIDTH_SHIFT             (0)
+#define MSVDX_CMDS_PVDEC_DISPLAY_PICTURE_SIZE_OFFSET            (0x00B0)
+#define MSVDX_CMDS_PVDEC_DISPLAY_PICTURE_SIZE_PVDEC_DISPLAY_PICTURE_HEIGHT_MIN1_LSBMASK \
+											(0x0000FFFF)
+#define MSVDX_CMDS_PVDEC_DISPLAY_PICTURE_SIZE_PVDEC_DISPLAY_PICTURE_HEIGHT_MIN1_SHIFT           (16)
+/* MSVDX_CMDS, PVDEC_DISPLAY_PICTURE_SIZE, PVDEC_DISPLAY_PICTURE_WIDTH_MIN1 */
+#define MSVDX_CMDS_PVDEC_DISPLAY_PICTURE_SIZE_PVDEC_DISPLAY_PICTURE_WIDTH_MIN1_LSBMASK \
+											(0x0000FFFF)
+#define MSVDX_CMDS_PVDEC_DISPLAY_PICTURE_SIZE_PVDEC_DISPLAY_PICTURE_WIDTH_MIN1_SHIFT            (0)
+/* MSVDX_CMDS, CODED_PICTURE_SIZE, CODED_PICTURE_HEIGHT */
+#define MSVDX_CMDS_CODED_PICTURE_SIZE_CODED_PICTURE_HEIGHT_LSBMASK              (0x00000FFF)
+#define MSVDX_CMDS_CODED_PICTURE_SIZE_CODED_PICTURE_HEIGHT_SHIFT                (12)
+/* MSVDX_CMDS, CODED_PICTURE_SIZE, CODED_PICTURE_WIDTH */
+#define MSVDX_CMDS_CODED_PICTURE_SIZE_CODED_PICTURE_WIDTH_LSBMASK               (0x00000FFF)
+#define MSVDX_CMDS_CODED_PICTURE_SIZE_CODED_PICTURE_WIDTH_SHIFT         (0)
+#define MSVDX_CMDS_PVDEC_CODED_PICTURE_SIZE_OFFSET              (0x00B4)
+/* MSVDX_CMDS, OPERATING_MODE, USE_EXT_ROW_STRIDE */
+#define MSVDX_CMDS_OPERATING_MODE_USE_EXT_ROW_STRIDE_MASK               (0x10000000)
+#define MSVDX_CMDS_OPERATING_MODE_USE_EXT_ROW_STRIDE_LSBMASK            (0x00000001)
+#define MSVDX_CMDS_OPERATING_MODE_USE_EXT_ROW_STRIDE_SHIFT              (28)
+/* MSVDX_CMDS, OPERATING_MODE, CHROMA_INTERLEAVED */
+#define MSVDX_CMDS_OPERATING_MODE_CHROMA_INTERLEAVED_MASK               (0x08000000)
+#define MSVDX_CMDS_OPERATING_MODE_CHROMA_INTERLEAVED_LSBMASK            (0x00000001)
+#define MSVDX_CMDS_OPERATING_MODE_CHROMA_INTERLEAVED_SHIFT              (27)
+/* MSVDX_CMDS, OPERATING_MODE, ROW_STRIDE */
+#define MSVDX_CMDS_OPERATING_MODE_ROW_STRIDE_MASK               (0x07000000)
+#define MSVDX_CMDS_OPERATING_MODE_ROW_STRIDE_LSBMASK            (0x00000007)
+#define MSVDX_CMDS_OPERATING_MODE_ROW_STRIDE_SHIFT              (24)
+/* MSVDX_CMDS, OPERATING_MODE, CODEC_PROFILE */
+#define MSVDX_CMDS_OPERATING_MODE_CODEC_PROFILE_MASK            (0x00300000)
+#define MSVDX_CMDS_OPERATING_MODE_CODEC_PROFILE_LSBMASK         (0x00000003)
+#define MSVDX_CMDS_OPERATING_MODE_CODEC_PROFILE_SHIFT           (20)
+/* MSVDX_CMDS, OPERATING_MODE, CODEC_MODE */
+#define MSVDX_CMDS_OPERATING_MODE_CODEC_MODE_MASK               (0x000F0000)
+#define MSVDX_CMDS_OPERATING_MODE_CODEC_MODE_LSBMASK            (0x0000000F)
+#define MSVDX_CMDS_OPERATING_MODE_CODEC_MODE_SHIFT              (16)
+/* MSVDX_CMDS, OPERATING_MODE, ASYNC_MODE */
+#define MSVDX_CMDS_OPERATING_MODE_ASYNC_MODE_MASK               (0x00006000)
+#define MSVDX_CMDS_OPERATING_MODE_ASYNC_MODE_LSBMASK            (0x00000003)
+#define MSVDX_CMDS_OPERATING_MODE_ASYNC_MODE_SHIFT              (13)
+/* MSVDX_CMDS, OPERATING_MODE, CHROMA_FORMAT */
+#define MSVDX_CMDS_OPERATING_MODE_CHROMA_FORMAT_MASK            (0x00001000)
+#define MSVDX_CMDS_OPERATING_MODE_CHROMA_FORMAT_LSBMASK         (0x00000001)
+#define MSVDX_CMDS_OPERATING_MODE_CHROMA_FORMAT_SHIFT           (12)
+/* MSVDX_CMDS, OPERATING_MODE, PIC_QUANT */
+#define MSVDX_CMDS_PVDEC_OPERATING_MODE_OFFSET          (0x00A0)
+/* MSVDX_CMDS, EXT_OP_MODE, BIT_DEPTH_CHROMA_MINUS8 */
+#define MSVDX_CMDS_EXT_OP_MODE_BIT_DEPTH_CHROMA_MINUS8_MASK             (0x00003000)
+#define MSVDX_CMDS_EXT_OP_MODE_BIT_DEPTH_CHROMA_MINUS8_LSBMASK          (0x00000003)
+#define MSVDX_CMDS_EXT_OP_MODE_BIT_DEPTH_CHROMA_MINUS8_SHIFT            (12)
+/* MSVDX_CMDS, EXT_OP_MODE, BIT_DEPTH_LUMA_MINUS8 */
+#define MSVDX_CMDS_EXT_OP_MODE_BIT_DEPTH_LUMA_MINUS8_MASK               (0x00000300)
+#define MSVDX_CMDS_EXT_OP_MODE_BIT_DEPTH_LUMA_MINUS8_LSBMASK            (0x00000003)
+#define MSVDX_CMDS_EXT_OP_MODE_BIT_DEPTH_LUMA_MINUS8_SHIFT              (8)
+/* MSVDX_CMDS, EXT_OP_MODE, MEMORY_PACKING */
+#define MSVDX_CMDS_EXT_OP_MODE_MEMORY_PACKING_MASK              (0x00000008)
+#define MSVDX_CMDS_EXT_OP_MODE_MEMORY_PACKING_LSBMASK           (0x00000001)
+#define MSVDX_CMDS_EXT_OP_MODE_MEMORY_PACKING_SHIFT             (3)
+/* MSVDX_CMDS, EXT_OP_MODE, CHROMA_FORMAT_IDC */
+#define MSVDX_CMDS_EXT_OP_MODE_CHROMA_FORMAT_IDC_MASK           (0x00000003)
+#define MSVDX_CMDS_EXT_OP_MODE_CHROMA_FORMAT_IDC_LSBMASK                (0x00000003)
+#define MSVDX_CMDS_EXT_OP_MODE_CHROMA_FORMAT_IDC_SHIFT          (0)
+#define MSVDX_CMDS_LUMA_RECONSTRUCTED_PICTURE_BASE_ADDRESSES_OFFSET             (0x000C)
+/*
+ * MSVDX_CMDS, LUMA_RECONSTRUCTED_PICTURE_BASE_ADDRESSES,
+ * LUMA_RECON_BASE_ADDR
+ */
+#define MSVDX_CMDS_CHROMA_RECONSTRUCTED_PICTURE_BASE_ADDRESSES_OFFSET           (0x0010)
+///* MSVDX_CMDS, AUX_MSB_BUFFER_BASE_ADDRESSES, AUX_MSB_BUFFER_BASE_ADDR */
+#define MSVDX_CMDS_INTRA_BUFFER_BASE_ADDRESS_OFFSET             (0x0018)
+/* MSVDX_CMDS, INTRA_BUFFER_BASE_ADDRESS, INTRA_BASE_ADDR */
+
+#define MSVDX_CMDS_MC_CACHE_CONFIGURATION_OFFSET                (0x001C)
+
+/* MSVDX_CMDS, MC_CACHE_CONFIGURATION, CONFIG_REF_CHROMA_ADJUST */
+#define MSVDX_CMDS_MC_CACHE_CONFIGURATION_CONFIG_REF_CHROMA_ADJUST_MASK         (0x01000000)
+#define MSVDX_CMDS_MC_CACHE_CONFIGURATION_CONFIG_REF_CHROMA_ADJUST_LSBMASK              (0x00000001)
+#define MSVDX_CMDS_MC_CACHE_CONFIGURATION_CONFIG_REF_CHROMA_ADJUST_SHIFT                (24)
+/* MSVDX_CMDS, MC_CACHE_CONFIGURATION, CONFIG_REF_OFFSET */
+#define MSVDX_CMDS_MC_CACHE_CONFIGURATION_CONFIG_REF_OFFSET_MASK                (0x00FFF000)
+#define MSVDX_CMDS_MC_CACHE_CONFIGURATION_CONFIG_REF_OFFSET_LSBMASK             (0x00000FFF)
+#define MSVDX_CMDS_MC_CACHE_CONFIGURATION_CONFIG_REF_OFFSET_SHIFT               (12)
+/* MSVDX_CMDS, MC_CACHE_CONFIGURATION, CONFIG_ROW_OFFSET */
+#define MSVDX_CMDS_MC_CACHE_CONFIGURATION_CONFIG_ROW_OFFSET_MASK                (0x0000003F)
+#define MSVDX_CMDS_MC_CACHE_CONFIGURATION_CONFIG_ROW_OFFSET_LSBMASK             (0x0000003F)
+#define MSVDX_CMDS_MC_CACHE_CONFIGURATION_CONFIG_ROW_OFFSET_SHIFT               (0)
+/* MSVDX_CMDS, H264_WEIGHTED_FACTOR_DENOMINATOR, Y_LOG2_WEIGHT_DENOM */
+#define MSVDX_CMDS_VC1_LUMA_RANGE_MAPPING_BASE_ADDRESS_OFFSET           (0x0028)
+/* MSVDX_CMDS, VC1_LUMA_RANGE_MAPPING_BASE_ADDRESS, LUMA_RANGE_BASE_ADDR */
+#define MSVDX_CMDS_VC1_CHROMA_RANGE_MAPPING_BASE_ADDRESS_OFFSET         (0x002C)
+/* MSVDX_CMDS, VC1_RANGE_MAPPING_FLAGS, LUMA_RANGE_MAP */
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_OFFSET           (0x003C)
+/* MSVDX_CMDS, ALTERNATIVE_OUTPUT_PICTURE_ROTATION, EXT_ROT_ROW_STRIDE */
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_EXT_ROT_ROW_STRIDE_MASK          (0xFFC00000)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_EXT_ROT_ROW_STRIDE_LSBMASK \
+									(0x000003FF)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_EXT_ROT_ROW_STRIDE_SHIFT         (22)
+/* MSVDX_CMDS, ALTERNATIVE_OUTPUT_PICTURE_ROTATION, PACKED_422_OUTPUT */
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_PACKED_422_OUTPUT_MASK           (0x00000800)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_PACKED_422_OUTPUT_LSBMASK \
+									(0x00000001)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_PACKED_422_OUTPUT_SHIFT          (11)
+/* MSVDX_CMDS, ALTERNATIVE_OUTPUT_PICTURE_ROTATION, USE_AUX_LINE_BUF */
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_USE_AUX_LINE_BUF_MASK            (0x00000400)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_USE_AUX_LINE_BUF_LSBMASK         (0x00000001)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_USE_AUX_LINE_BUF_SHIFT           (10)
+/* MSVDX_CMDS, ALTERNATIVE_OUTPUT_PICTURE_ROTATION, SCALE_INPUT_SIZE_SEL */
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_SCALE_INPUT_SIZE_SEL_MASK \
+									(0x00000200)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_SCALE_INPUT_SIZE_SEL_LSBMASK \
+									(0x00000001)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_SCALE_INPUT_SIZE_SEL_SHIFT               (9)
+/* MSVDX_CMDS, ALTERNATIVE_OUTPUT_PICTURE_ROTATION, USE_EXT_ROT_ROW_STRIDE */
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_USE_EXT_ROT_ROW_STRIDE_MASK \
+									(0x00000100)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_USE_EXT_ROT_ROW_STRIDE_LSBMASK \
+									(0x00000001)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_USE_EXT_ROT_ROW_STRIDE_SHIFT             (8)
+/* MSVDX_CMDS, ALTERNATIVE_OUTPUT_PICTURE_ROTATION, ROTATION_ROW_STRIDE */
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_ROTATION_ROW_STRIDE_MASK         (0x00000070)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_ROTATION_ROW_STRIDE_LSBMASK \
+									(0x00000007)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_PICTURE_ROTATION_ROTATION_ROW_STRIDE_SHIFT                (4)
+/* MSVDX_CMDS, ALTERNATIVE_OUTPUT_PICTURE_ROTATION, ROTATION_MODE */
+#define MSVDX_CMDS_EXTENDED_ROW_STRIDE_OFFSET           (0x0040)
+
+/* MSVDX_CMDS, EXTENDED_ROW_STRIDE, EXT_ROW_STRIDE */
+#define MSVDX_CMDS_EXTENDED_ROW_STRIDE_EXT_ROW_STRIDE_MASK              (0x0003FFC0)
+#define MSVDX_CMDS_EXTENDED_ROW_STRIDE_EXT_ROW_STRIDE_LSBMASK           (0x00000FFF)
+#define MSVDX_CMDS_EXTENDED_ROW_STRIDE_EXT_ROW_STRIDE_SHIFT             (6)
+/* MSVDX_CMDS, EXTENDED_ROW_STRIDE, REF_PIC_MMU_TILED */
+#define MSVDX_CMDS_CHROMA_ROW_STRIDE_OFFSET             (0x01AC)
+/* MSVDX_CMDS, CHROMA_ROW_STRIDE, ALT_CHROMA_ROW_STRIDE */
+#define MSVDX_CMDS_CHROMA_ROW_STRIDE_ALT_CHROMA_ROW_STRIDE_MASK         (0xFFC00000)
+#define MSVDX_CMDS_CHROMA_ROW_STRIDE_ALT_CHROMA_ROW_STRIDE_LSBMASK              (0x000003FF)
+#define MSVDX_CMDS_CHROMA_ROW_STRIDE_ALT_CHROMA_ROW_STRIDE_SHIFT                (22)
+/* MSVDX_CMDS, CHROMA_ROW_STRIDE, CHROMA_ROW_STRIDE */
+#define MSVDX_CMDS_CHROMA_ROW_STRIDE_CHROMA_ROW_STRIDE_MASK             (0x0003FFC0)
+#define MSVDX_CMDS_CHROMA_ROW_STRIDE_CHROMA_ROW_STRIDE_LSBMASK          (0x00000FFF)
+#define MSVDX_CMDS_CHROMA_ROW_STRIDE_CHROMA_ROW_STRIDE_SHIFT            (6)
+/* MSVDX_CMDS, RPR_PICTURE_SIZE, RPR_PICTURE_WIDTH */
+#define MSVDX_CMDS_SCALED_DISPLAY_SIZE_OFFSET           (0x0050)
+/* MSVDX_CMDS, SCALED_DISPLAY_SIZE, SCALE_DISPLAY_HEIGHT */
+#define MSVDX_CMDS_SCALED_DISPLAY_SIZE_SCALE_DISPLAY_HEIGHT_MASK                (0x00FFF000)
+#define MSVDX_CMDS_SCALED_DISPLAY_SIZE_SCALE_DISPLAY_HEIGHT_LSBMASK             (0x00000FFF)
+#define MSVDX_CMDS_SCALED_DISPLAY_SIZE_SCALE_DISPLAY_HEIGHT_SHIFT               (12)
+/* MSVDX_CMDS, SCALED_DISPLAY_SIZE, SCALE_DISPLAY_WIDTH */
+#define MSVDX_CMDS_SCALED_DISPLAY_SIZE_SCALE_DISPLAY_WIDTH_MASK         (0x00000FFF)
+#define MSVDX_CMDS_SCALED_DISPLAY_SIZE_SCALE_DISPLAY_WIDTH_LSBMASK              (0x00000FFF)
+#define MSVDX_CMDS_SCALED_DISPLAY_SIZE_SCALE_DISPLAY_WIDTH_SHIFT                (0)
+#define MSVDX_CMDS_PVDEC_SCALED_DISPLAY_SIZE_OFFSET             (0x00B8)
+/* MSVDX_CMDS, PVDEC_SCALED_DISPLAY_SIZE, PVDEC_SCALE_DISPLAY_HEIGHT */
+#define MSVDX_CMDS_PVDEC_SCALED_DISPLAY_SIZE_PVDEC_SCALE_DISPLAY_HEIGHT_MASK            (0xFFFF0000)
+#define MSVDX_CMDS_PVDEC_SCALED_DISPLAY_SIZE_PVDEC_SCALE_DISPLAY_HEIGHT_LSBMASK         (0x0000FFFF)
+#define MSVDX_CMDS_PVDEC_SCALED_DISPLAY_SIZE_PVDEC_SCALE_DISPLAY_HEIGHT_SHIFT           (16)
+/* MSVDX_CMDS, PVDEC_SCALED_DISPLAY_SIZE, PVDEC_SCALE_DISPLAY_WIDTH */
+#define MSVDX_CMDS_PVDEC_SCALED_DISPLAY_SIZE_PVDEC_SCALE_DISPLAY_WIDTH_MASK             (0x0000FFFF)
+#define MSVDX_CMDS_PVDEC_SCALED_DISPLAY_SIZE_PVDEC_SCALE_DISPLAY_WIDTH_LSBMASK          (0x0000FFFF)
+#define MSVDX_CMDS_PVDEC_SCALED_DISPLAY_SIZE_PVDEC_SCALE_DISPLAY_WIDTH_SHIFT            (0)
+#define MSVDX_CMDS_HORIZONTAL_SCALE_CONTROL_OFFSET              (0x0054)
+/* MSVDX_CMDS, HORIZONTAL_SCALE_CONTROL, HORIZONTAL_INITIAL_POS */
+#define MSVDX_CMDS_HORIZONTAL_SCALE_CONTROL_HORIZONTAL_INITIAL_POS_MASK         (0xFFFF0000)
+#define MSVDX_CMDS_HORIZONTAL_SCALE_CONTROL_HORIZONTAL_INITIAL_POS_LSBMASK              (0x0000FFFF)
+#define MSVDX_CMDS_HORIZONTAL_SCALE_CONTROL_HORIZONTAL_INITIAL_POS_SHIFT                (16)
+/* MSVDX_CMDS, HORIZONTAL_SCALE_CONTROL, HORIZONTAL_SCALE_PITCH */
+#define MSVDX_CMDS_HORIZONTAL_SCALE_CONTROL_HORIZONTAL_SCALE_PITCH_MASK         (0x0000FFFF)
+#define MSVDX_CMDS_HORIZONTAL_SCALE_CONTROL_HORIZONTAL_SCALE_PITCH_LSBMASK              (0x0000FFFF)
+#define MSVDX_CMDS_HORIZONTAL_SCALE_CONTROL_HORIZONTAL_SCALE_PITCH_SHIFT                (0)
+#define MSVDX_CMDS_VERTICAL_SCALE_CONTROL_OFFSET                (0x0058)
+/* MSVDX_CMDS, VERTICAL_SCALE_CONTROL, VERTICAL_INITIAL_POS */
+#define MSVDX_CMDS_VERTICAL_SCALE_CONTROL_VERTICAL_INITIAL_POS_MASK             (0xFFFF0000)
+#define MSVDX_CMDS_VERTICAL_SCALE_CONTROL_VERTICAL_INITIAL_POS_LSBMASK          (0x0000FFFF)
+#define MSVDX_CMDS_VERTICAL_SCALE_CONTROL_VERTICAL_INITIAL_POS_SHIFT            (16)
+/* MSVDX_CMDS, VERTICAL_SCALE_CONTROL, VERTICAL_SCALE_PITCH */
+#define MSVDX_CMDS_VERTICAL_SCALE_CONTROL_VERTICAL_SCALE_PITCH_MASK             (0x0000FFFF)
+#define MSVDX_CMDS_VERTICAL_SCALE_CONTROL_VERTICAL_SCALE_PITCH_LSBMASK          (0x0000FFFF)
+#define MSVDX_CMDS_VERTICAL_SCALE_CONTROL_VERTICAL_SCALE_PITCH_SHIFT            (0)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_OFFSET            (0x01B4)
+/* MSVDX_CMDS, ALTERNATIVE_OUTPUT_CONTROL, ALT_BIT_DEPTH_CHROMA_MINUS8 */
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_ALT_BIT_DEPTH_CHROMA_MINUS8_MASK          (0x00007000)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_ALT_BIT_DEPTH_CHROMA_MINUS8_LSBMASK \
+									(0x00000007)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_ALT_BIT_DEPTH_CHROMA_MINUS8_SHIFT         (12)
+/* MSVDX_CMDS, ALTERNATIVE_OUTPUT_CONTROL, ALT_BIT_DEPTH_LUMA_MINUS8 */
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_ALT_BIT_DEPTH_LUMA_MINUS8_MASK            (0x00000700)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_ALT_BIT_DEPTH_LUMA_MINUS8_LSBMASK         (0x00000007)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_ALT_BIT_DEPTH_LUMA_MINUS8_SHIFT           (8)
+/* MSVDX_CMDS, ALTERNATIVE_OUTPUT_CONTROL, SCALE_LUMA_BIFILTER_HORIZ */
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_SCALE_LUMA_BIFILTER_HORIZ_MASK            (0x00000080)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_SCALE_LUMA_BIFILTER_HORIZ_LSBMASK         (0x00000001)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_SCALE_LUMA_BIFILTER_HORIZ_SHIFT           (7)
+/* MSVDX_CMDS, ALTERNATIVE_OUTPUT_CONTROL, SCALE_LUMA_BIFILTER_VERT */
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_SCALE_LUMA_BIFILTER_VERT_MASK             (0x00000040)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_SCALE_LUMA_BIFILTER_VERT_LSBMASK          (0x00000001)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_SCALE_LUMA_BIFILTER_VERT_SHIFT            (6)
+/* MSVDX_CMDS, ALTERNATIVE_OUTPUT_CONTROL, SCALE_CHROMA_BIFILTER_HORIZ */
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_SCALE_CHROMA_BIFILTER_HORIZ_MASK          (0x00000020)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_SCALE_CHROMA_BIFILTER_HORIZ_LSBMASK \
+									(0x00000001)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_SCALE_CHROMA_BIFILTER_HORIZ_SHIFT         (5)
+/* MSVDX_CMDS, ALTERNATIVE_OUTPUT_CONTROL, SCALE_CHROMA_BIFILTER_VERT */
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_SCALE_CHROMA_BIFILTER_VERT_MASK           (0x00000010)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_SCALE_CHROMA_BIFILTER_VERT_LSBMASK \
+									(0x00000001)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_SCALE_CHROMA_BIFILTER_VERT_SHIFT          (4)
+/* MSVDX_CMDS, ALTERNATIVE_OUTPUT_CONTROL, ALT_MEMORY_PACKING */
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_ALT_MEMORY_PACKING_MASK           (0x00000008)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_ALT_MEMORY_PACKING_LSBMASK                (0x00000001)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_ALT_MEMORY_PACKING_SHIFT          (3)
+/* MSVDX_CMDS, ALTERNATIVE_OUTPUT_CONTROL, SCALE_CHROMA_RESAMP_ONLY */
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_SCALE_CHROMA_RESAMP_ONLY_MASK             (0x00000004)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_SCALE_CHROMA_RESAMP_ONLY_LSBMASK          (0x00000001)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_SCALE_CHROMA_RESAMP_ONLY_SHIFT            (2)
+/* MSVDX_CMDS, ALTERNATIVE_OUTPUT_CONTROL, ALT_OUTPUT_FORMAT */
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_ALT_OUTPUT_FORMAT_MASK            (0x00000003)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_ALT_OUTPUT_FORMAT_LSBMASK         (0x00000003)
+#define MSVDX_CMDS_ALTERNATIVE_OUTPUT_CONTROL_ALT_OUTPUT_FORMAT_SHIFT           (0)
+#define MSVDX_CMDS_SCALE_OUTPUT_SIZE_OFFSET             (0x01B8)
+/* MSVDX_CMDS, SCALE_OUTPUT_SIZE, SCALE_OUTPUT_HEIGHT_MIN1 */
+#define MSVDX_CMDS_SCALE_OUTPUT_SIZE_SCALE_OUTPUT_HEIGHT_MIN1_MASK              (0xFFFF0000)
+#define MSVDX_CMDS_SCALE_OUTPUT_SIZE_SCALE_OUTPUT_HEIGHT_MIN1_LSBMASK           (0x0000FFFF)
+#define MSVDX_CMDS_SCALE_OUTPUT_SIZE_SCALE_OUTPUT_HEIGHT_MIN1_SHIFT             (16)
+/* MSVDX_CMDS, SCALE_OUTPUT_SIZE, SCALE_OUTPUT_WIDTH_MIN1 */
+#define MSVDX_CMDS_SCALE_OUTPUT_SIZE_SCALE_OUTPUT_WIDTH_MIN1_MASK               (0x0000FFFF)
+#define MSVDX_CMDS_SCALE_OUTPUT_SIZE_SCALE_OUTPUT_WIDTH_MIN1_LSBMASK            (0x0000FFFF)
+#define MSVDX_CMDS_SCALE_OUTPUT_SIZE_SCALE_OUTPUT_WIDTH_MIN1_SHIFT              (0)
+#define MSVDX_CMDS_SCALE_HORIZONTAL_CHROMA_OFFSET               (0x01BC)
+/* MSVDX_CMDS, SCALE_HORIZONTAL_CHROMA, CHROMA_HORIZONTAL_INITIAL */
+#define MSVDX_CMDS_SCALE_HORIZONTAL_CHROMA_CHROMA_HORIZONTAL_INITIAL_MASK               (0xFFFF0000)
+#define MSVDX_CMDS_SCALE_HORIZONTAL_CHROMA_CHROMA_HORIZONTAL_INITIAL_LSBMASK            (0x0000FFFF)
+#define MSVDX_CMDS_SCALE_HORIZONTAL_CHROMA_CHROMA_HORIZONTAL_INITIAL_SHIFT              (16)
+#define MSVDX_CMDS_SCALE_HORIZONTAL_CHROMA_CHROMA_HORIZONTAL_PITCH_MASK         (0x0000FFFF)
+#define MSVDX_CMDS_SCALE_HORIZONTAL_CHROMA_CHROMA_HORIZONTAL_PITCH_LSBMASK              (0x0000FFFF)
+#define MSVDX_CMDS_SCALE_HORIZONTAL_CHROMA_CHROMA_HORIZONTAL_PITCH_SHIFT                (0)
+#define MSVDX_CMDS_SCALE_VERTICAL_CHROMA_OFFSET         (0x01C0)
+/* MSVDX_CMDS, SCALE_VERTICAL_CHROMA, CHROMA_VERTICAL_INITIAL */
+#define MSVDX_CMDS_SCALE_VERTICAL_CHROMA_CHROMA_VERTICAL_INITIAL_MASK           (0xFFFF0000)
+#define MSVDX_CMDS_SCALE_VERTICAL_CHROMA_CHROMA_VERTICAL_INITIAL_LSBMASK                (0x0000FFFF)
+#define MSVDX_CMDS_SCALE_VERTICAL_CHROMA_CHROMA_VERTICAL_INITIAL_SHIFT          (16)
+/* MSVDX_CMDS, SCALE_VERTICAL_CHROMA, CHROMA_VERTICAL_PITCH */
+#define MSVDX_CMDS_SCALE_VERTICAL_CHROMA_CHROMA_VERTICAL_PITCH_MASK             (0x0000FFFF)
+#define MSVDX_CMDS_SCALE_VERTICAL_CHROMA_CHROMA_VERTICAL_PITCH_LSBMASK          (0x0000FFFF)
+#define MSVDX_CMDS_SCALE_VERTICAL_CHROMA_CHROMA_VERTICAL_PITCH_SHIFT            (0)
+/* MSVDX_CMDS, MULTICORE_OPERATING_MODE, MBLK_ROW_OFFSET */
+#define MSVDX_CMDS_AUX_LINE_BUFFER_BASE_ADDRESS_OFFSET          (0x01EC)
+
+#endif /* _IMG_MSVDX_CMDS_H */
diff --git a/drivers/staging/media/vxd/decoder/img_msvdx_core_regs.h b/drivers/staging/media/vxd/decoder/img_msvdx_core_regs.h
new file mode 100644
index 000000000000..d46d5e04e826
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/img_msvdx_core_regs.h
@@ -0,0 +1,22 @@
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
+#ifndef _IMG_MSVDX_CORE_REGS_H
+#define _IMG_MSVDX_CORE_REGS_H
+
+#define MSVDX_CORE_CR_MMU_TILE_NO_ENTRIES               (4)
+#define MSVDX_CORE_CR_MMU_TILE_EXT_NO_ENTRIES           (4)
+
+#endif /* _IMG_MSVDX_CORE_REGS_H */
diff --git a/drivers/staging/media/vxd/decoder/img_msvdx_vdmc_regs.h b/drivers/staging/media/vxd/decoder/img_msvdx_vdmc_regs.h
new file mode 100644
index 000000000000..493eb7114ad7
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/img_msvdx_vdmc_regs.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * IMG MSVDX VDMC Registers
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
+#ifndef _IMG_MSVDX_VDMC_REGS_H
+#define _IMG_MSVDX_VDMC_REGS_H
+
+/* MSVDX_VDMC, CR_VDMC_MACROBLOCK_NUMBER, CR_VDMC_MACROBLOCK_X_OFFSET */
+#define MSVDX_VDMC_CR_VDMC_MACROBLOCK_NUMBER_CR_VDMC_MACROBLOCK_X_OFFSET_MASK           (0x0000FFFF)
+#define MSVDX_VDMC_CR_VDMC_MACROBLOCK_NUMBER_CR_VDMC_MACROBLOCK_X_OFFSET_SHIFT          (0)
+
+/* MSVDX_VDMC, CR_VDMC_MACROBLOCK_NUMBER, CR_VDMC_MACROBLOCK_Y_OFFSET */
+#define MSVDX_VDMC_CR_VDMC_MACROBLOCK_NUMBER_CR_VDMC_MACROBLOCK_Y_OFFSET_MASK           (0xFFFF0000)
+#define MSVDX_VDMC_CR_VDMC_MACROBLOCK_NUMBER_CR_VDMC_MACROBLOCK_Y_OFFSET_SHIFT          (16)
+
+#endif /* _IMG_MSVDX_VDMC_REGS_H */
diff --git a/drivers/staging/media/vxd/decoder/img_msvdx_vec_regs.h b/drivers/staging/media/vxd/decoder/img_msvdx_vec_regs.h
new file mode 100644
index 000000000000..58840d501b53
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/img_msvdx_vec_regs.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * IMG MSVDX VEC Registers
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
+#if !defined(__MSVDX_VEC_REGS_H__)
+#define __MSVDX_VEC_REGS_H__
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+	/* MSVDX_VEC, CR_VEC_VLR_COMMANDS_NUM, VLR_COMMANDS_STORE_NUMBER_OF_CMDS */
+#define MSVDX_VEC_CR_VEC_VLC_TABLE_ADDR0_OFFSET         (0x00EC)
+
+	/* MSVDX_VEC, CR_VEC_VLC_TABLE_ADDR0, VLC_TABLE_ADDR0 */
+#define MSVDX_VEC_CR_VEC_VLC_TABLE_ADDR0_VLC_TABLE_ADDR0_MASK           (0x000007FF)
+
+	/* MSVDX_VEC, CR_VEC_VLC_TABLE_ADDR15, VLC_TABLE_ADDR31 */
+#define MSVDX_VEC_CR_VEC_VLC_TABLE_ADDR16_OFFSET                (0x01C0)
+
+	/* MSVDX_VEC, CR_VEC_VLC_TABLE_ADDR15, VLC_TABLE_ADDR31 */
+#define MSVDX_VEC_CR_VEC_VLC_TABLE_ADDR16_OFFSET                (0x01C0)
+
+	/* MSVDX_VEC, CR_VEC_VLC_TABLE_ADDR18, VLC_TABLE_ADDR37 */
+#define MSVDX_VEC_CR_VEC_VLC_TABLE_INITIAL_WIDTH0_OFFSET                (0x012C)
+
+	/* MSVDX_VEC, CR_VEC_VLC_TABLE_ADDR0, VLC_TABLE_ADDR1 */
+#define MSVDX_VEC_CR_VEC_VLC_TABLE_ADDR0_VLC_TABLE_ADDR1_SHIFT          (11)
+
+	/* MSVDX_VEC, CR_VEC_VLC_TABLE_INITIAL_WIDTH0, VLC_TABLE_INITIAL_WIDTH0 */
+#define MSVDX_VEC_CR_VEC_VLC_TABLE_INITIAL_WIDTH0_VLC_TABLE_INITIAL_WIDTH0_MASK         (0x00000007)
+
+	/* MSVDX_VEC, CR_VEC_VLC_TABLE_INITIAL_WIDTH0, VLC_TABLE_INITIAL_WIDTH1 */
+#define MSVDX_VEC_CR_VEC_VLC_TABLE_INITIAL_WIDTH0_VLC_TABLE_INITIAL_WIDTH1_SHIFT	(3)
+
+	/* MSVDX_VEC, CR_VEC_VLC_TABLE_INITIAL_OPCODE0, VLC_TABLE_INITIAL_OPCODE0 */
+#define MSVDX_VEC_CR_VEC_VLC_TABLE_INITIAL_OPCODE0_VLC_TABLE_INITIAL_OPCODE0_MASK \
+	(0x00000003)
+
+	/* MSVDX_VEC, CR_VEC_VLC_TABLE_INITIAL_WIDTH3, VLC_TABLE_INITIAL_WIDTH37 */
+#define MSVDX_VEC_CR_VEC_VLC_TABLE_INITIAL_OPCODE0_OFFSET               (0x013C)
+
+	/* MSVDX_VEC, CR_VEC_VLC_TABLE_INITIAL_OPCODE0, VLC_TABLE_INITIAL_OPCODE1 */
+#define MSVDX_VEC_CR_VEC_VLC_TABLE_INITIAL_OPCODE0_VLC_TABLE_INITIAL_OPCODE1_SHIFT              (2)
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* __MSVDX_VEC_REGS_H__ */
diff --git a/drivers/staging/media/vxd/decoder/img_pvdec_core_regs.h b/drivers/staging/media/vxd/decoder/img_pvdec_core_regs.h
new file mode 100644
index 000000000000..70bb68a3154f
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/img_pvdec_core_regs.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * IMG PVDEC CORE Registers
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
+#ifndef _IMG_PVDEC_CORE_REGS_H
+#define _IMG_PVDEC_CORE_REGS_H
+
+/* PVDEC_CORE, CR_PVDEC_HOST_INTERRUPT_STATUS, CR_HOST_SYS_WDT */
+#define PVDEC_CORE_CR_PVDEC_HOST_INTERRUPT_STATUS_CR_HOST_SYS_WDT_MASK          (0x10000000)
+
+#define PVDEC_CORE_CR_PVDEC_HOST_INTERRUPT_STATUS_CR_HOST_SYS_WDT_SHIFT         (28)
+
+/* PVDEC_CORE, CR_PVDEC_HOST_INTERRUPT_STATUS, CR_HOST_READ_TIMEOUT_PROC_IRQ */
+#define PVDEC_CORE_CR_PVDEC_HOST_INTERRUPT_STATUS_CR_HOST_READ_TIMEOUT_PROC_IRQ_MASK \
+									(0x08000000)
+
+/* PVDEC_CORE, CR_PVDEC_CORE_REV, CR_PVDEC_MAJOR_REV */
+#define PVDEC_CORE_CR_PVDEC_CORE_REV_CR_PVDEC_MAJOR_REV_MASK            (0x00FF0000)
+#define PVDEC_CORE_CR_PVDEC_CORE_REV_CR_PVDEC_MAJOR_REV_SHIFT           (16)
+
+/* PVDEC_CORE, CR_PVDEC_CORE_REV, CR_PVDEC_MINOR_REV */
+#define PVDEC_CORE_CR_PVDEC_CORE_REV_CR_PVDEC_MINOR_REV_MASK            (0x0000FF00)
+#define PVDEC_CORE_CR_PVDEC_CORE_REV_CR_PVDEC_MINOR_REV_SHIFT           (8)
+
+/* PVDEC_CORE, CR_PVDEC_HOST_INTERRUPT_STATUS, CR_HOST_READ_TIMEOUT_PROC_IRQ */
+#define PVDEC_CORE_CR_PVDEC_HOST_INTERRUPT_STATUS_CR_HOST_READ_TIMEOUT_PROC_IRQ_SHIFT           (27)
+
+/* PVDEC_CORE, CR_PVDEC_HOST_INTERRUPT_STATUS, CR_HOST_COMMAND_TIMEOUT_PROC_IRQ */
+#define PVDEC_CORE_CR_PVDEC_HOST_INTERRUPT_STATUS_CR_HOST_COMMAND_TIMEOUT_PROC_IRQ_MASK \
+										(0x04000000)
+#define PVDEC_CORE_CR_PVDEC_HOST_INTERRUPT_STATUS_CR_HOST_COMMAND_TIMEOUT_PROC_IRQ_SHIFT \
+											(26)
+
+/* PVDEC_CORE, CR_PVDEC_CORE_ID, CR_GROUP_ID */
+#define PVDEC_CORE_CR_PVDEC_CORE_ID_CR_GROUP_ID_MASK            (0xFF000000)
+#define PVDEC_CORE_CR_PVDEC_CORE_ID_CR_GROUP_ID_SHIFT           (24)
+
+/* PVDEC_CORE, CR_PVDEC_CORE_REV, CR_PVDEC_MAINT_REV */
+#define PVDEC_CORE_CR_PVDEC_CORE_REV_CR_PVDEC_MAINT_REV_MASK            (0x000000FF)
+#define PVDEC_CORE_CR_PVDEC_CORE_REV_CR_PVDEC_MAINT_REV_SHIFT           (0)
+
+/* PVDEC_CORE, CR_PVDEC_CORE_ID, CR_CORE_ID */
+#define PVDEC_CORE_CR_PVDEC_CORE_ID_CR_CORE_ID_MASK             (0x00FF0000)
+#define PVDEC_CORE_CR_PVDEC_CORE_ID_CR_CORE_ID_SHIFT            (16)
+
+/* PVDEC_CORE, CR_PVDEC_CORE_ID, CR_PVDEC_CORE_CONFIG */
+#define PVDEC_CORE_CR_PVDEC_CORE_ID_CR_PVDEC_CORE_CONFIG_MASK           (0x0000FFFF)
+#define PVDEC_CORE_CR_PVDEC_CORE_ID_CR_PVDEC_CORE_CONFIG_SHIFT          (0)
+
+#endif /* _IMG_PVDEC_CORE_REGS_H */
diff --git a/drivers/staging/media/vxd/decoder/img_pvdec_pixel_regs.h b/drivers/staging/media/vxd/decoder/img_pvdec_pixel_regs.h
new file mode 100644
index 000000000000..be122c41d4b9
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/img_pvdec_pixel_regs.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * IMG PVDEC pixel Registers
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
+#ifndef _IMG_PVDEC_PIXEL_REGS_H
+#define _IMG_PVDEC_PIXEL_REGS_H
+
+/* PVDEC_PIXEL, CR_MAX_FRAME_CONFIG, CR_PVDEC_HOR_MSB */
+#define PVDEC_PIXEL_CR_MAX_FRAME_CONFIG_CR_PVDEC_HOR_MSB_MASK           (0x001F0000)
+
+#define PVDEC_PIXEL_CR_MAX_FRAME_CONFIG_CR_PVDEC_HOR_MSB_SHIFT          (16)
+
+/* PVDEC_PIXEL, CR_MAX_FRAME_CONFIG, CR_PVDEC_VER_MSB */
+#define PVDEC_PIXEL_CR_MAX_FRAME_CONFIG_CR_PVDEC_VER_MSB_MASK           (0x1F000000)
+#define PVDEC_PIXEL_CR_MAX_FRAME_CONFIG_CR_PVDEC_VER_MSB_SHIFT          (24)
+
+/* PVDEC_PIXEL, CR_MAX_FRAME_CONFIG, CR_MSVDX_HOR_MSB */
+#define PVDEC_PIXEL_CR_MAX_FRAME_CONFIG_CR_MSVDX_HOR_MSB_MASK           (0x0000001F)
+#define PVDEC_PIXEL_CR_MAX_FRAME_CONFIG_CR_MSVDX_HOR_MSB_SHIFT          (0)
+
+/* PVDEC_PIXEL, CR_MAX_FRAME_CONFIG, CR_MSVDX_VER_MSB */
+#define PVDEC_PIXEL_CR_MAX_FRAME_CONFIG_CR_MSVDX_VER_MSB_MASK           (0x00001F00)
+#define PVDEC_PIXEL_CR_MAX_FRAME_CONFIG_CR_MSVDX_VER_MSB_SHIFT          (8)
+
+#endif /* _IMG_PVDEC_PIXEL_REGS_H */
diff --git a/drivers/staging/media/vxd/decoder/img_pvdec_test_regs.h b/drivers/staging/media/vxd/decoder/img_pvdec_test_regs.h
new file mode 100644
index 000000000000..7cf2f2ded360
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/img_pvdec_test_regs.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * IMG PVDEC test Registers
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
+#ifndef _IMG_PVDEC_TEST_REGS_H
+#define _IMG_PVDEC_TEST_REGS_H
+
+/* PVDEC_TEST, RAND_STL_MEM_RDATA_CONFIG, STALL_ENABLE_MEM_RDATA */
+#define PVDEC_TEST_MEM_READ_LATENCY_OFFSET              (0x00F0)
+
+/* PVDEC_TEST, MEM_READ_LATENCY, READ_RESPONSE_RAND_LATENCY */
+#define PVDEC_TEST_MEM_WRITE_RESPONSE_LATENCY_OFFSET            (0x00F4)
+
+/* PVDEC_TEST, MEM_WRITE_RESPONSE_LATENCY, WRITE_RESPONSE_RAND_LATENCY */
+#define PVDEC_TEST_MEM_CTRL_OFFSET              (0x00F8)
+
+/* PVDEC_TEST, RAND_STL_MEM_WDATA_CONFIG, STALL_ENABLE_MEM_WDATA */
+#define PVDEC_TEST_RAND_STL_MEM_WRESP_CONFIG_OFFSET             (0x00E8)
+
+/* PVDEC_TEST, RAND_STL_MEM_WRESP_CONFIG, STALL_ENABLE_MEM_WRESP */
+#define PVDEC_TEST_RAND_STL_MEM_RDATA_CONFIG_OFFSET             (0x00EC)
+
+/* PVDEC_TEST, MEMORY_BUS2_MONITOR_2, BUS2_ADDR */
+#define PVDEC_TEST_RAND_STL_MEM_CMD_CONFIG_OFFSET               (0x00E0)
+
+/* PVDEC_TEST, RAND_STL_MEM_CMD_CONFIG, STALL_ENABLE_MEM_CMD */
+#define PVDEC_TEST_RAND_STL_MEM_WDATA_CONFIG_OFFSET             (0x00E4)
+
+#endif /* _IMG_PVDEC_TEST_REGS_H */
diff --git a/drivers/staging/media/vxd/decoder/img_vdec_fw_msg.h b/drivers/staging/media/vxd/decoder/img_vdec_fw_msg.h
new file mode 100644
index 000000000000..5a655b552f14
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/img_vdec_fw_msg.h
@@ -0,0 +1,192 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * IMG VDEC firmware messages
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
+#ifndef _IMG_VDEC_FW_MSG_H
+#define _IMG_VDEC_FW_MSG_H
+
+#include <linux/types.h>
+
+/* FW_DEVA_COMPLETED     ERROR_FLAGS */
+#define FW_DEVA_COMPLETED_ERROR_FLAGS_TYPE              unsigned short
+#define FW_DEVA_COMPLETED_ERROR_FLAGS_MASK		(0xFFFF)
+#define FW_DEVA_COMPLETED_ERROR_FLAGS_SHIFT		(0)
+#define FW_DEVA_COMPLETED_ERROR_FLAGS_OFFSET		(0x000C)
+
+/* FW_DEVA_COMPLETED     NUM_BEWDTS */
+#define FW_DEVA_COMPLETED_NUM_BEWDTS_TYPE               unsigned int
+#define FW_DEVA_COMPLETED_NUM_BEWDTS_MASK               (0xFFFFFFFF)
+#define FW_DEVA_COMPLETED_NUM_BEWDTS_SHIFT              (0)
+#define FW_DEVA_COMPLETED_NUM_BEWDTS_OFFSET		(0x0010)
+
+/* FW_DEVA_COMPLETED     NUM_MBSDROPPED */
+#define FW_DEVA_COMPLETED_NUM_MBSDROPPED_TYPE           unsigned int
+#define FW_DEVA_COMPLETED_NUM_MBSDROPPED_MASK           (0xFFFFFFFF)
+#define FW_DEVA_COMPLETED_NUM_MBSDROPPED_SHIFT          (0)
+#define FW_DEVA_COMPLETED_NUM_MBSDROPPED_OFFSET		(0x0014)
+
+/* FW_DEVA_COMPLETED     NUM_MBSRECOVERED */
+#define FW_DEVA_COMPLETED_NUM_MBSRECOVERED_TYPE         unsigned int
+#define FW_DEVA_COMPLETED_NUM_MBSRECOVERED_MASK         (0xFFFFFFFF)
+#define FW_DEVA_COMPLETED_NUM_MBSRECOVERED_SHIFT        (0)
+#define FW_DEVA_COMPLETED_NUM_MBSRECOVERED_OFFSET	(0x0018)
+
+/* FW_DEVA_PANIC     ERROR_INT */
+#define FW_DEVA_PANIC_ERROR_INT_TYPE            unsigned int
+#define FW_DEVA_PANIC_ERROR_INT_MASK            (0xFFFFFFFF)
+#define FW_DEVA_PANIC_ERROR_INT_SHIFT           (0)
+#define FW_DEVA_PANIC_ERROR_INT_OFFSET          (0x000C)
+
+/* FW_ASSERT     FILE_NAME_HASH */
+#define FW_ASSERT_FILE_NAME_HASH_TYPE           unsigned int
+#define FW_ASSERT_FILE_NAME_HASH_MASK           (0xFFFFFFFF)
+#define FW_ASSERT_FILE_NAME_HASH_SHIFT          (0)
+#define FW_ASSERT_FILE_NAME_HASH_OFFSET         (0x0004)
+
+/* FW_ASSERT     FILE_LINE */
+#define FW_ASSERT_FILE_LINE_TYPE                unsigned int
+#define FW_ASSERT_FILE_LINE_MASK                (0xFFFFFFFE)
+#define FW_ASSERT_FILE_LINE_SHIFT               (1)
+#define FW_ASSERT_FILE_LINE_OFFSET              (0x0008)
+
+/* FW_SO     TASK_NAME */
+#define FW_SO_TASK_NAME_TYPE            unsigned int
+#define FW_SO_TASK_NAME_MASK            (0xFFFFFFFF)
+#define FW_SO_TASK_NAME_SHIFT           (0)
+#define FW_SO_TASK_NAME_OFFSET          (0x0004)
+
+/* FW_DEVA_GENMSG     TRANS_ID */
+#define FW_DEVA_GENMSG_TRANS_ID_TYPE            unsigned int
+#define FW_DEVA_GENMSG_TRANS_ID_MASK            (0xFFFFFFFF)
+#define FW_DEVA_GENMSG_TRANS_ID_SHIFT           (0)
+#define FW_DEVA_GENMSG_TRANS_ID_OFFSET          (0x0008)
+
+/* FW_DEVA_GENMSG     MSG_TYPE */
+#define FW_DEVA_GENMSG_MSG_TYPE_TYPE            unsigned char
+#define FW_DEVA_GENMSG_MSG_TYPE_MASK            (0xFF)
+#define FW_DEVA_GENMSG_MSG_TYPE_SHIFT           (0)
+#define FW_DEVA_GENMSG_MSG_TYPE_OFFSET          (0x0001)
+
+/* FW_DEVA_SIGNATURES     SIGNATURES */
+#define FW_DEVA_SIGNATURES_SIGNATURES_OFFSET            (0x0010)
+
+/* FW_DEVA_SIGNATURES     MSG_SIZE */
+#define FW_DEVA_SIGNATURES_MSG_SIZE_TYPE                unsigned char
+#define FW_DEVA_SIGNATURES_MSG_SIZE_MASK                (0x7F)
+#define FW_DEVA_SIGNATURES_MSG_SIZE_SHIFT               (0)
+#define FW_DEVA_SIGNATURES_MSG_SIZE_OFFSET              (0x0000)
+
+/* FW_DEVA_CONTIGUITY_WARNING     BEGIN_MB_NUM */
+#define FW_DEVA_SIGNATURES_SIZE         (20)
+
+/* FW_DEVA_SIGNATURES     SIGNATURE_SELECT */
+#define FW_DEVA_SIGNATURES_SIGNATURE_SELECT_TYPE                unsigned int
+#define FW_DEVA_SIGNATURES_SIGNATURE_SELECT_MASK                (0xFFFFFFFF)
+#define FW_DEVA_SIGNATURES_SIGNATURE_SELECT_SHIFT               (0)
+#define FW_DEVA_SIGNATURES_SIGNATURE_SELECT_OFFSET              (0x000C)
+
+/* FW_DEVA_GENMSG     TRANS_ID */
+#define FW_DEVA_DECODE_SIZE             (52)
+
+/* FW_DEVA_DECODE     CTRL_ALLOC_ADDR */
+#define FW_DEVA_DECODE_CTRL_ALLOC_ADDR_TYPE             unsigned int
+#define FW_DEVA_DECODE_CTRL_ALLOC_ADDR_MASK             (0xFFFFFFFF)
+#define FW_DEVA_DECODE_CTRL_ALLOC_ADDR_SHIFT            (0)
+#define FW_DEVA_DECODE_CTRL_ALLOC_ADDR_OFFSET           (0x0010)
+
+/* FW_DEVA_DECODE     BUFFER_SIZE */
+#define FW_DEVA_DECODE_BUFFER_SIZE_TYPE         unsigned short
+#define FW_DEVA_DECODE_BUFFER_SIZE_MASK         (0xFFFF)
+#define FW_DEVA_DECODE_BUFFER_SIZE_SHIFT	(0)
+#define FW_DEVA_DECODE_BUFFER_SIZE_OFFSET	(0x000E)
+
+/* FW_DEVA_DECODE     OPERATING_MODE */
+#define FW_DEVA_DECODE_OPERATING_MODE_TYPE              unsigned int
+#define FW_DEVA_DECODE_OPERATING_MODE_MASK              (0xFFFFFFFF)
+#define FW_DEVA_DECODE_OPERATING_MODE_OFFSET            (0x0018)
+#define FW_DEVA_DECODE_OPERATING_MODE_SHIFT             (0)
+
+/* FW_DEVA_DECODE     FLAGS */
+#define FW_DEVA_DECODE_FLAGS_TYPE               unsigned short
+#define FW_DEVA_DECODE_FLAGS_MASK               (0xFFFF)
+#define FW_DEVA_DECODE_FLAGS_SHIFT              (0)
+#define FW_DEVA_DECODE_FLAGS_OFFSET             (0x000C)
+
+/* FW_DEVA_DECODE     VDEC_FLAGS */
+#define FW_DEVA_DECODE_VDEC_FLAGS_TYPE          unsigned char
+#define FW_DEVA_DECODE_VDEC_FLAGS_MASK          (0xFF)
+#define FW_DEVA_DECODE_VDEC_FLAGS_SHIFT         (0)
+#define FW_DEVA_DECODE_VDEC_FLAGS_OFFSET	(0x001E)
+
+/* FW_DEVA_DECODE     GENC_ID */
+#define FW_DEVA_DECODE_GENC_ID_TYPE             unsigned int
+#define FW_DEVA_DECODE_GENC_ID_MASK             (0xFFFFFFFF)
+#define FW_DEVA_DECODE_GENC_ID_SHIFT            (0)
+#define FW_DEVA_DECODE_GENC_ID_OFFSET           (0x0028)
+
+/* FW_DEVA_DECODE     MB_LOAD */
+#define FW_DEVA_DECODE_MB_LOAD_TYPE             unsigned int
+#define FW_DEVA_DECODE_MB_LOAD_MASK             (0xFFFFFFFF)
+#define FW_DEVA_DECODE_MB_LOAD_OFFSET           (0x0030)
+#define FW_DEVA_DECODE_MB_LOAD_SHIFT            (0)
+#define FW_DEVA_DECODE_FRAGMENT_SIZE            (16)
+
+/* FW_DEVA_DECODE     STREAMID */
+#define FW_DEVA_DECODE_STREAMID_TYPE            unsigned char
+#define FW_DEVA_DECODE_STREAMID_MASK            (0xFF)
+#define FW_DEVA_DECODE_STREAMID_OFFSET          (0x001F)
+#define FW_DEVA_DECODE_STREAMID_SHIFT           (0)
+
+/* FW_DEVA_DECODE     EXT_STATE_BUFFER */
+#define FW_DEVA_DECODE_EXT_STATE_BUFFER_TYPE            unsigned int
+#define FW_DEVA_DECODE_EXT_STATE_BUFFER_MASK            (0xFFFFFFFF)
+#define FW_DEVA_DECODE_EXT_STATE_BUFFER_OFFSET          (0x0020)
+#define FW_DEVA_DECODE_EXT_STATE_BUFFER_SHIFT           (0)
+
+/* FW_DEVA_DECODE     MSG_ID */
+#define FW_DEVA_DECODE_MSG_ID_TYPE              unsigned short
+#define FW_DEVA_DECODE_MSG_ID_MASK              (0xFFFF)
+#define FW_DEVA_DECODE_MSG_ID_OFFSET            (0x0002)
+#define FW_DEVA_DECODE_MSG_ID_SHIFT             (0)
+
+/* FW_DEVA_DECODE     TRANS_ID */
+#define FW_DEVA_DECODE_TRANS_ID_TYPE            unsigned int
+#define FW_DEVA_DECODE_TRANS_ID_MASK            (0xFFFFFFFF)
+#define FW_DEVA_DECODE_TRANS_ID_OFFSET          (0x0008)
+#define FW_DEVA_DECODE_TRANS_ID_SHIFT           (0)
+
+/* FW_DEVA_DECODE     TILE_CFG */
+#define FW_DEVA_DECODE_TILE_CFG_TYPE            unsigned int
+#define FW_DEVA_DECODE_TILE_CFG_MASK            (0xFFFFFFFF)
+#define FW_DEVA_DECODE_TILE_CFG_OFFSET          (0x0024)
+#define FW_DEVA_DECODE_TILE_CFG_SHIFT           (0)
+
+/* FW_DEVA_GENMSG     MSG_SIZE */
+#define FW_DEVA_GENMSG_MSG_SIZE_TYPE            unsigned char
+#define FW_DEVA_GENMSG_MSG_SIZE_MASK            (0x7F)
+#define FW_DEVA_GENMSG_MSG_SIZE_OFFSET          (0x0000)
+#define FW_DEVA_GENMSG_MSG_SIZE_SHIFT           (0)
+
+/* FW_DEVA_DECODE_FRAGMENT     CTRL_ALLOC_ADDR */
+#define FW_DEVA_DECODE_FRAGMENT_CTRL_ALLOC_ADDR_TYPE            unsigned int
+#define FW_DEVA_DECODE_FRAGMENT_CTRL_ALLOC_ADDR_MASK            (0xFFFFFFFF)
+#define FW_DEVA_DECODE_FRAGMENT_CTRL_ALLOC_ADDR_OFFSET          (0x000C)
+#define FW_DEVA_DECODE_FRAGMENT_CTRL_ALLOC_ADDR_SHIFT           (0)
+
+/* FW_DEVA_DECODE_FRAGMENT     BUFFER_SIZE */
+#define FW_DEVA_DECODE_FRAGMENT_BUFFER_SIZE_TYPE                unsigned short
+#define FW_DEVA_DECODE_FRAGMENT_BUFFER_SIZE_MASK                (0xFFFF)
+#define FW_DEVA_DECODE_FRAGMENT_BUFFER_SIZE_OFFSET              (0x000A)
+#define FW_DEVA_DECODE_FRAGMENT_BUFFER_SIZE_SHIFT               (0)
+
+#endif /* _IMG_VDEC_FW_MSG_H */
diff --git a/drivers/staging/media/vxd/decoder/img_video_bus4_mmu_regs.h b/drivers/staging/media/vxd/decoder/img_video_bus4_mmu_regs.h
new file mode 100644
index 000000000000..34c1cf4e55ec
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/img_video_bus4_mmu_regs.h
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * IMG video bus4 mmu registers
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
+#ifndef _IMG_VIDEO_BUS4_MMU_REGS_H
+#define _IMG_VIDEO_BUS4_MMU_REGS_H
+
+#define IMG_VIDEO_BUS4_MMU_MMU_DIR_BASE_ADDR_OFFSET             (0x0020)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_ADDRESS_CONTROL, MMU_BYPASS */
+#define IMG_VIDEO_BUS4_MMU_MMU_ADDRESS_CONTROL_MMU_BYPASS_MASK          (0x00000001)
+#define IMG_VIDEO_BUS4_MMU_MMU_ADDRESS_CONTROL_MMU_BYPASS_SHIFT         (0)
+
+/* IMG_VIDEO_BUS4_MMU, REQUEST_LIMITED_THROUGHPUT, REQUEST_GAP */
+#define IMG_VIDEO_BUS4_MMU_MMU_ADDRESS_CONTROL_OFFSET           (0x0070)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_CONTROL1, MMU_SOFT_RESET */
+#define IMG_VIDEO_BUS4_MMU_MMU_BANK_INDEX_OFFSET                (0x0010)
+#define IMG_VIDEO_BUS4_MMU_MMU_CONTROL1_MMU_SOFT_RESET_SHIFT    (28)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_TILE_MAX_ADDR, TILE_MAX_ADDR */
+#define IMG_VIDEO_BUS4_MMU_MMU_CONTROL0_OFFSET          (0x0000)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_CONTROL0, MMU_TILING_SCHEME */
+#define IMG_VIDEO_BUS4_MMU_MMU_CONTROL0_MMU_TILING_SCHEME_MASK          (0x00000001)
+#define IMG_VIDEO_BUS4_MMU_MMU_CONTROL0_MMU_TILING_SCHEME_SHIFT         (0)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_TILE_CFG, TILE_STRIDE */
+#define IMG_VIDEO_BUS4_MMU_MMU_TILE_MIN_ADDR_STRIDE             (4)
+#define IMG_VIDEO_BUS4_MMU_MMU_TILE_MIN_ADDR_OFFSET             (0x0050)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_TILE_MIN_ADDR, TILE_MIN_ADDR */
+#define IMG_VIDEO_BUS4_MMU_MMU_TILE_MAX_ADDR_OFFSET             (0x0060)
+#define IMG_VIDEO_BUS4_MMU_MMU_TILE_MAX_ADDR_STRIDE             (4)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_STATUS1, MMU_FAULT_RNW */
+#define IMG_VIDEO_BUS4_MMU_MMU_MEM_REQ_OFFSET           (0x0090)
+#define IMG_VIDEO_BUS4_MMU_MMU_STATUS1_MMU_FAULT_RNW_MASK               (0x10000000)
+#define IMG_VIDEO_BUS4_MMU_MMU_STATUS1_MMU_FAULT_RNW_SHIFT              (28)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_MEM_REQ, TAG_OUTSTANDING */
+#define IMG_VIDEO_BUS4_MMU_MMU_MEM_REQ_TAG_OUTSTANDING_MASK             (0x000003FF)
+#define IMG_VIDEO_BUS4_MMU_MMU_MEM_REQ_TAG_OUTSTANDING_SHIFT            (0)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_CONTROL0, USE_TILE_STRIDE_PER_CONTEXT */
+#define IMG_VIDEO_BUS4_MMU_MMU_CONTROL1_OFFSET          (0x0008)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_CONTROL1, MMU_SOFT_RESET */
+#define IMG_VIDEO_BUS4_MMU_MMU_CONTROL1_MMU_SOFT_RESET_MASK             (0x10000000)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_CONTROL1, MMU_PAUSE_SET */
+#define IMG_VIDEO_BUS4_MMU_MMU_CONTROL1_MMU_PAUSE_SET_MASK              (0x01000000)
+#define IMG_VIDEO_BUS4_MMU_MMU_CONTROL1_MMU_PAUSE_SET_SHIFT             (24)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_CONTROL1, MMU_PAUSE_CLEAR */
+#define IMG_VIDEO_BUS4_MMU_MMU_CONTROL1_MMU_PAUSE_CLEAR_MASK            (0x02000000)
+#define IMG_VIDEO_BUS4_MMU_MMU_CONTROL1_MMU_PAUSE_CLEAR_SHIFT           (25)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_ADDRESS_CONTROL, UPPER_ADDRESS_FIXED */
+#define IMG_VIDEO_BUS4_MMU_MMU_CONFIG0_OFFSET           (0x0080)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_MEM_REQ, INT_PROTOCOL_FAULT */
+#define IMG_VIDEO_BUS4_MMU_MMU_MEM_EXT_OUTSTANDING_OFFSET               (0x0094)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_CONFIG0, TAGS_SUPPORTED */
+#define IMG_VIDEO_BUS4_MMU_MMU_CONFIG1_OFFSET           (0x0084)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_CONTROL1, MMU_INVALDC */
+#define IMG_VIDEO_BUS4_MMU_MMU_CONTROL1_MMU_INVALDC_MASK                (0x00000F00)
+#define IMG_VIDEO_BUS4_MMU_MMU_CONTROL1_MMU_INVALDC_SHIFT               (8)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_CONFIG1, SUPPORT_SECURE */
+#define IMG_VIDEO_BUS4_MMU_MMU_STATUS0_OFFSET           (0x0088)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_STATUS0, MMU_FAULT_ADDR */
+#define IMG_VIDEO_BUS4_MMU_MMU_STATUS1_OFFSET           (0x008C)
+#define IMG_VIDEO_BUS4_MMU_MMU_STATUS0_MMU_FAULT_ADDR_SHIFT             (12)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_STATUS0, MMU_FAULT_ADDR */
+#define IMG_VIDEO_BUS4_MMU_MMU_STATUS0_MMU_FAULT_ADDR_MASK              (0xFFFFF000)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_STATUS0, MMU_PF_N_RW */
+#define IMG_VIDEO_BUS4_MMU_MMU_STATUS0_MMU_PF_N_RW_MASK         (0x00000001)
+#define IMG_VIDEO_BUS4_MMU_MMU_STATUS0_MMU_PF_N_RW_SHIFT        (0)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_STATUS1, MMU_FAULT_REQ_ID */
+#define IMG_VIDEO_BUS4_MMU_MMU_STATUS1_MMU_FAULT_REQ_ID_MASK            (0x003F0000)
+#define IMG_VIDEO_BUS4_MMU_MMU_STATUS1_MMU_FAULT_REQ_ID_SHIFT           (16)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_STATUS0, MMU_SECURE_FAULT */
+#define IMG_VIDEO_BUS4_MMU_MMU_STATUS0_MMU_SECURE_FAULT_MASK            (0x00000002)
+#define IMG_VIDEO_BUS4_MMU_MMU_STATUS0_MMU_SECURE_FAULT_SHIFT           (1)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_CONFIG1, SUPPORT_STRIDE_PER_CONTEXT */
+#define IMG_VIDEO_BUS4_MMU_MMU_CONFIG1_SUPPORT_STRIDE_PER_CONTEXT_MASK          (0x20000000)
+#define IMG_VIDEO_BUS4_MMU_MMU_CONFIG1_SUPPORT_STRIDE_PER_CONTEXT_SHIFT         (29)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_CONFIG1, SUPPORT_SECURE */
+#define IMG_VIDEO_BUS4_MMU_MMU_CONFIG1_SUPPORT_SECURE_MASK              (0x80000000)
+#define IMG_VIDEO_BUS4_MMU_MMU_CONFIG1_SUPPORT_SECURE_SHIFT             (31)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_CONFIG0, EXTENDED_ADDR_RANGE */
+#define IMG_VIDEO_BUS4_MMU_MMU_CONFIG0_EXTENDED_ADDR_RANGE_MASK         (0x000000F0)
+#define IMG_VIDEO_BUS4_MMU_MMU_CONFIG0_EXTENDED_ADDR_RANGE_SHIFT        (4)
+
+/* IMG_VIDEO_BUS4_MMU, MMU_CONFIG0, GROUP_OVERRIDE_SIZE */
+#define IMG_VIDEO_BUS4_MMU_MMU_CONFIG0_GROUP_OVERRIDE_SIZE_MASK         (0x00000700)
+#define IMG_VIDEO_BUS4_MMU_MMU_CONFIG0_GROUP_OVERRIDE_SIZE_SHIFT        (8)
+
+#endif /* _IMG_VIDEO_BUS4_MMU_REGS_H */
diff --git a/drivers/staging/media/vxd/decoder/jpegfw_data_shared.h b/drivers/staging/media/vxd/decoder/jpegfw_data_shared.h
new file mode 100644
index 000000000000..2448fde864fb
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/jpegfw_data_shared.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Public data structures for the hevc parser firmware module
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Sunita Nadampalli <sunitan@ti.com>
+ *
+ * Re-written for upstream
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+#ifdef USE_SHARING
+#endif
+
+#ifndef _JPEGFW_DATA_H_
+#define _JPEGFW_DATA_H_
+
+#include "vdecfw_share.h"
+#include "vdecfw_shared.h"
+
+#define JPEG_VDEC_8x8_DCT_SIZE             64 //!< Number of elements in 8x8 DCT
+#define JPEG_VDEC_MAX_COMPONENTS           4  //!< Maximum number of component in JPEG
+#define JPEG_VDEC_MAX_SETS_HUFFMAN_TABLES  2  //!< Maximum set of huffman table in JPEG
+#define JPEG_VDEC_MAX_QUANT_TABLES         4  //!< Maximum set of quantisation table in JPEG
+#define JPEG_VDEC_TABLE_CLASS_NUM          2  //!< Maximum set of class of huffman table in JPEG
+#define JPEG_VDEC_PLANE_MAX                4  //!< Maximum number of planes
+
+struct hentry {
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned short, code);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char, codelen);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char, value);
+};
+
+/*
+ * This structure contains JPEG huffmant table
+ * NOTE: Should only contain JPEG specific information.
+ * @brief  JPEG Huffman Table Information
+ */
+struct vdec_jpeg_huffman_tableinfo {
+	/* number of bits */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char, bits[16]);
+	/* codeword value */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char, values[256]);
+};
+
+/*
+ * This structure contains JPEG DeQunatisation table
+ * NOTE: Should only contain JPEG specific information.
+ * @brief  JPEG Dequantisation Table Information
+ */
+struct vdec_jpeg_de_quant_tableinfo {
+	/* Qunatisation precision */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char, precision);
+	/* Qunatisation Value for 8x8 DCT  */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned short, elements[64]);
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
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned int,
+			plane_offsets[JPEG_VDEC_PLANE_MAX]);
+	/* SOS fields count value */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned char, hdr_sos_count);
+};
+
+/*
+ * This describes the JPEG  parser component "Context data".
+ * JPEG does not need any data to be saved between pictures, this structure
+ * is needed only to fit in firmware framework.
+ */
+struct jpegfw_context_data {
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned int, dummy);
+};
+
+#endif /* _JPEGFW_DATA_H_ */
diff --git a/drivers/staging/media/vxd/decoder/mem_io.h b/drivers/staging/media/vxd/decoder/mem_io.h
new file mode 100644
index 000000000000..1e63f889f258
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/mem_io.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * IMG PVDEC pixel Registers
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
+#ifndef _MEM_IO_H
+#define _MEM_IO_H
+
+#include <linux/types.h>
+
+#include "reg_io2.h"
+
+#define MEMIO_CHECK_ALIGNMENT(vpmem)        \
+	IMG_ASSERT((vpmem))
+
+#define MEMIO_READ_FIELD(vpmem, field) \
+	((((*((field ## _TYPE *)(((unsigned long)(vpmem)) + field ## _OFFSET))) & \
+	   field ## _MASK) >> field ## _SHIFT))
+
+#define MEMIO_WRITE_FIELD(vpmem, field, value, type) \
+	do { \
+		type __vpmem = vpmem; \
+		MEMIO_CHECK_ALIGNMENT(__vpmem); \
+		(*((field ## _TYPE *)(((unsigned long)(__vpmem)) + \
+				      field ## _OFFSET))) = \
+			(field ## _TYPE)(((*((field ## _TYPE *)(((unsigned long)(__vpmem)) + \
+								field ## _OFFSET))) & \
+					  ~(field ## _TYPE)field ## _MASK) | \
+					 (field ## _TYPE)(((value) << field ## _SHIFT) & \
+							  field ## _MASK)); \
+	} while (0) \
+
+#endif /* _MEM_IO_H */
diff --git a/drivers/staging/media/vxd/decoder/pvdec_entropy_regs.h b/drivers/staging/media/vxd/decoder/pvdec_entropy_regs.h
new file mode 100644
index 000000000000..3c495c198853
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/pvdec_entropy_regs.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * VXD DEC Common low level core interface component
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
+#ifndef __PVDEC_ENTROPY_REGS_H__
+#define __PVDEC_ENTROPY_REGS_H__
+
+/*
+ * PVDEC_ENTROPY, CR_ENTROPY_SHIFTREG_CONTROL, SR_SW_RESET
+ */
+#define PVDEC_ENTROPY_CR_GENC_BUFFER_SIZE_OFFSET                (0x0100)
+
+/*
+ * PVDEC_ENTROPY, CR_GENC_BUFFER_SIZE, GENC_BUFFER_SIZE
+ */
+#define PVDEC_ENTROPY_CR_GENC_BUFFER_BASE_ADDRESS_OFFSET                (0x0110)
+
+/*
+ * PVDEC_ENTROPY, CR_ENTROPY_SLICE_PARAMETER_SIZE, SLICE_PARAMETER_SIZE
+ */
+#define PVDEC_ENTROPY_CR_GENC_FRAGMENT_BASE_ADDRESS_OFFSET              (0x0098)
+
+#endif
diff --git a/drivers/staging/media/vxd/decoder/pvdec_int.h b/drivers/staging/media/vxd/decoder/pvdec_int.h
new file mode 100644
index 000000000000..01f5a038e69f
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/pvdec_int.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Low-level PVDEC interface component.
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
+#ifndef __PVDEC_INT_H__
+#define __PVDEC_INT_H__
+
+#include "hw_control.h"
+#include "vxd_ext.h"
+#include "vxd_props.h"
+
+/* How many VLC IDX addresses fits in single address register */
+#define PVDECIO_VLC_IDX_ADDR_PARTS 2
+
+/* How many VLC IDX initial fits in single width register */
+#define PVDECIO_VLC_IDX_WIDTH_PARTS 10
+
+/* How many VLC IDX initial opcodes fits in single opcode register */
+#define PVDECIO_VLC_IDX_OPCODE_PARTS 16
+
+/*
+ * Length (shift) of VLC IDX opcode field. We're taking [0][1] here, as it
+ * corresponds to shift of one element
+ */
+#define PVDECIO_VLC_IDX_ADDR_ID 2
+
+/*
+ * Mask for VLC IDX address field. We're taking [0][0] here, as it corresponds
+ * to unshifted mask
+ */
+#define PVDECIO_VLC_IDX_ADDR_MASK	MSVDX_VEC_CR_VEC_VLC_TABLE_ADDR0_VLC_TABLE_ADDR0_MASK
+
+/*
+ * Length (shift) of VLC IDX address field. We're taking [0][1] here, as it
+ * corresponds to shift of one element
+ */
+#define PVDECIO_VLC_IDX_ADDR_SHIFT	MSVDX_VEC_CR_VEC_VLC_TABLE_ADDR0_VLC_TABLE_ADDR1_SHIFT
+#define PVDECIO_VLC_IDX_WIDTH_ID	1
+
+/*
+ * Mask for VLC IDX width field. We're taking [0][0] here, as it corresponds
+ * to unshifted mask
+ */
+#define PVDECIO_VLC_IDX_WIDTH_MASK      \
+	MSVDX_VEC_CR_VEC_VLC_TABLE_INITIAL_WIDTH0_VLC_TABLE_INITIAL_WIDTH0_MASK
+
+/*
+ * Length (shift) of VLC IDX width field. We're taking [0][1] here, as it
+ * corresponds to shift of one element
+ */
+#define PVDECIO_VLC_IDX_WIDTH_SHIFT     \
+	MSVDX_VEC_CR_VEC_VLC_TABLE_INITIAL_WIDTH0_VLC_TABLE_INITIAL_WIDTH1_SHIFT
+
+#define PVDECIO_VLC_IDX_OPCODE_ID	0
+
+/*
+ * Length (shift) of VLC IDX opcode field. We're taking [0][1] here, as it
+ * corresponds to shift of one element
+ */
+#define PVDECIO_VLC_IDX_OPCODE_SHIFT    \
+	MSVDX_VEC_CR_VEC_VLC_TABLE_INITIAL_OPCODE0_VLC_TABLE_INITIAL_OPCODE1_SHIFT
+
+/* This comes from DEVA PVDEC FW */
+#define CTRL_ALLOC_MAX_SEGMENT_SIZE 1024
+
+/*
+ * Mask for VLC IDX opcode field. We're taking [0][0] here, as it corresponds
+ * to unshifted mask
+ */
+#define PVDECIO_VLC_IDX_OPCODE_MASK     \
+	MSVDX_VEC_CR_VEC_VLC_TABLE_INITIAL_OPCODE0_VLC_TABLE_INITIAL_OPCODE0_MASK
+
+#endif /* __PVDEC_INT_H__ */
diff --git a/drivers/staging/media/vxd/decoder/pvdec_vec_be_regs.h b/drivers/staging/media/vxd/decoder/pvdec_vec_be_regs.h
new file mode 100644
index 000000000000..06593f050a97
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/pvdec_vec_be_regs.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * VXD DEC Common low level core interface component
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
+#ifndef __PVDEC_VEC_BE_REGS_H__
+#define __PVDEC_VEC_BE_REGS_H__
+
+#define PVDEC_VEC_BE_CR_GENC_BUFFER_SIZE_OFFSET         (0x0040)
+
+/*
+ * PVDEC_VEC_BE, CR_GENC_BUFFER_SIZE, GENC_BUFFER_SIZE
+ */
+#define PVDEC_VEC_BE_CR_GENC_BUFFER_BASE_ADDRESS_OFFSET         (0x0050)
+
+/*
+ * PVDEC_VEC_BE, CR_MEM_TO_REG_CONTROL, MEM_TO_REG_NUM_PAIRS
+ */
+#define PVDEC_VEC_BE_CR_GENC_FRAGMENT_BASE_ADDRESS_OFFSET               (0x0030)
+
+/*
+ * PVDEC_VEC_BE, CR_GENC_CONTEXT1, GENC_CONTEXT1_1
+ */
+#define PVDEC_VEC_BE_CR_ABOVE_PARAM_BASE_ADDRESS_OFFSET         (0x00C0)
+
+#endif
diff --git a/drivers/staging/media/vxd/decoder/reg_io2.h b/drivers/staging/media/vxd/decoder/reg_io2.h
new file mode 100644
index 000000000000..a18ffda4efcb
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/reg_io2.h
@@ -0,0 +1,74 @@
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
+#ifndef REG_IO2_H_
+#define REG_IO2_H_
+
+#define IMG_ASSERT(expected) \
+	((void)((expected) || \
+	       (pr_err("Assertion failed: %s, file %s, line %d\n", \
+			   #expected, __FILE__, __LINE__), dump_stack(), 0)))
+
+/* This macro is used to extract a field from a register. */
+#define REGIO_READ_FIELD(regval, group, reg, field)     \
+	(((regval) & group ## _ ## reg ## _ ## field ## _MASK) >> \
+	 group ## _ ## reg ## _ ## field ## _SHIFT)
+
+#if (defined WIN32 || defined __linux__) && !defined NO_REGIO_CHECK_FIELD_VALUE
+/*
+ * Only provide register field range checking for Windows and
+ * Linux builds
+ * Simple range check that ensures that if bits outside the valid field
+ * range are set, that the provided value is at least consistent with a
+ * negative value (i.e.: all top bits are set to 1).
+ * Cannot perform more comprehensive testing without knowing
+ * whether field
+ * should be interpreted as signed or unsigned.
+ */
+#define REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, value, type) \
+	{ \
+		type __value = value; \
+		unsigned int temp = (unsigned int)(__value); \
+		if (temp > group ## _ ## reg ## _ ## field ## _LSBMASK) { \
+			IMG_ASSERT((((unsigned int)__value) & \
+			(unsigned int)~(group ## _ ## reg ## _ ## field ## _LSBMASK)) == \
+			(unsigned int)~(group ## _ ## reg ## _ ## field ## _LSBMASK));  \
+		}                                                       \
+	}
+#else
+#define REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, value, type)
+#endif
+
+/* This macro is used to update the value of a field in a register. */
+#define REGIO_WRITE_FIELD(regval, group, reg, field, value, reg_type, val_type) \
+	{                                                               \
+		reg_type __regval = regval; \
+		val_type __value = value; \
+		REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
+		(regval) =                                                      \
+		((__regval) & ~(group ## _ ## reg ## _ ## field ## _MASK)) |              \
+		(((unsigned int)(__value) << (group ## _ ## reg ## _ ## field ## _SHIFT)) & \
+		(group ## _ ## reg ## _ ## field ## _MASK));      \
+	}
+
+/* This macro is used to update the value of a field in a register. */
+#define REGIO_WRITE_FIELD_LITE(regval, group, reg, field, value, type)  \
+{                                                                       \
+	type __value = value; \
+	REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, type); \
+	(regval) |= ((unsigned int)(__value) << (group ## _ ## reg ## _ ## field ## _SHIFT)); \
+}
+
+#endif /* REG_IO2_H_ */
diff --git a/drivers/staging/media/vxd/decoder/vdecfw_share.h b/drivers/staging/media/vxd/decoder/vdecfw_share.h
new file mode 100644
index 000000000000..7c6b9df00472
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/vdecfw_share.h
@@ -0,0 +1,36 @@
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
+#ifndef _VDECFW_SHARE_H_
+#define _VDECFW_SHARE_H_
+
+/*
+ * This macro sets alignment for a field structure.
+ * Parameters :
+ * a - alignment value
+ * t - field type
+ * n - field name
+ */
+#define IMG_ALIGN_FIELD(a, t, n) t n  __aligned(a)
+
+/* END of vdecfw_share_macros.h */
+
+/*
+ * Field alignments in shared data structures
+ */
+/* Default field alignment */
+#define VDECFW_SHARE_DEFAULT_ALIGNMENT  4
+/* Pointer field alignment */
+#define VDECFW_SHARE_PTR_ALIGNMENT      4
+
+#endif /* _VDECFW_SHARE_H_ */
diff --git a/drivers/staging/media/vxd/decoder/vdecfw_shared.h b/drivers/staging/media/vxd/decoder/vdecfw_shared.h
new file mode 100644
index 000000000000..a582987d45bb
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/vdecfw_shared.h
@@ -0,0 +1,893 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Public data structures and enums for the firmware
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
+#ifdef USE_SHARING
+#endif
+
+#ifndef _VDECFW_H_
+#define _VDECFW_H_
+
+#include "img_msvdx_core_regs.h"
+#include "vdecfw_share.h"
+
+/* brief This type defines the buffer type */
+enum img_buffer_type {
+	IMG_BUFFERTYPE_FRAME       = 0,
+	IMG_BUFFERTYPE_FIELD_TOP,
+	IMG_BUFFERTYPE_FIELD_BOTTOM,
+	IMG_BUFFERTYPE_PAIR,
+	IMG_BUFFERTYPE_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/* Number of scaling coefficients */
+#define VDECFW_NUM_SCALE_COEFFS 4
+
+/*
+ * maximum number of pictures handled by the firmware
+ * for H.264 (largest requirement): 32 for 4 view MVC
+ */
+#define VDECFW_MAX_NUM_PICTURES 32
+#define VDECFW_MAX_NUM_VIEWS 4
+#define EMERALD_CORE    6
+
+/*
+ * maximum number of colocated pictures handled by
+ * firmware in FWBSP mode
+ */
+#define VDECFWBSP_MAX_NUM_COL_PICS 16
+
+/* Maximum number of colour planes. */
+#define VDECFW_PLANE_MAX 4
+
+#define VDECFW_NON_EXISTING_PICTURE_TID (0xffffffff)
+
+#define NO_VALUE    0
+
+/* Indicates whether a cyclic sequence number (x) has reached another (y). */
+#define HAS_X_REACHED_Y(x, y, range, type) \
+	({ \
+		type __x = x; \
+		type __y = y; \
+		type __range = range; \
+		(((((__x) - (__y) + (__range)) % (__range)) <= \
+		  (((__y) - (__x) + (__range)) % (__range))) ? TRUE : FALSE); })
+
+/* Indicates whether a cyclic sequence number (x) has passed another (y). */
+#define HAS_X_PASSED_Y(x, y, range, type) \
+	({ \
+		type __x = x; \
+		type __y = y; \
+		type __range = range; \
+		(((((__x) - (__y) + (__range)) % (__range)) < \
+		  (((__y) - (__x) + (__range)) % (__range))) ? TRUE : FALSE); })
+
+#define FWIF_BIT_MASK(num)                      ((1 << (num)) - 1)
+
+/*
+ * Number of bits in transaction ID used to represent picture number in stream.
+ */
+#define FWIF_NUMBITS_STREAM_PICTURE_ID          16
+/* Number of bits in transaction ID used to represent picture number in core. */
+#define FWIF_NUMBITS_CORE_PICTURE_ID            4
+/* Number of bits in transaction ID used to represent stream id. */
+#define FWIF_NUMBITS_STREAM_ID                  8
+/* Number of bits in transaction ID used to represent core id. */
+#define FWIF_NUMBITS_CORE_ID                    4
+
+/* Offset in transaction ID to picture number in stream. */
+#define FWIF_OFFSET_STREAM_PICTURE_ID           0
+/* Offset in transaction ID to picture number in core. */
+#define FWIF_OFFSET_CORE_PICTURE_ID                             \
+	(FWIF_OFFSET_STREAM_PICTURE_ID + FWIF_NUMBITS_STREAM_PICTURE_ID)
+/* Offset in transaction ID to stream id. */
+#define FWIF_OFFSET_STREAM_ID                                   \
+	(FWIF_OFFSET_CORE_PICTURE_ID + FWIF_NUMBITS_CORE_PICTURE_ID)
+/* Offset in transaction ID to core id. */
+#define FWIF_OFFSET_CORE_ID                                     \
+	(FWIF_OFFSET_STREAM_ID + FWIF_NUMBITS_STREAM_ID)
+
+/* Picture id (stream) from transaction id. */
+#define GET_STREAM_PICTURE_ID(transaction_id)                   \
+	((transaction_id) & FWIF_BIT_MASK(FWIF_NUMBITS_STREAM_PICTURE_ID))
+/* Picture id (core) from transaction id. */
+#define GET_CORE_PICTURE_ID(transaction_id)                     \
+	(((transaction_id) >> FWIF_OFFSET_CORE_PICTURE_ID) &    \
+	 FWIF_BIT_MASK(FWIF_NUMBITS_CORE_PICTURE_ID))
+/* Stream id from transaction id. */
+#define GET_STREAM_ID(transaction_id)                           \
+	(((transaction_id) >> FWIF_OFFSET_STREAM_ID) &          \
+	 FWIF_BIT_MASK(FWIF_NUMBITS_STREAM_ID))
+/* Core id from transaction id. */
+#define GET_CORE_ID(transaction_id)                             \
+	(((transaction_id) >> FWIF_OFFSET_CORE_ID) &            \
+	 FWIF_BIT_MASK(FWIF_NUMBITS_CORE_ID))
+
+/* Picture id (stream) for transaction id. */
+#define SET_STREAM_PICTURE_ID(str_pic_id)                       \
+	(((str_pic_id) & FWIF_BIT_MASK(FWIF_NUMBITS_STREAM_PICTURE_ID)) << \
+		FWIF_OFFSET_STREAM_PICTURE_ID)
+/* Picture id (core) for transaction id. */
+#define SET_CORE_PICTURE_ID(core_pic_id)                                \
+	(((core_pic_id) % (1 << FWIF_NUMBITS_CORE_PICTURE_ID)) <<       \
+		FWIF_OFFSET_CORE_PICTURE_ID)
+/* Stream id for transaction id. */
+#define SET_STREAM_ID(stream_id)                                \
+	(((stream_id) & FWIF_BIT_MASK(FWIF_NUMBITS_STREAM_ID)) <<       \
+		FWIF_OFFSET_STREAM_ID)
+/* Core id for transaction id. */
+#define SET_CORE_ID(core_id)                                    \
+	(((core_id) & FWIF_BIT_MASK(FWIF_NUMBITS_CORE_ID)) <<   \
+		FWIF_OFFSET_CORE_ID)
+/* flag checking */
+#define FLAG_MASK(_flagname_)                   ((1 << _flagname_ ## _SHIFT))
+#define FLAG_IS_SET(_flagsword_, _flagname_)                    \
+	(((_flagsword_) & FLAG_MASK(_flagname_)) ? TRUE : FALSE)
+
+/* This type defines the parser component types */
+enum vdecfw_codectype {
+	VDECFW_CODEC_H264 = 0,       /* H.264, AVC, MVC */
+	VDECFW_CODEC_MPEG4,          /* MPEG4, H.263, DivX, Sorenson */
+	VDECFW_CODEC_VP8,            /* VP8 */
+
+	VDECFW_CODEC_VC1,            /* VC1 (includes WMV9) */
+	VDECFW_CODEC_MPEG2,          /* MPEG2 */
+
+	VDECFW_CODEC_JPEG,           /* JPEG */
+
+	VDECFW_CODEC_VP6,            /* VP6 */
+	VDECFW_CODEC_AVS,            /* AVS */
+	VDECFW_CODEC_RV,             /* RV30, RV40 */
+
+	VDECFW_CODEC_HEVC,           /* HEVC/H265 */
+
+	VDECFW_CODEC_VP9,            /* VP9 */
+
+	VDECFW_CODEC_MAX,            /* End Marker */
+
+	VDEC_CODEC_NONE        = -1, /* No codec */
+	VDEC_CODEC_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/* This type defines the FW parser mode - SCP, size delimited, etc. */
+enum vdecfw_parsermode {
+	/* Every NAL is expected to have SCP */
+	VDECFW_SCP_ONLY = 0,
+	/* Every NAL is expect to be size delimited with field size 4 */
+	VDECFW_SIZE_DELIMITED_4_ONLY,
+	/* Every NAL is expect to be size delimited with field size 2 */
+	VDECFW_SIZE_DELIMITED_2_ONLY,
+	/* Every NAL is expect to be size delimited with field size 1 */
+	VDECFW_SIZE_DELIMITED_1_ONLY,
+	/* Size of NAL is provided in the picture header */
+	VDECFW_SIZE_SIDEBAND,
+	/* Unit is a skipped picture with no data to process */
+	VDECFW_SKIPPED_PICTURE,
+	VDECFW_SKIPPED_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * This enum defines values of ENTDEC_BE_MODE field of VEC_ENTDEC_BE_CONTROL
+ * register and ENTDEC_FE_MODE field of VEC_ENTDEC_FE_CONTROL register.
+ */
+enum vdecfw_msvdxentdecmode {
+	/* JPEG */
+	VDECFW_ENTDEC_MODE_JPEG        = 0x0,
+	/* H264 (MPEG4/AVC) */
+	VDECFW_ENTDEC_MODE_H264        = 0x1,
+	/* VC1 */
+	VDECFW_ENTDEC_MODE_VC1         = 0x2,
+	/* MPEG2 */
+	VDECFW_ENTDEC_MODE_MPEG2       = 0x3,
+	/* MPEG4 */
+	VDECFW_ENTDEC_MODE_MPEG4       = 0x4,
+	/* AVS */
+	VDECFW_ENTDEC_MODE_AVS         = 0x5,
+	/* WMV9 */
+	VDECFW_ENTDEC_MODE_WMV9        = 0x6,
+	/* MPEG1 */
+	VDECFW_ENTDEC_MODE_MPEG1       = 0x7,
+	/* RealVideo8, with ENTDEC_[BE|FE]_EXTENDED_MODE bit set */
+	VDECFW_ENTDEC_MODE_EXT_REAL8   = 0x0,
+	/* RealVideo9, with ENTDEC_[BE|FE]_EXTENDED_MODE bit set */
+	VDECFW_ENTDEC_MODE_EXT_REAL9   = 0x1,
+	/* VP6, with ENTDEC_[BE|FE]_EXTENDED_MODE bit set */
+	VDECFW_ENTDEC_MODE_EXT_VP6     = 0x2,
+	/* VP8, with ENTDEC_[BE|FE]_EXTENDED_MODE bit set */
+	VDECFW_ENTDEC_MODE_EXT_VP8     = 0x3,
+	/* SVC, with ENTDEC_[BE|FE]_EXTENDED_MODE bit set */
+	VDECFW_ENTDEC_MODE_EXT_SVC     = 0x4,
+	VDECFW_ENTDEC_MODE_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * This describes the Firmware Parser checkpoints in VEC Local RAM.
+ * Each checkpoint is updated with the TransactionID of the picture as it passes
+ * that point in its decode. Together they describe the current position of
+ * pictures in the VXD/Firmware pipeline.
+ *
+ * Numbers indicate point in the "VDEC Firmware Component Timing" diagram.
+ */
+enum vdecfw_progresscheckpoint {
+	/* Decode message has been read */
+	VDECFW_CHECKPOINT_PICTURE_STARTED     = 1,
+	/* Firmware has been loaded and bitstream DMA started */
+	VDECFW_CHECKPOINT_FIRMWARE_READY      = 2,
+	/* Picture management operations have completed */
+	VDECFW_CHECKPOINT_PICMAN_COMPLETE     = 3,
+	/* Firmware context for this picture has been saved */
+	VDECFW_CHECKPOINT_FIRMWARE_SAVED      = 4,
+	/*
+	 * 1st Picture/Slice header has been read,
+	 * registers written and Entdec started
+	 */
+	VDECFW_CHECKPOINT_ENTDEC_STARTED      = 5,
+	/* 1st Slice has been completed by Entdec */
+	VDECFW_CHECKPOINT_FE_1SLICE_DONE      = 6,
+	/* Parsing of picture has completed on FE */
+	VDECFW_CHECKPOINT_FE_PARSE_DONE       = 7,
+	/* Picture end code has been read and picture closed */
+	VDECFW_CHECKPOINT_FE_PICTURE_COMPLETE = 8,
+	/* Picture has started decoding on VXD Backend */
+	VDECFW_CHECKPOINT_BE_PICTURE_STARTED  = 9,
+	/* 1st Slice has completed on VXD Backend */
+	VDECFW_CHECKPOINT_BE_1SLICE_DONE      = 10,
+	/* Picture decode has completed and done message sent to the Host */
+	VDECFW_CHECKPOINT_BE_PICTURE_COMPLETE = 11,
+#ifndef FW_STACK_USAGE_TRACKING
+	/* General purpose check point 1 */
+	VDECFW_CHECKPOINT_AUX1                = 12,
+	/* General purpose check point 2 */
+	VDECFW_CHECKPOINT_AUX2                = 13,
+	/* General purpose check point 3 */
+	VDECFW_CHECKPOINT_AUX3                = 14,
+	/* General purpose check point 4 */
+	VDECFW_CHECKPOINT_AUX4                = 15,
+#endif  /* ndef FW_STACK_USAGE_TRACKING */
+	VDECFW_CHECKPOINT_MAX,
+	/*
+	 * Indicate which checkpoints mark the start and end of each
+	 * group (FW, FE and BE).
+	 * The start and end values should be updated if new checkpoints are
+	 * added before the current start or after the current end of any group.
+	 */
+	VDECFW_CHECKPOINT_FW_START            = VDECFW_CHECKPOINT_PICTURE_STARTED,
+	VDECFW_CHECKPOINT_FW_END              = VDECFW_CHECKPOINT_FIRMWARE_SAVED,
+	VDECFW_CHECKPOINT_FE_START            = VDECFW_CHECKPOINT_ENTDEC_STARTED,
+	VDECFW_CHECKPOINT_FE_END              = VDECFW_CHECKPOINT_FE_PICTURE_COMPLETE,
+	VDECFW_CHECKPOINT_BE_START            = VDECFW_CHECKPOINT_BE_PICTURE_STARTED,
+	VDECFW_CHECKPOINT_BE_END              = VDECFW_CHECKPOINT_BE_PICTURE_COMPLETE,
+	VDECFW_CHECKPOINT_FORCE32BITS         = 0x7FFFFFFFU
+};
+
+/* Number of auxiliary firmware checkpoints. */
+#define VDECFW_CHECKPOINT_AUX_COUNT  4
+/* This describes the action currently being done by the Firmware. */
+enum vdecfw_firmwareaction {
+	VDECFW_FWACT_IDLE = 1,           /* Firmware is currently doing nothing */
+	VDECFW_FWACT_BASE_LOADING_PSR,   /* Loading parser context */
+	VDECFW_FWACT_BASE_SAVING_PSR,    /* Saving parser context */
+	VDECFW_FWACT_BASE_LOADING_BEMOD, /* Loading Backend module */
+	VDECFW_FWACT_BASE_LOADING_FEMOD, /* Loading Frontend module */
+	VDECFW_FWACT_PARSER_SLICE,       /* Parser active: parsing slice */
+	VDECFW_FWACT_PARSER_PM,          /* Parser active: picture management */
+	VDECFE_FWACT_BEMOD_ACTIVE,       /* Backend module active */
+	VDECFE_FWACT_FEMOD_ACTIVE,       /* Frontend module active */
+	VDECFW_FWACT_MAX,
+	VDECFW_FWACT_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * This describes the FE_ERR flags word in the VDECFW_MSGID_PIC_DECODED message
+ */
+enum vdecfw_msgflagdecodedfeerror {
+	/* Front-end hardware watchdog timeout (FE_WDT_CM0) */
+	VDECFW_MSGFLAG_DECODED_FEERROR_HWWDT_SHIFT = 0,
+	/* Front-end entdec error (VEC_ERROR_DETECTED_ENTDEC) */
+	VDECFW_MSGFLAG_DECODED_FEERROR_ENTDECERROR_SHIFT,
+	/* Shift-register error (VEC_ERROR_DETECTED_SR) */
+	VDECFW_MSGFLAG_DECODED_FEERROR_SRERROR_SHIFT,
+	/* For cases when B frame comes after I without P. */
+	VDECFW_MSGFLAG_DECODED_MISSING_REFERENCES_SHIFT,
+	/* MMCO operation failed. */
+	VDECFW_MSGFLAG_DECODED_MMCO_ERROR_SHIFT,
+	/* Back-end WDT timeout */
+	VDECFW_MSGFLAG_DECODED_BEERROR_HWWDT_SHIFT,
+	/* Some macroblocks were dropped */
+	VDECFW_MSGFLAG_DECODED_MBS_DROPPED_ERROR_SHIFT,
+	VDECFW_MSGFLAG_DECODED_FEERROR_MAX,
+	VDECFW_MSGFLAG_DECODED_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * This type defines the IDs of the messages used to communicate with the
+ * Firmware.
+ *
+ * The Firmware has 3 message buffers, each buffer uses a different set of IDs.
+ * The buffers are:
+ *   Host -> FW -Control messages(High Priority: processed in interrupt context)
+ *   Host -> FW -Decode commands and associated information
+ *   (Normal Priority: processed in baseloop)
+ *   FW -> Host -Completion message
+ */
+enum vdecfw_message_id {
+	/* Control Messages */
+	/*
+	 * Host -> FW Padding message
+	 * Sent to optionally pad the message buffer
+	 */
+	VDECFW_MSGID_BASE_PADDING = 0x01,
+	/*
+	 * Host -> FW Initialisation message Initialisation should be
+	 * sent *immediately* after loading the base component
+	 *  ie. while the FW is idle
+	 */
+	VDECFW_MSGID_FIRMWARE_INIT,
+	/*
+	 * Host -> FW Configuration message
+	 * Configuration should be setup after loading the base component
+	 * and before decoding the next picture ie. while the FW is idle
+	 */
+	VDECFW_MSGID_FIRMWARE_CONFIG,
+	/*
+	 * Host -> FW Control message
+	 * Firmware control command to have immediate affect
+	 * eg. Stop stream, return CRCs, return Performance Data
+	 */
+	VDECFW_MSGID_FIRMWARE_CONTROL,
+	VDECFW_MSGID_CONTROL_MAX,
+	/* Decode Commands */
+	/*
+	 * Host -> FW Padding message
+	 * Sent to optionally pad the message buffer
+	 */
+	VDECFW_MSGID_PSR_PADDING = 0x40,
+	/*
+	 * Host -> FW Decode message
+	 * Describes the picture to decode
+	 */
+	VDECFW_MSGID_DECODE_PICTURE,
+	/*
+	 * Host -> FW Bitstream buffer information
+	 * Information describing a bitstream buffer to DMA to VXD
+	 */
+	VDECFW_MSGID_BITSTREAM_BUFFER,
+	/*
+	 * Host -> FW Fence message
+	 * Generate an interrupt when this is read,
+	 * FenceID should be written to a location in VLR
+	 */
+	VDECFW_MSGID_FENCE,
+	/*
+	 * Host -> FW Batch message
+	 * Contains a pointer to a host memory buffer
+	 * containing a batch of decode command FW messages
+	 */
+	VDECFW_MSGID_BATCH,
+	VDECFW_MSGID_DECODE_MAX,
+	/* Completion Messages */
+	/*
+	 * FW -> Host Padding message
+	 * Sent to optionally pad the message buffer
+	 */
+	VDECFW_MSGID_BE_PADDING = 0x80,
+	/*
+	 * FW -> Host Decoded Picture message
+	 * Notification of decoded picture including errors recorded
+	 */
+	VDECFW_MSGID_PIC_DECODED,
+	/*
+	 * FW -> Host CRC message
+	 * Optionally sent with Decoded Picture message, contains VXD CRCs
+	 */
+	VDECFW_MSGID_PIC_CRCS,
+	/*
+	 * FW -> Host Performance message
+	 * Optional timestamps at the decode checkpoints and other information
+	 * about the image to assist in measuring performance
+	 */
+	VDECFW_MSGID_PIC_PERFORMANCE,
+	/* FW -> Host POST calculation test message */
+	VDECFW_MSGID_PIC_POST_RESP,
+	VDECFW_MSGID_COMPLETION_MAX,
+	VDECFW_MSGID_FORCE32BITS = 0x7FFFFFFFU
+};
+
+#define VDECFW_MSGID_CONTROL_TYPES \
+	(VDECFW_MSGID_CONTROL_MAX - VDECFW_MSGID_BASE_PADDING)
+#define VDECFW_MSGID_DECODE_TYPES \
+	(VDECFW_MSGID_DECODE_MAX - VDECFW_MSGID_PSR_PADDING)
+#define VDECFW_MSGID_COMPLETION_TYPES \
+	(VDECFW_MSGID_COMPLETION_MAX - VDECFW_MSGID_BE_PADDING)
+
+/* This describes the layout of PVDEC Firmware state indicators in Comms RAM. */
+
+/* Maximum number of PVDEC decoding pipes per core supported. */
+#define VDECFW_MAX_DP  3
+
+struct vdecfw_pvdecpipestate {
+	/* TransactionID at each checkpoint */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, check_point[VDECFW_CHECKPOINT_MAX]);
+	/* VDECFW_eFirmwareAction (UINT32 used to guarantee size) */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, firmware_action);
+	/* Number of FE Slices processed for the last picture in FE */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, fe_slices);
+	/* Number of BE Slices processed for the last picture in BE */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, be_slices);
+	/*
+	 * Number of FE Slices being detected as erroed for the last picture
+	 * in FE
+	 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, fe_errored_slices);
+	/*
+	 * Number of BE Slices being detected as erroed for the last picture
+	 * in BE
+	 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, be_errored_slices);
+	/* Number of BE macroblocks dropped for the last picture */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, be_mbs_dropped);
+	/* Number of BE macroblocks recovered for the last picture */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, be_mbs_recovered);
+	/* Number of FE macroblocks processed for the last picture in FE */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, last_fe_mb_xy);
+	/* Number of BE macroblocks processed for the last picture in BE */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, last_be_mb_xy);
+	/* VDECFW_eCodecType - Codec currently loaded */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, curr_codec);
+	/* TRUE if this pipe is available for processing */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, pipe_present);
+};
+
+#ifdef FW_STACK_USAGE_TRACKING
+/* Stack usage info array size. */
+#define VDECFW_STACK_INFO_SIZE (VDECFW_MAX_DP * VDECFW_CHECKPOINT_AUX_COUNT)
+#endif /* FW_STACK_USAGE_TRACKING */
+struct vdecfw_pvdecfirmwarestate {
+	/*
+	 * Indicates generic progress taken by firmware
+	 * (must be the first item)
+	 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned int, fwstep);
+	/* Pipe state array. */
+	struct vdecfw_pvdecpipestate pipestate[VDECFW_MAX_DP];
+#ifdef FW_STACK_USAGE_TRACKING
+	/* Stack usage info array. */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, unsigned int,
+			stackinfo[VDECFW_STACK_INFO_SIZE]);
+#endif  /* FW_STACK_USAGE_TRACKING */
+};
+
+/*
+ * This describes the flags word in the aui8DisplayFlags
+ * in VDECFW_sBufferControl
+ */
+enum vdecfw_bufflagdisplay {
+	/* TID has been flushed with a "no display" indication */
+	VDECFW_BUFFLAG_DISPLAY_NODISPLAY_SHIFT         = 0,
+	/* TID contains an unpaired field */
+	VDECFW_BUFFLAG_DISPLAY_SINGLE_FIELD_SHIFT      = 1,
+	/* TID contains field coded picture(s) - single field or pair */
+	VDECFW_BUFFLAG_DISPLAY_FIELD_CODED_SHIFT       = 2,
+	/* if TID contains a single field, this defines which field that is */
+	VDECFW_BUFFLAG_DISPLAY_BOTTOM_FIELD_SHIFT      = 3,
+	/* if TID contains a frame with two interlaced fields */
+	VDECFW_BUFFLAG_DISPLAY_INTERLACED_FIELDS_SHIFT = 4,
+	/* End marker */
+	VDECFW_BUFFLAG_DISPLAY_MAX                     = 8,
+	VDECFW_BUFFLAG_DISPLAY_FORCE32BITS             = 0x7FFFFFFFU
+};
+
+/*
+ * This describes the flags in the ui8PictMgmtFlags field in
+ * VDECFW_sBufferControl
+ */
+enum vdecfw_picmgmflags {
+	/* Picture management for this picture successfully executed */
+	VDECFW_PICMGMTFLAG_PICTURE_EXECUTED_SHIFT   = 0,
+	/*
+	 * Picture management for the first field of this picture
+	 * successfully executed
+	 */
+	VDECFW_PICMGMTFLAG_1ST_FIELD_EXECUTED_SHIFT = 0,
+	/*
+	 * Picture management for the second field of this picture
+	 * successfully executed
+	 */
+	VDECFW_PICMGMTFLAG_2ND_FIELD_EXECUTED_SHIFT = 1,
+	VDECFW_PICMGMTFLAG_FORCE32BITS              = 0x7FFFFFFFU
+};
+
+/*
+ * Macro for checking if picture management was successfully executed for
+ *  field coded picture
+ */
+#define VDECFW_PICMGMT_FIELD_CODED_PICTURE_EXECUTED(_flagsword_) \
+	((FLAG_IS_SET(buf_control->picmgmt_flags, \
+		      VDECFW_PICMGMTFLAG_1ST_FIELD_EXECUTED) && \
+	  FLAG_IS_SET(buf_control->picmgmt_flags, \
+		      VDECFW_PICMGMTFLAG_2ND_FIELD_EXECUTED)) ? \
+	 TRUE : FALSE)
+/* This describes the REAL related data for the current picture. */
+struct vdecfw_real_data {
+	/* Picture width */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, width);
+	/* Picture height */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, height);
+	/* Scaled Picture Width */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, scaled_width);
+	/* Scaled Picture Height */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, scaled_height);
+	/* Timestamp parsed in the firmware */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, timestamp);
+};
+
+/* This describes the HEVC related data for the current picture. */
+struct vdecfw_hevcdata {
+	/* POC */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT, int, pic_order_count);
+};
+
+/*
+ * This describes the buffer control structure that is used by the firmware to
+ * signal to the Host to control the display and release of buffers.
+ */
+struct vdecfw_buffer_control {
+	/*
+	 * List of TransactionIDs indicating buffers ready to display,
+	 * in display order
+	 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, display_list[VDECFW_MAX_NUM_PICTURES]);
+	/*
+	 * List of TransactionIDs indicating buffers that are no longer
+	 * required for reference
+	 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int,
+			release_list[VDECFW_MAX_NUM_PICTURES +
+				     VDECFW_MAX_NUM_VIEWS]);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short,
+			display_view_ids[VDECFW_MAX_NUM_PICTURES]);
+	/* List of flags for each TID in the DisplayList */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, display_flags[VDECFW_MAX_NUM_PICTURES]);
+	/* Number of TransactionIDs in aui32DisplayList */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, display_list_length);
+	/* Number of TransactionIDs in aui32ReleaseList */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, release_list_length);
+	union {
+		struct vdecfw_real_data real_data;
+		struct vdecfw_hevcdata hevc_data;
+	};
+	/*
+	 * Refers to the picture decoded with the current transaction ID
+	 * (not affected by merge with field of previous transaction ID)
+	 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			enum img_buffer_type, dec_pict_type);
+	/* Set if the current field is a pair to the previous field */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, second_field_of_pair);
+	/*
+	 * Set if for a pair we decoded first the top field or
+	 * if we have only top field
+	 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, top_field_first);
+	/* Top field is first to be displayed */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, out_top_field_first);
+	/* Picture management flags for this picture */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, picmgmt_flags);
+	/*
+	 * List of TransactionIDs indicating buffers used as references
+	 * when decoding current picture
+	 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, ref_list[VDECFW_MAX_NUM_PICTURES]);
+};
+
+/*
+ * This describes an image buffer for one picture supplied to
+ * the firmware by the host
+ */
+struct vdecfw_image_buffer {
+	/* Virtual Address of each plane */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, byte_offset[VDECFW_PLANE_MAX]);
+};
+
+/* This type defines the picture commands that are prepared for the firmware. */
+enum vdecfw_picture_cmds {
+	/* Reconstructed buffer */
+	/* DISPLAY_PICTURE_SIZE */
+	VDECFW_CMD_DISPLAY_PICTURE,
+	/* CODED_PICTURE_SIZE */
+	VDECFW_CMD_CODED_PICTURE,
+	/* OPERATING_MODE */
+	VDECFW_CMD_OPERATING_MODE,
+	/* LUMA_RECONSTRUCTED_PICTURE_BASE_ADDRESSES */
+	VDECFW_CMD_LUMA_RECONSTRUCTED_PICTURE_BASE_ADDRESS,
+	/* CHROMA_RECONSTRUCTED_PICTURE_BASE_ADDRESSES */
+	VDECFW_CMD_CHROMA_RECONSTRUCTED_PICTURE_BASE_ADDRESS,
+	/* CHROMA2_RECONSTRUCTED_PICTURE_BASE_ADDRESSES */
+	VDECFW_CMD_CHROMA2_RECONSTRUCTED_PICTURE_BASE_ADDRESS,
+	/* VC1_LUMA_RANGE_MAPPING_BASE_ADDRESS */
+	VDECFW_CMD_LUMA_ALTERNATIVE_PICTURE_BASE_ADDRESS,
+	/* VC1_CHROMA_RANGE_MAPPING_BASE_ADDRESS */
+	VDECFW_CMD_CHROMA_ALTERNATIVE_PICTURE_BASE_ADDRESS,
+	/* CHROMA2_ALTERNATIVE_PICTURE_BASE_ADDRESS */
+	VDECFW_CMD_CHROMA2_ALTERNATIVE_PICTURE_BASE_ADDRESS,
+	/* LUMA_ERROR_PICTURE_BASE_ADDRESSES */
+	VDECFW_CMD_LUMA_ERROR_PICTURE_BASE_ADDRESS,
+	/* CHROMA_ERROR_PICTURE_BASE_ADDRESSES */
+	VDECFW_CMD_CHROMA_ERROR_PICTURE_BASE_ADDRESS,
+	/* AUX_MSB_BUFFER_BASE_ADDRESSES (VC-1 only) */
+	VDECFW_CMD_AUX_MSB_BUFFER,
+	/* INTRA_BUFFER_BASE_ADDRESS (various) */
+	VDECFW_CMD_INTRA_BUFFER_BASE_ADDRESS,
+	/* AUX_LINE_BUFFER_BASE_ADDRESS */
+	VDECFW_CMD_AUX_LINE_BUFFER_BASE_ADDRESS,
+	/* MBFLAGS_BUFFER_BASE_ADDRESSES (VP8 only) */
+	VDECFW_CMD_MBFLAGS_BUFFER_BASE_ADDRESS,
+	/* FIRST_PARTITION_BASE_ADDRESSES (VP8 only) */
+	VDECFW_CMD_FIRST_PARTITION_BUFFER_BASE_ADDRESS,
+	/* CURRENT_PICTURE_BUFFER_BASE_ADDRESSES (VP8 only) */
+	VDECFW_CMD_CURRENT_PICTURE_BUFFER_BASE_ADDRESS,
+	/* SEGMENTID_BUFFER_BASE_ADDRESSES (VP8 only) */
+	VDECFW_CMD_SEGMENTID_BASE_ADDRESS,
+	/* EXT_OP_MODE (H.264 only) */
+	VDECFW_CMD_EXT_OP_MODE,
+	/* MC_CACHE_CONFIGURATION */
+	VDECFW_CMD_MC_CACHE_CONFIGURATION,
+	/* Alternative output buffer (rotation etc.) */
+	/* ALTERNATIVE_OUTPUT_PICTURE_ROTATION */
+	VDECFW_CMD_ALTERNATIVE_OUTPUT_PICTURE_ROTATION,
+	/* EXTENDED_ROW_STRIDE */
+	VDECFW_CMD_EXTENDED_ROW_STRIDE,
+	/* CHROMA_ROW_STRIDE (H.264 only) */
+	VDECFW_CMD_CHROMA_ROW_STRIDE,
+	/* ALTERNATIVE_OUTPUT_CONTROL */
+	VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL,
+	/* RPR specific commands */
+	/* RPR_AX_INITIAL */
+	VDECFW_CMD_RPR_AX_INITIAL,
+	/* RPR_AX_INCREMENT */
+	VDECFW_CMD_RPR_AX_INCREMENT,
+	/* RPR_AY_INITIAL */
+	VDECFW_CMD_RPR_AY_INITIAL,
+	/* RPR_AY_INCREMENT */
+	VDECFW_CMD_RPR_AY_INCREMENT,
+	/* RPR_PICTURE_SIZE */
+	VDECFW_CMD_RPR_PICTURE_SIZE,
+	/* Scaling specific params */
+	/* SCALED_DISPLAY_SIZE */
+	VDECFW_CMD_SCALED_DISPLAY_SIZE,
+	/* HORIZONTAL_SCALE_CONTROL */
+	VDECFW_CMD_HORIZONTAL_SCALE_CONTROL,
+	/* SCALE_HORIZONTAL_CHROMA (H.264 only) */
+	VDECFW_CMD_SCALE_HORIZONTAL_CHROMA,
+	/* VERTICAL_SCALE_CONTROL */
+	VDECFW_CMD_VERTICAL_SCALE_CONTROL,
+	/* SCALE_VERTICAL_CHROMA (H.264 only) */
+	VDECFW_CMD_SCALE_VERTICAL_CHROMA,
+	/* HORIZONTAL_LUMA_COEFFICIENTS_0 */
+	VDECFW_CMD_HORIZONTAL_LUMA_COEFFICIENTS_0,
+	/* HORIZONTAL_LUMA_COEFFICIENTS_1 */
+	VDECFW_CMD_HORIZONTAL_LUMA_COEFFICIENTS_1,
+	/* HORIZONTAL_LUMA_COEFFICIENTS_2 */
+	VDECFW_CMD_HORIZONTAL_LUMA_COEFFICIENTS_2,
+	/* HORIZONTAL_LUMA_COEFFICIENTS_3 */
+	VDECFW_CMD_HORIZONTAL_LUMA_COEFFICIENTS_3,
+	/* VERTICAL_LUMA_COEFFICIENTS_0 */
+	VDECFW_CMD_VERTICAL_LUMA_COEFFICIENTS_0,
+	/* VERTICAL_LUMA_COEFFICIENTS_1 */
+	VDECFW_CMD_VERTICAL_LUMA_COEFFICIENTS_1,
+	/* VERTICAL_LUMA_COEFFICIENTS_2 */
+	VDECFW_CMD_VERTICAL_LUMA_COEFFICIENTS_2,
+	/* VERTICAL_LUMA_COEFFICIENTS_3 */
+	VDECFW_CMD_VERTICAL_LUMA_COEFFICIENTS_3,
+	/* HORIZONTAL_CHROMA_COEFFICIENTS_0 */
+	VDECFW_CMD_HORIZONTAL_CHROMA_COEFFICIENTS_0,
+	/* HORIZONTAL_CHROMA_COEFFICIENTS_1 */
+	VDECFW_CMD_HORIZONTAL_CHROMA_COEFFICIENTS_1,
+	/* HORIZONTAL_CHROMA_COEFFICIENTS_2 */
+	VDECFW_CMD_HORIZONTAL_CHROMA_COEFFICIENTS_2,
+	/* HORIZONTAL_CHROMA_COEFFICIENTS_3 */
+	VDECFW_CMD_HORIZONTAL_CHROMA_COEFFICIENTS_3,
+	/* VERTICAL_CHROMA_COEFFICIENTS_0 */
+	VDECFW_CMD_VERTICAL_CHROMA_COEFFICIENTS_0,
+	/* VERTICAL_CHROMA_COEFFICIENTS_1 */
+	VDECFW_CMD_VERTICAL_CHROMA_COEFFICIENTS_1,
+	/* VERTICAL_CHROMA_COEFFICIENTS_2 */
+	VDECFW_CMD_VERTICAL_CHROMA_COEFFICIENTS_2,
+	/* VERTICAL_CHROMA_COEFFICIENTS_3 */
+	VDECFW_CMD_VERTICAL_CHROMA_COEFFICIENTS_3,
+	/* SCALE_OUTPUT_SIZE */
+	VDECFW_CMD_SCALE_OUTPUT_SIZE,
+	/* VDECFW_CMD_INTRA_BUFFER_PLANE_SIZE */
+	VDECFW_CMD_INTRA_BUFFER_PLANE_SIZE,
+	/* VDECFW_CMD_INTRA_BUFFER_SIZE_PER_PIPE */
+	VDECFW_CMD_INTRA_BUFFER_SIZE_PER_PIPE,
+	/* VDECFW_CMD_AUX_LINE_BUFFER_SIZE_PER_PIPE */
+	VDECFW_CMD_AUX_LINE_BUFFER_SIZE_PER_PIPE,
+	VDECFW_SLICE_X_MB_OFFSET,
+	VDECFW_SLICE_Y_MB_OFFSET,
+	VDECFW_SLICE_TYPE,
+	VDECFW_CMD_MAX,
+	VDECFW_CMD_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/* Size of relocation data attached to VDECFW_sTransaction message in words */
+#define VDECFW_RELOC_SIZE 125
+
+/* This structure defines the MMU Tile configuration. */
+struct vdecfw_mmu_tile_config {
+	/* MMU_CONTROL2 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned char, tilig_scheme);
+	/* MMU_TILE */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int,
+			mmu_tiling[MSVDX_CORE_CR_MMU_TILE_NO_ENTRIES]);
+	/* MMU_TILE_EXT */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int,
+			mmu_tiling_ext[MSVDX_CORE_CR_MMU_TILE_EXT_NO_ENTRIES]);
+};
+
+/*
+ * This structure contains the transaction attributes to be given to the
+ * firmware
+ * @brief  Transaction Attributes
+ */
+struct vdecfw_transaction {
+	/* Unique identifier for the picture (driver-wide). */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, transation_id);
+	/* Codec */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			enum vdecfw_codectype, codec);
+	/*
+	 * Flag to indicate that the stream needs to ge handled
+	 * in secure memory (if available)
+	 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			int, secure_stream);
+	/* Unique identifier for the current stream */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, stream_id);
+	/* Dictates to the FW parser how the NALs are delimited */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			enum vdecfw_parsermode, parser_mode);
+	/* Address from which to load the parser context data. */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_PTR_ALIGNMENT,
+			unsigned int, ctx_load_addr);
+	/*
+	 * Address to save the parser state data including the updated
+	 * "parser context data".
+	 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_PTR_ALIGNMENT,
+			unsigned int, ctx_save_addr);
+	/* Size of the parser context data in bytes. */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, ctx_size);
+	/* Address to save the "buffer control" data. */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_PTR_ALIGNMENT,
+			unsigned int, ctrl_save_addr);
+	/* Size of the buffer control data in bytes. */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, ctrl_size);
+
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, pict_cmds[VDECFW_CMD_MAX]);
+
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, pic_width_inmbs);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, pic_height_inmbs);
+
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, mbparams_base_addr);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, mbparams_size_per_plane);
+	/* Address of VLC table data. */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_PTR_ALIGNMENT,
+			unsigned int, vlc_tables_addr);
+	/* Size of the VLC table data in bytes. */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, vlc_tables_size);
+	/* Address of VLC index table data. */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_PTR_ALIGNMENT,
+			unsigned int, vlc_index_table_addr);
+	/* Size of the VLC index table data in bytes. */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, vlc_index_table_size);
+	/* Address of parser picture header. */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_PTR_ALIGNMENT,
+			unsigned int, psr_hdr_addr);
+	/* Size of the parser picture header in bytes. */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, psr_hdr_size);
+	/* Address of Sequence Info in the Host (secure) */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_PTR_ALIGNMENT,
+			unsigned int, sequence_info_source);
+	/* Address of PPS Info in the Host (secure) */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_PTR_ALIGNMENT,
+			unsigned int, pps_info_source);
+	/* Address of Second PPS Info in the Host (secure) */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_PTR_ALIGNMENT,
+			unsigned int, second_pps_info_source);
+	/* MMU Tile config comes down with each transaction. */
+	struct vdecfw_mmu_tile_config mmu_tile_config;
+};
+
+/*
+ * This structure contains the info for extracting a subset of VLC tables
+ * indexed inside the index table.
+ * aui32VlcTablesOffset is the offset to the first table inside the index table
+ * aui32VlcConsecutiveTables indicates the consecutive number of entries (from
+ * aui32VlcTablesOffset to aui32VlcTablesOffset+aui32VlcConsecutiveTables)
+ * which will be copied.
+ */
+struct vdecfw_vlc_table_info {
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, vlc_table_offset);
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned short, vlc_consecutive_tables);
+};
+
+/* This structure defines the RENDEC buffer configuration. */
+struct vdecfw_rendec_config {
+	/* VEC_RENDEC_CONTROL0 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, regvec_rendec_control0);
+	/* VEC_RENDEC_CONTROL1 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, regvec_rendec_control1);
+	/* VEC_RENDEC_BASE_ADDR0 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, rendec_buffer_baseaddr0);
+	/* VEC_RENDEC_BASE_ADDR1 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, rendec_buffer_baseaddr1);
+	/* VEC_RENDEC_BUFFER_SIZE */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, regvec_rendec_buffer_size);
+	/* VEC_RENDEC_CONTEXT0 - VEC_RENDEC_CONTEXT5 */
+	IMG_ALIGN_FIELD(VDECFW_SHARE_DEFAULT_ALIGNMENT,
+			unsigned int, rendec_initial_ctx[6]);
+};
+
+#endif /* _VDECFW_H_ */
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
