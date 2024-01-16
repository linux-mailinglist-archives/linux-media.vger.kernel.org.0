Return-Path: <linux-media+bounces-3737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D4B82EB06
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 09:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E79E28544A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 08:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF2C125D8;
	Tue, 16 Jan 2024 08:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OEgF4wKx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9861F125B6
	for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE2941C1D;
	Tue, 16 Jan 2024 09:41:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705394493;
	bh=3cmzIRmFW1FNJUmwuHQpgeo9KnEpDoLH4NA7t6WG0r0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OEgF4wKxddZSeIQmVlZpkzQQPF+FZ1grITYVh22/70QMy1q5b8808sxiM3ZMOSOIs
	 FVnZUowmQd4XJme0cBp/OVeN8fv3T0FF1lDvfpOBtQZ3FyZ4AlBHSVwPqpvYyIlR8P
	 GNOTJiZ9c0CagRtbm9NoumU0CK1XCjInyjTX3GF0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Marek Vasut <marex@denx.de>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tim Harvey <tharvey@gateworks.com>,
	Purism Kernel Team <kernel@puri.sm>
Subject: [PATCH v2 4/7] media: mc: Add num_links flag to media_pad
Date: Tue, 16 Jan 2024 10:42:37 +0200
Message-ID: <20240116084240.14228-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116084240.14228-1-laurent.pinchart@ideasonboard.com>
References: <20240116084240.14228-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Maintain a counter of the links connected to a pad in the media_pad
structure. This helps checking if a pad is connected to anything, which
will be used in the pipeline building code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-entity.c | 6 ++++++
 include/media/media-entity.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 7839e3f68efa..c2d8f59b62c1 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1038,6 +1038,9 @@ static void __media_entity_remove_link(struct media_entity *entity,
 
 	/* Remove the reverse links for a data link. */
 	if ((link->flags & MEDIA_LNK_FL_LINK_TYPE) == MEDIA_LNK_FL_DATA_LINK) {
+		link->source->num_links--;
+		link->sink->num_links--;
+
 		if (link->source->entity == entity)
 			remote = link->sink->entity;
 		else
@@ -1143,6 +1146,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
 	sink->num_links++;
 	source->num_links++;
 
+	link->source->num_links++;
+	link->sink->num_links++;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(media_create_pad_link);
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 2b6cd343ee9e..4d95893c8984 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -225,6 +225,7 @@ enum media_pad_signal_type {
  * @graph_obj:	Embedded structure containing the media object common data
  * @entity:	Entity this pad belongs to
  * @index:	Pad index in the entity pads array, numbered from 0 to n
+ * @num_links:	Number of links connected to this pad
  * @sig_type:	Type of the signal inside a media pad
  * @flags:	Pad flags, as defined in
  *		:ref:`include/uapi/linux/media.h <media_header>`
@@ -236,6 +237,7 @@ struct media_pad {
 	struct media_gobj graph_obj;	/* must be first field in struct */
 	struct media_entity *entity;
 	u16 index;
+	u16 num_links;
 	enum media_pad_signal_type sig_type;
 	unsigned long flags;
 
-- 
Regards,

Laurent Pinchart


