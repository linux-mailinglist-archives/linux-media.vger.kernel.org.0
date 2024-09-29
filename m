Return-Path: <linux-media+bounces-18743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 223889895B3
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 15:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA239283F68
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 13:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7C317BB28;
	Sun, 29 Sep 2024 13:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ozIcoAtM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C163166F3D;
	Sun, 29 Sep 2024 13:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727617013; cv=none; b=jEd/WFS77N/s4iRieBHqviweHd9xDXSlqr8dhNYvh2mMcQJDH3fTo6A+77dWgO4XcwiuMITh5RC1UVDV5AwxIM/W9vPUk0pwrp2tDNalg0VkP/T5ZUy6vzejvVN9qBYH8q07FJnP5ZNwWfWKGZKeJOVa7CYb08GOJNdnKJ4fbSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727617013; c=relaxed/simple;
	bh=OcwnUVuhMtXnLLH9oEg60Lun1uQvDGaKMD6lqbREbb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7IhKTFF4YnNneBC6KCgiJi8DepxQJuAkQL4E2FmrXkk+oKA7DTY+1QriN8IpoN1ly7a1EAXPR2bDipvsF1vv6k8NpwKe4v/ozg+y4vB4LSBFj8HfhDWwWkv2K0OeoOe1PzPexkVPT4O8oAJlX9mPNKdz20OmhpIATSCt0x0R5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ozIcoAtM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30B8A227;
	Sun, 29 Sep 2024 15:35:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727616920;
	bh=OcwnUVuhMtXnLLH9oEg60Lun1uQvDGaKMD6lqbREbb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ozIcoAtM2HkBfIVmBPyeQ4Ty0McQdDMf75iwy2vb8YFnugvwHVug1C31Fo1apPKMh
	 3QBLKfhlWF0xN1FrhPIDpLsVaMH0w9P3OJOtd4DkaT7QOqxbEwDkFFrlfsHShU8q/7
	 FUwuVOrSfVrRo4o+t6zD/dfzgkb6KnZWSka4ge1I=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: 
Cc: guoniu.zhou@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: imx8mq-mipi-csi2: Drop stream stop/restart at suspend/resume time
Date: Sun, 29 Sep 2024 16:36:40 +0300
Message-ID: <20240929133646.19991-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240929133646.19991-1-laurent.pinchart@ideasonboard.com>
References: <20240929133646.19991-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The imx8mq-mipi-csi2 driver stops streaming at suspend time, and
restarts it at resume time, in both the runtime and system
suspend/resume handlers. This isn't needed:

- The device is runtime resumed only from the .s_stream() handler,
  before starting streaming, and runtime suspended in the same function,
  after stopping streaming.

- For system suspend/resume, the whole capture pipeline is stopped and
  restarted in a controlled manner by the top-level driver (the CSI
  bridge in this case). When the system suspend handler is called,
  streaming will have been stopped already.

Drop stream stop/restart from the PM handlers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index d4a6c5532969..8eb9c7049425 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -64,7 +64,6 @@
 
 enum {
 	ST_POWERED	= 1,
-	ST_STREAMING	= 2,
 	ST_SUSPENDED	= 4,
 };
 
@@ -420,12 +419,9 @@ static int imx8mq_mipi_csi_s_stream(struct v4l2_subdev *sd, int enable)
 		ret = v4l2_subdev_call(state->src_sd, video, s_stream, 1);
 		if (ret < 0)
 			goto unlock;
-
-		state->state |= ST_STREAMING;
 	} else {
 		v4l2_subdev_call(state->src_sd, video, s_stream, 0);
 		imx8mq_mipi_csi_stop_stream(state);
-		state->state &= ~ST_STREAMING;
 	}
 
 unlock:
@@ -668,7 +664,6 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct csi_state *state = mipi_sd_to_csi2_state(sd);
-	struct v4l2_subdev_state *sd_state;
 	int ret = 0;
 
 	mutex_lock(&state->lock);
@@ -677,17 +672,9 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
 		state->state |= ST_POWERED;
 		ret = imx8mq_mipi_csi_clk_enable(state);
 	}
-	if (state->state & ST_STREAMING) {
-		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
-		ret = imx8mq_mipi_csi_start_stream(state, sd_state);
-		v4l2_subdev_unlock_state(sd_state);
-		if (ret)
-			goto unlock;
-	}
 
 	state->state &= ~ST_SUSPENDED;
 
-unlock:
 	mutex_unlock(&state->lock);
 
 	return ret ? -EAGAIN : 0;
-- 
Regards,

Laurent Pinchart


