Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1662B44A5
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 14:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgKPNXE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 08:23:04 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60398 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727978AbgKPNXE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 08:23:04 -0500
Received: from guri.fritz.box (p200300c7cf41a70008f7652dcb85b409.dip0.t-ipconnect.de [IPv6:2003:c7:cf41:a700:8f7:652d:cb85:b409])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 72E861F4716D;
        Mon, 16 Nov 2020 13:23:02 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org,
        dave.stevenson@raspberrypi.com
Subject: [PATCH] media: i2c: imx219: Declare that the driver can create events
Date:   Mon, 16 Nov 2020 14:22:44 +0100
Message-Id: <20201116132244.30081-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The flag V4L2_SUBDEV_FL_HAS_EVENTS is required if the subdev can
generate events. It can create events from the ctrl handler, therefore
this is required.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
This patch fixes compliance issues found in imx219:

fail: v4l2-test-controls.cpp(830): failed to find event for control 'Exposure'
    test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

 drivers/media/i2c/imx219.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index ef2b1a6a0f4a..ba1c5e59ddf4 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1503,7 +1503,8 @@ static int imx219_probe(struct i2c_client *client)
 
 	/* Initialize subdev */
 	imx219->sd.internal_ops = &imx219_internal_ops;
-	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			    V4L2_SUBDEV_FL_HAS_EVENTS;
 	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	/* Initialize source pad */
-- 
2.17.1

