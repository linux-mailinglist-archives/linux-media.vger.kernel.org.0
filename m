Return-Path: <linux-media+bounces-34986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C022CADB6FD
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 18:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02D1418912B2
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7B2288C26;
	Mon, 16 Jun 2025 16:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qzgr2Frw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0A4288504;
	Mon, 16 Jun 2025 16:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750091452; cv=none; b=mZ4ie9X4PEbh44bhQzUW7v/XomaujrzIyjpRkQmaQTL58nOU81FaIiIYy8vIsq2fKP92GfcP9valrOs4MauOeSGcyJ+hFjT88lVE68ND+b2KdAqXhkqDb8Lhvat5iO4YE2xFciIPal5vATqGv5MGMj0Nf+OXoFl6fF99k3UmgdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750091452; c=relaxed/simple;
	bh=c/F3YDMzIOEB6Wh0HFZbiwLZKlVEVxQsVuqbS/vOm1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hA5l6UtKZaQg4tK/Y1ve1bobtN1HTErJSHECvXhmYu429SJSvcUEeXHjOnNnb7eB5RancFIJ0pTIBBrmnkQQNXKLfaNk3I8EmOeCjHRjzCMaz8k9Xe652/OQTPzXXQOWvj3HpCJiO293tJrcekLzT0OXa9aIHzcr7fhq7WNGyi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qzgr2Frw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-141-184.net.vodafone.it [5.90.141.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA0C3C64;
	Mon, 16 Jun 2025 18:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750091437;
	bh=c/F3YDMzIOEB6Wh0HFZbiwLZKlVEVxQsVuqbS/vOm1Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qzgr2FrwWDXNFS+KVsvRQjX5cPFQ8kE83mnkXZfPW6ISqeWOv55wasmOOFNdwrx0r
	 Eo6bElkA4eMOC5eTg/E/y8u0Bgh2g6b1vwZIBMzT4O4K5pPKJ8tH0Sm9UOepQSEeau
	 KKSXIohva0r1np1RfczU9NmCj2oY5QAhIzQw511w=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 16 Jun 2025 18:30:37 +0200
Subject: [PATCH v2 1/2] media: vsp1: vsp1_dl: Detect double list release
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-vsp1_dl_list_count-v2-1-7d3f43fb1306@ideasonboard.com>
References: <20250616-vsp1_dl_list_count-v2-0-7d3f43fb1306@ideasonboard.com>
In-Reply-To: <20250616-vsp1_dl_list_count-v2-0-7d3f43fb1306@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2095;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=c/F3YDMzIOEB6Wh0HFZbiwLZKlVEVxQsVuqbS/vOm1Q=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoUEa3X/a4NoGuLPxH9evmEVCoXp0Is0h9gDwZq
 8nX0kdWgm2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaFBGtwAKCRByNAaPFqFW
 PMakD/91zbeazs+qQDvuLiCOvaIXb8eTBwDDKMb2O4SWbtUxyWOiDMNHS9HBZ6SWxUUxHg2qUvq
 AqZJhcZgNYrxmmTlHj48+PQgaMVhcFpXrFs9aQ70vrk/uSpLf5AhAXzuzWllkEO9rWzvO0FFPLU
 WqyReV8JJIZvsAv6nGMSivseOplzChECvOr4c/b4Z1JpO9IUEYmY18sGe6e27kZEdJiaWqI9st2
 vPQfF1upGCG3oDHblaZxUIkGkmftSmLNVtwx/hT/2GC3ZTXi9bnXLvBiPfnHSANksuDyPZpkoy7
 yxeaT36dkQntk9qdyXcwYPeAJ3HIpxmg5dTJianFPouBKtpV25TJNCC8VOTrIS6kCfzAI2wnRhr
 kcsx+KQyGf29G0gssidU7U+qZS3dmdKGDdtgogo9zZz240Jo3ZcOs3eB1eu/IxKGrin0uABEPOI
 qXDEyE3f3e8OvbbjhLnLjlyPhtVCLC0fjasHW76B71VZbTE4yZUJonFeT769ZJ0d185M/yvTDJo
 Mty5u+vc9mGXduUdyg4lAEsL6jVKz5PxUYcHo6jTh8dmTlreG2L8zO6nMg78lwoJI0MfUQGdYAm
 vsmbWGoFqaESZaVU9x0YGz/GmMWB473kqc+lw4PNkMitb/EpPTs3lnchRMRuYxVWOzYQM0SCIZv
 syAViOHvY5sq2ug==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

In order to detect invalid usage pattern such as double list_put()
calls, add an 'allocated' flag to each display list. Set the flag
whenever a list is get() and clear it when the list is put(). Warn if a
list not marked as allocated is returned to the pool of available
display lists.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_dl.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
index bb8228b198249943399719b5f37c337fc43eed5b..18617cbb168703b851a9b437fa62f18425934c68 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
@@ -176,6 +176,7 @@ struct vsp1_dl_cmd_pool {
  * @bodies: list of extra display list bodies
  * @pre_cmd: pre command to be issued through extended dl header
  * @post_cmd: post command to be issued through extended dl header
+ * @allocated: flag to detect double list release
  * @has_chain: if true, indicates that there's a partition chain
  * @chain: entry in the display list partition chain
  * @flags: display list flags, a combination of VSP1_DL_FRAME_END_*
@@ -194,6 +195,8 @@ struct vsp1_dl_list {
 	struct vsp1_dl_ext_cmd *pre_cmd;
 	struct vsp1_dl_ext_cmd *post_cmd;
 
+	bool allocated;
+
 	bool has_chain;
 	struct list_head chain;
 
@@ -617,6 +620,7 @@ struct vsp1_dl_list *vsp1_dl_list_get(struct vsp1_dl_manager *dlm)
 		 * display list can assert list_empty() if it is not in a chain.
 		 */
 		INIT_LIST_HEAD(&dl->chain);
+		dl->allocated = true;
 	}
 
 	spin_unlock_irqrestore(&dlm->lock, flags);
@@ -657,6 +661,13 @@ static void __vsp1_dl_list_put(struct vsp1_dl_list *dl)
 	 */
 	dl->body0->num_entries = 0;
 
+	/*
+	 * Return the display list to the 'free' pool. If the list had already
+	 * been returned be loud about it.
+	 */
+	WARN_ON_ONCE(!dl->allocated);
+	dl->allocated = false;
+
 	list_add_tail(&dl->list, &dl->dlm->free);
 }
 

-- 
2.49.0


