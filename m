Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23581463660
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242136AbhK3OUU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:20 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41006 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242138AbhK3OUG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:20:06 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93E931447;
        Tue, 30 Nov 2021 15:16:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281804;
        bh=DRLJ+R0TbbvqigB5q68R6rhX+XyW5CJQPCSMtDNY2hs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Eem041pz/B7KdRvPN+I4T3FvMvbbzvl4AJNW6sQpvD0Y2FMQJaEwbb5ZEH5XMLJeg
         blmvnl2Utt6TPFQtvgEkvMoDxWeomAsSn1Y0/eVx8/vPaZb/jo3AXKMblPtZbDwaMy
         3Hp4a8890S3W5lLyZDmNVbu0dmWqU+GJEs76TqHI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v10 14/38] media: entity: Add has_route entity operation
Date:   Tue, 30 Nov 2021 16:15:12 +0200
Message-Id: <20211130141536.891878-15-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
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
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/media/media-entity.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 516d73a2941e..ad4020b2df65 100644
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

