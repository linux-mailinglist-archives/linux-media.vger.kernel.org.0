Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C0C454DEF
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 20:34:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240516AbhKQThO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 14:37:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:45406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236117AbhKQThJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 14:37:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A317461B30;
        Wed, 17 Nov 2021 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637177650;
        bh=sj2B2huQwh59FpOjf6V0Y3pZFT+H8BQMKj48jrEM3yQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BIBDz4SFD1hSPtPnvBlFQw/7rDY7MQUud0V7eBYcF4Pm1t3rNmLcjLT5cALd9gJUS
         f+K89NZ+LVk4E5ssd2vkDPeFIsBYJTy8cmcwuDnI/vqtt4OJl+EdQfXbWtB4BJmKcd
         ZeZiwblZandJAyDS8ssAUs5NF45zQjYcrZznQUa3j+5qe2rixG7CwSILzb0DokIWBh
         /DkvR4WtYFDx3va+FYmTowfb3YRV0g1rqW8xWgHI61Gtgn6zphFIHvvXCWTJTG0Cw4
         Q5zrhSpvFMoDFNhP7G0eExpWNIiFXDdUU5fixVifCXS0LOrAY/Zn6vrJH2SG/V0U87
         70dKHXPQQ1SJg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnQh6-00DXHx-5R; Wed, 17 Nov 2021 19:34:08 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 8/8] media: atomisp: cleanup qbuf logic
Date:   Wed, 17 Nov 2021 19:34:06 +0000
Message-Id: <198e1aae6e4e5d9970f0e5c885cb627ea144d515.1637177402.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637177402.git.mchehab+huawei@kernel.org>
References: <cover.1637177402.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The logic there is meant to be used by newer firmwares.
clean it up, in order to make compatible with the chosen
firmware version.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/8] at: https://lore.kernel.org/all/cover.1637177402.git.mchehab+huawei@kernel.org/

 .../staging/media/atomisp/pci/atomisp_ioctl.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index b2d3b8349234..562789c75299 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1457,25 +1457,8 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	    pipe->capq.streaming &&
 	    !asd->enable_raw_buffer_lock->val &&
 	    asd->params.offline_parm.num_captures == 1) {
-		if (!IS_ISP2401) {
 			asd->pending_capture_request++;
 			dev_dbg(isp->dev, "Add one pending capture request.\n");
-		} else {
-			if (asd->re_trigger_capture) {
-				ret = atomisp_css_offline_capture_configure(asd,
-					asd->params.offline_parm.num_captures,
-					asd->params.offline_parm.skip_frames,
-					asd->params.offline_parm.offset);
-				asd->re_trigger_capture = false;
-				dev_dbg(isp->dev, "%s Trigger capture again ret=%d\n",
-					__func__, ret);
-
-			} else {
-				asd->pending_capture_request++;
-				asd->re_trigger_capture = false;
-				dev_dbg(isp->dev, "Add one pending capture request.\n");
-			}
-		}
 	}
 	rt_mutex_unlock(&isp->mutex);
 
@@ -1868,8 +1851,6 @@ static int atomisp_streamon(struct file *file, void *fh,
 
 	/* Reset pending capture request count. */
 	asd->pending_capture_request = 0;
-	if (IS_ISP2401)
-		asd->re_trigger_capture = false;
 
 	if ((atomisp_subdev_streaming_count(asd) > sensor_start_stream) &&
 	    (!isp->inputs[asd->input_curr].camera_caps->multi_stream_ctrl)) {
-- 
2.33.1

