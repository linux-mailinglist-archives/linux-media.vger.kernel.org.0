Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8772F977E
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 02:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730963AbhARBzU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jan 2021 20:55:20 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35662 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730878AbhARBzS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jan 2021 20:55:18 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 9D8431F44A2D
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
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
Subject: [PATCH v2 11/14] media: v4l2-async: Fix incorrect comment
Date:   Sun, 17 Jan 2021 22:52:55 -0300
Message-Id: <20210118015258.3993-12-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118015258.3993-1-ezequiel@collabora.com>
References: <20210118015258.3993-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_async_notifier_cleanup() documentation mentions
v4l2_fwnode_reference_parse_sensor_common, which was actually
introduced as v4l2_async_notifier_parse_fwnode_sensor_common(),
in commit 7a9ec808ad46 ("media: v4l: fwnode: Add convenience function for
parsing common external refs").

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 include/media/v4l2-async.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 55bfb27e404e..2144502c95e0 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -242,7 +242,7 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
  * notifier after calling
  * @v4l2_async_notifier_add_subdev,
  * @v4l2_async_notifier_parse_fwnode_endpoints or
- * @v4l2_fwnode_reference_parse_sensor_common.
+ * @v4l2_async_notifier_parse_fwnode_sensor_common.
  *
  * There is no harm from calling v4l2_async_notifier_cleanup in other
  * cases as long as its memory has been zeroed after it has been
-- 
2.29.2

