Return-Path: <linux-media+bounces-30635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EC5A9541E
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 18:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F34B4173456
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 16:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926401E5202;
	Mon, 21 Apr 2025 16:33:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCA11C84AB;
	Mon, 21 Apr 2025 16:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253193; cv=none; b=DNo6fJpWyX6JvfXhKfYO7Q5BlE1WfLrR9eQXfj4VB4D3vEp1/YLFCfSU4ACD7+gmsb0PV6sDoxAKQPjC2/rdHHki16MxzEfjLbDqY5VvouoJdoudMgXjntgs+YJT1csy8KMEz97jL1TStTSrqXaFVrXNk3Urd9zmJ/YIQ3rEtH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253193; c=relaxed/simple;
	bh=ZdxUod+8vHsExl8vnmiNub9FeRAgmNE1AnMkKzlBxOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eI3ajHbpxriD3ppPnxuyg1jNNbpZqDsZNu+Ssdt9Fyjd9K7/DLfKe35tAV/+E+jFjPn7iPkVOTKMGo0cqP+4UxesOjcNsBnS2bHy0QCV2sbL3bSIDYdHXntSUG+Zqa4GqOkFMxUHcqo8CrlEhlFZCpjEP31yJOm71cCZdFfvlRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from [127.0.1.1] (unknown [IPv6:2a01:e0a:3e8:c0d0:8e8c:c49a:b330:a587])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 2EA4E40760F;
	Mon, 21 Apr 2025 16:33:08 +0000 (UTC)
Authentication-Results: Plesk;
        spf=pass (sender IP is 2a01:e0a:3e8:c0d0:8e8c:c49a:b330:a587) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=[127.0.1.1]
Received-SPF: pass (Plesk: connection is authenticated)
From: Arnaud Lecomte <contact@arnaud-lcm.com>
Date: Mon, 21 Apr 2025 18:33:02 +0200
Subject: [PATCH 2/2] media: dvb-usbv2: ensure safe USB transfers on
 disconnect in i2c_xfer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-ubsan-out-of-sub-v1-2-d9239a5af007@arnaud-lcm.com>
References: <20250421-ubsan-out-of-sub-v1-0-d9239a5af007@arnaud-lcm.com>
In-Reply-To: <20250421-ubsan-out-of-sub-v1-0-d9239a5af007@arnaud-lcm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+0192952caa411a3be209@syzkaller.appspotmail.com,
 contact@arnaud-lcm.com, skhan@linuxfoundation.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745253187; l=2330;
 i=contact@arnaud-lcm.com; s=20250405; h=from:subject:message-id;
 bh=ZdxUod+8vHsExl8vnmiNub9FeRAgmNE1AnMkKzlBxOk=;
 b=xKOrkUOVP0Q42pSVk2Z4omZafYqR/2FgmzCmItzJ0hX9Coq/kSs7eB9TtDEsQIy5zG04TYnkc
 IkP/iyzHXVZChe35ewMolBcR/jnlTQLkzvP4B4rlr8ntb2KVvLuf0Cm
X-Developer-Key: i=contact@arnaud-lcm.com; a=ed25519;
 pk=Ct5pwYkf/5qSRyUpocKOdGc2XBlQoMYODwgtlFsDk7o=
X-PPP-Message-ID: <174525318857.30884.11376688935051155226@Plesk>
X-PPP-Vhost: arnaud-lcm.com

Previously, there was a potential race condition where a USB transfer could
access inconsistent data if a disconnect occurred mid-transfer.
When this scenario happens (i.e when there is an USB disconnect during
the transfer), we would encounter an error related to the corruption of
st:
[   66.967387][T10787]  slab kmalloc-8k start ffff88804f5b4000 pointer offset 80 size 8192
[   66.968252][T10787] list_del corruption. prev->next should be ffffc9000d18f7e0, but was ffff88804f5b4050. (prev=ffff88804f5b4050)
[   66.969443][T10787] ------------[ cut here ]------------
[   66.969973][T10787] kernel BUG at lib/list_debug.c:64!
[   66.970491][T10787] Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
[   66.971104][T10787] CPU: 0 UID: 0 PID: 10787 Comm: repro Not tainted 6.15.0-rc3-00004-gcd75cc176092-dirty #28 PREEMPT(full)
[   66.972204][T10787] Hardware name: QEMU Ubuntu 24.04 PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   66.973236][T10787] RIP: 0010:__list_del_entry_valid_or_report+0x15c/0x190
[   66.973896][T10787] Code: ca da fb fc 42 80 3c 2b 00 74 08 4c 89 e7 e8 fb 29 1f fd 49 8b 14 24 48 c7 c7 a0 09 a2 8c 4c 89 fe 4c 89 e1 e8 55 43 18 fc 90 <0f> 0b 4c 89 f7 e8 9a da fb fc 42 80 3c 2b 00 74 08 4c 89 e7 e8 cb

Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
---
 drivers/media/usb/dvb-usb-v2/az6007.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index e8ee18010346..f6b8e29d19de 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -752,8 +752,13 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 	int length;
 	u8 req, addr;
 
-	if (mutex_lock_interruptible(&st->mutex) < 0)
+	if (!usb_trylock_device(d->udev))
+		return -EBUSY;
+
+	if (mutex_lock_interruptible(&st->mutex) < 0) {
+		usb_unlock_device(d->udev);
 		return -EAGAIN;
+	}
 
 	for (i = 0; i < num; i++) {
 		addr = msgs[i].addr << 1;
@@ -821,6 +826,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 	}
 err:
 	mutex_unlock(&st->mutex);
+	usb_unlock_device(d->udev);
 	if (ret < 0) {
 		pr_info("%s ERROR: %i\n", __func__, ret);
 		return ret;

-- 
2.43.0


