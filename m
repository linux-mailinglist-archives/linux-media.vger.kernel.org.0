Return-Path: <linux-media+bounces-37983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5142DB08B42
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F85B7BBC33
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C792D2D6401;
	Thu, 17 Jul 2025 10:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DABlrK2a"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD052D3219;
	Thu, 17 Jul 2025 10:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749176; cv=none; b=KnqnWLX8/eTEE9os83DfSCtVuQ5uSylZ1elvAgIk/ym0MMxs/FE9Sn2+BenpPrmqNoZ+ABB08RxFT+nCZZuMK5PYVIDWadfVz0LXsK93iTa/Mcp1Cnc80ewD+nhjmW502YdlD3vfepZCMu70gbuZqQRces/wLC8XbHyl5ousTwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749176; c=relaxed/simple;
	bh=Vmfy9P6HgOvkJ1o2D9ktCyX+PB0ofnZcx1ytCaFVfCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A3Nbn4tn2jV91V4a1bnGFwHQcjNJ687WIJCLC46J1jqHkqEfHVdNtrTNffHC8mrgYS14Z/x+YWdJspAlmmLiVZdYvCwvmguQiHj+nOP0RoJwBsAiZwIO6kY5vhK8/d68uK78kp3HXgwpf9bHkmuE5EqFHLvmP/mo8NDMrcsC1Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DABlrK2a; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DFD71AE2;
	Thu, 17 Jul 2025 12:45:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749138;
	bh=Vmfy9P6HgOvkJ1o2D9ktCyX+PB0ofnZcx1ytCaFVfCs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DABlrK2a88A3r8J+z6KrObawZ6hDRn+XgUPs6DOolXJBUpaQReEFGJrSKwsBmUYMb
	 pA0aR02ddyUOK3QAbnifhFNJ+NdGsrWGWfjbcoKFAUQ0/tO6xEkQ9SfrT3XuyMv4h5
	 ZWCWArDZcBlgLr48GxuYfzDBnGbmmERUGvYyr2Qk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:45 +0200
Subject: [PATCH 19/26] media: mc-entity: Add link_validate_context
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-19-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRRQX0z9nktE5CicUsI35GLyrxFYdwvWu01o
 DbQVnGZFZmJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUUQAKCRByNAaPFqFW
 PLSyEACEMz3OzJzaHE7EGoRK0sBcANROBQuYYp7GHepcJ/nUiptjHw6rgsK41gGAoCbT/xnTP1s
 BMornojg9rzbreAVIJzUwEvOoEXg6O9lY+chAy1gcx32ZqW/l1BUtBtxRzDOb/ghXJ7WHaj0Cc/
 Wg1Ub/whqUwrpm2kvuRsUoT6WgQAxvs7KqaUNXyfThxEeiu8bVgjUUMTSTkWCljGuzuASQFA4q2
 tX2D3kMo7pMRc+gsTJGFeJqWSPFRwAUKl2f1zCVH9WubuIeu93G/7OVZ2CV3lXPHn5HdiEia0KY
 X4EOWGEoZt1DO2AuTY67kZj6SEOETWqImcTKGi13BALMPCjsMzlPpinSYQ7lZ9UYAjvrmFgmA+d
 igXtW2xOWHbiMNXJNCkCooqG3VPV4SIdtYqchrn/P4b71vkOgye0YG7Jaw8/IaHip/EloiAblA6
 ywriQzyhd6EoaeJLWEWhZnvQjCA4v4bBgeZcmSYb5IeowEiZ8HwqyQKMROifa+N4qJOf4FUmCg3
 VOnZ8M/30upNjPEK7nU0Amvcbj/Snw2ZSlPFMGMb/OGsVGN5068Tb40oa+bn4212ThCCtHSNSF5
 ueysf/7Gz9j80UKcs5L+fSMFJKTXCRx3zugNHzqN6gEisRT4X8sn3Tz+ktaIt7tJsoy5xwF98tU
 5MtaPun5X8+POGQ==
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


