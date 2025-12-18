Return-Path: <linux-media+bounces-49061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1377ECCB287
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 10:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A410D303075F
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 09:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13CA82FE071;
	Thu, 18 Dec 2025 09:24:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405F117B505
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 09:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766049850; cv=none; b=awvOZOUWtlOpVgTM8LKMY9TbgssyfVXdyygh8flu1xLRfE1GbKUT7hVKT3qaVZ4d9+4B2e2q+ZQmUnrfCMd0iluSK9JXXL5BkIrOlkEQrOKRLW6eXray0LX7d6KyX2l3AUo6XfgrKST5kc6GBlrLf+OeSSHeLkx/L3GlDAMv9bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766049850; c=relaxed/simple;
	bh=d/RGKZbBZ9O6QiQ6lDV6ig9NWEqYpAswwZWlks9LDsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KRIdA2STBGqm07tVF0JPWzWiCy9Ont6Q0GmsMN7aybH0wFemMqpPOxEQnf4+t85P0cqFCmBe37gBGq56H3yCaMLHn4t6/1YwArfKU5+Q1B7mp9cVBOk0y1XrUA8CshRXqEXBCpI2khiNIIKEy3OPlwiIZ6lYpVMlkTRMHf3INpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vWAEo-0002J4-IZ; Thu, 18 Dec 2025 10:23:58 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Thu, 18 Dec 2025 10:23:50 +0100
Subject: [PATCH v2 2/3] media: imx-csi: explicitly start media pipeline on
 pad 0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-media-imx-cleanup-v2-2-9e3e3c269f7f@pengutronix.de>
References: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
In-Reply-To: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-staging@lists.linux.dev, Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

entity->pads is an array that contains all the pads of an entity.

Calling __media_pipeline_start() or __media_pipeline_stop() on the pads,
implicitly starts the pipeline with the first pad in this array as
origin.

Explicitly use the first pad to start the pipeline to make this more
obvious to the reader.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- move struct media_pad *pad; before int ret = 0; for better read
---
 drivers/staging/media/imx/imx-media-utils.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index f520529a7cfe..bd9af147a801 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -754,6 +754,7 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
 				  bool on)
 {
 	struct v4l2_subdev *sd;
+	struct media_pad *pad;
 	int ret = 0;
 
 	if (!is_media_entity_v4l2_subdev(entity))
@@ -762,17 +763,19 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
 
 	mutex_lock(&imxmd->md.graph_mutex);
 
+	pad = &entity->pads[0];
+
 	if (on) {
-		ret = __media_pipeline_start(entity->pads, &vdev->pipe);
+		ret = __media_pipeline_start(pad, &vdev->pipe);
 		if (ret)
 			goto out;
 		ret = v4l2_subdev_call(sd, video, s_stream, 1);
 		if (ret)
-			__media_pipeline_stop(entity->pads);
+			__media_pipeline_stop(pad);
 	} else {
 		v4l2_subdev_call(sd, video, s_stream, 0);
-		if (media_pad_pipeline(entity->pads))
-			__media_pipeline_stop(entity->pads);
+		if (media_pad_pipeline(pad))
+			__media_pipeline_stop(pad);
 	}
 
 out:

-- 
2.47.3


