Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3392D3170C
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 00:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbfEaWQD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 18:16:03 -0400
Received: from mga02.intel.com ([134.134.136.20]:36039 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725913AbfEaWQC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 18:16:02 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 May 2019 15:15:56 -0700
X-ExtLoop1: 1
Received: from maru.jf.intel.com ([10.54.51.75])
  by orsmga001.jf.intel.com with ESMTP; 31 May 2019 15:15:56 -0700
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v3 01/10] media: aspeed: fix a kernel warning on clk control
Date:   Fri, 31 May 2019 15:15:39 -0700
Message-Id: <20190531221548.14757-2-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190531221548.14757-1-jae.hyun.yoo@linux.intel.com>
References: <20190531221548.14757-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Video engine clock control can be double disabled and eventually
it causes a kernel warning with stack dump printing out like below:

[  515.540498] ------------[ cut here ]------------
[  515.545174] WARNING: CPU: 0 PID: 1310 at drivers/clk/clk.c:684 clk_core_unprepare+0x13c/0x170
[  515.553806] vclk-gate already unprepared
[  515.557841] CPU: 0 PID: 1310 Comm: obmc-ikvm Tainted: G        W         5.0.6-df66fbc97853fbba90a0bfa44de32f3d5f7602b4 #1
[  515.568973] Hardware name: Generic DT based system
[  515.573777] Backtrace:
[  515.576272] [<80107cdc>] (dump_backtrace) from [<80107f10>] (show_stack+0x20/0x24)
[  515.583930]  r7:803a5614 r6:00000009 r5:00000000 r4:9d88fe1c
[  515.589712] [<80107ef0>] (show_stack) from [<80690184>] (dump_stack+0x20/0x28)
[  515.597053] [<80690164>] (dump_stack) from [<80116044>] (__warn.part.3+0xb4/0xdc)
[  515.604557] [<80115f90>] (__warn.part.3) from [<801160d8>] (warn_slowpath_fmt+0x6c/0x90)
[  515.612734]  r6:000002ac r5:8080befc r4:80a07008
[  515.617463] [<80116070>] (warn_slowpath_fmt) from [<803a5614>] (clk_core_unprepare+0x13c/0x170)
[  515.626167]  r3:8080cdf4 r2:8080bfc0
[  515.629834]  r7:98d682a8 r6:9d8a9200 r5:9e5151a0 r4:97abd620
[  515.635530] [<803a54d8>] (clk_core_unprepare) from [<803a76a4>] (clk_unprepare+0x34/0x3c)
[  515.643812]  r5:9e5151a0 r4:97abd620
[  515.647529] [<803a7670>] (clk_unprepare) from [<804f36ec>] (aspeed_video_off+0x38/0x50)
[  515.655539]  r5:9e5151a0 r4:9e504000
[  515.659242] [<804f36b4>] (aspeed_video_off) from [<804f4358>] (aspeed_video_release+0x90/0x114)
[  515.668036]  r5:9e5044b0 r4:9e504000
[  515.671643] [<804f42c8>] (aspeed_video_release) from [<804d302c>] (v4l2_release+0xd4/0xe8)
[  515.679999]  r7:98d682a8 r6:9d087810 r5:9d8a9200 r4:9e504318
[  515.685695] [<804d2f58>] (v4l2_release) from [<80236454>] (__fput+0x98/0x1c4)
[  515.692914]  r5:9e51b608 r4:9d8a9200
[  515.696597] [<802363bc>] (__fput) from [<802365e8>] (____fput+0x18/0x1c)
[  515.703315]  r9:80a0700c r8:801011e4 r7:00000000 r6:80a64b9c r5:9d8e35a0 r4:9d8e38dc
[  515.711167] [<802365d0>] (____fput) from [<80131ca4>] (task_work_run+0x7c/0xa0)
[  515.718596] [<80131c28>] (task_work_run) from [<80106884>] (do_work_pending+0x4a8/0x578)
[  515.726777]  r7:801011e4 r6:80a07008 r5:9d88ffb0 r4:ffffe000
[  515.732466] [<801063dc>] (do_work_pending) from [<8010106c>] (slow_work_pending+0xc/0x20)
[  515.740727] Exception stack(0x9d88ffb0 to 0x9d88fff8)
[  515.745840] ffa0:                                     00000000 76f18094 00000000 00000000
[  515.754122] ffc0: 00000007 00176778 7eda4c20 00000006 00000000 00000000 48e20fa4 00000000
[  515.762386] ffe0: 00000002 7eda4b08 00000000 48f91efc 80000010 00000007
[  515.769097]  r10:00000000 r9:9d88e000 r8:801011e4 r7:00000006 r6:7eda4c20 r5:00176778
[  515.777006]  r4:00000007
[  515.779558] ---[ end trace 12c04aadef8afbbb ]---
[  515.784176] ------------[ cut here ]------------
[  515.788817] WARNING: CPU: 0 PID: 1310 at drivers/clk/clk.c:825 clk_core_disable+0x18c/0x204
[  515.797161] eclk-gate already disabled
[  515.800916] CPU: 0 PID: 1310 Comm: obmc-ikvm Tainted: G        W         5.0.6-df66fbc97853fbba90a0bfa44de32f3d5f7602b4 #1
[  515.811945] Hardware name: Generic DT based system
[  515.816730] Backtrace:
[  515.819210] [<80107cdc>] (dump_backtrace) from [<80107f10>] (show_stack+0x20/0x24)
[  515.826782]  r7:803a5900 r6:00000009 r5:00000000 r4:9d88fe04
[  515.832454] [<80107ef0>] (show_stack) from [<80690184>] (dump_stack+0x20/0x28)
[  515.839687] [<80690164>] (dump_stack) from [<80116044>] (__warn.part.3+0xb4/0xdc)
[  515.847170] [<80115f90>] (__warn.part.3) from [<801160d8>] (warn_slowpath_fmt+0x6c/0x90)
[  515.855247]  r6:00000339 r5:8080befc r4:80a07008
[  515.859868] [<80116070>] (warn_slowpath_fmt) from [<803a5900>] (clk_core_disable+0x18c/0x204)
[  515.868385]  r3:8080cdd0 r2:8080c00c
[  515.871957]  r7:98d682a8 r6:9d8a9200 r5:97abd560 r4:97abd560
[  515.877615] [<803a5774>] (clk_core_disable) from [<803a59a0>] (clk_core_disable_lock+0x28/0x34)
[  515.886301]  r7:98d682a8 r6:9d8a9200 r5:97abd560 r4:a0000013
[  515.891960] [<803a5978>] (clk_core_disable_lock) from [<803a7714>] (clk_disable+0x2c/0x30)
[  515.900216]  r5:9e5151a0 r4:9e515f60
[  515.903816] [<803a76e8>] (clk_disable) from [<804f36f8>] (aspeed_video_off+0x44/0x50)
[  515.911656] [<804f36b4>] (aspeed_video_off) from [<804f4358>] (aspeed_video_release+0x90/0x114)
[  515.920341]  r5:9e5044b0 r4:9e504000
[  515.923921] [<804f42c8>] (aspeed_video_release) from [<804d302c>] (v4l2_release+0xd4/0xe8)
[  515.932184]  r7:98d682a8 r6:9d087810 r5:9d8a9200 r4:9e504318
[  515.937851] [<804d2f58>] (v4l2_release) from [<80236454>] (__fput+0x98/0x1c4)
[  515.944980]  r5:9e51b608 r4:9d8a9200
[  515.948559] [<802363bc>] (__fput) from [<802365e8>] (____fput+0x18/0x1c)
[  515.955257]  r9:80a0700c r8:801011e4 r7:00000000 r6:80a64b9c r5:9d8e35a0 r4:9d8e38dc
[  515.963008] [<802365d0>] (____fput) from [<80131ca4>] (task_work_run+0x7c/0xa0)
[  515.970333] [<80131c28>] (task_work_run) from [<80106884>] (do_work_pending+0x4a8/0x578)
[  515.978421]  r7:801011e4 r6:80a07008 r5:9d88ffb0 r4:ffffe000
[  515.984086] [<801063dc>] (do_work_pending) from [<8010106c>] (slow_work_pending+0xc/0x20)
[  515.992247] Exception stack(0x9d88ffb0 to 0x9d88fff8)
[  515.997296] ffa0:                                     00000000 76f18094 00000000 00000000
[  516.005473] ffc0: 00000007 00176778 7eda4c20 00000006 00000000 00000000 48e20fa4 00000000
[  516.013642] ffe0: 00000002 7eda4b08 00000000 48f91efc 80000010 00000007
[  516.020257]  r10:00000000 r9:9d88e000 r8:801011e4 r7:00000006 r6:7eda4c20 r5:00176778
[  516.028072]  r4:00000007
[  516.030606] ---[ end trace 12c04aadef8afbbc ]---

To prevent this issue, this commit adds clock status checking
logic into the Aspeed video engine driver.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Eddie James <eajames@linux.ibm.com>
---
v2 -> v3:
 None.

v1 -> v2:
 Removed spinlock handling code. Actual fix for removing the kernel warning is
 blocking double disabling of video clocks. Refactoring of protection mechanism
 of this driver will be submitted using a seprate patch series.

 drivers/media/platform/aspeed-video.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 8144fe36ad48..562d7c0adc78 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -187,6 +187,7 @@ enum {
 	VIDEO_STREAMING,
 	VIDEO_FRAME_INPRG,
 	VIDEO_STOPPED,
+	VIDEO_CLOCKS_ON,
 };
 
 struct aspeed_video_addr {
@@ -483,19 +484,29 @@ static void aspeed_video_enable_mode_detect(struct aspeed_video *video)
 
 static void aspeed_video_off(struct aspeed_video *video)
 {
+	if (!test_bit(VIDEO_CLOCKS_ON, &video->flags))
+		return;
+
 	/* Disable interrupts */
 	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
 
 	/* Turn off the relevant clocks */
 	clk_disable_unprepare(video->vclk);
 	clk_disable_unprepare(video->eclk);
+
+	clear_bit(VIDEO_CLOCKS_ON, &video->flags);
 }
 
 static void aspeed_video_on(struct aspeed_video *video)
 {
+	if (test_bit(VIDEO_CLOCKS_ON, &video->flags))
+		return;
+
 	/* Turn on the relevant clocks */
 	clk_prepare_enable(video->eclk);
 	clk_prepare_enable(video->vclk);
+
+	set_bit(VIDEO_CLOCKS_ON, &video->flags);
 }
 
 static void aspeed_video_bufs_done(struct aspeed_video *video,
-- 
2.21.0

