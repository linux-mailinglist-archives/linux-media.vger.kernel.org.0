Return-Path: <linux-media+bounces-47066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DFFC5C8A3
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 11:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4A7FF4F79D5
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 10:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD2630F950;
	Fri, 14 Nov 2025 10:14:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C57030F813;
	Fri, 14 Nov 2025 10:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763115281; cv=none; b=U4v8zk1SqdB85E36sMmnpUPFLo/P+k89NxLG6LIcrGwGJmVnf0RtbGUgd+33X/ANu8YrL/Gm4Xln5B10aHM1ylxHfVSv7SUxwjR9kTb+6cgMq2PWsrsql4Lgbzt4P3JQhusQ+JBpyBt6zppG+ACsfJIE83NWGL73vzmbTDzCVHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763115281; c=relaxed/simple;
	bh=hQAm2cynmBS+7YWEysl94cgkydRizBZ4fkJ+yymE+cM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mGLHwm90gHd6grDMh6mi4LWBtKFTPbFYSDYQTg/OihGDbuoae3HVOYTgjzlHv10JEYAsGoB4RwVX2HCagK0boFuQyjXF5NaVk4NxdrrFNFmYylaadxnVLc029donqRtvXJq4QM2fQaV4g+r8iNXMY+2TWJDcic3aMLZq5Ia1RXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowABn99kIARdpN5e5AA--.34984S2;
	Fri, 14 Nov 2025 18:14:33 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: sean@mess.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] media: mceusb: fix race between device disconnection and urb callback
Date: Fri, 14 Nov 2025 18:14:31 +0800
Message-ID: <20251114101432.2566-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABn99kIARdpN5e5AA--.34984S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ury5Jw1xCFW3uFyxtr1UKFg_yoW8GF4UpF
	W0gryFyFy8GF4UZw4DJa1kXayYqws5Gay2kFyru34Y9ws5Aa47ta4kGa45A3ykAFWUAFWq
	yw13J3yxuFZ8CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfU0c_TUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwkGA2kW984gTgAAsj

The mceusb_disconnect() function calls rc_unregister_device() before
usb_kill_urb(), creating a race condition similar to the one fixed in
commit 'f656cfbc7a29'. If rc_unregister_device() executes while the URB
callback mceusb_dev_recv() is still running, mceusb_process_ir_data()
may call ir_raw_event_store_with_filter() or ir_raw_event_handle() with
a freed ir->rc->raw pointer, leading to a NULL pointer dereference.

Call usb_kill_urb() before rc_unregister_device() to ensure all URB
callbacks complete before freeing device resources.

Fixes: d8b4b5822f51 ("[media] ir-core: make struct rc_dev the primary interface")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/media/rc/mceusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index 044767eb3a38..fb5c393dcb94 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -1845,8 +1845,8 @@ static void mceusb_dev_disconnect(struct usb_interface *intf)
 
 	ir->usbdev = NULL;
 	cancel_work_sync(&ir->kevent);
-	rc_unregister_device(ir->rc);
 	usb_kill_urb(ir->urb_in);
+	rc_unregister_device(ir->rc);
 	usb_free_urb(ir->urb_in);
 	usb_free_coherent(dev, ir->len_in, ir->buf_in, ir->dma_in);
 	usb_put_dev(dev);
-- 
2.50.1.windows.1


