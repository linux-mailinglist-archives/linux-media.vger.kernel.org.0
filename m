Return-Path: <linux-media+bounces-44183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B416BCDCAF
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 17:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B30B34E27D2
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 15:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD512F90D4;
	Fri, 10 Oct 2025 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="kQf++FDe"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407A226A087;
	Fri, 10 Oct 2025 15:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760110025; cv=none; b=TDcm2farymX+a0SQhGOeyr0hIQFj37PhqTnIok0rfWwQce4BW1Z7ipEpsRG0nTMtKyCgTeiu66BPpoQMJ+bidwQaDkfxmNwQg0iKxcUIngQ+X0Qt9EbH2mqt/BTUKSTRDqQtB1gkoFQuc9SS4xQSLx32ioZaUtHqadaVPULAtcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760110025; c=relaxed/simple;
	bh=FoqhnH0aoPYtJFp9JGtXoN+k6yFcXvixrQP3VmDh8ys=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=pPcOBi0yoJJpBVedYQ4SfUT5JLQbijOPEL1Z81JyT2NiI9/kBy7eQISONFLtoOtIraCpzN8k7Y9Wym3B2kbBsRnKE0D+xiaefwkSJJx0de1MYQEexnwyaK5QOibqn9rp1EkLn4+peER0T2G0EsYcNc1y9OhzSW4EQkvdPZyAZbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=kQf++FDe; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1760109710; bh=Or25gIiKy8boPBkk79EZPJZ6wSZGAllmnA2wLhBp+uQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kQf++FDej6cmeAzlzrizBzCQRx8fBbQ79Sg4AKWl/fDPA1DII2n/zAtxpPPyP6ZIO
	 HpyFhn09GH2RJ1XFk7977G+wodpgWk5nTjb6HqT7XaTBHw61BCcKOFkI3Qaj0TaHV8
	 cxBNKbLU9vhrs5thmPep5NFdRUbsAC7qPobDeRuw=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.230.220])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id 56FA1A4E; Fri, 10 Oct 2025 23:21:47 +0800
X-QQ-mid: xmsmtpt1760109707tibdhsrd0
Message-ID: <tencent_303296E836864A7674D377A966003C7D3709@qq.com>
X-QQ-XMAILINFO: NVJ0hJNx7N5SiqtozZbheU49yv/RiquKVrW2qkWLlsO5mGucU4DBndxbIYERFB
	 AJFz7rnm5pENdTHXM3Ht5VqTX0xEpfhLlA2xPzNX+/PiRR/zAGJFAosJlM762NSrFEf5R67So77g
	 1xrLVahRJWPBNZyFxZORLquNJP2DPw10rb41eiGGOMYr9gWeeqpqOJs7t5pCDNWx2eDCe2Ms2622
	 9zn/Muluqr9jAlIkh/P8A4qlh3KQYeHnS1U6aQbKnCTk6oUTp8FahBkscUnMniRemc+IKnSrlILq
	 MZLgqpqP8odA0h5vbmf/bcfItOqjfBeqtatdNVAT8ibOiKkv3JjrHRkHSuYojg5N/+MmmCvA3hoc
	 3lp4dmH3pqJ06HMnQARug9yrPZJeYJ4IsX05QpLsx/QTXVH0g0F3GMORDoD5EP43SS/XT+a3kL3Q
	 bDPENylRj+TtKGmG+lg13Bs60m61wRacEDhdQ9A7xNdVHoQPyxDbpyCSVDWKzPylyjg9MghJBAG3
	 JkW9cl+E/tQec3x+rxxu/I/AuFzdRqPCR+Qr+kS+rhFQ0rDlCjCletGR/sAnBzmxW7vCm9G24z3g
	 JrkGdZ+/4zTyVdxXbTQKUXVQQwycHPx3iXM4Wcvvl8FKlIJc1PxwTHRZcbpbN6F190f8HoSvG7DN
	 FlYGiz9QcI5KS3aOvL/WZGI/t2y54M8ZTvMB2hMVa/BNh+TYwhuAtennf2vPYFpBMIhvtD9nCSZA
	 dtIjmcqv8PlzLF+MDFi2VaUdgzokwf/cST5IqdRtg62VJ30pRwfbT0wZwZa5fq3jgRwuR+16H82a
	 4tfO4s8hba/D/ZqNxcrUP/n3M8nXs0OuNRzwRoGA0zrNbd8ise7QuveqQCzZr4XDJn5LR5y2QXek
	 bjLej5S7Z20sh0xzacS+QPhSwwO0JhN0S5KZs4iF80HWd0AamEFxylQmLM5SHPtaMkZ0WMJtKtlt
	 CEnVQ9L2E10Sdd+5jxgFwDn6CExXsIwrUv9UrFb7seTm2xi2lfw62qsdg/HMBI
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+480edd2cadb85ddb4bbe@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] meida: dvb-usb: Optimizing err() output
Date: Fri, 10 Oct 2025 23:21:48 +0800
X-OQ-MSGID: <20251010152147.2167496-2-eadavis@qq.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <68e8894e.050a0220.91a22.0056.GAE@google.com>
References: <68e8894e.050a0220.91a22.0056.GAE@google.com>
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


