Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 749A12F6917
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 19:16:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729663AbhANSI4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 13:08:56 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51556 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729590AbhANSIz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 13:08:55 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id ECB6A1F45D09
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        boris.brezillon@collabora.com, hiroh@chromium.org,
        nicolas@ndufresne.ca, Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, stanimir.varbanov@linaro.org,
        tfiga@chromium.org
Subject: [RFC PATCH v6 06/11] media: vivid: use vb2_ioctls_ext_{d}qbuf hooks
Date:   Thu, 14 Jan 2021 15:07:33 -0300
Message-Id: <20210114180738.1758707-7-helen.koike@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114180738.1758707-1-helen.koike@collabora.com>
References: <20210114180738.1758707-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add vb2 ext hooks and call vb2_set_pixelformat().
This allows more flexibility with buffer handling.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
Changes in v6:
- New patch to exemplify how drivers would easily support features from Ext Buf
---
 drivers/media/test-drivers/vivid/vivid-core.c    | 2 ++
 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 1 +
 drivers/media/test-drivers/vivid/vivid-vid-out.c | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 0dc65ef3aa14..eacb23808c7e 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -723,6 +723,8 @@ static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
 	.vidioc_querybuf		= vb2_ioctl_querybuf,
 	.vidioc_qbuf			= vb2_ioctl_qbuf,
 	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_ext_qbuf		= vb2_ioctl_ext_qbuf,
+	.vidioc_ext_dqbuf		= vb2_ioctl_ext_dqbuf,
 	.vidioc_expbuf			= vb2_ioctl_expbuf,
 	.vidioc_streamon		= vb2_ioctl_streamon,
 	.vidioc_streamoff		= vb2_ioctl_streamoff,
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index b9caa4b26209..882b0c4a6591 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -169,6 +169,7 @@ static int vid_cap_buf_prepare(struct vb2_buffer *vb)
 		}
 
 		vb2_set_plane_payload(vb, p, size);
+		vb2_set_pixelformat(vb, dev->fmt_cap->fourcc);
 		vb->planes[p].data_offset = dev->fmt_cap->data_offset[p];
 	}
 
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
index ac1e981e8342..6be61112065d 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
@@ -136,6 +136,7 @@ static int vid_out_buf_prepare(struct vb2_buffer *vb)
 			return -EINVAL;
 		}
 	}
+	vb2_set_pixelformat(vb, dev->fmt_out->fourcc);
 
 	return 0;
 }
-- 
2.29.2

