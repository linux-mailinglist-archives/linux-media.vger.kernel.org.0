Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0692A3668B9
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 12:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236872AbhDUKBV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 06:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237027AbhDUKBR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 06:01:17 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008B7C06138D
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 03:00:43 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 68C6E1F42D4A
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        kernel@collabora.com, Adrian Ratiu <adrian.ratiu@collabora.com>
Subject: [RFC RESEND 1/3] media: rkvdec: Fix .buf_prepare
Date:   Wed, 21 Apr 2021 12:00:33 +0200
Message-Id: <20210421100035.13571-2-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421100035.13571-1-andrzej.p@collabora.com>
References: <20210421100035.13571-1-andrzej.p@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ezequiel Garcia <ezequiel@collabora.com>

The driver should only set the payload on .buf_prepare if the
buffer is CAPTURE type. If an OUTPUT buffer has a zero bytesused
set by userspace then v4l2-core will set it to buffer length.

Fixes: cd33c830448ba ("media: rkvdec: Add the rkvdec driver")
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index d821661d30f3..ef2166043127 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -481,7 +481,15 @@ static int rkvdec_buf_prepare(struct vb2_buffer *vb)
 		if (vb2_plane_size(vb, i) < sizeimage)
 			return -EINVAL;
 	}
-	vb2_set_plane_payload(vb, 0, f->fmt.pix_mp.plane_fmt[0].sizeimage);
+
+	/*
+	 * Buffer bytesused is written by driver for CAPTURE buffers.
+	 * (if userspace passes 0 bytesused for OUTPUT buffers, v4l2-core sets
+	 * it to buffer length).
+	 */
+	if (!V4L2_TYPE_IS_OUTPUT(vq->type))
+		vb2_set_plane_payload(vb, 0, f->fmt.pix_mp.plane_fmt[0].sizeimage);
+
 	return 0;
 }
 
-- 
2.17.1

