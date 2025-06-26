Return-Path: <linux-media+bounces-36026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFD6AEA375
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 18:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4704C7B4234
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 16:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EE320E31B;
	Thu, 26 Jun 2025 16:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aladdin.ru header.i=@aladdin.ru header.b="TRIbRc7S"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-out.aladdin-rd.ru (mail-out.aladdin-rd.ru [91.199.251.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46BB1C84B8;
	Thu, 26 Jun 2025 16:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.199.251.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750955368; cv=none; b=Zgfdmzn8l9g23LdNcW/vUvbnyESWarOsi3nZMtx1WdfjEA+zxLxttaPE5gPScCJmrUTk3rTsJlhGzBALdRiy480v8LuMUkI0icwPh5jgnxT4aCnjWoSetxPAkku5v1RETG5FXB8Xe8R3ybsHY57b78k7thTDJviw0r7q+8TNB4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750955368; c=relaxed/simple;
	bh=ybvkxXLpLwsuZAToUGP50R06kot74ScTaoKlBTmR8BY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dkkJOD39mdErLLU6aa+DA5RgQsZDFz9Q54sxumARyPTAtGHeyfwQZZVZLiZL9cnWE24WhoiIdvVSRxa9a3Ta03eJy3d7DBGtSVD8wCXrH8a/ov8cexxwt37KDXkVC/8i+maiv6rZqrzY2WezRE1t4w7X0R3BWOCKe6KYHdJMo6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aladdin.ru; spf=pass smtp.mailfrom=aladdin.ru; dkim=pass (2048-bit key) header.d=aladdin.ru header.i=@aladdin.ru header.b=TRIbRc7S; arc=none smtp.client-ip=91.199.251.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aladdin.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aladdin.ru
DKIM-Signature: v=1; a=rsa-sha256; d=aladdin.ru; s=mail; c=simple/simple;
	t=1750955351; h=from:subject:to:date:message-id;
	bh=ybvkxXLpLwsuZAToUGP50R06kot74ScTaoKlBTmR8BY=;
	b=TRIbRc7SW+mhWh8hznE4yse1wT6INpvZa5+i8gjCnMgGxWtfUtXpCPUzU1F0Z4vqHROEM6vAnAP
	tp1QwlI9Vkzy8EiuMsk/fkQjd1vobykqJOjCWV7dDxf8dqQdv9BPfvjwmEzaqqDY9F0gNmwE2Zmtu
	IOzDdUUCiQcnavxYQXqlcZoTqPqKBxRn2+/dG02/+VtciZYfOFr0TuMrINf1l8XHe1CHK6ymG41lA
	pKSXN1JJtKMsPV2VjVd5X4zf+Wc7zRENlMaRNxK00y0lyZSDuHDPmJ8Dq1fIksInkief2yUIMzhBa
	dpmiTlBl2pTTxPVm7412ZJNUZMpva2YRqrMw==
From: Daniil Dulov <d.dulov@aladdin.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Daniil Dulov <d.dulov@aladdin.ru>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] media: dvb_demux: Fix potential data race in  dvbdmx_write()
Date: Thu, 26 Jun 2025 19:28:56 +0300
Message-ID: <20250626162856.176083-1-d.dulov@aladdin.ru>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EXCH-2016-02.aladdin.ru (192.168.1.102) To
 EXCH-2016-01.aladdin.ru (192.168.1.101)

The field frontend of the struct dmx_demux is protected by the lock mutex
of the struct dvb_demux while connecting or disconnecting the frontend.
However, demux->frontend is checked for NULL and then it is dereferenced
without holding the appropriate lock.

Thus, it is possible that the NULL check is passed, right after which
the other thread disconnects the frontend which leads to a NULL pointer
dereference.

To avoid this potential data race, aсquire the lock before accessing the
frontend field of the struct dmx_demux.

Found by Linux Verification Center (linuxtesting.org).

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Daniil Dulov <d.dulov@aladdin.ru>
---
 drivers/media/dvb-core/dvb_demux.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_demux.c b/drivers/media/dvb-core/dvb_demux.c
index 7c4d86bfdd6c..b0dab6f78ad8 100644
--- a/drivers/media/dvb-core/dvb_demux.c
+++ b/drivers/media/dvb-core/dvb_demux.c
@@ -1141,9 +1141,6 @@ static int dvbdmx_write(struct dmx_demux *demux, const char __user *buf, size_t
 	struct dvb_demux *dvbdemux = (struct dvb_demux *)demux;
 	void *p;
 
-	if ((!demux->frontend) || (demux->frontend->source != DMX_MEMORY_FE))
-		return -EINVAL;
-
 	p = memdup_user(buf, count);
 	if (IS_ERR(p))
 		return PTR_ERR(p);
@@ -1151,6 +1148,13 @@ static int dvbdmx_write(struct dmx_demux *demux, const char __user *buf, size_t
 		kfree(p);
 		return -ERESTARTSYS;
 	}
+
+	if ((!demux->frontend) || (demux->frontend->source != DMX_MEMORY_FE)) {
+		mutex_unlock(&dvbdemux->mutex);
+		kfree(p);
+		return -EINVAL;
+	}
+
 	dvb_dmx_swfilter(dvbdemux, p, count);
 	kfree(p);
 	mutex_unlock(&dvbdemux->mutex);
-- 
2.34.1


