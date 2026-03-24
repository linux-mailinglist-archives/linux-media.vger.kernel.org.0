Return-Path: <linux-media+bounces-56862-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFWjEZp1wmnqdAQAu9opvQ
	(envelope-from <linux-media+bounces-56862-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 12:29:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B374C307522
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 12:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 669CC3089DE2
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FCC3EAC74;
	Tue, 24 Mar 2026 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="AfF1u21d"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F813BE659;
	Tue, 24 Mar 2026 11:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774351352; cv=none; b=eyfNRh/UpNe0cOoJ90ry4g7veaZR53jAHmzrOzFGH2X20URcHec+0nWncQIRqM4WJMqRoKxdKJc0DROXAreRDf7fChZtmYxJNeSgFkBj8mVrZEttlL3b9yqPZbYHMpmCUtvimiA+IrHQZGDVGsvu17ZcbfIMY2fulNB6orP6UMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774351352; c=relaxed/simple;
	bh=7M4TPQ1VJ4F24i2H3luIUZ1NQr6z29u64L02pgnPfhw=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=BbAq0Qr0Q+jg2W/gnyc6dC7qs//1ZnjIs8xlkMXZBEcgJ72FZh3R8AGXa+OWj1ypy1VDj75GpYueRWupn1fwB7wYLOmoTPX+tDx6ri/gAN08zjPPTkmTal0Yu7Xtkb7rondpz3rAj9OjpoKRJOF/FONLOxhCiyGAkke4gZ8x7Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=AfF1u21d; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774351342; bh=tfZgFyBBnwPjeu0dFeKbOIEVkVaAeJHQM0w94GpSZTc=;
	h=From:To:Cc:Subject:Date;
	b=AfF1u21do0gN7aXhZ+xatAYJcC8zEzJQLNIMjaRWMxeCPijDFJmxajHk9lG7b2CdP
	 FE6EnQgS2ryAttC+vCSHzE94MuZIcmQXIxZeAac6WNJwSjygV/BP7VdeqadY/QtdwC
	 7mDojJDros1FbrnM87iRRGAKfb8xLeswoOm451H0=
Received: from LAPTOP-KQCD4QBN.localdomain ([123.121.145.48])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 5942C22F; Tue, 24 Mar 2026 19:22:20 +0800
X-QQ-mid: xmsmtpt1774351340ta3lrxg5v
Message-ID: <tencent_A55E983CA3588C54E8172574B723EAAD560A@qq.com>
X-QQ-XMAILINFO: NXDXLQe6nrnkXrCyOWP34zj/UEFBOxlDCBRYZ6f0N1ulWpY66Mi3bJ3umg4vMQ
	 2PtflH5NGE2kaByEgHiK1X6Z3FV6g+7OhTA8AGGe9LJftijEpjQcGNXN0Y8FOH1D3aJPHKUlrags
	 wZsxs6vPHB+SjbVuHZVqdiCLeQhlKOzJIcQlh/gef2h3Ux8iHDHQ3n2AynGbhKYBf8CvBiBDyJW1
	 PXNnyd185eyEQ+LuzCJlGYGflXEqlifmmh79uzrQCRgYbQLPZjATVoOiJFGpQeYXFZ+tdjcqfmYl
	 kO8AzhATOIjQ/5Mip/OTMi3Rc2Xgqf7nUhN/YLqAvOUgbY+3MrBgWwMLDvl81W6QNCHqDe1iwgFf
	 qG7MWrql8qwhySNnEil2YSUWythd4nCGmRbon1tGA3CJJ+Jti8ADTJluToLnMB/P+1aJ+KOlxh3M
	 Mwfwcwhe3RgiBF7jwVfV5RL3Zn0wftlp4jIIRow8zG2x8EZgtXii60V8UO2aW5AUevziET+VhNIw
	 MyGvQOxzlSCjVg3s2UTJpOckgi9EjtxDxZGpu6hizu95EMAQtELvzkY5dgfOw+2jl1pciJumm2ce
	 xAIrCseqxVp/EPwbmirP6ie1zgUnjIZxE9Gp4+bXdFvcwo2qNkA13Y1TJAY9oOObjjFDVzKhCsre
	 Ilx7tZ/E2UmGiNXy7Zo7O1lBDB38m63mNsTMiBPYRxY/nwsXx1gwPnYfg2W4shYXqodWsSqFJn2l
	 Uf9A75UrmHitPsV9a0w/61m3EHRQEqNIxhmsRmLnD4B8BagBGR+/xCKSJlmXQHcrI4VCiU0ut56b
	 Vr9tJy8b4dSDg1YeLotzLeKxFDywPTJakQXp7VNSVNFSO9EmyxOkxxHWLH4Z5YEHK/yUfAPv8+vM
	 8wQZKaFw6wI00jzfY09cQ5AgKZFYLMN6HAvqw5fMVC4VIs8vwRRV46Xwt8AZ8AfcPUqlYC+5NnV2
	 xl3vIOKCErRtiox+haF2VxBssBCm7aNBFP22UwKFqglpvzDO3lf782gQDIJKak1gjN8e9ynUcTEt
	 S+s+Q6d96Z2M/xAPIWRwxmJOqopBkrzX8rx2LMU0aZjhhq3GlyHDKot4hdleHSHLcruVMMv96mXe
	 nQjUX1YhfB1UFWqPvsAvwOdOX1zaZX5M1PWIm42PY6mOaSAFtKDXfHXICzCLCsEm1gH4s/
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Wenyuan Li <2063309626@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wenyuan Li <2063309626@qq.com>,
	Markus <Markus.Elfring@web.de>
Subject: [PATCH v2] media: tuner: add error handling for I2C transfers in set_type()
Date: Tue, 24 Mar 2026 19:22:18 +0800
X-OQ-MSGID: <20260324112218.1113-1-2063309626@qq.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[qq.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56862-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,qq.com,web.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[2063309626@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Queue-Id: B374C307522
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In set_type(), multiple I2C transfers are performed to initialize
certain tuners (FMD1216ME, FMD1216MEX, TD1316). However, the return
values of i2c_master_send() are not checked.

If any of these I2C transfers fail, the tuner initialization may be
incomplete, leading to incorrect device state or silent failures.

Fix this by:
- Adding a helper function tuner_i2c_send() that checks the return
  value of i2c_master_send() and logs errors with %pe format
- Replacing direct i2c_master_send() calls with tuner_i2c_send()
- Propagating errors to the attach_failed path

This ensures that I2C communication failures during tuner
initialization are properly detected and handled.

Cc: Markus <Markus.Elfring@web.de>
Signed-off-by: Wenyuan Li <2063309626@qq.com>
---
 drivers/media/v4l2-core/tuner-core.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/tuner-core.c b/drivers/media/v4l2-core/tuner-core.c
index 004ec4d7beea..01f28436a1f8 100644
--- a/drivers/media/v4l2-core/tuner-core.c
+++ b/drivers/media/v4l2-core/tuner-core.c
@@ -280,6 +280,19 @@ static const struct analog_demod_ops tuner_analog_ops = {
  * Functions to select between radio and TV and tuner probe/remove functions
  */
 
+static int tuner_i2c_send(struct i2c_client *c, u8 *buf, int len)
+{
+	int ret = i2c_master_send(c, buf, len);
+
+	if (ret != len) {
+		int err = ret < 0 ? ret : -EIO;
+
+		dev_err(&c->dev, "I2C send failed: %pe\n", ERR_PTR(err));
+		return err;
+	}
+	return 0;
+}
+
 /**
  * set_type - Sets the tuner type for a given device
  *
@@ -351,11 +364,13 @@ static void set_type(struct i2c_client *c, unsigned int type,
 		buffer[1] = 0xdc;
 		buffer[2] = 0x9c;
 		buffer[3] = 0x60;
-		i2c_master_send(c, buffer, 4);
+		if (tuner_i2c_send(c, buffer, 4))
+			goto attach_failed;
 		mdelay(1);
 		buffer[2] = 0x86;
 		buffer[3] = 0x54;
-		i2c_master_send(c, buffer, 4);
+		if (tuner_i2c_send(c, buffer, 4))
+			goto attach_failed;
 		if (!dvb_attach(simple_tuner_attach, &t->fe,
 				t->i2c->adapter, t->i2c->addr, t->type))
 			goto attach_failed;
@@ -365,7 +380,8 @@ static void set_type(struct i2c_client *c, unsigned int type,
 		buffer[1] = 0xdc;
 		buffer[2] = 0x86;
 		buffer[3] = 0xa4;
-		i2c_master_send(c, buffer, 4);
+		if (tuner_i2c_send(c, buffer, 4))
+			goto attach_failed;
 		if (!dvb_attach(simple_tuner_attach, &t->fe,
 				t->i2c->adapter, t->i2c->addr, t->type))
 			goto attach_failed;
-- 
2.43.0


