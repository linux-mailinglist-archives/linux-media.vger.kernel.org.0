Return-Path: <linux-media+bounces-1389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E357FE7B3
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 04:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 290CD281E37
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 03:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E557134A9;
	Thu, 30 Nov 2023 03:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Or7KV+5s"
X-Original-To: linux-media@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0A8DD1B4;
	Wed, 29 Nov 2023 19:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=ZQQnG7Xd6nXerp8hNY
	w4rgyz/Uv30Jfz7wNiiBGv9JU=; b=Or7KV+5so84/3kvDLVCgswxFhait3VnExe
	Nte5r1Nducmti/M6QaLchtA+XXsk+nnpcuXjfnjYbld0ezdEYRqvQdG9TMxC290V
	h3mLwRNCK7fMlU0/heS6TK/ki4mteTVkafey1gfgR9SqEUnchj5ZGDajYvl5hRfb
	0e+8SYlLo=
Received: from localhost.localdomain (unknown [39.144.190.126])
	by zwqz-smtp-mta-g2-1 (Coremail) with SMTP id _____wD3_liBA2hlqnEuEQ--.45301S2;
	Thu, 30 Nov 2023 11:37:37 +0800 (CST)
From: Haoran Liu <liuhaoran14@163.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoran Liu <liuhaoran14@163.com>
Subject: [PATCH] [media] usbtv: Add error handling for usb_submit_urb in usbtv_audio_start
Date: Wed, 29 Nov 2023 19:37:35 -0800
Message-Id: <20231130033735.36013-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3_liBA2hlqnEuEQ--.45301S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4UJw4UKryftF18tr17trb_yoW8Zr48pa
	13Wa15ZFWDJw43ZrnrJFs5Cr1Fvan3tFW8CF9rG39xZws8ta1Yqa40y34a9r48CryxJw13
	tr1qqrW5uwsFv37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEBTYUUUUUU=
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/1tbiwhQ4glc662t4DAABs0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This patch introduces improved error handling for the usb_submit_urb call
in the usbtv_audio_start function. Prior to this change, the function did
not handle the scenario where usb_submit_urb could fail, potentially
leading to inconsistent state and unreliable audio streaming.

Although the error addressed by this patch may not occur in the current
environment, I still suggest implementing these error handling routines
if the function is not highly time-sensitive. As the environment evolves
or the code gets reused in different contexts, there's a possibility that
these errors might occur. Addressing them now can prevent potential
debugging efforts in the future, which could be quite resource-intensive.

Signed-off-by: Haoran Liu <liuhaoran14@163.com>
---
 drivers/media/usb/usbtv/usbtv-audio.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/usbtv/usbtv-audio.c b/drivers/media/usb/usbtv/usbtv-audio.c
index 333bd305a4f9..81d6d54fd12c 100644
--- a/drivers/media/usb/usbtv/usbtv-audio.c
+++ b/drivers/media/usb/usbtv/usbtv-audio.c
@@ -172,6 +172,7 @@ static void usbtv_audio_urb_received(struct urb *urb)
 static int usbtv_audio_start(struct usbtv *chip)
 {
 	unsigned int pipe;
+	int err;
 	static const u16 setup[][2] = {
 		/* These seem to enable the device. */
 		{ USBTV_BASE + 0x0008, 0x0001 },
@@ -216,7 +217,15 @@ static int usbtv_audio_start(struct usbtv *chip)
 	usbtv_set_regs(chip, setup, ARRAY_SIZE(setup));
 
 	usb_clear_halt(chip->udev, pipe);
-	usb_submit_urb(chip->snd_bulk_urb, GFP_ATOMIC);
+	err = usb_submit_urb(chip->snd_bulk_urb, GFP_ATOMIC);
+	if (err) {
+		dev_err(&chip->udev->dev,
+			"usb_submit_urb failed: %d\n", err);
+		kfree(chip->snd_bulk_urb->transfer_buffer);
+		usb_free_urb(chip->snd_bulk_urb);
+		chip->snd_bulk_urb = NULL;
+		return err;
+	}
 
 	return 0;
 
-- 
2.17.1


