Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C50E12F691A
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 19:16:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729733AbhANSJA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 13:09:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729706AbhANSI7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 13:08:59 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C29EC0613CF;
        Thu, 14 Jan 2021 10:08:19 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id A698E1F45D07
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        boris.brezillon@collabora.com, hiroh@chromium.org,
        nicolas@ndufresne.ca, Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, stanimir.varbanov@linaro.org,
        tfiga@chromium.org
Subject: [RFC PATCH v6 07/11] media: vimc: use vb2_ioctls_ext_{d}qbuf hooks
Date:   Thu, 14 Jan 2021 15:07:34 -0300
Message-Id: <20210114180738.1758707-8-helen.koike@collabora.com>
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
 drivers/media/test-drivers/vimc/vimc-capture.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 5e9fd902cd37..729614d19002 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -217,6 +217,8 @@ static const struct v4l2_ioctl_ops vimc_cap_ioctl_ops = {
 	.vidioc_querybuf = vb2_ioctl_querybuf,
 	.vidioc_qbuf = vb2_ioctl_qbuf,
 	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_ext_qbuf = vb2_ioctl_ext_qbuf,
+	.vidioc_ext_dqbuf = vb2_ioctl_ext_dqbuf,
 	.vidioc_expbuf = vb2_ioctl_expbuf,
 	.vidioc_streamon = vb2_ioctl_streamon,
 	.vidioc_streamoff = vb2_ioctl_streamoff,
@@ -389,6 +391,7 @@ static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
 	/* Set it as ready */
 	vb2_set_plane_payload(&vimc_buf->vb2.vb2_buf, 0,
 			      vcap->format.sizeimage);
+	vb2_set_pixelformat(&vimc_buf->vb2.vb2_buf, vcap->format.pixelformat);
 	vb2_buffer_done(&vimc_buf->vb2.vb2_buf, VB2_BUF_STATE_DONE);
 	return NULL;
 }
-- 
2.29.2

