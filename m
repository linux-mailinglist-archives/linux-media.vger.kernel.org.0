Return-Path: <linux-media+bounces-57507-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGDnAokEyWmitQUAu9opvQ
	(envelope-from <linux-media+bounces-57507-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 12:52:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247F351A74
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 12:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 283EA3046529
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 10:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C98C3148CF;
	Sun, 29 Mar 2026 10:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="uXWfwfdq"
X-Original-To: linux-media@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9B731355C;
	Sun, 29 Mar 2026 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774781489; cv=none; b=PveRMcPbUA0VBp60W0mOwJ65ThQnS+id1mNILn9/qoCxWOAoGg9ooRMRJlKTHN39eykjtaNRj0lV8JvGXB9mPdisMMMlX725gEWZBtBE5AUbGyMIO3UDdg9CZ9e//gHwKRWFffmZ8p6f7X+eFXpc09vvRGnSzeW8axYoGUU4fXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774781489; c=relaxed/simple;
	bh=mQ/JSz+CKJtWutzkgkYxzpBGTZ9QtEkXBi6RD9kDOLE=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=ggjoqk0W5Xi/szMeNSS3U4griZ4Jfs+a7FxqOmbOA3TTv0RLGs8dywwf/vGYXvtArFuLlxkK/0pp1fZnkz6ezizDJIDtX4h4hB+JgMikI5DSO6RFdENfOGD8fWF9XvmUq9mjNlu7dOJNuW3L877jGxt50HAC54Z7cWX+Jl4Ow0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=uXWfwfdq; arc=none smtp.client-ip=43.163.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774781477; bh=UroK1ySqjbLJQwKcb7vPgXzRaw08F6AMfh8Pj4bu2ew=;
	h=From:To:Cc:Subject:Date;
	b=uXWfwfdqU3ixeceRlKWhVdzv+8Irxz4HsZLI3Z5+HDPkgnDp93P6AA2yNpiAHUiNr
	 uuWH4MxtTYRnKaeZ7Xda3bD+xfmpp2HzftTu97NY+6H6oCiEj2WFYtTH5Nq1q6ZP4H
	 XRWwUD9Dni2C4XyCVhzSSQQD+V2D1qCQR9emtprg=
Received: from LAPTOP-KQCD4QBN.localdomain ([123.121.145.48])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id CCE16A3A; Sun, 29 Mar 2026 18:51:14 +0800
X-QQ-mid: xmsmtpt1774781474tmnremffy
Message-ID: <tencent_46889E152DE22B7E8A0CBB3311C556F92E09@qq.com>
X-QQ-XMAILINFO: NKDEJ657lpu+rscPRTJbBkFka3NDRBrIXps64I3quwvQK8anivcTuAyxuvQ8S3
	 E8NGyFm+Ag3ydM7SUSqGSGFEP0yYhyaRxRNAsjd+0JG9ECaKC0JN680GmSzvXAarhid0M++qPYcw
	 VCef8tNmFC8K/mWnT45nfYYlFQF58KESZUedxJn5XHtg3EBIxY8obb2TImxcMT9BdnMUOBbx98vt
	 B1lY6WLyethfyYwFVp6AKgK6GWMzzLk1FEkC+ZDKZqldbegN3Okq0+8kQEAho8wOoGOln1kFFMz4
	 xl9vQ/Afs9dK6qGqyWCNvF17eG2ZgK1Ny4qumvExD1d1APVyIdHZftqBKYzpaPwASXXjh6uQSqOn
	 8wljLX2fqwH9bc8d9y+sA2jfuGezOB723Cq4j9IDBdUCPo1s8qM5QghZXyDJtJvGsOLOKdI3IpJB
	 4oAK/7HCM/v4n0DfroITLjhNvDoIYsIUkQgS3V4plA5yCCLkLoC0vEWBc0oh5J8eU//8tklSLA+x
	 bEElhNs8I9pxFziwKNXpSZRZCxmJ+yKYYKmxjxsSNHF9vY7p9F+6JoVJjkdH8uLElLZZesDUfwyE
	 mxGovFHwLgSA+o86PYvHa95navzoYwm0wZ147Xe/8ym3nrfymNjZQ+c5vy8Z9wcZwLNmOYpi4aQX
	 u9ODIDelND5+L4ySkN4c5AVbUHkLtXD2oZWDatxgF+B+YNglT+MCQzX9Ktfcvmb1Bb1FJlgEZQVW
	 xKg5OzbssWh2RxSyQnqPTK3o4GcocPhiNA0lXEofoDIeLnUkSDDuldcHU2mHKU8a2b2kctfkT/SV
	 uEiMYe6VcaR+slLgunsRwfYDIjtKiJoxXP4cZlQ8mQ42Yx2WaOxBm0GDsFysz/AGr0nIN2GXY2tC
	 nXxOwPOvKmStMLI4quCGtGeLzDZDxmWLQLN5Bw571AXFclH2YtR5YANga3fFWtsar2tEu9oNWqv2
	 tudYpYB3wx/P9kDNQLMNnAkqrEPhBNg2LV4aWXMBYyqSSqaLrKralDfRMICFYauSceE6MybTLlhL
	 dqDBgNrnilPnxtG3pWuWTS69sYosdzO8VeH8u87S/Why/KD9LH
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Wenyuan Li <2063309626@qq.com>
To: Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Elfring <Markus.Elfring@web.de>,
	gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	Wenyuan Li <2063309626@qq.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] media: tuner: check return value of I2C transfers in set_type()
Date: Sun, 29 Mar 2026 18:51:12 +0800
X-OQ-MSGID: <20260329105112.819-1-2063309626@qq.com>
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
	FREEMAIL_CC(0.00)[vger.kernel.org,web.de,bjtu.edu.cn,qq.com];
	TAGGED_FROM(0.00)[bounces-57507-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Queue-Id: 6247F351A74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In set_type(), several I2C transfers are performed to initialize
specific tuners (e.g. FMD1216ME, FMD1216MEX, TD1316), but the return
value of i2c_master_send() is not checked.

If an I2C transfer fails, the initialization sequence may be
incomplete, potentially leaving the tuner in an inconsistent state
without any error being reported.

Check the return value of i2c_master_send() and propagate failures
to the attach_failed path. A small helper is introduced to reduce
duplication and provide consistent error reporting.

This ensures that I2C communication errors during tuner
initialization are properly detected and handled.

Fixes: 93df3413f1b4 ("[PATCH] v4l: 655: added support for the philips td1316 tuner")
Cc: stable@vger.kernel.org
Signed-off-by: Wenyuan Li <2063309626@qq.com>

---
v5:
- Reword commit message to better explain rationale
- Clarify error handling approach
- No functional changes

v4:
- Added Cc: stable@vger.kernel.org
- Updated Fixes tag
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


