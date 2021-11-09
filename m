Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568BC44A53B
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 04:13:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234897AbhKIDQF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 22:16:05 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:48563 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbhKIDQE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 22:16:04 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1A92nC39061473;
        Tue, 9 Nov 2021 10:49:12 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 9 Nov
 2021 11:12:27 +0800
From:   Jammy Huang <jammy_huang@aspeedtech.com>
To:     <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
CC:     Paul Menzel <pmenzel@molgen.mpg.de>
Subject: [PATCH v2] media: aspeed: Update signal status immediately to ensure sane hw state
Date:   Tue, 9 Nov 2021 11:12:27 +0800
Message-ID: <20211109031227.1792-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1A92nC39061473
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If res-chg, VE_INTERRUPT_MODE_DETECT_WD irq will be raised. But
v4l2_input_status won't be updated to no-signal immediately until
aspeed_video_get_resolution() in aspeed_video_resolution_work().

During the period of time, aspeed_video_start_frame() could be called
because it doesn't know signal becomes unstable now. If it goes with
aspeed_video_init_regs() of aspeed_video_irq_res_change()
simultaneously, it will mess up hw state.

To fix this problem, v4l2_input_status is updated to no-signal
immediately for VE_INTERRUPT_MODE_DETECT_WD irq.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
v2:
  - update subject and commit message
---
 drivers/media/platform/aspeed-video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 1ade264a8b69..3facd7ecc1a1 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -762,6 +762,8 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
 	set_bit(VIDEO_RES_CHANGE, &video->flags);
 	clear_bit(VIDEO_FRAME_INPRG, &video->flags);
 
+	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
+
 	aspeed_video_off(video);
 	aspeed_video_on(video);
 	aspeed_video_bufs_done(video, VB2_BUF_STATE_ERROR);
@@ -1889,7 +1891,6 @@ static void aspeed_video_resolution_work(struct work_struct *work)
 	struct delayed_work *dwork = to_delayed_work(work);
 	struct aspeed_video *video = container_of(dwork, struct aspeed_video,
 						  res_work);
-	u32 input_status = video->v4l2_input_status;
 
 	/* Exit early in case no clients remain */
 	if (test_bit(VIDEO_STOPPED, &video->flags))
@@ -1902,8 +1903,7 @@ static void aspeed_video_resolution_work(struct work_struct *work)
 	aspeed_video_get_resolution(video);
 
 	if (video->detected_timings.width != video->active_timings.width ||
-	    video->detected_timings.height != video->active_timings.height ||
-	    input_status != video->v4l2_input_status) {
+	    video->detected_timings.height != video->active_timings.height) {
 		static const struct v4l2_event ev = {
 			.type = V4L2_EVENT_SOURCE_CHANGE,
 			.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
-- 
2.25.1

