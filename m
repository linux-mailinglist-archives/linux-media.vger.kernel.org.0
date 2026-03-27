Return-Path: <linux-media+bounces-57282-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHzRE561xmmgNwUAu9opvQ
	(envelope-from <linux-media+bounces-57282-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:51:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1795347D56
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAA7430E1040
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D325C349B0A;
	Fri, 27 Mar 2026 16:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Awk6qrQm"
X-Original-To: linux-media@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED485341ADF;
	Fri, 27 Mar 2026 16:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774629790; cv=none; b=CIfO/VSSnmCznZhxOBMg/C6UWzlQBF5eNK5UvozT/bVFEw0s6dj8YseQaIH39eWUtA/JTI4VjW/70Y8MXFRUkhyFaxJuepSFF+tBeBjrPT8qW75hLGxaZYoIB3I5ZIHLFNeQtg/2KppXb4ncmogWBp4eLfsfhahBN9gW4pboE3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774629790; c=relaxed/simple;
	bh=mQ/JSz+CKJtWutzkgkYxzpBGTZ9QtEkXBi6RD9kDOLE=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=gmB4QxvzBTkwn4eUyb/A6Gk1FjT8fpgdbR+phaZwyE80oytGqH1u8DzPcADLMCwA52iZygxJbMVzekkkjQFgXO0y6QW+Uh/D+us91fQZeGhZvUWgeQoL6cL+Qq+fc4g9qmGPQVwvJAeLaCGA5eyVvMMpBMLw4hxkbsoH2pHiskM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Awk6qrQm; arc=none smtp.client-ip=43.163.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774629782; bh=UroK1ySqjbLJQwKcb7vPgXzRaw08F6AMfh8Pj4bu2ew=;
	h=From:To:Cc:Subject:Date;
	b=Awk6qrQms55Of76PL2KcAhPGj5g+Ez0cIf1Fstj064T0N2F5G0UGKF5RxtoSimMOD
	 vTH8KaNthf4YMU27SlasFV4ReC/w4tnaO7BB9ctBPZypWEVsVtSp+EiN8JSCKIgW/+
	 /YOfZQ7GaJKUZnOLUOteqtSKzwyPoPTV+vMweyFQ=
Received: from LAPTOP-KQCD4QBN.localdomain ([183.242.199.70])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id ABB93C66; Sat, 28 Mar 2026 00:42:59 +0800
X-QQ-mid: xmsmtpt1774629779tm9r2nd56
Message-ID: <tencent_4E3977BB234AAFC65C503EF35B9C54DC140A@qq.com>
X-QQ-XMAILINFO: MZtEYADUG4AgAeOlNmeDWbNl1yYje6epPQ+N2n10UY8Fgz/hRCIf5BLLDYGOSU
	 iCinbi+h9v6N+twFrDJ/OfBOyj07gReOa8W4EmAu2uLS1axIVZtclurbb+JrCHRl8EhI9diFhNvj
	 7ovKPbyBUuBwYYAvXvZqbIu+Edr47SflO7Rx3kzVEPDmx3mMUudGVSmQnMk1hh+Zg8ywZCehnR5n
	 FQHUCDJdJX+cwjkUSYXe9spufgRu2QK5p2GPiSO43t9FRoKnxYpPTCV1e4QC1HWRJzlG0J5Gn0Zf
	 zfu+Ko0fcu/9PMrEhHcHCKBUw5p+hGBSXeCM05RcdRViyg9h34Esk0sact8hwlcI9AfmxxQ8iIzy
	 H/Pvj1r/11ywODnj1C2nN7MHE9bWh4DPYCADQB6KclkJ2xfkEnpLKPgIcjQlvC+yFbmjqbwJzmFD
	 7mAG82mQPFSumrUxPSmOZkt8eY/VC046peT7+r8a4MnBGmtakC4OMSfdnmOLUof2MDfn2m4x/OWl
	 u0xZ8Gxe0gTQ5356SZet/Cox+mYg4qdeCACYgTd1Lz/8PlV+/Vu4pkFx5xX4U8MjUXeinObVk8t5
	 f+Ts94aQqzFH8cvKKSNpH4RKxyktjkiJKeqob/U1TyKz5FgL+i8r9SrxnBdwLzlE9ck5Lgi4z6uG
	 rZsB3tatk2vM8xFwJBap5gkVgnQmA009bwKiWskNr/gUha4XyW/bo464PqhH++2fT8Lp+6NNS3QE
	 qjnE7kawG0kzSBmLYvHy++sfBnoTxOjc58Zy/Qw5+2HNik4XbNbvEzTefKO1GwwCSQNKSL2xc1s7
	 Z6bPSf4u3xNLPbiglTSMyA483qquy1uy7bgrZpa1ifN8Hfzj470N4BXsXVg5nbRpmEFkSxCE/8lS
	 Ncexn5Yt1XSJKItqwXkzJQ0ewfTYbmnRAZAWUDZYt4NSkZb5QT52aQSbyFNOQ6tTd9DpIqms7F8W
	 fgUYl/HOHAt4OXMhzWDNMq9BTMaJF5+JhYl19Of/zxJOA7RUjko+Q4hsjI9swjPgnlt6TKFYKS7X
	 4CMHppTvgEpuGG6AHkmbjtbI8KfNk=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
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
Subject: [PATCH v5] media: tuner: check return value of I2C transfers in set_type()
Date: Sat, 28 Mar 2026 00:42:58 +0800
X-OQ-MSGID: <20260327164258.2503-1-2063309626@qq.com>
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
	FREEMAIL_CC(0.00)[vger.kernel.org,web.de,bjtu.edu.cn,qq.com];
	TAGGED_FROM(0.00)[bounces-57282-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: C1795347D56
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


