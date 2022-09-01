Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 829B25A937F
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 11:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbiIAJrH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 05:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbiIAJrF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 05:47:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A57124854
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 02:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662025623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uyYieMx/izLamNgNYSTPTqBZv9qZWaCYD8ZyROzswHg=;
        b=XGUsEX9UgJQZtdbeIlTgoxF/wE9madmEgpJVS6HIYf7VZ8M6rhXfKFVsSGsofJdN5UdvP9
        f5k8VT7FEXUXl9C32D3lCTBH4vtFfy3FAe0bbLEbtryPEP6mwFz7bb9ZS7Pri6bLqP0fbf
        shGukfV1xSIBOwAvHu7d/MLAMuMXggY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-SQLlG4PpP8e_3-1WD34PDg-1; Thu, 01 Sep 2022 05:46:59 -0400
X-MC-Unique: SQLlG4PpP8e_3-1WD34PDg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 005541818362;
        Thu,  1 Sep 2022 09:46:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7EC7D40334C;
        Thu,  1 Sep 2022 09:46:42 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 04/14] media: atomisp: Remove the outq videobuf queue
Date:   Thu,  1 Sep 2022 11:46:16 +0200
Message-Id: <20220901094626.11513-5-hdegoede@redhat.com>
In-Reply-To: <20220901094626.11513-1-hdegoede@redhat.com>
References: <20220901094626.11513-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After the file-injection support removal the outq videobuf queue is
no longer used, remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_fops.c  | 62 -------------------
 .../media/atomisp/pci/atomisp_subdev.c        |  1 -
 .../media/atomisp/pci/atomisp_subdev.h        |  9 ++-
 3 files changed, 4 insertions(+), 68 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 08b62fc65c76..d6a7198a957c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -593,47 +593,6 @@ static void atomisp_buf_release(struct videobuf_queue *vq,
 	atomisp_videobuf_free_buf(vb);
 }
 
-static int atomisp_buf_setup_output(struct videobuf_queue *vq,
-				    unsigned int *count, unsigned int *size)
-{
-	struct atomisp_video_pipe *pipe = vq->priv_data;
-
-	*size = pipe->pix.sizeimage;
-
-	return 0;
-}
-
-static int atomisp_buf_prepare_output(struct videobuf_queue *vq,
-				      struct videobuf_buffer *vb,
-				      enum v4l2_field field)
-{
-	struct atomisp_video_pipe *pipe = vq->priv_data;
-
-	vb->size = pipe->pix.sizeimage;
-	vb->width = pipe->pix.width;
-	vb->height = pipe->pix.height;
-	vb->field = field;
-	vb->state = VIDEOBUF_PREPARED;
-
-	return 0;
-}
-
-static void atomisp_buf_queue_output(struct videobuf_queue *vq,
-				     struct videobuf_buffer *vb)
-{
-	struct atomisp_video_pipe *pipe = vq->priv_data;
-
-	list_add_tail(&vb->queue, &pipe->activeq_out);
-	vb->state = VIDEOBUF_QUEUED;
-}
-
-static void atomisp_buf_release_output(struct videobuf_queue *vq,
-				       struct videobuf_buffer *vb)
-{
-	videobuf_vmalloc_free(vb);
-	vb->state = VIDEOBUF_NEEDS_INIT;
-}
-
 static const struct videobuf_queue_ops videobuf_qops = {
 	.buf_setup	= atomisp_buf_setup,
 	.buf_prepare	= atomisp_buf_prepare,
@@ -641,13 +600,6 @@ static const struct videobuf_queue_ops videobuf_qops = {
 	.buf_release	= atomisp_buf_release,
 };
 
-static const struct videobuf_queue_ops videobuf_qops_output = {
-	.buf_setup	= atomisp_buf_setup_output,
-	.buf_prepare	= atomisp_buf_prepare_output,
-	.buf_queue	= atomisp_buf_queue_output,
-	.buf_release	= atomisp_buf_release_output,
-};
-
 static int atomisp_init_pipe(struct atomisp_video_pipe *pipe)
 {
 	/* init locks */
@@ -660,15 +612,7 @@ static int atomisp_init_pipe(struct atomisp_video_pipe *pipe)
 				    sizeof(struct atomisp_buffer), pipe,
 				    NULL);	/* ext_lock: NULL */
 
-	videobuf_queue_vmalloc_init(&pipe->outq, &videobuf_qops_output, NULL,
-				    &pipe->irq_lock,
-				    V4L2_BUF_TYPE_VIDEO_OUTPUT,
-				    V4L2_FIELD_NONE,
-				    sizeof(struct atomisp_buffer), pipe,
-				    NULL);	/* ext_lock: NULL */
-
 	INIT_LIST_HEAD(&pipe->activeq);
-	INIT_LIST_HEAD(&pipe->activeq_out);
 	INIT_LIST_HEAD(&pipe->buffers_waiting_for_param);
 	INIT_LIST_HEAD(&pipe->per_frame_params);
 	memset(pipe->frame_request_config_id, 0,
@@ -964,12 +908,6 @@ static int atomisp_release(struct file *file)
 		goto done;
 	}
 
-	if (pipe->outq.bufs[0]) {
-		mutex_lock(&pipe->outq.vb_lock);
-		videobuf_queue_cancel(&pipe->outq);
-		mutex_unlock(&pipe->outq.vb_lock);
-	}
-
 	/*
 	 * A little trick here:
 	 * file injection input resolution is recorded in the sink pad,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 1509543924d2..e05aeb0ca86b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -1066,7 +1066,6 @@ static void atomisp_init_subdev_pipe(struct atomisp_sub_device *asd,
 	pipe->isp = asd->isp;
 	spin_lock_init(&pipe->irq_lock);
 	INIT_LIST_HEAD(&pipe->activeq);
-	INIT_LIST_HEAD(&pipe->activeq_out);
 	INIT_LIST_HEAD(&pipe->buffers_waiting_for_param);
 	INIT_LIST_HEAD(&pipe->per_frame_params);
 	memset(pipe->frame_request_config_id,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index 938d427bede8..d89ae3274180 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -70,9 +70,7 @@ struct atomisp_video_pipe {
 	enum v4l2_buf_type type;
 	struct media_pad pad;
 	struct videobuf_queue capq;
-	struct videobuf_queue outq;
 	struct list_head activeq;
-	struct list_head activeq_out;
 	/*
 	 * the buffers waiting for per-frame parameters, this is only valid
 	 * in per-frame setting mode.
@@ -86,9 +84,10 @@ struct atomisp_video_pipe {
 
 	unsigned int buffers_in_css;
 
-	/* irq_lock is used to protect video buffer state change operations and
-	 * also to make activeq, activeq_out, capq and outq list
-	 * operations atomic. */
+	/*
+	 * irq_lock is used to protect video buffer state change operations and
+	 * also to make activeq and capq operations atomic.
+	 */
 	spinlock_t irq_lock;
 	unsigned int users;
 
-- 
2.37.2

