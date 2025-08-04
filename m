Return-Path: <linux-media+bounces-38814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C270B19A09
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 04:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C62C7A6214
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 01:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C821F3FDC;
	Mon,  4 Aug 2025 02:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="M3qCQt54"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976D81FB3;
	Mon,  4 Aug 2025 02:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754272865; cv=none; b=Wu174cf+bYVlxAmbVCKgkuITFeatpaY87uKXxEh5XCcZ5HLojqr80DYueVoDLzRzxSefvCg5nxJWGVDZABN+NPmJWBMNmzmO0t0Bvy7gjcH3QJZ3oO4Mqw3ow4JDyp6EelZ+6DcYo5VG7a+fepqoTnC5xPl11fwC4pFw/PNUEHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754272865; c=relaxed/simple;
	bh=KqPSsEAipp0FTBHpQ1gr9MqM8UbNzirmUIjEDZfuUzA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UttuvldUujecSv3UKxR2COvTT12/9+rIDCnkB3wGi5FtPOlHgFY0DDPaNmUUFYy2q0bJRHb7QhR8pXWHBmXtZEUfnwI1LBRViQjXzXiMF7i0xXUBybuxyc9aCm3n3ENWDqkkGnKfuI3tme1zb4cAcnsakZ1R8yC0Z4mYDEv85uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=M3qCQt54; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1754272825;
	bh=yfXEkqEa/uISK0w4262atq7Tl4Mh0WUTkGxrLVIQDCk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=M3qCQt54oMDYf0VzhdwvbTiFKo8cKyy/rlIuNQlTlnG//ZphGq6lGwGk4vRGqa26k
	 ui7QwyNw2p0l6rPC+R1bMXh6ygaFK32GWIEcD7gcYAV7zEksP6hKvoeI6EOz83DVR5
	 W7eP9ot4tBbiCgIThk90C5laOS41nLAF2rXJYNYk=
X-QQ-mid: zesmtpip2t1754272816t1d0cbc91
X-QQ-Originating-IP: 3f+7dAnPMh0pAYDIDnCsuyKVOvur5LAiZFM38c1kZOc=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 04 Aug 2025 10:00:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16794348384698843129
EX-QQ-RecipientCnt: 6
From: tuhaowen <tuhaowen@uniontech.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tuhaowen@uniontech.com,
	huangbibo@uniontech.com,
	wangyuli@uniontech.com
Subject: [PATCH] media/dvb-core: remove redundant new_node cleanup in dvb_register_device
Date: Mon,  4 Aug 2025 10:00:11 +0800
Message-Id: <20250804020011.19029-1-tuhaowen@uniontech.com>
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
X-QQ-XMAILINFO: Mf+wQkWJ2TuYsocu5Hu36j3NF3eDBQmYzlLkRCSF6kEcSZC6P20DESfW
	mxh7pqMgGYAdjdjccR6mtHDy6mjnCF7SBiglsHji56xXHLof8IgIcuxNYfi4W+QEkh1Iiss
	C8/RTeld4sNJG7779cc8zQxxhD1mxk48zSVqfgQG6SwcEqw20dEiB4o2aVXtwxhnHgEuogx
	lRWtbXb0q4ip+WZWp4F0lImPsW4hi3vt7Sv6W3Gow9qMwCBLxZXixMBPDjB/c5qNPbu8oIA
	r3sY/64L40IWV+ljwOKmjRdrjSMugx7KL1cQJUq6R+B+lnKPOIsQOsYJzt1ig5adHWg84hL
	J8wPSvmWzYud/g679TwapGO8MklU9KPQ9wUY5Ph56uVbder3B2bPPjB5oLLM/n/yEjgV1u1
	iSQzHG7BdmvAoqV5+9LwrdOplnalKvRmQuT490qNxasN1Ad5IAwXCLaNsIDtsyXQ4m09sQF
	+U4QxsoqpLkcUknl1dAk9C52Mp9vx9dp3mrCenbMbDExRxGoNeqdPyINKfRnd1lYmNecmJr
	T3eZiYH9TZnifffumwiKJB067umjKNK84DQP0U6jKqzJcOHcHdniRtTc6hVmnSnkHpNmZiy
	Lu/3be+2lQkRipEfHJ/VNPOejhLg6zCCT4u4kLu18f9XZy1uY3dKzUe5+CaNqhIb5JJfQRo
	56GTf/yBOiA9RASCVIoaKwUZwdo0aaFVlzZqNVu8AIYzd9HhLfjeawQUXmvXvUCIZ5vy8FI
	1/mR4K0z0A6vgNwfja4vpa4ClbAv/KpcTvEyc7BFnExYxchTYidBWAqaiuX/UTmaOMRO8oI
	tZBwjBOO2+WU1BvYfzpAP6JW0y7n+2Cj4OZ2uEXGIVljfm9HcUjStsLFi2nTo6iMYRbkFKd
	bhShSsiCSFSNm3wZIIsPROmUiKXjM5FnzgJrW1E+JkkrwSQ9sEdXASuayaF5ezPuU71pJMG
	AF6S3Yk/Pe5oVpciT+MiY/Yk7WMGut0XB0mZqSsyCeAJ5TAIWt2gsieLicHmk453QJqXuW8
	zT9c0C8A==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
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


