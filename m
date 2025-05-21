Return-Path: <linux-media+bounces-33023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDECABF5DC
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 15:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D3101BC3E93
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 13:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A0327CB36;
	Wed, 21 May 2025 13:18:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC9C262FFE;
	Wed, 21 May 2025 13:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833492; cv=none; b=llsWs+npO8TYuXRLTe4SXMVLFPhrvVm8kOmv5fRi9H1ZLs1ulhXGZ4bDVBiPvaQpnRT9dhjCzru7tKFcOOeAC3pRf+hsDXKijX5GVNcRjv0hN5ocjCl1469PXWCTcxRpY89EjduuKWZy1csvL0wmNxTPvtJR8x88SkNnXBI6fU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833492; c=relaxed/simple;
	bh=VPSIgRG+z7ZPpjp1AXcFSZ0nKQ/0lck0aPhY1NPcsSU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=vGPokdP3R+aUvAI9fpAK0uYGuhNwSo5cxEo3oGS++mGiDZOyNO6fioj8Rvt5y9GhEFK5tEekBd9zs4TCLjQAhfb3kfby9/DzlaMuBcmPexnB1sh4Vu2ctVk0VwVEn3Jhw5KegN9hLs7IP9fjWKS4eDPwl/aqlvXOCUVfrn7iSXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 21 May
 2025 16:18:03 +0300
Received: from localhost (10.0.253.101) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 21 May
 2025 16:18:03 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com>,
	<lvc-project@linuxtesting.org>, Alan Stern <stern@rowland.harvard.edu>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>, <gregkh@linuxfoundation.org>
Subject: [PATCH v3] media: dvb-usb-v2: disallow 0-length I2C reads
Date: Wed, 21 May 2025 16:17:49 +0300
Message-ID: <20250521131752.2566007-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Syzkaller reported via syzbot a warning (see [1]) that occurs
when the fuzzer manages to craft a I2C transfer with a 0-length read
request. This in turn leads to an attempt at execution of a
USB 0-length read (which is forbidden by USB protocol) leading to
it being interpreted as a write.

Enable I2C_AQ_NO_ZERO_LEN_READ adapter quirk for all devices
managed by dvb-usb-v2 thus forbidding 0-length read messages
altogether.

[1] Syzbot report
usb 2-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
WARNING: CPU: 0 PID: 5845 at drivers/usb/core/urb.c:413 usb_submit_urb+0x11dd/0x18c0 drivers/usb/core/urb.c:411
...
Call Trace:
 <TASK>
 usb_start_wait_urb+0x11a/0x530 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x2b3/0x4c0 drivers/usb/core/message.c:154
 gl861_ctrl_msg+0x332/0x6f0 drivers/media/usb/dvb-usb-v2/gl861.c:58
 gl861_i2c_master_xfer+0x3b4/0x650 drivers/media/usb/dvb-usb-v2/gl861.c:144
 __i2c_transfer+0x859/0x2250 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x2c2/0x430 drivers/i2c/i2c-core-base.c:2315
 i2cdev_ioctl_rdwr+0x488/0x780 drivers/i2c/i2c-dev.c:306
 i2cdev_ioctl+0x78a/0xa20 drivers/i2c/i2c-dev.c:467
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf1/0x160 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
...

Reported-by: syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=721071c10f3c7e4e5dcb
Tested-by: syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com
Fixes: 776338e121b9 ("[PATCH] dvb: Add generalized dvb-usb driver")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
v1 -> v2: fix description due to overly long lines.

v2 -> v3: add a comment explaining the need for a i2c/usb quirk
per Wolfram's suggestion.

P.S. This issue is eerily similar to the one in dib0700
driver, see [2]. Alan suggested a solution which hasn't been committed
yet in [3]. Mine is essentialy a copy of his, only for dvb-usb-v2
devices. As far as I know, no I2C core level protection against
such issues has been implemented either.
[2] https://syzkaller.appspot.com/bug?extid=c38e5e60d0041a99dbf5
[3] https://lore.kernel.org/all/c7f67d3b-f1e6-4d68-99aa-e462fdcb315f@rowland.harvard.edu/

P.P.S. While this driver seems to be orphaned, I decided to
send a patch anyway, perhaps someone will deem it worthy...

 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index f1c79f351ec8..5d6ff0ddd349 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -19,6 +19,11 @@ module_param_named(force_pid_filter_usage, dvb_usb_force_pid_filter_usage,
 MODULE_PARM_DESC(force_pid_filter_usage,
 		"force all DVB USB devices to use a PID filter, if any (default: 0)");
 
+/* prevent invalid 0-length usb_control_msg */
+static const struct i2c_adapter_quirks i2c_usb_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN_READ,
+};
+
 static int dvb_usbv2_download_firmware(struct dvb_usb_device *d,
 		const char *name)
 {
@@ -63,6 +68,7 @@ static int dvb_usbv2_i2c_init(struct dvb_usb_device *d)
 
 	strscpy(d->i2c_adap.name, d->name, sizeof(d->i2c_adap.name));
 	d->i2c_adap.algo = d->props->i2c_algo;
+	d->i2c_adap.quirks = &i2c_usb_quirks;
 	d->i2c_adap.dev.parent = &d->udev->dev;
 	i2c_set_adapdata(&d->i2c_adap, d);
 

