Return-Path: <linux-media+bounces-57258-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFG2KM6WxmnrMQUAu9opvQ
	(envelope-from <linux-media+bounces-57258-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:40:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9BB3463A6
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:40:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0B393010BB7
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8213F7863;
	Fri, 27 Mar 2026 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="bnURapak"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD7D3F87FA;
	Fri, 27 Mar 2026 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774622321; cv=none; b=Sc238nwkEgv4mF7xC8g1HDxHT9cYAMuHy1jcQTGf9KwzahizkkcOid/1ds39B+oJ5xJ/ZemaVAcM83QbQC5F5WhcAOCFXQf7gND1g3EzPYm8tDJYe/zdpkPKJeX9nOeBOxcQN55cyw+rrqERFtZEbx6ydD1E/K+QZYrhnN/2qtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774622321; c=relaxed/simple;
	bh=Pa3nBkbgcSlsYbSRA38GAPFni2EADrmpImFsg5jcMAU=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=lS2phEcKPVfmhvGXJstKZkfmAxwoVRWP1Xf8wTr2BpXtDK6iY1OY+CbSfbW3oeUH2tC3xW/Gf3Lj5GBf8944CoxL/wX8380YWWtjCkfEA0HP4d82McE+QmC8n+LtOzhTVJ1RNEXGsNFzJ3oyVUF06y7DqneJFlUMOdA5RzjkcyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=bnURapak; arc=none smtp.client-ip=203.205.221.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774622298; bh=wY60V7j/mX8a5CofQ5zKceewlG16GFAgDK+PPn9k2Zc=;
	h=From:To:Cc:Subject:Date;
	b=bnURapakQlZBDZy7K5eCLagRv/uQ9t7N9wjcbeztXdbQnbCbeNNYUZY+CL6fI8gWt
	 Y0wq3uZrIeB7q6i7ibbxs9ywOHIngcwKzD+pPIn5nHZtNpgdpN+iUSH7Xna3Q65g68
	 yKOa3s/GMEERAGCdp/IKIzGBVFhS0WqLmkQ+6RHY=
Received: from LAPTOP-KQCD4QBN.localdomain ([123.121.145.48])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 98F0E252; Fri, 27 Mar 2026 22:38:15 +0800
X-QQ-mid: xmsmtpt1774622295tlq39w192
Message-ID: <tencent_A6BA9F112D5C2AF48A24BA55113B562D2F09@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GevpqaKte0fd3tYsNb129t0ZpA+W9huvWxZy6+WlWJnOwedS/KO
	 2V6zk4WZvnqd2acSHw4QKHo76htYvh0D9LtAnflKVH+bnKI72r0CH0OZWjo6Nignkd+bCiBI8Ugv
	 8pngi8rTHHWaagoF5jCUk6dPMZxUA6EZXmduFwSmdkBJnPArgS8kMAxZjiNyBCIc/dcWCXbztcTM
	 1hg2aZEC9SHZ3qIHOLVddjRaDtZTsQNV2JMptZNyjDdT6NYQ7F69XMNg/a4VRWlotjPB8GwtLL7I
	 r9NtlHoNbY9XkCisp+1D50TKqUYoU0BmSp/g9mg9KZjpqbwd3nZcb+olFp3oxcuvpEwjJv2+D2kB
	 t5Y2TIVQW+1ePybiStV8Y+efHSF0ZAM+09EVOpzWX2LSjjcOUlZ7WjgLKAAN2S+ETtonN6XPzH8v
	 1y8QdZ9hN2OmrwGbyTvtY0tjHHX8Ffcvm3NeJvcr3EruirMbRT2gXlflJD26DovaybDJsHSTy2VT
	 xbXeJAXHn1/WlHyQyvOBmapZSg5qdw2T+AxnSqNNxeoNYvf2y0+o0Iv0S16MUHATecQoQAWBq0nk
	 76Jtv7arwNQgve1XF2iJB0xkNPdqZq6JHa+q7K3ulLKmIe3WeTL4rCe/UkstG+OTUsTUZ8+AP37p
	 PnHyNh4DW6+uo1JqsJNahwAaGQaBsn7DaY7CWufJo/Qng+koTYZ7S1G0Y7ILMZ7hmaxkPFDo21Zc
	 TO5dxT+wEWYKmp9fuHMjYZZv+llUpcUjux7pFqfOMCL0DXMqJjFVpqCo6LR2be4jWj6pc+jga2z/
	 ZuBq3Mvz3jE1uK1vdcOaXXBDR3uFX0XgoAl2inpIebtaoVQV/rPYXLlck5hpXYDhh5HUc505G42K
	 S0HX+YrGXjFJr4YgRGXqr64UT4yYh/+RMmTyxxqctwEvneaxo4MLCNcmXHFXhUxzgX0VrG9uSYNz
	 7Zp3juKl0OsqqQWH8g8+yIVpLDr+7QTrDlUdS5eC+6mk96Xs+4nB2fFWhm3VEA3AQVpr+g4nTF9H
	 qM/fK/xdChCz7PffUsVVyuL6LEc7GRaQa5XKcHLsx1enPPV+3c47zZs9KHIXU1si4p4FiER9bLbR
	 nfg8Ss
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Wenyuan Li <2063309626@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Elfring <Markus.Elfring@web.de>,
	gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	Wenyuan Li <2063309626@qq.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] media: tuner: add error handling for I2C transfers in set_type()
Date: Fri, 27 Mar 2026 22:38:13 +0800
X-OQ-MSGID: <20260327143813.482-1-2063309626@qq.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,web.de,bjtu.edu.cn,qq.com];
	TAGGED_FROM(0.00)[bounces-57258-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[qq.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[2063309626@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Queue-Id: 1C9BB3463A6
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

Fixes: 93df3413f1b4 ("[PATCH] v4l: 655: added support for the philips td1316 tuner")
Cc: stable@vger.kernel.org
Signed-off-by: Wenyuan Li <2063309626@qq.com>

---
v4:
- Added Cc: stable@vger.kernel.org
- Updated Fixes: to original commit (93df3413f1b4)
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


