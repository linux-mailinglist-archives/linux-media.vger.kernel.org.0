Return-Path: <linux-media+bounces-6308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9AF86F5DB
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 16:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 857A51F22BF4
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 15:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4265E2EB09;
	Sun,  3 Mar 2024 15:27:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7192467C68
	for <linux-media@vger.kernel.org>; Sun,  3 Mar 2024 15:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.234.218.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709479646; cv=none; b=YAZrVtj8Po5FhLI3s+JLnhO9a7RgrxfhNieYT5o0YJQu+Iu+irlngU0NCnsJgYSCHpwl/zaRCd0sfujTX+69647JPhoXprPjCMur28ui5a+pQfKp/rYl/FbFAIOoNdfAAL9yclFHxK3CaFrQsEqT1TsU3a6ytko8QjqZhxmCxy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709479646; c=relaxed/simple;
	bh=ttDhTK8CGSPaiH1ZKTAzsPzmtLCKJIPdk6u/z18PORg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYg6ruLD/yQIgKIF8Dp06L1bsIXUWouGihL3DvxtGcc/FnDMr0n9HaeBewrXZVmjC7lw7XulUZNEXIqB8QaM8ahTQw3JFjgYoPZnB/Gr4dssgIuayzPIYSUo94NexANcjeA3+qQ5vOzp8P6KP851U4Wj8B5/teNpmoCwhKYvgj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be; spf=pass smtp.mailfrom=rmail.be; arc=none smtp.client-ip=85.234.218.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rmail.be
Received: from localhost.rmail.be (unknown [10.238.9.208])
	by mail.rmail.be (Postfix) with ESMTP id 921E34C0A5;
	Sun,  3 Mar 2024 16:27:24 +0100 (CET)
From: Maarten Vanraes <maarten@rmail.be>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maarten Vanraes <maarten@rmail.be>
Subject: [RFC PATCH 12/13] vc04_services: vchiq-mmal: Add defines for mmal_es_format flags
Date: Sun,  3 Mar 2024 16:10:07 +0100
Message-ID: <20240303152635.2762696-13-maarten@rmail.be>
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

There is a flags field in struct mmal_es_format, but the defines
for what the bits meant weren't included in the headers.
For V4L2_PIX_FMT_NV12_COL128 support we need them, so add them in.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maarten Vanraes <maarten@rmail.be>
---
 .../staging/vc04_services/vchiq-mmal/mmal-msg-format.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg-format.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg-format.h
index 5569876d8c7d..e8f5ca85a7c4 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg-format.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg-format.h
@@ -53,6 +53,16 @@ union mmal_es_specific_format {
 	struct mmal_subpicture_format subpicture;
 };
 
+/* The elementary stream will already be framed */
+#define MMAL_ES_FORMAT_FLAG_FRAMED				BIT(0)
+/*
+ * For column formats we ideally want to pass in the column stride. This hasn't
+ * been the past behaviour, so require a new flag to be set should
+ * es->video.width be the column stride (in lines) instead of an ignored width
+ * value.
+ */
+#define MMAL_ES_FORMAT_FLAG_COL_FMTS_WIDTH_IS_COL_STRIDE	BIT(1)
+
 /* Definition of an elementary stream format (MMAL_ES_FORMAT_T) */
 struct mmal_es_format_local {
 	u32 type;	/* enum mmal_es_type */
-- 
2.41.0


