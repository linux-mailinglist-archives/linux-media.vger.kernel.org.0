Return-Path: <linux-media+bounces-36735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A52BAF8398
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 00:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B46B546543
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3172D2C15BF;
	Thu,  3 Jul 2025 22:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nQ13FWZF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006432C1592;
	Thu,  3 Jul 2025 22:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582358; cv=none; b=YrMlBFn2b29ctGHEBL7NISYl8mmncOELhBRbJsEb+Ptx/FR7nroWJ9Q2RwjYw4xaag0Ky7BBPZXbKN3W+MrYmdqaPvs/RST7t/u27f/VDfO9g6e62LDnM1BBJYVB2Yv7rbuFbCpy3xTcbbTuNSXKXtyBbSPQa2mBQXbfEHqimVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582358; c=relaxed/simple;
	bh=MSk+4hr7HqroUsb4zzuabeowWIqpwVnqcR60xm8cFUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pGrtv5qIWGWKA/Uop0P92WuN54iXe6GkqehfBjvTc4oiI7l0DDvbcFTOgb5j5iTlTl/0w1Hr4c/BUL31woSza1zN0G5bLWQ75tQqUkdqVkXXgU+OAhgddeuYriCZaPxz433G+sQywp5YzF4i39ULcCTEO6I+iBW5dq/EKLZpcMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nQ13FWZF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 639A8669;
	Fri,  4 Jul 2025 00:38:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751582323;
	bh=MSk+4hr7HqroUsb4zzuabeowWIqpwVnqcR60xm8cFUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nQ13FWZF9EgB4Vs3FRwt9xF37XJr/H+1kuiRjjr5T5v3c1COwX2m9JbejLRfMdC3G
	 MWPj973YC8L9uy2E0SK60Ev4eHyNbVE4f5VKqVmM4Ur79w9Y5cNVoRkQ6M/wqv/+in
	 nnyk30y0Qsgt/pECip7d4Z0HSyrD+ibowQFRwMcg=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 8/8] media: renesas: vsp1: Implement control events
Date: Fri,  4 Jul 2025 01:38:26 +0300
Message-ID: <20250703223826.10246-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703223826.10246-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250703223826.10246-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The V4L2 API requires drivers that expose controls to implement control
notification events. This is enforced by v4l2-compliance. Add event
handling to the VSP1 entities that create controls to fix the compliance
failures.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_brx.c    | 1 +
 drivers/media/platform/renesas/vsp1/vsp1_clu.c    | 1 +
 drivers/media/platform/renesas/vsp1/vsp1_entity.c | 9 +++++++++
 drivers/media/platform/renesas/vsp1/vsp1_entity.h | 2 ++
 drivers/media/platform/renesas/vsp1/vsp1_histo.c  | 1 +
 drivers/media/platform/renesas/vsp1/vsp1_lut.c    | 1 +
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c   | 1 +
 drivers/media/platform/renesas/vsp1/vsp1_sru.c    | 1 +
 8 files changed, 17 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index 911359faa600..b1a2c68e9944 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -269,6 +269,7 @@ static const struct v4l2_subdev_pad_ops brx_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops brx_ops = {
+	.core	= &vsp1_entity_core_ops,
 	.pad    = &brx_pad_ops,
 };
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_clu.c b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
index a56c038a2c71..04c466c4da81 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_clu.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
@@ -130,6 +130,7 @@ static const struct v4l2_subdev_pad_ops clu_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops clu_ops = {
+	.core	= &vsp1_entity_core_ops,
 	.pad    = &clu_pad_ops,
 };
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index 892a2adfdf3a..839b75b62ceb 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -14,6 +14,7 @@
 
 #include <media/media-entity.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-subdev.h>
 
 #include "vsp1.h"
@@ -396,6 +397,11 @@ static const struct v4l2_subdev_internal_ops vsp1_entity_internal_ops = {
 	.init_state = vsp1_entity_init_state,
 };
 
+const struct v4l2_subdev_core_ops vsp1_entity_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 /* -----------------------------------------------------------------------------
  * Media Operations
  */
@@ -639,6 +645,9 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 	subdev->entity.ops = &vsp1->media_ops;
 	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
+	if (ops->core == &vsp1_entity_core_ops)
+		subdev->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
+
 	snprintf(subdev->name, sizeof(subdev->name), "%s %s",
 		 dev_name(vsp1->dev), name);
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
index 88daf83cd1ab..c0c1fe7d3e40 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
@@ -143,6 +143,8 @@ static inline struct vsp1_entity *to_vsp1_entity(struct v4l2_subdev *subdev)
 	return container_of(subdev, struct vsp1_entity, subdev);
 }
 
+extern const struct v4l2_subdev_core_ops vsp1_entity_core_ops;
+
 int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 		     const char *name, unsigned int num_pads,
 		     const struct v4l2_subdev_ops *ops, u32 function);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index a1b3671a0873..158d01aa5e81 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -370,6 +370,7 @@ static const struct v4l2_subdev_pad_ops histo_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops histo_ops = {
+	.core	= &vsp1_entity_core_ops,
 	.pad    = &histo_pad_ops,
 };
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lut.c b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
index 2ec4d596465d..94bdedcc5c92 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_lut.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
@@ -106,6 +106,7 @@ static const struct v4l2_subdev_pad_ops lut_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops lut_ops = {
+	.core	= &vsp1_entity_core_ops,
 	.pad    = &lut_pad_ops,
 };
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index c9e6fb98f863..c72518b29f84 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -357,6 +357,7 @@ static const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops = {
 };
 
 const struct v4l2_subdev_ops vsp1_rwpf_subdev_ops = {
+	.core	= &vsp1_entity_core_ops,
 	.pad    = &vsp1_rwpf_pad_ops,
 };
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
index 37fd36d09045..94149da0c900 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
@@ -252,6 +252,7 @@ static const struct v4l2_subdev_pad_ops sru_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops sru_ops = {
+	.core	= &vsp1_entity_core_ops,
 	.pad    = &sru_pad_ops,
 };
 
-- 
Regards,

Laurent Pinchart


