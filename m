Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A1E333C8B
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 13:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232815AbhCJMV0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 07:21:26 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:54059 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232621AbhCJMUy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 07:20:54 -0500
X-IronPort-AV: E=Sophos;i="5.81,237,1610377200"; 
   d="scan'208";a="74452145"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 10 Mar 2021 21:20:53 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 922AA40108E4;
        Wed, 10 Mar 2021 21:20:50 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Pavel Machek <pavel@denx.de>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 2/3] media: i2c: imx219: Serialize during stream start/stop
Date:   Wed, 10 Mar 2021 12:20:13 +0000
Message-Id: <20210310122014.28353-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310122014.28353-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210310122014.28353-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Serialize during stream start/stop in suspend/resume callbacks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/imx219.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f0cf1985a4dc..87c021de1460 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1172,8 +1172,10 @@ static int __maybe_unused imx219_suspend(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx219 *imx219 = to_imx219(sd);
 
+	mutex_lock(&imx219->mutex);
 	if (imx219->streaming)
 		imx219_stop_streaming(imx219);
+	mutex_unlock(&imx219->mutex);
 
 	return 0;
 }
@@ -1184,11 +1186,13 @@ static int __maybe_unused imx219_resume(struct device *dev)
 	struct imx219 *imx219 = to_imx219(sd);
 	int ret;
 
+	mutex_lock(&imx219->mutex);
 	if (imx219->streaming) {
 		ret = imx219_start_streaming(imx219);
 		if (ret)
 			goto error;
 	}
+	mutex_unlock(&imx219->mutex);
 
 	return 0;
 
@@ -1197,6 +1201,7 @@ static int __maybe_unused imx219_resume(struct device *dev)
 	imx219->streaming = false;
 	__v4l2_ctrl_grab(imx219->vflip, false);
 	__v4l2_ctrl_grab(imx219->hflip, false);
+	mutex_unlock(&imx219->mutex);
 
 	return ret;
 }
-- 
2.17.1

