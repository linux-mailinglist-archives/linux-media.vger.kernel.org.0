Return-Path: <linux-media+bounces-39445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F31B20CEC
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 17:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D3E64245FA
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 15:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84D02DF3F2;
	Mon, 11 Aug 2025 15:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WLFemwym"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6222DECC6;
	Mon, 11 Aug 2025 15:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754924433; cv=none; b=ZHSNuF3qFsxgdr6N4dIZEeh7GcEZLKCJZuILntOXoZA8jT9Xq4CcIc8p+ptDjFAKh03yNncm47vbI11s87DPxgc+/Dtvzw2Qrjd+txI58ivCXzEgOvnjNd+SteXOo6Zob0aj3UHtt0mTV3128gcUNSoaVPzrn3z4KO2rN9/PeVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754924433; c=relaxed/simple;
	bh=OfPaJwF2NqvhsMpHh+C8FnHDDOXI3HxcuuTEUJ1zXTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HNy9Mxf/tlHx2dQOGQ1WiOAhSO+w4R5iG/e4g5/YSXZDdIdDKjX/GYONM9vFMQaopgak2fIHcnSFel71vsObatWFdn21HaxVsFPjKRosgePuWLB7ghWluL+jyQCVAvBJuAoODSSl0nlNjNTo45cjjPOopd5yN0fqrR4ztTLuo3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WLFemwym; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754924429;
	bh=OfPaJwF2NqvhsMpHh+C8FnHDDOXI3HxcuuTEUJ1zXTM=;
	h=From:Date:Subject:To:Cc:From;
	b=WLFemwymTxFHpSqaFjYDh8D4g5Z3AnRmxJciNjevR87X6QsbJZ6iCmw+PzQs39ILt
	 v/LKs0B8c/HQhagBjBmPAtHOayWquww6fdEYFwpyTBt+bYyi32vtbNK5H7z1pVlqG0
	 TkkjdS9BDD7SUwirT9x6S8pi44qdoP362J19TYICTL1vwoXNTuER5WUndWxwDS8dUs
	 fk1+HktTyU2wWZlt1Hou7brv5fhw5ra4E1ZWDjVEuFK/AzHnq6VEJlH4FgsSREAOQ/
	 KJflIRPFVwGYs+trnI7V7olwXcC/xreTTLlo5P4QTpJlgeMEdzd1pqUicpRbQwQEMm
	 w9q0bOsmJ/zLQ==
Received: from [192.168.13.180] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D16917E00AC;
	Mon, 11 Aug 2025 17:00:28 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Mon, 11 Aug 2025 11:00:19 -0400
Subject: [PATCH v3] media: rkvdec: Remove redundant
 pm_runtime_mark_last_busy() calls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-rkvdec-redundant-pm-rebase-v3-1-7cb5eea621a9@collabora.com>
X-B4-Tracking: v=1; b=H4sIAIIFmmgC/43NQQ6CMBCF4auQWVtDi0RwxT0Mi7YzSCO0ZIqNh
 nB3Kydw+b3F/zaIxI4i3IoNmJKLLviM6lSAHbV/kHCYDapUddlIKfiZkKxgwpdH7VexzBlGRxK
 ErWmamkgjQg4sTIN7H/F7nz26uAb+HF9J/da/skkJKdrSXq5KVoMx1NkwTdoE1mcbZuj3ff8Cc
 C/l/MgAAAA=
X-Change-ID: 20250811-rkvdec-redundant-pm-rebase-ed9b885eeadd
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2

From: Sakari Ailus <sakari.ailus@linux.intel.com>

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Changes in v3:
- Fixed truncated subject line
- Added Heiko Rb
- Link to v2: https://lore.kernel.org/r/20250811-rkvdec-redundant-pm-rebase-v2-1-90c47213fbbe@collabora.com

Changes in v2:
- Re-applied since the driver have been moved out of staging
- Link to v1: https://lore.kernel.org/all/20250704075450.3221972-1-sakari.ailus@linux.intel.com
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index d707088ec0dc1f6a18b2d168ebdf20b443f2240e..445f7c92eee34f7d6f885bb519d9eb24313da548 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -765,7 +765,6 @@ static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	pm_runtime_mark_last_busy(rkvdec->dev);
 	pm_runtime_put_autosuspend(rkvdec->dev);
 	rkvdec_job_finish_no_pm(ctx, result);
 }

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250811-rkvdec-redundant-pm-rebase-ed9b885eeadd

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


