Return-Path: <linux-media+bounces-28617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E65F5A6D760
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 10:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE69516E14B
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 09:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F8E25DD1D;
	Mon, 24 Mar 2025 09:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vOJ+XlZ6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C741025DB18;
	Mon, 24 Mar 2025 09:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742808588; cv=none; b=HzorVMGkWIc++9kJSS7TAiEjZeLH/rgW0JGkZZlv/x/H7kTis8z5hswOTXwFJnKcQQPeO2LKbAHHt7KEhIkQkUkkRV1s+xmEtt85h7nODYmbYX3pVaPiswNUKrjX0p9cOYGt1say12+d0sKus35zJosXopyMUBlAtOqYsJS6Mzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742808588; c=relaxed/simple;
	bh=dKW9j8RZhMHAly+4IatGyTUDnXtIXfHcXDHtsvQRWkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FzIqyx9/wVmmz71+CVnNIkeUv6kOnyyzeNbXoX0gR82A3d/b0RVc/3zbJI/Hv+UbwSbtkkr5ahgdMYkeeQZnlSqnvhEUcDLC9YaCr8t/2ennkGCbhXOZBUTPg5T8qJHeJD1yaFMfp8OI+MgSwogQZ2T4PwIDhg6w7ximcnLT4gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vOJ+XlZ6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 094291059;
	Mon, 24 Mar 2025 10:27:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742808476;
	bh=dKW9j8RZhMHAly+4IatGyTUDnXtIXfHcXDHtsvQRWkU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vOJ+XlZ6VfLqiCsYmHM2l1AL4Zycpr5rtODzqC1+LBPAOKjHDS0JyoPK6J9vsqRDl
	 8si6TKaOk3NrmxjQLdhEfbKLGtBLyfH1RB9b/4VTU5/SWK8qGU4k43cmJW45tbGUgc
	 lq/RxBBBHskqA7U9XDlWsm4HoKuALOAi6QnOxSvQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 24 Mar 2025 11:29:18 +0200
Subject: [PATCH v6 2/3] media: ti: cal: Fix wrong goto on error path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-cal-streams-v6-2-28c93fb8f0c9@ideasonboard.com>
References: <20250324-cal-streams-v6-0-28c93fb8f0c9@ideasonboard.com>
In-Reply-To: <20250324-cal-streams-v6-0-28c93fb8f0c9@ideasonboard.com>
To: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dKW9j8RZhMHAly+4IatGyTUDnXtIXfHcXDHtsvQRWkU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4SYDvr+eeoMIfxbW7ICDAbfnOT327JEu+B6JH
 PXisX94gtaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+EmAwAKCRD6PaqMvJYe
 9RiYEACvTyoqK/r3zZZyTYKemcZefyGxewZQHpO5A5CvXgGSx2kbfYIzXXikOQobToXbzV29tCa
 hzJe7aZ0LG2qCYto4FVJeWthrPgIkMZe/xtERXOlqZrn2mMHwYvb7WN6bqQ7yM74U/B49nR/x+g
 +HOsR2onFIO2RNxdxDFkeLlsBVYxIwTU5kDp6RTXDsld/sHhSi5i9o9GNEb2u/GMzsuA1zIHPle
 FCtBbMwPHV/DRUxUFfpwfqtUMvnY0Po8JG/arItCxEPx4v8bVsTiS+buCOW423UMark8KOVuYYp
 NN10nbg4DB2pJx01UNOWAJoj6xq+SZw3V+VvZlnALe9AbUmfgQw5XTS0MRU3veW5yB9ANrtU8St
 VmRa2q0PEXC8Trv7YwTWcHx+VNWuVpj4mqjnNJglYAh/7JUrbiAOBkkJMMtXu0L6YXxmCGRfGPw
 D9+Y0sT4oDXmUjlojmATe7pGS8wyrKmg08xWN+6heBxvk0jgmP6XoTLFfZxtnTb4i0oXMsr7zha
 L8btJRqfxlkB5DBufg0iUU3oSNJYAK51HifNZQPnu7kMXeWJw1N3FICJFqGPC3mBbJ3dkC8krxK
 6aMrR1tnZtN19i3FGluqnr4XF7ALsSXFLd4lhk8PfSEPfXErmtLOOC5fxjUWZ4JzLBkPkaVfTK7
 nxrAeBz/H8T19yA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

If pm_runtime_resume_and_get() fails, we should unprepare the context,
but currently we skip that as we goto to a later line.

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


