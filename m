Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6452F376546
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 14:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236662AbhEGMiC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 08:38:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59674 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236599AbhEGMiA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 08:38:00 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 465DDF88;
        Fri,  7 May 2021 14:36:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620391020;
        bh=uiGYlaKwLktgOFCENKD/bNHb25wlUxxvwQNikmhc/gc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oaDZRtOoLA4BLJsDjU3YiHneE9whU+rR/eI+B8U2bLzVAFtip8+jZAXrwcF/FCG8J
         oIcwNtvxfQp8LV9vOud5uMG6zA1wxcvQo+ovOVfHhbJwoWw2TH8KC+PgMba9yNuJQp
         AAyAO5xtGcsWTBHzvTlESPLoXQea1l5pUZZhKsx4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, john.wei@mediatek.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [RFC 05/11] v4l: subdev: add V4L2_SUBDEV_ROUTE_FL_SOURCE
Date:   Fri,  7 May 2021 15:35:52 +0300
Message-Id: <20210507123558.146948-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210507123558.146948-1-tomi.valkeinen@ideasonboard.com>
References: <20210507123558.146948-1-tomi.valkeinen@ideasonboard.com>
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

