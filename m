Return-Path: <linux-media+bounces-36734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED113AF8394
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 00:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B5E61785A3
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23722C15B2;
	Thu,  3 Jul 2025 22:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tQctRmiF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1842C08DC;
	Thu,  3 Jul 2025 22:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582358; cv=none; b=PUNwDCptR+aeF8S2Cr1Tvcos/UGRpnvL/zvhQwfYBg97UmdQv4H49w1QaeZOLHdOLfshdwWz13zJQmQOWRiEvyNsG1xQdIFDeKM04gp8veEooA1G6PfopeTlqQHL10DzpLe7Z85UCkMaAO3gxjGwzpDhAwbde0dnx2Iez+pWOMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582358; c=relaxed/simple;
	bh=wGGKZSoQ+IK1SirWNwlywoMrA19x9lZ3A09mp2fOyWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQ+hj4tz7d9CHWTC41XR/pEdclntyIJlx04fLoFZFeL2zQfnda9ShRd62fGvHq1fuUND8NTCxQy5+/pBDdzA/ImE5Ujz1R5Su0hTzueSzP/vgtCgyMvqKXBCUs55v06YmaDLPL7yGPkk3LOeIT+d72mWwKnQ0qA/p0mDMV5gz/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tQctRmiF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0230C157F;
	Fri,  4 Jul 2025 00:38:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751582322;
	bh=wGGKZSoQ+IK1SirWNwlywoMrA19x9lZ3A09mp2fOyWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tQctRmiFwIkRGEhVCKuP5GtxSWr5EN2wbBvGsrnA2p4xUP/AzNBYWugCUgQDHkvmV
	 evFqIvQaaPDoh27XYHqJCHj99y4r9F/TdTh11ZJUF3wGjrj80b3A12SeafIPUbb29q
	 wbp+jZLFM+V3XQp17aZ0L987mb5YDztH2c7YbAtU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 7/8] media: renesas: vsp1: Fix format propagation on the BRX
Date: Fri,  4 Jul 2025 01:38:25 +0300
Message-ID: <20250703223826.10246-8-laurent.pinchart+renesas@ideasonboard.com>
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

The format width and height is never propagated to the BRX source pad,
leaving its initial configuration invalid. Propagate the whole format
from the first sink pad to the source pad instead of only propagating
the media bus code. This fixes compliance with the subdev format
propagation rules.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index dd651cef93e4..911359faa600 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -156,14 +156,20 @@ static int brx_set_format(struct v4l2_subdev *subdev,
 		compose->height = format->height;
 	}
 
-	/* Propagate the format code to all pads. */
+	/*
+	 * Propagate the format code to all pads, and the whole format to the
+	 * source pad.
+	 */
 	if (fmt->pad == BRX_PAD_SINK(0)) {
 		unsigned int i;
 
-		for (i = 0; i <= brx->entity.source_pad; ++i) {
+		for (i = 0; i < brx->entity.source_pad; ++i) {
 			format = v4l2_subdev_state_get_format(state, i);
 			format->code = fmt->format.code;
 		}
+
+		format = v4l2_subdev_state_get_format(state, i);
+		*format = fmt->format;
 	}
 
 done:
-- 
Regards,

Laurent Pinchart


