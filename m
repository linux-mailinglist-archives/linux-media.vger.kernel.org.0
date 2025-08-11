Return-Path: <linux-media+bounces-39434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E03B20B3B
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 16:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC49E7B9A5D
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 14:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF1C22652D;
	Mon, 11 Aug 2025 14:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ar/QfdpG"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6053221F06;
	Mon, 11 Aug 2025 14:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754921059; cv=none; b=GOdqRH6+LtDiS0Ib+QRzdaMLUG0QAsY9PilcBjs5jC14XG8ycjTXjhzcuD3N6iARWlj9rfZW1C8/AkB6t6grAHjVBJXtAhiBr/v9U+llYJ7K1aazuo9+cUAJjsXsLodlwhPQpyYJFpjcbSsn22tCaeA6etapveplqPLj2mMW248=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754921059; c=relaxed/simple;
	bh=mObt81GrRK+X8Psfo4s7r7KxlJhLpHXzeRP0v136YbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AK2UmzUE74u21qrRtq9CBoGi+lQWqviuuE3bHtPX9OCsvzTazd4VWP+3BltML4K4l1JSOpCh3llg65FwBgvN4huoc/MUgslJBDQD/IfcH1Qa4UXaVlaoqpjMgIOEjsPF9npRfVF2nOuhtjbQd0TjkgWHR0SAKgmhzLxZ64BVSBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ar/QfdpG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754921054;
	bh=mObt81GrRK+X8Psfo4s7r7KxlJhLpHXzeRP0v136YbQ=;
	h=From:Date:Subject:To:Cc:From;
	b=Ar/QfdpGhFIgKMPfBQO6fOB56tqH0MPqFO8JMMXqRnBSNjkwyWOD1Yh1qX/ju19JC
	 rmdiulGZIjBK/SS0YIVy0DXOlADWSiLaqMsylywhF73t2rFeEUmyVt/rXCLfhccO69
	 s7bCVd5cRefWnJmNHD/yACf4U0QW2upDYWx0sF00GB+/XoP2KIzQhQG+d4Oauk/Rdf
	 twEzz35wD9UTw61EqVsV+LPfa4cAuzAWv7UMCmvJ9b/PepGwOfjQ5OyBG+PlzgIQGo
	 mVrjjcImbfWv5/HMzchdcQTo0QvZrS+k19YmZP9Xkv0L0Trou73S279JOrsvVLZt8/
	 jcjcwiEP0dMoA==
Received: from [192.168.13.180] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2866A17E0FA8;
	Mon, 11 Aug 2025 16:04:13 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Mon, 11 Aug 2025 10:03:45 -0400
Subject: [PATCH v2] media: rkvdec: Remove redundant
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-rkvdec-redundant-pm-rebase-v2-1-90c47213fbbe@collabora.com>
X-B4-Tracking: v=1; b=H4sIAED4mWgC/x3MQQqDMBAF0KvIrDsQA0L0KqWL6Hx1EFOZtFII3
 r3B5du8QhmmyDQ0hQynZn2nCv9oaFpjWsAq1eSd71xoW7btFExskG+SmD587BVjzGBIP4bQAVG
 EanAYZv3d+fN1XX81p9RAbAAAAA==
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
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Changes since V1:
  - Re-applied since the driver have been moved out of staging
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


