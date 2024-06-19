Return-Path: <linux-media+bounces-13629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0B590E098
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 02:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB02C2838A3
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 00:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C406E6FB8;
	Wed, 19 Jun 2024 00:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zv/xFSJO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1E26AB6;
	Wed, 19 Jun 2024 00:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756280; cv=none; b=Bgy1OlPH3x7w4+nQ/EmZHkA9f7zlqkOi+rhkS08SwZ2m/Tz4YbxE81GQf4Dq0b9mSM028d/sHT2lq6o6n3rdxB57poDQfOvE37pgy5kiInx/I/nKn22SexbWfD3g1xdhc3cefaYYx2Y0rq0+07r9JsvmPQxq+KrVU31CpD36URw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756280; c=relaxed/simple;
	bh=a2uVtRbaQg2rlJQr2nviY4PpeYTYOst3NS0/pTPj5Co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RI1k/v1+KSKOi/fiDmC4W3wK28x583zaHJOapgPqAz5mJdj4l3KE74EVU64sPYadA4iDaQWSLFE8nVBjTzQkaTFnbennjc/cr7E0GcsmZQiaWupwtmJX1SDgL4cynvlaEBsA40tP0lQmqviFRtk44HQIRo1YghpHrD4xL/6QygM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Zv/xFSJO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E301E39;
	Wed, 19 Jun 2024 02:17:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718756256;
	bh=a2uVtRbaQg2rlJQr2nviY4PpeYTYOst3NS0/pTPj5Co=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zv/xFSJOu8WlVzIwlebGv/RZ7t1/qIccfc60ud/M7G6ltigNk3DHSoDSpRRHvn3+3
	 pUQtyoSKMTZMGdpq1gDcdS2xryWGH531XOyC5uA0Iv5K06/wsSXFFPMwSnaKGamH2J
	 SpYcF51ILM/jx1MyHlo+ryhMDJHfg9rC+yQuUMHo=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 07/19] media: renesas: vsp1: Simplify partition calculation
Date: Wed, 19 Jun 2024 03:17:10 +0300
Message-ID: <20240619001722.9749-8-laurent.pinchart+renesas@ideasonboard.com>
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

When calculation a partition in vsp1_pipeline_calculate_partition(),
there is no need to handle the case where the whole image is covered by
a single partition locally. In that case, the index and div_size
parameters are 0 and format->width respectively, which makes the general
code behave exactly as the special case. Drop the special case.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index fc66dcfdb838..ac52ed8f65ba 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -495,16 +495,6 @@ void vsp1_pipeline_calculate_partition(struct vsp1_pipeline *pipe,
 	format = v4l2_subdev_state_get_format(pipe->output->entity.state,
 					      RWPF_PAD_SINK);
 
-	/* A single partition simply processes the output size in full. */
-	if (pipe->partitions <= 1) {
-		window.left = 0;
-		window.width = format->width;
-
-		vsp1_pipeline_propagate_partition(pipe, partition, index,
-						  &window);
-		return;
-	}
-
 	/* Initialise the partition with sane starting conditions. */
 	window.left = index * div_size;
 	window.width = div_size;
-- 
Regards,

Laurent Pinchart


