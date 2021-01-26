Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F757304CD0
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 23:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730837AbhAZWzo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:55:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392800AbhAZT10 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 14:27:26 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD04C061786
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 11:26:45 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id 63so17372881oty.0
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 11:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension-cc.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MFO250FXcGjZ8laGCmwfomUupX/vycC5X5Fq/iVr4D8=;
        b=vlR0T8b9Nm3IzRaZSd+ENrfyU/wzXCI6zaT0t3TuLz5KwVXb1e7HmtsvQhrFlILSWv
         108U35AHuxVYK3hjXKL1S860OIlxMss37F8PTm9Mb+lE6h5Vzq8JR3Iy0P7Oi8sgQnSo
         0dGmqqU3TA+Zk/b41wayRCbFWqa3BIz5QK4uhb2MECRRJML+RYaPywuGpZMioPX6a8uM
         XokCnem+ln0HAwiC+9xYfiDoUnl6ljWwGJU5QvQVX61RhTf2/3hrqBbJwU+MtCC0jHxr
         Rhemqc3QbyqIV4prYRUGri1yf++WJVF2bzgHuIsW1gIQ1qifOWt1rKM8QiXcEUU4jCPI
         3sRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MFO250FXcGjZ8laGCmwfomUupX/vycC5X5Fq/iVr4D8=;
        b=hrQvwJirhsfqMsfdlVP4bIs98kKVfTvrivXAoHr4zpdgIV34FMNogAXQWhoSoxixIr
         xP9OkElMnMadz607tjsS3vLgsu28N2uI9nvUMtTl5tKGy3Jn5s0ftyOVMPHFIPOCVIFM
         yIXR1FZ7KPUQdO8Jzr1qNi4FTB5+W8ClQi+bq/8QQLSXYcLhWSPhjWkqd/MIKqdlVqHg
         7yNF8hpojpBTkyY4Ludhr116WaUvcVkvvNHxEIdvPYIRrXHKhYLUVDfW4krPRjmghveK
         +p7wuCm6vFgaVLPtL544zG84RAhkEnwVLUEI18QMR75hv+QCvaoH7AVVvee4iG3SfXWV
         9AMg==
X-Gm-Message-State: AOAM530JqmJmdo1lAvFEe4gb7vChjBhEM5/Kv2E6nZa3aTvM56+V0GmW
        JW8ghdUJEqs3wBxD0JsTtZQqbBkRpt1hx9WG
X-Google-Smtp-Source: ABdhPJzXwJx5oUJS4F9S/vYOkJLaBKLKL2+MxHgXeQKIsGvHCUZ6c/q8pJDgSx/b6R1QaTs7cowPXg==
X-Received: by 2002:a9d:19c9:: with SMTP id k67mr5073993otk.292.1611689203415;
        Tue, 26 Jan 2021 11:26:43 -0800 (PST)
Received: from localhost (66-90-181-52.dyn.grandenetworks.net. [66.90.181.52])
        by smtp.gmail.com with ESMTPSA id i24sm123921oor.1.2021.01.26.11.26.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jan 2021 11:26:43 -0800 (PST)
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org, sean@mess.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH 1/4] mxl692: MaxLinear 692 ATSC demod/tuner driver
Date:   Mon, 25 Jan 2021 19:54:13 -0600
Message-Id: <20210126015416.5622-2-brad@nextdimension.cc>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210126015416.5622-1-brad@nextdimension.cc>
References: <20200612183937.10952-1-3126054018@nextdimension.cc>
 <20210126015416.5622-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MaxLinear 692 is a combo demod/tuner which has ATSC and QAM
capabilities. Only ATSC is currently advertised via DVB
properties. QAM still has issues.

Confirmed working on both big and little endian. Big
endian verified on PowerPC Mac mini.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
Since v1:
- Rework all endianess related code
- Fix big endian issues
- Fix messy casts
- Optimize checksum calc
- Address all sparse issues
- Use memcmp instead of byte comparison
- Remove commented relics

 drivers/media/dvb-frontends/Kconfig       |    9 +
 drivers/media/dvb-frontends/Makefile      |    1 +
 drivers/media/dvb-frontends/mxl692.c      | 1378 +++++++++++++++++++++
 drivers/media/dvb-frontends/mxl692.h      |   38 +
 drivers/media/dvb-frontends/mxl692_defs.h |  548 ++++++++
 5 files changed, 1974 insertions(+)
 create mode 100644 drivers/media/dvb-frontends/mxl692.c
 create mode 100644 drivers/media/dvb-frontends/mxl692.h
 create mode 100644 drivers/media/dvb-frontends/mxl692_defs.h

diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
index 643b851a6b60..b1ded2137f0e 100644
--- a/drivers/media/dvb-frontends/Kconfig
+++ b/drivers/media/dvb-frontends/Kconfig
@@ -708,6 +708,15 @@ config DVB_S5H1411
 	  An ATSC 8VSB and QAM64/256 tuner module. Say Y when you want
 	  to support this frontend.
 
+config DVB_MXL692
+	tristate "MaxLinear MXL692 based"
+	depends on DVB_CORE && I2C
+	default m if !MEDIA_SUBDRV_AUTOSELECT
+	help
+	  MaxLinear MxL692 is a combo tuner-demodulator that
+	  supports ATSC 8VSB and QAM modes. Say Y when you want to
+	  support this frontend.
+
 comment "ISDB-T (terrestrial) frontends"
 	depends on DVB_CORE
 
diff --git a/drivers/media/dvb-frontends/Makefile b/drivers/media/dvb-frontends/Makefile
index e9179162658c..b9f47d68e14e 100644
--- a/drivers/media/dvb-frontends/Makefile
+++ b/drivers/media/dvb-frontends/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_DVB_S5H1420) += s5h1420.o
 obj-$(CONFIG_DVB_LGDT330X) += lgdt330x.o
 obj-$(CONFIG_DVB_LGDT3305) += lgdt3305.o
 obj-$(CONFIG_DVB_LGDT3306A) += lgdt3306a.o
+obj-$(CONFIG_DVB_MXL692) += mxl692.o
 obj-$(CONFIG_DVB_LG2160) += lg2160.o
 obj-$(CONFIG_DVB_CX24123) += cx24123.o
 obj-$(CONFIG_DVB_LNBH25) += lnbh25.o
diff --git a/drivers/media/dvb-frontends/mxl692.c b/drivers/media/dvb-frontends/mxl692.c
new file mode 100644
index 000000000000..86af831c0176
--- /dev/null
+++ b/drivers/media/dvb-frontends/mxl692.c
@@ -0,0 +1,1378 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the MaxLinear MxL69x family of combo tuners/demods
+ *
+ * Copyright (C) 2020 Brad Love <brad@nextdimension.cc>
+ *
+ * based on code:
+ * Copyright (c) 2016 MaxLinear, Inc. All rights reserved
+ * which was released under GPL V2
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/mutex.h>
+#include <linux/i2c-mux.h>
+#include <linux/string.h>
+#include <linux/firmware.h>
+
+#include "mxl692.h"
+#include "mxl692_defs.h"
+
+static const struct dvb_frontend_ops mxl692_ops;
+
+struct mxl692_dev {
+	struct dvb_frontend fe;
+	struct i2c_client *i2c_client;
+	struct mutex i2c_lock;		/* i2c command mutex */
+	enum MXL_EAGLE_DEMOD_TYPE_E demod_type;
+	enum MXL_EAGLE_POWER_MODE_E power_mode;
+	u32 current_frequency;
+	int device_type;
+	int seqnum;
+	int init_done;
+};
+
+static int mxl692_i2c_write(struct mxl692_dev *dev, u8 *buffer, u16 buf_len)
+{
+	int ret = 0;
+	struct i2c_msg msg = {
+		.addr = dev->i2c_client->addr,
+		.flags = 0,
+		.buf = buffer,
+		.len = buf_len
+	};
+
+	ret = i2c_transfer(dev->i2c_client->adapter, &msg, 1);
+	if (ret != 1)
+		dev_dbg(&dev->i2c_client->dev, "i2c write error!\n");
+
+	return ret;
+}
+
+static int mxl692_i2c_read(struct mxl692_dev *dev, u8 *buffer, u16 buf_len)
+{
+	int ret = 0;
+	struct i2c_msg msg = {
+		.addr = dev->i2c_client->addr,
+		.flags = I2C_M_RD,
+		.buf = buffer,
+		.len = buf_len
+	};
+
+	ret = i2c_transfer(dev->i2c_client->adapter, &msg, 1);
+	if (ret != 1)
+		dev_dbg(&dev->i2c_client->dev, "i2c read error!\n");
+
+	return ret;
+}
+
+static int convert_endian(u32 size, u8 *d)
+{
+	u32 i;
+
+	for (i = 0; i < (size & ~3); i += 4) {
+		d[i + 0] ^= d[i + 3];
+		d[i + 3] ^= d[i + 0];
+		d[i + 0] ^= d[i + 3];
+
+		d[i + 1] ^= d[i + 2];
+		d[i + 2] ^= d[i + 1];
+		d[i + 1] ^= d[i + 2];
+	}
+
+	switch (size & 3) {
+	case 0:
+	case 1:
+		/* do nothing */
+		break;
+	case 2:
+		d[i + 0] ^= d[i + 1];
+		d[i + 1] ^= d[i + 0];
+		d[i + 0] ^= d[i + 1];
+		break;
+
+	case 3:
+		d[i + 0] ^= d[i + 2];
+		d[i + 2] ^= d[i + 0];
+		d[i + 0] ^= d[i + 2];
+		break;
+	}
+	return size;
+}
+
+static int convert_endian_n(int n, u32 size, u8 *d)
+{
+	int i, count = 0;
+
+	for (i = 0; i < n; i += size)
+		count += convert_endian(size, d + i);
+	return count;
+}
+
+static void mxl692_tx_swap(enum MXL_EAGLE_OPCODE_E opcode, u8 *buffer)
+{
+#ifdef __BIG_ENDIAN
+	return;
+#endif
+	buffer += MXL_EAGLE_HOST_MSG_HEADER_SIZE; /* skip API header */
+
+	switch (opcode) {
+	case MXL_EAGLE_OPCODE_DEVICE_INTR_MASK_SET:
+	case MXL_EAGLE_OPCODE_TUNER_CHANNEL_TUNE_SET:
+	case MXL_EAGLE_OPCODE_SMA_TRANSMIT_SET:
+		buffer += convert_endian(sizeof(u32), buffer);
+		break;
+	case MXL_EAGLE_OPCODE_QAM_PARAMS_SET:
+		buffer += 5;
+		buffer += convert_endian(2 * sizeof(u32), buffer);
+		break;
+	default:
+		/* no swapping - all get opcodes */
+		/* ATSC/OOB no swapping */
+		break;
+	}
+}
+
+static void mxl692_rx_swap(enum MXL_EAGLE_OPCODE_E opcode, u8 *buffer)
+{
+#ifdef __BIG_ENDIAN
+	return;
+#endif
+	buffer += MXL_EAGLE_HOST_MSG_HEADER_SIZE; /* skip API header */
+
+	switch (opcode) {
+	case MXL_EAGLE_OPCODE_TUNER_AGC_STATUS_GET:
+		buffer++;
+		buffer += convert_endian(2 * sizeof(u16), buffer);
+		break;
+	case MXL_EAGLE_OPCODE_ATSC_STATUS_GET:
+		buffer += convert_endian_n(2, sizeof(u16), buffer);
+		buffer += convert_endian(sizeof(u32), buffer);
+		break;
+	case MXL_EAGLE_OPCODE_ATSC_ERROR_COUNTERS_GET:
+		buffer += convert_endian(3 * sizeof(u32), buffer);
+		break;
+	case MXL_EAGLE_OPCODE_ATSC_EQUALIZER_FILTER_FFE_TAPS_GET:
+		buffer += convert_endian_n(24, sizeof(u16), buffer);
+		break;
+	case MXL_EAGLE_OPCODE_QAM_STATUS_GET:
+		buffer += 8;
+		buffer += convert_endian_n(2, sizeof(u16), buffer);
+		buffer += convert_endian(sizeof(u32), buffer);
+		break;
+	case MXL_EAGLE_OPCODE_QAM_ERROR_COUNTERS_GET:
+		buffer += convert_endian(7 * sizeof(u32), buffer);
+		break;
+	case MXL_EAGLE_OPCODE_QAM_CONSTELLATION_VALUE_GET:
+	case MXL_EAGLE_OPCODE_QAM_EQUALIZER_FILTER_DFE_START_GET:
+	case MXL_EAGLE_OPCODE_QAM_EQUALIZER_FILTER_DFE_MIDDLE_GET:
+	case MXL_EAGLE_OPCODE_QAM_EQUALIZER_FILTER_DFE_END_GET:
+	case MXL_EAGLE_OPCODE_QAM_EQUALIZER_FILTER_SPUR_START_GET:
+		buffer += convert_endian_n(24, sizeof(u16), buffer);
+		break;
+	case MXL_EAGLE_OPCODE_QAM_EQUALIZER_FILTER_SPUR_END_GET:
+		buffer += convert_endian_n(8, sizeof(u16), buffer);
+		break;
+	case MXL_EAGLE_OPCODE_QAM_EQUALIZER_FILTER_FFE_GET:
+		buffer += convert_endian_n(17, sizeof(u16), buffer);
+		break;
+	case MXL_EAGLE_OPCODE_OOB_ERROR_COUNTERS_GET:
+		buffer += convert_endian(3 * sizeof(u32), buffer);
+		break;
+	case MXL_EAGLE_OPCODE_OOB_STATUS_GET:
+		buffer += convert_endian_n(2, sizeof(u16), buffer);
+		buffer += convert_endian(sizeof(u32), buffer);
+		break;
+	case MXL_EAGLE_OPCODE_SMA_RECEIVE_GET:
+		buffer += convert_endian(sizeof(u32), buffer);
+		break;
+	default:
+		/* no swapping - all set opcodes */
+		break;
+	}
+}
+
+static u32 mxl692_checksum(u8 *buffer, u32 size)
+{
+	u32 ix, div_size;
+	u32 cur_cksum = 0;
+	__be32 *buf;
+
+	div_size = DIV_ROUND_UP(size, 4);
+
+	buf = (__be32 *)buffer;
+	for (ix = 0; ix < div_size; ix++)
+		cur_cksum += be32_to_cpu(buf[ix]);
+
+	cur_cksum ^= 0xDEADBEEF;
+
+	return cur_cksum;
+}
+
+static int mxl692_validate_fw_header(struct mxl692_dev *dev,
+				     const u8 *buffer, u32 buf_len)
+{
+	int status = 0;
+	u32 ix, temp;
+	__be32 *local_buf = NULL;
+	u8 temp_cksum = 0;
+	const u8 fw_hdr[] = { 0x4D, 0x31, 0x10, 0x02, 0x40, 0x00, 0x00, 0x80 };
+
+	if (memcmp(buffer, fw_hdr, 8) != 0) {
+		status = -EINVAL;
+		goto err_finish;
+	}
+
+	local_buf = (__be32 *)(buffer + 8);
+	temp = be32_to_cpu(*local_buf);
+
+	if ((buf_len - 16) != temp >> 8) {
+		status = -EINVAL;
+		goto err_finish;
+	}
+
+	for (ix = 16; ix < buf_len; ix++)
+		temp_cksum += buffer[ix];
+
+	if (temp_cksum != buffer[11])
+		status = -EINVAL;
+
+err_finish:
+	if (status)
+		dev_dbg(&dev->i2c_client->dev, "failed\n");
+	return status;
+}
+
+static int mxl692_write_fw_block(struct mxl692_dev *dev, const u8 *buffer,
+				 u32 buf_len, u32 *index)
+{
+	int status = 0;
+	u32 ix = 0, total_len = 0, addr = 0, chunk_len = 0, prevchunk_len = 0;
+	u8 local_buf[MXL_EAGLE_MAX_I2C_PACKET_SIZE] = {}, *plocal_buf = NULL;
+	int payload_max = MXL_EAGLE_MAX_I2C_PACKET_SIZE - MXL_EAGLE_I2C_MHEADER_SIZE;
+
+	ix = *index;
+
+	if (buffer[ix] == 0x53) {
+		total_len = buffer[ix + 1] << 16 | buffer[ix + 2] << 8 | buffer[ix + 3];
+		total_len = (total_len + 3) & ~3;
+		addr      = buffer[ix + 4] << 24 | buffer[ix + 5] << 16 |
+			    buffer[ix + 6] << 8 | buffer[ix + 7];
+		ix       += MXL_EAGLE_FW_SEGMENT_HEADER_SIZE;
+
+		while ((total_len > 0) && (status == 0)) {
+			plocal_buf = local_buf;
+			chunk_len  = (total_len < payload_max) ? total_len : payload_max;
+
+			*plocal_buf++ = 0xFC;
+			*plocal_buf++ = chunk_len + sizeof(u32);
+
+			*(u32 *)plocal_buf = addr + prevchunk_len;
+#ifdef __BIG_ENDIAN
+			convert_endian(sizeof(u32), plocal_buf);
+#endif
+			plocal_buf += sizeof(u32);
+
+			memcpy(plocal_buf, &buffer[ix], chunk_len);
+			convert_endian(chunk_len, plocal_buf);
+			if (mxl692_i2c_write(dev, local_buf,
+					     (chunk_len + MXL_EAGLE_I2C_MHEADER_SIZE)) < 0) {
+				status = -EREMOTEIO;
+				break;
+			}
+
+			prevchunk_len += chunk_len;
+			total_len -= chunk_len;
+			ix += chunk_len;
+		}
+		*index = ix;
+	} else {
+		status = -EINVAL;
+	}
+
+	if (status)
+		dev_dbg(&dev->i2c_client->dev, "err %d\n", status);
+
+	return status;
+}
+
+static int mxl692_memwrite(struct mxl692_dev *dev, u32 addr,
+			   u8 *buffer, u32 size)
+{
+	int status = 0, total_len = 0;
+	u8 local_buf[MXL_EAGLE_MAX_I2C_PACKET_SIZE] = {}, *plocal_buf = NULL;
+
+	total_len = size;
+	total_len = (total_len + 3) & ~3;  /* 4 byte alignment */
+
+	if (total_len > (MXL_EAGLE_MAX_I2C_PACKET_SIZE - MXL_EAGLE_I2C_MHEADER_SIZE))
+		dev_dbg(&dev->i2c_client->dev, "hrmph?\n");
+
+	plocal_buf = local_buf;
+
+	*plocal_buf++ = 0xFC;
+	*plocal_buf++ = total_len + sizeof(u32);
+
+	*(u32 *)plocal_buf = addr;
+	plocal_buf += sizeof(u32);
+
+	memcpy(plocal_buf, buffer, total_len);
+#ifdef __BIG_ENDIAN
+	convert_endian(sizeof(u32) + total_len, local_buf + 2);
+#endif
+	if (mxl692_i2c_write(dev, local_buf,
+			     (total_len + MXL_EAGLE_I2C_MHEADER_SIZE)) < 0) {
+		status = -EREMOTEIO;
+		goto err_finish;
+	}
+
+	return status;
+err_finish:
+	dev_dbg(&dev->i2c_client->dev, "err %d\n", status);
+	return status;
+}
+
+static int mxl692_memread(struct mxl692_dev *dev, u32 addr,
+			  u8 *buffer, u32 size)
+{
+	int status = 0;
+	u8 local_buf[MXL_EAGLE_I2C_MHEADER_SIZE] = {}, *plocal_buf = NULL;
+
+	plocal_buf = local_buf;
+
+	*plocal_buf++ = 0xFB;
+	*plocal_buf++ = sizeof(u32);
+	*(u32 *)plocal_buf = addr;
+#ifdef __BIG_ENDIAN
+	convert_endian(sizeof(u32), plocal_buf);
+#endif
+	mutex_lock(&dev->i2c_lock);
+
+	if (mxl692_i2c_write(dev, local_buf, MXL_EAGLE_I2C_MHEADER_SIZE) > 0) {
+		size = (size + 3) & ~3;  /* 4 byte alignment */
+		status = mxl692_i2c_read(dev, buffer, (u16)size) < 0 ? -EREMOTEIO : 0;
+#ifdef __BIG_ENDIAN
+		if (status == 0)
+			convert_endian(size, buffer);
+#endif
+	} else {
+		status = -EREMOTEIO;
+	}
+
+	mutex_unlock(&dev->i2c_lock);
+
+	if (status)
+		dev_dbg(&dev->i2c_client->dev, "err %d\n", status);
+
+	return status;
+}
+
+static const char *mxl692_opcode_string(u8 opcode)
+{
+	if (opcode >= 0 && opcode <= MXL_EAGLE_OPCODE_INTERNAL)
+		return MXL_EAGLE_OPCODE_STRING[opcode];
+
+	return "invalid opcode";
+}
+
+static int mxl692_opwrite(struct mxl692_dev *dev, u8 *buffer,
+			  u32 size)
+{
+	int status = 0, total_len = 0;
+	u8 local_buf[MXL_EAGLE_MAX_I2C_PACKET_SIZE] = {}, *plocal_buf = NULL;
+	struct MXL_EAGLE_HOST_MSG_HEADER_T *tx_hdr = (struct MXL_EAGLE_HOST_MSG_HEADER_T *)buffer;
+
+	total_len = size;
+	total_len = (total_len + 3) & ~3;  /* 4 byte alignment */
+
+	if (total_len > (MXL_EAGLE_MAX_I2C_PACKET_SIZE - MXL_EAGLE_I2C_PHEADER_SIZE))
+		dev_dbg(&dev->i2c_client->dev, "hrmph?\n");
+
+	plocal_buf = local_buf;
+
+	*plocal_buf++ = 0xFE;
+	*plocal_buf++ = (u8)total_len;
+
+	memcpy(plocal_buf, buffer, total_len);
+	convert_endian(total_len, plocal_buf);
+
+	if (mxl692_i2c_write(dev, local_buf,
+			     (total_len + MXL_EAGLE_I2C_PHEADER_SIZE)) < 0) {
+		status = -EREMOTEIO;
+		goto err_finish;
+	}
+err_finish:
+	if (status)
+		dev_dbg(&dev->i2c_client->dev, "opcode %s  err %d\n",
+			mxl692_opcode_string(tx_hdr->opcode), status);
+	return status;
+}
+
+static int mxl692_opread(struct mxl692_dev *dev, u8 *buffer,
+			 u32 size)
+{
+	int status = 0;
+	u32 ix = 0;
+	u8 local_buf[MXL_EAGLE_I2C_PHEADER_SIZE] = {};
+
+	local_buf[0] = 0xFD;
+	local_buf[1] = 0;
+
+	if (mxl692_i2c_write(dev, local_buf, MXL_EAGLE_I2C_PHEADER_SIZE) > 0) {
+		size = (size + 3) & ~3;  /* 4 byte alignment */
+
+		/* Read in 4 byte chunks */
+		for (ix = 0; ix < size; ix += 4) {
+			if (mxl692_i2c_read(dev, buffer + ix, 4) < 0) {
+				dev_dbg(&dev->i2c_client->dev, "ix=%d   size=%d\n", ix, size);
+				status = -EREMOTEIO;
+				goto err_finish;
+			}
+		}
+		convert_endian(size, buffer);
+	} else {
+		status = -EREMOTEIO;
+	}
+err_finish:
+	if (status)
+		dev_dbg(&dev->i2c_client->dev, "err %d\n", status);
+	return status;
+}
+
+static int mxl692_i2c_writeread(struct mxl692_dev *dev,
+				u8 opcode,
+				u8 *tx_payload,
+				u8 tx_payload_size,
+				u8 *rx_payload,
+				u8 rx_payload_expected)
+{
+	int status = 0, timeout = 40;
+	u8 tx_buf[MXL_EAGLE_MAX_I2C_PACKET_SIZE] = {};
+	u8 rx_buf[MXL_EAGLE_MAX_I2C_PACKET_SIZE] = {};
+	u32 resp_checksum = 0, resp_checksum_tmp = 0;
+	struct MXL_EAGLE_HOST_MSG_HEADER_T *tx_header;
+	struct MXL_EAGLE_HOST_MSG_HEADER_T *rx_header;
+
+	mutex_lock(&dev->i2c_lock);
+
+	if ((tx_payload_size + MXL_EAGLE_HOST_MSG_HEADER_SIZE) >
+	    (MXL_EAGLE_MAX_I2C_PACKET_SIZE - MXL_EAGLE_I2C_PHEADER_SIZE)) {
+		status = -EINVAL;
+		goto err_finish;
+	}
+
+	tx_header = (struct MXL_EAGLE_HOST_MSG_HEADER_T *)tx_buf;
+	tx_header->opcode = opcode;
+	tx_header->seqnum = dev->seqnum++;
+	tx_header->payload_size = tx_payload_size;
+	tx_header->checksum = 0;
+
+	if (dev->seqnum == 0)
+		dev->seqnum = 1;
+
+	if (tx_payload && tx_payload_size > 0)
+		memcpy(&tx_buf[MXL_EAGLE_HOST_MSG_HEADER_SIZE], tx_payload, tx_payload_size);
+
+	mxl692_tx_swap(opcode, tx_buf);
+
+	tx_header->checksum = 0;
+	tx_header->checksum = mxl692_checksum(tx_buf,
+					      MXL_EAGLE_HOST_MSG_HEADER_SIZE + tx_payload_size);
+#ifdef __LITTLE_ENDIAN
+	convert_endian(4, (u8 *)&tx_header->checksum); /* cksum is big endian */
+#endif
+	/* send Tx message */
+	status = mxl692_opwrite(dev, tx_buf,
+				tx_payload_size + MXL_EAGLE_HOST_MSG_HEADER_SIZE);
+	if (status) {
+		status = -EREMOTEIO;
+		goto err_finish;
+	}
+
+	/* receive Rx message (polling) */
+	rx_header = (struct MXL_EAGLE_HOST_MSG_HEADER_T *)rx_buf;
+
+	do {
+		status = mxl692_opread(dev, rx_buf,
+				       rx_payload_expected + MXL_EAGLE_HOST_MSG_HEADER_SIZE);
+		usleep_range(1000, 2000);
+		timeout--;
+	} while ((timeout > 0) && (status == 0) &&
+		 (rx_header->seqnum == 0) &&
+		 (rx_header->checksum == 0));
+
+	if (timeout == 0 || status) {
+		dev_dbg(&dev->i2c_client->dev, "timeout=%d   status=%d\n",
+			timeout, status);
+		status = -ETIMEDOUT;
+		goto err_finish;
+	}
+
+	if (rx_header->status) {
+		dev_dbg(&dev->i2c_client->dev, "rx header status code: %d\n", rx_header->status);
+		status = -EREMOTEIO;
+		goto err_finish;
+	}
+
+	if (rx_header->seqnum != tx_header->seqnum ||
+	    rx_header->opcode != tx_header->opcode ||
+	    rx_header->payload_size != rx_payload_expected) {
+		dev_dbg(&dev->i2c_client->dev, "Something failed seq=%s  opcode=%s  pSize=%s\n",
+			rx_header->seqnum != tx_header->seqnum ? "X" : "0",
+			rx_header->opcode != tx_header->opcode ? "X" : "0",
+			rx_header->payload_size != rx_payload_expected ? "X" : "0");
+		if (rx_header->payload_size != rx_payload_expected)
+			dev_dbg(&dev->i2c_client->dev,
+				"rx_header->payloadSize=%d   rx_payload_expected=%d\n",
+				rx_header->payload_size, rx_payload_expected);
+		status = -EREMOTEIO;
+		goto err_finish;
+	}
+
+	resp_checksum = rx_header->checksum;
+	rx_header->checksum = 0;
+
+	resp_checksum_tmp = mxl692_checksum(rx_buf,
+					    MXL_EAGLE_HOST_MSG_HEADER_SIZE + rx_header->payload_size);
+#ifdef __LITTLE_ENDIAN
+	convert_endian(4, (u8 *)&resp_checksum_tmp); /* cksum is big endian */
+#endif
+	if (resp_checksum != resp_checksum_tmp) {
+		dev_dbg(&dev->i2c_client->dev, "rx checksum failure\n");
+		status = -EREMOTEIO;
+		goto err_finish;
+	}
+
+	mxl692_rx_swap(rx_header->opcode, rx_buf);
+
+	if (rx_header->payload_size > 0) {
+		if (!rx_payload) {
+			dev_dbg(&dev->i2c_client->dev, "no rx payload?!?\n");
+			status = -EREMOTEIO;
+			goto err_finish;
+		}
+		memcpy(rx_payload, rx_buf + MXL_EAGLE_HOST_MSG_HEADER_SIZE,
+		       rx_header->payload_size);
+	}
+err_finish:
+	if (status)
+		dev_dbg(&dev->i2c_client->dev, "err %d\n", status);
+
+	mutex_unlock(&dev->i2c_lock);
+	return status;
+}
+
+static int mxl692_fwdownload(struct mxl692_dev *dev,
+			     const u8 *firmware_buf, u32 buf_len)
+{
+	int status = 0;
+	u32 ix, reg_val = 0x1;
+	u8 rx_buf[MXL_EAGLE_MAX_I2C_PACKET_SIZE] = {};
+	struct MXL_EAGLE_DEV_STATUS_T *dev_status;
+
+	if (buf_len < MXL_EAGLE_FW_HEADER_SIZE ||
+	    buf_len > MXL_EAGLE_FW_MAX_SIZE_IN_KB * 1000)
+		return -EINVAL;
+
+	mutex_lock(&dev->i2c_lock);
+
+	dev_dbg(&dev->i2c_client->dev, "\n");
+
+	status = mxl692_validate_fw_header(dev, firmware_buf, buf_len);
+	if (status)
+		goto err_finish;
+
+	ix = 16;
+	status = mxl692_write_fw_block(dev, firmware_buf, buf_len, &ix); /* DRAM */
+	if (status)
+		goto err_finish;
+
+	status = mxl692_write_fw_block(dev, firmware_buf, buf_len, &ix); /* IRAM */
+	if (status)
+		goto err_finish;
+
+	/* release CPU from reset */
+	status = mxl692_memwrite(dev, 0x70000018, (u8 *)&reg_val, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	mutex_unlock(&dev->i2c_lock);
+
+	if (status == 0) {
+		/* verify FW is alive */
+		usleep_range(MXL_EAGLE_FW_LOAD_TIME * 1000, (MXL_EAGLE_FW_LOAD_TIME + 5) * 1000);
+		dev_status = (struct MXL_EAGLE_DEV_STATUS_T *)&rx_buf;
+		status = mxl692_i2c_writeread(dev,
+					      MXL_EAGLE_OPCODE_DEVICE_STATUS_GET,
+					      NULL,
+					      0,
+					      (u8 *)dev_status,
+					      sizeof(struct MXL_EAGLE_DEV_STATUS_T));
+	}
+
+	return status;
+err_finish:
+	mutex_unlock(&dev->i2c_lock);
+	if (status)
+		dev_dbg(&dev->i2c_client->dev, "err %d\n", status);
+	return status;
+}
+
+static int mxl692_get_versions(struct mxl692_dev *dev)
+{
+	int status = 0;
+	struct MXL_EAGLE_DEV_VER_T dev_ver = {};
+	static const char * const chip_id[] = {"N/A", "691", "248", "692"};
+
+	status = mxl692_i2c_writeread(dev, MXL_EAGLE_OPCODE_DEVICE_VERSION_GET,
+				      NULL,
+				      0,
+				      (u8 *)&dev_ver,
+				      sizeof(struct MXL_EAGLE_DEV_VER_T));
+	if (status)
+		return status;
+
+	dev_info(&dev->i2c_client->dev, "MxL692_DEMOD Chip ID: %s\n",
+		 chip_id[dev_ver.chip_id]);
+
+	dev_info(&dev->i2c_client->dev,
+		 "MxL692_DEMOD FW Version: %d.%d.%d.%d_RC%d\n",
+		 dev_ver.firmware_ver[0],
+		 dev_ver.firmware_ver[1],
+		 dev_ver.firmware_ver[2],
+		 dev_ver.firmware_ver[3],
+		 dev_ver.firmware_ver[4]);
+
+	return status;
+}
+
+static int mxl692_reset(struct mxl692_dev *dev)
+{
+	int status = 0;
+	u32 dev_type = MXL_EAGLE_DEVICE_MAX, reg_val = 0x2;
+
+	dev_dbg(&dev->i2c_client->dev, "\n");
+
+	/* legacy i2c override */
+	status = mxl692_memwrite(dev, 0x80000100, (u8 *)&reg_val, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	/* verify sku */
+	status = mxl692_memread(dev, 0x70000188, (u8 *)&dev_type, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	if (dev_type != dev->device_type)
+		goto err_finish;
+
+err_finish:
+	if (status)
+		dev_dbg(&dev->i2c_client->dev, "err %d\n", status);
+	return status;
+}
+
+static int mxl692_config_regulators(struct mxl692_dev *dev,
+				    enum MXL_EAGLE_POWER_SUPPLY_SOURCE_E power_supply)
+{
+	int status = 0;
+	u32 reg_val;
+
+	dev_dbg(&dev->i2c_client->dev, "\n");
+
+	/* configure main regulator according to the power supply source */
+	status = mxl692_memread(dev, 0x90000000, (u8 *)&reg_val, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	reg_val &= 0x00FFFFFF;
+	reg_val |= (power_supply == MXL_EAGLE_POWER_SUPPLY_SOURCE_SINGLE) ?
+					0x14000000 : 0x10000000;
+
+	status = mxl692_memwrite(dev, 0x90000000, (u8 *)&reg_val, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	/* configure digital regulator to high current mode */
+	status = mxl692_memread(dev, 0x90000018, (u8 *)&reg_val, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	reg_val |= 0x800;
+
+	status = mxl692_memwrite(dev, 0x90000018, (u8 *)&reg_val, sizeof(u32));
+
+err_finish:
+	if (status)
+		dev_dbg(&dev->i2c_client->dev, "err %d\n", status);
+	return status;
+}
+
+static int mxl692_config_xtal(struct mxl692_dev *dev,
+			      struct MXL_EAGLE_DEV_XTAL_T *dev_xtal)
+{
+	int status = 0;
+	u32 reg_val, reg_val1;
+
+	dev_dbg(&dev->i2c_client->dev, "\n");
+
+	status = mxl692_memread(dev, 0x90000000, (u8 *)&reg_val, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	/* set XTAL capacitance */
+	reg_val &= 0xFFFFFFE0;
+	reg_val |= dev_xtal->xtal_cap;
+
+	/* set CLK OUT */
+	reg_val = dev_xtal->clk_out_enable ? (reg_val | 0x0100) : (reg_val & 0xFFFFFEFF);
+
+	status = mxl692_memwrite(dev, 0x90000000, (u8 *)&reg_val, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	/* set CLK OUT divider */
+	reg_val = dev_xtal->clk_out_div_enable ? (reg_val | 0x0200) : (reg_val & 0xFFFFFDFF);
+
+	status = mxl692_memwrite(dev, 0x90000000, (u8 *)&reg_val, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	/* set XTAL sharing */
+	reg_val = dev_xtal->xtal_sharing_enable ? (reg_val | 0x010400) : (reg_val & 0xFFFEFBFF);
+
+	status = mxl692_memwrite(dev, 0x90000000, (u8 *)&reg_val, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	/* enable/disable XTAL calibration, based on master/slave device */
+	status = mxl692_memread(dev, 0x90000030, (u8 *)&reg_val1, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	if (dev_xtal->xtal_calibration_enable) {
+		/* enable XTAL calibration and set XTAL amplitude to a higher value */
+		reg_val1 &= 0xFFFFFFFD;
+		reg_val1 |= 0x30;
+
+		status = mxl692_memwrite(dev, 0x90000030, (u8 *)&reg_val1, sizeof(u32));
+		if (status)
+			goto err_finish;
+	} else {
+		/* disable XTAL calibration */
+		reg_val1 |= 0x2;
+
+		status = mxl692_memwrite(dev, 0x90000030, (u8 *)&reg_val1, sizeof(u32));
+		if (status)
+			goto err_finish;
+
+		/* set XTAL bias value */
+		status = mxl692_memread(dev, 0x9000002c, (u8 *)&reg_val, sizeof(u32));
+		if (status)
+			goto err_finish;
+
+		reg_val &= 0xC0FFFFFF;
+		reg_val |= 0xA000000;
+
+		status = mxl692_memwrite(dev, 0x9000002c, (u8 *)&reg_val, sizeof(u32));
+		if (status)
+			goto err_finish;
+	}
+
+	/* start XTAL calibration */
+	status = mxl692_memread(dev, 0x70000010, (u8 *)&reg_val, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	reg_val |= 0x8;
+
+	status = mxl692_memwrite(dev, 0x70000010, (u8 *)&reg_val, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	status = mxl692_memread(dev, 0x70000018, (u8 *)&reg_val, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	reg_val |= 0x10;
+
+	status = mxl692_memwrite(dev, 0x70000018, (u8 *)&reg_val, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	status = mxl692_memread(dev, 0x9001014c, (u8 *)&reg_val, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	reg_val &= 0xFFFFEFFF;
+
+	status = mxl692_memwrite(dev, 0x9001014c, (u8 *)&reg_val, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	reg_val |= 0x1000;
+
+	status = mxl692_memwrite(dev, 0x9001014c, (u8 *)&reg_val, sizeof(u32));
+	if (status)
+		goto err_finish;
+
+	usleep_range(45000, 55000);
+
+err_finish:
+	if (status)
+		dev_dbg(&dev->i2c_client->dev, "err %d\n", status);
+	return status;
+}
+
+static int mxl692_powermode(struct mxl692_dev *dev,
+			    enum MXL_EAGLE_POWER_MODE_E power_mode)
+{
+	int status = 0;
+	u8 mode = power_mode;
+
+	dev_dbg(&dev->i2c_client->dev, "%s\n",
+		power_mode == MXL_EAGLE_POWER_MODE_SLEEP ? "sleep" : "active");
+
+	status = mxl692_i2c_writeread(dev,
+				      MXL_EAGLE_OPCODE_DEVICE_POWERMODE_SET,
+				      &mode,
+				      sizeof(u8),
+				      NULL,
+				      0);
+	if (status) {
+		dev_dbg(&dev->i2c_client->dev, "err %d\n", status);
+		return status;
+	}
+
+	dev->power_mode = power_mode;
+
+	return status;
+}
+
+static int mxl692_init(struct dvb_frontend *fe)
+{
+	struct mxl692_dev *dev = fe->demodulator_priv;
+	struct i2c_client *client = dev->i2c_client;
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	int status = 0;
+	const struct firmware *firmware;
+	struct MXL_EAGLE_DEV_XTAL_T xtal_config = {};
+
+	dev_dbg(&dev->i2c_client->dev, "\n");
+
+	if (dev->init_done)
+		goto warm;
+
+	dev->seqnum = 1;
+
+	status = mxl692_reset(dev);
+	if (status)
+		goto err;
+
+	usleep_range(50 * 1000, 60 * 1000); /* was 1000! */
+
+	status = mxl692_config_regulators(dev, MXL_EAGLE_POWER_SUPPLY_SOURCE_DUAL);
+	if (status)
+		goto err;
+
+	xtal_config.xtal_cap = 26;
+	xtal_config.clk_out_div_enable = 0;
+	xtal_config.clk_out_enable = 0;
+	xtal_config.xtal_calibration_enable = 0;
+	xtal_config.xtal_sharing_enable = 1;
+	status = mxl692_config_xtal(dev, &xtal_config);
+	if (status)
+		goto err;
+
+	status = request_firmware(&firmware, MXL692_FIRMWARE, &client->dev);
+	if (status) {
+		dev_dbg(&dev->i2c_client->dev, "firmware missing? %s\n",
+			MXL692_FIRMWARE);
+		goto err;
+	}
+
+	status = mxl692_fwdownload(dev, firmware->data, firmware->size);
+	if (status)
+		goto err_release_firmware;
+
+	release_firmware(firmware);
+
+	status = mxl692_get_versions(dev);
+	if (status)
+		goto err;
+
+	dev->power_mode = MXL_EAGLE_POWER_MODE_SLEEP;
+warm:
+	/* Config Device Power Mode */
+	if (dev->power_mode != MXL_EAGLE_POWER_MODE_ACTIVE) {
+		status = mxl692_powermode(dev, MXL_EAGLE_POWER_MODE_ACTIVE);
+		if (status)
+			goto err;
+
+		usleep_range(50 * 1000, 60 * 1000); /* was 500! */
+	}
+
+	/* Init stats here to indicate which stats are supported */
+	c->cnr.len = 1;
+	c->cnr.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
+	c->post_bit_error.len = 1;
+	c->post_bit_error.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
+	c->post_bit_count.len = 1;
+	c->post_bit_count.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
+	c->block_error.len = 1;
+	c->block_error.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
+
+	dev->init_done = 1;
+	return 0;
+err_release_firmware:
+	release_firmware(firmware);
+err:
+	dev_dbg(&dev->i2c_client->dev, "err %d\n", status);
+	return status;
+}
+
+static int mxl692_sleep(struct dvb_frontend *fe)
+{
+	struct mxl692_dev *dev = fe->demodulator_priv;
+
+	if (dev->power_mode != MXL_EAGLE_POWER_MODE_SLEEP)
+		mxl692_powermode(dev, MXL_EAGLE_POWER_MODE_SLEEP);
+
+	return 0;
+}
+
+static int mxl692_set_frontend(struct dvb_frontend *fe)
+{
+	struct dtv_frontend_properties *p = &fe->dtv_property_cache;
+	struct mxl692_dev *dev = fe->demodulator_priv;
+
+	int status = 0;
+	enum MXL_EAGLE_DEMOD_TYPE_E demod_type;
+	struct MXL_EAGLE_MPEGOUT_PARAMS_T mpeg_params = {};
+	enum MXL_EAGLE_QAM_DEMOD_ANNEX_TYPE_E qam_annex = MXL_EAGLE_QAM_DEMOD_ANNEX_B;
+	struct MXL_EAGLE_QAM_DEMOD_PARAMS_T qam_params = {};
+	struct MXL_EAGLE_TUNER_CHANNEL_PARAMS_T tuner_params = {};
+	u8 op_param = 0;
+
+	dev_dbg(&dev->i2c_client->dev, "\n");
+
+	switch (p->modulation) {
+	case VSB_8:
+		demod_type = MXL_EAGLE_DEMOD_TYPE_ATSC;
+		break;
+	case QAM_AUTO:
+	case QAM_64:
+	case QAM_128:
+	case QAM_256:
+		demod_type = MXL_EAGLE_DEMOD_TYPE_QAM;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (dev->current_frequency == p->frequency && dev->demod_type == demod_type) {
+		dev_dbg(&dev->i2c_client->dev, "already set up\n");
+		return 0;
+	}
+
+	dev->current_frequency = -1;
+	dev->demod_type = -1;
+
+	op_param = demod_type;
+	status = mxl692_i2c_writeread(dev,
+				      MXL_EAGLE_OPCODE_DEVICE_DEMODULATOR_TYPE_SET,
+				      &op_param,
+				      sizeof(u8),
+				      NULL,
+				      0);
+	if (status) {
+		dev_dbg(&dev->i2c_client->dev,
+			"DEVICE_DEMODULATOR_TYPE_SET...FAIL  err 0x%x\n", status);
+		goto err;
+	}
+
+	usleep_range(20 * 1000, 30 * 1000); /* was 500! */
+
+	mpeg_params.mpeg_parallel = 0;
+	mpeg_params.msb_first = MXL_EAGLE_DATA_SERIAL_MSB_1ST;
+	mpeg_params.mpeg_sync_pulse_width = MXL_EAGLE_DATA_SYNC_WIDTH_BIT;
+	mpeg_params.mpeg_valid_pol = MXL_EAGLE_CLOCK_POSITIVE;
+	mpeg_params.mpeg_sync_pol = MXL_EAGLE_CLOCK_POSITIVE;
+	mpeg_params.mpeg_clk_pol = MXL_EAGLE_CLOCK_NEGATIVE;
+	mpeg_params.mpeg3wire_mode_enable = 0;
+	mpeg_params.mpeg_clk_freq = MXL_EAGLE_MPEG_CLOCK_27MHZ;
+
+	switch (demod_type) {
+	case MXL_EAGLE_DEMOD_TYPE_ATSC:
+		status = mxl692_i2c_writeread(dev,
+					      MXL_EAGLE_OPCODE_DEVICE_MPEG_OUT_PARAMS_SET,
+					      (u8 *)&mpeg_params,
+					      sizeof(struct MXL_EAGLE_MPEGOUT_PARAMS_T),
+					      NULL,
+					      0);
+		if (status)
+			goto err;
+		break;
+	case MXL_EAGLE_DEMOD_TYPE_QAM:
+		if (qam_annex == MXL_EAGLE_QAM_DEMOD_ANNEX_A)
+			mpeg_params.msb_first = MXL_EAGLE_DATA_SERIAL_LSB_1ST;
+		status = mxl692_i2c_writeread(dev,
+					      MXL_EAGLE_OPCODE_DEVICE_MPEG_OUT_PARAMS_SET,
+					      (u8 *)&mpeg_params,
+					      sizeof(struct MXL_EAGLE_MPEGOUT_PARAMS_T),
+					      NULL,
+					      0);
+		if (status)
+			goto err;
+
+		qam_params.annex_type = qam_annex;
+		qam_params.qam_type = MXL_EAGLE_QAM_DEMOD_AUTO;
+		qam_params.iq_flip = MXL_EAGLE_DEMOD_IQ_AUTO;
+		if (p->modulation == QAM_64)
+			qam_params.symbol_rate_hz = 5057000;
+		else
+			qam_params.symbol_rate_hz = 5361000;
+
+		qam_params.symbol_rate_256qam_hz = 5361000;
+
+		status = mxl692_i2c_writeread(dev,
+					      MXL_EAGLE_OPCODE_QAM_PARAMS_SET,
+					      (u8 *)&qam_params,
+					      sizeof(struct MXL_EAGLE_QAM_DEMOD_PARAMS_T),
+					      NULL, 0);
+		if (status)
+			goto err;
+
+		break;
+	default:
+		break;
+	}
+
+	usleep_range(20 * 1000, 30 * 1000); /* was 500! */
+
+	tuner_params.freq_hz = p->frequency;
+	tuner_params.bandwidth = MXL_EAGLE_TUNER_BW_6MHZ;
+	tuner_params.tune_mode = MXL_EAGLE_TUNER_CHANNEL_TUNE_MODE_VIEW;
+
+	dev_dbg(&dev->i2c_client->dev, " Tuning Freq: %d %s\n", tuner_params.freq_hz,
+		demod_type == MXL_EAGLE_DEMOD_TYPE_ATSC ? "ATSC" : "QAM");
+
+	status = mxl692_i2c_writeread(dev,
+				      MXL_EAGLE_OPCODE_TUNER_CHANNEL_TUNE_SET,
+				      (u8 *)&tuner_params,
+				      sizeof(struct MXL_EAGLE_TUNER_CHANNEL_PARAMS_T),
+				      NULL,
+				      0);
+	if (status)
+		goto err;
+
+	usleep_range(20 * 1000, 30 * 1000); /* was 500! */
+
+	switch (demod_type) {
+	case MXL_EAGLE_DEMOD_TYPE_ATSC:
+		status = mxl692_i2c_writeread(dev,
+					      MXL_EAGLE_OPCODE_ATSC_INIT_SET,
+					      NULL, 0, NULL, 0);
+		if (status)
+			goto err;
+		break;
+	case MXL_EAGLE_DEMOD_TYPE_QAM:
+		status = mxl692_i2c_writeread(dev,
+					      MXL_EAGLE_OPCODE_QAM_RESTART_SET,
+					      NULL, 0, NULL, 0);
+		if (status)
+			goto err;
+		break;
+	default:
+		break;
+	}
+
+	dev->demod_type = demod_type;
+	dev->current_frequency = p->frequency;
+
+	return 0;
+err:
+	dev_dbg(&dev->i2c_client->dev, "err %d\n", status);
+	return status;
+}
+
+static int mxl692_get_frontend(struct dvb_frontend *fe,
+			       struct dtv_frontend_properties *p)
+{
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+
+	p->modulation = c->modulation;
+	p->frequency = c->frequency;
+
+	return 0;
+}
+
+static int mxl692_read_snr(struct dvb_frontend *fe, u16 *snr)
+{
+	struct mxl692_dev *dev = fe->demodulator_priv;
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	u8 rx_buf[MXL_EAGLE_MAX_I2C_PACKET_SIZE] = {};
+	struct MXL_EAGLE_ATSC_DEMOD_STATUS_T *atsc_status;
+	struct MXL_EAGLE_QAM_DEMOD_STATUS_T *qam_status;
+	enum MXL_EAGLE_DEMOD_TYPE_E demod_type = dev->demod_type;
+	int mxl_status = 0;
+
+	*snr = 0;
+
+	dev_dbg(&dev->i2c_client->dev, "\n");
+
+	atsc_status = (struct MXL_EAGLE_ATSC_DEMOD_STATUS_T *)&rx_buf;
+	qam_status = (struct MXL_EAGLE_QAM_DEMOD_STATUS_T *)&rx_buf;
+
+	switch (demod_type) {
+	case MXL_EAGLE_DEMOD_TYPE_ATSC:
+		mxl_status = mxl692_i2c_writeread(dev,
+						  MXL_EAGLE_OPCODE_ATSC_STATUS_GET,
+						  NULL,
+						  0,
+						  rx_buf,
+						  sizeof(struct MXL_EAGLE_ATSC_DEMOD_STATUS_T));
+		if (!mxl_status) {
+			*snr = (u16)(atsc_status->snr_db_tenths / 10);
+			c->cnr.stat[0].scale = FE_SCALE_DECIBEL;
+			c->cnr.stat[0].svalue = *snr;
+		}
+		break;
+	case MXL_EAGLE_DEMOD_TYPE_QAM:
+		mxl_status = mxl692_i2c_writeread(dev,
+						  MXL_EAGLE_OPCODE_QAM_STATUS_GET,
+						  NULL,
+						  0,
+						  rx_buf,
+						  sizeof(struct MXL_EAGLE_QAM_DEMOD_STATUS_T));
+		if (!mxl_status)
+			*snr = (u16)(qam_status->snr_db_tenths / 10);
+		break;
+	case MXL_EAGLE_DEMOD_TYPE_OOB:
+	default:
+		break;
+	}
+
+	if (mxl_status)
+		dev_dbg(&dev->i2c_client->dev, "err %d\n", mxl_status);
+	return mxl_status;
+}
+
+static int mxl692_read_ber_ucb(struct dvb_frontend *fe)
+{
+	struct mxl692_dev *dev = fe->demodulator_priv;
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	u8 rx_buf[MXL_EAGLE_MAX_I2C_PACKET_SIZE] = {};
+	struct MXL_EAGLE_ATSC_DEMOD_ERROR_COUNTERS_T *atsc_errors;
+	enum MXL_EAGLE_DEMOD_TYPE_E demod_type = dev->demod_type;
+	int mxl_status = 0;
+	u32 utmp;
+
+	dev_dbg(&dev->i2c_client->dev, "\n");
+
+	atsc_errors = (struct MXL_EAGLE_ATSC_DEMOD_ERROR_COUNTERS_T *)&rx_buf;
+
+	switch (demod_type) {
+	case MXL_EAGLE_DEMOD_TYPE_ATSC:
+		mxl_status = mxl692_i2c_writeread(dev,
+						  MXL_EAGLE_OPCODE_ATSC_ERROR_COUNTERS_GET,
+						  NULL,
+						  0,
+						  rx_buf,
+						  sizeof(struct MXL_EAGLE_ATSC_DEMOD_ERROR_COUNTERS_T));
+		if (!mxl_status) {
+			if (atsc_errors->error_packets == 0)
+				utmp = 0;
+			else
+				utmp = ((atsc_errors->error_bytes / atsc_errors->error_packets) *
+					atsc_errors->total_packets);
+			/* ber */
+			c->post_bit_error.stat[0].scale = FE_SCALE_COUNTER;
+			c->post_bit_error.stat[0].uvalue += atsc_errors->error_bytes;
+			c->post_bit_count.stat[0].scale = FE_SCALE_COUNTER;
+			c->post_bit_count.stat[0].uvalue += utmp;
+			/* ucb */
+			c->block_error.stat[0].scale = FE_SCALE_COUNTER;
+			c->block_error.stat[0].uvalue += atsc_errors->error_packets;
+
+			dev_dbg(&dev->i2c_client->dev, "%llu   %llu\n",
+				c->post_bit_count.stat[0].uvalue, c->block_error.stat[0].uvalue);
+		}
+		break;
+	case MXL_EAGLE_DEMOD_TYPE_QAM:
+	case MXL_EAGLE_DEMOD_TYPE_OOB:
+	default:
+		break;
+	}
+
+	if (mxl_status)
+		dev_dbg(&dev->i2c_client->dev, "err %d\n", mxl_status);
+
+	return mxl_status;
+}
+
+static int mxl692_read_status(struct dvb_frontend *fe,
+			      enum fe_status *status)
+{
+	struct mxl692_dev *dev = fe->demodulator_priv;
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	u8 rx_buf[MXL_EAGLE_MAX_I2C_PACKET_SIZE] = {};
+	struct MXL_EAGLE_ATSC_DEMOD_STATUS_T *atsc_status;
+	struct MXL_EAGLE_QAM_DEMOD_STATUS_T *qam_status;
+	enum MXL_EAGLE_DEMOD_TYPE_E demod_type = dev->demod_type;
+	int mxl_status = 0;
+	*status = 0;
+
+	dev_dbg(&dev->i2c_client->dev, "\n");
+
+	atsc_status = (struct MXL_EAGLE_ATSC_DEMOD_STATUS_T *)&rx_buf;
+	qam_status = (struct MXL_EAGLE_QAM_DEMOD_STATUS_T *)&rx_buf;
+
+	switch (demod_type) {
+	case MXL_EAGLE_DEMOD_TYPE_ATSC:
+		mxl_status = mxl692_i2c_writeread(dev,
+						  MXL_EAGLE_OPCODE_ATSC_STATUS_GET,
+						  NULL,
+						  0,
+						  rx_buf,
+						  sizeof(struct MXL_EAGLE_ATSC_DEMOD_STATUS_T));
+		if (!mxl_status && atsc_status->atsc_lock) {
+			*status |= FE_HAS_SIGNAL;
+			*status |= FE_HAS_CARRIER;
+			*status |= FE_HAS_VITERBI;
+			*status |= FE_HAS_SYNC;
+			*status |= FE_HAS_LOCK;
+
+			c->cnr.stat[0].scale = FE_SCALE_DECIBEL;
+			c->cnr.stat[0].svalue = atsc_status->snr_db_tenths / 10;
+		}
+		break;
+	case MXL_EAGLE_DEMOD_TYPE_QAM:
+		mxl_status = mxl692_i2c_writeread(dev,
+						  MXL_EAGLE_OPCODE_QAM_STATUS_GET,
+						  NULL,
+						  0,
+						  rx_buf,
+						  sizeof(struct MXL_EAGLE_QAM_DEMOD_STATUS_T));
+		if (!mxl_status && qam_status->qam_locked) {
+			*status |= FE_HAS_SIGNAL;
+			*status |= FE_HAS_CARRIER;
+			*status |= FE_HAS_VITERBI;
+			*status |= FE_HAS_SYNC;
+			*status |= FE_HAS_LOCK;
+
+			c->cnr.stat[0].scale = FE_SCALE_DECIBEL;
+			c->cnr.stat[0].svalue = qam_status->snr_db_tenths / 10;
+		}
+		break;
+	case MXL_EAGLE_DEMOD_TYPE_OOB:
+	default:
+		break;
+	}
+
+	if ((*status & FE_HAS_LOCK) == 0) {
+		/* No lock, reset all statistics */
+		c->cnr.len = 1;
+		c->cnr.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
+		c->block_error.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
+		c->post_bit_error.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
+		c->post_bit_count.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
+		return 0;
+	}
+
+	if (mxl_status)
+		dev_dbg(&dev->i2c_client->dev, "err %d\n", mxl_status);
+	else
+		mxl_status = mxl692_read_ber_ucb(fe);
+
+	return mxl_status;
+}
+
+static const struct dvb_frontend_ops mxl692_ops = {
+	.delsys = { SYS_ATSC },
+	.info = {
+		.name = "MaxLinear MxL692 VSB tuner-demodulator",
+		.frequency_min_hz      = 54000000,
+		.frequency_max_hz      = 858000000,
+		.frequency_stepsize_hz = 62500,
+		.caps = FE_CAN_8VSB
+	},
+
+	.init         = mxl692_init,
+	.sleep        = mxl692_sleep,
+	.set_frontend = mxl692_set_frontend,
+	.get_frontend = mxl692_get_frontend,
+
+	.read_status          = mxl692_read_status,
+	.read_snr             = mxl692_read_snr,
+};
+
+static int mxl692_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct mxl692_config *config = client->dev.platform_data;
+	struct mxl692_dev *dev;
+	int ret = 0;
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev) {
+		ret = -ENOMEM;
+		dev_dbg(&client->dev, "kzalloc() failed\n");
+		goto err;
+	}
+
+	memcpy(&dev->fe.ops, &mxl692_ops, sizeof(struct dvb_frontend_ops));
+	dev->fe.demodulator_priv = dev;
+	dev->i2c_client = client;
+	*config->fe = &dev->fe;
+	mutex_init(&dev->i2c_lock);
+	i2c_set_clientdata(client, dev);
+
+	dev_info(&client->dev, "MaxLinear mxl692 successfully attached\n");
+
+	return 0;
+err:
+	dev_dbg(&client->dev, "failed %d\n", ret);
+	return -ENODEV;
+}
+
+static int mxl692_remove(struct i2c_client *client)
+{
+	struct mxl692_dev *dev = i2c_get_clientdata(client);
+
+	dev->fe.demodulator_priv = NULL;
+	i2c_set_clientdata(client, NULL);
+	kfree(dev);
+
+	return 0;
+}
+
+static const struct i2c_device_id mxl692_id_table[] = {
+	{"mxl692", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, mxl692_id_table);
+
+static struct i2c_driver mxl692_driver = {
+	.driver = {
+		.name	= "mxl692",
+	},
+	.probe		= mxl692_probe,
+	.remove		= mxl692_remove,
+	.id_table	= mxl692_id_table,
+};
+
+module_i2c_driver(mxl692_driver);
+
+MODULE_AUTHOR("Brad Love <brad@nextdimension.cc>");
+MODULE_DESCRIPTION("MaxLinear MxL692 demodulator/tuner driver");
+MODULE_FIRMWARE(MXL692_FIRMWARE);
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/dvb-frontends/mxl692.h b/drivers/media/dvb-frontends/mxl692.h
new file mode 100644
index 000000000000..45bc48f1f12f
--- /dev/null
+++ b/drivers/media/dvb-frontends/mxl692.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Driver for the MaxLinear MxL69x family of tuners/demods
+ *
+ * Copyright (C) 2020 Brad Love <brad@nextdimension.cc>
+ *
+ * based on code:
+ * Copyright (c) 2016 MaxLinear, Inc. All rights reserved
+ * which was released under GPL V2
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _MXL692_H_
+#define _MXL692_H_
+
+#include <media/dvb_frontend.h>
+
+#define MXL692_FIRMWARE "dvb-demod-mxl692.fw"
+
+struct mxl692_config {
+	unsigned char  id;
+	u8 i2c_addr;
+	/*
+	 * frontend
+	 * returned by driver
+	 */
+	struct dvb_frontend **fe;
+};
+
+#endif /* _MXL692_H_ */
diff --git a/drivers/media/dvb-frontends/mxl692_defs.h b/drivers/media/dvb-frontends/mxl692_defs.h
new file mode 100644
index 000000000000..776ac407b4e7
--- /dev/null
+++ b/drivers/media/dvb-frontends/mxl692_defs.h
@@ -0,0 +1,548 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Driver for the MaxLinear MxL69x family of combo tuners/demods
+ *
+ * Copyright (C) 2020 Brad Love <brad@nextdimension.cc>
+ *
+ * based on code:
+ * Copyright (c) 2016 MaxLinear, Inc. All rights reserved
+ * which was released under GPL V2
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/*****************************************************************************
+ *	Defines
+ *****************************************************************************
+ */
+#define MXL_EAGLE_HOST_MSG_HEADER_SIZE  8
+#define MXL_EAGLE_FW_MAX_SIZE_IN_KB     76
+#define MXL_EAGLE_QAM_FFE_TAPS_LENGTH   16
+#define MXL_EAGLE_QAM_SPUR_TAPS_LENGTH  32
+#define MXL_EAGLE_QAM_DFE_TAPS_LENGTH   72
+#define MXL_EAGLE_ATSC_FFE_TAPS_LENGTH  4096
+#define MXL_EAGLE_ATSC_DFE_TAPS_LENGTH  384
+#define MXL_EAGLE_VERSION_SIZE          5     /* A.B.C.D-RCx */
+#define MXL_EAGLE_FW_LOAD_TIME          50
+
+#define MXL_EAGLE_FW_MAX_SIZE_IN_KB       76
+#define MXL_EAGLE_FW_HEADER_SIZE          16
+#define MXL_EAGLE_FW_SEGMENT_HEADER_SIZE  8
+#define MXL_EAGLE_MAX_I2C_PACKET_SIZE     58
+#define MXL_EAGLE_I2C_MHEADER_SIZE        6
+#define MXL_EAGLE_I2C_PHEADER_SIZE        2
+
+/* Enum of Eagle family devices */
+enum MXL_EAGLE_DEVICE_E {
+	MXL_EAGLE_DEVICE_691 = 1,    /* Device Mxl691 */
+	MXL_EAGLE_DEVICE_248 = 2,    /* Device Mxl248 */
+	MXL_EAGLE_DEVICE_692 = 3,    /* Device Mxl692 */
+	MXL_EAGLE_DEVICE_MAX,        /* No such device */
+};
+
+#define VER_A   1
+#define VER_B   1
+#define VER_C   1
+#define VER_D   3
+#define VER_E   6
+
+/* Enum of Host to Eagle I2C protocol opcodes */
+enum MXL_EAGLE_OPCODE_E {
+	/* DEVICE */
+	MXL_EAGLE_OPCODE_DEVICE_DEMODULATOR_TYPE_SET,
+	MXL_EAGLE_OPCODE_DEVICE_MPEG_OUT_PARAMS_SET,
+	MXL_EAGLE_OPCODE_DEVICE_POWERMODE_SET,
+	MXL_EAGLE_OPCODE_DEVICE_GPIO_DIRECTION_SET,
+	MXL_EAGLE_OPCODE_DEVICE_GPO_LEVEL_SET,
+	MXL_EAGLE_OPCODE_DEVICE_INTR_MASK_SET,
+	MXL_EAGLE_OPCODE_DEVICE_IO_MUX_SET,
+	MXL_EAGLE_OPCODE_DEVICE_VERSION_GET,
+	MXL_EAGLE_OPCODE_DEVICE_STATUS_GET,
+	MXL_EAGLE_OPCODE_DEVICE_GPI_LEVEL_GET,
+
+	/* TUNER */
+	MXL_EAGLE_OPCODE_TUNER_CHANNEL_TUNE_SET,
+	MXL_EAGLE_OPCODE_TUNER_LOCK_STATUS_GET,
+	MXL_EAGLE_OPCODE_TUNER_AGC_STATUS_GET,
+
+	/* ATSC */
+	MXL_EAGLE_OPCODE_ATSC_INIT_SET,
+	MXL_EAGLE_OPCODE_ATSC_ACQUIRE_CARRIER_SET,
+	MXL_EAGLE_OPCODE_ATSC_STATUS_GET,
+	MXL_EAGLE_OPCODE_ATSC_ERROR_COUNTERS_GET,
+	MXL_EAGLE_OPCODE_ATSC_EQUALIZER_FILTER_DFE_TAPS_GET,
+	MXL_EAGLE_OPCODE_ATSC_EQUALIZER_FILTER_FFE_TAPS_GET,
+
+	/* QAM */
+	MXL_EAGLE_OPCODE_QAM_PARAMS_SET,
+	MXL_EAGLE_OPCODE_QAM_RESTART_SET,
+	MXL_EAGLE_OPCODE_QAM_STATUS_GET,
+	MXL_EAGLE_OPCODE_QAM_ERROR_COUNTERS_GET,
+	MXL_EAGLE_OPCODE_QAM_CONSTELLATION_VALUE_GET,
+	MXL_EAGLE_OPCODE_QAM_EQUALIZER_FILTER_FFE_GET,
+	MXL_EAGLE_OPCODE_QAM_EQUALIZER_FILTER_SPUR_START_GET,
+	MXL_EAGLE_OPCODE_QAM_EQUALIZER_FILTER_SPUR_END_GET,
+	MXL_EAGLE_OPCODE_QAM_EQUALIZER_FILTER_DFE_TAPS_NUMBER_GET,
+	MXL_EAGLE_OPCODE_QAM_EQUALIZER_FILTER_DFE_START_GET,
+	MXL_EAGLE_OPCODE_QAM_EQUALIZER_FILTER_DFE_MIDDLE_GET,
+	MXL_EAGLE_OPCODE_QAM_EQUALIZER_FILTER_DFE_END_GET,
+
+	/* OOB */
+	MXL_EAGLE_OPCODE_OOB_PARAMS_SET,
+	MXL_EAGLE_OPCODE_OOB_RESTART_SET,
+	MXL_EAGLE_OPCODE_OOB_ERROR_COUNTERS_GET,
+	MXL_EAGLE_OPCODE_OOB_STATUS_GET,
+
+	/* SMA */
+	MXL_EAGLE_OPCODE_SMA_INIT_SET,
+	MXL_EAGLE_OPCODE_SMA_PARAMS_SET,
+	MXL_EAGLE_OPCODE_SMA_TRANSMIT_SET,
+	MXL_EAGLE_OPCODE_SMA_RECEIVE_GET,
+
+	/* DEBUG */
+	MXL_EAGLE_OPCODE_INTERNAL,
+
+	MXL_EAGLE_OPCODE_MAX = 70,
+};
+
+/* Enum of Host to Eagle I2C protocol opcodes */
+static const char * const MXL_EAGLE_OPCODE_STRING[] = {
+	/* DEVICE */
+	"DEVICE_DEMODULATOR_TYPE_SET",
+	"DEVICE_MPEG_OUT_PARAMS_SET",
+	"DEVICE_POWERMODE_SET",
+	"DEVICE_GPIO_DIRECTION_SET",
+	"DEVICE_GPO_LEVEL_SET",
+	"DEVICE_INTR_MASK_SET",
+	"DEVICE_IO_MUX_SET",
+	"DEVICE_VERSION_GET",
+	"DEVICE_STATUS_GET",
+	"DEVICE_GPI_LEVEL_GET",
+
+	/* TUNER */
+	"TUNER_CHANNEL_TUNE_SET",
+	"TUNER_LOCK_STATUS_GET",
+	"TUNER_AGC_STATUS_GET",
+
+	/* ATSC */
+	"ATSC_INIT_SET",
+	"ATSC_ACQUIRE_CARRIER_SET",
+	"ATSC_STATUS_GET",
+	"ATSC_ERROR_COUNTERS_GET",
+	"ATSC_EQUALIZER_FILTER_DFE_TAPS_GET",
+	"ATSC_EQUALIZER_FILTER_FFE_TAPS_GET",
+
+	/* QAM */
+	"QAM_PARAMS_SET",
+	"QAM_RESTART_SET",
+	"QAM_STATUS_GET",
+	"QAM_ERROR_COUNTERS_GET",
+	"QAM_CONSTELLATION_VALUE_GET",
+	"QAM_EQUALIZER_FILTER_FFE_GET",
+	"QAM_EQUALIZER_FILTER_SPUR_START_GET",
+	"QAM_EQUALIZER_FILTER_SPUR_END_GET",
+	"QAM_EQUALIZER_FILTER_DFE_TAPS_NUMBER_GET",
+	"QAM_EQUALIZER_FILTER_DFE_START_GET",
+	"QAM_EQUALIZER_FILTER_DFE_MIDDLE_GET",
+	"QAM_EQUALIZER_FILTER_DFE_END_GET",
+
+	/* OOB */
+	"OOB_PARAMS_SET",
+	"OOB_RESTART_SET",
+	"OOB_ERROR_COUNTERS_GET",
+	"OOB_STATUS_GET",
+
+	/* SMA */
+	"SMA_INIT_SET",
+	"SMA_PARAMS_SET",
+	"SMA_TRANSMIT_SET",
+	"SMA_RECEIVE_GET",
+
+	/* DEBUG */
+	"INTERNAL",
+};
+
+/* Enum of Callabck function types */
+enum MXL_EAGLE_CB_TYPE_E {
+	MXL_EAGLE_CB_FW_DOWNLOAD = 0,
+};
+
+/* Enum of power supply types */
+enum MXL_EAGLE_POWER_SUPPLY_SOURCE_E {
+	MXL_EAGLE_POWER_SUPPLY_SOURCE_SINGLE,   /* Single supply of 3.3V */
+	MXL_EAGLE_POWER_SUPPLY_SOURCE_DUAL,     /* Dual supply, 1.8V & 3.3V */
+};
+
+/* Enum of I/O pad drive modes */
+enum MXL_EAGLE_IO_MUX_DRIVE_MODE_E {
+	MXL_EAGLE_IO_MUX_DRIVE_MODE_1X,
+	MXL_EAGLE_IO_MUX_DRIVE_MODE_2X,
+	MXL_EAGLE_IO_MUX_DRIVE_MODE_3X,
+	MXL_EAGLE_IO_MUX_DRIVE_MODE_4X,
+	MXL_EAGLE_IO_MUX_DRIVE_MODE_5X,
+	MXL_EAGLE_IO_MUX_DRIVE_MODE_6X,
+	MXL_EAGLE_IO_MUX_DRIVE_MODE_7X,
+	MXL_EAGLE_IO_MUX_DRIVE_MODE_8X,
+};
+
+/* Enum of demodulator types. Used for selection of demodulator
+ * type in relevant devices, e.g. ATSC vs. QAM in Mxl691
+ */
+enum MXL_EAGLE_DEMOD_TYPE_E {
+	MXL_EAGLE_DEMOD_TYPE_QAM,    /* Mxl248 or Mxl692 */
+	MXL_EAGLE_DEMOD_TYPE_OOB,    /* Mxl248 only */
+	MXL_EAGLE_DEMOD_TYPE_ATSC    /* Mxl691 or Mxl692 */
+};
+
+/* Enum of power modes. Used for initial
+ * activation, or for activating sleep mode
+ */
+enum MXL_EAGLE_POWER_MODE_E {
+	MXL_EAGLE_POWER_MODE_SLEEP,
+	MXL_EAGLE_POWER_MODE_ACTIVE
+};
+
+/* Enum of GPIOs, used in device GPIO APIs */
+enum MXL_EAGLE_GPIO_NUMBER_E {
+	MXL_EAGLE_GPIO_NUMBER_0,
+	MXL_EAGLE_GPIO_NUMBER_1,
+	MXL_EAGLE_GPIO_NUMBER_2,
+	MXL_EAGLE_GPIO_NUMBER_3,
+	MXL_EAGLE_GPIO_NUMBER_4,
+	MXL_EAGLE_GPIO_NUMBER_5,
+	MXL_EAGLE_GPIO_NUMBER_6
+};
+
+/* Enum of GPIO directions, used in GPIO direction configuration API */
+enum MXL_EAGLE_GPIO_DIRECTION_E {
+	MXL_EAGLE_GPIO_DIRECTION_INPUT,
+	MXL_EAGLE_GPIO_DIRECTION_OUTPUT
+};
+
+/* Enum of GPIO level, used in device GPIO APIs */
+enum MXL_EAGLE_GPIO_LEVEL_E {
+	MXL_EAGLE_GPIO_LEVEL_LOW,
+	MXL_EAGLE_GPIO_LEVEL_HIGH,
+};
+
+/* Enum of I/O Mux function, used in device I/O mux configuration API */
+enum MXL_EAGLE_IOMUX_FUNCTION_E {
+	MXL_EAGLE_IOMUX_FUNC_FEC_LOCK,
+	MXL_EAGLE_IOMUX_FUNC_MERR,
+};
+
+/* Enum of MPEG Data format, used in MPEG and OOB output configuration */
+enum MXL_EAGLE_MPEG_DATA_FORMAT_E {
+	MXL_EAGLE_DATA_SERIAL_LSB_1ST = 0,
+	MXL_EAGLE_DATA_SERIAL_MSB_1ST,
+
+	MXL_EAGLE_DATA_SYNC_WIDTH_BIT = 0,
+	MXL_EAGLE_DATA_SYNC_WIDTH_BYTE
+};
+
+/* Enum of MPEG Clock format, used in MPEG and OOB output configuration */
+enum MXL_EAGLE_MPEG_CLOCK_FORMAT_E {
+	MXL_EAGLE_CLOCK_ACTIVE_HIGH = 0,
+	MXL_EAGLE_CLOCK_ACTIVE_LOW,
+
+	MXL_EAGLE_CLOCK_POSITIVE  = 0,
+	MXL_EAGLE_CLOCK_NEGATIVE,
+
+	MXL_EAGLE_CLOCK_IN_PHASE = 0,
+	MXL_EAGLE_CLOCK_INVERTED,
+};
+
+/* Enum of MPEG Clock speeds, used in MPEG output configuration */
+enum MXL_EAGLE_MPEG_CLOCK_RATE_E {
+	MXL_EAGLE_MPEG_CLOCK_54MHZ,
+	MXL_EAGLE_MPEG_CLOCK_40_5MHZ,
+	MXL_EAGLE_MPEG_CLOCK_27MHZ,
+	MXL_EAGLE_MPEG_CLOCK_13_5MHZ,
+};
+
+/* Enum of Interrupt mask bit, used in host interrupt configuration */
+enum MXL_EAGLE_INTR_MASK_BITS_E {
+	MXL_EAGLE_INTR_MASK_DEMOD = 0,
+	MXL_EAGLE_INTR_MASK_SMA_RX = 1,
+	MXL_EAGLE_INTR_MASK_WDOG = 31
+};
+
+/* Enum of QAM Demodulator type, used in QAM configuration */
+enum MXL_EAGLE_QAM_DEMOD_ANNEX_TYPE_E {
+	MXL_EAGLE_QAM_DEMOD_ANNEX_B,    /* J.83B */
+	MXL_EAGLE_QAM_DEMOD_ANNEX_A,    /* DVB-C */
+};
+
+/* Enum of QAM Demodulator modulation, used in QAM configuration and status */
+enum MXL_EAGLE_QAM_DEMOD_QAM_TYPE_E {
+	MXL_EAGLE_QAM_DEMOD_QAM16,
+	MXL_EAGLE_QAM_DEMOD_QAM64,
+	MXL_EAGLE_QAM_DEMOD_QAM256,
+	MXL_EAGLE_QAM_DEMOD_QAM1024,
+	MXL_EAGLE_QAM_DEMOD_QAM32,
+	MXL_EAGLE_QAM_DEMOD_QAM128,
+	MXL_EAGLE_QAM_DEMOD_QPSK,
+	MXL_EAGLE_QAM_DEMOD_AUTO,
+};
+
+/* Enum of Demodulator IQ setup, used in QAM, OOB configuration and status */
+enum MXL_EAGLE_IQ_FLIP_E {
+	MXL_EAGLE_DEMOD_IQ_NORMAL,
+	MXL_EAGLE_DEMOD_IQ_FLIPPED,
+	MXL_EAGLE_DEMOD_IQ_AUTO,
+};
+
+/* Enum of OOB Demodulator symbol rates, used in OOB configuration */
+enum MXL_EAGLE_OOB_DEMOD_SYMB_RATE_E {
+	MXL_EAGLE_OOB_DEMOD_SYMB_RATE_0_772MHZ,  /* ANSI/SCTE 55-2 0.772 MHz */
+	MXL_EAGLE_OOB_DEMOD_SYMB_RATE_1_024MHZ,  /* ANSI/SCTE 55-1 1.024 MHz */
+	MXL_EAGLE_OOB_DEMOD_SYMB_RATE_1_544MHZ,  /* ANSI/SCTE 55-2 1.544 MHz */
+};
+
+/* Enum of tuner channel tuning mode */
+enum MXL_EAGLE_TUNER_CHANNEL_TUNE_MODE_E {
+	MXL_EAGLE_TUNER_CHANNEL_TUNE_MODE_VIEW,    /* Normal "view" mode */
+	MXL_EAGLE_TUNER_CHANNEL_TUNE_MODE_SCAN,    /* Fast "scan" mode */
+};
+
+/* Enum of tuner bandwidth */
+enum MXL_EAGLE_TUNER_BW_E {
+	MXL_EAGLE_TUNER_BW_6MHZ,
+	MXL_EAGLE_TUNER_BW_7MHZ,
+	MXL_EAGLE_TUNER_BW_8MHZ,
+};
+
+/* Enum of tuner bandwidth */
+enum MXL_EAGLE_JUNCTION_TEMPERATURE_E {
+	MXL_EAGLE_JUNCTION_TEMPERATURE_BELOW_0_CELSIUS          = 0,
+	MXL_EAGLE_JUNCTION_TEMPERATURE_BETWEEN_0_TO_14_CELSIUS  = 1,
+	MXL_EAGLE_JUNCTION_TEMPERATURE_BETWEEN_14_TO_28_CELSIUS = 3,
+	MXL_EAGLE_JUNCTION_TEMPERATURE_BETWEEN_28_TO_42_CELSIUS = 2,
+	MXL_EAGLE_JUNCTION_TEMPERATURE_BETWEEN_42_TO_57_CELSIUS = 6,
+	MXL_EAGLE_JUNCTION_TEMPERATURE_BETWEEN_57_TO_71_CELSIUS = 7,
+	MXL_EAGLE_JUNCTION_TEMPERATURE_BETWEEN_71_TO_85_CELSIUS = 5,
+	MXL_EAGLE_JUNCTION_TEMPERATURE_ABOVE_85_CELSIUS         = 4,
+};
+
+/* Struct passed in optional callback used during FW download */
+struct MXL_EAGLE_FW_DOWNLOAD_CB_PAYLOAD_T {
+	u32  total_len;
+	u32  downloaded_len;
+};
+
+/* Struct used of I2C protocol between host and Eagle, internal use only */
+struct __packed MXL_EAGLE_HOST_MSG_HEADER_T {
+	u8   opcode;
+	u8   seqnum;
+	u8   payload_size;
+	u8   status;
+	u32  checksum;
+};
+
+/* Device version information struct */
+struct __packed MXL_EAGLE_DEV_VER_T {
+	u8   chip_id;
+	u8   firmware_ver[MXL_EAGLE_VERSION_SIZE];
+	u8   mxlware_ver[MXL_EAGLE_VERSION_SIZE];
+};
+
+/* Xtal configuration struct */
+struct __packed MXL_EAGLE_DEV_XTAL_T {
+	u8   xtal_cap;           /* accepted range is 1..31 pF. Default is 26 */
+	u8   clk_out_enable;
+	u8   clk_out_div_enable;   /* clock out freq is xtal freq / 6 */
+	u8   xtal_sharing_enable; /* if enabled set xtal_cap to 25 pF */
+	u8   xtal_calibration_enable;  /* enable for master, disable for slave */
+};
+
+/* GPIO direction struct, internally used in GPIO configuration API */
+struct __packed MXL_EAGLE_DEV_GPIO_DIRECTION_T {
+	u8   gpio_number;
+	u8   gpio_direction;
+};
+
+/* GPO level struct, internally used in GPIO configuration API */
+struct __packed MXL_EAGLE_DEV_GPO_LEVEL_T {
+	u8   gpio_number;
+	u8   gpo_level;
+};
+
+/* Device Status struct */
+struct MXL_EAGLE_DEV_STATUS_T {
+	u8   temperature;
+	u8   demod_type;
+	u8   power_mode;
+	u8   cpu_utilization_percent;
+};
+
+/* Device interrupt configuration struct */
+struct __packed MXL_EAGLE_DEV_INTR_CFG_T {
+	u32  intr_mask;
+	u8   edge_trigger;
+	u8   positive_trigger;
+	u8   global_enable_interrupt;
+};
+
+/* MPEG pad drive parameters, used on MPEG output configuration */
+/* See MXL_EAGLE_IO_MUX_DRIVE_MODE_E */
+struct MXL_EAGLE_MPEG_PAD_DRIVE_T {
+	u8   pad_drv_mpeg_syn;
+	u8   pad_drv_mpeg_dat;
+	u8   pad_drv_mpeg_val;
+	u8   pad_drv_mpeg_clk;
+};
+
+/* MPEGOUT parameter struct, used in MPEG output configuration */
+struct MXL_EAGLE_MPEGOUT_PARAMS_T {
+	u8   mpeg_parallel;
+	u8   msb_first;
+	u8   mpeg_sync_pulse_width;    /* See MXL_EAGLE_MPEG_DATA_FORMAT_E */
+	u8   mpeg_valid_pol;
+	u8   mpeg_sync_pol;
+	u8   mpeg_clk_pol;
+	u8   mpeg3wire_mode_enable;
+	u8   mpeg_clk_freq;
+	struct MXL_EAGLE_MPEG_PAD_DRIVE_T mpeg_pad_drv;
+};
+
+/* QAM Demodulator parameters struct, used in QAM params configuration */
+struct __packed MXL_EAGLE_QAM_DEMOD_PARAMS_T {
+	u8   annex_type;
+	u8   qam_type;
+	u8   iq_flip;
+	u8   search_range_idx;
+	u8   spur_canceller_enable;
+	u32  symbol_rate_hz;
+	u32  symbol_rate_256qam_hz;
+};
+
+/* QAM Demodulator status */
+struct MXL_EAGLE_QAM_DEMOD_STATUS_T {
+	u8   annex_type;
+	u8   qam_type;
+	u8   iq_flip;
+	u8   interleaver_depth_i;
+	u8   interleaver_depth_j;
+	u8   qam_locked;
+	u8   fec_locked;
+	u8   mpeg_locked;
+	u16  snr_db_tenths;
+	s16  timing_offset;
+	s32  carrier_offset_hz;
+};
+
+/* QAM Demodulator error counters */
+struct MXL_EAGLE_QAM_DEMOD_ERROR_COUNTERS_T {
+	u32  corrected_code_words;
+	u32  uncorrected_code_words;
+	u32  total_code_words_received;
+	u32  corrected_bits;
+	u32  error_mpeg_frames;
+	u32  mpeg_frames_received;
+	u32  erasures;
+};
+
+/* QAM Demodulator constellation point */
+struct MXL_EAGLE_QAM_DEMOD_CONSTELLATION_VAL_T {
+	s16  i_value[12];
+	s16  q_value[12];
+};
+
+/* QAM Demodulator equalizer filter taps */
+struct MXL_EAGLE_QAM_DEMOD_EQU_FILTER_T {
+	s16  ffe_taps[MXL_EAGLE_QAM_FFE_TAPS_LENGTH];
+	s16  spur_taps[MXL_EAGLE_QAM_SPUR_TAPS_LENGTH];
+	s16  dfe_taps[MXL_EAGLE_QAM_DFE_TAPS_LENGTH];
+	u8   ffe_leading_tap_index;
+	u8   dfe_taps_number;
+};
+
+/* OOB Demodulator parameters struct, used in OOB params configuration */
+struct __packed MXL_EAGLE_OOB_DEMOD_PARAMS_T {
+	u8   symbol_rate;
+	u8   iq_flip;
+	u8   clk_pol;
+};
+
+/* OOB Demodulator error counters */
+struct MXL_EAGLE_OOB_DEMOD_ERROR_COUNTERS_T {
+	u32  corrected_packets;
+	u32  uncorrected_packets;
+	u32  total_packets_received;
+};
+
+/* OOB status */
+struct __packed MXL_EAGLE_OOB_DEMOD_STATUS_T {
+	u16  snr_db_tenths;
+	s16  timing_offset;
+	s32  carrier_offsetHz;
+	u8   qam_locked;
+	u8   fec_locked;
+	u8   mpeg_locked;
+	u8   retune_required;
+	u8   iq_flip;
+};
+
+/* ATSC Demodulator status */
+struct __packed MXL_EAGLE_ATSC_DEMOD_STATUS_T {
+	s16  snr_db_tenths;
+	s16  timing_offset;
+	s32  carrier_offset_hz;
+	u8   frame_lock;
+	u8   atsc_lock;
+	u8   fec_lock;
+};
+
+/* ATSC Demodulator error counters */
+struct MXL_EAGLE_ATSC_DEMOD_ERROR_COUNTERS_T {
+	u32  error_packets;
+	u32  total_packets;
+	u32  error_bytes;
+};
+
+/* ATSC Demodulator equalizers filter taps */
+struct __packed MXL_EAGLE_ATSC_DEMOD_EQU_FILTER_T {
+	s16  ffe_taps[MXL_EAGLE_ATSC_FFE_TAPS_LENGTH];
+	s8   dfe_taps[MXL_EAGLE_ATSC_DFE_TAPS_LENGTH];
+};
+
+/* Tuner AGC Status */
+struct __packed MXL_EAGLE_TUNER_AGC_STATUS_T {
+	u8   locked;
+	u16  raw_agc_gain;    /* AGC gain [dB] = rawAgcGain / 2^6 */
+	s16  rx_power_db_hundredths;
+};
+
+/* Tuner channel tune parameters */
+struct __packed MXL_EAGLE_TUNER_CHANNEL_PARAMS_T {
+	u32  freq_hz;
+	u8   tune_mode;
+	u8   bandwidth;
+};
+
+/* Tuner channel lock indications */
+struct __packed MXL_EAGLE_TUNER_LOCK_STATUS_T {
+	u8   rf_pll_locked;
+	u8   ref_pll_locked;
+};
+
+/* Smart antenna parameters  used in Smart antenna params configuration */
+struct __packed MXL_EAGLE_SMA_PARAMS_T {
+	u8   full_duplex_enable;
+	u8   rx_disable;
+	u8   idle_logic_high;
+};
+
+/* Smart antenna message format */
+struct __packed MXL_EAGLE_SMA_MESSAGE_T {
+	u32  payload_bits;
+	u8   total_num_bits;
+};
+
-- 
2.28.0

