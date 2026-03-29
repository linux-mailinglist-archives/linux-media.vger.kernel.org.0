Return-Path: <linux-media+bounces-57513-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPoHLxseyWlKuwUAu9opvQ
	(envelope-from <linux-media+bounces-57513-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 14:42:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E009351F71
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 14:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FA11301C590
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 12:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEF436D51F;
	Sun, 29 Mar 2026 12:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="nos5uN1w"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050D83093DF;
	Sun, 29 Mar 2026 12:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774788108; cv=none; b=OZxp6S2vcZCpXvTsM1lCE9zNie4dDFp11/lgwr1Cp5uHykLt8cHXOtMad0xSlEl0vVQdMrc8we8ugqRqgg2/Hoz2kzYNkTGATtiLh4q+M+1xrdAE7POjT7pcLNzWgwnkX4S/dxtB9o0cGsoWTTk2/LbwzJa4LIymXeqcpVs1rGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774788108; c=relaxed/simple;
	bh=E9fb0EnIc9p/YuYSpWEa5VL+fofa3gSVxNR+CROncC8=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=PDabGRzxnAc70ocHVRdNqTVSfaQ3JMOsYj80tYmdH9Zl/ESH8f6Xc5kBBJS/756fIRpU+UNEzyYSwHTYTETiAVePlSA5l6CKqIY7S5vNR4FU17g/NOt4GJTrqL58q8nFxh/zJsei/Y27amKS5Fe8JtcBkGr3ho2IFVLbaErBjUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=nos5uN1w; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774788094; bh=KRmC2zby+2bOT4GpdhG24sV/DNEBY41ZP4WcP7AHs48=;
	h=From:To:Cc:Subject:Date;
	b=nos5uN1wrYMPNJqYn0k8u9aWySf7tgQAIYUN2ocdgGaWH26UTEEi7M+Raof2bHTlw
	 kN3oj7h8OCWlooqAfA39msM1IyLAjbAgTpMqxIP/q6P4I053Df4OD3BLCy0iePa6Tn
	 Bs3Xt9si5Yfsh2bPS6khOYHZqJ5q7hPU5OMOqpKg=
Received: from LAPTOP-KQCD4QBN.localdomain ([123.121.145.48])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id A5E8D08C; Sun, 29 Mar 2026 20:41:30 +0800
X-QQ-mid: xmsmtpt1774788090tj6d323ds
Message-ID: <tencent_820AAE865CAC3FB7596055F016FD7503210A@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JuSj1wGuaxjrEpgmHejHAaD/YXyQzW+v1e1oUEQMVbOh9mfOpEhw
	 rqYgARecSIIEerpVeme4NvQSyYHzcjUlxliVtQw+Bh1cHJY/GigYvaVxRU8eFHNFYwN8Vb/LYujU
	 IfptXd4SiY/ut9t2f6h6WlJHTmLgMQ/d5niyfhTgivMqLTeNUiGfgvnmek1ouCWFTRa1Vdh9PuNB
	 QlmvgWjaU9Jn5ATyozC1bXThCBykAffMBf50/o9XkO/8qyJfXrF5eCKLlEoDQuSvk7MUxJQwWFLQ
	 gETZS1+6Xy1GVD9TNeuJQ1iwlMjsZnBbbDpSqNHV0qJsnOXAkCEhfVWGuf0xBgG+xzvLGu6ZfQ/6
	 ypfw218MYoKs5wBzF0gNtveLD9SU0kJtuoOGLw5i9Wa/1ly61ysEi0zOkorQs5wGYrRKVeUiDN9V
	 AsnFWgF+xmZuThLNBeT7xOIxj8b1xNFcBmO8gqo3JEKrsIU/9fr9GtWC+SmvCWtQRrLM5l8dxR/4
	 tECN1nNZLk1/utWdurIxpPFaj18/rjcvRaUkm+gsVj4zPw0TEi8PHVXdycjpVOCje7ytOJgNzB6I
	 Xly2Dw7uRdlfFN/qM+N7/j4DQcGJFsZH6v3hEdBwPYyjQamkQUZ5hpDES+xFyuNNFwVy3BNVPeQj
	 x4bPhWe+ksqPE5OTTmfrnt2KjLc0Y43S4OZE5s0lrkH3EYACwuwn/LI9AWf0yXXjBWzUYKxGS+o/
	 I/bJeak4nH+jNGilgJ4Z6hBQ2X5dCWihECjhKAFuTekMCHIHShFemBrIO3zLvZZFLecsjBlipGss
	 1iiN962Xm8IPuksXBDLkIIoRVnVaaSYUyP4zIg7lnnrmkkDOV5Z015vAvix9fs2AH97hJz68tsYC
	 g8h6I+8186wEilUabfnvb7+5BYVpodE37OWrhX9jbbVBEvlqHKyr7aWwhFy5P0WaBWRSzO9kuvhs
	 5tH7NYJ80BYRkOtCacnymwmH1nqjidqYLo3/FOKmQSEcaUB9/KGhlsogyUdl71t79rQCn+EaNDlo
	 LEbydZ4nYFKiZUnYKnNDdVjxQa4St7u1G5VQyB+vq1UMnY+m8l99deSqUwiXcM60nyx2ExRg==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
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
Subject: [PATCH v4] media: ivtv: ir-i2c: check I2C transfer errors in get_key_adaptec()
Date: Sun, 29 Mar 2026 20:41:28 +0800
X-OQ-MSGID: <20260329124129.1726-1-2063309626@qq.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,web.de,bjtu.edu.cn,qq.com];
	TAGGED_FROM(0.00)[bounces-57513-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 2E009351F71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In get_key_adaptec(), a command byte (0x00) is sent via
i2c_master_send() to initiate a key read, but the return value is not
checked.

If the transfer fails, the IR chip may not receive the command and the
subsequent i2c_master_recv() may return stale or invalid data. In this
case, the driver silently reports "no key", making such failures hard
to diagnose.

Check the return values of both i2c_master_send() and
i2c_master_recv(), and log errors using dev_err_ratelimited().
Short transfers are converted to -EIO while preserving existing
kernel error codes.

On error, still return 0 to keep the current behavior (no key
reported), but emit a diagnostic message to aid debugging.

Fixes: e1e2c5756563 ("[media] ivtv: Add Adaptec Remote Controller")
Cc: stable@vger.kernel.org
Signed-off-by: Wenyuan Li <2063309626@qq.com>

---
v4:
- Reword commit message to improve clarity and rationale
- No functional changes

v3:
- Add correct Fixes tag
- No functional changes

v2:
- Add error handling for i2c_master_send()
- Extend checking to i2c_master_recv()
- Use dev_err_ratelimited()
- Clarify error handling behavior
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


