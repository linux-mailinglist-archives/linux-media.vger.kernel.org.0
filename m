Return-Path: <linux-media+bounces-39856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E993AB25975
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 04:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0070D5686BE
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 02:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54816254855;
	Thu, 14 Aug 2025 02:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="kR4YT+HZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A609A15C0;
	Thu, 14 Aug 2025 02:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755137934; cv=none; b=Y2ioU5ndrcjW15n/cXxkgVBlrncWDG3GbiUuQOzAaG1tqz3hOHGIokp6IY3gZvtbGmlrMAOvMbnJoOj51GSc67Xo3wGrChRcFspN99JhAN8xP+N/fwmHhxzTppMt4bSkPHsSOb5qvn4+8VObqopa9c8Ey5PcVpHC5un6EXuXB3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755137934; c=relaxed/simple;
	bh=hAxM88s/LxG7Pzpa+qCFm924ecvuOPt1VEZK+hfP+PU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GT8ned//O+DMl+u7V7uVJqcBLjDN/fleKdQUdV577Zs7MY4YC6EL5fo8bxbrV/0xogmEYQ+ibpLi9jdRgPA6QFL2aRC6Wu4EKoNrRSF7BWAWhZk0pvgODDUMJy1ogLOyGR6XATSx4Wc3HUnPaV42JsLjIheiS1xn/0J6P6kbb7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=kR4YT+HZ; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1755137919;
	bh=+UQNR87JqsiMWpi6tq6IQe50rNVzww3thLYixk1ylc0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=kR4YT+HZbWpu0zMXQusQaHhTxoSfyrSFIbpWGPVaKRITZ6jUdlHPabxqryqgzDyty
	 bxVOPglikdz7jnf+PUXOXMCRzMYKl9aSv/Nu2GBFfvM2DG3LOyPK3aue4uQwJLBAlx
	 5+dyUjYTXWy9T1cN9zyfZfQtRVPr1D0ZqxkVe2fg=
X-QQ-mid: zesmtpip3t1755137896ted227665
X-QQ-Originating-IP: eE4LDs5ghrXBFwzxENbVumUifA4rBxyTWanOX1OmQyw=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 14 Aug 2025 10:18:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11529315799065879670
EX-QQ-RecipientCnt: 5
From: tuhaowen <tuhaowen@uniontech.com>
To: tuhaowen@uniontech.com,
	mchehab@kernel.org
Cc: huangbibo@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 RESEND] media: dvb-core: remove redundant new_node cleanup in dvb_register_device
Date: Thu, 14 Aug 2025 10:18:07 +0800
Message-Id: <20250814021807.13536-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250804083908.17557-1-tuhaowen@uniontech.com>
References: <20250804083908.17557-1-tuhaowen@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MP9Cvol/R4C0zzpL9FbRYkWGF9DubKZEdXCN4gE0f2Uooe92cLXL0Fpj
	M9BE/Ipl6GgTV52kE9o8qpcWxBlx8aXhJnzhklC7S2P6cVvzoMA72ShiECeMop27qF6OhOm
	1TIPhJmNpHRZ7SbtvLtvo8lm/z1l+oEgWYV0bHf2h/ZtcED+Id+rky5vosrULyDfmtgbP4T
	kyZgjeIdHOZo3Q4hP5hXnLw6hgqHDgGwLvr2Iy2GRcZxvHB2yHXP9NKC/TN028/uHz0QDRv
	fRsvjzjQgYy9MucyzALc5GqphBDF5+DfclYTUQJrFR/n8+68uq6YPDQytAiBLZ/+YGR9qIH
	jNR3Tt0UpQHd7a/nW59HxqF3CyxqHWfypyLs5xOS8UCg5fYH5uMi0/L5yNjabQhjXYdym6m
	FznC8jVyQ4jC9HjeJUt5MGz6xNLppWlgv/8ooUarjM7mCX2jYwVi+jDFtIObUACZ58ys88M
	MoO/Jzj40aIXSj8APrjY9PZ8lKLtn+Ybwb1XKMkHrxQWB0YWG2ncytIjUyTnjEhQdjN1XWI
	TibeZQSMXTxcOO/k4EE4cStnwjT9eH3mBdJ4bDMQMawfOC3iWoyyeifvtRQWPYcBSQQ2Qma
	oNA81ry4hPQP3PtYcRTfd+LfnrhiGZOMeRmA7ZEEqpEqXXcej6CTRdSv8kMK2RnQ04tqD2F
	izNjDf5ny0k/WENLFyBYTnmFuxBoxqvmSpd90X6AoNjjVVLLE2Vz2gYTiUnzHnONzi6euoy
	7UkpI7UAE5DCcRbgT6GX69iYhTZ4UqJvpa4T4LNnvbsSUv8eMbccHZZLwMCD1y+d4qy28Y1
	bawHWhzwDw+3DhQAkvCxx21b7McyRAhnh4oz9ghft0TO3J4IasWHZKgAvEpjuJ5JLUiOHq+
	yhIVUAeZW5L8Gct2GpwV/3aSDs4moVT9ZlQ/OYuks625UmVzS9nL/7Lj5UPVIw+2qsHg70l
	pLZl1bGa31mui5/myyMnCVSR8TU/vvkpCkZD6a2O6apBbREFcXs/c1HIDtrqV3b14rKLQJl
	LXJ/ioXbKo1iekvpV50h78BwwTjrG6N0ngXS47cQ==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

The error handling paths in dvb_register_device repeatedly check
if (new_node) before cleanup. However, if new_node allocation fails,
the function returns immediately and does not reach these branches.
Thus, these conditionals are redundant and can be removed for code
clarity and maintainability.

Signed-off-by: tuhaowen <tuhaowen@uniontech.com>

---
Changes in v3:
- Modify the redundant logic
- Link to v2: https://lore.kernel.org/all/20250804031553.4411-1-tuhaowen@uniontech.com/
---
 drivers/media/dvb-core/dvbdev.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 9df7c213716a..aa9b4b9c5846 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -534,11 +534,9 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	minor = nums2minor(adap->num, type, id);
 #endif
 	if (minor >= MAX_DVB_MINORS) {
-		if (new_node) {
-			list_del(&new_node->list_head);
-			kfree(dvbdevfops);
-			kfree(new_node);
-		}
+		list_del(&new_node->list_head);
+		kfree(dvbdevfops);
+		kfree(new_node);
 		list_del(&dvbdev->list_head);
 		kfree(dvbdev);
 		*pdvbdev = NULL;
@@ -554,11 +552,9 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (ret) {
 		pr_err("%s: dvb_register_media_device failed to create the mediagraph\n",
 		       __func__);
-		if (new_node) {
-			list_del(&new_node->list_head);
-			kfree(dvbdevfops);
-			kfree(new_node);
-		}
+		list_del(&new_node->list_head);
+		kfree(dvbdevfops);
+		kfree(new_node);
 		dvb_media_device_free(dvbdev);
 		list_del(&dvbdev->list_head);
 		kfree(dvbdev);
@@ -573,11 +569,9 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (IS_ERR(clsdev)) {
 		pr_err("%s: failed to create device dvb%d.%s%d (%ld)\n",
 		       __func__, adap->num, dnames[type], id, PTR_ERR(clsdev));
-		if (new_node) {
-			list_del(&new_node->list_head);
-			kfree(dvbdevfops);
-			kfree(new_node);
-		}
+		list_del(&new_node->list_head);
+		kfree(dvbdevfops);
+		kfree(new_node);
 		dvb_media_device_free(dvbdev);
 		list_del(&dvbdev->list_head);
 		kfree(dvbdev);
-- 
2.20.1


