Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA1E2E371A
	for <lists+linux-media@lfdr.de>; Mon, 28 Dec 2020 13:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbgL1MWZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Dec 2020 07:22:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbgL1MWZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Dec 2020 07:22:25 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55296C061795
        for <linux-media@vger.kernel.org>; Mon, 28 Dec 2020 04:21:45 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 91BB71F44467
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 2/3] media: imx: Fix csc/scaler unregister
Date:   Mon, 28 Dec 2020 09:21:30 -0300
Message-Id: <20201228122131.138454-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228122131.138454-1-ezequiel@collabora.com>
References: <20201228122131.138454-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The csc/scaler device private struct is released by
ipu_csc_scaler_video_device_release(), which can be called
by video_unregister_device() if there are no users
of the underlying struct video device.

Therefore, the mutex can't be held when calling
video_unregister_device() as its memory may be freed
by it, leading to a kernel oops.

Fortunately, the fix is quite simple as no locking
is needed when calling video_unregister_device(): v4l2-core
already has its own internal locking, and the structures
are also properly refcounted.

Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/imx/imx-media-csc-scaler.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index fab1155a5958..63a0204502a8 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -869,11 +869,7 @@ void imx_media_csc_scaler_device_unregister(struct imx_media_video_dev *vdev)
 	struct ipu_csc_scaler_priv *priv = vdev_to_priv(vdev);
 	struct video_device *vfd = priv->vdev.vfd;
 
-	mutex_lock(&priv->mutex);
-
 	video_unregister_device(vfd);
-
-	mutex_unlock(&priv->mutex);
 }
 
 struct imx_media_video_dev *
-- 
2.29.2

