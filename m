Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE2E2333C86
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 13:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbhCJMUz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 07:20:55 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:51390 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232650AbhCJMUv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 07:20:51 -0500
X-IronPort-AV: E=Sophos;i="5.81,237,1610377200"; 
   d="scan'208";a="74701229"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 10 Mar 2021 21:20:50 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 62CC040108E4;
        Wed, 10 Mar 2021 21:20:47 +0900 (JST)
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
Subject: [PATCH 1/3] media: i2c: imx219: Enable vflip and hflip controls on stream stop
Date:   Wed, 10 Mar 2021 12:20:12 +0000
Message-Id: <20210310122014.28353-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310122014.28353-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210310122014.28353-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable vflip and hflip controls in resume error path when streaming
is stopped.

Fixes: 1283b3b8f82b9 ("media: i2c: Add driver for Sony IMX219 sensor")
Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/imx219.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 6e3382b85a90..f0cf1985a4dc 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1195,6 +1195,8 @@ static int __maybe_unused imx219_resume(struct device *dev)
 error:
 	imx219_stop_streaming(imx219);
 	imx219->streaming = false;
+	__v4l2_ctrl_grab(imx219->vflip, false);
+	__v4l2_ctrl_grab(imx219->hflip, false);
 
 	return ret;
 }
-- 
2.17.1

