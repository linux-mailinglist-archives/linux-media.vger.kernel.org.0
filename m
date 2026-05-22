Return-Path: <linux-media+bounces-62582-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kACiDkMvEGrIUgYAu9opvQ
	(envelope-from <linux-media+bounces-62582-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:26:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 822335B206A
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7362630CE8D7
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4783E3CBE6D;
	Fri, 22 May 2026 10:17:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B3E3CAA3B;
	Fri, 22 May 2026 10:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445071; cv=none; b=QSQd9VJsUlvWTaRrLcvPFR39KDt9T7DswOT1VXckZbpzN9xH4dewMqJYA8fcX1fi6+XbmD9gnHlg8hvPa6hGYOyUkJqXTY3+eEjwQBVM4M1dnl+Xo+GqVWRaoXCHP8ezpznYW65hHsWsqzoh4PniF0nP6A8swCj6YOOgR9I2Pn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445071; c=relaxed/simple;
	bh=E42afgtHOKtxZ5F/w32E9X6x47jckzknIP+Q15VU7aI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JEIjMA9tXqFuN208cZrgXhqoJyrMf2mRDNZXxeHRZmWnX+pzHkr1mtAITzJxzOpZSGxywlxd/lNxMZiNk/FQ6g0LmXXK4wnLNIsnfmKI1tFCGaAEf49+DM1MxYsjsl7dqOw3/rGDWkwJZuOeKHRGJu5AHHi0JRtmf430t4PMbPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id DBADA3700297;
	Fri, 22 May 2026 10:17:37 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 57155B408D5; Fri, 22 May 2026 10:17:37 +0000 (UTC)
X-Spam-Level: **
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id CBDC6B408CD;
	Fri, 22 May 2026 10:17:02 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 05/14] media: h264: Add stateless encode rbsp
Date: Fri, 22 May 2026 12:16:44 +0200
Message-ID: <20260522101653.2565125-6-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522101653.2565125-1-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62582-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.586];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sys-base.io:mid,sys-base.io:email]
X-Rspamd-Queue-Id: 822335B206A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The H.264 stateless encode rbsp implementation allows generating H.264
bitstream headers to accommodate hardware that does not do it (which is
rather common with stateless encoders).

It currently supports the following NAL unit types: AUD, SPS, PPS,
slice header, with or without start codes.

Dedicated low-level operations are supported in order to accommodate
hardware with dedicated hardware for bitstream storage. It is generally
better to use such mechanisms to ensure slice NAL unit continuation,
especially in unaligned cases.

It is deliberately not too tied to the H.264 stateless encode core so
that it can be reused by stateful drivers that may need to do the same.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/media/v4l2-core/Makefile             |    2 +-
 drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c | 1173 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-h264-enc.c      |  153 +++
 include/media/v4l2-h264-enc-rbsp.h           |   72 ++
 include/media/v4l2-h264-enc.h                |    5 +
 5 files changed, 1404 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
 create mode 100644 include/media/v4l2-h264-enc-rbsp.h

diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index bd319e363c8e..aba9e310f2e5 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -29,7 +29,7 @@ obj-$(CONFIG_V4L2_CCI) += v4l2-cci.o
 obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
 obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
 obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
-obj-$(CONFIG_V4L2_H264_ENC) += v4l2-h264-enc.o
+obj-$(CONFIG_V4L2_H264_ENC) += v4l2-h264-enc.o v4l2-h264-enc-rbsp.o
 obj-$(CONFIG_V4L2_JPEG_HELPER) += v4l2-jpeg.o
 obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
 obj-$(CONFIG_V4L2_VP9) += v4l2-vp9.o
diff --git a/drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c b/drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
new file mode 100644
index 000000000000..a165f8114ce9
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
@@ -0,0 +1,1173 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * V4L2 H.264 Encode RBSP
+ *
+ * Copyright (C) 2025-2026 Paul Kocialkowski <paulk@sys-base.io>
+ */
+
+#include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/bug.h>
+#include <linux/errno.h>
+#include <linux/minmax.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/v4l2-controls.h>
+#include <media/v4l2-h264.h>
+#include <media/v4l2-h264-enc-rbsp.h>
+
+int v4l2_h264_enc_rbsp_init(struct v4l2_h264_enc_rbsp *rbsp, u8 *pointer,
+			    unsigned int size)
+{
+	rbsp->pointer = pointer;
+	rbsp->size = size;
+
+	rbsp->bit_offset = 0;
+	rbsp->bits_count = 0;
+	rbsp->zero_count = 0;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_rbsp_init);
+
+unsigned int v4l2_h264_enc_rbsp_bits_count(struct v4l2_h264_enc_rbsp *rbsp)
+{
+	return rbsp->bits_count;
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_rbsp_bits_count);
+
+unsigned int v4l2_h264_enc_rbsp_bytes_count(struct v4l2_h264_enc_rbsp *rbsp)
+{
+	WARN_ON(rbsp->bits_count % 8);
+
+	return rbsp->bits_count / 8;
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_rbsp_bytes_count);
+
+static int v4l2_h264_enc_rbsp_bits_raw(struct v4l2_h264_enc_rbsp *rbsp,
+				       u32 value, unsigned char bits_count)
+{
+	unsigned int bits_left = bits_count;
+	unsigned int bits_chunk;
+	unsigned int bit_start;
+	unsigned int bit_stop;
+	u32 value_extract;
+	int ret;
+
+	if (bits_count > 32)
+		return -EINVAL;
+	else if (!bits_count)
+		return 0;
+
+	value &= GENMASK(bits_count - 1, 0);
+
+	/* XXX: Has to manage rbsp->bit_offset and rbsp->bits_count. */
+	ret = v4l2_h264_enc_rbsp_op(rbsp, bits_raw, value, bits_count);
+	if (!ret)
+		return 0;
+	else if (ret != -EOPNOTSUPP)
+		return ret;
+
+	while (bits_left > 0) {
+		if (WARN_ON(rbsp->bit_offset >= 8))
+			return -1;
+
+		bits_chunk = min(8u - rbsp->bit_offset, bits_left);
+
+		bit_stop = bits_left - 1;
+		bit_start = bit_stop + 1 - bits_chunk;
+		value_extract = (value & GENMASK(bit_stop, bit_start)) >>
+				bit_start;
+
+		bit_stop = 7u - rbsp->bit_offset;
+		bit_start = bit_stop + 1 - bits_chunk;
+
+		*rbsp->pointer &= ~GENMASK(bit_stop, bit_start);
+		*rbsp->pointer |= value_extract << bit_start;
+
+		rbsp->bit_offset += bits_chunk;
+
+		if (rbsp->bit_offset == 8) {
+			rbsp->pointer++;
+			rbsp->bit_offset = 0;
+		}
+
+		rbsp->bits_count += bits_chunk;
+
+		if (rbsp->bits_count / 8 >= rbsp->size)
+			return -ENOMEM;
+
+		bits_left -= bits_chunk;
+	}
+
+	WARN_ON(bits_left);
+
+	return 0;
+}
+
+static int eptb_bits(struct v4l2_h264_enc_rbsp *rbsp, unsigned int *bits_left,
+		     unsigned int zero_step)
+{
+	unsigned int zero_discard;
+	unsigned int zero_count;
+	unsigned int zero_chunk;
+	int ret;
+
+	if (!zero_step)
+		return 0;
+
+	/* Trailing zeros in a non-zero byte are discarded for EPTB. */
+	if (!rbsp->zero_count && rbsp->bit_offset)
+		zero_discard = min(8u - rbsp->bit_offset, zero_step);
+	else
+		zero_discard = 0;
+
+	/* Append discarded zeros before byte alignment. */
+	if (zero_discard) {
+		ret = v4l2_h264_enc_rbsp_bits_raw(rbsp, 0, zero_discard);
+		if (ret)
+			return ret;
+
+		*bits_left -= zero_discard;
+		zero_step -= zero_discard;
+	}
+
+	/* Count relevant zeros for EPTB (starting at byte alignment). */
+	zero_count = rbsp->zero_count + zero_step;
+
+	/* Append EPTB as many times as necessary. */
+	while (zero_count >= 22) {
+		zero_chunk = 22 - rbsp->zero_count;
+
+		ret = v4l2_h264_enc_rbsp_bits_raw(rbsp, 0, zero_chunk);
+		if (ret)
+			return ret;
+
+		/* Two high bits for 0x3 and 6 other bits for stolen zeros. */
+		ret = v4l2_h264_enc_rbsp_bits_raw(rbsp,
+						  V4L2_H264_ENC_RBSP_EPTB << 6,
+						  8);
+		if (ret)
+			return ret;
+
+		/* We get 6 zeros after byte alignment. */
+		rbsp->zero_count = 6;
+
+		*bits_left -= zero_chunk;
+		zero_step -= zero_chunk;
+		zero_count = rbsp->zero_count + zero_step;
+	}
+
+	/* Append remaining zero bits. */
+	if (zero_step) {
+		ret = v4l2_h264_enc_rbsp_bits_raw(rbsp, 0, zero_step);
+		if (ret)
+			return ret;
+
+		*bits_left -= zero_step;
+	}
+
+	rbsp->zero_count = zero_count;
+
+	return ret;
+}
+
+static int v4l2_h264_enc_rbsp_bits(struct v4l2_h264_enc_rbsp *rbsp, u32 value,
+				   unsigned int bits_count)
+{
+	unsigned int bits_left = bits_count;
+	unsigned int zero_head;
+	unsigned int zero_tail;
+	int ret;
+
+	if (bits_count > 32)
+		return -EINVAL;
+	else if (!bits_count)
+		return 0;
+
+	ret = v4l2_h264_enc_rbsp_op(rbsp, bits, value, bits_count);
+	if (!ret)
+		return 0;
+	else if (ret != -EOPNOTSUPP)
+		return ret;
+
+	value &= GENMASK(bits_count - 1, 0);
+
+	/* Count heading zeros. */
+	if (value)
+		zero_head = bits_count - __fls(value) - 1;
+	else
+		zero_head = bits_count;
+
+	/* Append heading zeros with EPTB. */
+	ret = eptb_bits(rbsp, &bits_left, zero_head);
+	if (ret)
+		return ret;
+
+	/* A zero value is entirely handled as heading zeros. */
+	if (!bits_left || WARN_ON(!value))
+		return 0;
+
+	/* Count trailing zeros. */
+	zero_tail = __ffs(value);
+
+	/* Append non-tail bits. */
+	ret = v4l2_h264_enc_rbsp_bits_raw(rbsp, value >> zero_tail,
+					  bits_left - zero_tail);
+	if (ret)
+		return ret;
+
+	/* Reset zero count after appending non-zero bits. */
+	rbsp->zero_count = 0;
+
+	bits_left = zero_tail;
+	if (!bits_left)
+		return 0;
+
+	/* Append trailing zeros with EPTB. */
+	ret = eptb_bits(rbsp, &bits_left, zero_tail);
+	if (ret)
+		return ret;
+
+	WARN_ON(bits_left);
+
+	return 0;
+}
+
+static int v4l2_h264_enc_rbsp_ue(struct v4l2_h264_enc_rbsp *rbsp, u32 value)
+{
+	unsigned int bits_count;
+	int ret;
+
+	ret = v4l2_h264_enc_rbsp_op(rbsp, ue, value);
+	if (!ret)
+		return 0;
+	else if (ret != -EOPNOTSUPP)
+		return ret;
+
+	/*
+	 * Exponential-Golomb coding of x stores the value of v + 1.
+	 * This takes fls(v + 1) + 1 bits for the non-zero bits and fls(v + 1)
+	 * heading zero bits.
+	 */
+	value += 1;
+	bits_count = 2 * __fls(value) + 1;
+
+	return v4l2_h264_enc_rbsp_bits(rbsp, value, bits_count);
+}
+
+static int v4l2_h264_enc_rbsp_se(struct v4l2_h264_enc_rbsp *rbsp, s32 value)
+{
+	u32 value_ue;
+	int ret;
+
+	ret = v4l2_h264_enc_rbsp_op(rbsp, se, value);
+	if (!ret)
+		return 0;
+	else if (ret != -EOPNOTSUPP)
+		return ret;
+
+	/*
+	 * The signed extension represents numbers in Exponential-Golomb
+	 * with each positive value followed by its corresponding negative
+	 * value in sequence order.
+	 */
+
+	if (value > 0)
+		value_ue = 2 * value - 1;
+	else
+		value_ue = -2 * value;
+
+	return v4l2_h264_enc_rbsp_ue(rbsp, value_ue);
+}
+
+static int v4l2_h264_enc_rbsp_align(struct v4l2_h264_enc_rbsp *rbsp)
+{
+	unsigned int zero_count;
+	int ret;
+
+	ret = v4l2_h264_enc_rbsp_op(rbsp, align);
+	if (!ret)
+		return 0;
+	else if (ret != -EOPNOTSUPP)
+		return ret;
+
+	zero_count = 8 - rbsp->bit_offset;
+	if (!zero_count)
+		return 0;
+
+	return v4l2_h264_enc_rbsp_bits(rbsp, 0, zero_count);
+}
+
+static int v4l2_h264_enc_rbsp_u32(struct v4l2_h264_enc_rbsp *rbsp, u32 value)
+{
+	return v4l2_h264_enc_rbsp_bits(rbsp, value, 32);
+}
+
+static int v4l2_h264_enc_rbsp_u16(struct v4l2_h264_enc_rbsp *rbsp, u16 value)
+{
+	return v4l2_h264_enc_rbsp_bits(rbsp, value, 16);
+}
+
+static int v4l2_h264_enc_rbsp_u8(struct v4l2_h264_enc_rbsp *rbsp, u8 value)
+{
+	return v4l2_h264_enc_rbsp_bits(rbsp, value, 8);
+}
+
+static int v4l2_h264_enc_rbsp_bit(struct v4l2_h264_enc_rbsp *rbsp, u8 value)
+{
+	return v4l2_h264_enc_rbsp_bits(rbsp, value, 1);
+}
+
+static int v4l2_h264_enc_rbsp_flag(struct v4l2_h264_enc_rbsp *rbsp, u32 flags,
+				   u32 flag)
+{
+	return v4l2_h264_enc_rbsp_bit(rbsp, (flags & flag) == flag);
+}
+
+int v4l2_h264_enc_rbsp_start_code(struct v4l2_h264_enc_rbsp *rbsp)
+{
+	/* Start code must be inserted at a byte-aligned position. */
+	if (WARN_ON(rbsp->bit_offset))
+		return -EINVAL;
+
+	return v4l2_h264_enc_rbsp_bits_raw(rbsp, V4L2_H264_START_CODE_ANNEX_B,
+					   32);
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_rbsp_start_code);
+
+static int v4l2_h264_enc_rbsp_nalu_begin(struct v4l2_h264_enc_rbsp *rbsp,
+					 u8 nal_ref_idc, u8 nal_unit_type)
+{
+	u8 forbidden_zero_bit = 0;
+	int ret;
+
+	/* NALU must be inserted at a byte-aligned position. */
+	if (WARN_ON(rbsp->bit_offset))
+		return -EINVAL;
+
+	/* NALU header bits must not be counted in EPTB. */
+
+	ret = v4l2_h264_enc_rbsp_bits_raw(rbsp, forbidden_zero_bit, 1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_bits_raw(rbsp, nal_ref_idc, 2);
+	if (ret)
+		return ret;
+
+	return v4l2_h264_enc_rbsp_bits_raw(rbsp, nal_unit_type, 5);
+}
+
+static int v4l2_h264_enc_rbsp_nalu_end(struct v4l2_h264_enc_rbsp *rbsp)
+{
+	u8 rbsp_stop_one_bit = 1;
+	int ret;
+
+	ret = v4l2_h264_enc_rbsp_bit(rbsp, rbsp_stop_one_bit);
+	if (ret)
+		return ret;
+
+	return v4l2_h264_enc_rbsp_align(rbsp);
+}
+
+int v4l2_h264_enc_rbsp_aud(struct v4l2_h264_enc_rbsp *rbsp, u8 primary_pic_type)
+{
+	int ret;
+
+	ret = v4l2_h264_enc_rbsp_nalu_begin(rbsp, 0, V4L2_H264_NALU_TYPE_AUD);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_bits(rbsp, primary_pic_type, 3);
+	if (ret)
+		return ret;
+
+	return v4l2_h264_enc_rbsp_nalu_end(rbsp);
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_rbsp_aud);
+
+static int v4l2_h264_enc_rbsp_sps_hrd(struct v4l2_h264_enc_rbsp *rbsp,
+				      const struct v4l2_h264_sps_video_hrd *hrd)
+{
+	unsigned int i;
+	int ret;
+
+	if (hrd->cpb_cnt_minus1 > 31)
+		return -EINVAL;
+
+	ret = v4l2_h264_enc_rbsp_ue(rbsp, hrd->cpb_cnt_minus1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_bits(rbsp, hrd->bit_rate_scale, 4);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_bits(rbsp, hrd->cpb_size_scale, 4);
+	if (ret)
+		return ret;
+
+	for (i = 0; i <= hrd->cpb_cnt_minus1; i++) {
+		ret = v4l2_h264_enc_rbsp_ue(rbsp,
+					    hrd->bit_rate_value_minus1[i]);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_ue(rbsp,
+					    hrd->cpb_size_value_minus1[i]);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_bit(rbsp, hrd->cbr_flag[i]);
+		if (ret)
+			return ret;
+	}
+
+	ret = v4l2_h264_enc_rbsp_bits(rbsp,
+				      hrd->initial_cpb_removal_delay_length_minus1,
+				      5);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_bits(rbsp,
+				      hrd->cpb_removal_delay_length_minus1, 5);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_bits(rbsp, hrd->dpb_output_delay_length_minus1,
+				      5);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_bits(rbsp, hrd->time_offset_length, 5);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int v4l2_h264_enc_rbsp_sps_vui(struct v4l2_h264_enc_rbsp *rbsp,
+				      const struct v4l2_h264_sps_video *sps_video)
+{
+	int ret;
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, sps_video->flags,
+				      V4L2_H264_SPS_VIDEO_FLAG_VUI_ASPECT_RATIO_INFO_PRESENT);
+	if (ret)
+		return ret;
+
+	if (sps_video->flags & V4L2_H264_SPS_VIDEO_FLAG_VUI_ASPECT_RATIO_INFO_PRESENT) {
+		ret = v4l2_h264_enc_rbsp_u8(rbsp, sps_video->aspect_ratio_idc);
+		if (ret)
+			return ret;
+
+		if (sps_video->aspect_ratio_idc ==
+		    V4L2_H264_VUI_ASPECT_RATIO_IDC_EXTENDED) {
+			ret = v4l2_h264_enc_rbsp_u16(rbsp,
+						     sps_video->sar_width);
+			if (ret)
+				return ret;
+
+			ret = v4l2_h264_enc_rbsp_u16(rbsp,
+						     sps_video->sar_height);
+			if (ret)
+				return ret;
+		}
+	}
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, sps_video->flags,
+				      V4L2_H264_SPS_VIDEO_FLAG_VUI_OVERSCAN_INFO_PRESENT);
+	if (ret)
+		return ret;
+
+	if (sps_video->flags & V4L2_H264_SPS_VIDEO_FLAG_VUI_OVERSCAN_INFO_PRESENT) {
+		ret = v4l2_h264_enc_rbsp_flag(rbsp, sps_video->flags,
+					      V4L2_H264_SPS_VIDEO_FLAG_VUI_OVERSCAN_APPROPRIATE);
+		if (ret)
+			return ret;
+	}
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, sps_video->flags,
+				      V4L2_H264_SPS_VIDEO_FLAG_VUI_VIDEO_SIGNAL_TYPE_PRESENT);
+	if (ret)
+		return ret;
+
+	if (sps_video->flags & V4L2_H264_SPS_VIDEO_FLAG_VUI_VIDEO_SIGNAL_TYPE_PRESENT) {
+		ret = v4l2_h264_enc_rbsp_bits(rbsp, sps_video->video_format, 3);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_flag(rbsp, sps_video->flags,
+					      V4L2_H264_SPS_VIDEO_FLAG_VUI_VIDEO_FULL_RANGE);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_flag(rbsp, sps_video->flags,
+					      V4L2_H264_SPS_VIDEO_FLAG_VUI_COLOUR_DESCRIPTION_PRESENT);
+		if (ret)
+			return ret;
+
+		if (sps_video->flags & V4L2_H264_SPS_VIDEO_FLAG_VUI_COLOUR_DESCRIPTION_PRESENT) {
+			ret = v4l2_h264_enc_rbsp_u8(rbsp,
+						    sps_video->colour_primaries);
+			if (ret)
+				return ret;
+
+			ret = v4l2_h264_enc_rbsp_u8(rbsp,
+						    sps_video->transfer_characteristics);
+			if (ret)
+				return ret;
+
+			ret = v4l2_h264_enc_rbsp_u8(rbsp,
+						    sps_video->matrix_coefficients);
+			if (ret)
+				return ret;
+		}
+	}
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, sps_video->flags,
+				      V4L2_H264_SPS_VIDEO_FLAG_VUI_CHROMA_LOC_INFO_PRESENT);
+	if (ret)
+		return ret;
+
+	if (sps_video->flags & V4L2_H264_SPS_VIDEO_FLAG_VUI_CHROMA_LOC_INFO_PRESENT) {
+		ret = v4l2_h264_enc_rbsp_ue(rbsp,
+					    sps_video->chroma_sample_loc_type_top_field);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_ue(rbsp,
+					    sps_video->chroma_sample_loc_type_bottom_field);
+		if (ret)
+			return ret;
+	}
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, sps_video->flags,
+				      V4L2_H264_SPS_VIDEO_FLAG_VUI_TIMING_INFO_PRESENT);
+	if (ret)
+		return ret;
+
+	if (sps_video->flags & V4L2_H264_SPS_VIDEO_FLAG_VUI_TIMING_INFO_PRESENT) {
+		ret = v4l2_h264_enc_rbsp_u32(rbsp,
+					     sps_video->num_units_in_tick);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_u32(rbsp,
+					     sps_video->time_scale);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_flag(rbsp, sps_video->flags,
+					      V4L2_H264_SPS_VIDEO_FLAG_VUI_FIXED_FRAME_RATE);
+		if (ret)
+			return ret;
+	}
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, sps_video->flags,
+				      V4L2_H264_SPS_VIDEO_FLAG_VUI_NAL_HRD_PARAMETERS_PRESENT);
+	if (ret)
+		return ret;
+
+	if (sps_video->flags & V4L2_H264_SPS_VIDEO_FLAG_VUI_NAL_HRD_PARAMETERS_PRESENT) {
+		ret = v4l2_h264_enc_rbsp_sps_hrd(rbsp, &sps_video->nal_hrd);
+		if (ret)
+			return ret;
+	}
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, sps_video->flags,
+				      V4L2_H264_SPS_VIDEO_FLAG_VUI_VCL_HRD_PARAMETERS_PRESENT);
+	if (ret)
+		return ret;
+
+	if (sps_video->flags & V4L2_H264_SPS_VIDEO_FLAG_VUI_VCL_HRD_PARAMETERS_PRESENT) {
+		ret = v4l2_h264_enc_rbsp_sps_hrd(rbsp, &sps_video->vcl_hrd);
+		if (ret)
+			return ret;
+	}
+
+	if (sps_video->flags & V4L2_H264_SPS_VIDEO_FLAG_VUI_NAL_HRD_PARAMETERS_PRESENT ||
+	    sps_video->flags & V4L2_H264_SPS_VIDEO_FLAG_VUI_VCL_HRD_PARAMETERS_PRESENT) {
+		ret = v4l2_h264_enc_rbsp_flag(rbsp, sps_video->flags,
+					      V4L2_H264_SPS_VIDEO_FLAG_VUI_LOW_DELAY_HRD);
+		if (ret)
+			return ret;
+	}
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, sps_video->flags,
+				      V4L2_H264_SPS_VIDEO_FLAG_VUI_PIC_STRUCT_PRESENT);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, sps_video->flags,
+				      V4L2_H264_SPS_VIDEO_FLAG_VUI_BITSTREAM_RESTRICTION);
+	if (ret)
+		return ret;
+
+	if (sps_video->flags & V4L2_H264_SPS_VIDEO_FLAG_VUI_BITSTREAM_RESTRICTION) {
+		ret = v4l2_h264_enc_rbsp_flag(rbsp, sps_video->flags,
+					      V4L2_H264_SPS_VIDEO_FLAG_VUI_MOTION_VECTORS_OVER_PIC_BOUNDARIES);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_ue(rbsp,
+					    sps_video->max_bytes_per_pic_denom);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_ue(rbsp,
+					    sps_video->max_bits_per_mb_denom);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_ue(rbsp,
+					    sps_video->log2_max_mv_length_horizontal);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_ue(rbsp,
+					    sps_video->log2_max_mv_length_vertical);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_ue(rbsp,
+					    sps_video->max_num_reorder_frames);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_ue(rbsp,
+					    sps_video->max_dec_frame_buffering);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int v4l2_h264_enc_rbsp_sps(struct v4l2_h264_enc_rbsp *rbsp,
+			   const struct v4l2_ctrl_h264_sps *sps,
+			   const struct v4l2_h264_sps_video *sps_video)
+{
+	u8 constraint_set_flags = 0;
+	u8 seq_scaling_matrix_present_flag = 0;
+	unsigned int i;
+	int ret;
+
+	ret = v4l2_h264_enc_rbsp_nalu_begin(rbsp, 0, V4L2_H264_NALU_TYPE_SPS);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_u8(rbsp, sps->profile_idc);
+	if (ret)
+		return ret;
+
+	if (sps->constraint_set_flags & V4L2_H264_SPS_CONSTRAINT_SET0_FLAG)
+		constraint_set_flags |= BIT(7);
+	if (sps->constraint_set_flags & V4L2_H264_SPS_CONSTRAINT_SET1_FLAG)
+		constraint_set_flags |= BIT(6);
+	if (sps->constraint_set_flags & V4L2_H264_SPS_CONSTRAINT_SET2_FLAG)
+		constraint_set_flags |= BIT(5);
+	if (sps->constraint_set_flags & V4L2_H264_SPS_CONSTRAINT_SET3_FLAG)
+		constraint_set_flags |= BIT(4);
+	if (sps->constraint_set_flags & V4L2_H264_SPS_CONSTRAINT_SET4_FLAG)
+		constraint_set_flags |= BIT(3);
+	if (sps->constraint_set_flags & V4L2_H264_SPS_CONSTRAINT_SET5_FLAG)
+		constraint_set_flags |= BIT(2);
+
+	ret = v4l2_h264_enc_rbsp_u8(rbsp, constraint_set_flags);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_u8(rbsp, sps->level_idc);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_ue(rbsp, sps->seq_parameter_set_id);
+	if (ret)
+		return ret;
+
+	if (V4L2_H264_SPS_HAS_CHROMA_FORMAT(sps)) {
+		ret = v4l2_h264_enc_rbsp_ue(rbsp, sps->chroma_format_idc);
+		if (ret)
+			return ret;
+
+		if (sps->chroma_format_idc == 3) {
+			ret = v4l2_h264_enc_rbsp_flag(rbsp, sps->flags,
+						      V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE);
+			if (ret)
+				return ret;
+		}
+
+		ret = v4l2_h264_enc_rbsp_ue(rbsp, sps->bit_depth_luma_minus8);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_ue(rbsp, sps->bit_depth_chroma_minus8);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_flag(rbsp, sps->flags,
+					      V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS);
+		if (ret)
+			return ret;
+
+		/* Scaling matrix is not supported. */
+		ret = v4l2_h264_enc_rbsp_bit(rbsp,
+					     seq_scaling_matrix_present_flag);
+		if (ret)
+			return ret;
+	}
+
+	ret = v4l2_h264_enc_rbsp_ue(rbsp, sps->log2_max_frame_num_minus4);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_ue(rbsp, sps->pic_order_cnt_type);
+	if (ret)
+		return ret;
+
+	if (!sps->pic_order_cnt_type) {
+		ret = v4l2_h264_enc_rbsp_ue(rbsp,
+					    sps->log2_max_pic_order_cnt_lsb_minus4);
+		if (ret)
+			return ret;
+	} else if (sps->pic_order_cnt_type == 1) {
+		ret = v4l2_h264_enc_rbsp_flag(rbsp, sps->flags,
+					      V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_se(rbsp, sps->offset_for_non_ref_pic);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_se(rbsp,
+					    sps->offset_for_top_to_bottom_field);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_ue(rbsp,
+					    sps->num_ref_frames_in_pic_order_cnt_cycle);
+		if (ret)
+			return ret;
+
+		for (i = 0; i < sps->num_ref_frames_in_pic_order_cnt_cycle; i++) {
+			ret = v4l2_h264_enc_rbsp_se(rbsp,
+						    sps->offset_for_ref_frame[i]);
+			if (ret)
+				return ret;
+		}
+	} else {
+		return -EINVAL;
+	}
+
+	ret = v4l2_h264_enc_rbsp_ue(rbsp, sps->max_num_ref_frames);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, sps->flags,
+				      V4L2_H264_SPS_FLAG_GAPS_IN_FRAME_NUM_VALUE_ALLOWED);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_ue(rbsp, sps->pic_width_in_mbs_minus1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_ue(rbsp, sps->pic_height_in_map_units_minus1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, sps->flags,
+				      V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY);
+	if (ret)
+		return ret;
+
+	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY)) {
+		ret = v4l2_h264_enc_rbsp_flag(rbsp, sps->flags,
+					      V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD);
+		if (ret)
+			return ret;
+	}
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, sps->flags,
+				      V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, sps_video->flags,
+				      V4L2_H264_SPS_VIDEO_FLAG_FRAME_CROPPING);
+	if (ret)
+		return ret;
+
+	if (sps_video->flags & V4L2_H264_SPS_VIDEO_FLAG_FRAME_CROPPING) {
+		ret = v4l2_h264_enc_rbsp_ue(rbsp,
+					    sps_video->frame_crop_left_offset);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_ue(rbsp,
+					    sps_video->frame_crop_right_offset);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_ue(rbsp,
+					    sps_video->frame_crop_top_offset);
+		if (ret)
+			return ret;
+
+		ret = v4l2_h264_enc_rbsp_ue(rbsp,
+					    sps_video->frame_crop_bottom_offset);
+		if (ret)
+			return ret;
+	}
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, sps_video->flags,
+				      V4L2_H264_SPS_VIDEO_FLAG_VUI_PARAMETERS_PRESENT);
+	if (ret)
+		return ret;
+
+	if (sps_video->flags & V4L2_H264_SPS_VIDEO_FLAG_VUI_PARAMETERS_PRESENT) {
+		ret = v4l2_h264_enc_rbsp_sps_vui(rbsp, sps_video);
+		if (ret)
+			return ret;
+	}
+
+	return v4l2_h264_enc_rbsp_nalu_end(rbsp);
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_rbsp_sps);
+
+int v4l2_h264_enc_rbsp_pps(struct v4l2_h264_enc_rbsp *rbsp,
+			   const struct v4l2_ctrl_h264_pps *pps)
+{
+	u8 pic_scaling_matrix_present_flag = 0;
+	int ret;
+
+	ret = v4l2_h264_enc_rbsp_nalu_begin(rbsp, 0, V4L2_H264_NALU_TYPE_PPS);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_ue(rbsp, pps->pic_parameter_set_id);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_ue(rbsp, pps->seq_parameter_set_id);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, pps->flags,
+				      V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, pps->flags,
+				      V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_ue(rbsp, pps->num_slice_groups_minus1);
+	if (ret)
+		return ret;
+
+	/* Multiple slice groups are not supported. */
+	if (pps->num_slice_groups_minus1 > 1)
+		return -EINVAL;
+
+	ret = v4l2_h264_enc_rbsp_ue(rbsp,
+				    pps->num_ref_idx_l0_default_active_minus1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_ue(rbsp,
+				    pps->num_ref_idx_l1_default_active_minus1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, pps->flags,
+				      V4L2_H264_PPS_FLAG_WEIGHTED_PRED);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_bits(rbsp, pps->weighted_bipred_idc, 2);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_se(rbsp, pps->pic_init_qp_minus26);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_se(rbsp, pps->pic_init_qs_minus26);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_se(rbsp, pps->chroma_qp_index_offset);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, pps->flags,
+				      V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, pps->flags,
+				      V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, pps->flags,
+				      V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_flag(rbsp, pps->flags,
+				      V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE);
+	if (ret)
+		return ret;
+
+	/* Scaling matrix is not supported. */
+	ret = v4l2_h264_enc_rbsp_bit(rbsp, pic_scaling_matrix_present_flag);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_se(rbsp, pps->second_chroma_qp_index_offset);
+	if (ret)
+		return ret;
+
+	return v4l2_h264_enc_rbsp_nalu_end(rbsp);
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_rbsp_pps);
+
+int v4l2_h264_enc_rbsp_slice_header(struct v4l2_h264_enc_rbsp *rbsp,
+				    const struct v4l2_ctrl_h264_sps *sps,
+				    const struct v4l2_ctrl_h264_pps *pps,
+				    const struct v4l2_ctrl_h264_encode_params *encode)
+{
+	u8 ref_pic_list_modification_flag_l0 = 0;
+	u8 ref_pic_list_modification_flag_l1 = 0;
+	u8 adaptive_ref_pic_marking_mode_flag = 0;
+	u32 first_mb_in_slice = 0;
+	u32 redundant_pic_cnt = 0;
+	u8 sp_for_switch_flag = 0;
+	s32 slice_qs_delta = 0;
+	u8 nal_unit_type;
+	int ret;
+
+	if (encode->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC)
+		nal_unit_type = V4L2_H264_NALU_TYPE_SLICE_IDR;
+	else
+		nal_unit_type = V4L2_H264_NALU_TYPE_SLICE_NON_IDR;
+
+	ret = v4l2_h264_enc_rbsp_nalu_begin(rbsp, encode->nal_ref_idc,
+					    nal_unit_type);
+	if (ret)
+		return ret;
+
+	/* Multiple slices are not supported. */
+	ret = v4l2_h264_enc_rbsp_ue(rbsp, first_mb_in_slice);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_ue(rbsp, encode->slice_type);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_rbsp_ue(rbsp, encode->pic_parameter_set_id);
+	if (ret)
+		return ret;
+
+	if (sps->flags & V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE) {
+		ret = v4l2_h264_enc_rbsp_bits(rbsp, encode->colour_plane_id, 2);
+		if (ret)
+			return ret;
+	}
+
+	ret = v4l2_h264_enc_rbsp_bits(rbsp, encode->frame_num,
+				      sps->log2_max_frame_num_minus4 + 4);
+	if (ret)
+		return ret;
+
+	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY)) {
+		ret = v4l2_h264_enc_rbsp_flag(rbsp, encode->flags,
+					      V4L2_H264_ENCODE_FLAG_FIELD_PIC);
+		if (ret)
+			return ret;
+
+		if (encode->flags & V4L2_H264_ENCODE_FLAG_FIELD_PIC) {
+			ret = v4l2_h264_enc_rbsp_flag(rbsp, encode->flags,
+						      V4L2_H264_ENCODE_FLAG_BOTTOM_FIELD);
+			if (ret)
+				return ret;
+		}
+	}
+
+	if (encode->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC) {
+		ret = v4l2_h264_enc_rbsp_ue(rbsp, encode->idr_pic_id);
+		if (ret)
+			return ret;
+	}
+
+	if (!sps->pic_order_cnt_type) {
+		ret = v4l2_h264_enc_rbsp_bits(rbsp, encode->pic_order_cnt_lsb,
+					      sps->log2_max_pic_order_cnt_lsb_minus4 + 4);
+		if (ret)
+			return ret;
+
+		if (pps->flags & V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT &&
+		    !(encode->flags & V4L2_H264_ENCODE_FLAG_FIELD_PIC)) {
+			ret = v4l2_h264_enc_rbsp_se(rbsp,
+						    encode->delta_pic_order_cnt_bottom);
+			if (ret)
+				return ret;
+		}
+	}
+
+	if (sps->pic_order_cnt_type == 1 &&
+	    !(sps->flags & V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO)) {
+		ret = v4l2_h264_enc_rbsp_se(rbsp,
+					    encode->delta_pic_order_cnt0);
+		if (ret)
+			return ret;
+
+		if (pps->flags & V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT &&
+		    !(encode->flags & V4L2_H264_ENCODE_FLAG_FIELD_PIC)) {
+			ret = v4l2_h264_enc_rbsp_se(rbsp,
+						    encode->delta_pic_order_cnt1);
+			if (ret)
+				return ret;
+		}
+	}
+
+	if (pps->flags & V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT) {
+		/* Redundant pictures are not supported. */
+		ret = v4l2_h264_enc_rbsp_ue(rbsp, redundant_pic_cnt);
+		if (ret)
+			return ret;
+	}
+
+	if (encode->slice_type == V4L2_H264_SLICE_TYPE_B) {
+		ret = v4l2_h264_enc_rbsp_flag(rbsp, encode->flags,
+					      V4L2_H264_ENCODE_FLAG_DIRECT_SPATIAL_MV_PRED);
+		if (ret)
+			return ret;
+	}
+
+	if (encode->slice_type == V4L2_H264_SLICE_TYPE_P ||
+	    encode->slice_type == V4L2_H264_SLICE_TYPE_SP ||
+	    encode->slice_type == V4L2_H264_SLICE_TYPE_B) {
+		ret = v4l2_h264_enc_rbsp_flag(rbsp, encode->flags,
+					      V4L2_H264_ENCODE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE);
+		if (ret)
+			return ret;
+
+		if (encode->flags & V4L2_H264_ENCODE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE) {
+			ret = v4l2_h264_enc_rbsp_ue(rbsp,
+						    encode->num_ref_idx_l0_active_minus1);
+			if (ret)
+				return ret;
+		}
+
+		if (encode->flags & V4L2_H264_ENCODE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE &&
+		    encode->slice_type == V4L2_H264_SLICE_TYPE_B) {
+			ret = v4l2_h264_enc_rbsp_ue(rbsp,
+						    encode->num_ref_idx_l1_active_minus1);
+			if (ret)
+				return ret;
+		}
+	}
+
+	if (encode->slice_type != V4L2_H264_SLICE_TYPE_I &&
+	    encode->slice_type != V4L2_H264_SLICE_TYPE_SI) {
+		/* Ref pic list modification is not supported. */
+		ret = v4l2_h264_enc_rbsp_bit(rbsp,
+					     ref_pic_list_modification_flag_l0);
+		if (ret)
+			return ret;
+	}
+
+	if (encode->slice_type == V4L2_H264_SLICE_TYPE_B) {
+		/* Ref pic list modification is not supported. */
+		ret = v4l2_h264_enc_rbsp_bit(rbsp,
+					     ref_pic_list_modification_flag_l1);
+		if (ret)
+			return ret;
+	}
+
+	/* Prediction weights are not supported. */
+	if (V4L2_H264_CTRL_PRED_WEIGHTS_REQUIRED(pps, encode))
+		return -EINVAL;
+
+	if (encode->nal_ref_idc) {
+		if (encode->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC) {
+			ret = v4l2_h264_enc_rbsp_flag(rbsp, encode->flags,
+						      V4L2_H264_ENCODE_FLAG_NO_OUTPUT_OF_PRIOR_PICS);
+			if (ret)
+				return ret;
+
+			ret = v4l2_h264_enc_rbsp_flag(rbsp, encode->flags,
+						      V4L2_H264_ENCODE_FLAG_LONG_TERM_REFERENCE);
+			if (ret)
+				return ret;
+		} else {
+			/* Adaptive ref pic marking mode is not supported. */
+			ret = v4l2_h264_enc_rbsp_bit(rbsp,
+						     adaptive_ref_pic_marking_mode_flag);
+			if (ret)
+				return ret;
+		}
+	}
+
+	if (pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE &&
+	    encode->slice_type != V4L2_H264_SLICE_TYPE_I &&
+	    encode->slice_type != V4L2_H264_SLICE_TYPE_SI) {
+		ret = v4l2_h264_enc_rbsp_ue(rbsp, encode->cabac_init_idc);
+		if (ret)
+			return ret;
+	}
+
+	ret = v4l2_h264_enc_rbsp_se(rbsp, encode->slice_qp_delta);
+	if (ret)
+		return ret;
+
+	if (encode->slice_type == V4L2_H264_SLICE_TYPE_SP) {
+		/* Switching slices are not supported. */
+		ret = v4l2_h264_enc_rbsp_bit(rbsp, sp_for_switch_flag);
+		if (ret)
+			return ret;
+	}
+
+	if (encode->slice_type == V4L2_H264_SLICE_TYPE_SP ||
+	    encode->slice_type == V4L2_H264_SLICE_TYPE_SI) {
+		ret = v4l2_h264_enc_rbsp_se(rbsp, slice_qs_delta);
+		if (ret)
+			return ret;
+	}
+
+	if (pps->flags & V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT) {
+		ret = v4l2_h264_enc_rbsp_ue(rbsp,
+					    encode->disable_deblocking_filter_idc);
+		if (ret)
+			return ret;
+
+		if (encode->disable_deblocking_filter_idc != 1) {
+			ret = v4l2_h264_enc_rbsp_se(rbsp,
+						    encode->slice_alpha_c0_offset_div2);
+			if (ret)
+				return ret;
+
+			ret = v4l2_h264_enc_rbsp_se(rbsp,
+						    encode->slice_beta_offset_div2);
+			if (ret)
+				return ret;
+		}
+	}
+
+	/* The slice NALU is not finished, the hardware has to write the rest! */
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_rbsp_slice_header);
+
+MODULE_DESCRIPTION("V4L2 H.264 Encode RBSP");
+MODULE_AUTHOR("Paul Kocialkowski <paulk@sys-base.io>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/v4l2-core/v4l2-h264-enc.c b/drivers/media/v4l2-core/v4l2-h264-enc.c
index d4e1450691fb..0b46922d1d7a 100644
--- a/drivers/media/v4l2-core/v4l2-h264-enc.c
+++ b/drivers/media/v4l2-core/v4l2-h264-enc.c
@@ -9,10 +9,12 @@
 #include <linux/v4l2-controls.h>
 #include <media/v4l2-h264.h>
 #include <media/v4l2-h264-enc.h>
+#include <media/v4l2-h264-enc-rbsp.h>
 #include <media/videobuf2-v4l2.h>
 
 int v4l2_h264_enc_init(struct v4l2_h264_enc *enc)
 {
+	struct v4l2_h264_enc_rbsp *rbsp = &enc->rbsp;
 	int ret;
 
 	if ((!enc->format && !enc->format_mplane) || !enc->timeperframe ||
@@ -23,6 +25,9 @@ int v4l2_h264_enc_init(struct v4l2_h264_enc *enc)
 	memset(&enc->state_next, 0, sizeof(enc->state_next));
 	enc->state_serial = 0;
 
+	rbsp->ops = enc->rbsp_ops;
+	rbsp->private_data = enc->private_data;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_h264_enc_init);
@@ -520,6 +525,146 @@ static int state_complete(struct v4l2_h264_enc *enc,
 	return 0;
 }
 
+static int rbsp_update(struct v4l2_h264_enc *enc)
+{
+	struct v4l2_h264_enc_state *state = &enc->state_next;
+	struct v4l2_h264_enc_state *state_active = &enc->state_active;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+	struct v4l2_ctrl_handler *handler = enc->ctrl_handler;
+	struct v4l2_ctrl *ctrl;
+
+	enc->rbsp_update = 0;
+
+	/* Start Code */
+
+	ctrl = v4l2_ctrl_find(handler, V4L2_CID_STATELESS_H264_START_CODE);
+	if ((ctrl && ctrl->cur.val == V4L2_STATELESS_H264_START_CODE_ANNEX_B) ||
+	    !ctrl)
+		enc->rbsp_update |= V4L2_H264_ENC_RBSP_UPDATE_START_CODE;
+
+	/* AUD */
+
+	ctrl = v4l2_ctrl_find(handler, V4L2_CID_MPEG_VIDEO_AU_DELIMITER);
+	if (ctrl && ctrl->cur.val)
+		enc->rbsp_update |= V4L2_H264_ENC_RBSP_UPDATE_AUD;
+
+	/* SPS */
+
+	if (!enc->state_serial) {
+		if (memcmp(&state_active->sps, &state->sps,
+			   sizeof(state_active->sps)) ||
+		    memcmp(&state_active->sps_video, &state->sps_video,
+			   sizeof(state_active->sps_video)))
+			enc->rbsp_update |= V4L2_H264_ENC_RBSP_UPDATE_SPS;
+	} else {
+		enc->rbsp_update |= V4L2_H264_ENC_RBSP_UPDATE_SPS;
+	}
+
+	/* PPS */
+
+	if (!enc->state_serial) {
+		if (memcmp(&state_active->pps, &state->pps,
+			   sizeof(state_active->pps)))
+			enc->rbsp_update |= V4L2_H264_ENC_RBSP_UPDATE_PPS;
+	} else {
+		enc->rbsp_update |= V4L2_H264_ENC_RBSP_UPDATE_PPS;
+	}
+
+	/* IDR Prepend */
+
+	ctrl = v4l2_ctrl_find(handler,
+			      V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR);
+	if (ctrl && ctrl->cur.val &&
+	    encode->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC)
+		enc->rbsp_update |= V4L2_H264_ENC_RBSP_UPDATE_SPS |
+				    V4L2_H264_ENC_RBSP_UPDATE_PPS;
+
+	/* Slice */
+
+	enc->rbsp_update |= V4L2_H264_ENC_RBSP_UPDATE_SLICE_HEADER;
+
+	return 0;
+}
+
+static int rbsp_step_unit(struct v4l2_h264_enc *enc,
+			      unsigned int rbsp_update, unsigned int hw_flag)
+{
+	struct v4l2_h264_enc_state *state = &enc->state_active;
+	struct v4l2_ctrl_h264_sps *sps = &state->sps;
+	struct v4l2_h264_sps_video *sps_video = &state->sps_video;
+	struct v4l2_ctrl_h264_pps *pps = &state->pps;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+	struct v4l2_h264_enc_rbsp *rbsp = &enc->rbsp;
+	u8 primary_pic_type;
+	int ret;
+
+	/* Return if no update is needed or if hardware generates the unit. */
+	if (!(enc->rbsp_update & rbsp_update) || enc->flags & hw_flag)
+		return 0;
+
+	if (enc->rbsp_update & V4L2_H264_ENC_RBSP_UPDATE_START_CODE) {
+		ret = v4l2_h264_enc_rbsp_start_code(rbsp);
+		if (ret)
+			return ret;
+	}
+
+	if (rbsp_update == V4L2_H264_ENC_RBSP_UPDATE_AUD) {
+		if (enc->flags & V4L2_H264_ENC_FLAG_INTER_BIPRED &&
+		    enc->flags & V4L2_H264_ENC_FLAG_INTER_PRED)
+			primary_pic_type = V4L2_H264_PRIMARY_PIC_TYPE_IPB;
+		else if (enc->flags & V4L2_H264_ENC_FLAG_INTER_PRED)
+			primary_pic_type = V4L2_H264_PRIMARY_PIC_TYPE_IP;
+		else
+			primary_pic_type = V4L2_H264_PRIMARY_PIC_TYPE_I;
+	}
+
+	if (rbsp_update == V4L2_H264_ENC_RBSP_UPDATE_AUD)
+		return v4l2_h264_enc_rbsp_aud(rbsp, primary_pic_type);
+	else if (rbsp_update == V4L2_H264_ENC_RBSP_UPDATE_SPS)
+		return v4l2_h264_enc_rbsp_sps(rbsp, sps, sps_video);
+	else if (rbsp_update == V4L2_H264_ENC_RBSP_UPDATE_PPS)
+		return v4l2_h264_enc_rbsp_pps(rbsp, pps);
+	else if (rbsp_update == V4L2_H264_ENC_RBSP_UPDATE_SLICE_HEADER)
+		return v4l2_h264_enc_rbsp_slice_header(rbsp, sps, pps, encode);
+
+	return -EINVAL;
+}
+
+static int rbsp_step(struct v4l2_h264_enc *enc,
+			 struct vb2_v4l2_buffer *buffer)
+{
+	struct v4l2_h264_enc_rbsp *rbsp = &enc->rbsp;
+	void *pointer = vb2_plane_vaddr(&buffer->vb2_buf, 0);
+	unsigned int size = vb2_plane_size(&buffer->vb2_buf, 0);
+	int ret;
+
+	ret = v4l2_h264_enc_rbsp_init(rbsp, pointer, size);
+	if (ret)
+		return ret;
+
+	ret = rbsp_step_unit(enc, V4L2_H264_ENC_RBSP_UPDATE_AUD,
+			     V4L2_H264_ENC_FLAG_HW_AUD);
+	if (ret)
+		return ret;
+
+	ret = rbsp_step_unit(enc, V4L2_H264_ENC_RBSP_UPDATE_SPS,
+			     V4L2_H264_ENC_FLAG_HW_SPS);
+	if (ret)
+		return ret;
+
+	ret = rbsp_step_unit(enc, V4L2_H264_ENC_RBSP_UPDATE_PPS,
+			     V4L2_H264_ENC_FLAG_HW_PPS);
+	if (ret)
+		return ret;
+
+	ret = rbsp_step_unit(enc, V4L2_H264_ENC_RBSP_UPDATE_SLICE_HEADER,
+			     V4L2_H264_ENC_FLAG_HW_SLICE_HEADER);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 int v4l2_h264_enc_step(struct v4l2_h264_enc *enc,
 		       struct vb2_v4l2_buffer *buffer)
 {
@@ -529,10 +674,18 @@ int v4l2_h264_enc_step(struct v4l2_h264_enc *enc,
 	if (ret)
 		return ret;
 
+	ret = rbsp_update(enc);
+	if (ret)
+		return ret;
+
 	ret = state_commit(enc);
 	if (ret)
 		return ret;
 
+	ret = rbsp_step(enc, buffer);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_h264_enc_step);
diff --git a/include/media/v4l2-h264-enc-rbsp.h b/include/media/v4l2-h264-enc-rbsp.h
new file mode 100644
index 000000000000..2ce9b4051436
--- /dev/null
+++ b/include/media/v4l2-h264-enc-rbsp.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * V4L2 H.264 Encode RBSP
+ *
+ * Copyright (C) 2025-2026 Paul Kocialkowski <paulk@sys-base.io>
+ */
+
+#ifndef _MEDIA_V4L2_H264_ENC_RBSP_H
+#define _MEDIA_V4L2_H264_ENC_RBSP_H
+
+#include <linux/v4l2-controls.h>
+#include <media/v4l2-h264.h>
+
+#define V4L2_H264_ENC_RBSP_EPTB		0x3
+
+#define V4L2_H264_ENC_RBSP_UPDATE_START_CODE	0x1
+#define V4L2_H264_ENC_RBSP_UPDATE_AUD		0x2
+#define V4L2_H264_ENC_RBSP_UPDATE_SPS		0x4
+#define V4L2_H264_ENC_RBSP_UPDATE_PPS		0x8
+#define V4L2_H264_ENC_RBSP_UPDATE_SLICE_HEADER	0x10
+
+#define v4l2_h264_enc_rbsp_op(r, o, a...) \
+	({ \
+		int ret; \
+		if ((r)->ops && (r)->ops->o) \
+			ret = (r)->ops->o(r, ##a); \
+		else \
+			ret = -EOPNOTSUPP; \
+		ret; \
+	})
+
+struct v4l2_h264_enc_rbsp;
+
+struct v4l2_h264_enc_rbsp_ops {
+	int (*bits_raw)(struct v4l2_h264_enc_rbsp *rbsp, u32 value,
+			unsigned char bits_count);
+	int (*bits)(struct v4l2_h264_enc_rbsp *rbsp, u32 value,
+		    unsigned char bits_count);
+	int (*ue)(struct v4l2_h264_enc_rbsp *rbsp, u32 value);
+	int (*se)(struct v4l2_h264_enc_rbsp *rbsp, s32 value);
+	int (*align)(struct v4l2_h264_enc_rbsp *rbsp);
+};
+
+struct v4l2_h264_enc_rbsp {
+	const struct v4l2_h264_enc_rbsp_ops *ops;
+	void *private_data;
+
+	u8 *pointer;
+	unsigned int size;
+	unsigned char bit_offset;
+	unsigned int bits_count;
+	unsigned int zero_count;
+};
+
+int v4l2_h264_enc_rbsp_init(struct v4l2_h264_enc_rbsp *rbsp, u8 *pointer,
+			    unsigned int size);
+unsigned int v4l2_h264_enc_rbsp_bits_count(struct v4l2_h264_enc_rbsp *rbsp);
+unsigned int v4l2_h264_enc_rbsp_bytes_count(struct v4l2_h264_enc_rbsp *rbsp);
+int v4l2_h264_enc_rbsp_start_code(struct v4l2_h264_enc_rbsp *rbsp);
+int v4l2_h264_enc_rbsp_aud(struct v4l2_h264_enc_rbsp *rbsp,
+			   u8 primary_pic_type);
+int v4l2_h264_enc_rbsp_sps(struct v4l2_h264_enc_rbsp *rbsp,
+			   const struct v4l2_ctrl_h264_sps *sps,
+			   const struct v4l2_h264_sps_video *sps_video);
+int v4l2_h264_enc_rbsp_pps(struct v4l2_h264_enc_rbsp *rbsp,
+			   const struct v4l2_ctrl_h264_pps *pps);
+int v4l2_h264_enc_rbsp_slice_header(struct v4l2_h264_enc_rbsp *rbsp,
+				    const struct v4l2_ctrl_h264_sps *sps,
+				    const struct v4l2_ctrl_h264_pps *pps,
+				    const struct v4l2_ctrl_h264_encode_params *encode);
+
+#endif
diff --git a/include/media/v4l2-h264-enc.h b/include/media/v4l2-h264-enc.h
index 2978a73baacd..3d6b97408707 100644
--- a/include/media/v4l2-h264-enc.h
+++ b/include/media/v4l2-h264-enc.h
@@ -10,6 +10,7 @@
 
 #include <linux/v4l2-controls.h>
 #include <linux/videodev2.h>
+#include <media/v4l2-h264-enc-rbsp.h>
 #include <media/videobuf2-v4l2.h>
 
 #define V4L2_H264_ENC_MB_UNIT	16
@@ -55,6 +56,7 @@ struct v4l2_h264_enc_ops {
 
 struct v4l2_h264_enc {
 	const struct v4l2_h264_enc_ops *ops;
+	const struct v4l2_h264_enc_rbsp_ops *rbsp_ops;
 	void *private_data;
 
 	struct v4l2_pix_format *format;
@@ -66,6 +68,9 @@ struct v4l2_h264_enc {
 	struct v4l2_h264_enc_state state_next;
 	unsigned int state_serial;
 
+	struct v4l2_h264_enc_rbsp rbsp;
+	unsigned int rbsp_update;
+
 	unsigned int flags;
 };
 
-- 
2.53.0


