Return-Path: <linux-media+bounces-44333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0015BD6E2F
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 02:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00EAF3A76E4
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 00:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6690C1DDA09;
	Tue, 14 Oct 2025 00:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="YR2fKaES"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A15E72627;
	Tue, 14 Oct 2025 00:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760402147; cv=none; b=kB/bk1TKcZHsGj0FKI14eXJiQ2BQkJXJWtpzpQlrEsVBaS3PIIDf9C17b2dxti3lVt7ThsfHYmu/ps1k8YnuzDWxVcSGhQbX1dqM+T8gTjDgQ/ZACr4gUJMmjGeltz0JkOHy+SehMHGAsBmyqPgKsftOUW4jFkP4txwqprlBZSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760402147; c=relaxed/simple;
	bh=WbqyGpKb/zLKbH7fHA4aAvojTSwpNDo8iN+Qgagm4oI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=RIsik9+rfFHs9T9PjA/1/gS47R4FOeiXnvGo0TED+KlnP5R7mCyBrOgl+X3iGTbPqDD3dTbxt4OM3ggqkt+2F7nL6mgRk1GOqYHS93VdHgZwSBn8hBYA5vKSo8UsoSW3giN+y7cPl7VJN1wrGXg56LKQQByX85i0QLpI4fBUc0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=YR2fKaES; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1760401833; bh=HvGgaFWBTdNE6Bay2kvJlLwmy4Dyj/uwmy1sSo7Y4D4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YR2fKaESW35SsSADdb3oYr5p72d3MkYzULJ1sRqz1G50/K6FRwVXTUAuwAfxjBAxV
	 do4wyh3JcnVfXvIgXGmZwh4bvagsaxuHak2DjQnHTrlPxKae+IZFBlOld9PjyZiW0S
	 7unhCrQ6ELtdIMHFnjFBxkhK2gE5Pit02InI+qgo=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.230.220])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id 79F01285; Tue, 14 Oct 2025 08:30:31 +0800
X-QQ-mid: xmsmtpt1760401831tv6k674kl
Message-ID: <tencent_A5374A4B00744776B566CC3DD936EC960A09@qq.com>
X-QQ-XMAILINFO: NmRjDopJZVxOIDYKzhLIqywTpTLqV8h8kOzVqIJHfaEQbkB/pTKdGXcNqA8b/V
	 OHr0n+qT+aEdUDyIsrxlCBDmn8DrRv/aYdF9cvl0h8B//moQeVy9qz9n4rZsZlZmXSuvjAzVSC9k
	 KRbO0/iye3A993GEh/Vx9J9BREjzVDixQCW2vO+PaRYR+C9PBRZtjuzhoksLkdCcpKvNMJarwCEs
	 o7SqNQr6X78FMiwlC9N0FFcy5TRi7sJ4D2dPeQLFyaZfGZoy1HohMEJNswYyXzIzCN5CVmMkwkuR
	 q3DGcZiRdnz3iqSGPFCnGm4Yxolbltov4eYjhAINRXpi7Dp1Vme/HcrJL0ssVXldjjWKuRq65o3E
	 IjX9jNpuXtl24MdE2NMDCLRPIFyNj/B+X4AT3x6ued6+f127DoDILhqz/1Pjq6C2PjezQZHuNqeX
	 aE4Oo/oXzUjmKmzVHBUOUatwDyzOtI5MODe8EhMj5SPbHsDuKMNCj6NIMbb9i8dCzUO1uVGIP355
	 sam367rsr8GwmtUnMJQimPL8lymRlMdao/xRjb7tX4NfFO3EJ00ezPLhH7J8lHtSX6BJdizz8U5k
	 jlDnnfdBiKEsrmkpm3xDdRAXWQ1UbbYimeWH0c5Z9xuba492ea2PJ3ZH5LiXTHEAeHnpJerlcbnB
	 9XwgurDCMkxDBiC4Ier+Nv6aaj7g8sVxmQd1cn7cyNe/He7Wf8/1tTOAFE6GjebMq/l7nnJy9ZdQ
	 hbXD0oKgezGlAM1hQ3oLaJTrlbWAY/Bc5JOC22BqD2DWq96JVLaMSaHOeMb+cz/yTwzAgzGrnBK1
	 q7FX5Pl2WaEv6rBKK70Lj+HTahfNRxFlpk99v/mA2qrq9YtE0RsBIoREkI7l5nzkeebtvwMZIk58
	 m977fYaYzegO2OgdsLbgVUHxAVQ3v/pXdcjtyhcFtPz+Ykm/lHEVOq1KVyeOs9RId8ly0Zh71w/B
	 MQEQhrW+2bY10bU0inYcfHKVspayh+zZYKeRBw1egQlYGixflafH4hkhe0yDRIDRE2LQ967SNAiP
	 efKKCrNqd4ZgWd4u0O
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Edward Adam Davis <eadavis@qq.com>
To: eadavis@qq.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzbot+480edd2cadb85ddb4bbe@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH V2] media: dvb-usb: Optimizing err() output
Date: Tue, 14 Oct 2025 08:30:31 +0800
X-OQ-MSGID: <20251014003031.3996942-2-eadavis@qq.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <tencent_303296E836864A7674D377A966003C7D3709@qq.com>
References: <tencent_303296E836864A7674D377A966003C7D3709@qq.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a uninit-value in pctv452e_i2c_msg. [1]

When the snd_len or rcv_len check fails and jumps to failed, buf is
uninitialized, triggering the uninit-value issue.

Setting the err() output buf byte count to 0 before jumping to failed
before initializing buf and setting it to 7 after initializing buf avoids
this warning.

[1]
BUG: KMSAN: uninit-value in hex_string+0x681/0x740 lib/vsprintf.c:1220
 pctv452e_i2c_msg+0x82a/0x8f0 drivers/media/usb/dvb-usb/pctv452e.c:467
 pctv452e_i2c_xfer+0x2e6/0x4c0 drivers/media/usb/dvb-usb/pctv452e.c:502

Reported-by: syzbot+480edd2cadb85ddb4bbe@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=480edd2cadb85ddb4bbe
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
V1 -> V2: subject typos

 drivers/media/usb/dvb-usb/pctv452e.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/pctv452e.c b/drivers/media/usb/dvb-usb/pctv452e.c
index 5094de9a312e..3b6e86a8e9ff 100644
--- a/drivers/media/usb/dvb-usb/pctv452e.c
+++ b/drivers/media/usb/dvb-usb/pctv452e.c
@@ -420,7 +420,7 @@ static int pctv452e_i2c_msg(struct dvb_usb_device *d, u8 addr,
 	struct pctv452e_state *state = d->priv;
 	u8 *buf;
 	u8 id;
-	int ret;
+	int ret, plen = 0;
 
 	buf = kmalloc(64, GFP_KERNEL);
 	if (!buf)
@@ -432,6 +432,7 @@ static int pctv452e_i2c_msg(struct dvb_usb_device *d, u8 addr,
 	if (snd_len > 64 - 7 || rcv_len > 64 - 7)
 		goto failed;
 
+	plen = 7;
 	buf[0] = SYNC_BYTE_OUT;
 	buf[1] = id;
 	buf[2] = PCTV_CMD_I2C;
@@ -466,7 +467,7 @@ static int pctv452e_i2c_msg(struct dvb_usb_device *d, u8 addr,
 failed:
 	err("I2C error %d; %02X %02X  %02X %02X %02X -> %*ph",
 	     ret, SYNC_BYTE_OUT, id, addr << 1, snd_len, rcv_len,
-	     7, buf);
+	     plen, buf);
 
 	kfree(buf);
 	return ret;
-- 
2.43.0


