Return-Path: <linux-media+bounces-30674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7017A95CC4
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 06:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4DE91898D85
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 04:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2978519F42D;
	Tue, 22 Apr 2025 04:07:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B281F2365;
	Tue, 22 Apr 2025 04:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745294850; cv=none; b=EQVJDffn0Vbnm70bzIxLTDjb+OyqwaST+169d15Tq691JsOOOOy0nzz/UoF9YfaXuilxo+RWhfGU/S1o4RAE2D48EFU3MaHydyTscF8HowR6RWFxHbWTr+qxCY68Pn9WEmp2ZFEFkHs90HLEw6Xep2YWYliGesQDSbohcBzqXX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745294850; c=relaxed/simple;
	bh=WcRU9ZEBKolFnretzZffT86Ip6dYByleNHe+D7oPXYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vCTNgwScTDIeo595sgY2T+KAPVhvqgRZ343sTJd9yHr71u4oI57LN5PTuY1zeQLB+6DYGzf/4mdS5qBxjr4M28ZEq6ZYQvQo5x9j49UzbmGFVQsg1+b8ZqDEfsc3uBHkTK1R/sFBlc8F9PcWzn8ZS+4j++gAyJVMeOH3VP+N2uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAA3dAz5FQdoRN8kCw--.63174S2;
	Tue, 22 Apr 2025 12:07:23 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: mchehab@kernel.org
Cc: yujiaoliang@vivo.com,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] media: dvb: Add error handling for bcm3510_writeB()
Date: Tue, 22 Apr 2025 12:06:56 +0800
Message-ID: <20250422040656.2131-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAA3dAz5FQdoRN8kCw--.63174S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJryfCw45Xw1kXFyUGw1UAwb_yoW5Jry3pr
	4jyFs5ZayUtw4rGFnxtw18KFyFkw1ft3y8GasakF1xAr15Way3Jrn0qa1aqF98AFW3Ja1r
	Jw43JF1xCFyDtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUejjgDU
	UUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAYAA2gG6Ey+5wAAsa

In bcm3510_bert_reset(), the function performed multiple writes
without checking the return value of bcm3510_writeB(). Since almost
all the bcm3510_writeB() in this driver have check their return
value, it is necessary to add an error check for the bcm3510_writeB()
in bcm3510_bert_reset().

And the returned error code of bcm3510_bert_reset() is ignored in
bcm3510_set_frontend().

Add error checking for each bcm3510_writeB() and propagate any
errors immediately in bcm3510_bert_reset().

Add error handling for bcm3510_bert_reset() in bcm3510_set_frontend().

Fixes: 55f51efdb696 ("[PATCH] dvb: flexcop: add BCM3510 ATSC frontend support for Air2PC card")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/media/dvb-frontends/bcm3510.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/bcm3510.c b/drivers/media/dvb-frontends/bcm3510.c
index d935fb10e620..fe89d46cca1d 100644
--- a/drivers/media/dvb-frontends/bcm3510.c
+++ b/drivers/media/dvb-frontends/bcm3510.c
@@ -270,10 +270,22 @@ static int bcm3510_bert_reset(struct bcm3510_state *st)
 	if ((ret = bcm3510_readB(st,0xfa,&b)) < 0)
 		return ret;
 
-	b.BERCTL_fa.RESYNC = 0; bcm3510_writeB(st,0xfa,b);
-	b.BERCTL_fa.RESYNC = 1; bcm3510_writeB(st,0xfa,b);
-	b.BERCTL_fa.RESYNC = 0; bcm3510_writeB(st,0xfa,b);
-	b.BERCTL_fa.CNTCTL = 1; b.BERCTL_fa.BITCNT = 1; bcm3510_writeB(st,0xfa,b);
+	b.BERCTL_fa.RESYNC = 0;
+	ret = bcm3510_writeB(st, 0xfa, b);
+	if (ret < 0)
+		return ret;
+	b.BERCTL_fa.RESYNC = 1;
+	ret = bcm3510_writeB(st, 0xfa, b);
+	if (ret < 0)
+		return ret;
+	b.BERCTL_fa.RESYNC = 0;
+	ret = bcm3510_writeB(st, 0xfa, b);
+	if (ret < 0)
+		return ret;
+	b.BERCTL_fa.CNTCTL = 1; b.BERCTL_fa.BITCNT = 1;
+	ret = bcm3510_writeB(st, 0xfa, b);
+	if (ret < 0)
+		return ret;
 
 	/* clear residual bit counter TODO  */
 	return 0;
@@ -566,7 +578,9 @@ static int bcm3510_set_frontend(struct dvb_frontend *fe)
 	bcm3510_do_hab_cmd(st, CMD_STATE_CONTROL, MSGID_BERT_CONTROL, (u8 *) &bert, sizeof(bert), NULL, 0);
 	bcm3510_do_hab_cmd(st, CMD_STATE_CONTROL, MSGID_BERT_SET, (u8 *) &bert, sizeof(bert), NULL, 0);
 
-	bcm3510_bert_reset(st);
+	ret = bcm3510_bert_reset(st);
+	if (ret < 0)
+		return ret;
 
 	ret = bcm3510_set_freq(st, c->frequency);
 	if (ret < 0)
-- 
2.42.0.windows.2


