Return-Path: <linux-media+bounces-9359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DC18A4E5D
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41A7F1C20F73
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D497C6CDAC;
	Mon, 15 Apr 2024 12:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="auaEFygo"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9A16BFC5
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182575; cv=none; b=DlTtXpCXI+b3HBRH6Enu1BNSLAvMz7jNHyCONvXJWi7nxcjLCMGmN+RG2UPTdojUnmdBLabJLRXM/J+O4u8mby6m/4O7uNNd6a90AAcAqXibfCYek98gi1ZlWb40dTgsAhrsdSk6QuJL4Q3XQKDeZIWjSt+XFHlF/LIWqTz1CTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182575; c=relaxed/simple;
	bh=/2KJ/TsMOZJB6hH86nftC0fSo3cHqvgpF5KdM3jdmtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LqxyHd4SUM8+Z6fTpk+0Y9hcftHuhQACU2A7OTCJcY8EnJxXrukByRf7Z+BWjqEDpAjMAQGqq0PyCBvrxkAK+2SUs/A216q1kYDAHZnvo4aMbsKXuvIx/vWXwAmMl85sszB3eB5TbzOA3nGoLw/FtAAUP9qNXsJ47VsK/XycHYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=auaEFygo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oHHrJR8HiRcRSBbFDuzyUMs/wZE2RbsTa3jSRIQeRbo=;
	b=auaEFygoRUU1G8YjopStAOQ5wUc0mvSaiBuVFjxYvfS7TQkppdK5vWCzusX//Egq8YtDGB
	SlWXMjxpO3+uPfDFpGyxKsr5aKJhFkmK8sAMHPN8D9pM6/B8x/WbvIDBtGDoOIe2FJrkRK
	Tv0pNOsP83ajlTT+azS3kl2KbcwLhIc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-vTy0ymoRMKuhzaK2IVM07A-1; Mon, 15 Apr 2024 08:02:47 -0400
X-MC-Unique: vTy0ymoRMKuhzaK2IVM07A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3D1780171E;
	Mon, 15 Apr 2024 12:02:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CE7BC13FA1;
	Mon, 15 Apr 2024 12:02:44 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 08/23] media: atomisp: Call media_pipeline_alloc_start() in stream start
Date: Mon, 15 Apr 2024 14:02:05 +0200
Message-ID: <20240415120220.219480-9-hdegoede@redhat.com>
In-Reply-To: <20240415120220.219480-1-hdegoede@redhat.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Call media_pipeline_alloc_start() from atomisp_start_streaming() to mark
all involved subdevs as busy so that the links cannot be changed through
the media-controller APIs while streaming.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 15 +++++++++++++++
 .../staging/media/atomisp/pci/atomisp_subdev.h    |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index c16942051cfb..8ef8cbc3b7a7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -902,6 +902,20 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		goto out_unlock;
 
+	/*
+	 * When running a classic v4l2 app after a media-controller aware
+	 * app, the CSI-receiver -> ISP link for the current sensor may be
+	 * disabled. Fix this up before marking the pipeline as started.
+	 */
+	mutex_lock(&isp->media_dev.graph_mutex);
+	atomisp_setup_input_links(isp);
+	ret = __media_pipeline_start(&asd->video_out.vdev.entity.pads[0], &asd->video_out.pipe);
+	mutex_unlock(&isp->media_dev.graph_mutex);
+	if (ret) {
+		dev_err(isp->dev, "Error starting mc pipline: %d\n", ret);
+		goto out_unlock;
+	}
+
 	/* Input system HW workaround */
 	atomisp_dma_burst_len_cfg(asd);
 
@@ -1054,6 +1068,7 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	if (ret)
 		dev_warn(isp->dev, "Recreating streams failed: %d\n", ret);
 
+	media_pipeline_stop(&asd->video_out.vdev.entity.pads[0]);
 	mutex_unlock(&isp->mutex);
 }
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index 9c1703bf439c..bcfa829dbf61 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -49,6 +49,7 @@ struct atomisp_video_pipe {
 	struct video_device vdev;
 	enum v4l2_buf_type type;
 	struct media_pad pad;
+	struct media_pipeline pipe;
 	struct vb2_queue vb_queue;
 	/* Lock for vb_queue, when also taking isp->mutex this must be taken first! */
 	struct mutex vb_queue_mutex;
-- 
2.44.0


