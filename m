Return-Path: <linux-media+bounces-24081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0499FC656
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 19:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 682B57A13EB
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 18:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8081BDAAE;
	Wed, 25 Dec 2024 18:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="jgbRNH4Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DCA81ACA;
	Wed, 25 Dec 2024 18:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735152305; cv=none; b=fXkOXFAvogp1KMCOkwgdjr15b3sYe8oCotXJONiZUBRwChRYIKldvUdlG3kVXFMQ0X4WtDRrrEcDTNOzkrPdkZMe1HWDUeJNZpEpLptQ8yDcCt8iVIG2NDBHDqNAiAWxSr64r7c1yiVH3E+Mo0PTAQ5iSDWUqJJKdC6Fag/hJMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735152305; c=relaxed/simple;
	bh=BUkupmeCsXEr3SXRPBCUQlirm08/yBvne0NbNTvJMlg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gxUsONGsYEl0wIzY2gN+n7+jGSTlOa+Y3HJXdpy/F22zi80mS3P8Pq2mRBxITneU7OX3v7FwQj7ui7BVDMiOS8AFFMnPYjKlYDgMGgGJj10klX0LdQc6U3yz5oRtclvAJZLSfiDLcf9xMQRazGFXFce9iu9h3J1ZFKVnzwcBvt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=jgbRNH4Y; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=zdTB7pc5WS+HFB9gmP4+v5jC0oRIwy5wOUzdsemALV0=; b=jgbRNH4YyfbuAm/g
	4v8F0JvzwNIMi++L61yAa4LgeHkvSwkOqtxKrOsLsJrHtmnZW25jkGm0iQXwWtdfulk/Q/3fJzgCL
	agVV9L//0tk0VWUbxIR0uqWrg26iwa4QUQluZUi70Gw5qZeNpYsVDCq+tLLPAHucW9KFg1zqDiztI
	1fLX5uxHnyV9EkNBl8WnHR/Jwwueh1sZ7uIze/2KiA/jT5tNDKl8krvLyvHFNRCahziPXVZ2WLEjo
	rKVJ3axgC7WmbMSRCAeCIi/JWuyAvoCgWEIFpnLCb1VFmdTX+ybl/FGS0K0eNS9W4FP3YIUTU9sEp
	itC5M0++hzxtuGEWsQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tQWNK-0078WD-1u;
	Wed, 25 Dec 2024 18:44:54 +0000
From: linux@treblig.org
To: s.nawrocki@samsung.com,
	mchehab@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: platform: exynos4-is: Remove unused __is_get_frame_size
Date: Wed, 25 Dec 2024 18:44:53 +0000
Message-ID: <20241225184453.104368-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The last use of __is_get_frame_size() was removed in 2013 by
commit 5cfaad64d88a ("[media] exynos4-is: Fix format propagation on
FIMC-IS-ISP subdev")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../media/platform/samsung/exynos4-is/fimc-is-param.c    | 9 ---------
 .../media/platform/samsung/exynos4-is/fimc-is-param.h    | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is-param.c b/drivers/media/platform/samsung/exynos4-is/fimc-is-param.c
index 9c816ae3b3e5..443362da8cc8 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is-param.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is-param.c
@@ -204,15 +204,6 @@ int __is_hw_update_params(struct fimc_is *is)
 	return ret;
 }
 
-void __is_get_frame_size(struct fimc_is *is, struct v4l2_mbus_framefmt *mf)
-{
-	struct isp_param *isp;
-
-	isp = &is->config[is->config_index].isp;
-	mf->width = isp->otf_input.width;
-	mf->height = isp->otf_input.height;
-}
-
 void __is_set_frame_size(struct fimc_is *is, struct v4l2_mbus_framefmt *mf)
 {
 	unsigned int index = is->config_index;
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is-param.h b/drivers/media/platform/samsung/exynos4-is/fimc-is-param.h
index 206904674927..10ad02f36fed 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is-param.h
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is-param.h
@@ -994,7 +994,6 @@ void fimc_is_set_initial_params(struct fimc_is *is);
 unsigned int __get_pending_param_count(struct fimc_is *is);
 
 int  __is_hw_update_params(struct fimc_is *is);
-void __is_get_frame_size(struct fimc_is *is, struct v4l2_mbus_framefmt *mf);
 void __is_set_frame_size(struct fimc_is *is, struct v4l2_mbus_framefmt *mf);
 void __is_set_sensor(struct fimc_is *is, int fps);
 void __is_set_isp_aa_ae(struct fimc_is *is);
-- 
2.47.1


