Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8F8B6ED92A
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 02:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbjDYAKk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 20:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbjDYAKj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 20:10:39 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE19E4EC9
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 17:10:37 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C531E6603299;
        Tue, 25 Apr 2023 01:10:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682381436;
        bh=r4hgkp0nodhoVZ0+wiZdvnh3cyOYQBIwXUTzBnd2hio=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IRJ5+9FovK8Ex0ZSSI06WLnrvHEA5byxtyoFMa95SEpyiIUJY6od5sQGw9KqXAOO8
         vjhD2WrbQPbz28U420RyMXUXyWkxBp9oqdDnVDgEwUIbhXms4yfYn0d+iJJ+zuVNYn
         3dN1zE6gbH6KtsYDQ0WVCSlZcWH7rt/143X/7pXaAVgPutKUxBYWMQtTSLvyG3t1PM
         oIvsvBxvUL6QmEeHYeGeN7YPR9Y9ousJ9Yb3kIq0RIdYMIpWQxxi+dLwSo8LFhIX0V
         uVkadA/StLXN7XMmAIsW0uZLfLprRJ4Wy6S97yVVywhYJZkkFRYy46uv5izs/Zm0NH
         zVwCbz6da0Weg==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 03/13] media: bttv: radio use v4l2_fh instead of bttv_fh
Date:   Mon, 24 Apr 2023 17:10:02 -0700
Message-Id: <8ccb5128af7b666f552c59295e1b62321adf7973.1682379348.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1682379348.git.deborah.brouwer@collabora.com>
References: <cover.1682379348.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use a v4l2_fh when opening a radio device instead of a bttv_fh and manage
it with v4l2_fh_open() and v4l2_fh_release() and v4l2_ctrl_poll(). This
eliminates bttv_fh from the radio in preparation for vb2 conversion which
stops using separate bttv file handles altogether.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/media/pci/bt8xx/bttv-driver.c | 37 ++++++++-------------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 6e19d3d35ffb..e59f40dfccc3 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -2740,45 +2740,34 @@ static int radio_open(struct file *file)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct bttv *btv = video_drvdata(file);
-	struct bttv_fh *fh;
+	int ret = v4l2_fh_open(file);
 
-	dprintk("open dev=%s\n", video_device_node_name(vdev));
+	if (ret)
+		return ret;
 
+	dprintk("open dev=%s\n", video_device_node_name(vdev));
 	dprintk("%d: open called (radio)\n", btv->c.nr);
 
-	/* allocate per filehandle data */
-	fh = kmalloc(sizeof(*fh), GFP_KERNEL);
-	if (unlikely(!fh))
-		return -ENOMEM;
-	file->private_data = fh;
-	*fh = btv->init;
-	v4l2_fh_init(&fh->fh, vdev);
-
 	btv->radio_user++;
 	audio_mute(btv, btv->mute);
 
-	v4l2_fh_add(&fh->fh);
-
 	return 0;
 }
 
 static int radio_release(struct file *file)
 {
-	struct bttv_fh *fh = file->private_data;
 	struct bttv *btv = video_drvdata(file);
 	struct saa6588_command cmd;
 
-	file->private_data = NULL;
-	v4l2_fh_del(&fh->fh);
-	v4l2_fh_exit(&fh->fh);
-	kfree(fh);
-
 	btv->radio_user--;
 
 	bttv_call_all(btv, core, command, SAA6588_CMD_CLOSE, &cmd);
 
 	if (btv->radio_user == 0)
 		btv->has_radio_tuner = 0;
+
+	v4l2_fh_release(file);
+
 	return 0;
 }
 
@@ -2858,23 +2847,17 @@ static ssize_t radio_read(struct file *file, char __user *data,
 
 static __poll_t radio_poll(struct file *file, poll_table *wait)
 {
-	struct bttv_fh *fh = file->private_data;
 	struct bttv *btv = video_drvdata(file);
-	__poll_t req_events = poll_requested_events(wait);
 	struct saa6588_command cmd;
-	__poll_t res = 0;
+	__poll_t rc = v4l2_ctrl_poll(file, wait);
 
-	if (v4l2_event_pending(&fh->fh))
-		res = EPOLLPRI;
-	else if (req_events & EPOLLPRI)
-		poll_wait(file, &fh->fh.wait, wait);
 	radio_enable(btv);
 	cmd.instance = file;
 	cmd.event_list = wait;
-	cmd.poll_mask = res;
+	cmd.poll_mask = 0;
 	bttv_call_all(btv, core, command, SAA6588_CMD_POLL, &cmd);
 
-	return cmd.poll_mask;
+	return rc | cmd.poll_mask;
 }
 
 static const struct v4l2_file_operations radio_fops =
-- 
2.39.2

