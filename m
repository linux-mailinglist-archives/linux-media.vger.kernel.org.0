Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB125904D9
	for <lists+linux-media@lfdr.de>; Thu, 11 Aug 2022 18:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236159AbiHKQhR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Aug 2022 12:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238916AbiHKQd5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Aug 2022 12:33:57 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F899BC134;
        Thu, 11 Aug 2022 09:11:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 884F8CE22A8;
        Thu, 11 Aug 2022 16:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2525EC433C1;
        Thu, 11 Aug 2022 16:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660234266;
        bh=Xpr/rnGQQaHG9dOD8BYDruHGXokuH1u2GU461YavMCo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u1QxK7KXv4lQanwmw+cXa5pa1TJ3XWcsOl3JqWQjYxl2n7ZI+Dr1h/YTMi6m1cTzN
         eeGcsnpsNMCrGmtxHUbz5gKDnviI9jFFrK7HQS/QQUMnGqJiQF4zAQmqFCRebr53X2
         TmuW0el1fOMYZtnT9kg33CtqbaUdcjDDUjiSS0HYftc6oem5vs+s+ibdn/8dwy70W0
         zc9hutBq2VxJzB87ODom1Nx1rxIEeMLRoV/IKsVQQKYWjPJvgQEVso33l17V0NmD6w
         e4BWMQSnWKaIKyjDir2WjVlA31qG8S+zqCr+25Aji6GcwlkZRLxZF2WN2WrdbFirt8
         Y7nPoY8IsjHKA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sasha Levin <sashal@kernel.org>, crope@iki.fi,
        linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 05/14] media: airspy: respect the DMA coherency rules
Date:   Thu, 11 Aug 2022 12:10:34 -0400
Message-Id: <20220811161050.1543183-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811161050.1543183-1-sashal@kernel.org>
References: <20220811161050.1543183-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Oliver Neukum <oneukum@suse.com>

[ Upstream commit ca9dc8d06ab64543a6a31adac5003349c5671218 ]

If we want to avoid memory corruption
on incoherent architectures, buffers for DMA
must not reside
- on the stack
- embedded within other structures

Allocate them separately.

v2: fix uninitialized return value

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/airspy/airspy.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index e70c9e2f3798..681753934948 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -134,7 +134,7 @@ struct airspy {
 
 	/* USB control message buffer */
 	#define BUF_SIZE 128
-	u8 buf[BUF_SIZE];
+	u8 *buf;
 
 	/* Current configuration */
 	unsigned int f_adc;
@@ -872,6 +872,7 @@ static void airspy_video_release(struct v4l2_device *v)
 
 	v4l2_ctrl_handler_free(&s->hdl);
 	v4l2_device_unregister(&s->v4l2_dev);
+	kfree(s->buf);
 	kfree(s);
 }
 
@@ -979,7 +980,10 @@ static int airspy_probe(struct usb_interface *intf,
 {
 	struct airspy *s;
 	int ret;
-	u8 u8tmp, buf[BUF_SIZE];
+	u8 u8tmp, *buf;
+
+	buf = NULL;
+	ret = -ENOMEM;
 
 	s = kzalloc(sizeof(struct airspy), GFP_KERNEL);
 	if (s == NULL) {
@@ -987,6 +991,13 @@ static int airspy_probe(struct usb_interface *intf,
 		return -ENOMEM;
 	}
 
+	s->buf = kzalloc(BUF_SIZE, GFP_KERNEL);
+	if (!s->buf)
+		goto err_free_mem;
+	buf = kzalloc(BUF_SIZE, GFP_KERNEL);
+	if (!buf)
+		goto err_free_mem;
+
 	mutex_init(&s->v4l2_lock);
 	mutex_init(&s->vb_queue_lock);
 	spin_lock_init(&s->queued_bufs_lock);
@@ -1082,6 +1093,8 @@ static int airspy_probe(struct usb_interface *intf,
 	v4l2_ctrl_handler_free(&s->hdl);
 	v4l2_device_unregister(&s->v4l2_dev);
 err_free_mem:
+	kfree(buf);
+	kfree(s->buf);
 	kfree(s);
 	return ret;
 }
-- 
2.35.1

