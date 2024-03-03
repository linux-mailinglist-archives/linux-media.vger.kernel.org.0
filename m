Return-Path: <linux-media+bounces-6303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C1186F5D6
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 16:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A99B81C21A7E
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 15:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E5367C5F;
	Sun,  3 Mar 2024 15:27:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC9E67E74
	for <linux-media@vger.kernel.org>; Sun,  3 Mar 2024 15:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.234.218.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709479640; cv=none; b=Zqo+CGb0LwkFXszYOlZrdUTCa3n8aeUnpLBu/DO21xXnFBlgC14JxY6SYNnD8+xxKh/NnZia3Lu0jXvMVPrP/afs2cYrJZpurRvBKLgehB7VPwqzi6eeLoaokdqL3lzoUDcev8zN123Ul8nmGDk8bxTU7xD1b6fVbsqIRDCMV6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709479640; c=relaxed/simple;
	bh=ib2QZTG768ATOSPdjs7PNFUprADMw0C0VDI5M9E/yDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mG635qRkTK0dEq/pquOSH9fh7QW8GDAOZzLBGAbSRZnIolvyUofoOOhWL5DZt1lYQgOVwA794WV680k7L8l+BBdLiUiI+TTi6e/N4ovVzQt3XbqxI7szEcCxn4HU1xbxNXXq3i7GcDLGP+0Wv5yBgg8BvBd8E+c2KJiTnfNd7TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be; spf=pass smtp.mailfrom=rmail.be; arc=none smtp.client-ip=85.234.218.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rmail.be
Received: from localhost.rmail.be (unknown [10.238.9.208])
	by mail.rmail.be (Postfix) with ESMTP id D5A374C090;
	Sun,  3 Mar 2024 16:27:17 +0100 (CET)
From: Maarten Vanraes <maarten@rmail.be>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maarten Vanraes <maarten@rmail.be>
Subject: [RFC PATCH 07/13] staging/vchiq-mmal: Add buffer flags for interlaced video
Date: Sun,  3 Mar 2024 16:10:02 +0100
Message-ID: <20240303152635.2762696-8-maarten@rmail.be>
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

Add the buffer flags that the firmware uses to identify fields
on interlaced video

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maarten Vanraes <maarten@rmail.be>
---
 .../vc04_services/vchiq-mmal/mmal-msg.h       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
index ef84b4e35608..baf37254645a 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
@@ -253,6 +253,25 @@ struct mmal_msg_port_action_reply {
 /* Signals that a buffer failed to be transmitted */
 #define MMAL_BUFFER_HEADER_FLAG_TRANSMISSION_FAILED    BIT(10)
 
+/* Video buffer header flags
+ * videobufferheaderflags
+ * The following flags describe properties of a video buffer header.
+ * As there is no collision with the MMAL_BUFFER_HEADER_FLAGS_ defines, these
+ * flags will also be present in the MMAL_BUFFER_HEADER_T flags field.
+ */
+#define MMAL_BUFFER_HEADER_FLAG_FORMAT_SPECIFIC_START_BIT 16
+#define MMAL_BUFFER_HEADER_FLAG_FORMAT_SPECIFIC_START \
+			(1 << MMAL_BUFFER_HEADER_FLAG_FORMAT_SPECIFIC_START_BIT)
+/* Signals an interlaced video frame */
+#define MMAL_BUFFER_HEADER_VIDEO_FLAG_INTERLACED \
+			(MMAL_BUFFER_HEADER_FLAG_FORMAT_SPECIFIC_START << 0)
+/*
+ * Signals that the top field of the current interlaced frame should be
+ * displayed first
+ */
+#define MMAL_BUFFER_HEADER_VIDEO_FLAG_TOP_FIELD_FIRST \
+			(MMAL_BUFFER_HEADER_FLAG_FORMAT_SPECIFIC_START << 1)
+
 struct mmal_driver_buffer {
 	u32 magic;
 	u32 component_handle;
-- 
2.41.0


