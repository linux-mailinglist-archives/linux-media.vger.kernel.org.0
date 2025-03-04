Return-Path: <linux-media+bounces-27461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5620AA4DC27
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 12:14:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B55D63AE0ED
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFFE202984;
	Tue,  4 Mar 2025 11:11:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123D3202971
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 11:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741086686; cv=none; b=WxwSFpr+3w5TfT7MeAN5Ob7rt7l2NxAlTU0nVnNJ4CQWdHXWp9ixVStN/Rn9MDAJe9c7VhKiDlyYNrm058nCBeURUQcw61hH9E+hBVwr3GatmJwUqlYLYLvCS1rAAtwxXunzWA7cZ9pLImJOIAWU4E40h/bO4UsnzPX7ifc5YN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741086686; c=relaxed/simple;
	bh=gRqNUwd+o252LIWHTjJmWILyr0Agv9p1OTA4S2TSSa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ln75TiM0gedtrRgtyGEPWrVe63P3UeFUwiDTmDbSwrQCfMoXUsY1a0ZO0CE389sNW6zfeYPD0ct6Pb8yJnqvh4aoWkM8NvNX33lLYf0FU7839iy2TAVLjteAvJbsRdFTv3Zx8MPAtRXl87rbF+HquqGzLBY7q2ohI8mfi0IKohE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620CFC4CEE5;
	Tue,  4 Mar 2025 11:11:25 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 1/8] media: v4l2-tpg: use (t,l)/wxh format for rectangle
Date: Tue,  4 Mar 2025 12:08:07 +0100
Message-ID: <add97aa9a4e4aedc84f00743dd9f9a3ff8bb61d9.1741086494.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1741086494.git.hverkuil@xs4all.nl>
References: <cover.1741086494.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Standardize reporting of rectangles to (t,l)/wxh.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
index ded11cd8dbf7..931e5dc453b9 100644
--- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
+++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
@@ -2249,10 +2249,10 @@ void tpg_log_status(struct tpg_data *tpg)
 		tpg->src_width, tpg->src_height,
 		tpg_color_enc_str(tpg->color_enc));
 	pr_info("tpg field: %u\n", tpg->field);
-	pr_info("tpg crop: %ux%u@%dx%d\n", tpg->crop.width, tpg->crop.height,
-			tpg->crop.left, tpg->crop.top);
-	pr_info("tpg compose: %ux%u@%dx%d\n", tpg->compose.width, tpg->compose.height,
-			tpg->compose.left, tpg->compose.top);
+	pr_info("tpg crop: (%d,%d)/%ux%u\n", tpg->crop.left, tpg->crop.top,
+		tpg->crop.width, tpg->crop.height);
+	pr_info("tpg compose: (%d,%d)/%ux%u\n", tpg->compose.left, tpg->compose.top,
+		tpg->compose.width, tpg->compose.height);
 	pr_info("tpg colorspace: %d\n", tpg->colorspace);
 	pr_info("tpg transfer function: %d/%d\n", tpg->xfer_func, tpg->real_xfer_func);
 	if (tpg->color_enc == TGP_COLOR_ENC_HSV)
-- 
2.47.2


