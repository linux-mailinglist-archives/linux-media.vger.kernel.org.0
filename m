Return-Path: <linux-media+bounces-49935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01ECF4EE7
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 18:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE98A3024268
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 17:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A30313557;
	Mon,  5 Jan 2026 17:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D8swEKdl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7414831D75C;
	Mon,  5 Jan 2026 17:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767633135; cv=none; b=CLaqbd/+Fb84TstYJU3FJLSXoW7PjBXhfY0U/8KqJgnXtXKWlsqa8AgOe1Q7CkOWKUWX9Tzz4xWony0nsUuuGOg5V23P662RT8ZXTDgkvld0reIZzrjeHJCl4AMWXXeAUMP1Zhmmn541QrlCwdxK+eHnNZY5g9f1ScW/gBblHxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767633135; c=relaxed/simple;
	bh=pDIvxJGIlX+hjy9FPe//FACZ0eNRYp4yWgqfgSVzjBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PKzc0uvGJrWPyxLDhX6K1TMiXixOFyvoqfCBBJTLv2kpm7/dXb7ds4wYZeDd+T/AYRLV6ncPAHdX7Z16pIelVZ9Fv3O9bG2SMhUUW9EHz76021LHNGvfShMge+6uLC5XKSfYCmki120iJ34WR0Ouz5MYAJLyG1nOJDJrrRPI5iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D8swEKdl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from rui-Precision-7560.local (unknown [209.216.103.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B9A026D1;
	Mon,  5 Jan 2026 18:11:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767633109;
	bh=pDIvxJGIlX+hjy9FPe//FACZ0eNRYp4yWgqfgSVzjBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D8swEKdlCt4EECcT3W9lhQhwoxfmQdRuN/04e2sWFC8pTYuRHbdUVvh3ihUBh86/O
	 x8IwdtlXNST1Xf4IZmASJpiKYEOB3Fm+HV0K79LxbadfVpgav8R8uvbuxWb4yreQo3
	 Smj0jhtMcQmVhCjR5jUZfTu5Fe8ZrbcFPcGbSkTc=
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
Subject: [PATCH v4 1/1] media: rkisp1: Fix filter mode register configuration
Date: Mon,  5 Jan 2026 12:11:42 -0500
Message-ID: <20260105171142.147792-2-rui.wang@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105171142.147792-1-rui.wang@ideasonboard.com>
References: <20260105171142.147792-1-rui.wang@ideasonboard.com>
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
 
Changelog since v1:
 1. Update version number from v1 to v4 to clarify the confusing

Reviewed-by Stefan Klug and Kieran Bingham
 from v1 are carried over (no function code changes).

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


