Return-Path: <linux-media+bounces-62068-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHkfC//HC2pSNQUAu9opvQ
	(envelope-from <linux-media+bounces-62068-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:16:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CDC57658D
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46AA73024114
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 02:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD3E3115A2;
	Tue, 19 May 2026 02:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="JzFXkKcI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BFF233704;
	Tue, 19 May 2026 02:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156959; cv=none; b=KzHDdo+gZ8beUmzn4H5i5vQQcm0VQgsJ7kt1nyjhLFu5W9YU1Kva17pLjuKIw+sqSMLDtCRSa9PaE9Zx0F8GdFjDsfL58AO360KAFoRYKjVnDgE8q4dB+81SMVfIa1Wxb/LrIaMAHahtoubPlK4iZQsI6E7Ni3+XR5W9oU7YrEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156959; c=relaxed/simple;
	bh=/6hHBefd2ImbRCT1ptXUBkKVXhF+dPvymYXxJJ/MHAQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PVb3iLfbOPZNw1DwecPDHMji+yQF6+qr6HdYd0a9LAr0eVacF9j+Gu2/YFxHIn+GjV2L/QPe/MOgwyb4M/XEs0RweX7dlfWR+J0JZ5tx2rTxPPh7UTzB8IbwY6tE08PpjmvFXn/BOo6BW0dDUq4L6XtvQDg/EYPaXJwhL8BmKNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=JzFXkKcI; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J1D9Me2659506;
	Mon, 18 May 2026 19:15:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=a2ofuUey9
	4uIPVGQZ9ZjZCmKBWqDPU4V1Ap398N/gX4=; b=JzFXkKcIsNSUdCfg51SyF/bom
	TDLPOIjw84vTk2nZnJf6asugCWhlMezM/adcvE6y1pWWg1yB+nf6u7pa2GrnUtgF
	OVyLfyJf4FukrM2/j4+jx9O+R/Gzhy6zlneNFsLIeJPE2MHQozTqq+jc0GQPW9Ig
	fcZLxmmf2w1BFHuOag7x8jxaibgH46ijhD3pgMdFAxbXbZchtOVT6QBQIT00cWB+
	IRXE9RuvADJGwq+Ok1xjh6fyI2ab5ZLVxjQ3UR1KXl9LPdotTz/3XSrX5U/yI84R
	WHJ+OOFskuHgM3LAdUY7BoyyD3JKnBvanjb4FW7rcYUWt4tPtpjcwPCuzoLrg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3gan7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 18 May 2026 19:15:40 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 18 May 2026 19:15:40 -0700
Received: from pek-yzhou-d3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 18 May 2026 19:15:37 -0700
From: Yun Zhou <yun.zhou@windriver.com>
To: <mchehab@kernel.org>, <kees@kernel.org>, <hverkuil+cisco@kernel.org>,
        <ribalda@chromium.org>, <sakari.ailus@linux.intel.com>,
        <linma@zju.edu.cn>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: dvb-core: fix use-after-free in dvb_frontend_open()
Date: Tue, 19 May 2026 10:15:37 +0800
Message-ID: <20260519021537.3807666-1-yun.zhou@windriver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: AkrqjuwkXb0z0EygPBJxxqGZHK6SrSHr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAxOSBTYWx0ZWRfXwuszOISd/8HS
 a+CG6qDsx98E/G8REYaBvcSSo9aG/K6/I75dPlZ2Fhmjr1zIyjWgyMF3hBnRxwkvG8xgcXvf3L7
 CuiyUegyyuUpWm0IZdnDCFWUrZ+8SgW1PcpiUZxEHWIeBbXM950Nrc1JlEgF/8OgQwMguQvQJdo
 FVMNOjFijdg5R8FF+zIv5nI0v5f3QT0eLus9vHyZ9W7FIpwludDBxCtrOtYqIyg3MUgK4t5Q7a5
 WibImj/VaJgBin8IPT7EClNCOdyPqF1tXOVPmPTOrM55Qr6NcISJKjMQz//2bzad+8gvjpKBQqd
 O9KgxwyEAYR8/i1J5RJmvzPEXkxnXuh/OFBF7ikQXNq7l78bEypeZ/6z1RdlNt6mUAKQOkvtWgv
 5Qua951q9ejQy94cplyhCAw6eq9OkNTC+p10lq6f96vebNaoDG4DV7vszTJkSe3k/vWuSA4oSj+
 hlC125o+QHhzrKi1Y7w==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0bc7cc cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8
 a=Rw0Jph7aeMS_YbH_6PgA:9 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: AkrqjuwkXb0z0EygPBJxxqGZHK6SrSHr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190019
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62068-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[yun.zhou@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 80CDC57658D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dvb_frontend_open() calls dvb_generic_release() in its error path after
dvb_generic_open() succeeds. dvb_generic_release() drops the device
reference via dvb_device_put(), and then dvb_device_open() drops it again
in its error handling, causing a use-after-free and refcount underflow.

Fix this by introducing __dvb_generic_release() which only restores the
users/readers/writers counters without dropping the device reference. Use
it in dvb_frontend_open()'s error path so that dvb_device_open() remains
the sole owner of the dvb_device_put() on open failure.

Reported-by: syzbot+40339ea82afa8184ad5d@syzkaller.appspotmail.com
Fixes: 0fc044b2b5e2 ("media: dvb-core: Fix use-after-free on race condition at dvb_frontend")
Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
---
 drivers/media/dvb-core/dvb_frontend.c |  2 +-
 drivers/media/dvb-core/dvbdev.c       | 17 ++++++++++++-----
 include/media/dvbdev.h                | 12 ++++++++++++
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index d082b6c57c76..497f5920b267 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -2887,7 +2887,7 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 	mutex_unlock(&fe->dvb->mdev_lock);
 err2:
 #endif
-	dvb_generic_release(inode, file);
+	__dvb_generic_release(inode, file);
 err1:
 	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl)
 		fe->ops.ts_bus_ctrl(fe, 0);
diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index d753d329502a..3e0ad67b79a3 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -152,19 +152,26 @@ int dvb_generic_open(struct inode *inode, struct file *file)
 }
 EXPORT_SYMBOL(dvb_generic_open);
 
-int dvb_generic_release(struct inode *inode, struct file *file)
+void __dvb_generic_release(struct inode *inode, struct file *file)
 {
 	struct dvb_device *dvbdev = file->private_data;
 
-	if (!dvbdev)
-		return -ENODEV;
-
 	if ((file->f_flags & O_ACCMODE) == O_RDONLY)
 		dvbdev->readers++;
 	else
 		dvbdev->writers++;
-
 	dvbdev->users++;
+}
+EXPORT_SYMBOL(__dvb_generic_release);
+
+int dvb_generic_release(struct inode *inode, struct file *file)
+{
+	struct dvb_device *dvbdev = file->private_data;
+
+	if (!dvbdev)
+		return -ENODEV;
+
+	__dvb_generic_release(inode, file);
 
 	dvb_device_put(dvbdev);
 
diff --git a/include/media/dvbdev.h b/include/media/dvbdev.h
index e5a00d126612..9e6e5cb43dcb 100644
--- a/include/media/dvbdev.h
+++ b/include/media/dvbdev.h
@@ -343,6 +343,18 @@ int dvb_create_media_graph(struct dvb_adapter *adap,
  */
 int dvb_generic_open(struct inode *inode, struct file *file);
 
+/*
+ * __dvb_generic_release - Undo dvb_generic_open() counters WITHOUT
+ *      dropping the device reference.
+ *
+ * @inode: pointer to &struct inode.
+ * @file: pointer to &struct file.
+ *
+ * Used in cases where the caller handles dvb_device_put() and ensures
+ * that dvbdev is valid.
+ */
+void __dvb_generic_release(struct inode *inode, struct file *file);
+
 /**
  * dvb_generic_release - Digital TV close function, used by DVB devices
  *
-- 
2.43.0


