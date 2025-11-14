Return-Path: <linux-media+bounces-47064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E97C5C84C
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 11:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAC3D3BC940
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 10:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE76B30F54A;
	Fri, 14 Nov 2025 10:14:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE413081A7;
	Fri, 14 Nov 2025 10:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763115258; cv=none; b=K6JhC6UDgAIk3PEjB0z50rBRhIaXzGkGk7TI4h321B7468nyxYutjifnQ257hIO0VZEH3twJnQKctYEe9hJAQIqAKuP/rgSVOGrupiR1+8Ph1ArOCHTgr5TF+fuLHp3t7UMI6ZRK/efbOiFMXbte4gg/5Lgpaac3hVIhdsAeFHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763115258; c=relaxed/simple;
	bh=XKdausMTjLkXwpB1lafqclL7tqllNYqGIXJCuDWBwco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iklfqG0mBiWx7/+Bx4gdhR0z0BL2D9XaxtvSj27BNkKhxkFWPGbIYrvp+JhAy7pnHF2RCsX/u4Piqj3kfJAIT/KBaqlfkk7R/TM2FOxSQIaFrJbyHwA49hY+YFkBCFTjhBxoYK0Jm8YcEg5EUTKdJvXxvccEvU67p+Je81yYOPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowAAXptjtABdpIpW5AA--.10193S2;
	Fri, 14 Nov 2025 18:14:06 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: sean@mess.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] media: irtoy: fix race between device disconnection and urb callback
Date: Fri, 14 Nov 2025 18:13:46 +0800
Message-ID: <20251114101346.2530-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAXptjtABdpIpW5AA--.10193S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ury8Ww1DJr4UAw13Gr4DArb_yoW8GFW3pa
	y09rySyFyUGr4UAF4qy3WkZayFganxCa47CFWru3yFkwn5Aasrta4xKa43Gr1DCFy7Ja4j
	yw15XayfuFn0kaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfUejgxUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBg0GA2kW9sAkWAAAs7

The irtoy_disconnect() function calls rc_unregister_device() before
usb_kill_urb(), creating a race condition similar to the one fixed in
commit 'f656cfbc7a29'. If rc_unregister_device() executes while
the URB callback irtoy_in_callback() is still running, irtoy_response()
may call ir_raw_event_store_with_timeout() with a freed
irtoy->rc->raw pointer, leading to a NULL pointer dereference.

Call usb_kill_urb() before rc_unregister_device() to ensure all URB
callbacks complete before freeing device resources.

Fixes: 261463dbc34f ("media: rc: add support for Infrared Toy and IR Droid devices")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/media/rc/ir_toy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/ir_toy.c b/drivers/media/rc/ir_toy.c
index 533faa117517..630e0cc840e2 100644
--- a/drivers/media/rc/ir_toy.c
+++ b/drivers/media/rc/ir_toy.c
@@ -530,11 +530,11 @@ static void irtoy_disconnect(struct usb_interface *intf)
 {
 	struct irtoy *ir = usb_get_intfdata(intf);
 
+	usb_kill_urb(ir->urb_out);
+	usb_kill_urb(ir->urb_in);
 	rc_unregister_device(ir->rc);
 	usb_set_intfdata(intf, NULL);
-	usb_kill_urb(ir->urb_out);
 	usb_free_urb(ir->urb_out);
-	usb_kill_urb(ir->urb_in);
 	usb_free_urb(ir->urb_in);
 	kfree(ir->in);
 	kfree(ir->out);
-- 
2.50.1.windows.1


