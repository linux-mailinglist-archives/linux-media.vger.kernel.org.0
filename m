Return-Path: <linux-media+bounces-31733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B649AAA9DAE
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95DD2189EDC1
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 21:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5E52580E2;
	Mon,  5 May 2025 21:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g73/ydHR"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC1C1D79A5
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 21:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746478830; cv=none; b=KFDmy4XPFw9I/6AbFtRDFVMbc5vbI05D/fdlTOVVuWU4J7wK9Duuo1UXbwmyUY6Di03JYUePFilEtZujcObhGeSjkEdV7CX61NNVdsIsHcQ+O4IGhhlSIic8hgZWxCdXqx1YHT2/voIDHthkR0ftYMUmQKNMjiNd6dxXT1vzBMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746478830; c=relaxed/simple;
	bh=+P0xb7KPO3ocJXaI0J5LDhzyT585xFS9QRDS7RCf2+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xx348IR6EEmQ3YVnf4WQ6fvhRd6D6oFGA/AWFD1wqLdvyluTalTDZhQHQHTVlaNUK9awKXxFxL4tgNx5aH9vmGzXA5JH9n1kKxYUfwArJS0EjPCt3eh7Uk+iSbEi21YuimZeS1Nyu0AzNFSoVuvElQZLiNcO8bzSPl2sQ0nQj5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g73/ydHR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746478827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IqHptz8sljCF6N5Yn427uxDZcjRZ4tCT4NJlgNv0U7Q=;
	b=g73/ydHRX8jssEQ/IVa/0KSqPsQ9EhoAuvV+sdnjtPVCpQEYmg2y5SeSU5iQgcUW1XOXei
	3l10UDn03ogAt8qHmo9LxgjNy6+gdCpXYDmmseJQczc/YzWcBNBgaP5OsiA/VK8kmUnqkr
	VcJ9Zbmb3/sJU1TX8XY0Q6h/ggFO6Ds=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-46-AtsEFE0_OIyLVp08BbXcBg-1; Mon,
 05 May 2025 17:00:23 -0400
X-MC-Unique: AtsEFE0_OIyLVp08BbXcBg-1
X-Mimecast-MFC-AGG-ID: AtsEFE0_OIyLVp08BbXcBg_1746478822
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 46AE01800446;
	Mon,  5 May 2025 21:00:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.45.224.24])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4EBA2195608D;
	Mon,  5 May 2025 21:00:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/5] media: atomisp: Properly stop the ISP stream on sensor streamon errors
Date: Mon,  5 May 2025 23:00:05 +0200
Message-ID: <20250505210008.152659-3-hdegoede@redhat.com>
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

When v4l2_subdev_call(sensor, s_stream, 1) fails atomisp_start_streaming()
was not properly returning the buffer ownership back to the videobuf2-core
code, resulting in:

[ 1318.153447] ------------[ cut here ]------------
[ 1318.153499] WARNING: CPU: 0 PID: 4856 at drivers/media/common/videobuf2/videobuf2-core.c:1803 vb2_start_streaming+0xcb/0x160 [videobuf2_common]
...
[ 1318.154551] Call Trace:
[ 1318.154560]  <TASK>
[ 1318.154571]  ? __warn.cold+0xb7/0x14a
[ 1318.154591]  ? vb2_start_streaming+0xcb/0x160 [videobuf2_common]
[ 1318.154617]  ? report_bug+0xe0/0x180
[ 1318.154640]  ? handle_bug+0x5e/0xa0
[ 1318.154652]  ? exc_invalid_op+0x14/0x70
[ 1318.154665]  ? asm_exc_invalid_op+0x16/0x20
[ 1318.154697]  ? vb2_start_streaming+0xcb/0x160 [videobuf2_common]
[ 1318.154723]  ? vb2_start_streaming+0x70/0x160 [videobuf2_common]
[ 1318.154748]  vb2_core_streamon+0xa2/0x100 [videobuf2_common]

The sensor streamon call is the last thing that atomisp_start_streaming()
does and it was failing to undo all of the previous steps in general.

Refactor atomisp_stop_streaming() into an atomisp_stop_stream() helper and
call that on sensor streamon failure to properly clean things up.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 38 +++++++++++--------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 705f104a2147..491af67cc7a8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -856,18 +856,15 @@ static void atomisp_dma_burst_len_cfg(struct atomisp_sub_device *asd)
 		atomisp_css2_hw_store_32(DMA_BURST_SIZE_REG, 0x00);
 }
 
-void atomisp_stop_streaming(struct vb2_queue *vq)
+static void atomisp_stop_stream(struct atomisp_video_pipe *pipe,
+				bool stop_sensor, enum vb2_buffer_state state)
 {
-	struct atomisp_video_pipe *pipe = vq_to_pipe(vq);
 	struct atomisp_sub_device *asd = pipe->asd;
 	struct atomisp_device *isp = asd->isp;
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	unsigned long flags;
 	int ret;
 
-	dev_dbg(isp->dev, "Stop stream\n");
-
-	mutex_lock(&isp->mutex);
 	/*
 	 * There is no guarantee that the buffers queued to / owned by the ISP
 	 * will properly be returned to the queue when stopping. Set a flag to
@@ -893,14 +890,16 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 
 	atomisp_css_stop(asd, false);
 
-	atomisp_flush_video_pipe(pipe, VB2_BUF_STATE_ERROR, true);
+	atomisp_flush_video_pipe(pipe, state, true);
 
 	atomisp_subdev_cleanup_pending_events(asd);
 
-	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].csi_remote_source,
-			       video, s_stream, 0);
-	if (ret)
-		dev_warn(isp->dev, "Stopping sensor stream failed: %d\n", ret);
+	if (stop_sensor) {
+		ret = v4l2_subdev_call(isp->inputs[asd->input_curr].csi_remote_source,
+				       video, s_stream, 0);
+		if (ret)
+			dev_warn(isp->dev, "Stopping sensor stream failed: %d\n", ret);
+	}
 
 	/* Disable the CSI interface on ANN B0/K0 */
 	if (isp->media_dev.hw_revision >= ((ATOMISP_HW_REVISION_ISP2401 <<
@@ -927,7 +926,6 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 		dev_warn(isp->dev, "Recreating streams failed: %d\n", ret);
 
 	media_pipeline_stop(&asd->video_out.vdev.entity.pads[0]);
-	mutex_unlock(&isp->mutex);
 }
 
 int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
@@ -1023,11 +1021,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 			       video, s_stream, 1);
 	if (ret) {
 		dev_err(isp->dev, "Starting sensor stream failed: %d\n", ret);
-		spin_lock_irqsave(&isp->lock, irqflags);
-		asd->streaming = false;
-		spin_unlock_irqrestore(&isp->lock, irqflags);
-		ret = -EINVAL;
-		goto out_unlock;
+		atomisp_stop_stream(pipe, false, VB2_BUF_STATE_QUEUED);
 	}
 
 out_unlock:
@@ -1035,6 +1029,18 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return ret;
 }
 
+void atomisp_stop_streaming(struct vb2_queue *vq)
+{
+	struct atomisp_video_pipe *pipe = vq_to_pipe(vq);
+	struct atomisp_device *isp = pipe->asd->isp;
+
+	dev_dbg(isp->dev, "Stop stream\n");
+
+	mutex_lock(&isp->mutex);
+	atomisp_stop_stream(pipe, true, VB2_BUF_STATE_ERROR);
+	mutex_unlock(&isp->mutex);
+}
+
 /*
  * To get the current value of a control.
  * applications initialize the id field of a struct v4l2_control and
-- 
2.49.0


