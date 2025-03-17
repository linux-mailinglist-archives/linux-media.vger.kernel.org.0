Return-Path: <linux-media+bounces-28356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F65A64D7F
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 12:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC24E172C76
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 11:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF91239595;
	Mon, 17 Mar 2025 11:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bF+r6iz7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04946238D5A;
	Mon, 17 Mar 2025 11:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742212659; cv=none; b=SqnjSM/pbpj7Nd33b59DaBN2e2DcLWPBGtf0yLfUasaj93aDfyRnLhZf3ra+GpyqBt5GvXQz+YJM4MmHm72LKRH/CXcX5PTCEJ/yFeN9VJr5iRTLP1luQzw8z+7BvuFkLdaVXjhAxzur50+jXI8TxcehnFNskyeqy1lsht24iqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742212659; c=relaxed/simple;
	bh=ZN1jlt5fzffXHX7r0+lU8IjtsYcES1i+/u6V6QY9S6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=USKzvWuECCy7ZySprOgZLIi4s9Nk4tah4geUUXhZHmzar+9sAB1CHFL6er25pVsYuVk8HDKmDYNA5xrOSNOEnUvXw2SLgj1MBm5CMYwpd5HDjueVTwypyXXrhKpODUzfA/Pfaplb1+LnGe4elXLSLRQoKtxA7Z+l8WgJtcEdjrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bF+r6iz7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 663FDD77;
	Mon, 17 Mar 2025 12:55:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742212546;
	bh=ZN1jlt5fzffXHX7r0+lU8IjtsYcES1i+/u6V6QY9S6U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bF+r6iz7NKeoeXe+OZ2KT7zKmdz4fWHZDb1YyCenVAU2b7YQivvSiWhgVsdgOulbR
	 1qjf8jque5sOk3okpJx6RN3E8dxKa9N5+paYLRaYNK8p2dGlMtPzFkEnWHVnYu/bK4
	 oUb4WeWy7KB9rDJCI6sbhP2Q+SwAYzHKJAYmmIVY=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 17 Mar 2025 12:56:40 +0100
Subject: [PATCH v3 2/7] media: vsp1: dl: Use singleshot DL for VSPX
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250317-v4h-iif-v3-2-63aab8982b50@ideasonboard.com>
References: <20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com>
In-Reply-To: <20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1937;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=ZN1jlt5fzffXHX7r0+lU8IjtsYcES1i+/u6V6QY9S6U=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2A4lmr3g0RO3lAsm5eR9hiR6UKpF4XYGxJIwU
 TWP+qPqK0iJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9gOJQAKCRByNAaPFqFW
 PH8qD/47EVF1oWgUKg2kJwZodPEBzBMghS3MzWSVjRg45g6iRlnnV0EZEyf0YQ5gpemzjyA333z
 7ho39ER1n5nDdpSoh/oXKcPawIcogfPE3WzhNeIElv3qlSOnf8pTMWdu+nfPQp6KDfVF3rbL110
 5KMw1+hTRnebOBfEFjC6oG244ThNE2CBvwu7zKaemlJdJLu/2CupEKbH1V/gqY/rScxGEuOojCB
 uaRcomW20oftvDMEG+O74rdcnkP/0L/jhB2jIVj13stdtAfm2YK5XNF4xSA+N8XIc4x9Sz1VpbK
 A63znN0R854OZt0OPbv2URbH8LiqIUpVYK0jWzaybevJ6tSlSRfrPph+7ytRITG4bxu2fEA7eTb
 jwU7VfH1Zl2X67dDvVPxRkU2xLDHK27ursyPXmagtXxkZ9fIQgJLv+EgxHKLQ8AmCBAKB7hU7WF
 6FXZgmedckoQYdlWq3O4Ui0CLzxBWdGGIp5hVUU2caDPqBSJA44rdWaVyjHWJxBeWQ78meh7LO2
 s6F380YtZjMOEUEIHL7vFWLGnU3sDALrjZLxN41QbhiRzea2EhDWE74dMK6ar/qBhwDRukGzmt3
 UaQs8QHQh/iazukS5ATRH8Q0J9y97pKYfHetero/W2hiTDvbCt9Ddaa/T/f5zp0/v2XiwZZxkGb
 qmHU+rWrHq2vteQ==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The vsp1_dl library allows to program a display list and feed it
continuously to the VSP2. As an alternative operation mode, the library
allows to program the VSP2 in 'single shot' mode, where a display list
is submitted to the VSP on request only.

Currently the 'single shot' mode is only available when the VSP2 is
controlled by userspace, while it works in continuous mode when driven
by DRM, as frames have to be submitted to the display continuously.

For the VSPX use case, where there is no uapi support, we should however
work in single-shot mode as the ISP driver programs the VSPX on
request.

Initialize the display lists in single shot mode in case the VSP1 is
controlled by userspace or in case the pipeline features an IIF entity,
as in the VSPX case.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

---
v2->v3:
 - Drop () in condition
---
 drivers/media/platform/renesas/vsp1/vsp1_dl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
index ad3fa1c9cc737c92870c087dd7cb8cf584fce41b..bb8228b198249943399719b5f37c337fc43eed5b 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
@@ -1099,7 +1099,12 @@ struct vsp1_dl_manager *vsp1_dlm_create(struct vsp1_device *vsp1,
 		return NULL;
 
 	dlm->index = index;
-	dlm->singleshot = vsp1->info->uapi;
+	/*
+	 * uapi = single shot mode;
+	 * DRM = continuous mode;
+	 * VSPX = single shot mode;
+	 */
+	dlm->singleshot = vsp1->info->uapi || vsp1->iif;
 	dlm->vsp1 = vsp1;
 
 	spin_lock_init(&dlm->lock);

-- 
2.48.1


