Return-Path: <linux-media+bounces-34987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0251ADB6F2
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 18:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 860FF163711
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E262288CBD;
	Mon, 16 Jun 2025 16:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Yi1rYGT2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552BC288C3A;
	Mon, 16 Jun 2025 16:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750091454; cv=none; b=VOZbl2gtToNrsEJWrZL9C5ewrDIn3lReEeKAjNR3fySS6a+0uJyMgkI/7/XkJ1/oqTEPFkUHBBP29hdAZ/oBTtPYPDlU+zCrT7WSgApGuA5dGp5ZxlcOANjZVH6T1wb6nDxdQ3o6gKa63pm8t1tmuVnDkX0zb8IZV/IndW1JVQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750091454; c=relaxed/simple;
	bh=hQ7LAtYwL7CCEF1tm2AqnVat+ZPScl50ILEGM1zg5ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z6WROWuelQwwChN/dHXtTrspGjCoE8ghfjOyA7g7QKriYSBCI1TmnnuaaHvUW2lys/eiVs4yqPyx6imQfCpEHX+iEfx3vzceFkaiThnujjtniZPEHUMn5JBth8cB4h/yVKR30/LIO/4iI5rIe/dpBbC7581tlTSQklY1lmuMXj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Yi1rYGT2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-141-184.net.vodafone.it [5.90.141.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E2F7C6C;
	Mon, 16 Jun 2025 18:30:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750091438;
	bh=hQ7LAtYwL7CCEF1tm2AqnVat+ZPScl50ILEGM1zg5ns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yi1rYGT20sILw6XF5So3R7wF7o7CUwg8HDA9Zcb8a2IvGA/jUN2QLOCijx2yrVU2e
	 WAxJo/j9UAIuC3aRr1BUPVkXnRSHM000dLwX6cWOS6uYWP0xiSEqJW//K9YyemV7ux
	 4j5Dsh69KrHa0rh5nC+GEqn3V2PuZzMcTkRN/AUA=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 16 Jun 2025 18:30:38 +0200
Subject: [PATCH v2 2/2] media: vsp1: vsp1_dl: Count display lists
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-vsp1_dl_list_count-v2-2-7d3f43fb1306@ideasonboard.com>
References: <20250616-vsp1_dl_list_count-v2-0-7d3f43fb1306@ideasonboard.com>
In-Reply-To: <20250616-vsp1_dl_list_count-v2-0-7d3f43fb1306@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=hQ7LAtYwL7CCEF1tm2AqnVat+ZPScl50ILEGM1zg5ns=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoUEa3/HkIZWNcA1meJpW4L5kwdFMz8n2NBjMm8
 2LmrhoO69uJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaFBGtwAKCRByNAaPFqFW
 PBDlEACJoCq3L9fqPgAOawxFGQB1noWDz/pK0cK8mJwAq6KtPMIZpJR1Grpa7g9q4oLlPASjdrO
 e6w2xCnw+o6mUZSW8K4JYazFqke2dCkqp/XKwNYra+emgsMoB5sh+x4vv0Vk86CD9HgYb7wL3uG
 UwkNYB7tM7P65wPvlRbjqn2LwMR7am8R3/03Ig9DniUkYW1rhoacek1a3L1dm4BLzcWKZpj3GHe
 uGVWbzonOSIyu8JuteAVMf9c9GuQxJkq2SkheAQq6VyxDI7NnEBdFDpG06YGGLdQf0qzJzTJ9cn
 V+hK1WB5JCVdGBrGAonKVg8v2Hmu7fVNUSsO1cYNs3YN2TzhwnTJB9Yr0qHb9PrnkIiEy9hMRuI
 E6lNRP/RwKnpo3pCbPsIesAl3lsiHKNX2mN6J72aVF/GCXIkxcAN/vixLfZ4bMui1fgFpLRhukj
 50QqTnpqRHgBGVjWdeGn5Q6nMPEE4LyrvB8XL4zAY+48OnfXUoIdr67SFvsRpfnvZvoOeW4fYDT
 jDJ2PIAPExbR8T8dXsk7wCaLzIn07hkIJNoPF1XDJcxXsPHnaIxc78AxV/j6fW4BKUBPqc+KDVp
 jlghsSdOrzHF1nm8YkWbkT05j6uutS9stEZnSBKTsx9iMLsLYtXJHBeZvDGBBOtTt29u4s9pSJi
 1A8TNex1FTeVb2g==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

To detect leaks of display lists, store in the display list manager the
number of allocated display lists when the manager is created and verify
that when the display manager is reset the same number of lists is
allocated.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_dl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
index 18617cbb168703b851a9b437fa62f18425934c68..3713730c6ad8739935851e4da464fc8f23da6180 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
@@ -215,6 +215,7 @@ struct vsp1_dl_list {
  * @pending: list waiting to be queued to the hardware
  * @pool: body pool for the display list bodies
  * @cmdpool: commands pool for extended display list
+ * @list_count: number of allocated display lists
  */
 struct vsp1_dl_manager {
 	unsigned int index;
@@ -229,6 +230,8 @@ struct vsp1_dl_manager {
 
 	struct vsp1_dl_body_pool *pool;
 	struct vsp1_dl_cmd_pool *cmdpool;
+
+	size_t list_count;
 };
 
 /* -----------------------------------------------------------------------------
@@ -1078,6 +1081,7 @@ void vsp1_dlm_setup(struct vsp1_device *vsp1)
 void vsp1_dlm_reset(struct vsp1_dl_manager *dlm)
 {
 	unsigned long flags;
+	size_t list_count;
 
 	spin_lock_irqsave(&dlm->lock, flags);
 
@@ -1085,8 +1089,11 @@ void vsp1_dlm_reset(struct vsp1_dl_manager *dlm)
 	__vsp1_dl_list_put(dlm->queued);
 	__vsp1_dl_list_put(dlm->pending);
 
+	list_count = list_count_nodes(&dlm->free);
 	spin_unlock_irqrestore(&dlm->lock, flags);
 
+	WARN_ON_ONCE(list_count != dlm->list_count);
+
 	dlm->active = NULL;
 	dlm->queued = NULL;
 	dlm->pending = NULL;
@@ -1155,6 +1162,7 @@ struct vsp1_dl_manager *vsp1_dlm_create(struct vsp1_device *vsp1,
 
 		list_add_tail(&dl->list, &dlm->free);
 	}
+	dlm->list_count = prealloc;
 
 	if (vsp1_feature(vsp1, VSP1_HAS_EXT_DL)) {
 		dlm->cmdpool = vsp1_dl_cmd_pool_create(vsp1,

-- 
2.49.0


