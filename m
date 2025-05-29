Return-Path: <linux-media+bounces-33613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E08AC8105
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 18:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85A091BA831E
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 16:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8796F22DA1B;
	Thu, 29 May 2025 16:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TvIz79U6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE4722E414;
	Thu, 29 May 2025 16:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748536659; cv=none; b=bfLl9KNc4HiqfEN2guzNXgjeP0FvI32DAmW9IMiACuinIo1SunHmuIyTYSwB53jJ9GOjo+smM5IGAxloPMrHCj6BGTB+VhfcEPJqITahMhgRp2nPjc42Xi7Sphn67fTBmyXv78DOJr1t3Pa28At1z/o4sMIOtYKu4ELFk8lxYdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748536659; c=relaxed/simple;
	bh=rw2rya9Zj0+SJqevKrNkoT35PmOOQgUkltEUkptWs5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9ROcw2FyYyfdrgAGAFg8ORs+K3pZSlDM+SCDSIAhojbVo9DfGqJj33dMXMaAtw8fPRK7H+lDI1GCGR7ZltTk/Y4VQXJLMvc55rltGTNJC9xhRVEITpoHy7RY+xmvayg0V9lwgwU4izMjBnmQyzN2ECiPeqRcAg9kQIlU7hKzvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TvIz79U6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 626AAD52;
	Thu, 29 May 2025 18:36:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748536619;
	bh=rw2rya9Zj0+SJqevKrNkoT35PmOOQgUkltEUkptWs5g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TvIz79U6+cB354F6L1sL16CulOSU06Cj9tmAa+l898S+bVGw5QWqjXb8yZPUZNDS+
	 aP1RpUoTq0miccJrDSlxq7lwKF99rHOz6xw+eE3TWdjm4W5+vCOa0ifEF1GVyOpR+Z
	 D/w+fgrJhctXe/xC0E9AlfYrE6Na1ahUujQVscis=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Thu, 29 May 2025 18:36:31 +0200
Subject: [PATCH 2/2] media: vsp1: vsp1_dl: Count display lists
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-vsp1_dl_list_count-v1-2-40c6d0e20592@ideasonboard.com>
References: <20250529-vsp1_dl_list_count-v1-0-40c6d0e20592@ideasonboard.com>
In-Reply-To: <20250529-vsp1_dl_list_count-v1-0-40c6d0e20592@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2165;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=rw2rya9Zj0+SJqevKrNkoT35PmOOQgUkltEUkptWs5g=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoOI1EF4OLpSjUtyuW6/9kIN64F+NYeZbkr8Qy3
 Yp5AOEn5TiJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaDiNRAAKCRByNAaPFqFW
 PBfsD/wK0VnzX7afuIAgBz6PMWK5Agy7zXVbuAYy8PP4Lf1IjZIYrQUpXu2K3cA2wFommgsXDmD
 F0ZlAJ0a+4CjHKkMoGUCOI/8v1uRsmOnIJPUoPPcsrvar+kko/sF//PxhcrVjR8M1ZP0uKHi39U
 hswouLEKY6VA7K/JCHxSykhUdjjXFWCEi6ApAGlOBtGlnjJtjB6Q/hWgLIR50f/5G7KtouYrFlo
 qZhjNb7ErD0lH8iC8d+m490OGmdYJixRQcSTP04vMNSxX4FxrWNLEn9SpLy+n3g+jm01C3ZmvFV
 JfFh4aFyeeuZ+i1hx2bUs1s4gQ4tX7N54bKt2fpcmn522FmXjGInsuCHZTIbueiqVLQPLIQkcoc
 wLfpFiwnlNFJABm/SG+FNXl7v+vxjD7kIul+ftWM4r0ZfgQmn8jPRFMJEqxWGgavnTMrHywC8Yi
 olj3ob3BCP0hQgHSoT2S2fzWozNGqKPRjRZ+LB8A5McjIeEP+32MNPtTIVGVLUmLp98d+KD3vBz
 m4D1sj3d1G3y1st2FsoffHzdO+ta98knrLfXEI0aCWXO++0YHmLGa5rIqrLO/WGbTnPfQKUHvyP
 35yU2vxieY9/tPCClZARmffSVnR0alU4Z+YOzfpuexsFOWd54ZZ7x9nTDJcwMPzM088unXC4oKB
 FfuCICCJpDQneGw==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

To detect invalid usage patterns of the display list helpers, store
in the display list manager the number of available display lists
when the manager is created and verify that when the display manager
is reset the same number of lists is available.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_dl.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
index 8a3c0274a163..5c4eeb65216f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
@@ -214,6 +214,7 @@ struct vsp1_dl_list {
  * @pending: list waiting to be queued to the hardware
  * @pool: body pool for the display list bodies
  * @cmdpool: commands pool for extended display list
+ * @list_count: display list counter
  */
 struct vsp1_dl_manager {
 	unsigned int index;
@@ -228,6 +229,8 @@ struct vsp1_dl_manager {
 
 	struct vsp1_dl_body_pool *pool;
 	struct vsp1_dl_cmd_pool *cmdpool;
+
+	size_t list_count;
 };
 
 /* -----------------------------------------------------------------------------
@@ -1073,7 +1076,9 @@ void vsp1_dlm_setup(struct vsp1_device *vsp1)
 
 void vsp1_dlm_reset(struct vsp1_dl_manager *dlm)
 {
+	size_t dlm_list_count;
 	unsigned long flags;
+	size_t list_count;
 
 	spin_lock_irqsave(&dlm->lock, flags);
 
@@ -1081,8 +1086,13 @@ void vsp1_dlm_reset(struct vsp1_dl_manager *dlm)
 	__vsp1_dl_list_put(dlm->queued);
 	__vsp1_dl_list_put(dlm->pending);
 
+	list_count = list_count_nodes(&dlm->free);
+	dlm_list_count = dlm->list_count;
+
 	spin_unlock_irqrestore(&dlm->lock, flags);
 
+	WARN_ON_ONCE(list_count != dlm_list_count);
+
 	dlm->active = NULL;
 	dlm->queued = NULL;
 	dlm->pending = NULL;
@@ -1150,6 +1160,7 @@ struct vsp1_dl_manager *vsp1_dlm_create(struct vsp1_device *vsp1,
 				      + sizeof(*dl->header);
 
 		list_add_tail(&dl->list, &dlm->free);
+		dlm->list_count = list_count_nodes(&dlm->free);
 	}
 
 	if (vsp1_feature(vsp1, VSP1_HAS_EXT_DL)) {

-- 
2.49.0


