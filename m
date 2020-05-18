Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73F7C1D8092
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 19:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729089AbgERRkc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 13:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729083AbgERRkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 13:40:31 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CCDEC061A0C;
        Mon, 18 May 2020 10:40:31 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id BBB782A0C9C
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        gustavo.padovan@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v4 1/3] media: rkvdec: Fix .buf_prepare
Date:   Mon, 18 May 2020 14:40:09 -0300
Message-Id: <20200518174011.15543-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200518174011.15543-1-ezequiel@collabora.com>
References: <20200518174011.15543-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver should only set the payload on .buf_prepare
if the buffer is CAPTURE type, or if an OUTPUT buffer
has a zeroed payload.

Fix it.

Fixes: cd33c830448ba ("media: rkvdec: Add the rkvdec driver")
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 225eeca73356..4df2a248ab96 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -456,7 +456,15 @@ static int rkvdec_buf_prepare(struct vb2_buffer *vb)
 		if (vb2_plane_size(vb, i) < sizeimage)
 			return -EINVAL;
 	}
-	vb2_set_plane_payload(vb, 0, f->fmt.pix_mp.plane_fmt[0].sizeimage);
+
+	/*
+	 * Buffer's bytesused is written by the driver for CAPTURE buffers,
+	 * or if the application passed zero bytesused on an OUTPUT buffer.
+	 */
+	if (!V4L2_TYPE_IS_OUTPUT(vq->type) ||
+	    (V4L2_TYPE_IS_OUTPUT(vq->type) && !vb2_get_plane_payload(vb, 0)))
+		vb2_set_plane_payload(vb, 0,
+				      f->fmt.pix_mp.plane_fmt[0].sizeimage);
 	return 0;
 }
 
-- 
2.26.0.rc2

