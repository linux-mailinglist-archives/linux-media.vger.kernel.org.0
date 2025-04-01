Return-Path: <linux-media+bounces-29096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F753A7734B
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 06:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A76303AEE93
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 04:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35A71C860A;
	Tue,  1 Apr 2025 04:12:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF9E7FBA2;
	Tue,  1 Apr 2025 04:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480737; cv=none; b=MmJFV9AK6FKC7LKXFHjkJnrvqhzYgdSo1E/8aBlNdOlVL1ftWsPrAe5YQ6Li2mACm85Irfr94Rd8mpzrF3KDqy3zBTFWYxaorcNxL7cIdBe7q0EY1WAR6Iwr9B3J/1E9ZalyHunvUZNoJnHAZSzUMax5+4gj+R7YNV1c2DZe7tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480737; c=relaxed/simple;
	bh=rTx8MvmTBpW5t6mgl50Rs3iMX+EIlOymsf7bK+Q719A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oHCJlR8bVzDJXXZQ3tdZkzd2bXJZrH4ABYtuROF7K135FAZmCfy6wyszrantEs6MNefwZb4e89uE5Va0XfLzH//ZHy78l9xx36jLdlfEsnNQRl/f0ba8Xi1mBvztxLpNv0G/x8HRQCayvl1oJVUvym60tBCNXFPMoapmyvlaJIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowACn3gaRZ+tnerKTBA--.2373S2;
	Tue, 01 Apr 2025 12:12:07 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: mchehab@kernel.org
Cc: yujiaoliang@vivo.com,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] media: dvb: Add error checking for bcm3510_writeB()
Date: Tue,  1 Apr 2025 12:11:41 +0800
Message-ID: <20250401041141.2016-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACn3gaRZ+tnerKTBA--.2373S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJryfCw45Xw17tFyktrW3trb_yoW8Cr1xpr
	sFy3yrZa4jya1xGFnxtw18KFyrtw1rtayrKF93CF1xZr1rWay3XrnFqa13ta45ArWfJa13
	Zw47JFWxCFyqyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbSfO7UUUU
	U==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwwSA2fqg1RtQAACsv

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
 drivers/media/dvb-frontends/bcm3510.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/bcm3510.c b/drivers/media/dvb-frontends/bcm3510.c
index d935fb10e620..fc5853fc9595 100644
--- a/drivers/media/dvb-frontends/bcm3510.c
+++ b/drivers/media/dvb-frontends/bcm3510.c
@@ -270,10 +270,18 @@ static int bcm3510_bert_reset(struct bcm3510_state *st)
 	if ((ret = bcm3510_readB(st,0xfa,&b)) < 0)
 		return ret;
 
-	b.BERCTL_fa.RESYNC = 0; bcm3510_writeB(st,0xfa,b);
-	b.BERCTL_fa.RESYNC = 1; bcm3510_writeB(st,0xfa,b);
-	b.BERCTL_fa.RESYNC = 0; bcm3510_writeB(st,0xfa,b);
-	b.BERCTL_fa.CNTCTL = 1; b.BERCTL_fa.BITCNT = 1; bcm3510_writeB(st,0xfa,b);
+	b.BERCTL_fa.RESYNC = 0;
+	if ((ret = bcm3510_writeB(st,0xfa,b)) < 0)
+		return ret;
+	b.BERCTL_fa.RESYNC = 1;
+	if ((ret = bcm3510_writeB(st,0xfa,b)) < 0)
+		return ret;
+	b.BERCTL_fa.RESYNC = 0;
+	if ((ret = bcm3510_writeB(st,0xfa,b)) < 0)
+		return ret;
+	b.BERCTL_fa.CNTCTL = 1; b.BERCTL_fa.BITCNT = 1;
+	if ((ret = bcm3510_writeB(st,0xfa,b)) < 0)
+		return ret;
 
 	/* clear residual bit counter TODO  */
 	return 0;
-- 
2.42.0.windows.2


