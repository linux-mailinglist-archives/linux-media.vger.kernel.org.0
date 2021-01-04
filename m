Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ABE62E9EED
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 21:36:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbhADUfc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 15:35:32 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35462 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbhADUfb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 15:35:31 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id ECEF71F44EF4
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 1/3] media: imx: Unregister csc/scaler only if registered
Date:   Mon,  4 Jan 2021 17:34:39 -0300
Message-Id: <20210104203441.168778-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The csc/scaler device pointer (imxmd->m2m_vdev) is assigned
after the imx media device v4l2-async probe completes,
therefore we need to check if the device is non-NULL
before trying to unregister it.

This can be the case if the non-completed imx media device
is unbinded (or the driver is removed), leading to a kernel oops.

Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
v2:
* As noted by Philipp, set m2m_vdev to NULL if the csc/scaler
  registration fails.
---
 drivers/staging/media/imx/imx-media-dev.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
index 6d2205461e56..338b8bd0bb07 100644
--- a/drivers/staging/media/imx/imx-media-dev.c
+++ b/drivers/staging/media/imx/imx-media-dev.c
@@ -53,6 +53,7 @@ static int imx6_media_probe_complete(struct v4l2_async_notifier *notifier)
 	imxmd->m2m_vdev = imx_media_csc_scaler_device_init(imxmd);
 	if (IS_ERR(imxmd->m2m_vdev)) {
 		ret = PTR_ERR(imxmd->m2m_vdev);
+		imxmd->m2m_vdev = NULL;
 		goto unlock;
 	}
 
@@ -107,10 +108,14 @@ static int imx_media_remove(struct platform_device *pdev)
 
 	v4l2_info(&imxmd->v4l2_dev, "Removing imx-media\n");
 
+	if (imxmd->m2m_vdev) {
+		imx_media_csc_scaler_device_unregister(imxmd->m2m_vdev);
+		imxmd->m2m_vdev = NULL;
+	}
+
 	v4l2_async_notifier_unregister(&imxmd->notifier);
 	imx_media_unregister_ipu_internal_subdevs(imxmd);
 	v4l2_async_notifier_cleanup(&imxmd->notifier);
-	imx_media_csc_scaler_device_unregister(imxmd->m2m_vdev);
 	media_device_unregister(&imxmd->md);
 	v4l2_device_unregister(&imxmd->v4l2_dev);
 	media_device_cleanup(&imxmd->md);
-- 
2.29.2

