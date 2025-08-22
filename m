Return-Path: <linux-media+bounces-40708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3DBB30BF7
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 04:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A49E1D01A88
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 02:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6339923E352;
	Fri, 22 Aug 2025 02:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="NPnCiVL1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25DD23B63F;
	Fri, 22 Aug 2025 02:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755830508; cv=none; b=lG0v0tCCRKV7VMXoFs+MB9hcieBJAhUIOAdoJu4aUyqir8i4w4ZkCDmfyBDD0XGoOufGVo6Q2IAhAHAETwaf59QfJZjBoN7EvQcZlvkEjdlyIXa+OS9xLiqTTTlu/0V/AkhiEutOjEhh1g+4fyxGvrVxJ19L5mJ+gfyeOyq2XC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755830508; c=relaxed/simple;
	bh=p4sorkCBJWlsizUJRbX51L1d1iI51BqF1Brpp4gmraU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JDqiV1QVHX76KE0bF8DjaRsZpu7TL4s4V+ChRsQjBBEhne+pVEpzL/VCHF2NaipAvSEU9/qZwkULiDURVTKDHaAoJN6kquUKNTp2xh3RwSVxyNcSQs5WsPHz3evTsUJeMOEMg9a+128b6/Kwjt5BYZ9ur50+n+pLSm10ZmIUsFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=NPnCiVL1; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57M1eWaR3925966;
	Fri, 22 Aug 2025 02:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=XsuDtQ+9nvWfXiIYVbBm8oQt0Gk+bbePOLhK19iuPgk=; b=
	NPnCiVL14TDDK69paX7JmJvT8Qe2vmU2ZMupjzMjS1xggY3p2jmV7TvB4rMxSRKW
	NrAajQ0cmu26Ly+wpBTAFeEh4hre7qDQbrgB6lhzDH5snv6i4reewW/57PpW627H
	C4NyB5u5KKAQQRgo89/aMarEKZihwCIEBofbXZ2mstR6XwTQL9OsRM4iROwYiL3B
	aUR5gd/F1QzgYqOM++Z2bzblUupAfRLrawN3ny2Kc7ExtqDWOPwjUQ+vUNx5DvkS
	HmK0AeRyFsCCtSkxET5dFiJ2USVYfkpMIj/L/0rdLAxOCC43sMEYaE75rZ2biFc+
	+xywRyE7iPM8sN9VANTwAw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48nekjtd2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 22 Aug 2025 02:09:59 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 21 Aug 2025 19:09:44 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 21 Aug 2025 19:09:51 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <syzbot+d99f3a288cc7d8ef60fb@syzkaller.appspotmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <mchehab@kernel.org>, <micha@freedict.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH] i2c: dev: Block zero-length messages
Date: Fri, 22 Aug 2025 10:09:51 +0800
Message-ID: <20250822020951.919822-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <68a7b69f.050a0220.37038e.0047.GAE@google.com>
References: <68a7b69f.050a0220.37038e.0047.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDAxOSBTYWx0ZWRfX5wFP/Nuqq6LI
 Jz0sGlgNKAnBYXiQ7un8gcWVqNZ46TjcReT2tAt2i0i93MgsKbx37zmVXcztisVXmxoAN5jg7Qi
 3QCQhkW52HjH8a7a3DCCRUVpGBaepT39PRp/sJH2SZ+OfmUE4tH/9BbmXvlG5KA0Lp64Nw8LJoh
 iWJzOm3HxLbWGvIVRuGsw0KOHaa6r6j5nHBYakNOzFp0mbOlrbmZisr5ONZC1Lvhaw9omw9uElr
 yddYPJIC4gfUGNuGEmdWArUUQ9Bm7yy+PQdkpEYlRnl7AqeCXWTiAhE+0ddC9xTw6gd/gzjbr68
 0xxTVmIn5idGD17GYL+oIPDii62JlV4rLKZFE7LzaT5I8NYLjI6+yFowleYoN22FcA2O9V3ORuz
 2MojpzI3T6Zr0s0apRUM9XdVf2YE3w==
X-Proofpoint-ORIG-GUID: azOTVpda7hzb8SauqhBgs8Rk78wdyNzu
X-Proofpoint-GUID: azOTVpda7hzb8SauqhBgs8Rk78wdyNzu
X-Authority-Analysis: v=2.4 cv=L5pEg+T8 c=1 sm=1 tr=0 ts=68a7d177 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8
 a=f8YqMda3FKrJFGOuSw0A:9 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=cPQSjfK2_nFv0Q5t_7PE:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=SsAZrZ5W_gNWK9tOzrEV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun

The user passed two messages via ioctl, both of which were zero-length.
This caused i2cdev_ioctl_rdwr() to allocate zero-length memory for msgs[i].buf
when executing memdup_user(), resulting in a ZERO_SIZE_PTR.
i2cdev_ioctl_rdwr() did not handle this situation, leading to a null-ptr-deref
when accessing msgs[i].buf in su3000_i2c_transfer().

Adding a zero-length check in i2cdev_ioctl_rdwr() resolves the ZERO_SIZE_PTR
issue.

Reported-by: syzbot+d99f3a288cc7d8ef60fb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d99f3a288cc7d8ef60fb
Tested-by: syzbot+d99f3a288cc7d8ef60fb@syzkaller.appspotmail.com
Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
---
 drivers/i2c/i2c-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index e9577f920286..17b0bec53e21 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -257,7 +257,7 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
 	res = 0;
 	for (i = 0; i < nmsgs; i++) {
 		/* Limit the size of the message to a sane amount */
-		if (msgs[i].len > 8192) {
+		if (msgs[i].len > 8192 || msgs[i].len == 0) {
 			res = -EINVAL;
 			break;
 		}
-- 
2.43.0


