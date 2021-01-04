Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292C52E9EEF
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 21:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbhADUjA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 15:39:00 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35518 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbhADUjA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 15:39:00 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A1B671F44F4C
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 3/3] media: imx: Clean capture unregister
Date:   Mon,  4 Jan 2021 17:34:41 -0300
Message-Id: <20210104203441.168778-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210104203441.168778-1-ezequiel@collabora.com>
References: <20210104203441.168778-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No locking is needed to call video_unregister_device(). Drop it.

Also, drop the superfluous video_is_registered() call, which is
done by video_unregister_device(), and re-order media_entity_cleanup()
and video_unregister_device() calls.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
v2:
* As suggested by Philipp, write a more complete commit description.
---
 drivers/staging/media/imx/imx-media-capture.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index c1931eb2540e..e10ce103a5b4 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -816,14 +816,8 @@ void imx_media_capture_device_unregister(struct imx_media_video_dev *vdev)
 	struct capture_priv *priv = to_capture_priv(vdev);
 	struct video_device *vfd = priv->vdev.vfd;
 
-	mutex_lock(&priv->mutex);
-
-	if (video_is_registered(vfd)) {
-		video_unregister_device(vfd);
-		media_entity_cleanup(&vfd->entity);
-	}
-
-	mutex_unlock(&priv->mutex);
+	media_entity_cleanup(&vfd->entity);
+	video_unregister_device(vfd);
 }
 EXPORT_SYMBOL_GPL(imx_media_capture_device_unregister);
 
-- 
2.29.2

