Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFDCAD5980
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 04:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729626AbfJNCSX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Oct 2019 22:18:23 -0400
Received: from shells.gnugeneration.com ([66.240.222.126]:48306 "EHLO
        shells.gnugeneration.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729474AbfJNCSX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Oct 2019 22:18:23 -0400
X-Greylist: delayed 578 seconds by postgrey-1.27 at vger.kernel.org; Sun, 13 Oct 2019 22:18:23 EDT
Received: by shells.gnugeneration.com (Postfix, from userid 1000)
        id 991AA1A40559; Sun, 13 Oct 2019 19:08:45 -0700 (PDT)
Date:   Sun, 13 Oct 2019 19:08:45 -0700
From:   Vito Caputo <vcaputo@pengaru.com>
To:     mkrufky@linuxtv.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: cxusb: detect cxusb_ctrl_msg error in query
Message-ID: <20191014020845.247utwi3pjbvb6il@shells.gnugeneration.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Don't use uninitialized ircode[] in cxusb_rc_query() when
cxusb_ctrl_msg() fails to populate its contents.

syzbot reported:

dvb-usb: bulk message failed: -22 (1/-30591)
=====================================================
BUG: KMSAN: uninit-value in ir_lookup_by_scancode drivers/media/rc/rc-main.c:494 [inline]
BUG: KMSAN: uninit-value in rc_g_keycode_from_table drivers/media/rc/rc-main.c:582 [inline]
BUG: KMSAN: uninit-value in rc_keydown+0x1a6/0x6f0 drivers/media/rc/rc-main.c:816
CPU: 1 PID: 11436 Comm: kworker/1:2 Not tainted 5.3.0-rc7+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events dvb_usb_read_remote_control
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x191/0x1f0 lib/dump_stack.c:113
 kmsan_report+0x13a/0x2b0 mm/kmsan/kmsan_report.c:108
 __msan_warning+0x73/0xe0 mm/kmsan/kmsan_instr.c:250
 bsearch+0x1dd/0x250 lib/bsearch.c:41
 ir_lookup_by_scancode drivers/media/rc/rc-main.c:494 [inline]
 rc_g_keycode_from_table drivers/media/rc/rc-main.c:582 [inline]
 rc_keydown+0x1a6/0x6f0 drivers/media/rc/rc-main.c:816
 cxusb_rc_query+0x2e1/0x360 drivers/media/usb/dvb-usb/cxusb.c:548
 dvb_usb_read_remote_control+0xf9/0x290 drivers/media/usb/dvb-usb/dvb-usb-remote.c:261
 process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
 worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
 kthread+0x4b5/0x4f0 kernel/kthread.c:256
 ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355

Uninit was stored to memory at:
 kmsan_save_stack_with_flags mm/kmsan/kmsan.c:150 [inline]
 kmsan_internal_chain_origin+0xd2/0x170 mm/kmsan/kmsan.c:314
 __msan_chain_origin+0x6b/0xe0 mm/kmsan/kmsan_instr.c:184
 rc_g_keycode_from_table drivers/media/rc/rc-main.c:583 [inline]
 rc_keydown+0x2c4/0x6f0 drivers/media/rc/rc-main.c:816
 cxusb_rc_query+0x2e1/0x360 drivers/media/usb/dvb-usb/cxusb.c:548
 dvb_usb_read_remote_control+0xf9/0x290 drivers/media/usb/dvb-usb/dvb-usb-remote.c:261
 process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
 worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
 kthread+0x4b5/0x4f0 kernel/kthread.c:256
 ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355

Local variable description: ----ircode@cxusb_rc_query
Variable was created at:
 cxusb_rc_query+0x4d/0x360 drivers/media/usb/dvb-usb/cxusb.c:543
 dvb_usb_read_remote_control+0xf9/0x290 drivers/media/usb/dvb-usb/dvb-usb-remote.c:261

Signed-off-by: Vito Caputo <vcaputo@pengaru.com>
Reported-by: syzbot <syzkaller@googlegroups.com>
---
 drivers/media/usb/dvb-usb/cxusb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
index f02fa0a67aa4..fac19ec46089 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -521,7 +521,8 @@ static int cxusb_rc_query(struct dvb_usb_device *d)
 {
 	u8 ircode[4];
 
-	cxusb_ctrl_msg(d, CMD_GET_IR_CODE, NULL, 0, ircode, 4);
+	if (cxusb_ctrl_msg(d, CMD_GET_IR_CODE, NULL, 0, ircode, 4) < 0)
+		return 0;
 
 	if (ircode[2] || ircode[3])
 		rc_keydown(d->rc_dev, RC_PROTO_NEC,
-- 
2.11.0

