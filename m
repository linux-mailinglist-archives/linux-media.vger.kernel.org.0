Return-Path: <linux-media+bounces-6298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2B086F5D1
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 16:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45A481F22C4B
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 15:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E068667C78;
	Sun,  3 Mar 2024 15:27:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D349067C45
	for <linux-media@vger.kernel.org>; Sun,  3 Mar 2024 15:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.234.218.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709479634; cv=none; b=muzOUeYBUpWsS3iFL1Nmzzhe/cgMbhIMnI6kedIil2tJC5c1Zu0RumrkZQeinVZ94eWGzxBLnscezKKjeq6MyDQc5jOH4xKVpIOUgFfaMaFaFYxwyeAiuSUFh1r3CGZazljHYcV5XL6aZYTpPNW0qb2UcC70YRLRUaRfIHxxAJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709479634; c=relaxed/simple;
	bh=hVD+MQ3Nmyg00kdJ/KfUXqYT3S7rGc2znPVcIZPzNHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rRyQ2zpKN+8x4cTBnW19kHB12oEgE9picq3mbSMcHgZQc3DmF4OW/Fzn23JLyR6pyMWijTk8ZQLpV8pkSzhPnuQ1yVqEA759bNgUx+ivMm+9TSRI4Y71Avqqfxe2AT8MmGdW5oGYJbNFMhC37VD75HVFSNP9A2Jhs0Tr+Yz/E3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be; spf=pass smtp.mailfrom=rmail.be; arc=none smtp.client-ip=85.234.218.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rmail.be
Received: from localhost.rmail.be (unknown [10.238.9.208])
	by mail.rmail.be (Postfix) with ESMTP id AA0504C07C;
	Sun,  3 Mar 2024 16:27:09 +0100 (CET)
From: Maarten Vanraes <maarten@rmail.be>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maarten Vanraes <maarten@rmail.be>
Subject: [RFC PATCH 02/13] staging: mmal-vchiq: Update mmal_parameters.h with recently defined params
Date: Sun,  3 Mar 2024 16:09:57 +0100
Message-ID: <20240303152635.2762696-3-maarten@rmail.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240303152635.2762696-1-maarten@rmail.be>
References: <20240303152635.2762696-1-maarten@rmail.be>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

mmal_parameters.h hasn't been updated to reflect additions made
over the last few years. Update it to reflect the currently
supported parameters.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>

staging: vc04_services: mmal-vchiq: Update parameters list

Adds in a couple of new MMAL parameter defines.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maarten Vanraes <maarten@rmail.be>
---
 .../vchiq-mmal/mmal-parameters.h              | 38 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
index 5e6276aca143..26373b92a6b4 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
@@ -634,7 +634,43 @@ enum mmal_parameter_video_type {
 	MMAL_PARAMETER_VIDEO_ENCODE_H264_LOW_DELAY_HRD_FLAG,
 
 	/**< @ref MMAL_PARAMETER_BOOLEAN_T */
-	MMAL_PARAMETER_VIDEO_ENCODE_INLINE_HEADER
+	MMAL_PARAMETER_VIDEO_ENCODE_INLINE_HEADER,
+
+	/**< Take a @ref MMAL_PARAMETER_BOOLEAN_T. */
+	MMAL_PARAMETER_VIDEO_ENCODE_SEI_ENABLE,
+
+	/**< Take a @ref MMAL_PARAMETER_BOOLEAN_T. */
+	MMAL_PARAMETER_VIDEO_ENCODE_INLINE_VECTORS,
+
+	/**< Take a @ref MMAL_PARAMETER_VIDEO_RENDER_STATS_T. */
+	MMAL_PARAMETER_VIDEO_RENDER_STATS,
+
+	/**< Take a @ref MMAL_PARAMETER_VIDEO_INTERLACE_TYPE_T. */
+	MMAL_PARAMETER_VIDEO_INTERLACE_TYPE,
+
+	/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_VIDEO_INTERPOLATE_TIMESTAMPS,
+
+	/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_VIDEO_ENCODE_SPS_TIMING,
+
+	/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_VIDEO_MAX_NUM_CALLBACKS,
+
+	/**< Takes a @ref MMAL_PARAMETER_SOURCE_PATTERN_T */
+	MMAL_PARAMETER_VIDEO_SOURCE_PATTERN,
+
+	/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_VIDEO_ENCODE_SEPARATE_NAL_BUFS,
+
+	/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_VIDEO_DROPPABLE_PFRAME_LENGTH,
+
+	/**< Take a @ref MMAL_PARAMETER_VIDEO_STALL_T */
+	MMAL_PARAMETER_VIDEO_STALL_THRESHOLD,
+
+	/**< Take a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_VIDEO_ENCODE_HEADERS_WITH_FRAME,
 };
 
 /** Valid mirror modes */
-- 
2.41.0


