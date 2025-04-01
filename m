Return-Path: <linux-media+bounces-29100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42052A774BC
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 08:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0FD2188E341
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 06:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBC51E573B;
	Tue,  1 Apr 2025 06:50:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B261E47CC;
	Tue,  1 Apr 2025 06:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743490203; cv=none; b=M6huXftEPmj7fWsrEf9wtKJYAvCZmnVEjfqFZTJOdrrfK+j8dEKsPO/AfjzvsFPLljATqrxX4p1fMKZNB5CoH07eVDz8V2iXpNHeazMRDCIvCDAAqHxK+rdJg28fN9vN+S9MPlqEarsX6xgzp6cj3dCouf8PGxT3gHCRcF2cmmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743490203; c=relaxed/simple;
	bh=27r4/iX848xmdLPdCysAlfe1sp3aFeG1lAN98CF8X74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CzYCrTNLjQG2pjGoZglKvRU7438Rx1jTl21o67KsbADnkPv+/IxUEYIhd1fSPOl79bkStdzZKK8F6XXTcYroAcCj2rX5aXEnKOAM9GMfb1xKIUZFVz10oGBOFirLNt2iaZ1d73XQC7cuDxKgLqHKWTsvgZNzBa/ujfz5jGBCkqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowAD3njuMjOtnyJWqBA--.16943S2;
	Tue, 01 Apr 2025 14:49:50 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: mchehab@kernel.org
Cc: yujiaoliang@vivo.com,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: dvb: Add error checking for bcm3510_writeB()
Date: Tue,  1 Apr 2025 14:49:31 +0800
Message-ID: <20250401064931.2104-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD3njuMjOtnyJWqBA--.16943S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJryfCw45Xw17tFyktrW3trb_yoW8Cry8pr
	sFy395Z34jya1xGFnxtw18KFyrKw1rJ3yrKF93CF1xZr15Way7Xr1qqw43ta45AFWfJa13
	Xw47JFWxCF9FyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYCJmUU
	UUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAUTA2frSE7cowAAss

In  bcm3510_bert_reset(), the function performed multiple writes
without checking the return value of bcm3510_writeB(). This could
result in silent failures if the writes failed, leaving the BER
counter in an undefined state.

Add error checking for each bcm3510_writeB call and propagate any
errors immediately. This ensures proper error handling and prevents
silent failures during BER counter initialization.

Fixes: 55f51efdb696 ("[PATCH] dvb: flexcop: add BCM3510 ATSC frontend support for Air2PC card")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/media/dvb-frontends/bcm3510.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/bcm3510.c b/drivers/media/dvb-frontends/bcm3510.c
index d935fb10e620..9e60020a8fea 100644
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
-- 
2.42.0.windows.2


