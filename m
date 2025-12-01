Return-Path: <linux-media+bounces-47999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9A0C99178
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 21:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EBEE3A41BB
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 20:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BFE27146A;
	Mon,  1 Dec 2025 20:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QqsGdDCb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA06223DEF;
	Mon,  1 Dec 2025 20:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764622457; cv=none; b=ghLs53bnYhPmzw2jvVvxTNchrweMDjztF+0DD0Cwoey5hKQ7wQMzlDBmh/7xbUuEcwXTErIgx8llPrk4Im+P8VOZawPc2n6jrIGiJkyC57v6IUuuoCsH37OuVGa7ZRGpNXBPbywI7oNwnZ1jASdSLb1vPDsvfBm0Y7qORmXpVlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764622457; c=relaxed/simple;
	bh=arZO94CvoyZJrbIODUiQ/h4kmJbICjOtXQI878yFKyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CFWa7l7N/aEYFsCuhL8Cm9jxW2jv2qi28KvVqtRUoR/avkSr/py8G0UHCY4T48FEWSxtEZK6gr4vBVToUv2mAEUEdVBarf/xCiRwBRzVSaGeGkd7SAey5LhhiHDXzmTLbTj1nMZfHP+m0fRdGkd9F5NYhM8r2Kw0myDCKfvRdUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QqsGdDCb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from rui-Precision-7560.local (unknown [209.216.103.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E84BC6E;
	Mon,  1 Dec 2025 21:51:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764622319;
	bh=arZO94CvoyZJrbIODUiQ/h4kmJbICjOtXQI878yFKyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QqsGdDCbf4exnH8iWwBFwGlQbobzgdVvTZIXcaCrUJKggRf2rRUZbkZymoDmoLVX4
	 DHFtFYs0StN15cw6ZAFXnlG41Lierzavtw2+gzbyDQjspoai+X8awbr677oMzd59gX
	 uPYxtfQKT/2N+iLht4TyJACP1WdQS7oqNsllL974=
From: Rui Wang <rui.wang@ideasonboard.com>
To: linux-media@vger.kernel.org,
	dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: libcamera-devel@lists.libcamera.org,
	Rui Wang <rui.wang@ideasonboard.com>
Subject: [PATCH v3] media: rkisp1: Fix filter mode register configuration
Date: Mon,  1 Dec 2025 15:50:55 -0500
Message-ID: <20251201205309.528858-2-rui.wang@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201205309.528858-1-rui.wang@ideasonboard.com>
References: <20251201205309.528858-1-rui.wang@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rkisp1_flt_config() function performs an initial direct write to
RKISP1_CIF_ISP_FILT_MODE without including the RKISP1_CIF_ISP_FLT_ENA
bit, which clears the filter enable bit in the hardware.

The subsequent read/modify/write sequence then reads back the register
with the enable bit already cleared and cannot restore it, resulting in
the filter being inadvertently disabled.

Remove the redundant direct write. The read/modify/write sequence alone
correctly preserves the existing enable bit state while updating the
DNR mode and filter configuration bits.

Signed-off-by: Rui Wang <rui.wang@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index c9f88635224c..6442436a5e42 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -411,12 +411,6 @@ static void rkisp1_flt_config(struct rkisp1_params *params,
 	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_LUM_WEIGHT,
 		     arg->lum_weight);
 
-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_MODE,
-		     (arg->mode ? RKISP1_CIF_ISP_FLT_MODE_DNR : 0) |
-		     RKISP1_CIF_ISP_FLT_CHROMA_V_MODE(arg->chr_v_mode) |
-		     RKISP1_CIF_ISP_FLT_CHROMA_H_MODE(arg->chr_h_mode) |
-		     RKISP1_CIF_ISP_FLT_GREEN_STAGE1(arg->grn_stage1));
-
 	/* avoid to override the old enable value */
 	filt_mode = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_FILT_MODE);
 	filt_mode &= RKISP1_CIF_ISP_FLT_ENA;
-- 
2.43.0


