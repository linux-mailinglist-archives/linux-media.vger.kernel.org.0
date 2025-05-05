Return-Path: <linux-media+bounces-31731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B404BAA9DAD
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F7477A7120
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 20:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB0B2701D7;
	Mon,  5 May 2025 21:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ih7BOBMa"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2487D1CEAD6
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 21:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746478826; cv=none; b=tJMi5Uk6FHkdG1zsaKvFhB/J/0DHGt8xfz2K718Z6aunCTPYyOcDLDA3XeuGUM1S3ueBFQcr43YvAzaZ/byaiRdE2gXYmgPqJ7U7AgyDtZ3iZQTbZ5HHAgT6yX7O1tHN2sGjwV4D8ptKUooF4hzlVJp7mfg7mg9eO824Ul6uSgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746478826; c=relaxed/simple;
	bh=gMfDJ9EUSSh7PuvIBQHwiFk4jsJgHEV+C2kxUuSAnA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pulrLhStch6XtGlrHaHuj9IUzuHm+Zxg8o4oqPmCz+btRFT/KhLYixZQCZ2dLYdwfMLSp/OjmPEvuXivFGhKXzS0EA8pDqsZTwiUm5PoLaSLx/5uCxDY8Uj/mnx1d5RUiEB5xP5JG0KRQ0Hppxs9l/P/aImVviXFW2q50uyiLp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ih7BOBMa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746478824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SNtPg4HtryDo5keLoNjStqUXmVwXlHPUGns+vjRaTAU=;
	b=Ih7BOBMaOy3ZTbXvCqgoG5hPA1CoRP7Cs1VBv2oB58jkFlAPPFYGXRwZhhXJ8v/FLCSPOs
	K2bVSdugUbLz7CyLXPkfwiT3W3dqr35vo2R7XEiELbE8+YQlSZfo89tZK2xV36RCwxOagP
	iEbizrqLeG5hCrlPN5YsX48zzW7DbhE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-h55qMMa8OOiquPLyjBzuwg-1; Mon,
 05 May 2025 17:00:20 -0400
X-MC-Unique: h55qMMa8OOiquPLyjBzuwg-1
X-Mimecast-MFC-AGG-ID: h55qMMa8OOiquPLyjBzuwg_1746478819
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A00FF1800987;
	Mon,  5 May 2025 21:00:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.45.224.24])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9B22E195608D;
	Mon,  5 May 2025 21:00:17 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/5] media: atomisp: Move atomisp_stop_streaming() above atomisp_start_streaming()
Date: Mon,  5 May 2025 23:00:04 +0200
Message-ID: <20250505210008.152659-2-hdegoede@redhat.com>
In-Reply-To: <20250505210008.152659-1-hdegoede@redhat.com>
References: <20250505210008.152659-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move atomisp_stop_streaming() above atomisp_start_streaming(), this is
a preparation patch for making atomisp_start_streaming() properly cleanup
if starting the sensor stream fails.

No functional change, only moving a block of code up.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 148 +++++++++---------
 1 file changed, 74 insertions(+), 74 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 97d99bed1560..705f104a2147 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -856,6 +856,80 @@ static void atomisp_dma_burst_len_cfg(struct atomisp_sub_device *asd)
 		atomisp_css2_hw_store_32(DMA_BURST_SIZE_REG, 0x00);
 }
 
+void atomisp_stop_streaming(struct vb2_queue *vq)
+{
+	struct atomisp_video_pipe *pipe = vq_to_pipe(vq);
+	struct atomisp_sub_device *asd = pipe->asd;
+	struct atomisp_device *isp = asd->isp;
+	struct pci_dev *pdev = to_pci_dev(isp->dev);
+	unsigned long flags;
+	int ret;
+
+	dev_dbg(isp->dev, "Stop stream\n");
+
+	mutex_lock(&isp->mutex);
+	/*
+	 * There is no guarantee that the buffers queued to / owned by the ISP
+	 * will properly be returned to the queue when stopping. Set a flag to
+	 * avoid new buffers getting queued and then wait for all the current
+	 * buffers to finish.
+	 */
+	pipe->stopping = true;
+	mutex_unlock(&isp->mutex);
+	/* wait max 1 second */
+	ret = wait_event_timeout(pipe->vb_queue.done_wq,
+				 atomisp_buffers_in_css(pipe) == 0, HZ);
+	mutex_lock(&isp->mutex);
+	pipe->stopping = false;
+	if (ret == 0)
+		dev_warn(isp->dev, "Warning timeout waiting for CSS to return buffers\n");
+
+	spin_lock_irqsave(&isp->lock, flags);
+	asd->streaming = false;
+	spin_unlock_irqrestore(&isp->lock, flags);
+
+	atomisp_clear_css_buffer_counters(asd);
+	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
+
+	atomisp_css_stop(asd, false);
+
+	atomisp_flush_video_pipe(pipe, VB2_BUF_STATE_ERROR, true);
+
+	atomisp_subdev_cleanup_pending_events(asd);
+
+	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].csi_remote_source,
+			       video, s_stream, 0);
+	if (ret)
+		dev_warn(isp->dev, "Stopping sensor stream failed: %d\n", ret);
+
+	/* Disable the CSI interface on ANN B0/K0 */
+	if (isp->media_dev.hw_revision >= ((ATOMISP_HW_REVISION_ISP2401 <<
+					    ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_B0)) {
+		pci_write_config_word(pdev, MRFLD_PCI_CSI_CONTROL,
+				      isp->saved_regs.csi_control & ~MRFLD_PCI_CSI_CONTROL_CSI_READY);
+	}
+
+	if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_LOW, false))
+		dev_warn(isp->dev, "DFS failed.\n");
+
+	/*
+	 * ISP work around, need to reset ISP to allow next stream on to work.
+	 * Streams have already been destroyed by atomisp_css_stop().
+	 * Disable PUNIT/ISP acknowledge/handshake - SRSE=3 and then reset.
+	 */
+	pci_write_config_dword(pdev, PCI_I_CONTROL,
+			       isp->saved_regs.i_control | MRFLD_PCI_I_CONTROL_SRSE_RESET_MASK);
+	atomisp_reset(isp);
+
+	/* Streams were destroyed by atomisp_css_stop(), recreate them. */
+	ret = atomisp_create_pipes_stream(&isp->asd);
+	if (ret)
+		dev_warn(isp->dev, "Recreating streams failed: %d\n", ret);
+
+	media_pipeline_stop(&asd->video_out.vdev.entity.pads[0]);
+	mutex_unlock(&isp->mutex);
+}
+
 int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct atomisp_video_pipe *pipe = vq_to_pipe(vq);
@@ -961,80 +1035,6 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return ret;
 }
 
-void atomisp_stop_streaming(struct vb2_queue *vq)
-{
-	struct atomisp_video_pipe *pipe = vq_to_pipe(vq);
-	struct atomisp_sub_device *asd = pipe->asd;
-	struct atomisp_device *isp = asd->isp;
-	struct pci_dev *pdev = to_pci_dev(isp->dev);
-	unsigned long flags;
-	int ret;
-
-	dev_dbg(isp->dev, "Stop stream\n");
-
-	mutex_lock(&isp->mutex);
-	/*
-	 * There is no guarantee that the buffers queued to / owned by the ISP
-	 * will properly be returned to the queue when stopping. Set a flag to
-	 * avoid new buffers getting queued and then wait for all the current
-	 * buffers to finish.
-	 */
-	pipe->stopping = true;
-	mutex_unlock(&isp->mutex);
-	/* wait max 1 second */
-	ret = wait_event_timeout(pipe->vb_queue.done_wq,
-				 atomisp_buffers_in_css(pipe) == 0, HZ);
-	mutex_lock(&isp->mutex);
-	pipe->stopping = false;
-	if (ret == 0)
-		dev_warn(isp->dev, "Warning timeout waiting for CSS to return buffers\n");
-
-	spin_lock_irqsave(&isp->lock, flags);
-	asd->streaming = false;
-	spin_unlock_irqrestore(&isp->lock, flags);
-
-	atomisp_clear_css_buffer_counters(asd);
-	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
-
-	atomisp_css_stop(asd, false);
-
-	atomisp_flush_video_pipe(pipe, VB2_BUF_STATE_ERROR, true);
-
-	atomisp_subdev_cleanup_pending_events(asd);
-
-	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].csi_remote_source,
-			       video, s_stream, 0);
-	if (ret)
-		dev_warn(isp->dev, "Stopping sensor stream failed: %d\n", ret);
-
-	/* Disable the CSI interface on ANN B0/K0 */
-	if (isp->media_dev.hw_revision >= ((ATOMISP_HW_REVISION_ISP2401 <<
-					    ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_B0)) {
-		pci_write_config_word(pdev, MRFLD_PCI_CSI_CONTROL,
-				      isp->saved_regs.csi_control & ~MRFLD_PCI_CSI_CONTROL_CSI_READY);
-	}
-
-	if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_LOW, false))
-		dev_warn(isp->dev, "DFS failed.\n");
-
-	/*
-	 * ISP work around, need to reset ISP to allow next stream on to work.
-	 * Streams have already been destroyed by atomisp_css_stop().
-	 * Disable PUNIT/ISP acknowledge/handshake - SRSE=3 and then reset.
-	 */
-	pci_write_config_dword(pdev, PCI_I_CONTROL,
-			       isp->saved_regs.i_control | MRFLD_PCI_I_CONTROL_SRSE_RESET_MASK);
-	atomisp_reset(isp);
-
-	/* Streams were destroyed by atomisp_css_stop(), recreate them. */
-	ret = atomisp_create_pipes_stream(&isp->asd);
-	if (ret)
-		dev_warn(isp->dev, "Recreating streams failed: %d\n", ret);
-
-	media_pipeline_stop(&asd->video_out.vdev.entity.pads[0]);
-	mutex_unlock(&isp->mutex);
-}
-
 /*
  * To get the current value of a control.
  * applications initialize the id field of a struct v4l2_control and
-- 
2.49.0


