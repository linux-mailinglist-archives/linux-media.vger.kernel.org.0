Return-Path: <linux-media+bounces-57199-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDJwIYc4xmm7HgUAu9opvQ
	(envelope-from <linux-media+bounces-57199-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 08:57:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E535340AE6
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 08:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF3E6300DF40
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 07:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E4128D8D1;
	Fri, 27 Mar 2026 07:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="LOQUaLQt"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAB137E30A;
	Fri, 27 Mar 2026 07:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598264; cv=none; b=cwmuX1EOATtEJa6Xsc/lCGJ0iCTWXxRezGIhH4k8+Sgg/B7rxr3QIMv8EqUPU42bbDMEQ48fZWHN9lIVXgFCtxx++w7My4012rurWhZbDvTsOYzCM0770DtTQl5aCaHGcL9OqG5FDKKwsF7djQuPrOVtn4jY1Sl0cCWdeFVuWhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598264; c=relaxed/simple;
	bh=nD3a7ca5zXF3Flx/ktgkCUyfrL1kJnSzSg2w9Fei4dg=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=t+JGN+zCWREpPenPg2l4a/JqDcyExndCdBfVXw7333+kGnaq+3o2uDSui1KBsQ8GYSPgL+ssnBDT5JbnooAk49lfpyzPcCAiZ1LK7Xq2DWih/h9f6dRSE2miV48RBZJNqUlKGxUiUUlt/mukxB4tw6w3LplPv+EwM/a1lTjRYcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=LOQUaLQt; arc=none smtp.client-ip=203.205.221.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774598247; bh=k2hiTA0VrEVVfu22MmrOZ7p/qypkx3TZutY3DMt9uEw=;
	h=From:To:Cc:Subject:Date;
	b=LOQUaLQtyT3m5Jyu524KYJicOLY7oF3fcGuFGvqAsAK6HzI946EE5oVy/AIg9rR7I
	 OZThbXSvqFi4SynyzNHL3pUe8UUn19bfI7edyKBiHDmsHElf5yKQDtUFOTrTaepDds
	 MF746KO4jqLtMRho0KvMDbYCB//Jo+2XVUwjKNKk=
Received: from LAPTOP-KQCD4QBN.localdomain ([123.121.145.48])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id E57AD248; Fri, 27 Mar 2026 15:57:23 +0800
X-QQ-mid: xmsmtpt1774598243tgkyhgoqm
Message-ID: <tencent_86EEF38C057E85789162B70AA2D92AC90506@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLmyMCnm3AfQaOvF342rYuJlVJ+r7CMnGe+5tdP8p7R+K3WH4+HP
	 tqFQqqwdUBhzyqEUZM+2/psq8xnn8lm6xOftAbvndIk4XGMiUKBWyf4eKTvAE1pSX/ydMkGVpw6T
	 6laolkoeHerjj3O2Hf+kN6908HJdOAb03Y9VQHYONdHE4M2DQ0OZeyYZVvpSXMlfK6Q9wFLemEyC
	 uprmX9jy5XEiNFlk7e/m6mFHU4dULdHNJgvlwETZanLgTj2yiG6vkKNnjaLk4n7a6aopzfT3KEyE
	 DraDX2RiBNf5H6pBvjzLpjuZkLZpBEVw1vah3JyqpDrveyDYXUdjN3FW2WSKpuQpnhqSyhhoOLSV
	 GKvnScXNbKgyQ8gh2D5dlZSHwWur+Gg6N28Q7/KHcWCuXSCHHoVR2T8cPoZp4y54VD0NClyDDkSQ
	 BdJUwqaUpC8XDcjwQoWiIhzmBL4vUtwhvGTnHuZjRWhfMn+7FgvwcYp1izKaLzORd/BMB5vUcYgu
	 AXYxEsYl2gQOB4zaZamft3oqLu3s96bVvph/kMgMil2yvC+IsbY+i8F8k+S8T7IUYargA8pxEd6S
	 6RR44f01kgLDgIvo+uYe1D0yetAbq++9OjmhNBIwIWtYp5eQy8nuQo8opCBU/zGqCFek2qyFvg8v
	 iiIy+FeLZo8RElHw/9McHfqGfpmqfTX+/g8AtMTN08hQOQOFnjcmaC4v2xHQnwOgWrzSfJ+n4+Tb
	 0qtRVSBg5NmHDzjOnRMJqpDhLZhg48zxr24b7aknWzhcCY5gVjQoegMiXFUp5HvBZPszna3wfBVy
	 hS+lDue4GOqyhfJerIs2MJOxwRzdjrFzj32OlC7jxtocrVQ54kYGNozEcdGQMvdEsQnMYcL6gkx6
	 oP2bcOiqIgWzkKcDWYKQOhfGNKRpXR6oKOgcVqnKlINhPew+t0XelhYIiF2M/j48tmpVVkUEGuVR
	 zb1xgEMVQgIbBx1PTuespl/rd9IZsARk+Psi87MlYjCTTAjVfvCR9xRKZQl1cnGl8A5e+insE77o
	 Q+i2XVdetJ7v6s6HlkI8Fr4hR7/S1Jvi20t4OtJA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Wenyuan Li <2063309626@qq.com>
To: Andy Walls <awalls@md.metrocast.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	Wenyuan Li <2063309626@qq.com>
Subject: [PATCH v2] media: ir-i2c: add error handling for I2C send in get_key_adaptec()
Date: Fri, 27 Mar 2026 15:57:21 +0800
X-OQ-MSGID: <20260327075721.11411-1-2063309626@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,bjtu.edu.cn,qq.com];
	TAGGED_FROM(0.00)[bounces-57199-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[qq.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[2063309626@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Queue-Id: 1E535340AE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In get_key_adaptec(), a command byte (0x00) is sent to the IR chip via
i2c_master_send() to initiate a key read. However, the return value of
i2c_master_send() is not checked.

If this I2C transfer fails, the IR chip may not receive the read
command, causing the subsequent i2c_master_recv() to read stale or
invalid data. The driver would then return 0 (no key) without logging
the error, making debugging difficult.

Fix this by:
- Checking the return value of i2c_master_send()
- Converting partial sends to -EIO while preserving kernel error codes
- Adding dev_err_ratelimited() logging with %pe format
- Adding similar error logging for the i2c_master_recv() path

If the send fails, return 0 to maintain the existing behavior (no key
detected), but log the error for debugging purposes.

Cc: stable@vger.kernel.org
Signed-off-by: Wenyuan Li <2063309626@qq.com>

---
v2:
- Add error handling for i2c_master_send() as suggested
- Extend checking to i2c_master_recv()
- Use dev_err_ratelimited() instead of dev_err()
- Clarify error handling behavior
- Drop incorrect Fixes tag
---
 drivers/media/pci/ivtv/ivtv-i2c.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-i2c.c b/drivers/media/pci/ivtv/ivtv-i2c.c
index 28cb22d6a892..c011f2246add 100644
--- a/drivers/media/pci/ivtv/ivtv-i2c.c
+++ b/drivers/media/pci/ivtv/ivtv-i2c.c
@@ -138,11 +138,28 @@ static int get_key_adaptec(struct IR_i2c *ir, enum rc_proto *protocol,
 			   u32 *scancode, u8 *toggle)
 {
 	unsigned char keybuf[4];
+	int ret;
 
 	keybuf[0] = 0x00;
-	i2c_master_send(ir->c, keybuf, 1);
+
+	ret = i2c_master_send(ir->c, keybuf, 1);
+	if (ret != 1) {
+		int err = ret < 0 ? ret : -EIO;
+
+		dev_err_ratelimited(&ir->c->dev, "i2c_master_send failed: %pe\n", ERR_PTR(err));
+
+		/* Preserve existing behavior: treat error as no key */
+		return 0;
+	}
+
 	/* poll IR chip */
-	if (i2c_master_recv(ir->c, keybuf, sizeof(keybuf)) != sizeof(keybuf)) {
+	ret = i2c_master_recv(ir->c, keybuf, sizeof(keybuf));
+	if (ret != sizeof(keybuf)) {
+		int err = ret < 0 ? ret : -EIO;
+
+		dev_err_ratelimited(&ir->c->dev, "i2c_master_recv failed: %pe\n", ERR_PTR(err));
+
+		/* Preserve existing behavior */
 		return 0;
 	}
 
-- 
2.43.0


