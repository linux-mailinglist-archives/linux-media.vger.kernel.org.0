Return-Path: <linux-media+bounces-67539-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +KurCL/cVWrwuQAAu9opvQ
	(envelope-from <linux-media+bounces-67539-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 08:52:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B37C751A96
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 08:52:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=UgihLh84;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67539-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67539-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8718E3046D5A
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 06:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6714E3EA94A;
	Tue, 14 Jul 2026 06:52:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C06B3EB0E1;
	Tue, 14 Jul 2026 06:52:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011948; cv=none; b=lNWqJH9OpVPO6AiKmwkvltRCveheN+y+LXOdeK+I4mUJ0sbsE1g2tqEZZSL6vhq24IjJaaor++oR/mt/+eellRYeWumQKAJkm6aOw+HIKEa2nzjpTK2ZIVEhJ1o1M910D/1NKhQs6keBCIDqIeGbiPINNKwdA+TMgKJvMcJk7R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011948; c=relaxed/simple;
	bh=6ACPL3xPY4kCzIozm4mfvh78P8la9Wyv79Is5pmDTXU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=olOG9FuMAKGMO+9BDi+ynbQmeuQRaTe6+dhkvRuPd8YJHD4cj2E7HaAOuVB4V8HffbEH2KKTxY0+ebsXtyR8gGbridGwQTbNwNQ+dWCRxv2MYHrjdgPftmHzP6x0R/anX8vV3LN6v2Diioub9YLkD5/98oISKx9w4WmOvXPwiMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UgihLh84; arc=none smtp.client-ip=117.135.210.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=on
	YXaGprWzuvN/rin+WZnE7OSsL6l57M2UyUD/tPwgQ=; b=UgihLh84xx/q3YpzYQ
	paj03BhnyQT+1PhOg4+BqfTBLWAi1lRG/vTs/1Q6j2gN4X1awpfVjMcYDPJUNiSu
	FGT6bB+3mJ5wNw7YuHRNhrIK5FVrAdvOqL1Dlujhv9YiZQkXwCkwEYrZX395MJbv
	v7u3zS5rP0GYcPpja2DaVN+bQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBXlqWU3FVqGz8EJw--.28541S2;
	Tue, 14 Jul 2026 14:52:06 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH] media: s2255: check firmware size before reading trailing marker
Date: Tue, 14 Jul 2026 14:52:02 +0800
Message-Id: <20260714065202.563027-1-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXlqWU3FVqGz8EJw--.28541S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF13XF1UCr4xtw13CryxAFb_yoWkurb_ur
	n7uw1kG3W0yry5Wr42kr1SvrWrArW8Wr1ruFn2q3W5J3yjqa1UXr4DZw1Iq3Z8GanFyF1U
	Jas5XF4fuwn8WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8xwIDUUUUU==
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC9BZMQ2pV3JZ8DgAA3q
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:johan@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:huanglei@kylinos.cn,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[huanglei814@163.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67539-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[huanglei814@163.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,kylinos.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B37C751A96

From: Lei Huang <huanglei@kylinos.cn>

s2255_probe() reads a 4-byte marker and version from the last 8 bytes
of the firmware blob (fw->data[fw_size - 8] and [fw_size - 4]). If the
firmware file is shorter than 8 bytes, fw_size - 8 underflows and the
access reads out of bounds. Validate the firmware size before indexing.

Fixes: 14d962602c8b ("V4L/DVB (8752): s2255drv: firmware improvement patch")
Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 0b8182edf8e4..3917913c3b47 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -2277,6 +2277,11 @@ static int s2255_probe(struct usb_interface *interface,
 	}
 	/* check the firmware is valid */
 	fw_size = dev->fw_data->fw->size;
+	if (fw_size < 8) {
+		dev_err(&interface->dev, "Firmware invalid: too small.\n");
+		retval = -ENODEV;
+		goto errorFWMARKER;
+	}
 	pdata = (__le32 *) &dev->fw_data->fw->data[fw_size - 8];
 
 	if (*pdata != S2255_FW_MARKER) {
-- 
2.25.1


