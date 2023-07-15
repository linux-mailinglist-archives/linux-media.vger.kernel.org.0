Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B337D754635
	for <lists+linux-media@lfdr.de>; Sat, 15 Jul 2023 04:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbjGOCQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jul 2023 22:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbjGOCQ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jul 2023 22:16:29 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 502A930E5
        for <linux-media@vger.kernel.org>; Fri, 14 Jul 2023 19:16:28 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id D4547660702A;
        Sat, 15 Jul 2023 03:16:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689387387;
        bh=RszrG8jUPBcuWNJIYHlJZGozUTnoNFpNozNoMDAROY4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VB9KBtE7y1kK6YFZfdKfG6QEVw19eG61/nz4yzkUvVQkXSHVsGTd8guGT5YeQcQoG
         8vI8RxVWqAVlV93VUuEzsj2LrveMWFa6UMT1kOO1jUAoqsQ6lOLxr7YHuGLVolJGOy
         w0CYoSj3Emk9A4OJRFWfy+JoE421D5KZrWJuomj6j00nxgZ0FQlIFIlRZUpAKegiPO
         126bgVd/1qF0mTBTa2QKWVlzKzBGGeQfAbKRiU6Xo1n1jhlMdI0t2VmFjQvUfiHDsQ
         hQmCWVvicHMR6Q2Qcsb6dAcAFOPf4S2ikmO0tqXfwN9Bt6xu8SBJLCbSwrXw4Ud1PG
         3/6vHBAlrlekA==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, deborahbrouwer3563@gmail.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v3 03/13] media: bttv: radio use v4l2_fh instead of bttv_fh
Date:   Fri, 14 Jul 2023 19:15:59 -0700
Message-Id: <d22b5260dbf3a416130b61bc0239a30dd727986e.1689379982.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1689379982.git.deborah.brouwer@collabora.com>
References: <cover.1689379982.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
2.40.1

