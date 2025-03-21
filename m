Return-Path: <linux-media+bounces-28574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC84AA6BE7C
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 16:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF5E97A814D
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 15:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57F222ACC6;
	Fri, 21 Mar 2025 15:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YckXoq8p"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0A422423F;
	Fri, 21 Mar 2025 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742571949; cv=none; b=KHLNpFye82ZpEgMYnCIdHAQc1iS/bvwtag0G/yUNt3t9BD3NYF1fBkJqETaEVoqGx/eog+I+GDcULuxAy5vJeDGw3t8E3X2bLOZr/Dyym+XQXuUKHwFcHrMe3iTNFlukR897hlGgvGDxMdgN8HMcOREtwqyQuHr8rUiMm6AZ21k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742571949; c=relaxed/simple;
	bh=Yajun6kMjbV9z3AGrMVZcN4ap3LqbMRdasdkVLXWuJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D3qG75N7rmt4fRxm2HXOJRPyGcplwZaCsnxqClwMBANEcnMhAjes3ZqucVN3Q6O0Lj+zsM+3qhBbFOyyXoLE92my6jw7Zg5xtNGkRwbKtMFZg0SY5H2Ym2QtQkcGlXqEge7v/OtGveGYdkkjRIfT1durrRfiU5Puv7Z935ZBANE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YckXoq8p; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.109] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFCCF1112;
	Fri, 21 Mar 2025 16:43:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742571839;
	bh=Yajun6kMjbV9z3AGrMVZcN4ap3LqbMRdasdkVLXWuJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YckXoq8pSPNNgsZKlsVEYFsp7stB43SHng05TPsR7xeo2U3gZsh4/YTXaPUJWOSXL
	 6cEQyIkzcrTUAuAHyOQuSl//LUr6fSh3mZtr6ZzBbJz3qdW+rM1PW8aeug7Sb81KFb
	 TIwyvIH0Nr3DToF3ZUfE03OmSMSGww5/fbzvJ0Fo=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Fri, 21 Mar 2025 16:45:34 +0100
Subject: [PATCH v6 2/7] media: vsp1: dl: Use singleshot DL for VSPX
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250321-v4h-iif-v6-2-361e9043026a@ideasonboard.com>
References: <20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com>
In-Reply-To: <20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=Yajun6kMjbV9z3AGrMVZcN4ap3LqbMRdasdkVLXWuJA=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn3YmkiNEmfWJCU59bpklY/1LtzZjvUCpRElBJ3
 OdJm/eYEnSJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ92JpAAKCRByNAaPFqFW
 PK5BD/wPsyuS2aF4gRZ+wjfZDURpqDpG9s57hvIZZbXhLMKz7LRvBhWPzBWQPkimzVDcTOaXjQU
 l95yITRziFwMTWXZEedUkbxsGPdVh0y3PCtlMXer/SJ1vdx++rQ5StrX9eXspIyUhRjufJBABoT
 CgjdKacMDAlQTNwDJ86502YVS2HUAcT5G8JhFZ4CGUnQVQCPxBly/55W9JLoIrJBWtNrSeK/DV0
 qBLOpn3efS8a5k+qf2mM+ixg3s4Mie9h3GrhlfxlJk7PPaLXU3Y2f+mxttDki1aRpJu+D0Ystfz
 g+nYhqoomyFTfH3qToGUsiOsNEFdkn/1jddA8dqeoQEdQgmGENW9elU4VOeK4TbYpjotjStM7IM
 66WwItgzcrYnoemUz1VTQE1MYlCTtrSC4AbgNiPSCAummj8cVtjC1LhSAyV1xXpehx0ijyyMvwd
 hgHvGF7EuAULeaV7bHQ8UAGsg7rA7dz+98VSc/LO1JSxTKIsxgCsGtRKKkvy9abbNcA21SRv7lu
 IIjjtNWM6qyWEY7mez7aal22wShNc18TRGu/juunBK4BKNell5uudP005thz1Or12Ea0XTT6c3Z
 L18eBLKGSKkkjrq4uIlbXG1N2dp7igRMJkY0mg+Rx0SolW9Wyx93TUrWYW+qp84GoPqHU0TcLNg
 wQyQbM70/6rGiIg==
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
index ad3fa1c9cc73..bb8228b19824 100644
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


