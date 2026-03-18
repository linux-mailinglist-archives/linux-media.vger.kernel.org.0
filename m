Return-Path: <linux-media+bounces-56263-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNP2BcY8u2lmhQIAu9opvQ
	(envelope-from <linux-media+bounces-56263-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 01:01:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 647562C4007
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 01:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D35431801BE
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 23:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2719393DF7;
	Wed, 18 Mar 2026 23:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d9lvMXYn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC673939A9;
	Wed, 18 Mar 2026 23:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878372; cv=none; b=NoAPBOQeqx6qb8Dra9PvmNF4KYIxrzVgSFWQl8lSVs4ElA0BSpir7/Sa8+C9UtrtRYjgRhpJgPXWX+Isd8r4xpBUkot1mKYhens4XNX7yH/tMbst5FrUAgPA788GCCS+EKayLWniqRenoCPZhZDQ4noo7QHlKx2TyJWQXgi5GV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878372; c=relaxed/simple;
	bh=rrQNX5wxweD5NpUm7q+XP4pilkDDbos6uWnaJ3qXhQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DuTirarJgpIQ2VhmKDdLGtVJ7HisyOTxzfD5YQAixtEmNrRD20y8yNbaIYQwcVVPc8CyJ1fzKilEd0BGpc8rK2LOT2mR0kmfufCtEkQRr6wRSKcX6llS9QRGfH5uqm+DVWFIsGB2rYJzCNjVs0ya0Ue+ocjQksySKklYU+/rGww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d9lvMXYn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D4F431777;
	Thu, 19 Mar 2026 00:58:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773878292;
	bh=rrQNX5wxweD5NpUm7q+XP4pilkDDbos6uWnaJ3qXhQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d9lvMXYniwoAKJyS+bSu0AG/y8eYBSYRfLbvhN9uN83kL8QCp91a5JPCX8hvEc2UH
	 AaRJpzfqjmSNJKX18YtwNhKFtHdMC70YxMIbmtKa0Co2ChpMkeytI/FnumaBmVFPqJ
	 dT67HebsRoLY4D3iiIaj3PyWzYvUFYMpd757Ao6Y=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 12/13] media: renesas: vsp1: Implement control events
Date: Thu, 19 Mar 2026 01:59:06 +0200
Message-ID: <20260318235907.831556-13-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56263-lists,linux-media=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ragnatech.se:email]
X-Rspamd-Queue-Id: 647562C4007
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The V4L2 API requires drivers that expose controls to implement control
notification events. This is enforced by v4l2-compliance. Add event
handling to the VSP1 entities that create controls to fix the compliance
failures.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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
index 79da56c456eb..3f87a2c9df0e 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -424,6 +424,7 @@ static const struct v4l2_subdev_pad_ops histo_pad_ops = {
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


