Return-Path: <linux-media+bounces-28409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A15A67286
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 12:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3585189705B
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 11:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA0620ADC9;
	Tue, 18 Mar 2025 11:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DKG51toz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2099220ADEC;
	Tue, 18 Mar 2025 11:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742296950; cv=none; b=fyYFJ0AdIqrR3VUI4BL1zVj1RG3IR1MDBLaXefXnnt+BdFiWm4LItLSFjMMGHANjYngeeBmfleP9lq2auP80STa3RECdl0VmG2dTodCH6U+hLdArDChizNTsPz1v/lxK3kb7c4dElBPyYDMugIWATMxyxr1S8UDBQD5wvWb9U+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742296950; c=relaxed/simple;
	bh=ZN1jlt5fzffXHX7r0+lU8IjtsYcES1i+/u6V6QY9S6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QeIbf94irkVrZEHpMTLqAO3dTF6JxsZW5hkbjdFb87hsW8GdID8qY3CfwiNm7QZXDYK50B6079//YfW6f8w4JWRT33lBErUeNPFK4dEWgA3pB2km3YoveAdXd25xFUelzDWqYYQBKDy96gnh1cNbHEMJWmS901K9oBCdV3auKx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DKG51toz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FB381188;
	Tue, 18 Mar 2025 12:20:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742296839;
	bh=ZN1jlt5fzffXHX7r0+lU8IjtsYcES1i+/u6V6QY9S6U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DKG51tozjVBOs17B9SUbUo/ih1vO6JyFQ3RJPqaBhcuRBX7X++Df/sGR0V/4tashJ
	 wbUnyUuTDmASi7wlu6RZ3Ix8V7hFhBglLT9LmEHetGfYMd7t/dZ5pZC3uH+9Qat5tr
	 C1ZcrdYOekPpPlBnwgUOwBkftiqsQwckDL2FdyUY=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Tue, 18 Mar 2025 12:21:21 +0100
Subject: [PATCH v4 2/7] media: vsp1: dl: Use singleshot DL for VSPX
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250318-v4h-iif-v4-2-10ed4c41c195@ideasonboard.com>
References: <20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com>
In-Reply-To: <20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2VdqD7mgxYpYjaEojpFGaYZHhL6p1NbHN8ehM
 4K23eIsm36JAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9lXagAKCRByNAaPFqFW
 PEzaD/9KshTrgyLi6gyojr8FoPeTsHz/1C7uSooAl69QfTsIw7BB+4seQ11j1Dmn5Oa7N61s/GP
 E2HtM4h0MrrfvFRbUXhu9zRiW0FUKiE5haGKUjrfka74Il7zwFckxQ/ioOYEYr9ZjsvksHrRQrh
 BB11HGZHumZWabWf7fUeF+Aswpn27d7ABsidHup6jso9UBg/XP49sD7PX3rCDmkadT7Ko8IcvMb
 utJtWmuaBohpRBWLrpvINOhcG0pqTDi693TScZR/U2qtTMdld7zVsDnwzTUUH0L80Ur3R7OgTP9
 aOkERFOYLj8y4F0sTo1BYMdvIqF4QNEZPonRXQGH4n+JgaQKmrq7mlb7ytaXQpXfBQ5icqb2X9X
 dqkvBLEINbONqHRrmizpDTRTqJsqh0At1AF19kD6IGMe8AY+JfUvukGgXLVFiBjBUiUTds4kEco
 e6pwFaEWZAzbPLGcrV9NGNseGOh5zdeFPWBEQA2N8eDuNmqD7ifLd+4kSZaPI9JjM1ZhJtF82E/
 8jm+jjE/5UjtCO/w5sg6+aUvj5SKFDz7czlQ2LRIxxThTBqqtJYE1vZP4gCJzC9x+Y/NzhNv8GO
 EQxwCTqG9vxTPbsOPerioFIpZ+ZFq7A59OW6XskQVOd/XCua+ZtbClNkp0vci98C1OPjiT4Co3e
 Ug+bER1damoY3Dg==
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


