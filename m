Return-Path: <linux-media+bounces-46206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A03DC2B97E
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 13:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 387364EC96F
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 12:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25B030AD1D;
	Mon,  3 Nov 2025 12:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="AInRrPnk"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF3A21D3F0;
	Mon,  3 Nov 2025 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762172184; cv=none; b=J7u2GHBkne++HPbiySwGKo/4dztQYaqy9/YrW8Mag2nT8qfPjnQSsYLVGxnJFowawVWNN2yK0ircN8p2gJAlViCocTPvJRkjhfxfRAqm4FpD9nnjXrX+HeBgBQNhxEsQZ4MTVo/QdE1P+6SHbpofpbLh6ldQH1u34Asjrf4CuIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762172184; c=relaxed/simple;
	bh=6krgWtqrGcUs/3srWaBGKYaon5zOH66rvyRQwKTNAYg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=oVTkgsFGkug8yxMBU36O/SLwPBAsB0dRxEFIdUBzm6DOEyo76WBDaoH2kHrLqKJ9G3LJgsveDTkfgkF9EFK4Li8nHIKbZdsrbfUJOHUN/wHADrhayUZdNmVOfmPjN/7fakmOzc/gXAJut0ZB2+r3/8wmlJc3O89+vfKV/Ute3fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=AInRrPnk; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1762171871; bh=WFePNAZGR4tQn9FIlJTTpZn4dniKjCQurdOMqdPydC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AInRrPnksJMYjSNNtZk0hNwQ47VHtzZgHQeMUdl9u8ZtaRoYcDaeRCtbupLdudEak
	 Lx3inBB2JMcUPfeogiplxYErOG6gzr/LP46jrPgvQV7V9DTT2dafrV/IB5AZZP43xi
	 ctAH5sAcuwxLk6A2VEpdEYLMYvxeli9DYJNbTB54=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.201.7.117])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id E711D030; Mon, 03 Nov 2025 19:57:49 +0800
X-QQ-mid: xmsmtpt1762171069tbsjfar7s
Message-ID: <tencent_7D8067C646C712F50668898DEEC9AEE48C06@qq.com>
X-QQ-XMAILINFO: NVJ0hJNx7N5SbHuNsjjI99gdChJWFrhEaEO2fz9GKo04uhP3B05ApCdOdGAaB0
	 NTLvE+/XOzKcAUqeXoICv+lWPdGvIbNZR533IEGg7HtSKyPTTi5IcUrrlrCiPRfwhs8ctKIqv9xD
	 RlhLod0vaOaJdVwKfVaI5WOX1/8pjbJ3xHQ+TdkuEGwIj743AmU9vLTnbQvPyC2CnXKWbe18cp3J
	 7rNCtSv/rQHSsx98EfsQVQtX9RHvo3M5TzFuZcD0nqnhOY+x85wtMOAHwJ5zI44lC6GANKNIRxqj
	 npot38WHE94sd7BH8B1gfySo2N2W88vD+qI2kCy45HGlwt88i9vLeRut9GEnr7cIJ/RC5nNxEH2d
	 Uh8tcJSH5bI4ovjlbwiMrEY7E4LOULhhKkTVpHwS6ObwBuBGRH30C3h4YdnvXuo075q3KNj8v2cu
	 1w9Bh7jzfPRTLH5PbxRjdrV6f2R7ulOtPARuthYkUBQxPji8t4EvR/U3UnDHK/RwSqriW8bCLl43
	 pOHoA3cfNQbBUN2bGdVx3Z+mH82xzhM5boThy0T/MQOs+APGkPliWBxPsCyEen1e2/54jT7UuEAk
	 RoEMlOD4s/O3NF5b9Y/uZ2FGnXuHgmhK8IDGu+lkMQ1dRC9+37xkPt1eBDGbAoQ5yR2plScAKEcl
	 wSfiqmv4zUSUmZUH2A/sUKKXeSOM6sOU3DE9z6UeWDortVSv9ygLMLvbCh8jTshybU9HeoEBlrx6
	 3Mae40iAMQLJ83N3VDZnmWDA8imsid1Ed84CNK2kdrcEZBP0RdNuIBy5PsqGq/+Q6LI0lJWWl62W
	 gL9p8TemNAKG6EHHPTgfSUyOavxwU/NtH41koGDtJQBCxZ4sWU1Yr8HziqqHP7dH49PsYWN+b1pR
	 /aTK5Dl8xwc1SVP2eU+Qm67r7x93AD7DYB6Jf1O8X2bvUiP3iUwAfqEDCLzHS6hCpo0rImvShFO+
	 nyyLpmI4mzhxp6COf8hCVf3Jyl1cDt+ksPi1ZLxzleftqZgTdWQ4gOI911NUH40JEqZFDZ6a3ars
	 9FDmiRMA==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Edward Adam Davis <eadavis@qq.com>
To: hverkuil+cisco@kernel.org
Cc: eadavis@qq.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzbot+480edd2cadb85ddb4bbe@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH V3] media: dvb-usb: pctv452e: move snd/rcv len check before kmalloc
Date: Mon,  3 Nov 2025 19:57:49 +0800
X-OQ-MSGID: <20251103115748.1724573-2-eadavis@qq.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <9f9d2240-63be-4232-8ad6-44821d2b9177@kernel.org>
References: <9f9d2240-63be-4232-8ad6-44821d2b9177@kernel.org>
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

Move the snd/rcv length check before kmalloc, and return -EINVAL directly
if the condition is met.

[1]
BUG: KMSAN: uninit-value in hex_string+0x681/0x740 lib/vsprintf.c:1220
 pctv452e_i2c_msg+0x82a/0x8f0 drivers/media/usb/dvb-usb/pctv452e.c:467
 pctv452e_i2c_xfer+0x2e6/0x4c0 drivers/media/usb/dvb-usb/pctv452e.c:502

Reported-by: syzbot+480edd2cadb85ddb4bbe@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=480edd2cadb85ddb4bbe
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
V1 -> V2: subject typos
V2 -> V3: move the check before kmalloc

 drivers/media/usb/dvb-usb/pctv452e.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/pctv452e.c b/drivers/media/usb/dvb-usb/pctv452e.c
index 5094de9a312e..bc7a224d829e 100644
--- a/drivers/media/usb/dvb-usb/pctv452e.c
+++ b/drivers/media/usb/dvb-usb/pctv452e.c
@@ -422,16 +422,15 @@ static int pctv452e_i2c_msg(struct dvb_usb_device *d, u8 addr,
 	u8 id;
 	int ret;
 
+	if (snd_len > 64 - 7 || rcv_len > 64 - 7)
+		return -EINVAL;
+
 	buf = kmalloc(64, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
 	id = state->c++;
 
-	ret = -EINVAL;
-	if (snd_len > 64 - 7 || rcv_len > 64 - 7)
-		goto failed;
-
 	buf[0] = SYNC_BYTE_OUT;
 	buf[1] = id;
 	buf[2] = PCTV_CMD_I2C;
-- 
2.43.0


