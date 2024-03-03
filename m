Return-Path: <linux-media+bounces-6304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2234D86F5D7
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 16:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F61E287174
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 15:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7143767E8A;
	Sun,  3 Mar 2024 15:27:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D04767C49
	for <linux-media@vger.kernel.org>; Sun,  3 Mar 2024 15:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.234.218.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709479641; cv=none; b=IMITW0PCzok9dKHrMJV2ts723AvQE6QUW9mG5TzezB3BDuK19makw4KLyt4dcA8EvxQrUWk1S4cVMRfh4SL4CrV1J8cFlud8lNFM+A0Wec2RczxIbuozemau8y4df6N0+LUFGD+jFvrNYgCTTI+JkAx3ROba4i9B4Swuw3c46ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709479641; c=relaxed/simple;
	bh=WTN90m22Z+iEU6BkNpJsOMOORQLyA9qgFU0XUUr9p6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JWvHyrsZGDuSqTHdoPoLL/aH6+BYkskE3K3UV88GMerchXBnsn+Jzl1COTnbD1X2TraLT6ugrvUVteMNcgwnab7uuEvjaLE5PcnHFgU4q4C/ty6xRiTqI3CwjS8R8H5Hc2Xc9LizMQSxIlayh1WSMexyaQkOz2aVXtaVdBmCxv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be; spf=pass smtp.mailfrom=rmail.be; arc=none smtp.client-ip=85.234.218.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rmail.be
Received: from localhost.rmail.be (unknown [10.238.9.208])
	by mail.rmail.be (Postfix) with ESMTP id 4A38C4C094;
	Sun,  3 Mar 2024 16:27:19 +0100 (CET)
From: Maarten Vanraes <maarten@rmail.be>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maarten Vanraes <maarten@rmail.be>
Subject: [RFC PATCH 08/13] staging/vchiq-mmal: Add parameters for interlaced video support
Date: Sun,  3 Mar 2024 16:10:03 +0100
Message-ID: <20240303152635.2762696-9-maarten@rmail.be>
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

Adds enum mmal_interlace_type and struct
mmal_parameter_video_interlace_type to allow for querying the
interlacing mode on decoders.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maarten Vanraes <maarten@rmail.be>
---
 .../vchiq-mmal/mmal-parameters.h              | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
index 26373b92a6b4..73319a9b4b90 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
@@ -801,6 +801,43 @@ struct mmal_parameter_displayregion {
 	u32 alpha;
 };
 
+enum mmal_interlace_type {
+	/* The data is not interlaced, it is progressive scan */
+	MMAL_INTERLACE_PROGRESSIVE,
+	/*
+	 * The data is interlaced, fields sent separately in temporal order, with
+	 * upper field first
+	 */
+	MMAL_INTERLACE_FIELD_SINGLE_UPPER_FIRST,
+	/*
+	 * The data is interlaced, fields sent separately in temporal order, with
+	 * lower field first
+	 */
+	MMAL_INTERLACE_FIELD_SINGLE_LOWER_FIRST,
+	/*
+	 * The data is interlaced, two fields sent together line interleaved,
+	 * with the upper field temporally earlier
+	 */
+	MMAL_INTERLACE_FIELDS_INTERLEAVED_UPPER_FIRST,
+	/*
+	 * The data is interlaced, two fields sent together line interleaved,
+	 * with the lower field temporally earlier
+	 */
+	MMAL_INTERLACE_FIELDS_INTERLEAVED_LOWER_FIRST,
+	/*
+	 * The stream may contain a mixture of progressive and interlaced
+	 * frames
+	 */
+	MMAL_INTERLACE_MIXED,
+
+	MMAL_INTERLACE_DUMMY = 0x7FFFFFFF
+};
+
+struct mmal_parameter_video_interlace_type {
+	enum mmal_interlace_type mode;	/* The interlace type of the content */
+	u32 bRepeatFirstField;		/* Whether to repeat the first field */
+};
+
 #define MMAL_MAX_IMAGEFX_PARAMETERS 5
 
 struct mmal_parameter_imagefx_parameters {
-- 
2.41.0


