Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6547D401A3C
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 12:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233903AbhIFK6A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 06:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234693AbhIFK56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Sep 2021 06:57:58 -0400
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D5C4C061575
        for <linux-media@vger.kernel.org>; Mon,  6 Sep 2021 03:56:53 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id NCJ1m6ssDlQKhNCJ2mQybZ; Mon, 06 Sep 2021 12:56:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630925812; bh=0YCCi/LhZhIGJ4aNvDp33hcGBLLGbMeG3anfCXg1iao=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=j1R5rJdGVB6JavmTtpk4VDQlg9NbKpEVVKRMyGXhk9GeI3j+NnZ1ZscLhY+nThFpP
         doyKLEpKRTuN1YkrlSfMQZLTsL3i5/4WtIYsSw8dJmdn6ObnFr4wz4ECxDW5ewvMO/
         kWrGKz/8EnPMq00dcRrNPQm1EJeUJ8DP6rwhXvyp+wf6l4qlfgW1nuwuFUr7F5/8MJ
         5Z08WjArO45Z8eeHSyBZhOMgx7N8D+v4/bUMN8SB/+Kx5sKsUvcCAzLO9j2UX3CIaz
         z8sIaF1L8sCe0nAjmByZcB8ept+ngovgfGqspJu+16uGJLO5yt6VS4MTe+cbqhvIUR
         RpLche6ticycQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] zoran: fix various V4L2 compliance errors
Cc:     Corentin Labbe <clabbe@baylibre.com>
Message-ID: <292249db-a952-4142-48e3-dbfc61413601@xs4all.nl>
Date:   Mon, 6 Sep 2021 12:56:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCBA+AxaKqlSrQBn7OK+naPiZdp1LxajgxW3uUT4e8pG/+NyfKA+Ypfdu0t7UL884jnOTno0YdVAm1xXRIFJmHNvTBT6ANIiTGP0FZ8rq4+LbRXkWbxD
 ixcIzNLy6tGzz5ENfi8di9lTFsLwSQRf8U5O7r3r56HYOOQkxTJsD40j0LLn1eE6/V47+owrCMiJ6ZnEIKenVVSACotvV2YJHoVJDGBA7hnwcGcw1/UVSdm9
 MB0Mz3o/lOaDHFL8Mku2FCAqlXiHV2QJTOBc7gKbba7++vV0n1yTbXpRGlWh0pmduLFSis5EqXChD5I53lni9ULTDFqFCtaar6S7mvO5tOo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This fixes several issues found with 'v4l2-compliance -s':

1) read()/write() is supported, but not reported in the capabilities
2) S_STD(G_STD()) failed: setting the same standard should just return 0.
3) G_PARM failed to set readbuffers.
4) different field values in the format vs. what v4l2_buffer reported.
5) zero the sequence number when starting streaming.
6) drop VB_USERPTR: makes no sense with dma_contig streaming.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Note: this patch sits on top of https://patchwork.linuxtv.org/project/linux-media/list/?series=6268
---
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 0b3afd8a702e..a2dc7df72ea5 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -836,7 +836,7 @@ static int zoran_init_video_device(struct zoran *zr, struct video_device *video_
 	*video_dev = zoran_template;
 	video_dev->v4l2_dev = &zr->v4l2_dev;
 	video_dev->lock = &zr->lock;
-	video_dev->device_caps = V4L2_CAP_STREAMING | dir;
+	video_dev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_READWRITE | dir;

 	strscpy(video_dev->name, ZR_DEVNAME(zr), sizeof(video_dev->name));
 	/*
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 551db338c7f7..84665637ebb7 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -255,8 +255,6 @@ static int zoran_querycap(struct file *file, void *__fh, struct v4l2_capability
 	strscpy(cap->card, ZR_DEVNAME(zr), sizeof(cap->card));
 	strscpy(cap->driver, "zoran", sizeof(cap->driver));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s", pci_name(zr->pci_dev));
-	cap->device_caps = zr->video_dev->device_caps;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }

@@ -582,6 +580,9 @@ static int zoran_s_std(struct file *file, void *__fh, v4l2_std_id std)
 	struct zoran *zr = video_drvdata(file);
 	int res = 0;

+	if (zr->norm == std)
+		return 0;
+
 	if (zr->running != ZORAN_MAP_MODE_NONE)
 		return -EBUSY;

@@ -739,6 +740,7 @@ static int zoran_g_parm(struct file *file, void *priv, struct v4l2_streamparm *p
 	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;

+	parm->parm.capture.readbuffers = 9;
 	return 0;
 }

@@ -869,6 +871,10 @@ int zr_set_buf(struct zoran *zr)
 		vbuf = &buf->vbuf;

 		buf->vbuf.field = V4L2_FIELD_INTERLACED;
+		if (BUZ_MAX_HEIGHT < (zr->v4l_settings.height * 2))
+			buf->vbuf.field = V4L2_FIELD_INTERLACED;
+		else
+			buf->vbuf.field = V4L2_FIELD_TOP;
 		vb2_set_plane_payload(&buf->vbuf.vb2_buf, 0, zr->buffer_size);
 		vb2_buffer_done(&buf->vbuf.vb2_buf, VB2_BUF_STATE_DONE);
 		zr->inuse[0] = NULL;
@@ -928,6 +934,7 @@ static int zr_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 		zr->stat_com[j] = cpu_to_le32(1);
 		zr->inuse[j] = NULL;
 	}
+	zr->vbseq = 0;

 	if (zr->map_mode != ZORAN_MAP_MODE_RAW) {
 		pci_info(zr->pci_dev, "START JPG\n");
@@ -1018,7 +1025,7 @@ int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq, int dir)
 	vq->dev = &zr->pci_dev->dev;
 	vq->type = dir;

-	vq->io_modes = VB2_USERPTR | VB2_DMABUF | VB2_MMAP | VB2_READ | VB2_WRITE;
+	vq->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ | VB2_WRITE;
 	vq->drv_priv = zr;
 	vq->buf_struct_size = sizeof(struct zr_buffer);
 	vq->ops = &zr_video_qops;
