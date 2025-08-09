Return-Path: <linux-media+bounces-39218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 588C4B1F67B
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7553A17F144
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CB72BF3DF;
	Sat,  9 Aug 2025 21:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VWrVNPv6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1BD2BF006;
	Sat,  9 Aug 2025 21:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774282; cv=none; b=cR6+yulHmCi+8U4CDSP5g7qPwzovGSNoUV0tvR1DrlZcPca5MKWGHXO95zszuuDBbICHfIwbnV5mIPDHZrxuhGAuh8uI2T1rtOm7auAXzAb9Dxyzis9QNh2YWu3sToWGojDGVJe7GqdloQ5RLlRtyz9WFJOqYysSZj/WGi62wAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774282; c=relaxed/simple;
	bh=SEF49Q3t3qACd5RhqEvRhHeSxhpfTopjzgIukKz485M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EY53CuvloMt55UOkIAOxjMXMzI3jvpoWfgOiNaDiMaJgfsTSwl5egU6tIHd/W8y5/4V7c2z0K9Y0PTy3/ohMK7rdwTySmNB+0+8n8IUQlrOEsI9XGGaZd9qS67FpH6vMYkz+tH+9L+vCEx8BDlF01TJUije9uV6kastswYEvIGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VWrVNPv6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 96C6A3B8B;
	Sat,  9 Aug 2025 23:16:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774216;
	bh=SEF49Q3t3qACd5RhqEvRhHeSxhpfTopjzgIukKz485M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VWrVNPv67myWB6Ldtb1Pxl2FWnuKq3a3Io4xbCbBerAcIEWiH9pv1eLBepEMZbrWu
	 1ZbPHeotzOUt+TSS/uEgE3js3/OjGHw7m4Z52tR0vQ7KiMjz+q5xBNsQyMaRcyw2FN
	 LWL0i6iQMBKcaqOkoDgk6J8oC5f/cOvZzS0hR9bI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 23/76] media: qcom: iris: Set file->private_data in iris_v4l2_fh_(de)init()
Date: Sun, 10 Aug 2025 00:16:00 +0300
Message-ID: <20250809211654.28887-24-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

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


