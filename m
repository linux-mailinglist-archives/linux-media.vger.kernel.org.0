Return-Path: <linux-media+bounces-33612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 891B5AC8101
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 18:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65C1D9E1165
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 16:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B2E22E3E9;
	Thu, 29 May 2025 16:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hV7vFgjr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E531B2288C3;
	Thu, 29 May 2025 16:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748536656; cv=none; b=DBmfptZKK32nnc6LFt22IpxBevxJzf6usp0GGWdCbQ+A8tJqxsig+8WzXFgaVVtVzuQDsI6JClbzpjey9bR22FOp43jOrCc9EoN2jSHXCG3tIvlFN6QVpm5oimghs120hJJCFHhgYQRPyGKezrq4B0+ZyBH2vMPTgx+obMX91DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748536656; c=relaxed/simple;
	bh=73RQIfQ59ZWM0pHsqKg57/cs/H+nU78LlhTUY3dCnMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rmzx6zCW9a13GenmHzJHQdtbo0aGlQo3ftsIzt/oMoUNcrqcyrTHJ63Xu2H1zZ6DH1NYZgITI7Dvs1vqgYVAJkJ30RmLRqueoEF/VeEZSTCr1LGlemcJHwmzkTJK5vJ5nqWtJ1uHDmrR+n3/123is1vk70g8TZa+wjfC6e8ZoNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hV7vFgjr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D65DEA98;
	Thu, 29 May 2025 18:36:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748536619;
	bh=73RQIfQ59ZWM0pHsqKg57/cs/H+nU78LlhTUY3dCnMk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hV7vFgjrugLWUvYpS3OHM4BecFf1Akvud6rgZHz3C2tUk+qt9zQ354C0IW75JoDB7
	 m/0Gxo59xulM+H0MrOq655ieR8kmnyTFuJPMJgLZ4kZIbjZMdljy5Dnf5S49AtP1pF
	 zPuM5DTWl6QAixOeNvIUO6OHA4RWvwiwdy44F+0U=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Thu, 29 May 2025 18:36:30 +0200
Subject: [PATCH 1/2] media: vsp1: vsp1_dl: Add usage counter
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-vsp1_dl_list_count-v1-1-40c6d0e20592@ideasonboard.com>
References: <20250529-vsp1_dl_list_count-v1-0-40c6d0e20592@ideasonboard.com>
In-Reply-To: <20250529-vsp1_dl_list_count-v1-0-40c6d0e20592@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=73RQIfQ59ZWM0pHsqKg57/cs/H+nU78LlhTUY3dCnMk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoOI1EOUEg7Xxzdb0haRgbQqvXHDmKe/4fOx6nO
 5fllNpevMWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaDiNRAAKCRByNAaPFqFW
 PGaZD/4sPsIwWCjsLNlbolHp92eGqw+lnhZ6mwFzEq0XWnIHccTF88cyGpv4IyyKFKItBX5Hwgi
 vlGDEWChHQSyHP333ZkokXZkyJpjKK/Lm5bPAeryhiYrofbZhgl0WjOvabCHiukc0cttVThazNI
 M/RC7LhEHNcBAAae+N9uW3jtnIa6rfk6+NXXSRbiWZUaq1ANMWaSsJgjC5ZXTxrDYL6XeKlsCfW
 lepppAHv/r+PYKfCF2Fru1VhX+SgnTwRiPDDj4riIzLNsjaIDi4s7t0XW3NcMsJAoeTGec0/KlQ
 tEXXnq3YFDPlZX9mAX6BP/0+v34LAdYpe6kyIITDU5Fm7HTYsTL88rntto9cjBTOdZGT+rBO864
 WEUJz1/TPyfpnby3vP8+YDULDq1m694Z+0M/E9DwuBwq8EPwA3kaF1fkEJBVvvL8JdMCN9ojTgC
 c/PW9o0En1HTeP2kJMOCpE/PJgTL6MYGMVRQBeDwRP8sF30qxx8bLYnXpJcu+vYhQs2sHhu3YVg
 ZFYKy8VzhVrp2kky4Db4pBffwtJG1WDn3wUlu9Yc5UX4T63YCO4/H8UoHI3xzJnBL2rYD4LkkIq
 dp/FRwuj3eKH6BzsyauFxP7OK9rlgFfYRxvyQoLQjgGQnGo+sS/mO/vBP1o9Lh1HCuxK7tP43X1
 KdUxVkzxYh9gk4A==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

In order to detect invalid usage pattern such as double list_put()
calls, add a usage counter to each display list. Increment it whenever
a list is get() and decrement it when the list is put(). Warn if the
usage counter goes below 0.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_dl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
index bb8228b19824..8a3c0274a163 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
@@ -179,6 +179,7 @@ struct vsp1_dl_cmd_pool {
  * @has_chain: if true, indicates that there's a partition chain
  * @chain: entry in the display list partition chain
  * @flags: display list flags, a combination of VSP1_DL_FRAME_END_*
+ * @usage: usage counter to detect double list free
  */
 struct vsp1_dl_list {
 	struct list_head list;
@@ -198,6 +199,7 @@ struct vsp1_dl_list {
 	struct list_head chain;
 
 	unsigned int flags;
+	int usage;
 };
 
 /**
@@ -617,6 +619,7 @@ struct vsp1_dl_list *vsp1_dl_list_get(struct vsp1_dl_manager *dlm)
 		 * display list can assert list_empty() if it is not in a chain.
 		 */
 		INIT_LIST_HEAD(&dl->chain);
+		dl->usage++;
 	}
 
 	spin_unlock_irqrestore(&dlm->lock, flags);
@@ -657,6 +660,10 @@ static void __vsp1_dl_list_put(struct vsp1_dl_list *dl)
 	 */
 	dl->body0->num_entries = 0;
 
+	/* decrement usage count to detect invalid usage pattern. */
+	if (WARN_ON_ONCE(--dl->usage < 0))
+		dl->usage = 0;
+
 	list_add_tail(&dl->list, &dl->dlm->free);
 }
 

-- 
2.49.0


