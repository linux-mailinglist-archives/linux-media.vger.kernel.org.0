Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E1B38E461
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 12:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232706AbhEXKqU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 06:46:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60914 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232689AbhEXKqO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 06:46:14 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E43F3274;
        Mon, 24 May 2021 12:44:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621853084;
        bh=uiGYlaKwLktgOFCENKD/bNHb25wlUxxvwQNikmhc/gc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fdDt5ux4QJzFwzNrZfQbXAx5zZlLwViHnqQxJBqZTV70TMsKysIIj4hjBlFczO0+g
         lCt1NPHtdz7ldvkQV657xF+NMHtYOkif0lE7ApNDSOCr9YpgIvlsX+fZjVmelES/4w
         /gEcAMht8K2f5501oMCJtFq1yJiH4AVJmoVrkDVg=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v7 20/27] v4l: subdev: add V4L2_SUBDEV_ROUTE_FL_SOURCE
Date:   Mon, 24 May 2021 13:44:01 +0300
Message-Id: <20210524104408.599645-21-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add route flag to indicate that the route is a source route. This means
that the route does not lead anywhere, and the sink_pad and sink_stream
should not be used.

A sensor which provides multiple streams should implement get_routing
and use the flag to mark the routes as sources.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/uapi/linux/v4l2-subdev.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 45c01799e2cd..f20491e1f53f 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -200,6 +200,13 @@ struct v4l2_subdev_capability {
  */
 #define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		BIT(1)
 
+/**
+ * Is the route a source endpoint? A source endpoint route doesn't come
+ * from "anywhere", and the sink_pad and sink_stream fields are unused.
+ * Set by the driver.
+ */
+#define V4L2_SUBDEV_ROUTE_FL_SOURCE		BIT(2)
+
 /**
  * struct v4l2_subdev_route - A route inside a subdev
  *
-- 
2.25.1

