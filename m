Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDB9A373D8
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 14:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbfFFMLj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 08:11:39 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:33081 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727451AbfFFMLh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 08:11:37 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YrExhzc7c3qlsYrF2hma9A; Thu, 06 Jun 2019 14:11:36 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 7/9] vicodec: use correct sizeimage value when draining
Date:   Thu,  6 Jun 2019 14:11:29 +0200
Message-Id: <20190606121131.37110-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606121131.37110-1-hverkuil-cisco@xs4all.nl>
References: <20190606121131.37110-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfF8IrJ5MbVPIR6gyWP7iAau3S6ZwUN5Ek0hxsRNg/O3trIAdxqRi0Nu4U0JbqlsDS30hoWrW+xtaYDDzGiHb5e1yZ4Lon6vV7IApIaa+FvVQ9ZwIkMIr
 WT8FFnl1NcYawcqA9n0SswVWRAWX3Ej/cf0fHkuRKIKpGPfFbenlfa2E6vbgrqqZIyfDltuH5b2mGSL6tlsjHnFfq8EHXNTs4WhdKjYKK0/+AXW/y05Q1qp1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After a resolution change is detected, q_data->sizeimage is updated
to the new format, but buf_prepare is still draining buffers that
need to use the old pre-resolution-change value. So store the sizeimage
value in q_data->vb2_sizeimage in queue_setup and use that in
buf_prepare.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/vicodec/vicodec-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
index 4b0062ac880c..ce7f7bf1b998 100644
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -84,6 +84,7 @@ struct vicodec_q_data {
 	unsigned int		visible_width;
 	unsigned int		visible_height;
 	unsigned int		sizeimage;
+	unsigned int		vb2_sizeimage;
 	unsigned int		sequence;
 	const struct v4l2_fwht_pixfmt_info *info;
 };
@@ -1361,6 +1362,7 @@ static int vicodec_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 
 	*nplanes = 1;
 	sizes[0] = size;
+	q_data->vb2_sizeimage = size;
 	return 0;
 }
 
@@ -1391,11 +1393,11 @@ static int vicodec_buf_prepare(struct vb2_buffer *vb)
 		}
 	}
 
-	if (vb2_plane_size(vb, 0) < q_data->sizeimage) {
+	if (vb2_plane_size(vb, 0) < q_data->vb2_sizeimage) {
 		dprintk(ctx->dev,
 			"%s data will not fit into plane (%lu < %lu)\n",
 			__func__, vb2_plane_size(vb, 0),
-			(long)q_data->sizeimage);
+			(long)q_data->vb2_sizeimage);
 		return -EINVAL;
 	}
 
-- 
2.20.1

