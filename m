Return-Path: <linux-media+bounces-44786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 52732BE65C3
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 07:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CCF893541D8
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 05:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8609130E0E3;
	Fri, 17 Oct 2025 05:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LEMqmH2h"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACA930DEA4
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 05:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760677579; cv=none; b=rnf3G/YB3uOsbbLoGw/7Fx8WRGEceWF0dI10wKrM29rO3yVsUhT3d79LaNPNLqAnAdZnIb0SySJmFLVLsNb3gN2ny8reMNb2+4z2SCRloth/I3Hhic53noTpMu+jLkB0MVPdsec1uhLajB4aQtla+5Iz6fgdmkRCa114FZV/6cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760677579; c=relaxed/simple;
	bh=GyByrX/SU0O+few+EwG8B0kFmCZ8Wrg4XSxHLmS+pV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fm/UlGzy0KyN6mnLss4ADI4Rs9pTsoeHz3XdcHtqTn0KlOi9UsTCa9kdUNG5GDA3FjZCADA4n4pvk2bMJkp5FRvjmfsf0r6jWKnOakPpcVDlhp7i/STRnOoZrjKhhWVd+6AVcM2eYH0ZDsUCclZ3Wy+e9c0eh1I+nCcwlwb5EF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LEMqmH2h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLdGD006738
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 05:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z8fQboa7kH2ooxeNlcCWSoboGIwEnHH/IbLSmZ1wIGQ=; b=LEMqmH2hJ2MaNx+3
	R/7c40SvFHl4RQC/SJrTKdlt3orUl3z7aRs9DPpTVIzxvJK+2Ot5a5Ls2XDkJUo7
	q4VFebH6MmiMH1VSnc+y5/zkMemFrT6FFc48xpEeOUGOhKg/K5RMjfJK2gEyjkcB
	W1JK6dNXBr7/hDDTVR7tBZt5IESWB41IhlvCnALXuY8YS1QO/asFbkFVYxLpuVla
	ZpUVy/fUlZv+7BNqFpB2eXAh1iriaxpRWzMpJLA4GUnp04sMGC4TjtIUFLTsFJHz
	GbmjOPFfoj7S/5mCILjPRe2knnBNj4uBABj97bQQK+JNv1Yg31D3OoCULkJzms8Z
	ErNrPA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff12vgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 05:06:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87c1558a74aso65989216d6.2
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 22:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760677574; x=1761282374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8fQboa7kH2ooxeNlcCWSoboGIwEnHH/IbLSmZ1wIGQ=;
        b=Lq5Ev6JTF/xzWvDlU/HAPhkYQd1gkzqzCSH1azCquUL5sQjYdT78nQRSc0lHNcAbWz
         kMZnlkAWlg8lrNQJ4uBynjmbTphhyMqVcJdkE5sYE6ZTvc458LxP14iB3gFlNE1ijq+H
         P77XSX5e3fvg/a934D3w0Mhn1HA10Nzcev1SpPRxB+RkmKh7jHfRMkUEf+/b8N/0/D8p
         savrdtl2XM6psObMiOfNCXDQTEkQJtOU+5Yd6fCmFBgB4dSIBcW6h+DaXjo0dRHPreNb
         8o0V4KmxujnjYitlxakqcjA8DRkLStWB4yjkAmXqtG4aSEhWCpbTbDvjYEVIYHlOuUl5
         mVew==
X-Forwarded-Encrypted: i=1; AJvYcCXVLyu8n6gqWcoMy+u6EYqpnurs8XkF2stxVNxi20Md+jaeCHuAeFafNN4ryFdO/TphPrWy3k+krVWfyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3L3eOldzO53zZiipIBYKezb/Zij+2Wx8la1XnHGRODJ1FgOAE
	4c8leIR4FqdLYcFaynvb3cznhXvp6n9AAcUoKbzDiqIzfjOdMDNQLVD4++fV2ClBy3SxGxb176B
	uGW3rob694VO6piliESXEz002Ye0jcOAsFIqVhhFHQT+REXOyrDlWFxSORJ06onIh5A==
X-Gm-Gg: ASbGnctDoyP0HrvT2TC93LncgSfgKbHJ1BIkoYWWjRcrUQDsjFLqpDOVwTtD/dk0UYo
	QC2mMJPNL5JzWYDJi751Vt79D0OeMVs6JTO7ItNPw/2lWeozw2FwKUQ+4ywJFkgaHF5b5IDucj9
	BW9c6BPkxvK9dQyDi7p3PzZ93Nh0/U+OcmS1Yb6txK0vpjF/XPgfcU7qSRQr87SgkwTPTwXiD1y
	DV5sulzycvJmiErzOHLWIScE8Uatgeat7jtYWfwF07mkSIbFI/RIra0tTAfxSD8B1xtmT9GVQXt
	ptzTHkp7gCQsYx+t+2fH8G3x0n6i00w+VksL4uA8duHsJUAHQg1Mfq5kYLnRmV3IdL5ReAeCrQs
	Y6jmw+aCeNUeQx3XB1x3xHfmUUK2cDuL+TdFU3Dd374VeH4JyykvqZV2WPRRUXbJiyw==
X-Received: by 2002:a05:6214:258c:b0:7a9:3d3b:fe95 with SMTP id 6a1803df08f44-87c2057df3bmr39191866d6.19.1760677574283;
        Thu, 16 Oct 2025 22:06:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaBH1pH5LCCOh8aDT6MLEDhSWh9f8TeAMAFTND3J5UBdi6bTgzPXfbEIR/QSU3CaTkAMSJZA==
X-Received: by 2002:a05:6214:258c:b0:7a9:3d3b:fe95 with SMTP id 6a1803df08f44-87c2057df3bmr39191576d6.19.1760677573728;
        Thu, 16 Oct 2025 22:06:13 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0128c9d8sm57641916d6.33.2025.10.16.22.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 22:06:13 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 13:06:01 +0800
Subject: [PATCH v5 1/3] media: qcom: camss: Add common TPG support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-camss_tpg-v5-1-cafe3ad42163@oss.qualcomm.com>
References: <20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com>
In-Reply-To: <20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760677563; l=24051;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=GyByrX/SU0O+few+EwG8B0kFmCZ8Wrg4XSxHLmS+pV4=;
 b=ovWS+RSkprBdvnPFA/vjoGXhOFDfRKMumspVJ+qdgyM3r7uUkzmf+LXj+BlHF/WPZzhxtqATn
 jYofJmFTi0sDG1pq5UGRfcnGcw7P+RpUaBN9huIcab8n2lirYjVotE9
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX3cOl71V/W2Bp
 1pG7+jThgKrnRWor/oWECePcxOjg86ad9jmZQHHWd4eyJZTgqVsFAl536cOojKHE/aTnpBBe/kY
 lkcM+uLsFCXhFV3UXvVzVvKrrUgL0ZG0C688NT8ubb6fa8/4f0wa8WxmZ/lXR3E6wJU8tyPgNcj
 p7YZday44tC6cWPXHnCOj97vnrQZHAXmNtgimvnV9CC5Kxf+etcqCGosHfu9t69PVdE+hV0mN0j
 VF6AEkgiMrnJmG7kn0zy9IyFBFwQoSwINzMSe/CW/LEGJReyOyL/rc9W0rXkvMxmafUvNy5Uvrb
 oITefLPUxgj83SJuHh9zAveW8xeDJQLRwxeF/bSIg==
X-Proofpoint-GUID: UjHuoKdaE3s4CQOv9IOvmZkZfTdbvrZn
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68f1cec8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9-4OygZIhI6akIEH2MEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: UjHuoKdaE3s4CQOv9IOvmZkZfTdbvrZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Introduce a new common Test Pattern Generator (TPG) implementation for
Qualcomm CAMSS. This module provides a generic interface for pattern
generation that can be reused by multiple platforms.

Unlike CSID-integrated TPG, this TPG acts as a standalone block
that emulates both CSIPHY and sensor behavior, enabling flexible test
patterns without external hardware.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 drivers/media/platform/qcom/camss/camss-tpg.c | 696 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h | 125 +++++
 drivers/media/platform/qcom/camss/camss.h     |   5 +
 4 files changed, 827 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 23960d02877de132b63ebfe88affe55576256829..0eda4b18ad0e93f5e63135fabd5a02ae67bcd5ad 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -26,5 +26,6 @@ qcom-camss-objs += \
 		camss-vfe.o \
 		camss-video.o \
 		camss-format.o \
+		camss-tpg.o \
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/media/platform/qcom/camss/camss-tpg.c
new file mode 100644
index 0000000000000000000000000000000000000000..c436cdb7041b555ce9458270eb46996e78f1d5eb
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-tpg.c
@@ -0,0 +1,696 @@
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
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
+	},
+	{
+		MEDIA_BUS_FMT_Y8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
+	},
+	{
+		MEDIA_BUS_FMT_Y10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
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
+	dev_warn_once(dev, "Unknown format\n");
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
+	tpg->res->hw_ops->configure_stream(tpg, enable);
+
+	return 0;
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
+ * Rreturn 0 on success
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
index 0000000000000000000000000000000000000000..c40c10cc4ad1d7967c5d9dd878a8d69177b2281f
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-tpg.h
@@ -0,0 +1,125 @@
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
+	void (*configure_stream)(struct tpg_device *tpg, u8 enable);
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
index a70fbc78ccc307c0abc2f3c834fb1e2dafd83c6b..9a66f3a90c02b4cc475c4d3033205feb7e98f5d3 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -21,6 +21,7 @@
 #include "camss-csid.h"
 #include "camss-csiphy.h"
 #include "camss-ispif.h"
+#include "camss-tpg.h"
 #include "camss-vfe.h"
 #include "camss-format.h"
 
@@ -51,6 +52,7 @@ struct camss_subdev_resources {
 	char *interrupt[CAMSS_RES_MAX];
 	union {
 		struct csiphy_subdev_resources csiphy;
+		struct tpg_subdev_resources tpg;
 		struct csid_subdev_resources csid;
 		struct vfe_subdev_resources vfe;
 	};
@@ -101,6 +103,7 @@ struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
 	const struct camss_subdev_resources *csiphy_res;
+	const struct camss_subdev_resources *tpg_res;
 	const struct camss_subdev_resources *csid_res;
 	const struct camss_subdev_resources *ispif_res;
 	const struct camss_subdev_resources *vfe_res;
@@ -108,6 +111,7 @@ struct camss_resources {
 	const struct resources_icc *icc_res;
 	const unsigned int icc_path_num;
 	const unsigned int csiphy_num;
+	const unsigned int tpg_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
 };
@@ -118,6 +122,7 @@ struct camss {
 	struct media_device media_dev;
 	struct device *dev;
 	struct csiphy_device *csiphy;
+	struct tpg_device *tpg;
 	struct csid_device *csid;
 	struct ispif_device *ispif;
 	struct vfe_device *vfe;

-- 
2.34.1


