Return-Path: <linux-media+bounces-57259-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEOjC7qXxmnrMQUAu9opvQ
	(envelope-from <linux-media+bounces-57259-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:44:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B499346452
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68F67304E734
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391623F54BE;
	Fri, 27 Mar 2026 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ivGO+/gY"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-191.mail.qq.com (out203-205-221-191.mail.qq.com [203.205.221.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB06F3C5DA4;
	Fri, 27 Mar 2026 14:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774622528; cv=none; b=bgeYXxbKOAMdtXHiZkqWyAvtQUdto9Qnjk8ygldFqz0bvrdmw4utiglG/N4tm32uz2mV5IYO+t0MZfmu0kquO/xAjuJSSn6+uy2Nw1sdourH53CMRu84eyJlPWm5QUiO1hrhT49P3mUsSl6E7HOofywnIoT+z2JdvBqB1dqY0nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774622528; c=relaxed/simple;
	bh=rqzGjIQeRL2ZW2LzSGPy3fXnNFFp04Vd7YiWaCf82BI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=axIF88Gacyw7J0AhuwOWyAUsjfAOtD89BNGCTyqZCqvm2ZB1gMVCKCHUOxSok9T2FXG9nmyAOWBBTrRwT1yvemqKmLtYOhEY4f8m4/xqx0zFPCD/C0yBFRQ+aRgnzoJQ+6df/PhDo06VRaTLpX3jKO1SW+lb8cf8necLnZ8fCpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ivGO+/gY; arc=none smtp.client-ip=203.205.221.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774622518; bh=nzCnzpKTXjl6FstNPhqDbGnC7p8wl7i4mtBO6nVhnHg=;
	h=From:To:Cc:Subject:Date;
	b=ivGO+/gYSkv2zWG1TrzoOVIjg7a2/YEzKL5zV5K+C6l3XlMTmbzdiQxBQez8ozE8e
	 uPLLYtmWyBWjf1B2+NznszuptThP7lb5IIn5qsZx1mpz2ejzKIXf06FQQYJDrz48rM
	 hpzRGaYk0V3wXeh9iHEpkWsmavxlN71e3L2NRwLc=
Received: from LAPTOP-KQCD4QBN.localdomain ([183.242.199.70])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id A7698AAB; Fri, 27 Mar 2026 22:41:54 +0800
X-QQ-mid: xmsmtpt1774622514t49gv2dmo
Message-ID: <tencent_A375E6C2F4D9D542A642B1C8AE3B13916B05@qq.com>
X-QQ-XMAILINFO: M2h0GZPtTfGksyOUFfowcm1+A10bOj5MeA7UA3YQS3xy4R0aEV80+aETfrYqLl
	 MNxEwo0Vxu/vMLddtCvd7ayEHRXO5cIsdIlEfWJAiiUb7lb7vvXCygT2mdOaiIDAN6N9gDpLfmWj
	 hvmdxOeK6vmX+5jVf5xafOoy+UtMckBWtV64Qrm4GZnsgb12F0kuwv7vZl9i/rU8koFIIeke6X1+
	 3umwH+2VtqP2JXHdWNmKmz/hpEtyUbi0F2zqoFbIf1EusvxE8+FnLi2Wwd/q0zmOdISA3g9V6+uh
	 mBkz6n87ceU449nznaBnKCJtfQg+Sx049ghHIkTGbIhBc/TMkv2zsQZdCJeHCmKhrvM4MmmTqzc+
	 U1+v9nHriRspxPw1ItZzJx1b9YGsaSfgNJc0mTA1UExx32AHxX5wWuQRiRS1egbzBrj44UkbYeAv
	 mWvF6W96cWFWv5C4wEHpk+HJqMM1HfaLjwyXa+LvuAYtEeK391EE5R2qc1lLqdBJdrZYsqRo3Kvk
	 2Lk9r/Q0KL95AyxLKEsDLksy36zzR52VDdzSsuXHBwwGUXf13SfNPSWB07ppEMzWG5K2ispqkptu
	 iBQ7UFAY19KsZzbZoKQIGf9nsHVoNWTqCffBvMklNei5cVKULDr6QwbdopipjxiYqD2BxDg1G0yk
	 aQvbSqqeFjlTb78LYF3JGWeXYd23DagT6pWJVhHDImnp97TETi/5af+y4RisspMjOLgPGjxGNFKZ
	 DjdXMaPkOvCf6SCqLZHlRin8KN+9sZA1KvyHHtNzglgfBBi8K5vuL0mMhcjLdNXsY/bU0RRbGEX/
	 GJpTE1blQIVMRVTw+p3/aH2RRR7ZYRNqDFCrhgtZteeaKRc8JY0ZVtbWiot3hvrAj/436zJlYKwL
	 dViaDT8eq3eEE7Zkjt+cGot7c558meFmH8iGMJ05ZZxGPHMbCG8pU2VDIXBdb0KorKOZIoCYQ2J5
	 S8/ESYI7gYrlES7cclnBbdf3pcrWCK2/o+V8pxOOStTRVTOsAYXXhiiGAcXSQ+swU7gWiDhYzkca
	 FNVTJ18y9Ed/iNf9Ae3qM2nOppklPH0LmcRqPo719azZRncJjsQmqorltpLrAU4c7zbe0Nhh6f51
	 I7g/LwTqfjgBHSQA1NeOocZSqTgRT1eTLJktwghRn3TwWHqTT/JhbcwIrdqseoVjY7NnPyvSd+d6
	 lIEuw=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
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
Subject: [PATCH v3] media: ir-i2c: add error handling for I2C send in get_key_adaptec()
Date: Fri, 27 Mar 2026 22:41:53 +0800
X-OQ-MSGID: <20260327144153.507-1-2063309626@qq.com>
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
	TAGGED_FROM(0.00)[bounces-57259-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 8B499346452
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

Fixes: e1e2c5756563 ("[media] ivtv: Add Adaptec Remote Controller")
Cc: stable@vger.kernel.org
Signed-off-by: Wenyuan Li <2063309626@qq.com>

---
v2:
- Add error handling for i2c_master_send() as suggested
- Extend checking to i2c_master_recv()
- Use dev_err_ratelimited() instead of dev_err()
- Clarify error handling behavior
- Drop incorrect Fixes tag

v3:
-Add correct Fixes tag
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


