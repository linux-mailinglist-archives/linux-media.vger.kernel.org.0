Return-Path: <linux-media+bounces-13345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6853690A0C2
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0028CB214CF
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC63745C2;
	Sun, 16 Jun 2024 23:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gLvZbf8S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F077345A
	for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 23:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718579661; cv=none; b=WuvOL7CQ+a0SSyHfNJiAWE4PcDC51w0j5kQ2Z/AQEjfqBSfyKg5wl8o8Nfjh6gmEjnJgvCHmTm4utEyh09CkVxdse3lsoY6Fu9GjjcKd+eqXdai4/JpCwuecm/n1GmDfYq85P04Ei6uJvQM7KKkmnYx728xbz6+ZYumPRXcYxi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718579661; c=relaxed/simple;
	bh=H5gFCxM5ZtD6VWkeBrflQKvbg7sP54TEmfsVdp6cLYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6J9msM5p7OTbI7oiGOQPucD+91cmK7iicVDNKe2zivIjb6LkEDF/VH6krW3xcpKFisSjjgB1gtSllBxEd78rE+srDJd0ym8GoJ3zo/EsY0plOEoCWzn02Hc487Xe3n+fcasIMd9h6ATMqHT9wBaxpYQVaJzMt+HehDt5ocqIFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gLvZbf8S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FBB3AF3;
	Mon, 17 Jun 2024 01:14:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718579641;
	bh=H5gFCxM5ZtD6VWkeBrflQKvbg7sP54TEmfsVdp6cLYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gLvZbf8SkVf098A8z5Xn5Em42uQC4cmTPvjVazNHCdwFB192CEyi86cnYmxoP9Kw6
	 /Bhmxamqo15V7WQjDE3sDspdgf+3h6SKwh4QdPCxvLSyH7IFmBzUZ3gXr83IaNr/EI
	 bzteXMLkLlwgs0/mp8rlP4NNwZAdidXQCg6WrMo0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 4/6] media: uvcvideo: Cleanup version-specific mapping
Date: Mon, 17 Jun 2024 02:13:48 +0300
Message-ID: <20240616231350.6787-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240616231350.6787-1-laurent.pinchart@ideasonboard.com>
References: <20240616231350.6787-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ribalda@chromium.org>

We do not have more version specific mappings. Let's remove this code
for now. It can be easily reverted later if needed.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 92841c73fde8..bd5d8aed385d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -843,14 +843,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 };
 
-static const struct uvc_control_mapping *uvc_ctrl_mappings_uvc11[] = {
-	NULL, /* Sentinel */
-};
-
-static const struct uvc_control_mapping *uvc_ctrl_mappings_uvc15[] = {
-	NULL, /* Sentinel */
-};
-
 /* ------------------------------------------------------------------------
  * Utility functions
  */
@@ -2646,7 +2638,6 @@ static void uvc_ctrl_prune_entity(struct uvc_device *dev,
 static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 			       struct uvc_control *ctrl)
 {
-	const struct uvc_control_mapping **mappings;
 	unsigned int i;
 
 	/*
@@ -2718,18 +2709,6 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 		    ctrl->info.selector == mapping->selector)
 			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
 	}
-
-	/* Finally process version-specific mappings. */
-	mappings = chain->dev->uvc_version < 0x0150
-		 ? uvc_ctrl_mappings_uvc11 : uvc_ctrl_mappings_uvc15;
-
-	for (i = 0; mappings[i]; ++i) {
-		const struct uvc_control_mapping *mapping = mappings[i];
-
-		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
-		    ctrl->info.selector == mapping->selector)
-			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
-	}
 }
 
 /*
-- 
Regards,

Laurent Pinchart


