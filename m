Return-Path: <linux-media+bounces-28786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9FDA715D6
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 479F1173D4B
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A148C1E1DED;
	Wed, 26 Mar 2025 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rxG5E0PM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEBA1DE2A6;
	Wed, 26 Mar 2025 11:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742988867; cv=none; b=EcEQTa4oT9Mn4N9HAy/1w6t4GHQ/NNPS8aU1zUgeewCVoPgaJhSjY7LPrMT6ja0LvuwCmJAxo5UaGtRkMEtnf7rOCtDf+JgL2xob4RexxDTgqA2QQZH160xA93/VbIbXmP19rqNJRUWWxxbjVj10reEDI+uFKTL+Lcq8cBJH/Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742988867; c=relaxed/simple;
	bh=Dy3Cat34xqjq9ZTJXDX6U2LR0YU94P/HgW1lMPD/gQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EXHpIcsWfoWJGSYiXqFiUN72jiawtiUH2JTDJBMAbSujTmgoNMo4/oNzpfOw44L0XENKS08iDoGjyfLhL9lMhWO5+g5vppdCS4ESQlelvu11UUU4WsOSNRl01glmOeVhFxE/SxfxT9dO8TTzkuMtCQxIInYwZyfAQL2EejKLB/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rxG5E0PM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A141DA57;
	Wed, 26 Mar 2025 12:32:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742988754;
	bh=Dy3Cat34xqjq9ZTJXDX6U2LR0YU94P/HgW1lMPD/gQc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rxG5E0PMwLuyEM06yvwMmvkkmc/7CX1b09D3tAPU0C76dTesuvVtGniGEnbQ2xRbc
	 zAc61LRal9mFRELaQMVVlTxA4ZlHL5kSYW6z5FCW/oTZUh5cZ84aEF/kzrUisVlp02
	 wUStc+Z4zGYxSC/v0oXuLeULFCdk/ZHRA4f5G3Zg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 13:34:02 +0200
Subject: [PATCH v7 2/3] media: ti: cal: Fix wrong goto on error path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-cal-streams-v7-2-659df87ad231@ideasonboard.com>
References: <20250326-cal-streams-v7-0-659df87ad231@ideasonboard.com>
In-Reply-To: <20250326-cal-streams-v7-0-659df87ad231@ideasonboard.com>
To: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benoit Parrot <bparrot@ti.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1203;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Dy3Cat34xqjq9ZTJXDX6U2LR0YU94P/HgW1lMPD/gQc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+Y6kJ7L1tBJrLYhdNQ4gTGTJhyMG78/1yP2B
 lAtqz+p72OJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PmOgAKCRD6PaqMvJYe
 9auqD/47S5dBe3bMLLl+4KwbSrNtHDSJORA5YCSETqWL4CDrBsAXibmfTM/M+uJjHKefImhhrjI
 hjnWyB5USopBv2v/9I5nbsyMj4nPO/KK4vlwNW4VEoiOvShXodkGtEv4GfLuWCEZh+BJyAZWWug
 ATh5Yn1y3ozHrR4MPH6H5K7THvrrtV6DCyNeSwTG4nzsI/r861f2hSoppYLUX3ESeNbk4tIWuGu
 KNbEKldZZ5F1hp6Pldl/Os4q96O6XAFonY0DM3d7xhKmXphM0h93kAYV14ERIJIEsD/ZFYMukG4
 L/p3MHlS4OhNB3KeyMEpILkteaybtkq1nKBruDlGVVXKNbgGj+iwr/j5F58ubSr7gb2o25x5pwD
 7D+4Pk4X5BfQnIMtTiPgV6XzaQifM1gBCwJTdptwfR1dEsqPz5dyvLXM0YaAFjdtWzHTd7OTeGp
 7XwZrMBjR9KxqVJ468HxQv6sx4D+d2FsYreG3mnUOJPdGvchWYLyj9Rt8yMWJt7T+iaRVk4L7Fu
 0GY/Rqn5WXsl5Hdv7Vk8D3PfPmfu2+Kc8G/8vm7hOJfLeyvJgYPBde2jONhkWPJQj0JvYUgJNCk
 XX1Pqjbh4zFL9upKEYCJX7sLOs/tuNZ7r3bk1x6ClHNmc/pLNhOsEe4cVRu6Mur06i2xOiaZMrS
 k31ZarscpeRrwXA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

If pm_runtime_resume_and_get() fails, we should unprepare the context,
but currently we skip that as we goto to a later line.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti/cal/cal-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index 4eb77f46f030..29c38bf8d7a1 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -744,7 +744,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	ret = pm_runtime_resume_and_get(ctx->cal->dev);
 	if (ret < 0)
-		goto error_pipeline;
+		goto error_unprepare;
 
 	cal_ctx_set_dma_addr(ctx, addr);
 	cal_ctx_start(ctx);
@@ -761,8 +761,8 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 error_stop:
 	cal_ctx_stop(ctx);
 	pm_runtime_put_sync(ctx->cal->dev);
+error_unprepare:
 	cal_ctx_unprepare(ctx);
-
 error_pipeline:
 	video_device_pipeline_stop(&ctx->vdev);
 error_release_buffers:

-- 
2.43.0


