Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C648135C49B
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239948AbhDLLDP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239763AbhDLLDK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:03:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D535C061574
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 04:02:52 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6016CDBC;
        Mon, 12 Apr 2021 13:02:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618225371;
        bh=JIuVxzRyK7ywTVdwj4/L3zID4PbGL9Ib2DioiXBdh8Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jyxs7WErRcR5dyhksBdOHhK0OOVRdhVdbCe8J2vb2hiwVTfDJdgt7MjiwNBbay7Gf
         IMcG5UxJOvv1DKRhaEX0OBsDfd3oCLbDY0B17uSlhE9xIVjXS1MdRTgEK01N9ubsHl
         BPHCTmHI7OGfUm4mnTDNyNv035ddRBaUO4oS0qDo=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 2/3] media: vivid: remove stream_sliced_vbi_cap field
Date:   Mon, 12 Apr 2021 14:02:10 +0300
Message-Id: <20210412110211.275791-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412110211.275791-1-tomi.valkeinen@ideasonboard.com>
References: <20210412110211.275791-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Vivid tracks the VBI capture mode in vivid_dev->stream_sliced_vbi_cap
field.  We can just look at the buffer type instead, and drop the field.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/test-drivers/vivid/vivid-core.h        | 1 -
 drivers/media/test-drivers/vivid/vivid-kthread-cap.c | 2 +-
 drivers/media/test-drivers/vivid/vivid-vbi-cap.c     | 6 ++----
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
index 9c2d1470b597..9af7e843c2cf 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -428,7 +428,6 @@ struct vivid_dev {
 	u32				vbi_cap_seq_start;
 	u32				vbi_cap_seq_count;
 	bool				vbi_cap_streaming;
-	bool				stream_sliced_vbi_cap;
 	u32				meta_cap_seq_start;
 	u32				meta_cap_seq_count;
 	bool				meta_cap_streaming;
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
index 67fb3c00f9ad..781763c193eb 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
@@ -750,7 +750,7 @@ static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
 
 		v4l2_ctrl_request_setup(vbi_cap_buf->vb.vb2_buf.req_obj.req,
 					&dev->ctrl_hdl_vbi_cap);
-		if (dev->stream_sliced_vbi_cap)
+		if (vbi_cap_buf->vb.vb2_buf.type == V4L2_BUF_TYPE_SLICED_VBI_CAPTURE)
 			vivid_sliced_vbi_cap_process(dev, vbi_cap_buf);
 		else
 			vivid_raw_vbi_cap_process(dev, vbi_cap_buf);
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
index 1a9348eea781..387df4ff01b0 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
@@ -255,9 +255,8 @@ int vidioc_s_fmt_vbi_cap(struct file *file, void *priv,
 
 	if (ret)
 		return ret;
-	if (dev->stream_sliced_vbi_cap && vb2_is_busy(&dev->vb_vbi_cap_q))
+	if (f->type != V4L2_BUF_TYPE_VBI_CAPTURE && vb2_is_busy(&dev->vb_vbi_cap_q))
 		return -EBUSY;
-	dev->stream_sliced_vbi_cap = false;
 	dev->vbi_cap_dev.queue->type = V4L2_BUF_TYPE_VBI_CAPTURE;
 	return 0;
 }
@@ -322,10 +321,9 @@ int vidioc_s_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format
 
 	if (ret)
 		return ret;
-	if (!dev->stream_sliced_vbi_cap && vb2_is_busy(&dev->vb_vbi_cap_q))
+	if (fmt->type != V4L2_BUF_TYPE_SLICED_VBI_CAPTURE && vb2_is_busy(&dev->vb_vbi_cap_q))
 		return -EBUSY;
 	dev->service_set_cap = vbi->service_set;
-	dev->stream_sliced_vbi_cap = true;
 	dev->vbi_cap_dev.queue->type = V4L2_BUF_TYPE_SLICED_VBI_CAPTURE;
 	return 0;
 }
-- 
2.25.1

