Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F267269E2E2
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 16:00:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234572AbjBUPAa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 10:00:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234532AbjBUPA1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 10:00:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE9E9EEF
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 06:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676991577;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eXWh2URWSGercEdDDjtwVJhq6pSscqutL7bNofFyaOk=;
        b=W44ZxkwllG5Lowm+Fugu6+85hcV1atuzIgFk9M49sXDjqoq07G3hySz4Zm5FE7ASWBWxXp
        an7I2ua+ZM5nORSppN+IWMVjKkxNSZVDrVaesCEkxwWmceQHbUxJwvPE1UKVlvo9dzRrYq
        JwY4OO79JX6FCFgLV5CowW5m3RuxBb0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-vY3xSvMWMeuFu2oWrVbWOQ-1; Tue, 21 Feb 2023 09:59:28 -0500
X-MC-Unique: vY3xSvMWMeuFu2oWrVbWOQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1123118E0920;
        Tue, 21 Feb 2023 14:59:28 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.177])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 01E4A2026D4B;
        Tue, 21 Feb 2023 14:59:24 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 03/10] media: atomisp: Remove delayed_init related code
Date:   Tue, 21 Feb 2023 15:58:59 +0100
Message-Id: <20230221145906.8113-4-hdegoede@redhat.com>
In-Reply-To: <20230221145906.8113-1-hdegoede@redhat.com>
References: <20230221145906.8113-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After the continues-mode removal the delayed-work never gets queues
remove all the related code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/include/linux/atomisp.h     |  1 -
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 35 -------------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  1 -
 .../staging/media/atomisp/pci/atomisp_fops.c  |  1 -
 .../media/atomisp/pci/atomisp_internal.h      |  4 ---
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  7 ----
 .../media/atomisp/pci/atomisp_subdev.c        |  1 -
 .../media/atomisp/pci/atomisp_subdev.h        |  6 ----
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 25 -------------
 9 files changed, 81 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 290a6ed7237e..b3cceea570ca 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -1102,7 +1102,6 @@ struct atomisp_sensor_ae_bracketing_lut {
 
 #define V4L2_EVENT_ATOMISP_3A_STATS_READY   (V4L2_EVENT_PRIVATE_START + 1)
 #define V4L2_EVENT_ATOMISP_METADATA_READY   (V4L2_EVENT_PRIVATE_START + 2)
-#define V4L2_EVENT_ATOMISP_RAW_BUFFERS_ALLOC_DONE   (V4L2_EVENT_PRIVATE_START + 3)
 #define V4L2_EVENT_ATOMISP_ACC_COMPLETE     (V4L2_EVENT_PRIVATE_START + 4)
 #define V4L2_EVENT_ATOMISP_PAUSE_BUFFER	    (V4L2_EVENT_PRIVATE_START + 5)
 #define V4L2_EVENT_ATOMISP_CSS_RESET	    (V4L2_EVENT_PRIVATE_START + 6)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fb8765fdefda..2af0de77c6ae 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1001,35 +1001,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		atomisp_qbuffers_to_css(asd);
 }
 
-void atomisp_delayed_init_work(struct work_struct *work)
-{
-	struct atomisp_sub_device *asd = container_of(work,
-					 struct atomisp_sub_device,
-					 delayed_init_work);
-	/*
-	 * to SOC camera, use yuvpp pipe and no support continuous mode.
-	 */
-	if (!ATOMISP_USE_YUVPP(asd)) {
-		struct v4l2_event event = {0};
-		struct ia_css_stream *stream;
-
-		stream = asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream;
-
-
-		if (ia_css_alloc_continuous_frame_remain(stream))
-			return;
-
-		ia_css_update_continuous_frames(stream);
-
-		event.type = V4L2_EVENT_ATOMISP_RAW_BUFFERS_ALLOC_DONE;
-		v4l2_event_queue(asd->subdev.devnode, &event);
-	}
-
-	/* signal streamon after delayed init is done */
-	asd->delayed_init = ATOMISP_DELAYED_INIT_DONE;
-	complete(&asd->init_done);
-}
-
 static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 {
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
@@ -1054,12 +1025,6 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 		    !asd->stream_prepared)
 			continue;
 
-		if (asd->delayed_init == ATOMISP_DELAYED_INIT_QUEUED)
-			cancel_work_sync(&asd->delayed_init_work);
-
-		complete(&asd->init_done);
-		asd->delayed_init = ATOMISP_DELAYED_INIT_NOT_QUEUED;
-
 		stream_restart[asd->index] = true;
 
 		spin_lock_irqsave(&isp->lock, flags);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index bea950a128a9..d26593cc648e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -72,7 +72,6 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr);
 const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
     u32 mbus_code);
 bool atomisp_is_mbuscode_raw(uint32_t code);
-void atomisp_delayed_init_work(struct work_struct *work);
 
 /* Get internal fmt according to V4L2 fmt */
 bool atomisp_is_viewfinder_support(struct atomisp_device *isp);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 280e8057676b..28649a522683 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -614,7 +614,6 @@ static void atomisp_subdev_init_struct(struct atomisp_sub_device *asd)
 	/* s3a grid not enabled for any pipe */
 	asd->params.s3a_enabled_pipe = IA_CSS_PIPE_ID_NUM;
 
-	asd->delayed_init = ATOMISP_DELAYED_INIT_NOT_QUEUED;
 	/* Add for channel */
 	asd->input_curr = 0;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 90caa4254893..7f346161c4b5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -101,10 +101,6 @@
 #define ATOMISP_METADATA_QUEUE_DEPTH_FOR_HAL	8
 #define ATOMISP_S3A_BUF_QUEUE_DEPTH_FOR_HAL	8
 
-#define ATOMISP_DELAYED_INIT_NOT_QUEUED	0
-#define ATOMISP_DELAYED_INIT_QUEUED	1
-#define ATOMISP_DELAYED_INIT_DONE	2
-
 /*
  * Define how fast CPU should be able to serve ISP interrupts.
  * The bigger the value, the higher risk that the ISP is not
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index cb6324510aca..87e9b0b284d9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1309,8 +1309,6 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto out_unlock;
 	}
 
-	asd->delayed_init = ATOMISP_DELAYED_INIT_NOT_QUEUED;
-
 out_unlock:
 	mutex_unlock(&isp->mutex);
 	return ret;
@@ -1366,11 +1364,6 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	atomisp_clear_css_buffer_counters(asd);
 	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
 
-	if (asd->delayed_init == ATOMISP_DELAYED_INIT_QUEUED) {
-		cancel_work_sync(&asd->delayed_init_work);
-		asd->delayed_init = ATOMISP_DELAYED_INIT_NOT_QUEUED;
-	}
-
 	css_pipe_id = atomisp_get_css_pipe_id(asd);
 	atomisp_css_stop(asd, css_pipe_id, false);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 821f3204b759..9f07ed9f5306 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -189,7 +189,6 @@ static int isp_subdev_subscribe_event(struct v4l2_subdev *sd,
 	    sub->type != V4L2_EVENT_ATOMISP_METADATA_READY &&
 	    sub->type != V4L2_EVENT_ATOMISP_PAUSE_BUFFER &&
 	    sub->type != V4L2_EVENT_ATOMISP_CSS_RESET &&
-	    sub->type != V4L2_EVENT_ATOMISP_RAW_BUFFERS_ALLOC_DONE &&
 	    sub->type != V4L2_EVENT_ATOMISP_ACC_COMPLETE)
 		return -EINVAL;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index 141b93a6c0be..5583d6a02346 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -325,12 +325,6 @@ struct atomisp_sub_device {
 	 */
 	unsigned int index;
 
-	/* delayed memory allocation for css */
-	struct completion init_done;
-	struct workqueue_struct *delayed_init_workq;
-	unsigned int delayed_init;
-	struct work_struct delayed_init_work;
-
 	unsigned int latest_preview_exp_id; /* CSS ZSL/SDV raw buffer id */
 
 	unsigned int mipi_frame_size;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index e3672069877f..ce223fbb6640 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1083,27 +1083,6 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 		}
 	}
 
-	for (i = 0; i < isp->num_of_streams; i++) {
-		struct atomisp_sub_device *asd = &isp->asd[i];
-
-		init_completion(&asd->init_done);
-
-		asd->delayed_init_workq =
-		    alloc_workqueue(isp->v4l2_dev.name, WQ_CPU_INTENSIVE,
-				    1);
-		if (!asd->delayed_init_workq) {
-			dev_err(isp->dev,
-				"Failed to initialize delayed init workq\n");
-			ret = -ENOMEM;
-
-			for (; i > 0; i--)
-				destroy_workqueue(isp->asd[i - 1].
-						  delayed_init_workq);
-			goto wq_alloc_failed;
-		}
-		INIT_WORK(&asd->delayed_init_work, atomisp_delayed_init_work);
-	}
-
 	for (i = 0; i < isp->input_cnt; i++) {
 		if (isp->inputs[i].port >= ATOMISP_CAMERA_NR_PORTS) {
 			dev_err(isp->dev, "isp->inputs port %d not supported\n",
@@ -1126,10 +1105,6 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 	return 0;
 
 link_failed:
-	for (i = 0; i < isp->num_of_streams; i++)
-		destroy_workqueue(isp->asd[i].
-				  delayed_init_workq);
-wq_alloc_failed:
 	for (i = 0; i < isp->num_of_streams; i++)
 		atomisp_subdev_unregister_entities(
 		    &isp->asd[i]);
-- 
2.39.1

