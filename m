Return-Path: <linux-media+bounces-38815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B65B19A73
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 05:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C3F31897CC7
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 03:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC33221FB2;
	Mon,  4 Aug 2025 03:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="C8vsTS6v"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4FF2E3710;
	Mon,  4 Aug 2025 03:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754277402; cv=none; b=prDdHzR0edFt9WdPYOdo1CJ2BUOEILeo52XVXx3RE/iQ8sdOwBN+EpmkU4PUBX3Ro3PTh696Yit4M3Tjzwkp+rqHQXmo9mKb1K5Xw2rk4WpJI7NICKaIcuogtk8aUTLW3D/EGZ+ZUVPbA0wwlBMzcBebUadE2u3JG7N/okIm670=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754277402; c=relaxed/simple;
	bh=KqPSsEAipp0FTBHpQ1gr9MqM8UbNzirmUIjEDZfuUzA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MUIMwOy1zDOiRKWIW7LaH62gqoIHAbwyusKGmiV+8012BH+kWo4fzi6JZBEM8U1bC2dUyugB+hw7wvRFKRS0FfSJTggrKd/OAODC5NTIjwbBtH5dIKK9Fhq2/cYJ24xE8AANZ3ngG1ChxrtLNJPt4nk5+kJpsDpcN5vVAe+6J5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=C8vsTS6v; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1754277368;
	bh=yfXEkqEa/uISK0w4262atq7Tl4Mh0WUTkGxrLVIQDCk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=C8vsTS6vgrPgq/S6/t37BwfdCfv4pqCdqy8CjZ55JH/FbQNVPpQxCNONfqs+Jldah
	 PgHRKBYXRfgiW3F/DCB1Idj+tWPMGNwZzXIky9a+cZffchfjgDUuNETYWWa5QzmNEB
	 MG+xExLmSnSLVJxYEwu6HCt1IyFz9L2KGBBwL0Hw=
X-QQ-mid: zesmtpip4t1754277360te817ce39
X-QQ-Originating-IP: CsLbrNJfu0xmck4+IBUlfdUD9PJ6+4Ev/LU8dhC/Nsc=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 04 Aug 2025 11:15:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10298245471260846125
EX-QQ-RecipientCnt: 6
From: tuhaowen <tuhaowen@uniontech.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tuhaowen@uniontech.com,
	huangbibo@uniontech.com,
	wangyuli@uniontech.com
Subject: [PATCH v2] media: dvb-core: remove redundant new_node cleanup in dvb_register_device
Date: Mon,  4 Aug 2025 11:15:53 +0800
Message-Id: <20250804031553.4411-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OdImatYx1y6xee80NRrQfSzJSATFpG38jwbM8scbLV0FZnVOc6zsv1vI
	0bsHPxHJuLuoXUGKUF+W/foY3Av6SKPFPYXd7/hnTyqYrfevju7JG78WuDHD58ZSf2cCtHs
	UhdkCexN4JlTvKVovunFhWKwGhKdb7M4NXZHm4jbKFRUxzw4Rl1/SD4IorxdrNwZsQMPnC8
	PEvuHOyl93GYh9zdifGxKP4K+KYn7h+4UZ9OC/qVy8DOCaLkt0Q6MGL4ChwaANjW5NinkyE
	b/6Cry2EDXSYdadCj2B+g+7wI02sFWwJ/wdLgvz4BhW0pT3q3nZhpE1gda8CQX6ua/Sqhf1
	S89TZ7bk/cA08PGciBN7QBPqgV2ePPl5kulRrqULziTH7tbw19Y3zJrATdpYIkoDZ12TVFk
	ld52aDxVI/bkJLaW1Mf/bjTa9Pg6iZTV/LY7n8rLcGDeK9s7sHhYleeThvUee55U+8BAjXr
	QyNxN7x0T+6u+olPgsMKxxEkALbMaBd4/NzS/9Lk+0/ZaaqoPLwcqyktExOAnm++7YBXwiq
	SoG1NVcQcVc1svujm5C7iTRWYhbHwt8svWT6ogFXkHKMkl7v/+AV0e+DBH3AG1XfnuBqVRW
	OYQD7BLKbE451hUguTF6deIu8LYeX7ONKkRdVLRKQGZjMvRjt4s01Br2s/lDox4UVJBfk2c
	4ESTOD9VyPmfrobwJ6isRD34HVcO1RaDJlTJIdVuf5A6R58bExXRjyFgAP0iPas0ptvrkMZ
	bUzEAo/Ze6fqUbeEe1Kd+6W2hQqfWcvbkMdpNTlaBcE85SUlNJNZapiK9BnwWTwrCsVljiF
	vri5/fOJmrwgSkUW1Xa7L62ZWSAI3bc5j4hBzZrKj8HgCB339SBMChCe2VVStFB2+DOkGQY
	wPRXQELAbc/64UTOm5h8BIM2lY6NOSkmBywtAzcU/WmOq+uqG41WYEYOIC8SdLA9hbwYG87
	cjSV0rA8I0mzrblOdKN2XF5BbyrMH9CEwC+5aU26ebaFxJttsiksR3xcceXR15HEV53zzEF
	NpE47ZBPNHeS7OCmjgUuOzFygbvxiSSpBk6KRdYZeMWioqhvmB4lVzSoixP5Nu7NkXgwqHu
	jQOyhnBQ4sFhChyrKee2KY=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

The error handling paths in dvb_register_device repeatedly check
if (new_node) before cleanup. However, if new_node allocation fails,
the function returns immediately and does not reach these branches.
Thus, these conditionals are redundant and can be removed for code
clarity and maintainability.

Signed-off-by: tuhaowen <tuhaowen@uniontech.com>
---
 drivers/media/dvb-core/dvbdev.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 9df7c213716a..2be0cc81bd47 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -534,11 +534,6 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	minor = nums2minor(adap->num, type, id);
 #endif
 	if (minor >= MAX_DVB_MINORS) {
-		if (new_node) {
-			list_del(&new_node->list_head);
-			kfree(dvbdevfops);
-			kfree(new_node);
-		}
 		list_del(&dvbdev->list_head);
 		kfree(dvbdev);
 		*pdvbdev = NULL;
@@ -554,11 +549,6 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (ret) {
 		pr_err("%s: dvb_register_media_device failed to create the mediagraph\n",
 		       __func__);
-		if (new_node) {
-			list_del(&new_node->list_head);
-			kfree(dvbdevfops);
-			kfree(new_node);
-		}
 		dvb_media_device_free(dvbdev);
 		list_del(&dvbdev->list_head);
 		kfree(dvbdev);
@@ -573,11 +563,6 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (IS_ERR(clsdev)) {
 		pr_err("%s: failed to create device dvb%d.%s%d (%ld)\n",
 		       __func__, adap->num, dnames[type], id, PTR_ERR(clsdev));
-		if (new_node) {
-			list_del(&new_node->list_head);
-			kfree(dvbdevfops);
-			kfree(new_node);
-		}
 		dvb_media_device_free(dvbdev);
 		list_del(&dvbdev->list_head);
 		kfree(dvbdev);
-- 
2.20.1


