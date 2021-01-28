Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20E7D3075C9
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 13:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbhA1MRB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 07:17:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbhA1MQn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 07:16:43 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 836AEC061786
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 04:14:39 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 89363634C98;
        Thu, 28 Jan 2021 14:12:39 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v4 11/14] media: v4l2-async: Fix incorrect comment
Date:   Thu, 28 Jan 2021 14:09:42 +0200
Message-Id: <20210128120945.5062-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128120945.5062-1-sakari.ailus@linux.intel.com>
References: <20210128120945.5062-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ezequiel Garcia <ezequiel@collabora.com>

The v4l2_async_notifier_cleanup() documentation mentions
v4l2_fwnode_reference_parse_sensor_common, which was actually
introduced as v4l2_async_notifier_parse_fwnode_sensor_common(),
in commit 7a9ec808ad46 ("media: v4l: fwnode: Add convenience function for
parsing common external refs").

The function drivers do use is
v4l2_async_register_subdev_sensor_common().

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-async.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 8815e233677e..f2cac0931372 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -250,7 +250,7 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
  * notifier after calling
  * @v4l2_async_notifier_add_subdev,
  * @v4l2_async_notifier_parse_fwnode_endpoints or
- * @v4l2_fwnode_reference_parse_sensor_common.
+ * @v4l2_async_register_subdev_sensor_common.
  *
  * There is no harm from calling v4l2_async_notifier_cleanup in other
  * cases as long as its memory has been zeroed after it has been
-- 
2.29.2

