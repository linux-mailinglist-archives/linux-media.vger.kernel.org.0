Return-Path: <linux-media+bounces-56856-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLHOJtNrwmmncwQAu9opvQ
	(envelope-from <linux-media+bounces-56856-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:47:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E97E7306AFA
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 42D1F3062D86
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D063E639B;
	Tue, 24 Mar 2026 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Pczwh6Tp"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-192.mail.qq.com (out203-205-221-192.mail.qq.com [203.205.221.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A973E0231;
	Tue, 24 Mar 2026 10:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349014; cv=none; b=UFXM611qdkL14Mz9ZtEFaCt0xm/GquryPYd6VZAPdZ8vZZx3mehYWM/i1AMU2OmAw+8XfAiubn4pkNjZ1kP6d0w33p8gkBbXwsnF7V8YQNZMPYVbKS3WV/W7sSU//YZIO6LdonF/OBXdRIJ+Gpe2udDCspUv8JVBGs8ujC0kDIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349014; c=relaxed/simple;
	bh=dbhdTvnWiRH1yKnZNSDgTBBqiXEodbcJdrQvyZrXy2w=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=kgDaIjKyNq0IxpunPhJMYUNqEzDVT+IwL6LXXOVbdc82lDmRdcQEVNKc9jnWxB4QdnQ58ROUzymavU2Ze4bYrJ1nWchb00SiEhDBAfWaWT8U6kAnpDuV9v1OYBC04aaBnGPw+fanq+0SM45l9vAtOYROuwNZG5wU1Oxo2RHqrxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Pczwh6Tp; arc=none smtp.client-ip=203.205.221.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774349007; bh=PqBRwyndpjCsalXBlIpaEIl8O0GfqolFhM0llVMOZOU=;
	h=From:To:Cc:Subject:Date;
	b=Pczwh6TpyZuiYsy/vkz3fqB9vhz6VlS2k6PAh3ey+MBIuu0YQj8ACdNkNJ5YnvWwi
	 r6aP2K7KRr57ZblL5SCo2cqyznY3DNmiqdXP6Ger3KLPMi9muF0EUiCVJk3kTVIZak
	 2jE4cvP7yqBHe+5ZxKx8Q+4NpRR6n+muKrzvE0Fo=
Received: from LAPTOP-KQCD4QBN.localdomain ([183.242.199.70])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id AD88E062; Tue, 24 Mar 2026 18:43:24 +0800
X-QQ-mid: xmsmtpt1774349004tcjmykqlq
Message-ID: <tencent_FF07F161B5E002ECD9C7E2A9E2BD08B51B05@qq.com>
X-QQ-XMAILINFO: MzNwb/pqyJTkn2T2DeGWmdRTPDHdqZPTO9rfd8WBGubYmm6nCS/X97Z5PNNegR
	 lk3ZGG7jJVhSK3IVxnay2DiUurvbzITSpyoRv5iwl3zFbdml8dNyu9kp8/aQjk9qbkTAryR2DPAr
	 U08+vQ6okYpSkZw+l97C6U14iuSHNAGix+PwW3USrdqCPUswhB2KA6LimLZUs/7KAZwPdPAZdJMY
	 176ePt1YqbrRWOogdCutZ5NaorAa+sIPOsr2DepnsawES8eInFZzCEPAvDNkildDrMhJudAs98SJ
	 LIfF2MONJxK70IQjSo8lRZiF+W87cAzdnVTenaZP6Nls9FkGWxjT8B3lCvKn9eo1/R4PUPxWenUh
	 FwsuHRHRe/7h/NYTbrFOjRkVpRgo8+ouLb72qjyfgjtEus3AhEZ+n2s/KCGphH7ksLVVIG98mQB4
	 5XHkJR5vzwWv/P20EFrP3AR5mM9+0XwLuS4LNHcII4yYuJBlwfu0bH/9tQmiB8yC09IupMhxML3f
	 D/0cXCy1S4ra2CHTvYCvcXdCkur06rQBwkGQiCsT60GSCSmBoS8ptsaCHixcxiJb2wcDfbkZKXS3
	 v93c85f1DyByg3BmeqXqVYVq+NgNFphiwtNOnxWnzO2hBq6kJhwzkUcJeLRO9VdXltGAlS2PrUJA
	 26Jdq0Tje9+oGX8fHZXpb0AIzKkD8yiCuEu8RqT8/OsUXn0R7wToIjPtdI6rc3FQBVig7G4N7FAF
	 fMlbwfNCLjFaZcBLE8/kk1GiBOsy/msENEFzfxJlnqSw793Jh2swU7k1OL3bMWG13LUGYfmFqgED
	 J9MCbmyP4Jm1MsFN3I5OEBYgS8fyrychNnn5cpLyUk0dJzH8K2KlJRd0qE1hLWDYot8XOuAVkN+2
	 T+2g9G2ghE3KLXG42GSk3ykcrjxyY+CTRYxfXMy5djVhXe4o2B/KwhdHI2FhyutsPlC0XvcNg4nx
	 2yYNWHLQaRQmiD3BaaUInovwiDB7ySecLnmt9iTRbN9zdlUzQLMfh5H78wX5FUUQA/TN452htQJW
	 2VwYfCo7ot1Lb8igCgr43OtKEn+l0u02mk24+SiA+HArYga2misBwiBPSu/Mw=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Wenyuan Li <2063309626@qq.com>
To: Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	Wenyuan Li <2063309626@qq.com>
Subject: [PATCH] media: ir-i2c: add error handling for I2C send in get_key_adaptec()
Date: Tue, 24 Mar 2026 18:43:23 +0800
X-OQ-MSGID: <20260324104323.15860-1-2063309626@qq.com>
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
	TAGGED_FROM(0.00)[bounces-56856-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Queue-Id: E97E7306AFA
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
- Adding dev_err() logging with %pe format for human-readable errors
- Adding similar error logging for the i2c_master_recv() path

If the send fails, return 0 to maintain the existing behavior (no key
detected), but log the error for debugging purposes.

Signed-off-by: Wenyuan Li <2063309626@qq.com>
---
 drivers/media/pci/ivtv/ivtv-i2c.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-i2c.c b/drivers/media/pci/ivtv/ivtv-i2c.c
index 28cb22d6a892..c31bb4f6dd52 100644
--- a/drivers/media/pci/ivtv/ivtv-i2c.c
+++ b/drivers/media/pci/ivtv/ivtv-i2c.c
@@ -138,11 +138,23 @@ static int get_key_adaptec(struct IR_i2c *ir, enum rc_proto *protocol,
 			   u32 *scancode, u8 *toggle)
 {
 	unsigned char keybuf[4];
+	int ret;
 
 	keybuf[0] = 0x00;
-	i2c_master_send(ir->c, keybuf, 1);
+	ret = i2c_master_send(ir->c, keybuf, 1);
+	if (ret != 1) {
+		int err = ret < 0 ? ret : -EIO;
+
+		dev_err(&ir->c->dev, "send command failed: %pe\n", ERR_PTR(err));
+		return 0;
+	}
+
 	/* poll IR chip */
-	if (i2c_master_recv(ir->c, keybuf, sizeof(keybuf)) != sizeof(keybuf)) {
+	ret = i2c_master_recv(ir->c, keybuf, sizeof(keybuf));
+	if (ret != sizeof(keybuf)) {
+		int err = ret < 0 ? ret : -EIO;
+
+		dev_err(&ir->c->dev, "receive failed: %pe\n", ERR_PTR(err));
 		return 0;
 	}
 
-- 
2.43.0


