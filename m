Return-Path: <linux-media+bounces-39296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C688B1F7AA
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D7F8420198
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001B813D8A4;
	Sun, 10 Aug 2025 01:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L2zLnCs2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E38D1C6FE5;
	Sun, 10 Aug 2025 01:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789521; cv=none; b=hP34LDvw5K6e2lrcBHK/eqFrmb4XfYmikksroz8eyixTh//DjioFMXKtseACWbsb/e0cKUZd2EAvUCazg2YUPBxfThZUnpefPkUSIPdt52iQNA+QAQEAAM2sgOb8x/kEV7RTfpzt9TsF5NRBYsNLxf9rU1XLMqLlZAOwJyPefeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789521; c=relaxed/simple;
	bh=KHBS/uYJ8WAoZF6BzUPvgIHc3UIO3/1rGIF4PxamVv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CH9H2ylbd7jRn/eluQxIuNTKCA7qGccE9FV45u1JaBHXWUrKiATozC6AHAk+6oWzCgv3CabuBHYNWRlkg5tHordRWSro4chtCNNYscr9YryYJyAfL+pN0v61Qat6rEGkb5+gjwrL6AEYq2aT1/6ZInQZF6YbSzAn8Fifa3tAxNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L2zLnCs2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9D44019C6;
	Sun, 10 Aug 2025 03:31:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789467;
	bh=KHBS/uYJ8WAoZF6BzUPvgIHc3UIO3/1rGIF4PxamVv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L2zLnCs2wfFfVGRRUInTEyBnuD9BKFrroOgbHd8L86nabjutcLfUTqh1eYFAjllh6
	 LDLfksrzDsjn5DE5rENKzIOrvlPjgP629YUdfVpQFXPtFoOJYZxUliCcUCgvylCDXl
	 uMUWnaY6G9HJBqtuCLt+NAhmNs2ynPMQn9Aa5nGU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 23/76] media: qcom: iris: Set file->private_data in iris_v4l2_fh_(de)init()
Date: Sun, 10 Aug 2025 04:30:05 +0300
Message-ID: <20250810013100.29776-24-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for a tree-wide rework automated with coccinelle that
will affect file->private_data, v4l2_fh_add() and v4l2_fh_del(), move
setting file->private_data from the callers to the iris_v4l2_fh_init()
and iris_v4l2_fh_deinit() functions. There is not functional change yet.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index d5f99519def4..73c96498759c 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -26,10 +26,12 @@ static void iris_v4l2_fh_init(struct iris_inst *inst, struct file *filp)
 	v4l2_fh_init(&inst->fh, inst->core->vdev_dec);
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
 	v4l2_fh_add(&inst->fh);
+	filp->private_data = &inst->fh;
 }
 
 static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
 {
+	filp->private_data = NULL;
 	v4l2_fh_del(&inst->fh);
 	inst->fh.ctrl_handler = NULL;
 	v4l2_fh_exit(&inst->fh);
@@ -185,7 +187,6 @@ int iris_open(struct file *filp)
 	iris_add_session(inst);
 
 	inst->fh.m2m_ctx = inst->m2m_ctx;
-	filp->private_data = &inst->fh;
 
 	return 0;
 
@@ -269,7 +270,6 @@ int iris_close(struct file *filp)
 	mutex_destroy(&inst->ctx_q_lock);
 	mutex_destroy(&inst->lock);
 	kfree(inst);
-	filp->private_data = NULL;
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart


