Return-Path: <linux-media+bounces-56704-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAl3JJQvwWmkRQQAu9opvQ
	(envelope-from <linux-media+bounces-56704-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:18:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3694F2F1C87
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB0EF300F125
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 12:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5A139DBCF;
	Mon, 23 Mar 2026 12:17:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FF239F183;
	Mon, 23 Mar 2026 12:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268260; cv=none; b=Xd/lvpb0ePJE7K8V3xY7CgsNEFLgJh2NKHor9NI8ajGcNUD1aD7EoH4Bxc5nWuQQDNqVLkBLckdaeMspmS9MApdFw5G1jwMwAXXO53CIlONV5HJVTYpvC8rF9XzZT8dXkuarh4EuS2kBhUhOmluWhfPMbzYXEIHB1lSVcG4KM4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268260; c=relaxed/simple;
	bh=VV0N9wPRfaXAewOcHWQMsOPmN+KTLUmrSZiNx0uAXQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ELPJBsOBN6jHTpC+gEtxWi5wnhqXihn0P0Ey3svFQFeQPRcV+ut/aPmb+smeey14/O9h4eIetCSW1KcLBCEBubQgXMhHbt0m87Rsz0pjkk1vACrs1mHn0IrYfGJF/TKoVgM3R6lVVB/PU++xnUfkP62IQ6k6zFQksYXl1uwB2Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowAD32uFbL8FpYYuMCw--.3502S2;
	Mon, 23 Mar 2026 20:17:31 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: andy@kernel.org
Cc: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	pengpeng@iscas.ac.cn
Subject: [PATCH] media: atomisp: ov2722: flush buffered writes before they overflow
Date: Mon, 23 Mar 2026 20:17:30 +0800
Message-ID: <20260323121730.75257-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD32uFbL8FpYYuMCw--.3502S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar47tw4UJF4Duw1xAF43ZFb_yoW8Zw4Upa
	yrtan5GrsrXryUuanxA3Wxt3WrKwn7ta47C3y8ua4xuw1ftF40gwn8Ka4UJr98Wr97Ary2
	ya15WFW7uF4DArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q
	6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUsNVkUUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56704-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[iscas.ac.cn];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,iscas.ac.cn:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3694F2F1C87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

__ov2722_buf_reg_array() appends 8-bit or 16-bit values to the buffered
register-write payload and only checks whether it should flush after the
new value has already been written. When ctrl->index points at the last
byte of the fixed 30-byte data buffer and the next register is 16-bit,
the helper writes one byte past the end of the local buffer before the
flush threshold check runs.

Check whether the next value fits before writing it. If not, flush the
current buffered write first and then append the new value.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 .../media/atomisp/i2c/atomisp-ov2722.c        | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..691192d096fe 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -169,26 +169,42 @@ static int __ov2722_buf_reg_array(struct i2c_client *client,
 				  const struct ov2722_reg *next)
 {
 	int size;
+	int ret;
 	__be16 *data16;
 
 	switch (next->type) {
 	case OV2722_8BIT:
 		size = 1;
-		ctrl->buffer.data[ctrl->index] = (u8)next->val;
 		break;
 	case OV2722_16BIT:
 		size = 2;
-		data16 = (void *)&ctrl->buffer.data[ctrl->index];
-		*data16 = cpu_to_be16((u16)next->val);
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	if (ctrl->index + size > OV2722_MAX_WRITE_BUF_SIZE) {
+		ret = __ov2722_flush_reg_array(client, ctrl);
+		if (ret)
+			return ret;
+	}
+
 	/* When first item is added, we need to store its starting address */
 	if (ctrl->index == 0)
 		ctrl->buffer.addr = next->reg;
 
+	switch (next->type) {
+	case OV2722_8BIT:
+		ctrl->buffer.data[ctrl->index] = (u8)next->val;
+		break;
+	case OV2722_16BIT:
+		data16 = (void *)&ctrl->buffer.data[ctrl->index];
+		*data16 = cpu_to_be16((u16)next->val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	ctrl->index += size;
 
 	/*
-- 
2.50.1 (Apple Git-155)


