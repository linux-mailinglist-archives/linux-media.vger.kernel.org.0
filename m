Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE1F3609FE
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbhDONFm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:05:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46132 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233018AbhDONFk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:05:40 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B0BE89A;
        Thu, 15 Apr 2021 15:05:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618491915;
        bh=dXk1SKU4jVk5zQlDs9r9noTJzxIqLwoqsHa1lF6XP7s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KXrgrkaFJxcR8AQySFjwmIpsQU7wsNJGowctIT98cv4AfjfScoL0ZLA8m+mtiIaW9
         6Kxir2K/wfu6WGobSkGJfn0LIbX8dnmmkbOeuSiFtm3tWUSJBW4ACX4cZ4FOO1gxHS
         5+fN6GDFV3EeFWGYeXCvoOmicf6RsTfN9wRsQ6PU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v5 08/24] media: entity: Add has_route entity operation
Date:   Thu, 15 Apr 2021 16:04:34 +0300
Message-Id: <20210415130450.421168-9-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The optional operation can be used by entities to report whether two
pads are internally connected.

While at there, fix a Sphinx compiler warning in a comment block a few
lines above.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/media/media-entity.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index d60ff8bf3f9e..466e4357a082 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -187,6 +187,7 @@ enum media_pad_signal_type {
  * @flags:	Pad flags, as defined in
  *		:ref:`include/uapi/linux/media.h <media_header>`
  *		(seek for ``MEDIA_PAD_FL_*``)
+ *
  * .. note::
  *
  *    @stream_count reference count must never be negative, but is a signed
@@ -214,6 +215,10 @@ struct media_pad {
  * @link_validate:	Return whether a link is valid from the entity point of
  *			view. The media_pipeline_start() function
  *			validates all links by calling this operation. Optional.
+ * @has_route:		Return whether a route exists inside the entity between
+ *			two given pads. Pads are passed to the operation ordered
+ *			by index. Optional: If the operation isn't implemented
+ *			all pads will be considered as connected.
  *
  * .. note::
  *
@@ -227,6 +232,8 @@ struct media_entity_operations {
 			  const struct media_pad *local,
 			  const struct media_pad *remote, u32 flags);
 	int (*link_validate)(struct media_link *link);
+	bool (*has_route)(struct media_entity *entity, unsigned int pad0,
+			  unsigned int pad1);
 };
 
 /**
-- 
2.25.1

