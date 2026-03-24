Return-Path: <linux-media+bounces-56841-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A5dFFJkwmmecAQAu9opvQ
	(envelope-from <linux-media+bounces-56841-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:15:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B29B30650B
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52B1E302DD49
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37083E2774;
	Tue, 24 Mar 2026 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="W0VVC+Gw"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com [203.205.221.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211E33E120C;
	Tue, 24 Mar 2026 10:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774347304; cv=none; b=ZhbJyItPlhbXL1OzRbXW2HA5MD1twLEUQ+VDQZijBmpPVcV3l7/OU2DZvHC3gJ3M/FtM9hnA8qlPalAM5byedsS6bsEsGoLpEeVnQw3PrwmMDNZtbrCmaw8wzUsaYkVnV57RptPFaHZ4kCJ8GqglN4BIxvBF+HPZiSSFMqNBKUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774347304; c=relaxed/simple;
	bh=ronkjFMXLWI1oILcaH6pzrcv6KmiL0vVS0bchrVroo4=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=jsObYjTc/suNqNZ+xMmdYpP2SI5hveNxal2WH61zeDJx8jekel+JTZ/GYwzY61pxqVOXThm7JP+2m7/A+Fbn2vRGliuw9oTBEsK+SWzKnlQUlQfp1QLrdEHTI12csI2/lhzfPfwDQ7Cuk7z4ZOkgqjSguXW0sg6r6MA2Ki0RQ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=W0VVC+Gw; arc=none smtp.client-ip=203.205.221.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774347299; bh=HC3Osx/DWM1YA/pVZjuHEjxUiZ9GkLihhnqc560hgRc=;
	h=From:To:Cc:Subject:Date;
	b=W0VVC+Gwu8KXClQDNKCPxAuQAJpmcOh5ltOMUoJh96E26sOa6+jAOFsMs+/+tHgEp
	 JxEJf/xmt6vvz0gReshKYZkYT6W4zJtFEKb4PpkJcTCwZt3tLNOWhjdXVbYvLOFCx+
	 vNfNAVKr1wQqf+IP1yCGfg1HTLfyC7QU/Q1Ge1eI=
Received: from LAPTOP-KQCD4QBN.localdomain ([183.242.199.70])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 3B7B4A23; Tue, 24 Mar 2026 18:14:55 +0800
X-QQ-mid: xmsmtpt1774347295tb4bui4qm
Message-ID: <tencent_4F74E32262ADBA5C903DA759F45788147D0A@qq.com>
X-QQ-XMAILINFO: OFpInORavztR/RBiedvg03gDt6clbCdn4WrBEAWvIGGYIIeXFBShPJtrP+Itck
	 J52vCTWu0Oe5CfLgUEGgsSZGcSeqWhJkDseBdNifIszM0nFWBYbCTbzKZ1K46fuo5HC3J/TQ1SuJ
	 Ld1bffogtkzc8P8HShl290JvlXjqYQ2RjY+ULMRE8hFXGRKw9PEbA6B+MgIHnZ0TSeXdTnMgcJ2D
	 P1xI6XJX3zjInCrN8WLfscOHXi7o3Q6FDiQl4HN8vvcU+tr/hLmu8fXhwU2qsX6lHnaBTvzRnS5h
	 4KuOmz5JAmJBC26xC82O7t3Z61tzWErc1Kicvh24SCHySL5oZnM7R4RuZayLRrPhYbOu8sHcTe9q
	 Qiz2aU/BlpKGNrqhgsWn2qS5ErU1LS/hR3PQMdxFf1YojewSRenMLvrQD8uX3WhKLu91h9GpGbYx
	 fhlAEyLLuJ3ufGcYOF36aPRqofI1rqO9KZdljLQtAji2iZcRseNT3uuQdBqxfQxpyU2gJafCQWtg
	 zY7STzIF+d2o4G6B2Mz3q8ckhsDrurF2UPMxq/5qHFW6BZRjSs8kVyFSrgFB9rwBm4oYUFR92FSE
	 vd+PRi6oCDEXAc8IDgVQpI/SbpYztTDmtlnrKLHs1lIzAbsQ/rWx7gKK6TO3hAvSRFFkixJttBce
	 lq7PIbxa0D8jpFuDd6hIwsN8FO7/hDQq4P81o8q0cGa0syQvtD9VXg+q6bFFSkd6IdX9YGkcPr5q
	 hLPuoymYfbLQJs/Lc6w+bJpH6gzMZT/3a5cbBLscpcmjNwaim9PuhWdMoOeHgNhx+FAEiJECGBfa
	 BOayO+FEqe3uAa+CspSNFZw4XPWdnmIf+pj9rAiUELvQ2sZKjMCG7fE7tWRRcb+aqhp6+VrKMphE
	 y6Agqaew7hypkOHf8kLlKrypi6tsr13BtA/R9R2fDABXGS3NBw9ousqL3sQxsxuDspHOoQREc5Ux
	 R5qzaSULaNjpNw2u2K4R+HPlpmNqGHXIg/Qd2gxlRnh1JwS+f6kXvFWYWhND5fsqXNxQD4i/BDpm
	 h+R0cYFFApNDJBpzywVW92kK/13wCvImbPy32E0a2guCkjY7Sc
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Wenyuan Li <2063309626@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	Wenyuan Li <2063309626@qq.com>
Subject: [PATCH] media: tuner: add error handling for I2C transfers in set_type()
Date: Tue, 24 Mar 2026 18:14:54 +0800
X-OQ-MSGID: <20260324101454.12433-1-2063309626@qq.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bjtu.edu.cn,qq.com];
	TAGGED_FROM(0.00)[bounces-56841-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[qq.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[2063309626@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Queue-Id: 3B29B30650B
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


