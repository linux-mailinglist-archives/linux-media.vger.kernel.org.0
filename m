Return-Path: <linux-media+bounces-50553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7125CD189BA
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 13:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB5B0308791D
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 11:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD9938E13A;
	Tue, 13 Jan 2026 11:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDIebReF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="et1r2Egn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7FE38BF9A
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 11:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305485; cv=none; b=YHCKJZgkxFmKxT8ZaCWTxs4Q2fgvgxlKW+G8n769j7m5fg3DrIeOy0LRs0B+22gYnN0TrYkrhQMHgmujzoEkQ1YO06id85PU8w3sxZUrTIyoPTRlKmSVjbvvBs54eq16wO0rmPHRzAVpazDM4TGZnawE5VKnwuwlIARppTmGOFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305485; c=relaxed/simple;
	bh=PzlFUragxEL6voHDkuSpDrumS6xyKCi5Z9r8NZBbHH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MRhATNQzaEFgNXwkaYzffTTpzyQ3qMBY2RvKJ4yGKTv7NqLtAlZmE3zbvoVFrR1xGk5C3Yn5sXCEKtHhQ/KtTT1XIGnOKBSdV/5nOiUAii56u8nLKp+UruB3+Ucnl+oLjwG14aTFevqv7971DimQiGeu8bdEnZARyvyGyMldJdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDIebReF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=et1r2Egn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5nMvO3734990
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 11:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=t6ey+DdlEWGApDfiXUP9KTm2NRg9KCJSLdD
	BwK3hchA=; b=CDIebReF1I6krg4NAaMYOYUGHj03OrOtkRm10+/ej0HBn9fHyE/
	eZLfOltLSuGUVz7Tuk3v3RtwYsgi3L9Qs9rjVc65BQwe9TTG5o68yiY4ySGk1I3S
	isnXjNRMX4DoD6oXB1EIi/kLe0rke6hLtCzz+qhqRtxHOkjpgyVTzBRzcWHKKead
	rwNJsBr8K/24YMAEZnPa4BI4OS/vNJSVxReyA9XIepCcq3muvVKWdBbgKxO6y2Uf
	2Q9ki3wKrAG3tpnEyPOWkRYo2efTsPPCKjmZEbnxtRLvrRHNGp18WtUgOT1OmEQF
	YGMxgP3or1Qj9PPSJOPABvvL4MX6pMc64XA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng8793w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 11:58:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52c67f65cso57268285a.1
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 03:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768305482; x=1768910282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t6ey+DdlEWGApDfiXUP9KTm2NRg9KCJSLdDBwK3hchA=;
        b=et1r2EgnnDj1/ODQawT1X6jKt9tg8J8tJ191ZsfBkFICH/woN7FVXenisX3kjzl4FJ
         1nJ3U8jI4iQb7tzTCsmLjEN2RIFlNHunmCT+PQP0GJucfgtogLKwiswxWlgQEXmcTuMe
         1APgmIqlPOCSAdnDuGB3jjYbtkqFMnFQPm5hDv92DYHyPcwdqGWQPilW4uTvVRGbyvTn
         Jo4SW7B2rcGCxAo05TCfhOquN0Rkkkjdxo3fScpWlWoQ1G8dZdH09GNDCWbGxSSail9q
         1r1mzZRsAOgGA93MzfdHGGZJQhESES+/eLH9DXqnToJTU7pkg2ISn2TF4P3wWlbHGjPa
         NaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768305482; x=1768910282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6ey+DdlEWGApDfiXUP9KTm2NRg9KCJSLdDBwK3hchA=;
        b=mQgX/rM9zgJT5+7aEV28pd8mTwt5CnbEk9MMDlGe4YtES0NNEo0DHiurqnBNGyhCKx
         1A0kDbbzCbiFS55JmZoWxmqPYORcvnJioJe9AGAMr2uy03xP6H5hFYOLWHJ6YQNz5AhO
         7qA/DKKMjbxWjLvgTyCNtamV82odH/hDWVjoszOAJeNtUlEpI1CjUgHFSlU3VWkLQkbA
         Qzh1Y2LW8aU3ThdLjzlWrMKKdEMUxaMbvRRf4zv2tbpkVj8Hthys1Erjs0EyAEW+MJhE
         n2lTACmfIV1qYysmWgEqBexAZo55LOKkZkFLJpbr50KJj9YilJyZ6EBK5LRIgA8Pqkze
         qh5Q==
X-Gm-Message-State: AOJu0YyqR6Ssh1vS4S8QHgNLBc0gldkrYkHAPBCIu0DUsw6Uccj420xy
	5+I55GE+/mmf/SmuewJdJT2Xi+Dns4v/aerfBfaniaQieniu2I5/YTLcteg27N2CGRRXF6iqZfz
	ud3AXW3bItce6/sJULKuT1pVrvfwOBlSk0qJBkMBpZoYEeV6lhoQVa4DMCxpmh9mfEw==
X-Gm-Gg: AY/fxX7NZK2nqcuJCgiSYiAG2zdQ/uZvlAM3WHTPMq9GIX6T15Eu/A0+5jXzzrk+RSF
	QvzsVUjYBi41ICZMX6bcPWKlwjyBP1E1cK3b/sG1cIPbIj60XFMq+a5msORcdpXwBhW5aXQWYiT
	aDU7ogjONUaTlzpjb0drzHPeXE4xpK0Z74+ZDgjvw3MsbvOg6Aldcb0w2wfh/qaLYeNCNwHxLEr
	tMR5qwFUBXVYBl2F8VMBtTGzZJQC2BOyGkA0crQpw78gw0ILFNXN0dGOXqx1BbGsFT/vZ6RTIj2
	TYEqdUCDbG8GZgjqqgzjuBA5s5zXs9a2vWZTr6MK4ZJdyKK590Xldd9y4slcK2PlBtARdja8uyT
	g+fUwDdq9gDMBygfEKzlBGPYPF0mc7I/8ulRT4Q==
X-Received: by 2002:a05:620a:2550:b0:8b2:730f:134b with SMTP id af79cd13be357-8c3893f5011mr3106058685a.50.1768305481877;
        Tue, 13 Jan 2026 03:58:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6Nx3aXWqZfhdyXPM8+TvlenB2gKBysjhxo8UG6QakSE/Dklhmd0O1EZd4msUVtV7L9ILfuA==
X-Received: by 2002:a05:620a:2550:b0:8b2:730f:134b with SMTP id af79cd13be357-8c3893f5011mr3106054385a.50.1768305481080;
        Tue, 13 Jan 2026 03:58:01 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bff4:6cab:7ac1:4ace])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e60dasm570913766b.63.2026.01.13.03.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 03:58:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] media: saa7134: rename i2c_dbg() to i2c_debug()
Date: Tue, 13 Jan 2026 12:57:53 +0100
Message-ID: <20260113115753.63291-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEwMCBTYWx0ZWRfX0wJsoyfuFahW
 hAUpiyT046tXJF7dYU8ZuWqCHn9A7NewLbHgx1fv05yUwrJ5TElS8Zx+58ZPLSy4HYXWB8ifgCN
 QEjMI5ankDPqIlpQe+RYJN6o4ch6b+OpJmL5RhdZi/W8V/qy0yKNjk4HE3TgP4UrXwvRGRLxwwL
 qJ0fdxvxRVDRU/gOu47SQ3Rs941uq2wmIZ0Nhq6UU0W6rGFMM22qv+v9o7m1Zk5d5ALaSi/jCKq
 SyDl/3yubwGP5gmghO8LpvG5JhL4P8NFOe/5/Pd8Zg6WL7ZzgDcdqH5LbOiTYxi59MDlBGtdzq6
 4jCFcav+CsbrBtWZOwbGzKKTy3Pj49bNoy2+M0OMQ3cd3QRWwQP5jrfHpb8AarIX3YMlpT9BEGG
 QAkHCHC1MrYHXGS+AWV2R1fvsAKUp8RCIIYZS5gYkIbW88Vm2lrHcGycSzS+9zBMweoay/tQy1o
 1RIEJWSnFsOrNF4Ksfw==
X-Proofpoint-ORIG-GUID: -FmDnNaXhxFvPTdNsIBEXJwUkGk1GbrB
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=6966334a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=LDBv8-xUAAAA:8 a=IQ8EuZyKHWAnxAFpXOcA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-GUID: -FmDnNaXhxFvPTdNsIBEXJwUkGk1GbrB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130100

Ahead of introducing I2C-adapter-specific printk() helpers, preemptively
avoid a conflict with the upcoming i2c_dbg() and rename the local macro
in the saa7134 driver to i2c_debug().

Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
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

 drivers/media/pci/saa7134/saa7134-i2c.c | 26 ++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-i2c.c b/drivers/media/pci/saa7134/saa7134-i2c.c
index 04e85765373e..af83081b5437 100644
--- a/drivers/media/pci/saa7134/saa7134-i2c.c
+++ b/drivers/media/pci/saa7134/saa7134-i2c.c
@@ -28,7 +28,7 @@ static unsigned int i2c_scan;
 module_param(i2c_scan, int, 0444);
 MODULE_PARM_DESC(i2c_scan,"scan i2c bus at insmod time");
 
-#define i2c_dbg(level, fmt, arg...) do { \
+#define i2c_debug(level, fmt, arg...) do { \
 	if (i2c_debug == level) \
 		printk(KERN_DEBUG pr_fmt("i2c: " fmt), ## arg); \
 	} while (0)
@@ -84,20 +84,20 @@ static inline enum i2c_status i2c_get_status(struct saa7134_dev *dev)
 	enum i2c_status status;
 
 	status = saa_readb(SAA7134_I2C_ATTR_STATUS) & 0x0f;
-	i2c_dbg(2, "i2c stat <= %s\n", str_i2c_status[status]);
+	i2c_debug(2, "i2c stat <= %s\n", str_i2c_status[status]);
 	return status;
 }
 
 static inline void i2c_set_status(struct saa7134_dev *dev,
 				  enum i2c_status status)
 {
-	i2c_dbg(2, "i2c stat => %s\n", str_i2c_status[status]);
+	i2c_debug(2, "i2c stat => %s\n", str_i2c_status[status]);
 	saa_andorb(SAA7134_I2C_ATTR_STATUS,0x0f,status);
 }
 
 static inline void i2c_set_attr(struct saa7134_dev *dev, enum i2c_attr attr)
 {
-	i2c_dbg(2, "i2c attr => %s\n", str_i2c_attr[attr]);
+	i2c_debug(2, "i2c attr => %s\n", str_i2c_attr[attr]);
 	saa_andorb(SAA7134_I2C_ATTR_STATUS,0xc0,attr << 6);
 }
 
@@ -160,7 +160,7 @@ static int i2c_reset(struct saa7134_dev *dev)
 	enum i2c_status status;
 	int count;
 
-	i2c_dbg(2, "i2c reset\n");
+	i2c_debug(2, "i2c reset\n");
 	status = i2c_get_status(dev);
 	if (!i2c_is_error(status))
 		return true;
@@ -198,7 +198,7 @@ static inline int i2c_send_byte(struct saa7134_dev *dev,
 //	dword |= 0x40 << 16;  /* 400 kHz */
 	dword |= 0xf0 << 24;
 	saa_writel(SAA7134_I2C_ATTR_STATUS >> 2, dword);
-	i2c_dbg(2, "i2c data => 0x%x\n", data);
+	i2c_debug(2, "i2c data => 0x%x\n", data);
 
 	if (!i2c_is_busy_wait(dev))
 		return -EIO;
@@ -220,7 +220,7 @@ static inline int i2c_recv_byte(struct saa7134_dev *dev)
 	if (i2c_is_error(status))
 		return -EIO;
 	data = saa_readb(SAA7134_I2C_DATA);
-	i2c_dbg(2, "i2c data <= 0x%x\n", data);
+	i2c_debug(2, "i2c data <= 0x%x\n", data);
 	return data;
 }
 
@@ -237,12 +237,12 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
 		if (!i2c_reset(dev))
 			return -EIO;
 
-	i2c_dbg(2, "start xfer\n");
-	i2c_dbg(1, "i2c xfer:");
+	i2c_debug(2, "start xfer\n");
+	i2c_debug(1, "i2c xfer:");
 	for (i = 0; i < num; i++) {
 		if (!(msgs[i].flags & I2C_M_NOSTART) || 0 == i) {
 			/* send address */
-			i2c_dbg(2, "send address\n");
+			i2c_debug(2, "send address\n");
 			addr  = msgs[i].addr << 1;
 			if (msgs[i].flags & I2C_M_RD)
 				addr |= 1;
@@ -265,7 +265,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
 		}
 		if (msgs[i].flags & I2C_M_RD) {
 			/* read bytes */
-			i2c_dbg(2, "read bytes\n");
+			i2c_debug(2, "read bytes\n");
 			for (byte = 0; byte < msgs[i].len; byte++) {
 				i2c_cont(1, " =");
 				rc = i2c_recv_byte(dev);
@@ -286,7 +286,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
 			}
 		} else {
 			/* write bytes */
-			i2c_dbg(2, "write bytes\n");
+			i2c_debug(2, "write bytes\n");
 			for (byte = 0; byte < msgs[i].len; byte++) {
 				data = msgs[i].buf[byte];
 				i2c_cont(1, " %02x", data);
@@ -296,7 +296,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
 			}
 		}
 	}
-	i2c_dbg(2, "xfer done\n");
+	i2c_debug(2, "xfer done\n");
 	i2c_cont(1, " >");
 	i2c_set_attr(dev,STOP);
 	rc = -EIO;
-- 
2.47.3


