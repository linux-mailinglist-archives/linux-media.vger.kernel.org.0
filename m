Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBFDF2CD433
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387662AbgLCLD7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:03:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730269AbgLCLD6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:03:58 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 647D2C061A53
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:53 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNs-0002Km-Kn; Thu, 03 Dec 2020 12:02:51 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNr-00CKhV-PD; Thu, 03 Dec 2020 12:02:47 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:00:49 +0100
Message-Id: <20201203110106.2939463-2-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203110106.2939463-1-m.tretter@pengutronix.de>
References: <20201203110106.2939463-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.2
Subject: [PATCH 01/18] media: allegro: extract RBSP handler from H.264 NAL generator
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The RBSP structure is the same for HEVC and H.264. In order to be able
to reuse the RBSP handler for generating HEVC NAL units, extract the
functions from the H.264 generator.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/allegro-dvt/Makefile   |   3 +-
 drivers/media/platform/allegro-dvt/nal-h264.c | 336 +-----------------
 drivers/media/platform/allegro-dvt/nal-rbsp.c | 305 ++++++++++++++++
 drivers/media/platform/allegro-dvt/nal-rbsp.h |  60 ++++
 4 files changed, 374 insertions(+), 330 deletions(-)
 create mode 100644 drivers/media/platform/allegro-dvt/nal-rbsp.c
 create mode 100644 drivers/media/platform/allegro-dvt/nal-rbsp.h

diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/platform/allegro-dvt/Makefile
index 8e306dcdc55c..10119e84a60f 100644
--- a/drivers/media/platform/allegro-dvt/Makefile
+++ b/drivers/media/platform/allegro-dvt/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-allegro-objs := allegro-core.o nal-h264.o allegro-mail.o
+allegro-objs := allegro-core.o allegro-mail.o
+allegro-objs += nal-rbsp.o nal-h264.o
 
 obj-$(CONFIG_VIDEO_ALLEGRO_DVT) += allegro.o
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/media/platform/allegro-dvt/nal-h264.c
index bd48b8883572..94dd9266d850 100644
--- a/drivers/media/platform/allegro-dvt/nal-h264.c
+++ b/drivers/media/platform/allegro-dvt/nal-h264.c
@@ -22,6 +22,7 @@
 #include <linux/log2.h>
 
 #include "nal-h264.h"
+#include "nal-rbsp.h"
 
 /*
  * See Rec. ITU-T H.264 (04/2017) Table 7-1 – NAL unit type codes, syntax
@@ -33,54 +34,6 @@ enum nal_unit_type {
 	FILLER_DATA = 12,
 };
 
-struct rbsp;
-
-struct nal_h264_ops {
-	int (*rbsp_bit)(struct rbsp *rbsp, int *val);
-	int (*rbsp_bits)(struct rbsp *rbsp, int n, unsigned int *val);
-	int (*rbsp_uev)(struct rbsp *rbsp, unsigned int *val);
-	int (*rbsp_sev)(struct rbsp *rbsp, int *val);
-};
-
-/**
- * struct rbsp - State object for handling a raw byte sequence payload
- * @data: pointer to the data of the rbsp
- * @size: maximum size of the data of the rbsp
- * @pos: current bit position inside the rbsp
- * @num_consecutive_zeros: number of zeros before @pos
- * @ops: per datatype functions for interacting with the rbsp
- * @error: an error occurred while handling the rbsp
- *
- * This struct is passed around the various parsing functions and tracks the
- * current position within the raw byte sequence payload.
- *
- * The @ops field allows to separate the operation, i.e., reading/writing a
- * value from/to that rbsp, from the structure of the NAL unit. This allows to
- * have a single function for iterating the NAL unit, while @ops has function
- * pointers for handling each type in the rbsp.
- */
-struct rbsp {
-	u8 *data;
-	size_t size;
-	unsigned int pos;
-	unsigned int num_consecutive_zeros;
-	struct nal_h264_ops *ops;
-	int error;
-};
-
-static void rbsp_init(struct rbsp *rbsp, void *addr, size_t size,
-		      struct nal_h264_ops *ops)
-{
-	if (!rbsp)
-		return;
-
-	rbsp->data = addr;
-	rbsp->size = size;
-	rbsp->pos = 0;
-	rbsp->ops = ops;
-	rbsp->error = 0;
-}
-
 /**
  * nal_h264_profile_from_v4l2() - Get profile_idc for v4l2 h264 profile
  * @profile: the profile as &enum v4l2_mpeg_video_h264_profile
@@ -155,281 +108,6 @@ int nal_h264_level_from_v4l2(enum v4l2_mpeg_video_h264_level level)
 	}
 }
 
-static int rbsp_read_bits(struct rbsp *rbsp, int n, unsigned int *value);
-static int rbsp_write_bits(struct rbsp *rbsp, int n, unsigned int value);
-
-/*
- * When reading or writing, the emulation_prevention_three_byte is detected
- * only when the 2 one bits need to be inserted. Therefore, we are not
- * actually adding the 0x3 byte, but the 2 one bits and the six 0 bits of the
- * next byte.
- */
-#define EMULATION_PREVENTION_THREE_BYTE (0x3 << 6)
-
-static int add_emulation_prevention_three_byte(struct rbsp *rbsp)
-{
-	rbsp->num_consecutive_zeros = 0;
-	rbsp_write_bits(rbsp, 8, EMULATION_PREVENTION_THREE_BYTE);
-
-	return 0;
-}
-
-static int discard_emulation_prevention_three_byte(struct rbsp *rbsp)
-{
-	unsigned int tmp = 0;
-
-	rbsp->num_consecutive_zeros = 0;
-	rbsp_read_bits(rbsp, 8, &tmp);
-	if (tmp != EMULATION_PREVENTION_THREE_BYTE)
-		return -EINVAL;
-
-	return 0;
-}
-
-static inline int rbsp_read_bit(struct rbsp *rbsp)
-{
-	int shift;
-	int ofs;
-	int bit;
-	int err;
-
-	if (rbsp->num_consecutive_zeros == 22) {
-		err = discard_emulation_prevention_three_byte(rbsp);
-		if (err)
-			return err;
-	}
-
-	shift = 7 - (rbsp->pos % 8);
-	ofs = rbsp->pos / 8;
-	if (ofs >= rbsp->size)
-		return -EINVAL;
-
-	bit = (rbsp->data[ofs] >> shift) & 1;
-
-	rbsp->pos++;
-
-	if (bit == 1 ||
-	    (rbsp->num_consecutive_zeros < 7 && (rbsp->pos % 8 == 0)))
-		rbsp->num_consecutive_zeros = 0;
-	else
-		rbsp->num_consecutive_zeros++;
-
-	return bit;
-}
-
-static inline int rbsp_write_bit(struct rbsp *rbsp, bool value)
-{
-	int shift;
-	int ofs;
-
-	if (rbsp->num_consecutive_zeros == 22)
-		add_emulation_prevention_three_byte(rbsp);
-
-	shift = 7 - (rbsp->pos % 8);
-	ofs = rbsp->pos / 8;
-	if (ofs >= rbsp->size)
-		return -EINVAL;
-
-	rbsp->data[ofs] &= ~(1 << shift);
-	rbsp->data[ofs] |= value << shift;
-
-	rbsp->pos++;
-
-	if (value ||
-	    (rbsp->num_consecutive_zeros < 7 && (rbsp->pos % 8 == 0))) {
-		rbsp->num_consecutive_zeros = 0;
-	} else {
-		rbsp->num_consecutive_zeros++;
-	}
-
-	return 0;
-}
-
-static inline int rbsp_read_bits(struct rbsp *rbsp, int n, unsigned int *value)
-{
-	int i;
-	int bit;
-	unsigned int tmp = 0;
-
-	if (n > 8 * sizeof(*value))
-		return -EINVAL;
-
-	for (i = n; i > 0; i--) {
-		bit = rbsp_read_bit(rbsp);
-		if (bit < 0)
-			return bit;
-		tmp |= bit << (i - 1);
-	}
-
-	if (value)
-		*value = tmp;
-
-	return 0;
-}
-
-static int rbsp_write_bits(struct rbsp *rbsp, int n, unsigned int value)
-{
-	int ret;
-
-	if (n > 8 * sizeof(value))
-		return -EINVAL;
-
-	while (n--) {
-		ret = rbsp_write_bit(rbsp, (value >> n) & 1);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
-static int rbsp_read_uev(struct rbsp *rbsp, unsigned int *value)
-{
-	int leading_zero_bits = 0;
-	unsigned int tmp = 0;
-	int ret;
-
-	while ((ret = rbsp_read_bit(rbsp)) == 0)
-		leading_zero_bits++;
-	if (ret < 0)
-		return ret;
-
-	if (leading_zero_bits > 0) {
-		ret = rbsp_read_bits(rbsp, leading_zero_bits, &tmp);
-		if (ret)
-			return ret;
-	}
-
-	if (value)
-		*value = (1 << leading_zero_bits) - 1 + tmp;
-
-	return 0;
-}
-
-static int rbsp_write_uev(struct rbsp *rbsp, unsigned int *value)
-{
-	int ret;
-	int leading_zero_bits;
-
-	if (!value)
-		return -EINVAL;
-
-	leading_zero_bits = ilog2(*value + 1);
-
-	ret = rbsp_write_bits(rbsp, leading_zero_bits, 0);
-	if (ret)
-		return ret;
-
-	return rbsp_write_bits(rbsp, leading_zero_bits + 1, *value + 1);
-}
-
-static int rbsp_read_sev(struct rbsp *rbsp, int *value)
-{
-	int ret;
-	unsigned int tmp;
-
-	ret = rbsp_read_uev(rbsp, &tmp);
-	if (ret)
-		return ret;
-
-	if (value) {
-		if (tmp & 1)
-			*value = (tmp + 1) / 2;
-		else
-			*value = -(tmp / 2);
-	}
-
-	return 0;
-}
-
-static int rbsp_write_sev(struct rbsp *rbsp, int *value)
-{
-	unsigned int tmp;
-
-	if (!value)
-		return -EINVAL;
-
-	if (*value > 0)
-		tmp = (2 * (*value)) | 1;
-	else
-		tmp = -2 * (*value);
-
-	return rbsp_write_uev(rbsp, &tmp);
-}
-
-static int __rbsp_write_bit(struct rbsp *rbsp, int *value)
-{
-	return rbsp_write_bit(rbsp, *value);
-}
-
-static int __rbsp_write_bits(struct rbsp *rbsp, int n, unsigned int *value)
-{
-	return rbsp_write_bits(rbsp, n, *value);
-}
-
-static struct nal_h264_ops write = {
-	.rbsp_bit = __rbsp_write_bit,
-	.rbsp_bits = __rbsp_write_bits,
-	.rbsp_uev = rbsp_write_uev,
-	.rbsp_sev = rbsp_write_sev,
-};
-
-static int __rbsp_read_bit(struct rbsp *rbsp, int *value)
-{
-	int tmp = rbsp_read_bit(rbsp);
-
-	if (tmp < 0)
-		return tmp;
-	*value = tmp;
-
-	return 0;
-}
-
-static struct nal_h264_ops read = {
-	.rbsp_bit = __rbsp_read_bit,
-	.rbsp_bits = rbsp_read_bits,
-	.rbsp_uev = rbsp_read_uev,
-	.rbsp_sev = rbsp_read_sev,
-};
-
-static inline void rbsp_bit(struct rbsp *rbsp, int *value)
-{
-	if (rbsp->error)
-		return;
-	rbsp->error = rbsp->ops->rbsp_bit(rbsp, value);
-}
-
-static inline void rbsp_bits(struct rbsp *rbsp, int n, int *value)
-{
-	if (rbsp->error)
-		return;
-	rbsp->error = rbsp->ops->rbsp_bits(rbsp, n, value);
-}
-
-static inline void rbsp_uev(struct rbsp *rbsp, unsigned int *value)
-{
-	if (rbsp->error)
-		return;
-	rbsp->error = rbsp->ops->rbsp_uev(rbsp, value);
-}
-
-static inline void rbsp_sev(struct rbsp *rbsp, int *value)
-{
-	if (rbsp->error)
-		return;
-	rbsp->error = rbsp->ops->rbsp_sev(rbsp, value);
-}
-
-static void nal_h264_rbsp_trailing_bits(struct rbsp *rbsp)
-{
-	unsigned int rbsp_stop_one_bit = 1;
-	unsigned int rbsp_alignment_zero_bit = 0;
-
-	rbsp_bit(rbsp, &rbsp_stop_one_bit);
-	rbsp_bits(rbsp, round_up(rbsp->pos, 8) - rbsp->pos,
-		  &rbsp_alignment_zero_bit);
-}
-
 static void nal_h264_write_start_code_prefix(struct rbsp *rbsp)
 {
 	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
@@ -767,7 +445,7 @@ ssize_t nal_h264_write_sps(const struct device *dev,
 
 	nal_h264_rbsp_sps(&rbsp, sps);
 
-	nal_h264_rbsp_trailing_bits(&rbsp);
+	rbsp_trailing_bits(&rbsp);
 
 	if (rbsp.error)
 		return rbsp.error;
@@ -814,7 +492,7 @@ ssize_t nal_h264_read_sps(const struct device *dev,
 
 	nal_h264_rbsp_sps(&rbsp, sps);
 
-	nal_h264_rbsp_trailing_bits(&rbsp);
+	rbsp_trailing_bits(&rbsp);
 
 	if (rbsp.error)
 		return rbsp.error;
@@ -859,7 +537,7 @@ ssize_t nal_h264_write_pps(const struct device *dev,
 
 	nal_h264_rbsp_pps(&rbsp, pps);
 
-	nal_h264_rbsp_trailing_bits(&rbsp);
+	rbsp_trailing_bits(&rbsp);
 
 	if (rbsp.error)
 		return rbsp.error;
@@ -896,7 +574,7 @@ ssize_t nal_h264_read_pps(const struct device *dev,
 
 	nal_h264_rbsp_pps(&rbsp, pps);
 
-	nal_h264_rbsp_trailing_bits(&rbsp);
+	rbsp_trailing_bits(&rbsp);
 
 	if (rbsp.error)
 		return rbsp.error;
@@ -942,7 +620,7 @@ ssize_t nal_h264_write_filler(const struct device *dev, void *dest, size_t n)
 
 	nal_h264_write_filler_data(&rbsp);
 
-	nal_h264_rbsp_trailing_bits(&rbsp);
+	rbsp_trailing_bits(&rbsp);
 
 	return DIV_ROUND_UP(rbsp.pos, 8);
 }
@@ -991,7 +669,7 @@ ssize_t nal_h264_read_filler(const struct device *dev, void *src, size_t n)
 		return -EINVAL;
 
 	nal_h264_read_filler_data(&rbsp);
-	nal_h264_rbsp_trailing_bits(&rbsp);
+	rbsp_trailing_bits(&rbsp);
 
 	if (rbsp.error)
 		return rbsp.error;
diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.c b/drivers/media/platform/allegro-dvt/nal-rbsp.c
new file mode 100644
index 000000000000..935ba23844f2
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/nal-rbsp.c
@@ -0,0 +1,305 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019-2020 Pengutronix, Michael Tretter <kernel@pengutronix.de>
+ *
+ * Helper functions to generate a raw byte sequence payload from values.
+ */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/string.h>
+#include <linux/v4l2-controls.h>
+
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/log2.h>
+
+#include "nal-rbsp.h"
+
+void rbsp_init(struct rbsp *rbsp, void *addr, size_t size,
+	       struct nal_rbsp_ops *ops)
+{
+	if (!rbsp)
+		return;
+
+	rbsp->data = addr;
+	rbsp->size = size;
+	rbsp->pos = 0;
+	rbsp->ops = ops;
+	rbsp->error = 0;
+}
+
+static int rbsp_read_bits(struct rbsp *rbsp, int n, unsigned int *value);
+static int rbsp_write_bits(struct rbsp *rbsp, int n, unsigned int value);
+
+/*
+ * When reading or writing, the emulation_prevention_three_byte is detected
+ * only when the 2 one bits need to be inserted. Therefore, we are not
+ * actually adding the 0x3 byte, but the 2 one bits and the six 0 bits of the
+ * next byte.
+ */
+#define EMULATION_PREVENTION_THREE_BYTE (0x3 << 6)
+
+static int add_emulation_prevention_three_byte(struct rbsp *rbsp)
+{
+	rbsp->num_consecutive_zeros = 0;
+	rbsp_write_bits(rbsp, 8, EMULATION_PREVENTION_THREE_BYTE);
+
+	return 0;
+}
+
+static int discard_emulation_prevention_three_byte(struct rbsp *rbsp)
+{
+	unsigned int tmp = 0;
+
+	rbsp->num_consecutive_zeros = 0;
+	rbsp_read_bits(rbsp, 8, &tmp);
+	if (tmp != EMULATION_PREVENTION_THREE_BYTE)
+		return -EINVAL;
+
+	return 0;
+}
+
+static inline int rbsp_read_bit(struct rbsp *rbsp)
+{
+	int shift;
+	int ofs;
+	int bit;
+	int err;
+
+	if (rbsp->num_consecutive_zeros == 22) {
+		err = discard_emulation_prevention_three_byte(rbsp);
+		if (err)
+			return err;
+	}
+
+	shift = 7 - (rbsp->pos % 8);
+	ofs = rbsp->pos / 8;
+	if (ofs >= rbsp->size)
+		return -EINVAL;
+
+	bit = (rbsp->data[ofs] >> shift) & 1;
+
+	rbsp->pos++;
+
+	if (bit == 1 ||
+	    (rbsp->num_consecutive_zeros < 7 && (rbsp->pos % 8 == 0)))
+		rbsp->num_consecutive_zeros = 0;
+	else
+		rbsp->num_consecutive_zeros++;
+
+	return bit;
+}
+
+static inline int rbsp_write_bit(struct rbsp *rbsp, bool value)
+{
+	int shift;
+	int ofs;
+
+	if (rbsp->num_consecutive_zeros == 22)
+		add_emulation_prevention_three_byte(rbsp);
+
+	shift = 7 - (rbsp->pos % 8);
+	ofs = rbsp->pos / 8;
+	if (ofs >= rbsp->size)
+		return -EINVAL;
+
+	rbsp->data[ofs] &= ~(1 << shift);
+	rbsp->data[ofs] |= value << shift;
+
+	rbsp->pos++;
+
+	if (value ||
+	    (rbsp->num_consecutive_zeros < 7 && (rbsp->pos % 8 == 0))) {
+		rbsp->num_consecutive_zeros = 0;
+	} else {
+		rbsp->num_consecutive_zeros++;
+	}
+
+	return 0;
+}
+
+static inline int rbsp_read_bits(struct rbsp *rbsp, int n, unsigned int *value)
+{
+	int i;
+	int bit;
+	unsigned int tmp = 0;
+
+	if (n > 8 * sizeof(*value))
+		return -EINVAL;
+
+	for (i = n; i > 0; i--) {
+		bit = rbsp_read_bit(rbsp);
+		if (bit < 0)
+			return bit;
+		tmp |= bit << (i - 1);
+	}
+
+	if (value)
+		*value = tmp;
+
+	return 0;
+}
+
+static int rbsp_write_bits(struct rbsp *rbsp, int n, unsigned int value)
+{
+	int ret;
+
+	if (n > 8 * sizeof(value))
+		return -EINVAL;
+
+	while (n--) {
+		ret = rbsp_write_bit(rbsp, (value >> n) & 1);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int rbsp_read_uev(struct rbsp *rbsp, unsigned int *value)
+{
+	int leading_zero_bits = 0;
+	unsigned int tmp = 0;
+	int ret;
+
+	while ((ret = rbsp_read_bit(rbsp)) == 0)
+		leading_zero_bits++;
+	if (ret < 0)
+		return ret;
+
+	if (leading_zero_bits > 0) {
+		ret = rbsp_read_bits(rbsp, leading_zero_bits, &tmp);
+		if (ret)
+			return ret;
+	}
+
+	if (value)
+		*value = (1 << leading_zero_bits) - 1 + tmp;
+
+	return 0;
+}
+
+static int rbsp_write_uev(struct rbsp *rbsp, unsigned int *value)
+{
+	int ret;
+	int leading_zero_bits;
+
+	if (!value)
+		return -EINVAL;
+
+	leading_zero_bits = ilog2(*value + 1);
+
+	ret = rbsp_write_bits(rbsp, leading_zero_bits, 0);
+	if (ret)
+		return ret;
+
+	return rbsp_write_bits(rbsp, leading_zero_bits + 1, *value + 1);
+}
+
+static int rbsp_read_sev(struct rbsp *rbsp, int *value)
+{
+	int ret;
+	unsigned int tmp;
+
+	ret = rbsp_read_uev(rbsp, &tmp);
+	if (ret)
+		return ret;
+
+	if (value) {
+		if (tmp & 1)
+			*value = (tmp + 1) / 2;
+		else
+			*value = -(tmp / 2);
+	}
+
+	return 0;
+}
+
+static int rbsp_write_sev(struct rbsp *rbsp, int *value)
+{
+	unsigned int tmp;
+
+	if (!value)
+		return -EINVAL;
+
+	if (*value > 0)
+		tmp = (2 * (*value)) | 1;
+	else
+		tmp = -2 * (*value);
+
+	return rbsp_write_uev(rbsp, &tmp);
+}
+
+static int __rbsp_write_bit(struct rbsp *rbsp, int *value)
+{
+	return rbsp_write_bit(rbsp, *value);
+}
+
+static int __rbsp_write_bits(struct rbsp *rbsp, int n, unsigned int *value)
+{
+	return rbsp_write_bits(rbsp, n, *value);
+}
+
+struct nal_rbsp_ops write = {
+	.rbsp_bit = __rbsp_write_bit,
+	.rbsp_bits = __rbsp_write_bits,
+	.rbsp_uev = rbsp_write_uev,
+	.rbsp_sev = rbsp_write_sev,
+};
+
+static int __rbsp_read_bit(struct rbsp *rbsp, int *value)
+{
+	int tmp = rbsp_read_bit(rbsp);
+
+	if (tmp < 0)
+		return tmp;
+	*value = tmp;
+
+	return 0;
+}
+
+struct nal_rbsp_ops read = {
+	.rbsp_bit = __rbsp_read_bit,
+	.rbsp_bits = rbsp_read_bits,
+	.rbsp_uev = rbsp_read_uev,
+	.rbsp_sev = rbsp_read_sev,
+};
+
+void rbsp_bit(struct rbsp *rbsp, int *value)
+{
+	if (rbsp->error)
+		return;
+	rbsp->error = rbsp->ops->rbsp_bit(rbsp, value);
+}
+
+void rbsp_bits(struct rbsp *rbsp, int n, int *value)
+{
+	if (rbsp->error)
+		return;
+	rbsp->error = rbsp->ops->rbsp_bits(rbsp, n, value);
+}
+
+void rbsp_uev(struct rbsp *rbsp, unsigned int *value)
+{
+	if (rbsp->error)
+		return;
+	rbsp->error = rbsp->ops->rbsp_uev(rbsp, value);
+}
+
+void rbsp_sev(struct rbsp *rbsp, int *value)
+{
+	if (rbsp->error)
+		return;
+	rbsp->error = rbsp->ops->rbsp_sev(rbsp, value);
+}
+
+void rbsp_trailing_bits(struct rbsp *rbsp)
+{
+	unsigned int rbsp_stop_one_bit = 1;
+	unsigned int rbsp_alignment_zero_bit = 0;
+
+	rbsp_bit(rbsp, &rbsp_stop_one_bit);
+	rbsp_bits(rbsp, round_up(rbsp->pos, 8) - rbsp->pos,
+		  &rbsp_alignment_zero_bit);
+}
diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.h b/drivers/media/platform/allegro-dvt/nal-rbsp.h
new file mode 100644
index 000000000000..90cc1a4f716d
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/nal-rbsp.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019-2020 Pengutronix, Michael Tretter <kernel@pengutronix.de>
+ */
+
+#ifndef __NAL_RBSP_H__
+#define __NAL_RBSP_H__
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+
+struct rbsp;
+
+struct nal_rbsp_ops {
+	int (*rbsp_bit)(struct rbsp *rbsp, int *val);
+	int (*rbsp_bits)(struct rbsp *rbsp, int n, unsigned int *val);
+	int (*rbsp_uev)(struct rbsp *rbsp, unsigned int *val);
+	int (*rbsp_sev)(struct rbsp *rbsp, int *val);
+};
+
+/**
+ * struct rbsp - State object for handling a raw byte sequence payload
+ * @data: pointer to the data of the rbsp
+ * @size: maximum size of the data of the rbsp
+ * @pos: current bit position inside the rbsp
+ * @num_consecutive_zeros: number of zeros before @pos
+ * @ops: per datatype functions for interacting with the rbsp
+ * @error: an error occurred while handling the rbsp
+ *
+ * This struct is passed around the various parsing functions and tracks the
+ * current position within the raw byte sequence payload.
+ *
+ * The @ops field allows to separate the operation, i.e., reading/writing a
+ * value from/to that rbsp, from the structure of the NAL unit. This allows to
+ * have a single function for iterating the NAL unit, while @ops has function
+ * pointers for handling each type in the rbsp.
+ */
+struct rbsp {
+	u8 *data;
+	size_t size;
+	unsigned int pos;
+	unsigned int num_consecutive_zeros;
+	struct nal_rbsp_ops *ops;
+	int error;
+};
+
+extern struct nal_rbsp_ops write;
+extern struct nal_rbsp_ops read;
+
+void rbsp_init(struct rbsp *rbsp, void *addr, size_t size,
+	       struct nal_rbsp_ops *ops);
+
+void rbsp_bit(struct rbsp *rbsp, int *value);
+void rbsp_bits(struct rbsp *rbsp, int n, int *value);
+void rbsp_uev(struct rbsp *rbsp, unsigned int *value);
+void rbsp_sev(struct rbsp *rbsp, int *value);
+
+void rbsp_trailing_bits(struct rbsp *rbsp);
+
+#endif /* __NAL_RBSP_H__ */
-- 
2.20.1

