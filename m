Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC864EC0F5
	for <lists+linux-media@lfdr.de>; Wed, 30 Mar 2022 13:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344314AbiC3Lzt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Mar 2022 07:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345937AbiC3LzO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Mar 2022 07:55:14 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FFBE5F88;
        Wed, 30 Mar 2022 04:53:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BCE6DB81C24;
        Wed, 30 Mar 2022 11:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92477C36AE2;
        Wed, 30 Mar 2022 11:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648641177;
        bh=XAQV1CrcJedav+QuupEKT9ZmY5ttZesEv0weh8dfhjM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XzHlh2HZ6PZsutitvUc9zOHUz34Q0e4aKSoYFacujwWPChhKosrwsT3/xwdVi/bHn
         1aiwVqIpP5nN3xwUTkQZLPxX5RnuSKpMb7Y+YE5ItQJOQ8a7NjqYhSwy67s5IrA6Rt
         HYOVEKNTpgzv0CiLcJQvZcRRph043siiVE3EjRwNrYc7F3SeHTPD+8mSn07zWZDTot
         /GJi3lQvCeG7oaafOXLDOGksEIkRcvnOWFEWlzkomf3Yl4ZSErK1XrSgeoi9sQdAnr
         EF8ByOKbCrts7X2xw9VRpBjpvttf0wPnekjHf0cfUs+OsaQHBI9PtmQmQW+I1nl6pS
         kLpRDtam9x6XQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        syzkaller <syzkaller@googlegroups.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sasha Levin <sashal@kernel.org>, hverkuil@xs4all.nl,
        linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 21/25] media: hdpvr: initialize dev->worker at hdpvr_register_videodev
Date:   Wed, 30 Mar 2022 07:52:21 -0400
Message-Id: <20220330115225.1672278-21-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330115225.1672278-1-sashal@kernel.org>
References: <20220330115225.1672278-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dongliang Mu <mudongliangabcd@gmail.com>

[ Upstream commit 07922937e9a580825f9965c46fd15e23ba5754b6 ]

hdpvr_register_videodev is responsible to initialize a worker in
hdpvr_device. However, the worker is only initialized at
hdpvr_start_streaming other than hdpvr_register_videodev.
When hdpvr_probe does not initialize its worker, the hdpvr_disconnect
will encounter one WARN in flush_work.The stack trace is as follows:

 hdpvr_disconnect+0xb8/0xf2 drivers/media/usb/hdpvr/hdpvr-core.c:425
 usb_unbind_interface+0xbf/0x3a0 drivers/usb/core/driver.c:458
 __device_release_driver drivers/base/dd.c:1206 [inline]
 device_release_driver_internal+0x22a/0x230 drivers/base/dd.c:1237
 bus_remove_device+0x108/0x160 drivers/base/bus.c:529
 device_del+0x1fe/0x510 drivers/base/core.c:3592
 usb_disable_device+0xd1/0x1d0 drivers/usb/core/message.c:1419
 usb_disconnect+0x109/0x330 drivers/usb/core/hub.c:2228

Fix this by moving the initialization of dev->worker to the starting of
hdpvr_register_videodev

Reported-by: syzkaller <syzkaller@googlegroups.com>
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/hdpvr/hdpvr-video.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index bad71d863d39..7849f1fbbcc4 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -308,7 +308,6 @@ static int hdpvr_start_streaming(struct hdpvr_device *dev)
 
 	dev->status = STATUS_STREAMING;
 
-	INIT_WORK(&dev->worker, hdpvr_transmit_buffers);
 	schedule_work(&dev->worker);
 
 	v4l2_dbg(MSG_BUFFER, hdpvr_debug, &dev->v4l2_dev,
@@ -1165,6 +1164,9 @@ int hdpvr_register_videodev(struct hdpvr_device *dev, struct device *parent,
 	bool ac3 = dev->flags & HDPVR_FLAG_AC3_CAP;
 	int res;
 
+	// initialize dev->worker
+	INIT_WORK(&dev->worker, hdpvr_transmit_buffers);
+
 	dev->cur_std = V4L2_STD_525_60;
 	dev->width = 720;
 	dev->height = 480;
-- 
2.34.1

