Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 444D57016B6
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238931AbjEMMed (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238824AbjEMMec (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:34:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10843C05
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981167;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=79xSuKMxmoYF70mR/91cZt3n6nLoVTK+Lt85gp1eulI=;
        b=h5RJkR36bkdsHlSEVClH1VaC6XAtKA0EZ6TiFT9gmGOgCx3jLbObu9gD/EHwK+roicMfqI
        EeokQ1s0qSCdlp3dLirYzw0hR/woYBuwye8bH/G+RUQkjnzvw1TAp0HQKgjOYC9eg5ufFO
        s6cvQg79uG8tH9BNcDogZiEfLiv0/Vw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-nj0fox-hMUaLwqqIe_0hZA-1; Sat, 13 May 2023 08:32:43 -0400
X-MC-Unique: nj0fox-hMUaLwqqIe_0hZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB0D685A588;
        Sat, 13 May 2023 12:32:42 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 62DAE40C2076;
        Sat, 13 May 2023 12:32:41 +0000 (UTC)
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
Subject: [PATCH 23/30] media: atomisp: Simplify atomisp_isr() and recovery_work()
Date:   Sat, 13 May 2023 14:31:52 +0200
Message-Id: <20230513123159.33234-24-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Both atomisp_isr() and recovery_work() now have a combination of:

1. "if (!isp->asd.streaming) goto out;" code at the top
2. "if (sp->asd.streaming) {}" blocks in the body which are jumped over
   by the goto out.

This means that the "if (sp->asd.streaming) {}" blocks are always
executed if they are not jumped over by the goto.

Remove the unnecessary "if (sp->asd.streaming)" checks and
re-indent the code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 128 +++++++-----------
 1 file changed, 50 insertions(+), 78 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index b2bc9bc050ba..c0c2247f02a4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -475,36 +475,28 @@ irqreturn_t atomisp_isr(int irq, void *dev)
 	if (!isp->asd.streaming)
 		goto out_nowake;
 
-	if (isp->asd.streaming) {
-		if (irq_infos & IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF) {
-			atomic_inc(&isp->asd.sof_count);
-			atomisp_sof_event(&isp->asd);
-
-			/* If sequence_temp and sequence are the same
-			 * there where no frames lost so we can increase
-			 * sequence_temp.
-			 * If not then processing of frame is still in progress
-			 * and driver needs to keep old sequence_temp value.
-			 * NOTE: There is assumption here that ISP will not
-			 * start processing next frame from sensor before old
-			 * one is completely done. */
-			if (atomic_read(&isp->asd.sequence) ==
-			    atomic_read(&isp->asd.sequence_temp))
-				atomic_set(&isp->asd.sequence_temp,
-					   atomic_read(&isp->asd.sof_count));
-		}
-		if (irq_infos & IA_CSS_IRQ_INFO_EVENTS_READY)
-			atomic_set(&isp->asd.sequence,
-				   atomic_read(&isp->asd.sequence_temp));
-	}
-
 	if (irq_infos & IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF) {
-		dev_dbg_ratelimited(isp->dev,
-				    "irq:0x%x (SOF)\n",
-				    irq_infos);
+		atomic_inc(&isp->asd.sof_count);
+		atomisp_sof_event(&isp->asd);
+
+		/*
+		 * If sequence_temp and sequence are the same there where no frames
+		 * lost so we can increase sequence_temp.
+		 * If not then processing of frame is still in progress and driver
+		 * needs to keep old sequence_temp value.
+		 * NOTE: There is assumption here that ISP will not start processing
+		 * next frame from sensor before old one is completely done.
+		 */
+		if (atomic_read(&isp->asd.sequence) == atomic_read(&isp->asd.sequence_temp))
+			atomic_set(&isp->asd.sequence_temp, atomic_read(&isp->asd.sof_count));
+
+		dev_dbg_ratelimited(isp->dev, "irq:0x%x (SOF)\n", irq_infos);
 		irq_infos &= ~IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF;
 	}
 
+	if (irq_infos & IA_CSS_IRQ_INFO_EVENTS_READY)
+		atomic_set(&isp->asd.sequence, atomic_read(&isp->asd.sequence_temp));
+
 	if ((irq_infos & IA_CSS_IRQ_INFO_INPUT_SYSTEM_ERROR) ||
 	    (irq_infos & IA_CSS_IRQ_INFO_IF_ERROR)) {
 		/* handle mipi receiver error */
@@ -941,7 +933,6 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 						  assert_recovery_work);
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	enum ia_css_pipe_id css_pipe_id;
-	bool stream_restart = false;
 	unsigned long flags;
 	int ret;
 
@@ -952,33 +943,25 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 
 	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
 
-	if (isp->asd.streaming || isp->asd.stream_prepared) {
-		stream_restart = true;
+	spin_lock_irqsave(&isp->lock, flags);
+	isp->asd.streaming = false;
+	spin_unlock_irqrestore(&isp->lock, flags);
 
-		spin_lock_irqsave(&isp->lock, flags);
-		isp->asd.streaming = false;
-		spin_unlock_irqrestore(&isp->lock, flags);
+	/* stream off sensor */
+	ret = v4l2_subdev_call(isp->inputs[isp->asd.input_curr].camera, video, s_stream, 0);
+	if (ret)
+		dev_warn(isp->dev, "Stopping sensor stream failed: %d\n", ret);
 
-		/* stream off sensor */
-		ret = v4l2_subdev_call(
-			  isp->inputs[isp->asd.input_curr].
-			  camera, video, s_stream, 0);
-		if (ret)
-			dev_warn(isp->dev,
-				 "can't stop streaming on sensor!\n");
+	atomisp_clear_css_buffer_counters(&isp->asd);
 
-		atomisp_clear_css_buffer_counters(&isp->asd);
+	css_pipe_id = atomisp_get_css_pipe_id(&isp->asd);
+	atomisp_css_stop(&isp->asd, css_pipe_id, true);
 
-		css_pipe_id = atomisp_get_css_pipe_id(&isp->asd);
-		atomisp_css_stop(&isp->asd, css_pipe_id, true);
-
-		isp->asd.preview_exp_id = 1;
-		isp->asd.postview_exp_id = 1;
-		/* notify HAL the CSS reset */
-		dev_dbg(isp->dev,
-			"send reset event to %s\n", isp->asd.subdev.devnode->name);
-		atomisp_reset_event(&isp->asd);
-	}
+	isp->asd.preview_exp_id = 1;
+	isp->asd.postview_exp_id = 1;
+	/* notify HAL the CSS reset */
+	dev_dbg(isp->dev, "send reset event to %s\n", isp->asd.subdev.devnode->name);
+	atomisp_reset_event(&isp->asd);
 
 	/* clear irq */
 	disable_isp_irq(hrt_isp_css_irq_sp);
@@ -991,45 +974,34 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 	/* reset ISP and restore its state */
 	atomisp_reset(isp);
 
-	if (stream_restart) {
-		atomisp_css_input_set_mode(&isp->asd, IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
+	atomisp_css_input_set_mode(&isp->asd, IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
 
-		css_pipe_id = atomisp_get_css_pipe_id(&isp->asd);
-		if (atomisp_css_start(&isp->asd, css_pipe_id, true)) {
-			dev_warn(isp->dev,
-				 "start SP failed, so do not set streaming to be enable!\n");
-		} else {
-			spin_lock_irqsave(&isp->lock, flags);
-			isp->asd.streaming = true;
-			spin_unlock_irqrestore(&isp->lock, flags);
-		}
-
-		atomisp_csi2_configure(&isp->asd);
+	css_pipe_id = atomisp_get_css_pipe_id(&isp->asd);
+	if (atomisp_css_start(&isp->asd, css_pipe_id, true)) {
+		dev_warn(isp->dev, "start SP failed, so do not set streaming to be enable!\n");
+	} else {
+		spin_lock_irqsave(&isp->lock, flags);
+		isp->asd.streaming = true;
+		spin_unlock_irqrestore(&isp->lock, flags);
 	}
 
+	atomisp_csi2_configure(&isp->asd);
+
 	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
 			       atomisp_css_valid_sof(isp));
 
 	if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_AUTO, true) < 0)
 		dev_dbg(isp->dev, "DFS auto failed while recovering!\n");
 
-	if (stream_restart) {
-		/*
-		 * dequeueing buffers is not needed. CSS will recycle
-		 * buffers that it has.
-		 */
-		atomisp_flush_video_pipe(&isp->asd.video_out, VB2_BUF_STATE_ERROR, false);
+	/* Dequeueing buffers is not needed, CSS will recycle buffers that it has */
+	atomisp_flush_video_pipe(&isp->asd.video_out, VB2_BUF_STATE_ERROR, false);
 
-		/* Requeue unprocessed per-frame parameters. */
-		atomisp_recover_params_queue(&isp->asd.video_out);
+	/* Requeue unprocessed per-frame parameters. */
+	atomisp_recover_params_queue(&isp->asd.video_out);
 
-		ret = v4l2_subdev_call(
-			  isp->inputs[isp->asd.input_curr].camera, video,
-			  s_stream, 1);
-		if (ret)
-			dev_warn(isp->dev,
-				 "can't start streaming on sensor!\n");
-	}
+	ret = v4l2_subdev_call(isp->inputs[isp->asd.input_curr].camera, video, s_stream, 1);
+	if (ret)
+		dev_err(isp->dev, "Starting sensor stream failed: %d\n", ret);
 
 out_unlock:
 	mutex_unlock(&isp->mutex);
-- 
2.40.1

