Return-Path: <linux-media+bounces-13274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67028908E96
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 17:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 598351C21200
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 15:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E3616B720;
	Fri, 14 Jun 2024 15:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="H6sZ+JFk"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE60915CD64;
	Fri, 14 Jun 2024 15:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718378584; cv=none; b=NJlQZWVu2sG0X/QTzq3l3PO+nNNXuSqrscEGRNQuzOlu/+6zbhcV8ICQGJKIe7h0x7Ed+buc7h+4f9ZSucVgCIZWNk2LCnF6UzXjlPFenAJ0MwA4jtNARa87nL8mP1FplZdQNNu7k+EcWZofi42phs2trAvjhYHLL6dcA4GVy4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718378584; c=relaxed/simple;
	bh=ceHwlhkQOv5Wkvy5F61fCWlYXHLEh5xGfP6+3SG6EDs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C4o71iNwZnPrnMbbnMDeQyYs6CRFXkVKz3qAM5a4SBlaxYPBPYTu97H6J1tjhjCh93KwLumTKWP18wNFuG1k8mTkXdcjtqoiIzvr2m4Uf6yRFISGg5Uhrkh3BbLs48+RVWV8YT3nbr9rSLQI3sQpn//MIj+a6e17u2dQrNXvLHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=H6sZ+JFk; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=yAGhS
	Ow2NI85cih3XGIkfc/UtZ8P/eczFTAfdvqLy8o=; b=H6sZ+JFkVQTNUzqKHaUah
	N/CJydLUMiy1B8fj/9SITomrvG2oIcTQqUvOqpbyfYKo0b4Fw1wbGoz4q0ggrmNV
	raLZVoLLy4Fv3ELXa5C4qFpv2e9FqCUagUsIzscZsTSa35D/w7hfT9Q7+YrbO3vI
	4CGTNj8l6l5IQcmYARwGKw=
Received: from ubuntu.localdomain (unknown [120.228.117.74])
	by gzga-smtp-mta-g1-0 (Coremail) with SMTP id _____wD3n6tCYGxmSah9Cg--.3328S2;
	Fri, 14 Jun 2024 23:22:42 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2] media: xc2028: avoid use-after-free in load_firmware_cb()
Date: Fri, 14 Jun 2024 08:22:25 -0700
Message-Id: <20240614152225.3943-1-chizhiling@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531091026.3094284-1-chizhiling@163.com>
References: <20240531091026.3094284-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n6tCYGxmSah9Cg--.3328S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF47KrWDJr43Ar1UJr4fKrg_yoWrWw43pF
	nxZFWfCrW8Jry3Jr47Jr4UJr1FqrW5Aa10kr4xA34agr13WrZ8tryUtFWUXr1UWr45Aa47
	JF15JrWrtF4qyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UsFxUUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbBLwr9nWXAk3F1ZQABsT

From: Chi Zhiling <chizhiling@kylinos.cn>

syzkaller reported use-after-free in load_firmware_cb() [1].
The reason is because the module allocated a struct tuner in tuner_probe(),
and then the module initialization failed, the struct tuner was released.
A worker which created during module initialization accesses this struct
tuner later, it caused use-after-free.

The process is as follows:

task-6504           worker_thread
tuner_probe                             <= alloc dvb_frontend [2]
...
request_firmware_nowait                 <= create a worker
...
tuner_remove                            <= free dvb_frontend
...
                    request_firmware_work_func  <= the firmware is ready
                    load_firmware_cb    <= but now the dvb_frontend has been freed

To fix the issue, check the dvd_frontend in load_firmware_cb(), if it is
null, report a warning and just return.

[1]:
    ==================================================================
     BUG: KASAN: use-after-free in load_firmware_cb+0x1310/0x17a0
     Read of size 8 at addr ffff8000d7ca2308 by task kworker/2:3/6504

     Call trace:
      load_firmware_cb+0x1310/0x17a0
      request_firmware_work_func+0x128/0x220
      process_one_work+0x770/0x1824
      worker_thread+0x488/0xea0
      kthread+0x300/0x430
      ret_from_fork+0x10/0x20

     Allocated by task 6504:
      kzalloc
      tuner_probe+0xb0/0x1430
      i2c_device_probe+0x92c/0xaf0
      really_probe+0x678/0xcd0
      driver_probe_device+0x280/0x370
      __device_attach_driver+0x220/0x330
      bus_for_each_drv+0x134/0x1c0
      __device_attach+0x1f4/0x410
      device_initial_probe+0x20/0x30
      bus_probe_device+0x184/0x200
      device_add+0x924/0x12c0
      device_register+0x24/0x30
      i2c_new_device+0x4e0/0xc44
      v4l2_i2c_new_subdev_board+0xbc/0x290
      v4l2_i2c_new_subdev+0xc8/0x104
      em28xx_v4l2_init+0x1dd0/0x3770

     Freed by task 6504:
      kfree+0x238/0x4e4
      tuner_remove+0x144/0x1c0
      i2c_device_remove+0xc8/0x290
      __device_release_driver+0x314/0x5fc
      device_release_driver+0x30/0x44
      bus_remove_device+0x244/0x490
      device_del+0x350/0x900
      device_unregister+0x28/0xd0
      i2c_unregister_device+0x174/0x1d0
      v4l2_device_unregister+0x224/0x380
      em28xx_v4l2_init+0x1d90/0x3770

     The buggy address belongs to the object at ffff8000d7ca2000
      which belongs to the cache kmalloc-2k of size 2048
     The buggy address is located 776 bytes inside of
      2048-byte region [ffff8000d7ca2000, ffff8000d7ca2800)
     The buggy address belongs to the page:
     page:ffff7fe00035f280 count:1 mapcount:0 mapping:ffff8000c001f000 index:0x0
     flags: 0x7ff800000000100(slab)
     raw: 07ff800000000100 ffff7fe00049d880 0000000300000003 ffff8000c001f000
     raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
     page dumped because: kasan: bad access detected

     Memory state around the buggy address:
      ffff8000d7ca2200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
      ffff8000d7ca2280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
     >ffff8000d7ca2300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                           ^
      ffff8000d7ca2380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
      ffff8000d7ca2400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
     ==================================================================

[2]
    Actually, it is allocated for struct tuner, and dvb_frontend is inside.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 drivers/media/tuners/xc2028.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/tuners/xc2028.c b/drivers/media/tuners/xc2028.c
index 5a967edceca9..352b8a3679b7 100644
--- a/drivers/media/tuners/xc2028.c
+++ b/drivers/media/tuners/xc2028.c
@@ -1361,9 +1361,16 @@ static void load_firmware_cb(const struct firmware *fw,
 			     void *context)
 {
 	struct dvb_frontend *fe = context;
-	struct xc2028_data *priv = fe->tuner_priv;
+	struct xc2028_data *priv;
 	int rc;
 
+	if (!fe) {
+		pr_warn("xc2028: No frontend in %s\n", __func__);
+		return;
+	}
+
+	priv = fe->tuner_priv;
+
 	tuner_dbg("request_firmware_nowait(): %s\n", fw ? "OK" : "error");
 	if (!fw) {
 		tuner_err("Could not load firmware %s.\n", priv->fname);
-- 
2.25.1


