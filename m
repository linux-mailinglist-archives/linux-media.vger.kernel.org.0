Return-Path: <linux-media+bounces-40607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A309B2FB8B
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AF8016A74C
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C6F2EC553;
	Thu, 21 Aug 2025 13:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J7mDs/oi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0253F2EC54D
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 13:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755784312; cv=none; b=QW32CqtettbRycDaz1rBdWYTKapDC+7GcONXUpPrOtTfcYhFbb0UxYELZBa/DUqBIxjHO40s+5o7RWTUIno9OqGI+y2pw9heryflHwXevpQ4snVo9LMMdtKCJg0BNdIQFU8bAxtnO7rPScTYa3QrNq2VGXXhnYfU7mPPf6vG+M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755784312; c=relaxed/simple;
	bh=kWRCdqRmQiQ4nabOfCnhtHCvlV0R2Q4ArNp6iMOh/10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NxWhj4wixBDOLLhjdFqTxNQ3nPLX76h2EqFnjwI25rr/tWp0P0ioKO6Esj4AcslzSeeE4Thl+nzs9XNWfn/FNwLEsvG/NBCSkCifStPyL0SlMwJmo3jyvj/5nIvi163DfsvckTsQHQrZatKDwzmiIPyQm8btFW9zeIRap2awKZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J7mDs/oi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C83FE1026;
	Thu, 21 Aug 2025 15:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755784250;
	bh=kWRCdqRmQiQ4nabOfCnhtHCvlV0R2Q4ArNp6iMOh/10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J7mDs/oi0AUEx4g25WSCJ4xDTu0CSz+vo7E3Fe0TKveR0EoifGpVB2VLEY2ubu1Y1
	 HvrabUehpIWOnoYx247DZvEgTLvuu5hP26jAduYlIM368pYjyK5L1fWa8H8v0kZp8W
	 IqoGa+hwmt1KyjXMUHgkfZvPS3JPfa3QAaqhhYfE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Christian Hemp <c.hemp@phytec.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: [PATCH v2 2/2] media: nxp: imx8-isi: m2m: Delay power up until streamon
Date: Thu, 21 Aug 2025 16:51:23 +0300
Message-ID: <20250821135123.29462-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250821135123.29462-1-laurent.pinchart@ideasonboard.com>
References: <20250821135123.29462-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no need to power up the device when userspace opens it. Delay
the operation until streamon.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-m2m.c      | 20 +++++++++----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index a8b10d944d69..00afcbfbdde4 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -250,6 +250,10 @@ static int mxc_isi_m2m_vb2_prepare_streaming(struct vb2_queue *q)
 	if (m2m->usage_count == INT_MAX)
 		return -EOVERFLOW;
 
+	ret = pm_runtime_resume_and_get(m2m->isi->dev);
+	if (ret)
+		return ret;
+
 	/*
 	 * Acquire the pipe and initialize the channel with the first user of
 	 * the M2M device.
@@ -263,7 +267,7 @@ static int mxc_isi_m2m_vb2_prepare_streaming(struct vb2_queue *q)
 					      &mxc_isi_m2m_frame_write_done,
 					      bypass);
 		if (ret)
-			return ret;
+			goto err_pm;
 
 		mxc_isi_channel_get(m2m->pipe);
 	}
@@ -290,7 +294,8 @@ static int mxc_isi_m2m_vb2_prepare_streaming(struct vb2_queue *q)
 		mxc_isi_channel_put(m2m->pipe);
 		mxc_isi_channel_release(m2m->pipe);
 	}
-
+err_pm:
+	pm_runtime_put(m2m->isi->dev);
 	return ret;
 }
 
@@ -350,6 +355,8 @@ static void mxc_isi_m2m_vb2_unprepare_streaming(struct vb2_queue *q)
 	}
 
 	WARN_ON(m2m->usage_count < 0);
+
+	pm_runtime_put(m2m->isi->dev);
 }
 
 static const struct vb2_ops mxc_isi_m2m_vb2_qops = {
@@ -643,16 +650,10 @@ static int mxc_isi_m2m_open(struct file *file)
 	if (ret)
 		goto err_ctx;
 
-	ret = pm_runtime_resume_and_get(m2m->isi->dev);
-	if (ret)
-		goto err_ctrls;
-
 	v4l2_fh_add(&ctx->fh, file);
 
 	return 0;
 
-err_ctrls:
-	mxc_isi_m2m_ctx_ctrls_delete(ctx);
 err_ctx:
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 err_fh:
@@ -664,7 +665,6 @@ static int mxc_isi_m2m_open(struct file *file)
 
 static int mxc_isi_m2m_release(struct file *file)
 {
-	struct mxc_isi_m2m *m2m = video_drvdata(file);
 	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
@@ -676,8 +676,6 @@ static int mxc_isi_m2m_release(struct file *file)
 	mutex_destroy(&ctx->vb2_lock);
 	kfree(ctx);
 
-	pm_runtime_put(m2m->isi->dev);
-
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart


