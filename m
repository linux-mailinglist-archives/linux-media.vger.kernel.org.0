Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 000F2216DC4
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 15:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgGGNdc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 09:33:32 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:37319 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725944AbgGGNdc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Jul 2020 09:33:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id sniVjDFFXBncFsniYjwTGS; Tue, 07 Jul 2020 15:33:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594128810; bh=WamJANEyfL7WdCjxpcgs/P4vsX2osJ0WQh/vL4rQIvM=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FYrejD48yPCkm8dgyqxQvu9YG+rK4HGsWEZPH5s7mFSlXmPCqALWjBtyVjH7siL3s
         u4d4+W+xn+HzkWHNlZ1mvl99DLKFUsmBJ4DZWroFIGOVIn8habvGU24yYyCPmyHWP3
         7e7MIDtJN3UYVkLnVQY4cw0pzHtFP+oLmZmGsqQJ6WqrOtjFs7tF8BKoI2ficjhi4j
         UXGi2t3+xswasBWBZFP+2MRpxyPIFV4GMnMDUUCaDl+4IgUtCQTv74DyAXtdqcklpb
         RRte0nOUJ+i3QKJFmsJqzporObucfAtpN7t1dQL+cVJzDcja/AVp+nG8dpo59i5uE7
         4rFZPSX8Wugyg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] sun4i-csi: drop read/write, enable VB2_DMABUF
Message-ID: <8bd3a727-f264-5605-906e-62aafbc76e6c@xs4all.nl>
Date:   Tue, 7 Jul 2020 15:32:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCg6gqsUr47v8AWznfuIWPWV8n15oEwErB5AoO9s4IpeN/Q+Gi+bSfV8m3kb4Yndi9o3nvJobedgrjZ9CqGRUGjOu1LazFCmMlbZs7uUom7jZ7C9Lo57
 fghPbxVYkeb+4pUXeKHj75wEnFh0a1jyHqiEOyKyNigrgwyVa5Gsr3rl6nU3JYiQkk4I0CcdDNd1pexQrKT3ShvB4rYd+Dt5hNE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For no obvious reason VB2_DMABUF was not enabled. Add this.

Also both read and write file ops were set, but this was not enabled
in the vb2 io_modes or in the device_caps capabilities. Drop this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
index dbc9fe254ffd..2c39cd7f2862 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -413,7 +413,7 @@ int sun4i_csi_dma_register(struct sun4i_csi *csi, int irq)

 	q->min_buffers_needed = 3;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	q->io_modes = VB2_MMAP;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
 	q->lock = &csi->lock;
 	q->drv_priv = csi;
 	q->buf_struct_size = sizeof(struct sun4i_csi_buffer);
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 1721e5aee9c6..06bf0d170904 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -256,8 +256,6 @@ static const struct v4l2_file_operations sun4i_csi_fops = {
 	.open		= sun4i_csi_open,
 	.release	= sun4i_csi_release,
 	.unlocked_ioctl	= video_ioctl2,
-	.read		= vb2_fop_read,
-	.write		= vb2_fop_write,
 	.poll		= vb2_fop_poll,
 	.mmap		= vb2_fop_mmap,
 };

