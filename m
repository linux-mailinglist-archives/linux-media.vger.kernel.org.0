Return-Path: <linux-media+bounces-13637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0831490E0A8
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 02:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB4842846F4
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 00:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7F9B65D;
	Wed, 19 Jun 2024 00:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lIomFNA2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F55BAD5A;
	Wed, 19 Jun 2024 00:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756293; cv=none; b=u3FApLPrgqrpsSKNANuwyEc6LlpZSCFEGZRdlkQxP/7AjgflRtvu6M1kvql+ssQoDwDn0kQJg1ZaECl5k+W/48IuAHSmooADWoKDxV6MY3oMu/wfA4/hFr9COWv848Q2OEf+NwxpZIUDl8or56Lwasq8mo78rdoJnfi4behaKMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756293; c=relaxed/simple;
	bh=ZdpQAuDyc4jC6wU/NhwR3Qg4qVtBCILBku0ijhg50cA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UmdFuSIGZ/5S3iQS+cVga31fpZMnpxhQRPvIICrm20EnTze8fPZslqSL3G22kd74SICORkr797e4sU4miygtVLYm7DSROAdqScm7Ly1V2Q0MC9y7UKbgn54n1rB+QDXwkajY4cFwLnWvsNZSZjfYlkQ5t+ZFH0g6pbyjs9Coq9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lIomFNA2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DFB8121A;
	Wed, 19 Jun 2024 02:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718756267;
	bh=ZdpQAuDyc4jC6wU/NhwR3Qg4qVtBCILBku0ijhg50cA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lIomFNA200eoSRVJd1T0lhXQ70Pbm38L6IKvM75dAcIvAxrEq2UBiwuAs7jU+tWfL
	 7s0yc28tEOnDpG4OUkRCV9s80e6qJuUI4khQCkXaQywn5MpEpniJWQxF7113oLk7Z6
	 +hHKHsnCsRN8ha1pB3hQqjf+VyQ4fpcoCO9q7mA4=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 15/19] media: renesas: vsp1: Name parameters to entity operations
Date: Wed, 19 Jun 2024 03:17:18 +0300
Message-ID: <20240619001722.9749-16-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl complains when function arguments are not named:

WARNING: function definition argument 'struct vsp1_entity *' should also have an identifier name
+       void (*configure_stream)(struct vsp1_entity *,

In preparation for reworking some of the vsp1_entity_operations
functions, fix the warnings for the existing ones.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_entity.h | 35 +++++++++++--------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
index f67f60677644..42000d6e2530 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
@@ -77,20 +77,27 @@ struct vsp1_route {
  *		configuration.
  */
 struct vsp1_entity_operations {
-	void (*destroy)(struct vsp1_entity *);
-	void (*configure_stream)(struct vsp1_entity *, struct vsp1_pipeline *,
-				 struct vsp1_dl_list *, struct vsp1_dl_body *);
-	void (*configure_frame)(struct vsp1_entity *, struct vsp1_pipeline *,
-				struct vsp1_dl_list *, struct vsp1_dl_body *);
-	void (*configure_partition)(struct vsp1_entity *,
-				    struct vsp1_pipeline *,
-				    const struct vsp1_partition *,
-				    struct vsp1_dl_list *,
-				    struct vsp1_dl_body *);
-	unsigned int (*max_width)(struct vsp1_entity *, struct vsp1_pipeline *);
-	void (*partition)(struct vsp1_entity *, struct vsp1_pipeline *,
-			  struct vsp1_partition *, unsigned int,
-			  struct v4l2_rect *);
+	void (*destroy)(struct vsp1_entity *entity);
+	void (*configure_stream)(struct vsp1_entity *entity,
+				 struct vsp1_pipeline *pipe,
+				 struct vsp1_dl_list *dl,
+				 struct vsp1_dl_body *dlb);
+	void (*configure_frame)(struct vsp1_entity *entity,
+				struct vsp1_pipeline *pipe,
+				struct vsp1_dl_list *dl,
+				struct vsp1_dl_body *dlb);
+	void (*configure_partition)(struct vsp1_entity *entity,
+				    struct vsp1_pipeline *pipe,
+				    const struct vsp1_partition *partition,
+				    struct vsp1_dl_list *dl,
+				    struct vsp1_dl_body *dlb);
+	unsigned int (*max_width)(struct vsp1_entity *entity,
+				  struct vsp1_pipeline *pipe);
+	void (*partition)(struct vsp1_entity *entity,
+			  struct vsp1_pipeline *pipe,
+			  struct vsp1_partition *partition,
+			  unsigned int index,
+			  struct v4l2_rect *window);
 };
 
 struct vsp1_entity {
-- 
Regards,

Laurent Pinchart


