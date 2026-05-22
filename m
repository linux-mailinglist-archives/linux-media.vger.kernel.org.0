Return-Path: <linux-media+bounces-62549-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLxbHJC5D2qCPAYAu9opvQ
	(envelope-from <linux-media+bounces-62549-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 04:04:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD205ADD9C
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 04:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 078223049943
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 01:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9892D7393;
	Fri, 22 May 2026 01:58:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4582C0294;
	Fri, 22 May 2026 01:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779415122; cv=none; b=Kdkkd5Zj4Nm/O+jHcmsf3pOpDMshnf7+h+9er1y7t26KvKH5ULisXQqJ2GKacYZucmBQKyiIicSjF2WIvLl2m5D2+9FBUqJ/P/eWcA4NGc97yP1GQ23XuXfa7LsOE8PH0YwbhwufLtML5ZrZEBy7SrTG+iWERcxbGKP0L+31DmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779415122; c=relaxed/simple;
	bh=BUzR59njBSxKwHNIfa1l0d140YXu8UR6u14szZEFcpE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qzy/Rstu0P2ATKr1U7bIrpvZrh4EUplqtHBmHfJGXpKPaEdCo7t5+TOQij5OnHqRGWTU4KBJbrY23BVKTfsaH9J+HPA9z9gXXKSrWFdfGygjJwMlnOXRFthFueIk6uZgqtvSynPryXZt6o0A9WkVshFftUVl9babK4jCpsXFbDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAAnzGc6uA9qbfAdEQ--.991S2;
	Fri, 22 May 2026 09:58:18 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: jai.luthra@linux.dev,
	mchehab@kernel.org
Cc: tomi.valkeinen@ideasonboard.com,
	r-donadkar@ti.com,
	p.yadav@ti.com,
	sakari.ailus@linux.intel.com,
	y-abhilashchandra@ti.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH next] media: ti: j721e-csi2rx: Fix error handling for media_entity_remote_source_pad_unique()
Date: Fri, 22 May 2026 09:57:34 +0800
Message-Id: <20260522015734.2212695-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAnzGc6uA9qbfAdEQ--.991S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4kWFWUXw45Ww4fZFWUArb_yoW8uFW5pr
	1DuFWSgrWjqF18KayfAw13GrZ8G3WFqa42g3sag3WkZr4agryrKF17Gas5ZFW8WF40qa43
	Xrs0qr1UXFWUuaUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUpwZcUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62549-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[nichen@iscas.ac.cn,linux-media@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.741];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4CD205ADD9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The media_entity_remote_source_pad_unique() function returns an error
pointer on failure, not NULL. Fix the check to use IS_ERR() and return
PTR_ERR() to correctly handle allocation failures.

Fixes: 982135c0eac6 ("media: ti: j721e-csi2rx: add a subdev for the core device")
Fixes: 3ed9c0a1fdba ("media: ti: j721e-csi2rx: add multistream support")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 21388284cbaa..45c4c1fb84df 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -888,9 +888,9 @@ static int ti_csi2rx_get_stream(struct ti_csi2rx_ctx *ctx)
 
 	/* Get the source pad connected to this ctx */
 	pad = media_entity_remote_source_pad_unique(ctx->pad.entity);
-	if (!pad) {
+	if (IS_ERR(pad)) {
 		dev_err(csi->dev, "No pad connected to ctx %d\n", ctx->idx);
-		return -ENODEV;
+		return PTR_ERR(pad);
 	}
 
 	state = v4l2_subdev_get_locked_active_state(&csi->subdev);
@@ -1184,8 +1184,8 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
 	spin_unlock_irqrestore(&dma->lock, flags);
 
 	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
-	if (!remote_pad)
-		return -ENODEV;
+	if (IS_ERR(remote_pad))
+		return PTR_ERR(remote_pad);
 	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
 						       TI_CSI2RX_PAD_SINK,
 						       &streams_mask);
@@ -1219,8 +1219,8 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
 		writel(0, csi->shim + SHIM_CNTL);
 
 	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
-	if (!remote_pad)
-		return -ENODEV;
+	if (IS_ERR(remote_pad))
+		return PTR_ERR(remote_pad);
 	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
 						       TI_CSI2RX_PAD_SINK,
 						       &streams_mask);
-- 
2.25.1


