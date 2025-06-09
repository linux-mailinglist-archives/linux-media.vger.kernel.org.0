Return-Path: <linux-media+bounces-34370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B361BAD2655
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 21:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 530A9188DCE7
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 19:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC06F220F24;
	Mon,  9 Jun 2025 19:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="neCSZhkD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F6D21FF24;
	Mon,  9 Jun 2025 19:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495729; cv=none; b=rvwGd5Rc5c+x96/MBZZOnWosCSNQAq6dQYgRFnLp0fkgVU2ejIbTc/MXB9Maa9lQkEW+vnBPh9ooLpGAahhe4gJe6LEYWCODgIDOEFjfWGGMlOKnUlKTbGwPaY04IIomk4PMw4wT9zDFX+M5OxYsdoXbvYbYlPe0IcZuWk34AoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495729; c=relaxed/simple;
	bh=FKNDgO54yjUnmfXufdKqdJlR/CayNxpUptThAoDjRmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uR/OvW4wY0vzbFEAU3uXApQLH2PmwUR0nnhQnDRt/y6px4PsbyZaJEXwAgAsOEqeiYneMXPDmFS8hGSPlw0+XDZWlbr0nG5Lufd7qCb/Sij0R3aN8lbJX84LoiPH1AEFGf7z6j4+0paKA4CmP56CjISryODeTJKXDNTDNhcmeY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=neCSZhkD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CB48C67;
	Mon,  9 Jun 2025 21:01:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749495716;
	bh=FKNDgO54yjUnmfXufdKqdJlR/CayNxpUptThAoDjRmU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=neCSZhkD/gP9tQnDzQJGeLhZswfThxqSYQVyU72Fu7881CD1JdhZg0wN9AuZTJzAF
	 4dON06f6LR6iOJkRDTp7TqeZnoVDQZLSCfvoI0C/vv58xXo1mas9jZWFJm1/A7ixRD
	 FY1Vw+O5V06mc62KHQPqL70mFKpkc444c0DMInQw=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 09 Jun 2025 21:01:43 +0200
Subject: [PATCH 2/3] media: vsp1: Reset FCP for VSPD
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-vspx-reset-v1-2-9f17277ff1e2@ideasonboard.com>
References: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
In-Reply-To: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>, 
 LUU HOAI <hoai.luu.ub@renesas.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1527;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=WoeqCO9CgR6c4BjQP9DpdbHpYISdam2AGXUlBv6XQCs=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoRy+nm/YLX1TI4i1WKAwJlS9kH2TqwkTPwuJPV
 ngmuwnBqFeJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaEcvpwAKCRByNAaPFqFW
 PPEbD/wJXDgk1WO9BAU/1B6Vqzim8oiA3xk4NGT0YsP994qgZ+QjBeRgqtqs3+MgzZOxJT+SdX9
 K4/WfO4QCN/G3Mk6XB54mMiQzHGpGIhm3hvpLDBnl9F3AiRut52dY38XIukbMqu89PWRAQH2AqF
 aeIyxHYugIBpnbFlyjBynbcg5mint4wxkd+ZATsBB9wHn/5sJQEr6YzsPV1DGEfFGP/OiRTz246
 hwXl8KMo8fHyaFSQfEKkJADI8i6vMBjpzcKFDhqIJHNBZZcIdfhlxACuR5zZ7f4IbzcujVYSsj8
 t/4yQezuAGNspSh15OHCaIdQ/gS9OjHBrrmdNVAu1TqUqI4pzsc+6ylbjgojDd5nzZp1z/Sa5mv
 K0adaoMrIX19TC95c3B0tff6n0A/gBfqpW6IT7j2o13nXqcjptntgc5cuBGyokbLQ9/tDt9MMJ+
 tYasNHekDAATwScK2tiaHVd10Ha5jssM2ewNHnRiNGd2CCEwO+fChIhNBGepWRSbwwn0GIhUnK9
 1Ztf8B/M8qbupf70tJ/cppapHSxTcNbDnylpzixafrzHl4GAfwSOK9Q+Yxq9ZMEQh9w1hQGBHKM
 U0ghZygIBFYYwzPfjjvAjr2ffx5YeU03IlP9ooK5odF1RcwXbzM4tm9V4nyVhByGfuBTeSz1F05
 Wm03QVLCMuhUNmw==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

According to H/W manual v1.00, VSPD must be excecuted
FCP_RST.SOFTRST after VI6_SRESET.SRST. So this patch adds it.
VSPDL is not applicable.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index 3cbb768cf6adc8cb182d8d31c5b9a9d3565785e7..a6e5e10f3ef275c1b081c3d957e6cf356332afce 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -13,6 +13,7 @@
 #include <linux/wait.h>
 
 #include <media/media-entity.h>
+#include <media/rcar-fcp.h>
 #include <media/v4l2-subdev.h>
 
 #include "vsp1.h"
@@ -22,6 +23,7 @@
 #include "vsp1_hgo.h"
 #include "vsp1_hgt.h"
 #include "vsp1_pipe.h"
+#include "vsp1_regs.h"
 #include "vsp1_rwpf.h"
 #include "vsp1_uds.h"
 
@@ -512,6 +514,11 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
 			pipe->state = VSP1_PIPELINE_STOPPED;
 			spin_unlock_irqrestore(&pipe->irqlock, flags);
 		}
+
+		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
+		    VI6_IP_VERSION_MODEL_VSPD_GEN3)
+			ret |= rcar_fcp_soft_reset(vsp1->fcp);
+
 	} else {
 		/* Otherwise just request a stop and wait. */
 		spin_lock_irqsave(&pipe->irqlock, flags);

-- 
2.49.0


