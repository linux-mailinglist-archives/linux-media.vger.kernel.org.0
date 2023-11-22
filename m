Return-Path: <linux-media+bounces-699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFC27F3CD2
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 05:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9ABFB2170F
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 04:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7BC11716;
	Wed, 22 Nov 2023 04:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Kh5o00t0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A54A10C;
	Tue, 21 Nov 2023 20:30:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C91991515;
	Wed, 22 Nov 2023 05:29:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700627383;
	bh=w8Ei6RNmV9GVKFjz/Ai8WwW0Sonyvs/ejKszeuqmeho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kh5o00t0wkkU60W+SI3vsLUfWFyJTUhETTol6FENbOVRegxGcB9XmOUMnLvmiQSI2
	 SlzwDhCAp5rFnKOD49Vjci/feTqJHMQRGfdImSJVsrdXBV4IzimR6z6DIWIKXBc34l
	 KHLRcKcfQBJIGwWRiYu/kP1A5h+D/7U7Zash8HLs=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [RFC PATCH v1 07/19] media: renesas: vsp1: Simplify partition calculation
Date: Wed, 22 Nov 2023 06:29:57 +0200
Message-ID: <20231122043009.2741-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
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
---
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index b90240b24b3a..ca6817f45dd2 100644
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


