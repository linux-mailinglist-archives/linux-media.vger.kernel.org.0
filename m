Return-Path: <linux-media+bounces-47065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A575CC5C897
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 11:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 05D91349111
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 10:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE4330F817;
	Fri, 14 Nov 2025 10:14:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCE430C612;
	Fri, 14 Nov 2025 10:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763115268; cv=none; b=OtUKkAiwXl61r0JzvbHEKpv87NozSjrxo4+1ZQR3RjED4K1xHgbdnDSZM64Rzl31SDfwPfnkLstYPTwCuKyFjm+jkVcjb8LXNsvPJ2lx2s43IqkSOXEhviP3yojTYKycYcOrrvEUqrzk3jTDhDYrUpwkgojDDGYT35NH214+6+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763115268; c=relaxed/simple;
	bh=jstXqdSiOMgvEeJA9/+lRj1DvHRG4cRMoFC1f6MHJZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gaLIhhP0mW+AyU0HUmVQFOqqDLCBEirIUEsJVNtZ6xV6Zf6WcE0yKCRS/bmv45jJ+VgsQuo57Z9PD4+T4ShqTxqkaCRTGOHBS5burF6PVxYq/k3yora/AT1lwtjsZvox7izcYtZS1wV5LlqxzdL9hlkjwzsZMcfzD2ODtOKeogQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowAAntdf7ABdpLJa5AA--.4088S2;
	Fri, 14 Nov 2025 18:14:20 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: sean@mess.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] media: ttusbir: fix race between device disconnection and urb callback
Date: Fri, 14 Nov 2025 18:14:18 +0800
Message-ID: <20251114101418.2548-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAntdf7ABdpLJa5AA--.4088S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ury5Jw1fKF47JFykCF45ZFb_yoW8XFWrpF
	W5u34Syry8Gr4UXa9rJ3WkCa4ruws5JayUuryru3sYv3yrJ34Ig3Wkta45Aw4UCrWxCFyv
	yw15Zw4fuFW5ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfU0c_TUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgsGA2kW9sAkhAAAsh

The ttusbir_disconnect() function calls rc_unregister_device() before
usb_kill_urb(), creating a race condition similar to the one fixed in
commit 'f656cfbc7a29'. If rc_unregister_device() executes while
the URB callback ttusbir_urb_complete() is still running,
ttusbir_process_ir_data() may call ir_raw_event_store_with_filter()
or ir_raw_event_handle() with a freed tt->rc->raw pointer, leading to
a NULL pointer dereference.

Call usb_kill_urb() before rc_unregister_device() to ensure all URB
callbacks complete before freeing device resources.

Fixes: 0938069fa089 ("[media] rc: Add support for the TechnoTrend USB IR Receiver")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/media/rc/ttusbir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/ttusbir.c b/drivers/media/rc/ttusbir.c
index 560a26f3965c..c1fbbc03dd29 100644
--- a/drivers/media/rc/ttusbir.c
+++ b/drivers/media/rc/ttusbir.c
@@ -363,7 +363,6 @@ static void ttusbir_disconnect(struct usb_interface *intf)
 
 	tt->udev = NULL;
 
-	rc_unregister_device(tt->rc);
 	led_classdev_unregister(&tt->led);
 	for (i = 0; i < NUM_URBS; i++) {
 		usb_kill_urb(tt->urb[i]);
@@ -372,6 +371,7 @@ static void ttusbir_disconnect(struct usb_interface *intf)
 		usb_free_urb(tt->urb[i]);
 	}
 	usb_kill_urb(tt->bulk_urb);
+	rc_unregister_device(tt->rc);
 	usb_free_urb(tt->bulk_urb);
 	usb_set_intfdata(intf, NULL);
 	kfree(tt);
-- 
2.50.1.windows.1


