Return-Path: <linux-media+bounces-47061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C1DC5C2F0
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 10:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A08A935A6F5
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 09:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87AAB2F90D5;
	Fri, 14 Nov 2025 09:07:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBD32F8BD9;
	Fri, 14 Nov 2025 09:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763111229; cv=none; b=H6QrY24Al3bqPaUvP7idBqMSpv0s4CVAlF+EqYNEDfF3naweF9SeuXkIHV7ZLp/SkDayCjM7R8zRQp+SW4GUp6mM64lNWzHMbQpWUa+PQqK+k/tERxui/ueOZPoqHMgvKQgzy+IfFcywj8RczRELSXNhUQpC3ortjdjkJGDuz7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763111229; c=relaxed/simple;
	bh=y5Oz49HXCPeN088wok1wEjCbHkMK8fhv2EdKI1NjSho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RrROYl/dKm+eAOh0zWSxnTxA9rbwYvjRSEm5Del4KdtFDaXvucwdg42E7f2XqDIBRKGRGiyr0nIhO1jT1MR9CYRmDq831BNDfB5rR0d8Sj0SDotaNw1j8irGlRhqst5MTGyD3pAet3sd6w463Rp62a7s0EFxrCPw3dNO54hUFoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowAA3zs0t8RZpnXy1AA--.9127S2;
	Fri, 14 Nov 2025 17:06:53 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: sean@mess.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] media: iguanair: fix race between device disconnection and urb callback
Date: Fri, 14 Nov 2025 17:06:05 +0800
Message-ID: <20251114090605.2413-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAA3zs0t8RZpnXy1AA--.9127S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uryUtF1xuw15AF4rZr1rtFb_yoW8Xr1fpF
	WxWryayrWUWr4UA3yDtF1kGa4Yqws3GayUCFyrW34F9ws5Casrta4kAa45Xwn8CFy5Ga4q
	yw1YqayfuFyUCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUUhL05UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAgGA2kWr+LoFAAAsP

The iguanair_disconnect() function calls rc_unregister_device() before
usb_kill_urb(), creating a race condition similar to the one fixed in
commit 'f656cfbc7a29'. If rc_unregister_device() executes while
the URB callback iguanair_rx() is still running, process_ir_data() may call
ir_raw_event_store_with_filter() or ir_raw_event_overflow() with a freed
ir->rc->raw pointer, leading to a NULL pointer dereference.

Call usb_kill_urb() before rc_unregister_device() to ensure all URB
callbacks complete before freeing device resources.

Fixes: 7c0bd96b767d ("[media] iguanair: support suspend and resume")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/media/rc/iguanair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/iguanair.c b/drivers/media/rc/iguanair.c
index 8af94246e591..70105250d88d 100644
--- a/drivers/media/rc/iguanair.c
+++ b/drivers/media/rc/iguanair.c
@@ -496,10 +496,10 @@ static void iguanair_disconnect(struct usb_interface *intf)
 {
 	struct iguanair *ir = usb_get_intfdata(intf);
 
-	rc_unregister_device(ir->rc);
 	usb_set_intfdata(intf, NULL);
 	usb_kill_urb(ir->urb_in);
 	usb_kill_urb(ir->urb_out);
+	rc_unregister_device(ir->rc);
 	usb_free_urb(ir->urb_in);
 	usb_free_urb(ir->urb_out);
 	usb_free_coherent(ir->udev, MAX_IN_PACKET, ir->buf_in, ir->dma_in);
-- 
2.50.1.windows.1


