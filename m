Return-Path: <linux-media+bounces-50647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 260F0D1D069
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 09:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8B36300E042
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 08:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B69342C8E;
	Wed, 14 Jan 2026 08:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFnYT7EN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/bidgjj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5291637997A
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 08:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768378164; cv=none; b=OXT3xK2UEcDdtnEDx9ih2B8L3joeii4zC3Wyfcs34bFypoiqQ88j/h44fTNYG7bJPoUDby0Se7iqSeFETNXjqXTZczydAX7t2CfjDkOQv0nB/sv53xZIt7CG1VpZoOmPeBYkcv0ltlzsWmv+12lWG4VbG6q87Ysbkx0Hzp4LnMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768378164; c=relaxed/simple;
	bh=3Gxg5Hr4J9OQ91mGE+xpPQ4JW4dYdbdKSmDAqlBDy8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eovl0rbKkRj0/ZtJ1AGONJHyd6lbUSOKrqNfLHpBuKDa7VFGwcKwmJEEuJyRZhFVnIbVGColA23MZ0veGCAwldiKQ9QSSO3tcspx+JD17z9f+99fZ3BpBpuf15uPFQY4CYbWMU4sCrcAnFdIrWbsUB3y7jzQ8kGXgnNBl0PgmvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFnYT7EN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/bidgjj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jE9L2976516
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 08:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=asPaEIWzLqvntL9JnZUOQmPd5F3UBxFlTc4
	ky2SXtXY=; b=nFnYT7ENx/ugcnPj57TbLbG5LY9MVxRymJROsMuYR30uevcs9OE
	ANRU2nFG4HU8esSNC8paEBzG7DF5zKkYm5lN8z2Kx41762DbTE5my3GUaq+qoT0S
	mJR3uJv0TR64OHRaVUCRQWaMOHQv3dcevD6Phpufz4m8bNsrBaphRuqKo7mKxjxl
	MYpdC1qm5B6lI/2b1a2w1X/+b8dnEEBffCTJ82U1piwLLeb/ru+nvtiHTnTnV6Gq
	k0RQqifKJ+4FWrlUDTduZjMhHMfjAKWrjuSYhGjzyAFQNWbw8pfMfIXC84tCB8UO
	IUhRPlsD1MAoqXtpDbrYtIxMQy0HFjSQuuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnt63tqyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 08:09:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f89b415so172496185a.0
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 00:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768378158; x=1768982958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=asPaEIWzLqvntL9JnZUOQmPd5F3UBxFlTc4ky2SXtXY=;
        b=S/bidgjj6XSmCYFUxBzMd7+NmUZGa/p+HSgqYq3Nq7EsqC/LghAe7fplmRVKzLaFWY
         bPkLtMeEKai/Vzv3JsSqa9fjO4SoVpgvBSwOe8wjWAOm+qgzon0LT/Tsaf81wmJgJpXv
         UwCfjo3c8rfXJM95uoOJj7gZ+3z10xfU/FWuwUfobwhTkKkbmHQX7l8kwkOA1JKiC+QX
         a2yOzPD4ST+abBhxKbOySsQS/y+d9gEOo+XDfyMO6zq5c7eDSWK/eUX0r4EJyp/pMrkC
         ISgj7W4bQBppe4ZunwZ12xprnv43BolpRlb6ISTgEcRmr3d1qprJxhrtzabjmqqTBr4F
         +M3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768378158; x=1768982958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asPaEIWzLqvntL9JnZUOQmPd5F3UBxFlTc4ky2SXtXY=;
        b=l8q+aXge99ofdSpVOoaqp4QTLuba02Cf9w4sZseo3DEHVQD+nEnAs4cp0XOOLm40q1
         9qku+9kIcebxs/9YE38vSgEqx9nZj6ObhiHWyJu0/emU7bfdt4Wn52vHdRKSzimnXqos
         ydgUZmPBO9JFLr6UBpGNGJWCAtiamdZV5DOB4UPkEiCtaqY8wM6x3PhKH6Ursqt8zhCm
         XA4IdDkJYbchn7JxB2KD4IanH3pNzJplEp39B0MrqRfIA6dopuS8Z9zD9j59PvWneVqp
         3Ki/mq2t+4Sr++yx6SzJ03P/1V2p8rzka2fX/R1d1WM0qPHW5IrHN0VXhW0sXJMV8Os+
         lvig==
X-Gm-Message-State: AOJu0YznnHaMREMLAS8Rqdsohdj4mhKCzpAfG+Y9ac17qysmPn5hHtKe
	U7uQPt85Kudg9ngCqW9TgWyAlH8xLJ9E4EDWx92MRWPLNd5bZl+qTrjjnbPQi2q11yubjUQXmmM
	KDCpW8uEq8ztciJuNSdW785RkiVKsYCyIHlADBeWu5FquAIANirTLMBV6vq1hBIFAWw==
X-Gm-Gg: AY/fxX4bt7qEjd48vSZ+BguX97uni+8kNl6wGNLFnKKzeQdEdpafNC27dNOJQG1gDgv
	V9qjFfw6w3TV09rIepGhciPulgdCekfnXkhwJc+fJECmJQ7LrlJJmZxZF9WZ+KfCjYzE8D9YOO/
	PrK+num9ORgTwbTeHim4cdUm7MCS1x02W4JyKEgksKCFNvYqjOxRv3XNu6nLk6pkwP9WQIL90dL
	n4/tkLsnwOqB/TjjlI5YpWArqW4PsJmzwafR5h/OQreyEVtoqwtlo5T4Po9auFZHZ0ViTu/2n6P
	76/ewj0yGIo8tNApRrM57tlypkY125a1Ecar9GP8eYxYSGjyu7c3JZXrNhu+cdkwhg6XadtG8Ku
	027PXYJYt/V+l8E8S9Z9ujZ/rl7HhQkxAQ4yeWg==
X-Received: by 2002:a05:620a:4411:b0:863:42ea:d687 with SMTP id af79cd13be357-8c52fbdbe67mr241604985a.78.1768378158453;
        Wed, 14 Jan 2026 00:09:18 -0800 (PST)
X-Received: by 2002:a05:620a:4411:b0:863:42ea:d687 with SMTP id af79cd13be357-8c52fbdbe67mr241602485a.78.1768378157943;
        Wed, 14 Jan 2026 00:09:17 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8298:6f4c:8c3b:61e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16ffsm49816049f8f.12.2026.01.14.00.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:09:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] media: saa7134: rename i2c_dbg() to saa7134_i2c_dbg()
Date: Wed, 14 Jan 2026 09:09:13 +0100
Message-ID: <20260114080913.11960-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA2MyBTYWx0ZWRfX0PuSX5VeOMKu
 zQkB6NN/Nk9tOqrVhTYaT4Sm0m7lPM+KybXoEWiP+I64w/sP2oRvTsYrIgZyErmj512VV0rvM+L
 w7STmWg5bK7ivAYmN5u+fH5/kShGvp6vyG2H9OZ78bvqrSbDWO9WLS8YzU5YVtleC//9mwHLajO
 N4ezq76kl+oTGjBtIH8tZIbQ3QdR+i6M0B+TUtye9KOqN3m4W+ed59pxW1pmFjgA3QmnwvdP7Ba
 ESaTjo99+pEuIBPrOIh+7mZGpXA1F7l+TpBk3wEjUdAa5VO43LTC+adNZBnvRQVzDc+IwFCQjKI
 1HK5EGX0rIj6R9Fu5XwIPg45EqorZ1hCbjoiIA+oD7lxco+QKzj1Wf5m/kH6wcxmremJUerLmaa
 SH/ponYIQRMF2I/ExB9ww8l7MAB0a1FuMXcaCeJ0yscjIB/owba2xhvUNDh93cBTTnS9Np6FPXi
 SARVVi1YI4+Ay7AHy2Q==
X-Proofpoint-ORIG-GUID: 0pKvqfFW4xoOc74jZshBJx-P_seoIjTN
X-Proofpoint-GUID: 0pKvqfFW4xoOc74jZshBJx-P_seoIjTN
X-Authority-Analysis: v=2.4 cv=EujfbCcA c=1 sm=1 tr=0 ts=69674f2f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=LDBv8-xUAAAA:8 a=Y985koWVPDaUQ3OhJb8A:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140063

Ahead of introducing I2C-adapter-specific printk() helpers, preemptively
avoid a conflict with the upcoming i2c_dbg() and rename the local macro
in the saa7134 driver to saa7134_i2c_dbg().

Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
We've started working on changes to i2c core that should allow us to
eventually address the object-lifetime issues[1] in the subsystem. One of
the prerequisite steps is to hide all dereferences of struct device
embedded in struct i2c_adapter with dedicated wrappers. To that end, we
want to introduce a set of i2c_adapter-specific printk() helpers[2]. The
name i2c_dbg() conflicted with the macro defined in this driver[3].
Wolfram suggested[4] that since the i2c changes will not make v7.0, it's
worth renaming the macro here to free up the shorter name for a use-case
where there'll be a lot more users. It would be great if this could make
the v7.0 merge window.

[1] https://lore.kernel.org/all/aWYYZEPX-_1GfQtL@ninjato/
[2] https://lore.kernel.org/all/20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com/
[3] https://lore.kernel.org/all/202512260206.C1TExj8d-lkp@intel.com/
[4] https://lore.kernel.org/all/aWYiJbtueA8g3srn@ninjato/

Changes in v2:
- Use the "saa7134" prefix to stay in the namespace and avoid any future
  clashes

 drivers/media/pci/saa7134/saa7134-i2c.c | 26 ++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-i2c.c b/drivers/media/pci/saa7134/saa7134-i2c.c
index 04e85765373e..1164e91cbb7b 100644
--- a/drivers/media/pci/saa7134/saa7134-i2c.c
+++ b/drivers/media/pci/saa7134/saa7134-i2c.c
@@ -28,7 +28,7 @@ static unsigned int i2c_scan;
 module_param(i2c_scan, int, 0444);
 MODULE_PARM_DESC(i2c_scan,"scan i2c bus at insmod time");
 
-#define i2c_dbg(level, fmt, arg...) do { \
+#define saa7134_i2c_dbg(level, fmt, arg...) do { \
 	if (i2c_debug == level) \
 		printk(KERN_DEBUG pr_fmt("i2c: " fmt), ## arg); \
 	} while (0)
@@ -84,20 +84,20 @@ static inline enum i2c_status i2c_get_status(struct saa7134_dev *dev)
 	enum i2c_status status;
 
 	status = saa_readb(SAA7134_I2C_ATTR_STATUS) & 0x0f;
-	i2c_dbg(2, "i2c stat <= %s\n", str_i2c_status[status]);
+	saa7134_i2c_dbg(2, "i2c stat <= %s\n", str_i2c_status[status]);
 	return status;
 }
 
 static inline void i2c_set_status(struct saa7134_dev *dev,
 				  enum i2c_status status)
 {
-	i2c_dbg(2, "i2c stat => %s\n", str_i2c_status[status]);
+	saa7134_i2c_dbg(2, "i2c stat => %s\n", str_i2c_status[status]);
 	saa_andorb(SAA7134_I2C_ATTR_STATUS,0x0f,status);
 }
 
 static inline void i2c_set_attr(struct saa7134_dev *dev, enum i2c_attr attr)
 {
-	i2c_dbg(2, "i2c attr => %s\n", str_i2c_attr[attr]);
+	saa7134_i2c_dbg(2, "i2c attr => %s\n", str_i2c_attr[attr]);
 	saa_andorb(SAA7134_I2C_ATTR_STATUS,0xc0,attr << 6);
 }
 
@@ -160,7 +160,7 @@ static int i2c_reset(struct saa7134_dev *dev)
 	enum i2c_status status;
 	int count;
 
-	i2c_dbg(2, "i2c reset\n");
+	saa7134_i2c_dbg(2, "i2c reset\n");
 	status = i2c_get_status(dev);
 	if (!i2c_is_error(status))
 		return true;
@@ -198,7 +198,7 @@ static inline int i2c_send_byte(struct saa7134_dev *dev,
 //	dword |= 0x40 << 16;  /* 400 kHz */
 	dword |= 0xf0 << 24;
 	saa_writel(SAA7134_I2C_ATTR_STATUS >> 2, dword);
-	i2c_dbg(2, "i2c data => 0x%x\n", data);
+	saa7134_i2c_dbg(2, "i2c data => 0x%x\n", data);
 
 	if (!i2c_is_busy_wait(dev))
 		return -EIO;
@@ -220,7 +220,7 @@ static inline int i2c_recv_byte(struct saa7134_dev *dev)
 	if (i2c_is_error(status))
 		return -EIO;
 	data = saa_readb(SAA7134_I2C_DATA);
-	i2c_dbg(2, "i2c data <= 0x%x\n", data);
+	saa7134_i2c_dbg(2, "i2c data <= 0x%x\n", data);
 	return data;
 }
 
@@ -237,12 +237,12 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
 		if (!i2c_reset(dev))
 			return -EIO;
 
-	i2c_dbg(2, "start xfer\n");
-	i2c_dbg(1, "i2c xfer:");
+	saa7134_i2c_dbg(2, "start xfer\n");
+	saa7134_i2c_dbg(1, "i2c xfer:");
 	for (i = 0; i < num; i++) {
 		if (!(msgs[i].flags & I2C_M_NOSTART) || 0 == i) {
 			/* send address */
-			i2c_dbg(2, "send address\n");
+			saa7134_i2c_dbg(2, "send address\n");
 			addr  = msgs[i].addr << 1;
 			if (msgs[i].flags & I2C_M_RD)
 				addr |= 1;
@@ -265,7 +265,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
 		}
 		if (msgs[i].flags & I2C_M_RD) {
 			/* read bytes */
-			i2c_dbg(2, "read bytes\n");
+			saa7134_i2c_dbg(2, "read bytes\n");
 			for (byte = 0; byte < msgs[i].len; byte++) {
 				i2c_cont(1, " =");
 				rc = i2c_recv_byte(dev);
@@ -286,7 +286,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
 			}
 		} else {
 			/* write bytes */
-			i2c_dbg(2, "write bytes\n");
+			saa7134_i2c_dbg(2, "write bytes\n");
 			for (byte = 0; byte < msgs[i].len; byte++) {
 				data = msgs[i].buf[byte];
 				i2c_cont(1, " %02x", data);
@@ -296,7 +296,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
 			}
 		}
 	}
-	i2c_dbg(2, "xfer done\n");
+	saa7134_i2c_dbg(2, "xfer done\n");
 	i2c_cont(1, " >");
 	i2c_set_attr(dev,STOP);
 	rc = -EIO;
-- 
2.47.3


