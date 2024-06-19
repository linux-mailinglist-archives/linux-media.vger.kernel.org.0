Return-Path: <linux-media+bounces-13757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CC690F937
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 00:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D0F72815B2
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 22:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C71D15B56A;
	Wed, 19 Jun 2024 22:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jtVlMcCj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7588415A846;
	Wed, 19 Jun 2024 22:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718836782; cv=none; b=KI3cUEgBDhLKmz/cS0B2Ny1nV1fgBQX8gZEg/Zmi6VNrdGlHASEcw8P95vzbjCqTfWlFiFklFzS2FBNeuUm/ykAnxmGeThXIOlEb0rgCdGlksLJQiVJNrrq16VDQV0SV32QnNAW5QzwcoRp+Abs4fLD9yI+XofAKeCBU+C2uOJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718836782; c=relaxed/simple;
	bh=hCF/YLBl+jQ/nXcdZX0uViq5WPtL3T3hq0fQGhY3nXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V7HKUGFHOa718N9rUD50h8xpgg1gaFw6StG08TyHiNQ5jwe6jbjn/rmU26M1r7G7KSDPlSGLY1bKgFyMQP6U4/PObfjntIRIq0ke0e2zRXVwKfFmq33uaoQUMWvcAPTZmlc1hGe7eawtL+hQxIrDaxFlKsgCAOyXAo597R2vmwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jtVlMcCj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A43338E1;
	Thu, 20 Jun 2024 00:39:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718836758;
	bh=hCF/YLBl+jQ/nXcdZX0uViq5WPtL3T3hq0fQGhY3nXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jtVlMcCjt714bZAqPbiLGiNTcQ1B1FZgiy2lbW6XIKvAqCFs35+bLa51KxDCBUWG4
	 +nEfJEV/qUdm+vbTvXasSVIBf9XC4CE2W0afd883DsN87t+WkFN9r+BZesnIorwyxj
	 EU9layc93Li64dBr0ahCDM9lZKQnAZZPbwVn5Y4s=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v1.1 6/8] media: renesas: vsp1: Print debug message to diagnose validation failure
Date: Thu, 20 Jun 2024 01:39:15 +0300
Message-ID: <20240619223915.7183-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619012356.22685-7-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619012356.22685-7-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When formats don't match between a subdev and a connected video device,
starting streaming returns an error without giving the user any
indication as to what went wrong. To help debugging pipeline
misconfigurations, add a debug message that indicates the cause of the
failure.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
Changes since v1:

- Replace -EINVAL with -EPIPE
---
 drivers/media/platform/renesas/vsp1/vsp1_video.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 5a9cb0e5640e..28cee0304e77 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -78,8 +78,14 @@ static int vsp1_video_verify_format(struct vsp1_video *video)
 
 	if (video->rwpf->fmtinfo->mbus != fmt.format.code ||
 	    video->rwpf->format.height != fmt.format.height ||
-	    video->rwpf->format.width != fmt.format.width)
-		return -EINVAL;
+	    video->rwpf->format.width != fmt.format.width) {
+		dev_dbg(video->vsp1->dev,
+			"Format mismatch: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
+			video->rwpf->fmtinfo->mbus, video->rwpf->format.width,
+			video->rwpf->format.height, fmt.format.code,
+			fmt.format.width, fmt.format.height);
+		return -EPIPE;
+	}
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart


