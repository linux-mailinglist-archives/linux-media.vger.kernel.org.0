Return-Path: <linux-media+bounces-23829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B809F8367
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 19:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7639E188ACE4
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 18:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273641AA1D9;
	Thu, 19 Dec 2024 18:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q8EepwIH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7AE1A9B25;
	Thu, 19 Dec 2024 18:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734633547; cv=none; b=Aw78VzBMa0kQ1pXfEXb5wESxHGW4iCQ8gaHfsdRsFrmoQhgsGiwrJI/vSyCjw/I1iKfkzAR8QvQSLpCgosLxRvH6cLsFuRi1dKgEK1JUw4sgfhRL1LBgkAac0ZDxYqay9FCjXbD9KXkAtLUfZSg3NlWDReu6EMSZiEtpUZVghdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734633547; c=relaxed/simple;
	bh=XaMs+Sf/J7HD4Gd5ISeUr575e/VWcvG3V82ckX1id6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CT1saByssWbu0DPYjjW0O1EwNgcQtyoNf17LwRrbR2+OmxRR5tJFT9FsEUR4tCt/2wobSf9q2AZ7Zud9AvaFb06H4d+Srx8DXfu2S32JSDi2d2kZJLKnBhQLpPF70kEoXuH9ugr7ggiUYZgmNudOHCsRj2A2ChjWylQQxB1H3tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q8EepwIH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5A406DE;
	Thu, 19 Dec 2024 19:38:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734633502;
	bh=XaMs+Sf/J7HD4Gd5ISeUr575e/VWcvG3V82ckX1id6Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q8EepwIHbtvXyZvGYr4a9usrRfkonAaNCoGWRsxGjdegf21uA9sXbz6g0ZnBz9Jku
	 B3NjRemFgbT7AKF7qrn8U2Os2gftIOA6GPAPS3Ix+jcHHmMJTb8zWgvmcur3v06+tW
	 cUs+1reJ5+mijLFLu2f8/FIJ5QaSHVnj37ljp2Ts=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Thu, 19 Dec 2024 19:38:30 +0100
Subject: [PATCH 2/2] rcar-fcp: Add FCPVD reset sequence for VSPD
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-v4h-fcp-soft-reset-v1-2-026e72dca514@ideasonboard.com>
References: <20241219-v4h-fcp-soft-reset-v1-0-026e72dca514@ideasonboard.com>
In-Reply-To: <20241219-v4h-fcp-soft-reset-v1-0-026e72dca514@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>, 
 LUU HOAI <hoai.luu.ub@renesas.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=mCe4Clc7f1askjHQ1h/OR8O8gRY38N2DK5C1REzwG/4=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnZGhD6QdtxR1QxGHq4zTQgNrhL+6v84tR/vd+Q
 LQX6jhDFaeJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2RoQwAKCRByNAaPFqFW
 PNj5D/47TECxTvLmdmmncW6UihY0v0xO6Wr7Ng0Vz8+weGtyZVp5nrdcHPWbQqQOfCk2keQCXvS
 wqEYarcJnUn5WsJj2xU7RpbkleoeoGqI3JEqXTD6WjilYH64s+hcdNg+u0XJf+KsZokZb7uzWbg
 YlL+mowM7gkwGZJdtU63lz2zHmhudGuYKIX48M3bGQrxrqpSY4XYRnr+E3MSlEYdQouqW9JOW2t
 knXxpr4ooLfqe5J2pnh4p+b5jjaYvrskq4e5+b4x3KbdDHCPq75jDQ6jTu/+VExQNwuiPOJ58J1
 nSdp3lg/B6Lkh2CUszfq3tMgqPEUW7wewg9bYuZB/3RufIYY8YIXxRDUVmrn9TP4gw5dwKqx7dB
 WGTGgtVmexFe1pJoST6HgD8T8+qGMD36d8AsWeYismu5D0bSgwYJHX2A1wd/Un5ZgmONWaJmRA8
 aJMwShNswrvQBo2A4VBTJPs3Y2W0iC5jh0tUK6TUFUEHSB9WkTSAJFbml8AKZwNduFbTju1ZQx7
 wCdHEF22uwWV+c+xIMSINub5fwH8RHrVbaz2vPwyqYlt7hDm0kMS3ofK7Tyo6VvyweDAnkPHD1C
 MOhoTl5iBbXGRcgvpQrFqp1f95b0JLv/L/KbcJMEbj9IsrnRSKxr7LykL9zxLbcOJ250KmsRjGv
 /3EJIoS6DScuANg==
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
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index bb0739f684f39e23326a4d8fdb9f43e020bc23c8..8dbbe92b522e49c795cf0b2bbe507871899ee15e 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -13,6 +13,7 @@
 #include <linux/wait.h>
 
 #include <media/media-entity.h>
+#include <media/rcar-fcp.h>
 #include <media/v4l2-subdev.h>
 
 #include "vsp1.h"
@@ -367,6 +368,11 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
 			pipe->state = VSP1_PIPELINE_STOPPED;
 			spin_unlock_irqrestore(&pipe->irqlock, flags);
 		}
+
+		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
+		    VI6_IP_VERSION_MODEL_VSPD_GEN3)
+			ret = rcar_fcp_soft_reset(vsp1->fcp);
+
 	} else {
 		/* Otherwise just request a stop and wait. */
 		spin_lock_irqsave(&pipe->irqlock, flags);

-- 
2.47.1


