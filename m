Return-Path: <linux-media+bounces-47055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0E7C5BB22
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 08:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9D9B335948F
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 07:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718972F49F8;
	Fri, 14 Nov 2025 07:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c1UcmXEx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTr/zXyc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744212F1FDE
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 07:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763104296; cv=none; b=R6ERVjkLHtpgxdmctp0Uu/EYfD88DsB6ZWgi0pp6BwqRo1GKxUMnknavia+8MGWhGQQRd9QpJmIhzozqD+fxOQgtwNJr9DUa5NzjQGMdEXTMSuy6fhiHoUwr83ueJMHyFVVN1EzLKU2p29NOsMbGGUspJ3QkUrVlVWwCTrrdeC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763104296; c=relaxed/simple;
	bh=yEKXTKlegzyFe/T5Jb2lknPnu9seg508gMV6HdMNA1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QbPq4hAUMRXa5rxOD6nFVfZjiyrc0s345nGFRsQ5P8tO8ngL2SKN71ND510J6/Nytw7+E6Zb+fq8tf9VF1zz7zzUAQj5bt41vKwZdwMlejI3u2X2GluCkXVNtmx/xIbHoDQi4VOGkx6rzdf25oiECWcpxVEG2a0uDQdleBjFfjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c1UcmXEx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTr/zXyc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMao4x1629664
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 07:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	88+wbiy3eMz/8rZ+Rw4j3vcISrAgAVjlc7UVyprQH8Q=; b=c1UcmXEx6Hz8lmsZ
	fp/KN2Mv43BMkHcQDHU/yCEcSvXHAbYy+9RgjgefcPguA1R6wIonzN95I/mS2fYj
	bs5urq82CHTOLCjt2w3aDvkQV/mNyqhEenmbzFSzApbX+2p1wbPatBAq0rXSExZ6
	fTuhm1p7+8LzHcERcYo24Pw7zGDVHYmx1ebFiGX7wZdW0SrAAF51t03WEcjoRgJ8
	zm7W9PdMS9GQ7vP0xdlX+ywyK+2mYtOGtYLvmPPBuP5t1iTk/5oOTS1PP0krj3zO
	UEqA2uz36vaa+tCrbERpAX8ddG2IQwt2QQjDpI+h4+X6lnlKx6wP4g5ljwxLDlsq
	GydUIg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9d97ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 07:11:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88236bcdfc4so48108726d6.1
        for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 23:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763104292; x=1763709092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88+wbiy3eMz/8rZ+Rw4j3vcISrAgAVjlc7UVyprQH8Q=;
        b=QTr/zXycp6GeGystmOwbmSjx78wOmnH/pP36q51GlRIsGqsV/ysCu6D318czj407t1
         HztKCbWblrj0s1wkCMWI+HStHLkn/PGhW8pbQBvzuWyAu4pjvWuPb4ZKYbrUmXg8uKgG
         B1ZF2ObFS6F5qjiDlET7XNV6RmKLH0M/wV09mKuPwGfNozDsVg5XHkZNg9uhS0z5TRq6
         R99e2eFFUTW0Edo7kTTcS4985fNppvJI33QNIsPtfmjrpPm8nAfnZ06+3TK6EBkwsTgq
         31AQ7GqinGsiqtsYm7KkANNtMgOLWxJKHPz1gC6oi7zuF9iO3MGY4RzTKwvXL5dtXKwW
         +Qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763104292; x=1763709092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=88+wbiy3eMz/8rZ+Rw4j3vcISrAgAVjlc7UVyprQH8Q=;
        b=n0RrQz6Wr3ZMoWvpYVazo0au0EBdS7uwCo/Rp8h6GX+PhoV/yzstspx4iHwYAZ7TcD
         M32+5KIEQfjiCTUP42hRVG0pNZ7SaI2iiisRVcWFTtUCHvyLCtc2VQ9LL/NDRjXdSejR
         XsTEpez6rWhzS3cY4zk9lhMOELXrRr2vVmdIxmvaucX+880vJ5+p5Zy+5eh5zgh96qnP
         BnlIeCWkTiObnvWSj9lM0QTjU+df1db9UUjZGC2c5YQv2lalVJracMvb3ZxKSe6NL7mS
         5DmApTymLQ1rF9OHrpBKGoF5qAMXuAv9XMff8BXLlxRxQzJyNor4cfLMyFTGREmt4RGd
         IOhA==
X-Forwarded-Encrypted: i=1; AJvYcCVHUCqW3qYkA2tqD7FWlz5KIS8WsSenepU0OUjNJ92U730okNHpPB1A2hd7/VDqQ4/qxBFE/lMWOcc4Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEP+ybVLxI15/qDM7bEUL2G+t0Seu5d3vk9+nErQBX2gSzCV1W
	Fx/WbV6OuHgpp+Nmy0r/3K+86E1ESQ0VnWOMHfR365R7PIqRDFA6obFd4wtg6vEtHwfU/6E/7NJ
	vwCT7j4wPboqsY/z0bWvZmiT8fH/QaBiOHjeM+GoE7u052mUG9v2f+s3YPLFJChtQmQ==
X-Gm-Gg: ASbGnctFnIHk6/TMrPoF2HtARfm+NjGy/btBbiK1CLp41Q7jQhlMKz1SN+ynTCZOQak
	Yc2nZoTJXuFO/pRUO8MFE3yRI8f2HFsnRKTs8RCWTc32rr/+VNYqTchlSJwzQmbsvtgF6yO/vi9
	kk7sN8aFY0IOMLKHCJEpkyUP8UJwy8rzTqBg2qQIGqVjGuNhBhoNRa40EUrgnu/hGDokDvfRxsE
	KZ38jQsXvwvlXlhN+/hooT8i0cWDhKCeubZkL5b3blJoHNzSj2eOdySm8nS1mEbwu6R6B7wV3xK
	cZ/jXrC1V0GkvtXEs0sDyTsVsCdFp7gJVdz7zZYCaCBrMbMmiFT66i5FUM5FIXSkOT+30dcnnha
	Xq1U1p8Atd1uP3zKfF/48V4PpDwL2VUOncG8hZAL9g97c5NrFkfJRfk5ZTbkHgdW1sw==
X-Received: by 2002:a05:6214:410f:b0:87c:28cc:9e69 with SMTP id 6a1803df08f44-882926af38dmr23620866d6.55.1763104292218;
        Thu, 13 Nov 2025 23:11:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFl3sbyUW/GdqRLDhJ4K31zUnO+d+poaEBcy/ezrLS9o/LprKIICBOPIegp4Hby01S5meYWwA==
X-Received: by 2002:a05:6214:410f:b0:87c:28cc:9e69 with SMTP id 6a1803df08f44-882926af38dmr23620636d6.55.1763104291617;
        Thu, 13 Nov 2025 23:11:31 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-882862ce056sm26336666d6.6.2025.11.13.23.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:11:30 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 15:11:18 +0800
Subject: [PATCH v6 1/3] media: qcom: camss: Add common TPG support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-camss_tpg-v6-1-38d3d9fbe339@oss.qualcomm.com>
References: <20251114-camss_tpg-v6-0-38d3d9fbe339@oss.qualcomm.com>
In-Reply-To: <20251114-camss_tpg-v6-0-38d3d9fbe339@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763104282; l=24194;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=yEKXTKlegzyFe/T5Jb2lknPnu9seg508gMV6HdMNA1Q=;
 b=lSFQLcfqfOcvXldm07uP0YbXwWXj5Y4ZaQGmnUbdKKbNJqjdC6hJTTILwIWZCk4iQDGDxO4pv
 409oDrkjnNnC8KxUDFcakMQE3L8Flh1pEZoui3+2UMstjt195W/MSrc
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: rVzTktsvlhcc-4698P2zC41WmqJd3-ci
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=6916d625 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9-4OygZIhI6akIEH2MEA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: rVzTktsvlhcc-4698P2zC41WmqJd3-ci
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA1NSBTYWx0ZWRfX+Enxkc+RqQxn
 n9F2aGDhvUa4H4MFWMQcc+Q4RXpBwot3XhgjjenTse4RErhTsH00ZF1xkvX8TKElju3akBXMCjr
 YWYIhMtE0uitodBP1z5WBqDGfn6rIaKDaI3uukRNTXXqa+1/roryBx6EZjU6UcIZsf9/b8PiqzF
 Qxirhvh4W0PBUcCPRyW49n/rIbT7C6xEHULvDZdIokMXfz6M8SmFIns80rnfz1ZTOdQVlO9VNge
 qdJdviNQafR04/Va4BdFav/6MmoX2ukViaHMOFGbQiPBdUPceS7NTJQy6lxxdZWJR1PFWhJhDTy
 TuCL7rPvokMkDRB1H6g52SLg/Y90Rhz2lqCxLD2F3ccrQg4d6JEzpX+eW8YaPlgo8abesHa8DNT
 crr2bLSzcH6xEc5ByOwaz0oJsI5pgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140055

Introduce a new common Test Pattern Generator (TPG) implementation for
Qualcomm CAMSS. This module provides a generic interface for pattern
generation that can be reused by multiple platforms.

Unlike CSID-integrated TPG, this TPG acts as a standalone block
that emulates both CSIPHY and sensor behavior, enabling flexible test
patterns without external hardware.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 drivers/media/platform/qcom/camss/camss-tpg.c | 710 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h | 126 +++++
 drivers/media/platform/qcom/camss/camss.h     |   5 +
 4 files changed, 842 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 5e349b4915130c71dbff90e73102e46dfede1520..d355e67c25700ac061b878543c32ed8defc03ad0 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -27,5 +27,6 @@ qcom-camss-objs += \
 		camss-vfe.o \
 		camss-video.o \
 		camss-format.o \
+		camss-tpg.o \
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/media/platform/qcom/camss/camss-tpg.c
new file mode 100644
index 0000000000000000000000000000000000000000..feec78fcc3563f040d19c7b6eb95dee541007a66
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-tpg.c
@@ -0,0 +1,710 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *
+ * Qualcomm MSM Camera Subsystem - TPG Module
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <media/media-entity.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
+
+#include "camss-tpg.h"
+#include "camss.h"
+
+const char * const testgen_payload_modes[] = {
+	"Disabled",
+	"Incrementing",
+	"Alternating 0x55/0xAA",
+	"Reserved",
+	"Reserved",
+	"Pseudo-random Data",
+	"User Specified",
+	"Reserved",
+	"Reserved",
+	"Color bars",
+	"Reserved"
+};
+
+static const struct tpg_format_info formats_gen1[] = {
+	{
+		MEDIA_BUS_FMT_SBGGR8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+	},
+	{
+		MEDIA_BUS_FMT_Y8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+	},
+	{
+		MEDIA_BUS_FMT_Y10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+	},
+};
+
+const struct tpg_formats tpg_formats_gen1 = {
+	.nformats = ARRAY_SIZE(formats_gen1),
+	.formats = formats_gen1
+};
+
+const struct tpg_format_info *tpg_get_fmt_entry(struct tpg_device *tpg,
+						const struct tpg_format_info *formats,
+						unsigned int nformats,
+						u32 code)
+{
+	struct device *dev = tpg->camss->dev;
+	size_t i;
+
+	for (i = 0; i < nformats; i++)
+		if (code == formats[i].code)
+			return &formats[i];
+
+	dev_warn(dev, "Unknown pixel format code=0x%08x\n", code);
+
+	return ERR_PTR(-EINVAL);
+}
+
+/*
+ * tpg_set_clock_rates - set clock rates on tpg module
+ * @tpg: tpg device
+ */
+static int tpg_set_clock_rates(struct tpg_device *tpg)
+{
+	struct device *dev = tpg->camss->dev;
+	int ret;
+	int i;
+
+	for (i = 0; i < tpg->nclocks; i++) {
+		struct camss_clock *clock = &tpg->clock[i];
+		long round_rate;
+
+		if (clock->freq[0] > 0) {
+			round_rate = clk_round_rate(clock->clk, clock->freq[0]);
+			if (round_rate < 0) {
+				dev_err(dev, "clk round rate failed: %ld\n",
+					round_rate);
+				return -EINVAL;
+			}
+
+			ret = clk_set_rate(clock->clk, round_rate);
+			if (ret < 0) {
+				dev_err(dev, "clk set rate failed: %d\n", ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * tpg_set_power - Power on/off tpg module
+ * @sd: tpg V4L2 subdevice
+ * @on: Requested power state
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int tpg_set_power(struct v4l2_subdev *sd, int on)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	struct device *dev = tpg->camss->dev;
+
+	if (on) {
+		int ret;
+
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0)
+			return ret;
+
+		ret = tpg_set_clock_rates(tpg);
+		if (ret < 0) {
+			pm_runtime_put_sync(dev);
+			return ret;
+		}
+
+		ret = camss_enable_clocks(tpg->nclocks, tpg->clock, dev);
+		if (ret < 0) {
+			pm_runtime_put_sync(dev);
+			return ret;
+		}
+
+		tpg->res->hw_ops->reset(tpg);
+
+		tpg->res->hw_ops->hw_version(tpg);
+	} else {
+		camss_disable_clocks(tpg->nclocks, tpg->clock);
+
+		pm_runtime_put_sync(dev);
+	}
+
+	return 0;
+}
+
+/*
+ * tpg_set_stream - Enable/disable streaming on tpg module
+ * @sd: tpg V4L2 subdevice
+ * @enable: Requested streaming state
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int tpg_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	int ret = 0;
+
+	if (enable) {
+		ret = v4l2_ctrl_handler_setup(&tpg->ctrls);
+		if (ret < 0) {
+			dev_err(tpg->camss->dev,
+				"could not sync v4l2 controls: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = tpg->res->hw_ops->configure_stream(tpg, enable);
+
+	return ret;
+}
+
+/*
+ * __tpg_get_format - Get pointer to format structure
+ * @tpg: tpg device
+ * @cfg: V4L2 subdev pad configuration
+ * @pad: pad from which format is requested
+ * @which: TRY or ACTIVE format
+ *
+ * Return pointer to TRY or ACTIVE format structure
+ */
+static struct v4l2_mbus_framefmt *
+__tpg_get_format(struct tpg_device *tpg,
+		 struct v4l2_subdev_state *sd_state,
+		 unsigned int pad,
+		 enum v4l2_subdev_format_whence which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_state_get_format(sd_state,
+						    pad);
+
+	return &tpg->fmt[pad];
+}
+
+/*
+ * tpg_try_format - Handle try format by pad subdev method
+ * @tpg: tpg device
+ * @cfg: V4L2 subdev pad configuration
+ * @pad: pad on which format is requested
+ * @fmt: pointer to v4l2 format structure
+ * @which: wanted subdev format
+ */
+static void tpg_try_format(struct tpg_device *tpg,
+			   struct v4l2_subdev_state *sd_state,
+			   unsigned int pad,
+			   struct v4l2_mbus_framefmt *fmt,
+			   enum v4l2_subdev_format_whence which)
+{
+	unsigned int i;
+
+	switch (pad) {
+	case MSM_TPG_PAD_SINK:
+		for (i = 0; i < tpg->res->formats->nformats; i++)
+			if (tpg->res->formats->formats[i].code == fmt->code)
+				break;
+
+		/* If not found, use SBGGR8 as default */
+		if (i >= tpg->res->formats->nformats)
+			fmt->code = MEDIA_BUS_FMT_SBGGR8_1X8;
+
+		fmt->width = clamp_t(u32, fmt->width, 1, 8191);
+		fmt->height = clamp_t(u32, fmt->height, 1, 8191);
+
+		fmt->field = V4L2_FIELD_NONE;
+		fmt->colorspace = V4L2_COLORSPACE_SRGB;
+
+		break;
+	case MSM_TPG_PAD_SRC:
+		*fmt = *__tpg_get_format(tpg, sd_state,
+					 MSM_TPG_PAD_SINK,
+					 which);
+
+		break;
+	}
+}
+
+/*
+ * tpg_enum_mbus_code - Handle format enumeration
+ * @sd: tpg V4L2 subdevice
+ * @cfg: V4L2 subdev pad configuration
+ * @code: pointer to v4l2_subdev_mbus_code_enum structure
+ * return -EINVAL or zero on success
+ */
+static int tpg_enum_mbus_code(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *format;
+
+	if (code->pad == MSM_TPG_PAD_SINK) {
+		if (code->index >= tpg->res->formats->nformats)
+			return -EINVAL;
+
+		code->code = tpg->res->formats->formats[code->index].code;
+	} else {
+		if (code->index > 0)
+			return -EINVAL;
+
+		format = __tpg_get_format(tpg, sd_state,
+					  MSM_TPG_PAD_SINK,
+					  code->which);
+
+		code->code = format->code;
+	}
+
+	return 0;
+}
+
+/*
+ * tpg_enum_frame_size - Handle frame size enumeration
+ * @sd: tpg V4L2 subdevice
+ * @cfg: V4L2 subdev pad configuration
+ * @fse: pointer to v4l2_subdev_frame_size_enum structure
+ * return -EINVAL or zero on success
+ */
+static int tpg_enum_frame_size(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt format;
+
+	if (fse->index != 0)
+		return -EINVAL;
+
+	format.code = fse->code;
+	format.width = 1;
+	format.height = 1;
+	tpg_try_format(tpg, sd_state, fse->pad, &format, fse->which);
+	fse->min_width = format.width;
+	fse->min_height = format.height;
+
+	if (format.code != fse->code)
+		return -EINVAL;
+
+	format.code = fse->code;
+	format.width = -1;
+	format.height = -1;
+	tpg_try_format(tpg, sd_state, fse->pad, &format, fse->which);
+	fse->max_width = format.width;
+	fse->max_height = format.height;
+
+	return 0;
+}
+
+/*
+ * tpg_get_format - Handle get format by pads subdev method
+ * @sd: tpg V4L2 subdevice
+ * @cfg: V4L2 subdev pad configuration
+ * @fmt: pointer to v4l2 subdev format structure
+ *
+ * Return -EINVAL or zero on success
+ */
+static int tpg_get_format(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *format;
+
+	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->which);
+	if (!format)
+		return -EINVAL;
+
+	fmt->format = *format;
+
+	return 0;
+}
+
+/*
+ * tpg_set_format - Handle set format by pads subdev method
+ * @sd: tpg V4L2 subdevice
+ * @cfg: V4L2 subdev pad configuration
+ * @fmt: pointer to v4l2 subdev format structure
+ *
+ * Return -EINVAL or zero on success
+ */
+static int tpg_set_format(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *format;
+
+	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->which);
+	if (!format)
+		return -EINVAL;
+
+	tpg_try_format(tpg, sd_state, fmt->pad, &fmt->format,
+		       fmt->which);
+	*format = fmt->format;
+
+	if (fmt->pad == MSM_TPG_PAD_SINK) {
+		format = __tpg_get_format(tpg, sd_state,
+					  MSM_TPG_PAD_SRC,
+					  fmt->which);
+
+		*format = fmt->format;
+		tpg_try_format(tpg, sd_state, MSM_TPG_PAD_SRC,
+			       format,
+			       fmt->which);
+	}
+	return 0;
+}
+
+/*
+ * tpg_init_formats - Initialize formats on all pads
+ * @sd: tpg V4L2 subdevice
+ * @fh: V4L2 subdev file handle
+ *
+ * Initialize all pad formats with default values.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int tpg_init_formats(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_fh *fh)
+{
+	struct v4l2_subdev_format format = {
+		.pad = MSM_TPG_PAD_SINK,
+		.which = fh ? V4L2_SUBDEV_FORMAT_TRY :
+			      V4L2_SUBDEV_FORMAT_ACTIVE,
+		.format = {
+			.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+			.width = 1920,
+			.height = 1080
+		}
+	};
+
+	return tpg_set_format(sd, fh ? fh->state : NULL, &format);
+}
+
+/*
+ * tpg_set_test_pattern - Set test generator's pattern mode
+ * @tpg: TPG device
+ * @value: desired test pattern mode
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int tpg_set_test_pattern(struct tpg_device *tpg, s32 value)
+{
+	return tpg->res->hw_ops->configure_testgen_pattern(tpg, value);
+}
+
+/*
+ * tpg_s_ctrl - Handle set control subdev method
+ * @ctrl: pointer to v4l2 control structure
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int tpg_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct tpg_device *tpg = container_of(ctrl->handler,
+					      struct tpg_device, ctrls);
+	int ret = -EINVAL;
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEST_PATTERN:
+		ret = tpg_set_test_pattern(tpg, ctrl->val);
+		break;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops tpg_ctrl_ops = {
+	.s_ctrl = tpg_s_ctrl,
+};
+
+/*
+ * msm_tpg_subdev_init - Initialize tpg device structure and resources
+ * @tpg: tpg device
+ * @res: tpg module resources table
+ * @id: tpg module id
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int msm_tpg_subdev_init(struct camss *camss,
+			struct tpg_device *tpg,
+			const struct camss_subdev_resources *res, u8 id)
+{
+	struct platform_device *pdev;
+	struct device *dev;
+	int i, j;
+
+	dev  = camss->dev;
+	pdev = to_platform_device(dev);
+
+	tpg->camss = camss;
+	tpg->id = id;
+	tpg->res = &res->tpg;
+	tpg->res->hw_ops->subdev_init(tpg);
+
+	tpg->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
+	if (IS_ERR(tpg->base))
+		return PTR_ERR(tpg->base);
+
+	tpg->nclocks = 0;
+	while (res->clock[tpg->nclocks])
+		tpg->nclocks++;
+
+	if (tpg->nclocks) {
+		tpg->clock = devm_kcalloc(dev,
+					  tpg->nclocks, sizeof(*tpg->clock),
+					  GFP_KERNEL);
+		if (!tpg->clock)
+			return -ENOMEM;
+
+		for (i = 0; i < tpg->nclocks; i++) {
+			struct camss_clock *clock = &tpg->clock[i];
+
+			clock->clk = devm_clk_get(dev, res->clock[i]);
+			if (IS_ERR(clock->clk))
+				return PTR_ERR(clock->clk);
+
+			clock->name = res->clock[i];
+
+			clock->nfreqs = 0;
+			while (res->clock_rate[i][clock->nfreqs])
+				clock->nfreqs++;
+
+			if (!clock->nfreqs) {
+				clock->freq = NULL;
+				continue;
+			}
+
+			clock->freq = devm_kcalloc(dev,
+						   clock->nfreqs,
+						   sizeof(*clock->freq),
+						   GFP_KERNEL);
+			if (!clock->freq)
+				return -ENOMEM;
+
+			for (j = 0; j < clock->nfreqs; j++)
+				clock->freq[j] = res->clock_rate[i][j];
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * tpg_link_setup - Setup tpg connections
+ * @entity: Pointer to media entity structure
+ * @local: Pointer to local pad
+ * @remote: Pointer to remote pad
+ * @flags: Link flags
+ *
+ * Return 0 on success
+ */
+static int tpg_link_setup(struct media_entity *entity,
+			  const struct media_pad *local,
+			  const struct media_pad *remote, u32 flags)
+{
+	if (flags & MEDIA_LNK_FL_ENABLED)
+		if (media_pad_remote_pad_first(local))
+			return -EBUSY;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_core_ops tpg_core_ops = {
+	.s_power = tpg_set_power,
+};
+
+static const struct v4l2_subdev_video_ops tpg_video_ops = {
+	.s_stream = tpg_set_stream,
+};
+
+static const struct v4l2_subdev_pad_ops tpg_pad_ops = {
+	.enum_mbus_code = tpg_enum_mbus_code,
+	.enum_frame_size = tpg_enum_frame_size,
+	.get_fmt = tpg_get_format,
+	.set_fmt = tpg_set_format,
+};
+
+static const struct v4l2_subdev_ops tpg_v4l2_ops = {
+	.core = &tpg_core_ops,
+	.video = &tpg_video_ops,
+	.pad = &tpg_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops tpg_v4l2_internal_ops = {
+	.open = tpg_init_formats,
+};
+
+static const struct media_entity_operations tpg_media_ops = {
+	.link_setup = tpg_link_setup,
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+/*
+ * msm_tpg_register_entity - Register subdev node for tpg module
+ * @tpg: tpg device
+ * @v4l2_dev: V4L2 device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int msm_tpg_register_entity(struct tpg_device *tpg,
+			    struct v4l2_device *v4l2_dev)
+{
+	struct v4l2_subdev *sd = &tpg->subdev;
+	struct media_pad *pads = tpg->pads;
+	struct device *dev = tpg->camss->dev;
+	int ret;
+
+	v4l2_subdev_init(sd, &tpg_v4l2_ops);
+	sd->internal_ops = &tpg_v4l2_internal_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+		     V4L2_SUBDEV_FL_HAS_EVENTS;
+	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
+		 MSM_TPG_NAME, tpg->id);
+	sd->grp_id = TPG_GUP_ID;
+	v4l2_set_subdevdata(sd, tpg);
+
+	ret = v4l2_ctrl_handler_init(&tpg->ctrls, 1);
+	if (ret < 0) {
+		dev_err(dev, "Failed to init ctrl handler: %d\n", ret);
+		return ret;
+	}
+
+	tpg->testgen_mode = v4l2_ctrl_new_std_menu_items(&tpg->ctrls,
+							 &tpg_ctrl_ops, V4L2_CID_TEST_PATTERN,
+							 tpg->testgen.nmodes, 0, 0,
+							 tpg->testgen.modes);
+
+	if (tpg->ctrls.error) {
+		dev_err(dev, "Failed to init ctrl: %d\n", tpg->ctrls.error);
+		ret = tpg->ctrls.error;
+		goto free_ctrl;
+	}
+
+	tpg->subdev.ctrl_handler = &tpg->ctrls;
+
+	ret = tpg_init_formats(sd, NULL);
+	if (ret < 0) {
+		dev_err(dev, "Failed to init format: %d\n", ret);
+		goto free_ctrl;
+	}
+
+	pads[MSM_TPG_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	pads[MSM_TPG_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
+
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	sd->entity.ops = &tpg_media_ops;
+	ret = media_entity_pads_init(&sd->entity, MSM_TPG_PADS_NUM, pads);
+	if (ret < 0) {
+		dev_err(dev, "Failed to init media entity: %d\n", ret);
+		goto free_ctrl;
+	}
+
+	ret = v4l2_device_register_subdev(v4l2_dev, sd);
+	if (ret < 0) {
+		dev_err(dev, "Failed to register subdev: %d\n", ret);
+		media_entity_cleanup(&sd->entity);
+		goto free_ctrl;
+	}
+
+	return 0;
+
+free_ctrl:
+	v4l2_ctrl_handler_free(&tpg->ctrls);
+
+	return ret;
+}
+
+/*
+ * msm_tpg_unregister_entity - Unregister tpg module subdev node
+ * @tpg: tpg device
+ */
+void msm_tpg_unregister_entity(struct tpg_device *tpg)
+{
+	v4l2_device_unregister_subdev(&tpg->subdev);
+	media_entity_cleanup(&tpg->subdev.entity);
+	v4l2_ctrl_handler_free(&tpg->ctrls);
+}
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.h b/drivers/media/platform/qcom/camss/camss-tpg.h
new file mode 100644
index 0000000000000000000000000000000000000000..25537735e3cabb62c7a0a0e9b1822749a277bed3
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-tpg.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * camss-tpg.h
+ *
+ * Qualcomm MSM Camera Subsystem - TPG Module
+ *
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef QC_MSM_CAMSS_TPG_H
+#define QC_MSM_CAMSS_TPG_H
+
+#include <linux/clk.h>
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mediabus.h>
+#include <media/v4l2-subdev.h>
+
+#define MSM_TPG_PAD_SINK 0
+#define MSM_TPG_PAD_SRC 1
+#define MSM_TPG_PADS_NUM 2
+
+#define DATA_TYPE_RAW_8BIT		0x2a
+#define DATA_TYPE_RAW_10BIT		0x2b
+#define DATA_TYPE_RAW_12BIT		0x2c
+
+#define ENCODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
+#define ENCODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
+#define ENCODE_FORMAT_UNCOMPRESSED_12_BIT	0x3
+#define ENCODE_FORMAT_UNCOMPRESSED_14_BIT	0x4
+#define ENCODE_FORMAT_UNCOMPRESSED_16_BIT	0x5
+#define ENCODE_FORMAT_UNCOMPRESSED_20_BIT	0x6
+#define ENCODE_FORMAT_UNCOMPRESSED_24_BIT	0x7
+
+#define TPG_GUP_ID 0
+#define MSM_TPG_NAME "msm_tpg"
+
+enum tpg_testgen_mode {
+	TPG_PAYLOAD_MODE_DISABLED = 0,
+	TPG_PAYLOAD_MODE_INCREMENTING = 1,
+	TPG_PAYLOAD_MODE_ALTERNATING_55_AA = 2,
+	TPG_PAYLOAD_MODE_RANDOM = 5,
+	TPG_PAYLOAD_MODE_USER_SPECIFIED = 6,
+	TPG_PAYLOAD_MODE_COLOR_BARS = 9,
+	TPG_PAYLOAD_MODE_NUM_SUPPORTED_GEN1 = 9,
+};
+
+struct tpg_testgen_config {
+	enum tpg_testgen_mode mode;
+	const char * const*modes;
+	u8 nmodes;
+};
+
+struct tpg_format_info {
+	u32 code;
+	u8 data_type;
+	u8 encode_format;
+	u8 bpp;
+};
+
+struct tpg_formats {
+	unsigned int nformats;
+	const struct tpg_format_info *formats;
+};
+
+struct tpg_device;
+
+struct tpg_hw_ops {
+	int (*configure_stream)(struct tpg_device *tpg, u8 enable);
+
+	int (*configure_testgen_pattern)(struct tpg_device *tpg, s32 val);
+
+	u32 (*hw_version)(struct tpg_device *tpg);
+
+	int (*reset)(struct tpg_device *tpg);
+
+	void (*subdev_init)(struct tpg_device *tpg);
+};
+
+struct tpg_subdev_resources {
+	u8 lane_cnt;
+	u8 vc_cnt;
+	const struct tpg_formats *formats;
+	const struct tpg_hw_ops *hw_ops;
+};
+
+struct tpg_device {
+	struct camss *camss;
+	u8 id;
+	struct v4l2_subdev subdev;
+	struct media_pad pads[MSM_TPG_PADS_NUM];
+	void __iomem *base;
+	struct camss_clock *clock;
+	int nclocks;
+	struct tpg_testgen_config testgen;
+	struct v4l2_mbus_framefmt fmt[MSM_TPG_PADS_NUM];
+	struct v4l2_ctrl_handler ctrls;
+	struct v4l2_ctrl *testgen_mode;
+	const struct tpg_subdev_resources *res;
+	const struct tpg_format *formats;
+	unsigned int nformats;
+};
+
+struct camss_subdev_resources;
+
+const struct tpg_format_info *tpg_get_fmt_entry(struct tpg_device *tpg,
+						const struct tpg_format_info *formats,
+						unsigned int nformats,
+						u32 code);
+
+int msm_tpg_subdev_init(struct camss *camss,
+			struct tpg_device *tpg,
+			const struct camss_subdev_resources *res, u8 id);
+
+int msm_tpg_register_entity(struct tpg_device *tpg,
+			    struct v4l2_device *v4l2_dev);
+
+void msm_tpg_unregister_entity(struct tpg_device *tpg);
+
+extern const char * const testgen_payload_modes[];
+
+extern const struct tpg_formats tpg_formats_gen1;
+
+extern const struct tpg_hw_ops tpg_ops_gen1;
+
+#endif /* QC_MSM_CAMSS_TPG_H */
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 9d9a62640e25dce0e8d45af9df01bbfd64b9bb4b..a892a87bed8bde8919200d6eac2b7a5338763c0e 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -21,6 +21,7 @@
 #include "camss-csid.h"
 #include "camss-csiphy.h"
 #include "camss-ispif.h"
+#include "camss-tpg.h"
 #include "camss-vfe.h"
 #include "camss-format.h"
 
@@ -52,6 +53,7 @@ struct camss_subdev_resources {
 	char *interrupt[CAMSS_RES_MAX];
 	union {
 		struct csiphy_subdev_resources csiphy;
+		struct tpg_subdev_resources tpg;
 		struct csid_subdev_resources csid;
 		struct vfe_subdev_resources vfe;
 	};
@@ -104,6 +106,7 @@ struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
 	const struct camss_subdev_resources *csiphy_res;
+	const struct camss_subdev_resources *tpg_res;
 	const struct camss_subdev_resources *csid_res;
 	const struct camss_subdev_resources *ispif_res;
 	const struct camss_subdev_resources *vfe_res;
@@ -111,6 +114,7 @@ struct camss_resources {
 	const struct resources_icc *icc_res;
 	const unsigned int icc_path_num;
 	const unsigned int csiphy_num;
+	const unsigned int tpg_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
 };
@@ -121,6 +125,7 @@ struct camss {
 	struct media_device media_dev;
 	struct device *dev;
 	struct csiphy_device *csiphy;
+	struct tpg_device *tpg;
 	struct csid_device *csid;
 	struct ispif_device *ispif;
 	struct vfe_device *vfe;

-- 
2.34.1


