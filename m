Return-Path: <linux-media+bounces-40289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F6EB2C79F
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 16:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B47F97B1B8C
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CF8283C8E;
	Tue, 19 Aug 2025 14:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="AUwIu7hL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15F227B33A;
	Tue, 19 Aug 2025 14:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615081; cv=none; b=LyNr/cdFNr1BAgjIz+Mak461je488gVHR8EcqOhZLaWkPw/+kcf9EUTjoJul/jgU4HpfF1M0RPL4LMJefl61YlllUS+lFKCMlsUWwJjNAwD8O9ufk06uft6TTmrbxl28Y8S7Y0pWsBN2drv2bTd1fCKT4Tit0vfdTSWcfkNdO+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615081; c=relaxed/simple;
	bh=J+vCvLmjCNVdM2taWNLIZUyQe6g056t8PDkEwQ5vjmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WxqZDk35ENi0rwqt2q+hyMJRa9/NnJJW01EAq3N6Zdw+8BhzTK75dk92fEZKeEwL+5IB7l9hq+htuJ8Azqz+WlwcljJBuq5mdY3XFRlJp8RWXC2nrKI28sJcVIPPxadrzpm6u3wIRjLLyz2UBkiD6BCnkuLhd9wujIr3IZUuY3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=AUwIu7hL; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JDHS0T016142;
	Tue, 19 Aug 2025 16:51:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	HxoLon4iV1qwpqLavRCZnNKmtubEqV3B5qkhIGRGi2k=; b=AUwIu7hL7DMQqPQp
	pv3e9nzxVSfDVgDq03ed9smf4Gv6tkD5nXYirnMzsXW5A26KU08DFCuuWQshQdbg
	pOJnhs6aGNrZBHOlEiQA8z1FZbjEZueKqDaGVzo2i5SdmgpNVBfJDgdOfxIOjeG/
	2YQ2LvbKso+lhQUR180yjcrCNNeGcr8mz5gjmT2bpAq+X/XOVha6K+rpzZ6lYhte
	XAr8cwzGMQNLv2/COMiyuXDQg0WECmuxxWLf/LjUowiV7Z/G9qzady+YgJZF5aR7
	EYtrxn98ar+EX57PmHg0zI3OqDBbnKVFGFa3Yf8rizIy5Z9OeezT96LzfzVT+Nzm
	nmqxOQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48k3j4he7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 16:51:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4EE0B40049;
	Tue, 19 Aug 2025 16:50:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 990A77396C9;
	Tue, 19 Aug 2025 16:49:54 +0200 (CEST)
Received: from localhost (10.130.78.67) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Aug
 2025 16:49:54 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Tue, 19 Aug 2025 16:47:42 +0200
Subject: [PATCH v2 2/2] media: i2c: vd55g1: Add support for vd65g4 RGB
 variant
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250819-vd55g1_add_vd65g4-v2-2-500547ac4051@foss.st.com>
References: <20250819-vd55g1_add_vd65g4-v2-0-500547ac4051@foss.st.com>
In-Reply-To: <20250819-vd55g1_add_vd65g4-v2-0-500547ac4051@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01

The vd65g4 is the bayer version of the vd55g1.
As opposed to the vd55g1, the vd65g4 does not need any patch. Check the
sensor id at probe and choose to patch or not on power_on() according to
it.
It's bayer matrix's order is RGGB. This commit handles hflip and vflip
by switching the bayer pattern accordingly.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 234 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 167 insertions(+), 67 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index b89fff7e11f891dea04a0085a9e7aac841b6643d..5e7669e06b23b06ac5cc51f33b7610a559ddc1f2 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -29,9 +29,11 @@
 
 /* Register Map */
 #define VD55G1_REG_MODEL_ID				CCI_REG32_LE(0x0000)
-#define VD55G1_MODEL_ID					0x53354731
+#define VD55G1_MODEL_ID_VD55G1				0x53354731 /* Mono */
+#define VD55G1_MODEL_ID_VD65G4				0x53354733 /* RGB */
 #define VD55G1_REG_REVISION				CCI_REG16_LE(0x0004)
 #define VD55G1_REVISION_CCB				0x2020
+#define VD55G1_REVISION_BAYER				0x3030
 #define VD55G1_REG_FWPATCH_REVISION			CCI_REG16_LE(0x0012)
 #define VD55G1_REG_FWPATCH_START_ADDR			CCI_REG8(0x2000)
 #define VD55G1_REG_SYSTEM_FSM				CCI_REG8(0x001c)
@@ -39,7 +41,8 @@
 #define VD55G1_SYSTEM_FSM_SW_STBY			0x02
 #define VD55G1_SYSTEM_FSM_STREAMING			0x03
 #define VD55G1_REG_BOOT					CCI_REG8(0x0200)
-#define VD55G1_BOOT_PATCH_SETUP				2
+#define VD55G1_BOOT_BOOT				1
+#define VD55G1_BOOT_PATCH_AND_BOOT			2
 #define VD55G1_REG_STBY					CCI_REG8(0x0201)
 #define VD55G1_STBY_START_STREAM			1
 #define VD55G1_REG_STREAMING				CCI_REG8(0x0202)
@@ -132,7 +135,10 @@
 #define VD55G1_MIPI_RATE_MIN				(250 * MEGA)
 #define VD55G1_MIPI_RATE_MAX				(1200 * MEGA)
 
-static const u8 patch_array[] = {
+#define VD55G1_MODEL_ID_NAME(id) \
+	((id) == VD55G1_MODEL_ID_VD55G1 ? "vd55g1" : "vd65g4")
+
+static const u8 vd55g1_patch_array[] = {
 	0x44, 0x03, 0x09, 0x02, 0xe6, 0x01, 0x42, 0x00, 0xea, 0x01, 0x42, 0x00,
 	0xf0, 0x01, 0x42, 0x00, 0xe6, 0x01, 0x42, 0x00, 0x00, 0x00, 0x00, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -466,22 +472,24 @@ struct vd55g1_mode {
 	u32 height;
 };
 
-struct vd55g1_fmt_desc {
-	u32 code;
-	u8 bpp;
-	u8 data_type;
+static const u32 vd55g1_mbus_formats_mono[] = {
+	MEDIA_BUS_FMT_Y8_1X8,
+	MEDIA_BUS_FMT_Y10_1X10,
 };
 
-static const struct vd55g1_fmt_desc vd55g1_mbus_codes[] = {
+/* Format order is : no flip, hflip, vflip, both */
+static const u32 vd55g1_mbus_formats_bayer[][4] = {
 	{
-		.code = MEDIA_BUS_FMT_Y8_1X8,
-		.bpp = 8,
-		.data_type = MIPI_CSI2_DT_RAW8,
+		MEDIA_BUS_FMT_SRGGB8_1X8,
+		MEDIA_BUS_FMT_SGRBG8_1X8,
+		MEDIA_BUS_FMT_SGBRG8_1X8,
+		MEDIA_BUS_FMT_SBGGR8_1X8,
 	},
 	{
-		.code = MEDIA_BUS_FMT_Y10_1X10,
-		.bpp = 10,
-		.data_type = MIPI_CSI2_DT_RAW10,
+		MEDIA_BUS_FMT_SRGGB10_1X10,
+		MEDIA_BUS_FMT_SGRBG10_1X10,
+		MEDIA_BUS_FMT_SGBRG10_1X10,
+		MEDIA_BUS_FMT_SBGGR10_1X10,
 	},
 };
 
@@ -524,6 +532,7 @@ struct vd55g1_vblank_limits {
 
 struct vd55g1 {
 	struct device *dev;
+	unsigned int id;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(vd55g1_supply_name)];
@@ -572,27 +581,78 @@ static inline struct vd55g1 *ctrl_to_vd55g1(struct v4l2_ctrl *ctrl)
 	return to_vd55g1(sd);
 }
 
-static const struct vd55g1_fmt_desc *vd55g1_get_fmt_desc(struct vd55g1 *sensor,
-							 u32 code)
+static unsigned int vd55g1_get_fmt_bpp(u32 code)
 {
-	unsigned int i;
+	switch (code) {
+	case MEDIA_BUS_FMT_Y8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	default:
+		return 8;
+
+	case MEDIA_BUS_FMT_Y10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+		return 10;
+	}
+}
+
+static unsigned int vd55g1_get_fmt_data_type(u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_Y8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	default:
+		return MIPI_CSI2_DT_RAW8;
+
+	case MEDIA_BUS_FMT_Y10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+		return MIPI_CSI2_DT_RAW10;
+	}
+}
+
+static u32 vd55g1_get_fmt_code(struct vd55g1 *sensor, u32 code)
+{
+	unsigned int i, j;
 
-	for (i = 0; i < ARRAY_SIZE(vd55g1_mbus_codes); i++) {
-		if (vd55g1_mbus_codes[i].code == code)
-			return &vd55g1_mbus_codes[i];
+	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
+		return code;
+
+	for (i = 0; i < ARRAY_SIZE(vd55g1_mbus_formats_bayer); i++) {
+		for (j = 0; j < ARRAY_SIZE(vd55g1_mbus_formats_bayer[i]); j++) {
+			if (vd55g1_mbus_formats_bayer[i][j] == code)
+				goto adapt_bayer_pattern;
+		}
 	}
+	dev_warn(sensor->dev, "Unsupported mbus format\n");
 
-	/* Should never happen */
-	dev_warn(sensor->dev, "Unsupported code %d. default to 8 bpp\n", code);
+	return code;
+
+adapt_bayer_pattern:
+	j = 0;
+	/* In first init_state() call, controls might not be initialized yet */
+	if (sensor->hflip_ctrl && sensor->vflip_ctrl) {
+		j = (sensor->hflip_ctrl->val ? 1 : 0) +
+			(sensor->vflip_ctrl->val ? 2 : 0);
+	}
 
-	return &vd55g1_mbus_codes[0];
+	return vd55g1_mbus_formats_bayer[i][j];
 }
 
 static s32 vd55g1_get_pixel_rate(struct vd55g1 *sensor,
 				 struct v4l2_mbus_framefmt *format)
 {
-	return sensor->mipi_rate /
-			vd55g1_get_fmt_desc(sensor, format->code)->bpp;
+	return sensor->mipi_rate / vd55g1_get_fmt_bpp(format->code);
 }
 
 static unsigned int vd55g1_get_hblank_min(struct vd55g1 *sensor,
@@ -605,7 +665,7 @@ static unsigned int vd55g1_get_hblank_min(struct vd55g1 *sensor,
 
 	/* MIPI required time */
 	mipi_req_line_time = (crop->width *
-			      vd55g1_get_fmt_desc(sensor, format->code)->bpp +
+			      vd55g1_get_fmt_bpp(format->code) +
 			      VD55G1_MIPI_MARGIN) /
 			      (sensor->mipi_rate / MEGA);
 	mipi_req_line_length = mipi_req_line_time * sensor->pixel_clock /
@@ -887,7 +947,7 @@ static void vd55g1_update_pad_fmt(struct vd55g1 *sensor,
 				  const struct vd55g1_mode *mode, u32 code,
 				  struct v4l2_mbus_framefmt *fmt)
 {
-	fmt->code = code;
+	fmt->code = vd55g1_get_fmt_code(sensor, code);
 	fmt->width = mode->width;
 	fmt->height = mode->height;
 	fmt->colorspace = V4L2_COLORSPACE_RAW;
@@ -951,10 +1011,9 @@ static int vd55g1_set_framefmt(struct vd55g1 *sensor,
 	int ret = 0;
 
 	vd55g1_write(sensor, VD55G1_REG_FORMAT_CTRL,
-		     vd55g1_get_fmt_desc(sensor, format->code)->bpp, &ret);
+		     vd55g1_get_fmt_bpp(format->code), &ret);
 	vd55g1_write(sensor, VD55G1_REG_OIF_IMG_CTRL,
-		     vd55g1_get_fmt_desc(sensor, format->code)->data_type,
-		     &ret);
+		     vd55g1_get_fmt_data_type(format->code), &ret);
 
 	switch (crop->width / format->width) {
 	case 1:
@@ -1115,26 +1174,45 @@ static int vd55g1_patch(struct vd55g1 *sensor)
 	u64 patch;
 	int ret = 0;
 
-	vd55g1_write_array(sensor, VD55G1_REG_FWPATCH_START_ADDR,
-			   sizeof(patch_array), patch_array, &ret);
-	vd55g1_write(sensor, VD55G1_REG_BOOT, VD55G1_BOOT_PATCH_SETUP, &ret);
-	vd55g1_poll_reg(sensor, VD55G1_REG_BOOT, 0, &ret);
-	if (ret) {
-		dev_err(sensor->dev, "Failed to apply patch\n");
-		return ret;
-	}
+	/* vd55g1 needs a patch while vd65g4 does not */
+	if (sensor->id == VD55G1_MODEL_ID_VD55G1) {
+		vd55g1_write_array(sensor, VD55G1_REG_FWPATCH_START_ADDR,
+				   sizeof(vd55g1_patch_array),
+				   vd55g1_patch_array, &ret);
+		vd55g1_write(sensor, VD55G1_REG_BOOT,
+			     VD55G1_BOOT_PATCH_AND_BOOT, &ret);
+		vd55g1_poll_reg(sensor, VD55G1_REG_BOOT, 0, &ret);
+		if (ret) {
+			dev_err(sensor->dev, "Failed to apply patch\n");
+			return ret;
+		}
 
-	vd55g1_read(sensor, VD55G1_REG_FWPATCH_REVISION, &patch, &ret);
-	if (patch != (VD55G1_FWPATCH_REVISION_MAJOR << 8) +
-	    VD55G1_FWPATCH_REVISION_MINOR) {
-		dev_err(sensor->dev, "Bad patch version expected %d.%d got %d.%d\n",
-			VD55G1_FWPATCH_REVISION_MAJOR,
-			VD55G1_FWPATCH_REVISION_MINOR,
+		vd55g1_read(sensor, VD55G1_REG_FWPATCH_REVISION, &patch, &ret);
+		if (patch != (VD55G1_FWPATCH_REVISION_MAJOR << 8) +
+		    VD55G1_FWPATCH_REVISION_MINOR) {
+			dev_err(sensor->dev, "Bad patch version expected %d.%d got %d.%d\n",
+				VD55G1_FWPATCH_REVISION_MAJOR,
+				VD55G1_FWPATCH_REVISION_MINOR,
+				(u8)(patch >> 8), (u8)(patch & 0xff));
+			return -ENODEV;
+		}
+		dev_dbg(sensor->dev, "patch %d.%d applied\n",
 			(u8)(patch >> 8), (u8)(patch & 0xff));
-		return -ENODEV;
+
+	} else {
+		vd55g1_write(sensor, VD55G1_REG_BOOT, VD55G1_BOOT_BOOT, &ret);
+		vd55g1_poll_reg(sensor, VD55G1_REG_BOOT, 0, &ret);
+		if (ret) {
+			dev_err(sensor->dev, "Failed to boot\n");
+			return ret;
+		}
+	}
+
+	ret = vd55g1_wait_state(sensor, VD55G1_SYSTEM_FSM_SW_STBY, NULL);
+	if (ret) {
+		dev_err(sensor->dev, "Sensor waiting after boot failed\n");
+		return ret;
 	}
-	dev_dbg(sensor->dev, "patch %d.%d applied\n",
-		(u8)(patch >> 8), (u8)(patch & 0xff));
 
 	return 0;
 }
@@ -1166,10 +1244,19 @@ static int vd55g1_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index >= ARRAY_SIZE(vd55g1_mbus_codes))
-		return -EINVAL;
+	struct vd55g1 *sensor = to_vd55g1(sd);
+	u32 base_code;
 
-	code->code = vd55g1_mbus_codes[code->index].code;
+	if (sensor->id == VD55G1_MODEL_ID_VD55G1) {
+		if (code->index >= ARRAY_SIZE(vd55g1_mbus_formats_mono))
+			return -EINVAL;
+		base_code = vd55g1_mbus_formats_mono[code->index];
+	} else {
+		if (code->index >= ARRAY_SIZE(vd55g1_mbus_formats_bayer))
+			return -EINVAL;
+		base_code = vd55g1_mbus_formats_bayer[code->index][0];
+	}
+	code->code = vd55g1_get_fmt_code(sensor, base_code);
 
 	return 0;
 }
@@ -1276,7 +1363,7 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
 		return ret;
 
 	vd55g1_update_pad_fmt(sensor, &vd55g1_supported_modes[VD55G1_MODE_DEF],
-			      vd55g1_mbus_codes[VD55G1_MBUS_CODE_DEF].code,
+			      vd55g1_get_fmt_code(sensor, VD55G1_MBUS_CODE_DEF),
 			      &fmt.format);
 
 	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
@@ -1286,9 +1373,16 @@ static int vd55g1_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
+	struct vd55g1 *sensor = to_vd55g1(sd);
+	u32 code;
+
 	if (fse->index >= ARRAY_SIZE(vd55g1_supported_modes))
 		return -EINVAL;
 
+	code = vd55g1_get_fmt_code(sensor, fse->code);
+	if (fse->code != code)
+		return -EINVAL;
+
 	fse->min_width = vd55g1_supported_modes[fse->index].width;
 	fse->max_width = fse->min_width;
 	fse->min_height = vd55g1_supported_modes[fse->index].height;
@@ -1466,8 +1560,12 @@ static int vd55g1_init_ctrls(struct vd55g1 *sensor)
 	/* Flip cluster */
 	sensor->hflip_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP,
 					       0, 1, 1, 0);
+	if (sensor->hflip_ctrl)
+		sensor->hflip_ctrl->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	sensor->vflip_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP,
 					       0, 1, 1, 0);
+	if (sensor->vflip_ctrl)
+		sensor->vflip_ctrl->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	v4l2_ctrl_cluster(2, &sensor->hflip_ctrl);
 
 	/* Exposition cluster */
@@ -1551,26 +1649,34 @@ static int vd55g1_init_ctrls(struct vd55g1 *sensor)
 
 static int vd55g1_detect(struct vd55g1 *sensor)
 {
-	u64 device_rev;
-	u64 id;
+	unsigned int dt_id = (uintptr_t)device_get_match_data(sensor->dev);
+	u64 rev, id;
 	int ret;
 
 	ret = vd55g1_read(sensor, VD55G1_REG_MODEL_ID, &id, NULL);
 	if (ret)
 		return ret;
 
-	if (id != VD55G1_MODEL_ID) {
-		dev_warn(sensor->dev, "Unsupported sensor id %x\n", (u32)id);
+	if (id != VD55G1_MODEL_ID_VD55G1 && id != VD55G1_MODEL_ID_VD65G4) {
+		dev_warn(sensor->dev, "Unsupported sensor id 0x%x\n",
+			 (u32)id);
+		return -ENODEV;
+	}
+	if (id != dt_id) {
+		dev_err(sensor->dev, "Probed sensor %s and device tree definition (%s) mismatch",
+			VD55G1_MODEL_ID_NAME(id), VD55G1_MODEL_ID_NAME(dt_id));
 		return -ENODEV;
 	}
+	sensor->id = id;
 
-	ret = vd55g1_read(sensor, VD55G1_REG_REVISION, &device_rev, NULL);
+	ret = vd55g1_read(sensor, VD55G1_REG_REVISION, &rev, NULL);
 	if (ret)
 		return ret;
 
-	if (device_rev != VD55G1_REVISION_CCB) {
-		dev_err(sensor->dev, "Unsupported sensor revision (0x%x)\n",
-			(u16)device_rev);
+	if ((id == VD55G1_MODEL_ID_VD55G1 && rev != VD55G1_REVISION_CCB) &&
+	    (id == VD55G1_MODEL_ID_VD65G4 && rev != VD55G1_REVISION_BAYER)) {
+		dev_err(sensor->dev, "Unsupported sensor revision 0x%x for sensor %s\n",
+			(u16)rev, VD55G1_MODEL_ID_NAME(id));
 		return -ENODEV;
 	}
 
@@ -1619,13 +1725,6 @@ static int vd55g1_power_on(struct device *dev)
 		goto disable_clock;
 	}
 
-	ret = vd55g1_wait_state(sensor, VD55G1_SYSTEM_FSM_SW_STBY, NULL);
-	if (ret) {
-		dev_err(dev, "Sensor waiting after patch failed %d\n",
-			ret);
-		goto disable_clock;
-	}
-
 	return 0;
 
 disable_clock:
@@ -1938,7 +2037,8 @@ static void vd55g1_remove(struct i2c_client *client)
 }
 
 static const struct of_device_id vd55g1_dt_ids[] = {
-	{ .compatible = "st,vd55g1" },
+	{ .compatible = "st,vd55g1", .data = (void *)VD55G1_MODEL_ID_VD55G1 },
+	{ .compatible = "st,vd65g4", .data = (void *)VD55G1_MODEL_ID_VD65G4 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, vd55g1_dt_ids);

-- 
2.25.1


