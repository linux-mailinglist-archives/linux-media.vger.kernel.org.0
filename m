Return-Path: <linux-media+bounces-62078-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGPHDeXwC2psRgUAu9opvQ
	(envelope-from <linux-media+bounces-62078-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 07:11:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9578C5775CE
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 07:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCBA5302BEB1
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 05:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E4C3195FC;
	Tue, 19 May 2026 05:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="dx3x7mgh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A2C21C16A;
	Tue, 19 May 2026 05:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779167440; cv=none; b=cTMPhhAZim0+N/wXuJIebn6uVS2bhjhPC8QTtRwrPUIIAwwnGQ2Zm1SlD2Qchi6bhroZEqoyCdcFlmf/0C1POsbVJYrLX626TEmU0JDojQ3StXaR+s61xRafpWVDSMXPzdCSftgUC6RP9UOPFEQSyCUSieeZ5nxZQhSemcnbog4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779167440; c=relaxed/simple;
	bh=FrJi6eMJPTp/hrB3W4VyUBh9mlJ7NkS5Pdsexv4muP8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u4jbuCa806ZT8PpQTj446p3QPXlMS4T7wjJP11wcdLpJXypWL+MEesvoaAo8wEtNsX68JjA+d6+9V+QosnsiXkE07/7x/stycGxUylred8mPcnDxcSh8YVGAc6dSVFO1IAoXiNceliNLYXkV3xq8jAlNWzkS+iTz/o76vuCsNaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=dx3x7mgh; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4AE7R3010977;
	Tue, 19 May 2026 05:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=5QVHn2rKM
	p6Nqt690ByPZTQtJSoAJVl/Z1wCWH4Zmno=; b=dx3x7mghZ/ChYXKLqZcBRFt24
	zLQauMQ1mTM1VkVnpFYzP9BBx4Go0MNHiMY1pQyMJEC+AFzxpxrsj2EgdbB8yQWU
	g5FQPV62QXdzu7gRhFsK8/GhPXNTpUvNiYaRByAL3zojoBd7u3KiLJRQufEfUBgC
	JwIbVXyFz2+C9+f6ZP2D6x7spI/YYOx2D5ExkW9iVWCWk5I7Ynufy/m0JWOwYREp
	pgPs/F0l6O3tQgsWPMM5DCS1bEuDkPZYca4hqXphb4qiig5JBWnvYbaoaNAjNCkT
	Uydcas9su8qtiU8lAJeUMklAEkYiDi5/aN2jM2CuVE5prOS/TeCY0fnVh8Iwg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6ecf33hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 19 May 2026 05:10:24 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 18 May 2026 22:10:23 -0700
Received: from pek-yzhou-d3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 18 May 2026 22:10:21 -0700
From: Yun Zhou <yun.zhou@windriver.com>
To: <mchehab@kernel.org>, <kees@kernel.org>, <hverkuil+cisco@kernel.org>,
        <sakari.ailus@linux.intel.com>, <ribalda@chromium.org>,
        <linma@zju.edu.cn>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
Subject: [PATCH v2] media: dvb-core: fix use-after-free in dvb_frontend_open()
Date: Tue, 19 May 2026 13:10:20 +0800
Message-ID: <20260519051020.628298-1-yun.zhou@windriver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: qe_ahwg5uvR9m68RQTj1LuoxG7cGDsHw
X-Proofpoint-GUID: qe_ahwg5uvR9m68RQTj1LuoxG7cGDsHw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA0NiBTYWx0ZWRfX0fc5lOAI1G8M
 Y9veaxSGAwXDkSgOE+dpaBS9w5ShmDLkwvTOJXZG8Ndj2qrDJ6rRUcGt5pBExsa2NK6gpUEYoFk
 X5TmPrDFzOS4oRa1Nt6tjun5T9HcpWtm/QIzbeFcOuLTA1KLzht7dKGD3w7PTIZxmBYgPV9uIk9
 Z4InoliET1Wt3TYfHYDWeuiWv2LTsWA6oOJwXfp2a5J8mYoib31HJgB2DyW4FmAl4y05Uztr1ua
 AJFtFywvAJWw5N7tx3C7BnWNcmJDzBkiO6ZzEpv2zE/6vddU2n1VJ9PiF3d6w3jfOl8x+lXoYHk
 hy/ShmCrY15UTTIIR3mRxLgH6JHIy3saDBULLuPVeV/DRg7ik7wUNFkI+LM2WdmwR6st/o4YWVE
 Q2q3MgjufglnbrHp650tN88273NUCb+W+C6Zo7NYj+hDy7e7dTMKF7kVIaygAty050jgxCtMbUf
 xFdE3JPIZuG7sI6rGSQ==
X-Authority-Analysis: v=2.4 cv=dK2WXuZb c=1 sm=1 tr=0 ts=6a0bf0c0 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=Rw0Jph7aeMS_YbH_6PgA:9 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190046
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62078-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,appspotmail.com:email,windriver.com:email,windriver.com:mid,windriver.com:dkim,syzkaller.appspot.com:url];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[yun.zhou@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9578C5775CE
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
Closes: https://syzkaller.appspot.com/bug?extid=40339ea82afa8184ad5d
Cc: stable@vger.kernel.org
Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
---
v2:
 - Fix Fixes tag commit title
 - Add Closes: link after Reported-by
 - Cc stable@vger.kernel.org

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


