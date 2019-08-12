Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9FA898BE
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 10:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbfHLIfQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 04:35:16 -0400
Received: from retiisi.org.uk ([95.216.213.190]:40014 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726834AbfHLIfP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 04:35:15 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 50B52634C8C;
        Mon, 12 Aug 2019 11:35:11 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 2/2] omap3isp: Don't set streaming state on random subdevs
Date:   Mon, 12 Aug 2019 11:32:27 +0300
Message-Id: <20190812083227.11838-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190812083227.11838-1-sakari.ailus@linux.intel.com>
References: <20190812083227.11838-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The streaming state should be set to the first upstream sub-device only,
not everywhere, for a sub-device driver itself knows how to best control
the streaming state of its own upstream sub-devices.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/omap3isp/isp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index 008933beebe0..52533cdafb47 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -722,6 +722,10 @@ static int isp_pipeline_enable(struct isp_pipeline *pipe,
 					s_stream, mode);
 			pipe->do_propagation = true;
 		}
+
+		/* Stop at the first external sub-device. */
+		if (subdev->dev != isp->dev)
+			break;
 	}
 
 	return 0;
@@ -836,6 +840,10 @@ static int isp_pipeline_disable(struct isp_pipeline *pipe)
 						      &subdev->entity);
 			failure = -ETIMEDOUT;
 		}
+
+		/* Stop at the first external sub-device. */
+		if (subdev->dev != isp->dev)
+			break;
 	}
 
 	return failure;
-- 
2.20.1

