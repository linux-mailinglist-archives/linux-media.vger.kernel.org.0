Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 176506F3C61
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 05:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbjEBD2B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 23:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233018AbjEBD16 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 23:27:58 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FF7358B
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 20:27:56 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C1951660321C;
        Tue,  2 May 2023 04:27:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682998075;
        bh=r4hgkp0nodhoVZ0+wiZdvnh3cyOYQBIwXUTzBnd2hio=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EdbwbuA72TzYfEzoOmG7uAOzukfv9Gb2woeUbY3YwOaXHGY8ghGr18Tl+xpY7YkhA
         IffMgL2Nl0xXlvCoVPXfb+awuisezHSwygR+bOQMuVvyLQCbub0WcWCY/YwlP+JWhO
         mcgjgrGt/KcNet5ozYGGb3jYzcFV+ob06aGg9L2Vni3C0FraeEVI9Wub0GSMMgNt/m
         eYduQo+kICNWct92aj0VwLmRlNc30W0/vE/Juqd4VIBRSzMusTNBQ6ijtKTZOfZs38
         FcxP3mM5qQQEwFhmCam3No/b5Y/8MHZQLxWa/ChiHg20sQ2grgQ9TfgZwtBIAhkvE8
         b7m7jiVRdfl1g==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 03/13] media: bttv: radio use v4l2_fh instead of bttv_fh
Date:   Mon,  1 May 2023 20:27:21 -0700
Message-Id: <ba92ec4591e41a2dc24ad86543ee94e557b4babb.1682995256.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1682995256.git.deborah.brouwer@collabora.com>
References: <cover.1682995256.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

