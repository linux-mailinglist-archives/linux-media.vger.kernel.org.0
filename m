Return-Path: <linux-media+bounces-64386-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TvO9NgsiKWrrRAMAu9opvQ
	(envelope-from <linux-media+bounces-64386-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:36:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 793A4667400
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:36:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=windriver.com header.s=PPS06212021 header.b=Rh8ZcvnH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64386-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64386-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=windriver.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 241C5308770D
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22B73AD515;
	Wed, 10 Jun 2026 08:31:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B50233954;
	Wed, 10 Jun 2026 08:31:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080270; cv=none; b=EBfNc2syO6bzc44Da0l2xFYHRcFNUA6kotpY/XPWhDuJhWAJmwWa8wrhvreGl6wE2fTqkySWoIugpfeljYhd1zUwc/IB/b9sbSUJQG65l/fCAJFchR6ophKQmAjyFjXhWWJqs5g0zjRS1rMHwBjvn8Q9cIT9iYTlyKy7lECBaV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080270; c=relaxed/simple;
	bh=/6iAAGgJcVED4HgMne6G26B3C44R5Vcy+tkHLbom6lU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eZrrCsaGzsy1JphOZYi3PfzUZSXGOczbO+EJ5ihnQmoSyidDO4iQt9eXm2TzJnxVCXx+LoXO49KA+bHFOj/HsJB33YqnzlDIlIpO+qijnDJbUecwcTkmz5DAtnRSe/g5qKnVmlOIfKSB2WJk0cNxZQ5RlJxNGtN1uM0gVRAxbMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=Rh8ZcvnH; arc=none smtp.client-ip=205.220.178.238
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7nhjf211744;
	Wed, 10 Jun 2026 08:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Ie1ddqEl0
	xdjRINEGd5fGybBUDGRGkaVyM1iXxkZrTU=; b=Rh8ZcvnHynCwIOTUMFRzQHk9p
	W6LFwzM6reGCQlN4eSazS2IAD9tukBXBag7kdamDvYB6rCaoHxFLreudBlkXnRSE
	V0s1UpcfcsrnLyDy3dpqHb3ITnQMr6wxFqJg62cJBrbVaijYGajgeU9Iz7h6N/q8
	KZSeg7rJmURHgve54ydw0a+BW09IkuNvUWcCcqQH8PFcPpFC+gPLhIz3AVV6X17o
	3oZPgSJRH1SvIVTSnIBUhDV5I5oUnsMbtGTA2dZHVfkv9u766QqzXIxpStuFY4cN
	2mi7F3+El+v2ey53ZqfQz909j/a4Tn31siae0ponV8rxC3Kp1ZcnUr3b8WCow==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4epwms0c1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 10 Jun 2026 08:30:59 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 10 Jun 2026 01:30:58 -0700
Received: from pek-yzhou-d3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 10 Jun 2026 01:30:56 -0700
From: Yun Zhou <yun.zhou@windriver.com>
To: <mchehab@kernel.org>, <kees@kernel.org>, <linma@zju.edu.cn>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yun.zhou@windriver.com>
Subject: [PATCH v3] media: dvb-core: fix use-after-free in dvb_frontend_open()
Date: Wed, 10 Jun 2026 16:30:55 +0800
Message-ID: <20260610083055.3976083-1-yun.zhou@windriver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=NOPlPU6g c=1 sm=1 tr=0 ts=6a2920c3 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=XssDyHoSECOwkyI3_iQA:9 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3OSBTYWx0ZWRfXw9eYYVysHRVE
 fGwMLC1wmd46fPJb+531DbcisLafMoHd0NYYmVLgXYQLvGWfwuUFH/n7KNGp2RdQgz85PQk5fzg
 7hfdl8xpLa4XKH0/jfyLBkg97YhCFGIekmVN1JP37Q9f9G+S61Hf6gaszOTBni8AAxG81tW0Dfv
 k+L+iPYoEw1RJWttWvKJd4WsSk9XdLJ9/64SMlexqvUeX53wfqOzCtra8j/AHwpsrwBNxm6FCcs
 d+d90WlUce3uMRWSQJxXN+dn0VeWBB7661G12mNIZX93ZSpmpMhSx3OSJ7I+eff20M51BJsSZ3q
 ZWt6SmLNvYON2RY0QCDhVHNR3s9LBjFrT8aMishrVHlFFlquXk6M+m9vqDInMHRgnbEBx79O1bo
 rLECqTrma8cZriKK9X9321FxNQfzo41PsWVtiK6/YkzcVuToeHilBVAP9c4QJYr0CpsIDPYox5E
 s2D6a2r6L5qDTshbJ9A==
X-Proofpoint-GUID: 8OQJJzoFlipgMDpZ3iR3mv9AE1w8PVjR
X-Proofpoint-ORIG-GUID: 8OQJJzoFlipgMDpZ3iR3mv9AE1w8PVjR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64386-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:kees@kernel.org,m:linma@zju.edu.cn,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:yun.zhou@windriver.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yun.zhou@windriver.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yun.zhou@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 793A4667400

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


