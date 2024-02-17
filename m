Return-Path: <linux-media+bounces-5341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A9D858F11
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 12:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEDA11F2231F
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 11:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E577F1D527;
	Sat, 17 Feb 2024 11:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bljcv/DZ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3CE65BCB
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 11:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708169103; cv=none; b=NN/jEcFsCI9MTgEvpcWMBdOLN0vDDTm0REzqsuh+9Ng3VJIZBQxCWFB9zPOBEj7WZNuS5u2H0JP/XrpWkrMXlf+FSSJ899woG/BjRzvzc+SeLIaKPGKDfzMMX2E71PwN8f9tWrrx07KYTqsv5rjJ1TRX5cz3iOTX0RclKo1M7pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708169103; c=relaxed/simple;
	bh=8NW5Lsd/1KLX4ZLoikxEDyI6ucdsbbpCST8y2JiTL94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNmnmM+nA9A4fp9eyIKM3au5HV1f6SVOI/p89m8pnzJLgpmhGCo5kGPeD90f1vZt8cXdWk+xfGqxtOP/rbaNFr65j0v9tJ00RsrmVoiVPND5v73vGWmtQEXSCGXW62TCfs5m2ei/jxBEwKHxg0Mncpijnn1n7NKvLlaWBmGr1sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bljcv/DZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708169100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GKKNqo4hqFWfY+GTeOdjGgs/exMxBIg6xVtevCFKBhw=;
	b=bljcv/DZvtJZEWxC8A6uoaZjHGV5es+UyQGl8jcSWVA7q3FI71LtbXtWg6kvyUQR2eeioN
	kkbJsRNZMzSxnPGhosXWhbTg8CamXGBmB94slSk5bg35K2a+1Mp5r/r6Y4vuv0Ay13OBev
	Qxm5o068K/98tLgiJ2QIl83VwBBdhso=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-131-fF38kjPFPOyevTBpnXvcDA-1; Sat,
 17 Feb 2024 06:24:56 -0500
X-MC-Unique: fF38kjPFPOyevTBpnXvcDA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFB203806707;
	Sat, 17 Feb 2024 11:24:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 382611C1C7E6;
	Sat, 17 Feb 2024 11:24:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 6/9] media: atomisp: Add DMABUF support
Date: Sat, 17 Feb 2024 12:24:35 +0100
Message-ID: <20240217112438.15240-7-hdegoede@redhat.com>
In-Reply-To: <20240217112438.15240-1-hdegoede@redhat.com>
References: <20240217112438.15240-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Add DMABUF support and while at it drop userptr support.

Now that atomisp has been ported to videobuf2 this is trivial.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  | 1 +
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 74cf055cb09b..fa6c9f0ea6eb 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1666,6 +1666,7 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
 	.vidioc_querybuf = vb2_ioctl_querybuf,
 	.vidioc_qbuf = atomisp_qbuf_wrapper,
 	.vidioc_dqbuf = atomisp_dqbuf_wrapper,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
 	.vidioc_streamon = vb2_ioctl_streamon,
 	.vidioc_streamoff = vb2_ioctl_streamoff,
 	.vidioc_default = atomisp_vidioc_default,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 7f1ca05ce54a..8253b6faf8cd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -765,7 +765,7 @@ static int atomisp_init_subdev_pipe(struct atomisp_sub_device *asd,
 
 	/* Init videobuf2 queue structure */
 	pipe->vb_queue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	pipe->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR;
+	pipe->vb_queue.io_modes = VB2_MMAP | VB2_DMABUF;
 	pipe->vb_queue.buf_struct_size = sizeof(struct ia_css_frame);
 	pipe->vb_queue.ops = &atomisp_vb2_ops;
 	pipe->vb_queue.mem_ops = &vb2_vmalloc_memops;
-- 
2.43.0


