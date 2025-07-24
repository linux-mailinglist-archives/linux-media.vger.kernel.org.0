Return-Path: <linux-media+bounces-38402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BA4B10CFC
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8A6BAC4656
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A352EA756;
	Thu, 24 Jul 2025 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e5FWXca7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E3E2EA493;
	Thu, 24 Jul 2025 14:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366263; cv=none; b=mzJl3ICt+ZSkyxXsGpldxTkmpf/sWJbELGJ8ktaTzg92KDwcRKToHU84O4b3IL6/1TFR3hylJJH6QYGmYViLwToo0CZEtG13uRAHIZS9ByLk4TqA4fiHeUj/5ShvWvP71Mkb2/ccfONlSOPYzEg9Cy21PlHCamJWSf7PXJ9L3VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366263; c=relaxed/simple;
	bh=Vmfy9P6HgOvkJ1o2D9ktCyX+PB0ofnZcx1ytCaFVfCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QXmdbh8EnfVHbH2Jt1mCajNHZExnxK+s6V8Q+2cMqUvXArxHLxhswa9ZfIjCRZ6wA07HsQccU8RwgRnYZByTciB+AxtArpkxuPg68fMqVFt6idtOQrRHw8r9L65vNb2EVK7oHG3duNBsK21kfkoShs1/KIkvYhcFIk6l+SzOvHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e5FWXca7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBD5F1A37;
	Thu, 24 Jul 2025 16:10:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366211;
	bh=Vmfy9P6HgOvkJ1o2D9ktCyX+PB0ofnZcx1ytCaFVfCs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e5FWXca7LlbJwCYMKZqouJ8vJW5NxXfPpEgJZqAPDd0bOIoz4Ic3Fn0iVaBckzNQT
	 R8w0DSh6jiiDF8uz82213695+XnlVBOWmojdIYYLYFMhxqIoyZXITz1yGWtCjivgaM
	 XXGqqpkPngpRtajtlfud5inEW5oSSc0d8FTVaIzs=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:26 +0200
Subject: [PATCH v2 19/27] media: mc-entity: Add link_validate_context
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-19-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3666;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Vmfy9P6HgOvkJ1o2D9ktCyX+PB0ofnZcx1ytCaFVfCs=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7QICvUpwUUHAHWbWnmWUel95FZ9qcwgzNxS
 0oqDL1ZzTiJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+0AAKCRByNAaPFqFW
 PHzjD/4xp+EwWa2WUaG5sW/TrEB0qMmWUkUDgbPEZc1cnQIHrW7C1xs8etc89pD+u/M+Fp0Lt18
 k1WIMI5r4IBbeFG0XAG3I2AZlGevhedWPrS4/CE6v+b8N0mIslNcTH6jKlIw+i+Zx1y74JDADNw
 /9dsneu6kjWuYpbI7KbzYEe64DJ50I6t93u5F8zVPGxlPL1M8uPMikcnHGclhIjOI7F3Tl6AXAR
 CldHHZALbqUsiRPbggI5q0QZxljQLeNl362AZzC1SL6p2WX5NQ/TTxfrx4YE/hlk4WyrwjbbG7g
 WYCWMMLg6A4i/u1XR4/wcdIJNl9yXrQ4k16UrzJGhq1t2wF+5+TtMsYjo1fDgoogqsGHOUPU1I5
 NR7PsDoHb8cd4WFjHlCZNoG+Ph0gKXlqTRMkbFgJbbWrMYuxNFtx0qYCtVfryKBwJcwpq6AbZp/
 SVGCJlfnyq1WqK0g3yQcbC+NwrjFKolBaayYC1R0RXTOlYi3WeWDUy4G8NVOSSg/05pSY6t9OW4
 1qC5IxvCIajRpSYQk8TuuXxBPmPQB8g2OQ2Yk1LT4WMh9Uk7MHPaMn1W7E0mHb2ohSsniAZv+Hd
 CT8ei06YXGtiGhnshIcDM+bkDwcEdlpQAw+lNm2SSkcpKrXBCCMd0qiFJfobjspBAqQp2Fn4iE3
 sLKOnx+KopjACjg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add an 'override' of the link_validate() media entity operation that
accepts a media_device_context as second argument to allow entities
to validate the link state in the provided media_device context.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 23 +++++++++++++++++++----
 include/media/media-entity.h |  6 ++++++
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index f421d6d74630bb96400d39d805c5db5d3d1ff913..675ceaede0d10a2420b8ea6a89e5963dcfde5ffe 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -884,6 +884,8 @@ __media_pipeline_start_context(struct media_pad *origin,
 		 * the connected sink pad to avoid duplicating checks.
 		 */
 		for_each_media_entity_data_link(entity, link) {
+			const struct media_entity_operations *ops;
+
 			/* Skip links unrelated to the current pad. */
 			if (link->sink != pad && link->source != pad)
 				continue;
@@ -902,13 +904,23 @@ __media_pipeline_start_context(struct media_pad *origin,
 			if (link->sink != pad)
 				continue;
 
-			if (!entity->ops || !entity->ops->link_validate)
+			ops = entity->ops;
+			if (!ops || (!ops->link_validate &&
+				     !ops->link_validate_context))
 				continue;
 
-			ret = entity->ops->link_validate(link);
+			if (mdev_context && ops->link_validate_context)
+				ret = ops->link_validate_context(link,
+								 mdev_context);
+			else
+				ret = entity->ops->link_validate(link);
+
 			if (ret) {
 				dev_dbg(mdev->dev,
-					"Link '%s':%u -> '%s':%u failed validation: %d\n",
+					"%sink '%s':%u -> '%s':%u failed validation: %d\n",
+					(mdev_context &&
+					 ops->link_validate_context) ?
+					"Context l" : "L",
 					link->source->entity->name,
 					link->source->index,
 					link->sink->entity->name,
@@ -917,7 +929,10 @@ __media_pipeline_start_context(struct media_pad *origin,
 			}
 
 			dev_dbg(mdev->dev,
-				"Link '%s':%u -> '%s':%u is valid\n",
+				"%sink '%s':%u -> '%s':%u is valid\n",
+				(mdev_context &&
+				 ops->link_validate_context) ?
+				"Context l" : "L",
 				link->source->entity->name,
 				link->source->index,
 				link->sink->entity->name,
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index b60c311ab390beb6931fe8f2bbe8939e11cda452..b053a0baee4031a464edf506d3d131bacb810f81 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -295,6 +295,10 @@ struct media_entity_context {
  * @link_validate:	Return whether a link is valid from the entity point of
  *			view. The media_pipeline_start() function
  *			validates all links by calling this operation. Optional.
+ * @link_validate_context: Return whether a link is valid from the entity
+ *			context point of view. The
+ *			media_pipeline_start_context() function validates all
+ *			links calling this operation. Optional.
  * @has_pad_interdep:	Return whether two pads of the entity are
  *			interdependent. If two pads are interdependent they are
  *			part of the same pipeline and enabling one of the pads
@@ -327,6 +331,8 @@ struct media_entity_operations {
 			  const struct media_pad *local,
 			  const struct media_pad *remote, u32 flags);
 	int (*link_validate)(struct media_link *link);
+	int (*link_validate_context)(struct media_link *link,
+				     struct media_device_context *mdev_context);
 	bool (*has_pad_interdep)(struct media_entity *entity, unsigned int pad0,
 				 unsigned int pad1);
 	int (*alloc_context)(struct media_entity *entity,

-- 
2.49.0


