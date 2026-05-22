Return-Path: <linux-media+bounces-62552-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sO3jHlLID2rdPgYAu9opvQ
	(envelope-from <linux-media+bounces-62552-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 05:06:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9CB5AE3A5
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 05:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AF52303AA97
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 03:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3F73148DD;
	Fri, 22 May 2026 03:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="pJ6VAARk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD48347C7;
	Fri, 22 May 2026 03:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779418958; cv=none; b=U1vxZXMpuGkGslu5vTX4Md1WVI3uLVDmgD1z6KpWCS54S3F7GAYEjWCzhz4+6yVAAP5sy05fSBaCclV75hypz5olweYgUJJBE3IGO5NKskV97QCaCKTXKECYWMeTeWbvy7SNtVcI+hwy/jP0EvZ+cIR55OJIrOpDW0/HxxU3O1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779418958; c=relaxed/simple;
	bh=/6iAAGgJcVED4HgMne6G26B3C44R5Vcy+tkHLbom6lU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XBn9GNOgNeEzKRkltL85OQ3/BgGTWEP12YOg1xNFD1Z0RtTOs6axhArsZ/a9YkUrOJQJfCpM+TaRhB/QehLWbX9SpfVBKMDABStDiuMCJBNaCk773jM+MKhkZO8a0gt+iSh469tPvTxHTqBr4SukfhMa1y/U375VWG931ee5TPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=pJ6VAARk; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M1Aku31687246;
	Fri, 22 May 2026 03:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Ie1ddqEl0
	xdjRINEGd5fGybBUDGRGkaVyM1iXxkZrTU=; b=pJ6VAARkg9MfPgOZH0X5yGWUo
	YRHPCByFEYHuLG/wnM2L9OOnw+QWfUVQOAHpKAfG0uNaZxPSU9m5kib0gpxjSWFP
	TMW5SiDqREX4Mqq0dxg8arXD/R/jREvISCr4ljRVBXbn29974TqhCJgVuRp1djx4
	a6TMAuNjjmFIf6H1OxArOk5W1mnlc3h1mQyMhP5uKZkGn4rBMl67/DAsecUhxAex
	7jTwniCX/p4CEeLs9p28Qm3mr9ntBT8qcQPtTTerc4Rg/CXgvA7DPLL2TWYiLnje
	F/Ud5E3MAH2V0QOaR2YLoQA2+caWDgBn468zMuXAPQrHlLyeaLLk2wuGwRSuA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e9xab1nwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 22 May 2026 03:02:27 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 21 May 2026 20:02:26 -0700
Received: from pek-yzhou-d3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 21 May 2026 20:02:24 -0700
From: Yun Zhou <yun.zhou@windriver.com>
To: <hdanton@sina.com>, <mchehab@kernel.org>, <kees@kernel.org>,
        <linma@zju.edu.cn>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] media: dvb-core: fix use-after-free in dvb_frontend_open()
Date: Fri, 22 May 2026 11:02:23 +0800
Message-ID: <20260522030223.1457871-1-yun.zhou@windriver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: V5cJZXRqdAMrIB_deyjIEFLF3JTz9iE6
X-Authority-Analysis: v=2.4 cv=ac5RWxot c=1 sm=1 tr=0 ts=6a0fc743 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=XssDyHoSECOwkyI3_iQA:9 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: V5cJZXRqdAMrIB_deyjIEFLF3JTz9iE6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDAyNiBTYWx0ZWRfX9Se5LKa0CZWU
 DgUDDh8MBmFnFPQhfwsS2vgYc+Owe1G6/DU7Lpu2GOdXrfNnmvrxCK7GFN/adcZwl4+iT4WtQoi
 zndcqTVLuKcmVFKcD/Fg+EieV/cz5i82eIdMr3xL0Ti6LOfGi4ktjT9BdAG/vQ/DFzjKvKWYkCP
 rUpsDatZrEzju6p6rirYLEnzJNy1gvJ188YdOkUXQ60k++56pBL8JdtDVzHevwijlAHUMKTR5bT
 h2x5WKjnH6VUb1F/6zSM8p5Gtt6w8X49495hQHJWG8Z/7RvyxE+QzYDNVlQNlSSIpDzktfB/tlw
 FIg7Qhrndl0g16TTkDUZfB4jXvhhfqMluqfUDQeDmm259UDRQcJ57y5Xwqx3HqC6fu9o84uecfp
 ckST+o42vQzojClfGUydJ8kO01i+9O3XDc8OK3EOVNk8+lgRKyqB4M2Xn+02gJmpxOFMAizhQKA
 kaFZZKW93l2cCMUzlvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220026
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62552-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FREEMAIL_TO(0.00)[sina.com,kernel.org,zju.edu.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[yun.zhou@windriver.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:email,windriver.com:mid,windriver.com:dkim,appspotmail.com:email,syzkaller.appspot.com:url];
	DKIM_TRACE(0.00)[windriver.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF9CB5AE3A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dvb_frontend_open() calls dvb_generic_release() in its error path after
dvb_generic_open() succeeds. dvb_generic_release() drops the device
reference via dvb_device_put(), and then dvb_device_open() drops it again
in its error handling, causing a use-after-free and refcount underflow.

Fix this by incrementing the refcount before dvb_generic_release() in the
error path, so that the put inside dvb_generic_release() is balanced and
dvb_device_open() remains the sole effective put on open failure.

Reported-by: syzbot+40339ea82afa8184ad5d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=40339ea82afa8184ad5d
Cc: stable@vger.kernel.org
Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
---
v3:
 - Simplify fix: increment refcount before dvb_generic_release() instead
   of introducing __dvb_generic_release()

v2:
 - Fix Fixes tag commit title
 - Add Closes: link after Reported-by
 - Cc stable@vger.kernel.org

 drivers/media/dvb-core/dvb_frontend.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index d082b6c57c76..608525d08277 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -2887,6 +2887,7 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 	mutex_unlock(&fe->dvb->mdev_lock);
 err2:
 #endif
+	dvb_device_get(dvbdev);
 	dvb_generic_release(inode, file);
 err1:
 	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl)
-- 
2.43.0


