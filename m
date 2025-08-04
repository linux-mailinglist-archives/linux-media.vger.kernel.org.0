Return-Path: <linux-media+bounces-38819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E47CB19DCD
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 10:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C37A1661CB
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 08:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49849242D6A;
	Mon,  4 Aug 2025 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="T9lH0l9+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D807D1A5BA0;
	Mon,  4 Aug 2025 08:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754296796; cv=none; b=rnbx7GxIPN8uIXejSg4EmESAYESd8YA+pA9ivsGnA48JcQqBd6bVbUy8ClCWFuzkjvSAC69m0tCOa3dJ8JC7OQJY1t7a+NkY4sCVSzUm26Oz0TCFUDKTLNSLMV85+4wWjgMCX7rGsofULGTB7neElYitFFVW/BUXpY190I9c3ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754296796; c=relaxed/simple;
	bh=hAxM88s/LxG7Pzpa+qCFm924ecvuOPt1VEZK+hfP+PU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Iy0WXxxMmf1x6mpAeRxy4f1hE0UrPG0mNhWM/4qz/oCqD7+MpfkMa+Dy6WfWns7r3uQrCvtTw9t49+mXgizJU583bqgPuL7mKa24n0N1MW1l5v5n1UY+ZthdkFQ53bD8CRyDlte8nfszRnDqYv5pTobUBWsI6XIsFEmXOhKNgls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=T9lH0l9+; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1754296766;
	bh=+UQNR87JqsiMWpi6tq6IQe50rNVzww3thLYixk1ylc0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=T9lH0l9+n0dJQ8tt2yels+lj7GDg+p+ZXDTqx77hwCB4yhv9LxyVczUYyzh/WhPw3
	 DIuG5W8lTSJ7qsaXCsfKCHUmdygy0woYT7IJ0B23AZ1XE/pDZp5Lyrm1GwmI5auCgc
	 a/MZO3aRRvMuCE1DbahtAv2246AqDTFYl1M3yJHg=
X-QQ-mid: zesmtpip4t1754296758tf3d59e16
X-QQ-Originating-IP: LfcoRIPAXfcoQkiGgzEIBZ1ojUuFOQm8+AEblKW6hyg=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 04 Aug 2025 16:39:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6827497052602782096
EX-QQ-RecipientCnt: 6
From: tuhaowen <tuhaowen@uniontech.com>
To: mchehab@kernel.org
Cc: tuhaowen@uniontech.com,
	huangbibo@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	wangyuli@uniontech.com
Subject: [PATCH v3] media: dvb-core: remove redundant new_node cleanup in dvb_register_device
Date: Mon,  4 Aug 2025 16:39:08 +0800
Message-Id: <20250804083908.17557-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250804031553.4411-1-tuhaowen@uniontech.com>
References: <20250804031553.4411-1-tuhaowen@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OJ4oa9ZmqtmHcLyRvO3jkl5jqPRIbZgZL10ZPp8a4DVRwZUAi4jp2P7i
	09cUmPKu1r41MZND68XHZvZGwzkapnrKBcZGZkpNUgO7hGdPp7ObWxUL0o89/wkiHlIoWoc
	ILyMMmUZbxbyRFO+dUQi+lI3AG+gdd3+jUNCSPO6RSn3n7FHzJr+GKo8pqz8WMz2g+aDFVq
	wi87VjTJ23tfy4YPUmEZMUkhsUuyMYMd5kEI69YhF9gBWjuov+qkjSSR0rRAPXWpZR3jMZv
	58T8PpLHjn8g8qOLjcfziG9i1GBRjTRl0dxXRSa8rhiw32xavdZ3qkfPz+Qsn9ufcfPJMFi
	h6QkGZim52vT7ok3gIBVd7/yFOX0EgLvYo/OJh7zkTYfzmQiNqzYzPbCCITzpqR8GiHbmjH
	SKBuzrMImVcEe2j4gW6CpNv3HVRNj1eMKnbGTpdE8c16UVSiZIp0T42WXUk4P3igIVv14mZ
	DofuHX/aB8+3f3nm8KNAtsuzZDr+Hc2zCutusj4TtZjusV4a3Kf6vQogdlzAqveXnGeQSYB
	EILIpWaKDrxdlsn9FnBcvFgLhjOqPuhV/DBLJ9LG2u5Rjpacji0qUBhy1a04JnAic6g4LTO
	2en/X5344+mm9l6wxAUQp2l/IZrsX8DhhHdpr0SavLlBsi/J1SF7K2lsHN0hWt+O+D7v+J0
	AGaaCBGT4VJqXtD8FwSalwRp5A7nByms5VRD3eSEV3i1iHeAK4wMn0AcZNmWZ9jckDKMEbQ
	XmvycqDBLXtdVTToftlNo/Cj1Y78dVe6qcdCiea+Zbj48GNvn7iIbFAmod7v7DX8v+qG/RR
	ydiLA8l8X17iketOEFEBQrpBvUJcDdsWMA02+HjxFdqoXYmfOlgModwhbg8hDuIfjHkXHoz
	pTl2cD+/nghuSAG0OtNhBt3wLTkD28ZYFsJMCEFIJbuepNz0cZmRp4BdTSXKWPH65XAgGk3
	p/CM5ccmKM5PJptM3lWJDLKj34FuVmoPvEVXu9R82MFzOJEWF70aK+h9XYiqZ+6Np6be7PG
	pAZ3C6bWaveQ9hxNQNgJHJcRRVwN/bmNBzFsWW8dA0je/tJ7n7
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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


