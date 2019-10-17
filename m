Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB9ADAB19
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 13:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406044AbfJQLWS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 07:22:18 -0400
Received: from retiisi.org.uk ([95.216.213.190]:39736 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405859AbfJQLWS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 07:22:18 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 0B004634C8F
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 14:21:48 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 7/7] omap3isp: Ignore failure of stopping streaming on external subdev
Date:   Thu, 17 Oct 2019 14:18:56 +0300
Message-Id: <20191017111856.10270-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017111856.10270-1-sakari.ailus@linux.intel.com>
References: <20191017111856.10270-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The isp was marked to have failed to stop if stopping streaming on an
external subdev failed. The return value from the external subdev should
be ignored instead as it is not part of the ISP and thus the ISP does not
need to be reset for that reason.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/omap3isp/isp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index 327c5716922a..a4ee6b86663e 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -810,6 +810,10 @@ static int isp_pipeline_disable(struct isp_pipeline *pipe)
 
 		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
 
+		/* Stop at the first external sub-device. */
+		if (subdev->dev != isp->dev)
+			break;
+
 		if (subdev == &isp->isp_res.subdev)
 			ret |= isp_pipeline_wait(isp, isp_pipeline_wait_resizer);
 		else if (subdev == &isp->isp_prev.subdev)
@@ -837,10 +841,6 @@ static int isp_pipeline_disable(struct isp_pipeline *pipe)
 						      &subdev->entity);
 			failure = -ETIMEDOUT;
 		}
-
-		/* Stop at the first external sub-device. */
-		if (subdev->dev != isp->dev)
-			break;
 	}
 
 	return failure;
-- 
2.20.1

