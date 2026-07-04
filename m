Return-Path: <linux-media+bounces-66565-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kvALCbNeSGorpgAAu9opvQ
	(envelope-from <linux-media+bounces-66565-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 03:15:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 666A870659B
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 03:15:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66565-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66565-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 894AC301D046
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 01:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB2B2253EB;
	Sat,  4 Jul 2026 01:15:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A3D1E98E3;
	Sat,  4 Jul 2026 01:15:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783127720; cv=none; b=hGdh4o2WpLo15OANhjJ350WZoYAGN9r5FciBa2kQZM40F/MLHTPQc2vAUCoOw030vRWvDOxnCyFigKnDUlWFLoC86TAd/wJezOH17LjTLQ0bQniRz3mk9hiWU1uymxOZ5x7APnjWvKgQ8KXEXoNzWXl2bgF46Q9LQrymLKE88s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783127720; c=relaxed/simple;
	bh=/y4lAqE0lhao9y53dEWi22cZehOru7NHPH8S8U7x4TU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hnSFLR1sFJ2+wSIlXvh6gmMMU4eGlVBP+wqN7h1f0Havst2VO4FsvgMeLmAugVq/Y+XtIclLEPtYw0ip9C0b4XFwAn0daL2Z6jSsuSNYtbrrBrFIotCrrL93By6vB7ovidGPFPng2ss93RxyUlbv5eSnM7WBbuveffvEHXEpMUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowACn+cyjXkhqqr3EFg--.57416S2;
	Sat, 04 Jul 2026 09:15:15 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] media: lmedm04: bound I2C transfer buffers
Date: Sat,  4 Jul 2026 09:15:13 +0800
Message-ID: <20260704011513.60356-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACn+cyjXkhqqr3EFg--.57416S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrWfAry7CrWrZr13Cw13twb_yoW8WF1Dpa
	yagrWxKry5Jrn7WFnrWw45ZFyrG393tayUC3yxWw18Grnayr15GayUKa42vr4UGryxAryU
	tr15XF98WFsFyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AF
	wI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUez
	VbDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:tvboxspy@gmail.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66565-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:from_mime,iscas.ac.cn:email,iscas.ac.cn:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 666A870659B

lme2510_i2c_xfer() stages I2C transfers in fixed 64-byte obuf and
ibuf arrays.  It copies caller-provided write bytes into obuf and
copies read replies from ibuf without checking that the requested I2C
message lengths fit those staging buffers.

Reject write and read lengths that exceed the local USB command and
reply buffers before copying to or from them.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/media/usb/dvb-usb-v2/lmedm04.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -499,6 +499,7 @@
 	struct lme2510_state *st = d->priv;
 	static u8 obuf[64], ibuf[64];
 	int i, read, read_o;
+	int ret = -EINVAL;
 	u16 len;
 	u8 gate;
 
@@ -522,22 +523,29 @@
 		obuf[2] = msg[i].addr << 1;
 
 		if (read) {
-			if (read_o)
+			if (read_o) {
+				if (msg[i].len > sizeof(ibuf) - 1)
+					goto unlock;
 				len = 3;
-			else {
+			} else {
+				if (msg[i].len > sizeof(obuf) - 4 ||
+				    msg[i + 1].len > sizeof(ibuf) - 1)
+					goto unlock;
 				memcpy(&obuf[3], msg[i].buf, msg[i].len);
 				obuf[msg[i].len+3] = msg[i+1].len;
 				len = msg[i].len+4;
 			}
 		} else {
+			if (msg[i].len > sizeof(obuf) - 3)
+				goto unlock;
 			memcpy(&obuf[3], msg[i].buf, msg[i].len);
 			len = msg[i].len+3;
 		}
 
 		if (lme2510_msg(d, obuf, len, ibuf, 64) < 0) {
 			deb_info(1, "i2c transfer failed.");
-			mutex_unlock(&d->i2c_mutex);
-			return -EAGAIN;
+			ret = -EAGAIN;
+			goto unlock;
 		}
 
 		if (read) {
@@ -550,8 +558,11 @@
 		}
 	}
 
+	ret = i;
+
+unlock:
 	mutex_unlock(&d->i2c_mutex);
-	return i;
+	return ret;
 }
 
 static u32 lme2510_i2c_func(struct i2c_adapter *adapter)


