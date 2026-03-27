Return-Path: <linux-media+bounces-57201-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ByjDy9DxmlRIAUAu9opvQ
	(envelope-from <linux-media+bounces-57201-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 09:43:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B787B3412BA
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 09:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9AFD30160FA
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 08:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341F63D8102;
	Fri, 27 Mar 2026 08:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="I4nvw6YN"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C561E1D5CFE;
	Fri, 27 Mar 2026 08:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600977; cv=none; b=FRlWsy3qL59KvZHa5cpIdcGgMNdenZx5k6jrqUeCgYyKR2aAEXYYzXsTgIgEb+i6ijbWbPP/gVg1npAqxHBNhuVwQn40mVgMhlZm/+ZC5Rpn3wSWdBGOoOgCxPsaCnFgPhQ+zTfGGvZRk4ozcJbxyp9gcTl6FXPvsVDMgiA7qH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600977; c=relaxed/simple;
	bh=7M4TPQ1VJ4F24i2H3luIUZ1NQr6z29u64L02pgnPfhw=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=irKtoGQHImZo+mVr/CA/yxhi0kRRI1qwmR0LloJwATFHU3uPMkN8ZwiSpfKe83vxKbPvq4V20/IfDV66zEZ/XtFv1oImU1QrAl1nAt+7eIPUj/hj0lD6Z0b1wmy6r0X4YXAR15+Fblb+kFoSekN0W2HKQk6oArK2JxMe4J4tcUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=I4nvw6YN; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774600971; bh=tfZgFyBBnwPjeu0dFeKbOIEVkVaAeJHQM0w94GpSZTc=;
	h=From:To:Cc:Subject:Date;
	b=I4nvw6YNckUn3GHSO6xdM2CtRsBWYGMNITfxzgfEWlZ+Z8t6Do0w9TlHcuM0XZ3Zr
	 QSFrK+KjYT82An4g3Z7UfKZOgADpLCkGMOBeiR9RNv/i88fRfbMHvLCEbWuPz9pT/X
	 wpTtgtNyngN8v1MEWg45eZAHxmQH1cu0Rd86OJRI=
Received: from LAPTOP-KQCD4QBN.localdomain ([183.242.199.70])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id A61B5A63; Fri, 27 Mar 2026 16:41:33 +0800
X-QQ-mid: xmsmtpt1774600893t95qkaiw8
Message-ID: <tencent_607174B5FAA2EED9C402AC02B548A91B1C05@qq.com>
X-QQ-XMAILINFO: NKDEJ657lpu+535noTlnYHIKLs7iqAjfSTqgGlsKNIY4tXDD2MIEVAdA5Msbft
	 tlanUr+Po/EWERLMoeBQYdmh8QckjTu02BetQ7LdGyGHQzbZgufFOqdXbJDz59p8oKenuEHrX4KH
	 BbRRIT66sZacGTy6XsxEYyKo/gxJRkGnyye4YdVGJG9zMpfJXo7uEH6h3oUNj9bRn6aO8LlmwbbR
	 pzCXOYk9/qfKWe4pTNyQ07hxOvXEDs89jQIXBlmhsL7IhQRWel7uGW4mL23Z4aaq4uHsnWYc0Ns1
	 lSi4c5pa6RbOHn/d+ZgudAZZgHQW1+j3AuxJviFM0/UZlVUTDLfSDDNQgLG7waQ6MlIH4YcZro60
	 Hw0hffUU3TG6SEL0NoEvRXzQ2UqyVub8lK5fAQ3PTEgHHZyC4z5ei1B5OR0IP4Hw97z+8MlibKui
	 o3dz4OnkNU2Nsirc5lIXzSLUUaWvk4tr2GtMQsqI6oQGfd1keAGq0GAjgaE45mVMAjOya/cKXcz5
	 ih7FvsRHHdo8SfdFcTvVLhF1Kz4rPg8Mvu+JLJPVK8CoLC+VmnV2/ZiItwiNfF3/AaeUn8iFpN7y
	 okM/sZSCshRY5UogROzvYCYQ0yi1fD/T7Cnsmlwf7oJSj1ZBbJbK2GYwmNWepB3+Z3+W8Sm+C3Eu
	 jH2yh4NzTFTwYOeVVwkCHvpr7UqtyB/AWD7q7KlzslLvkd7Zbn65Wc8FYI0/icXB4+edOdPRDk4P
	 MbJxP9I7nnT462WTPxXmw+9vHoUfnTao8cnNplPy3h+GqeNHPS6lrFRtCm+Njcl3dRGFFxpRiqS9
	 NwC7gK+QqDAXrqwOPxzr5TLC7Gc4sbfmZCcEkvAgUNd5boFV5pokY5Br6f0qC48BaXWYzlfeFkl2
	 EtXobLi+LT3CIQoQQbkoPRYhoC/CWW30mlOMxkoD8aFEADVIFLEje07yrd7T/w4Lpw1KY7VnQLEG
	 usKVId/zUQwa31tTy3Ok/k2//TroreMEOp10Xsgl8Kvgx7uUKxPpvOzmMX1kuL1S04RXEC/O16lw
	 eKJShSfLRyYnDiqmg4qRt2l92jzdf1MeFl051ptjqag0ooUW+3HI7Vp7KxVcQ=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Wenyuan Li <2063309626@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	Wenyuan Li <2063309626@qq.com>,
	Markus <Markus.Elfring@web.de>
Subject: [PATCH v3] media: tuner: add error handling for I2C transfers in set_type()
Date: Fri, 27 Mar 2026 16:41:30 +0800
X-OQ-MSGID: <20260327084130.15506-1-2063309626@qq.com>
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
	FREEMAIL_CC(0.00)[vger.kernel.org,bjtu.edu.cn,qq.com,web.de];
	TAGGED_FROM(0.00)[bounces-57201-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Queue-Id: B787B3412BA
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


