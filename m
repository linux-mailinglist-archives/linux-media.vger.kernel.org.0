Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 552287016B4
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238918AbjEMMeb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238824AbjEMMe1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:34:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 800393AA4
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981154;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7l81+Cp7XMW5iWMabugy2rIllnoZqrFiCz5vQQvHa4Q=;
        b=hoTj+n2YUMbU5JCnLTvAExFLyQ4UBYkBnFIj7AB5iqOaGIMs5St+77CtP0RTe7xJCxZLYA
        QI8lUFtbjvHk+T4+oFl+lnxScZ0gsfZ5y/0EooyZ/yKsG0tYlxC3deHZVuRPga/96p9FG1
        +U94AfBn+q5Rtr0we1+B96jW4cd/+6A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-291yrfo0MqyNrmdZ8SjkVg-1; Sat, 13 May 2023 08:32:31 -0400
X-MC-Unique: 291yrfo0MqyNrmdZ8SjkVg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 950B988B767;
        Sat, 13 May 2023 12:32:30 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0F2A340C2076;
        Sat, 13 May 2023 12:32:28 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 16/30] media: atomisp: Simplify atomisp_[start|stop]_streaming()
Date:   Sat, 13 May 2023 14:31:45 +0200
Message-Id: <20230513123159.33234-17-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that continuous mode is gone and we only have 1 /dev/video# node,
the videobuf2 core guarantees that atomisp_[start|stop]_streaming() will
only be called one at a time.

So there is no need to check for things like the isp is already streaming
when starting, or other streams still being active while stopping.
Remove checks for these from atomisp_[start|stop]_streaming().

While at it also improve the logging a bit:
1. Remove the dev_err(isp->dev, "atomisp_reset") logged on every
   stream stop (even though everything is fine.
2. Log a message when starting/stopping the sensor stream fails

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 89 ++++---------------
 1 file changed, 17 insertions(+), 72 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 13e00a2af8e1..087ec5120bce 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -615,12 +615,6 @@ static int atomisp_enum_input(struct file *file, void *fh,
 	return 0;
 }
 
-static unsigned int
-atomisp_subdev_streaming_count(struct atomisp_sub_device *asd)
-{
-	return vb2_start_streaming_called(&asd->video_out.vb_queue);
-}
-
 unsigned int atomisp_streaming_count(struct atomisp_device *isp)
 {
 	return isp->asd.streaming == ATOMISP_DEVICE_STREAMING_ENABLED;
@@ -1162,11 +1156,6 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	/* Input system HW workaround */
 	atomisp_dma_burst_len_cfg(asd);
 
-	if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED) {
-		atomisp_qbuffers_to_css(asd);
-		goto start_sensor;
-	}
-
 	css_pipe_id = atomisp_get_css_pipe_id(asd);
 
 	/* Invalidate caches. FIXME: should flush only necessary buffers */
@@ -1206,7 +1195,6 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	atomisp_qbuffers_to_css(asd);
 
-start_sensor:
 	if (isp->flash) {
 		asd->params.num_flash_frames = 0;
 		asd->params.flash_state = ATOMISP_FLASH_IDLE;
@@ -1216,19 +1204,9 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
 			       atomisp_css_valid_sof(isp));
 	atomisp_csi2_configure(asd);
-	/*
-	 * set freq to max when streaming count > 1 which indicate
-	 * dual camera would run
-	 */
-	if (atomisp_streaming_count(isp) > 1) {
-		if (atomisp_freq_scaling(isp,
-					 ATOMISP_DFS_MODE_MAX, false) < 0)
-			dev_dbg(isp->dev, "DFS max mode failed!\n");
-	} else {
-		if (atomisp_freq_scaling(isp,
-					 ATOMISP_DFS_MODE_AUTO, false) < 0)
-			dev_dbg(isp->dev, "DFS auto mode failed!\n");
-	}
+
+	if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_AUTO, false) < 0)
+		dev_dbg(isp->dev, "DFS auto mode failed!\n");
 
 	/* Enable the CSI interface on ANN B0/K0 */
 	if (isp->media_dev.hw_revision >= ((ATOMISP_HW_REVISION_ISP2401 <<
@@ -1241,6 +1219,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
 			       video, s_stream, 1);
 	if (ret) {
+		dev_err(isp->dev, "Starting sensor stream failed: %d\n", ret);
 		spin_lock_irqsave(&isp->lock, irqflags);
 		asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
 		spin_unlock_irqrestore(&isp->lock, irqflags);
@@ -1260,8 +1239,6 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	struct atomisp_device *isp = asd->isp;
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	enum ia_css_pipe_id css_pipe_id;
-	bool recreate_stream = false;
-	bool first_streamoff = false;
 	unsigned long flags;
 	int ret;
 
@@ -1284,19 +1261,10 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	if (ret == 0)
 		dev_warn(isp->dev, "Warning timeout waiting for CSS to return buffers\n");
 
-	if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED)
-		first_streamoff = true;
-
 	spin_lock_irqsave(&isp->lock, flags);
-	if (atomisp_subdev_streaming_count(asd) == 1)
-		asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
-	else
-		asd->streaming = ATOMISP_DEVICE_STREAMING_STOPPING;
+	asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
 	spin_unlock_irqrestore(&isp->lock, flags);
 
-	if (!first_streamoff)
-		goto stopsensor;
-
 	atomisp_clear_css_buffer_counters(asd);
 	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
 
@@ -1306,21 +1274,17 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	atomisp_flush_video_pipe(pipe, VB2_BUF_STATE_ERROR, true);
 
 	atomisp_subdev_cleanup_pending_events(asd);
-stopsensor:
+
 	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
 			       video, s_stream, 0);
+	if (ret)
+		dev_warn(isp->dev, "Stopping sensor stream failed: %d\n", ret);
 
 	if (isp->flash) {
 		asd->params.num_flash_frames = 0;
 		asd->params.flash_state = ATOMISP_FLASH_IDLE;
 	}
 
-	/* if other streams are running, isp should not be powered off */
-	if (atomisp_streaming_count(isp)) {
-		atomisp_css_flush(isp);
-		goto out_unlock;
-	}
-
 	/* Disable the CSI interface on ANN B0/K0 */
 	if (isp->media_dev.hw_revision >= ((ATOMISP_HW_REVISION_ISP2401 <<
 					    ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_B0)) {
@@ -1330,40 +1294,21 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 
 	if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_LOW, false))
 		dev_warn(isp->dev, "DFS failed.\n");
-	/*
-	 * ISP work around, need to reset isp
-	 * Is it correct time to reset ISP when first node does streamoff?
-	 *
-	 * It is possible that the other asd stream is in the stage
-	 * that v4l2_setfmt is just get called on it, which will
-	 * create css stream on that stream. But at this point, there
-	 * is no way to destroy the css stream created on that stream.
-	 *
-	 * So force stream destroy here.
-	 */
-	if (isp->asd.stream_prepared) {
-		atomisp_destroy_pipes_stream_force(&isp->asd);
-		recreate_stream = true;
-	}
 
-	/* disable  PUNIT/ISP acknowlede/handshake - SRSE=3 */
+	/*
+	 * ISP work around, need to reset ISP to allow next stream on to work.
+	 * Streams have already been destroyed by atomisp_css_stop().
+	 * Disable PUNIT/ISP acknowlede/handshake - SRSE=3 and then reset.
+	 */
 	pci_write_config_dword(pdev, PCI_I_CONTROL,
 			       isp->saved_regs.i_control | MRFLD_PCI_I_CONTROL_SRSE_RESET_MASK);
-	dev_err(isp->dev, "atomisp_reset");
 	atomisp_reset(isp);
 
-	if (recreate_stream) {
-		int ret2;
+	/* Streams were destroyed by atomisp_css_stop(), recreate them. */
+	ret = atomisp_create_pipes_stream(&isp->asd);
+	if (ret)
+		dev_warn(isp->dev, "Recreating streams failed: %d\n", ret);
 
-		ret2 = atomisp_create_pipes_stream(&isp->asd);
-		if (ret2) {
-			dev_err(isp->dev, "%s error re-creating streams: %d\n", __func__, ret2);
-			if (!ret)
-				ret = ret2;
-		}
-	}
-
-out_unlock:
 	mutex_unlock(&isp->mutex);
 }
 
-- 
2.40.1

