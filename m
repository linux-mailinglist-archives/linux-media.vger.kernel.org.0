Return-Path: <linux-media+bounces-57213-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLrBG8JYxmkrJAUAu9opvQ
	(envelope-from <linux-media+bounces-57213-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 11:15:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CA3342514
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 11:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF8F5303077B
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 10:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DCC3B6C19;
	Fri, 27 Mar 2026 10:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="kp0Ixzo/"
X-Original-To: linux-media@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE363B47EF;
	Fri, 27 Mar 2026 10:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606127; cv=none; b=udA9wIw1yLu/yBWhnMHDPBdebsxXX349kMQifvcd9zQitqavpS2FO4LaHXDdteagzE3vio9Uzb3P9rCrWKdqi57Ri+aGMbP3S7oRo0VRf3kmgjgVzVVf/8GZIes/xh5Ij6UC5jSYYG7iHKezt1zxSRgRwa9vznPgefPbjczgkNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606127; c=relaxed/simple;
	bh=z0Sq5SZ3sBvt3pNKeK1GMqUiI7D+3K8N79wRSE23i/Q=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=lXd0z4t7r9HjvAxiCC2vq4N9s3kZHNqx+bkn84MtM5rONHMe9RMhnFoAJSg/7jE3SToKto1Dp+jBiygcklhH90Hv+hiTJI/272NzBX2BuGq3gxEbFLLi66dapsHRIwbv05Z6UtwDQO4GlzmiqCYiStC5/SMI7t8XLjthAGgZSrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=kp0Ixzo/; arc=none smtp.client-ip=43.163.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774606122; bh=W0nr8kxqMvTb1DhbndRoXcnk+em2Su278OPdQvpvDjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kp0Ixzo/r4zcSI65M9ArJzDCYc12p+S7HtbglPO+5rajDDPhgVLv995osLsEqgJ6J
	 0fZyTaxU8WWf55nHxK6GXR2+s5iS1TqRCOs1X+4VkY9XT3vMhNw1Va8VOFrUVCLys8
	 bvBc1pteJJKtYpg38g+qh+tYIVWALIomhE2/tdrY=
Received: from LAPTOP-KQCD4QBN.localdomain ([123.121.145.48])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 21082440; Fri, 27 Mar 2026 18:08:16 +0800
X-QQ-mid: xmsmtpt1774606099tfocf40rd
Message-ID: <tencent_3F73117D57532EA69EDD2C9E2BA48A5EBA09@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNzn9pZ7gKYdH/NNco7qXQMHZd8QqsVu/mo1mkGQfavz2eXbFuvJbS
	 I7Oi/fKIy8DmreuDgme649LuISBaNWttOQ/3L6BQcpaYhdeOjPQ1Y/mUXJpBadc5d/j9YUCwjWXu
	 6yQ3A63Avf/jsPlHeKnoEqlHJoM+yvVX/QRgYWGEbJCTyT7ABRXWiJTmBivIUtjOh5C73mIRF+1r
	 h/3n5x83umqB8OSW+tHc5vaMxnO+CDvL/yszc4oFy85vS/iQ+Dj98+nytuXn2wZvAjFk8pDHfWh7
	 +WfLWMsA+zQShc+GsHh0WaXQzJzYqrGJgODH51VW8nI4Jm8PN8EgG5c7AZct4jjbZdM5MzdcBcjc
	 ZLRjtmSO/ph+xQCnLmx8lqZEP3IG0mlpf61qk5QPRayXuWAlU6CDoO+veCAp2MFVdlLKO/4hlKvZ
	 e3iTuunThQMrIYdMXSkvW30IflC9NJq8znAhTL++DKDquL0h1U+lQVFDdJ4V9Ud+bK+OqLY4zAGJ
	 sMcLkxtj6j9iBfzJjGVJa5Pc2N6yzt33igDKixtL5dkY5Uok4AUO4/U0vmAXZcWmGkqFzMcM9pI3
	 hybAlyLju9qkjAHEBlrAMsgjbaGSgAzm0aKoB5fX02Byi1D6rflep+T7ollfrL79ndMJxmdd7Bz+
	 VDal3ZETIdf1d+s9eFXnmJPA0J9y7PqManhtPJMOMVGapdgRQfXWqTObvlKtH0rKQrvM8rzJACVI
	 fGutrWUO297iupkvLdixADNl2/OKk88KunXbf6vY9uFnVbPOsdqXUbpTS79IJoRviqeM5AHLpI5C
	 ptnmthPsM6dyDYc8jIy5gRlrEXjk7PIUW653wlQO4T8PYFbp/Zeu52SXLja+LtAhY7i8usXrkQGd
	 peWqNcKvz/Tk7PCp9xK8JqXoeKyOF7DS/v/6TA7QQAwsxVscMGDO71ss9Jdfwhs1QT0ob0sf3Gqn
	 Z5x8aRFsdxu1FQNbhSMRs2/sE38G233shx9s8WBrlbtaAl4j529L5eDoQoAgkBzRfRjNVifaytcU
	 wLX6sz6gzVz6QwSRUyZTP6PrT6Jt4Tr/MLD/ojb4dHvlPASj7Sr1FIg9cnM1lIPBVRTXFDWQ==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
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
Date: Fri, 27 Mar 2026 18:08:15 +0800
X-OQ-MSGID: <20260327100815.23565-2-2063309626@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327100815.23565-1-2063309626@qq.com>
References: <20260327100815.23565-1-2063309626@qq.com>
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
	FREEMAIL_CC(0.00)[vger.kernel.org,web.de,bjtu.edu.cn,qq.com];
	TAGGED_FROM(0.00)[bounces-57213-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 31CA3342514
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


