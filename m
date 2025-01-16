Return-Path: <linux-media+bounces-24846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A024CA13A7C
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 14:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04269167CB5
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 13:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37C41F3D5F;
	Thu, 16 Jan 2025 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="n62c+lQH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f98.google.com (mail-ed1-f98.google.com [209.85.208.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B461F37AB
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737032847; cv=none; b=a5Wh0rh6bqVWMn5pjkiIYzQJt360NnD3pkrbUtSwcchLNvFXrB1o2wZxUvY9uzpk0uyh6OmGYfThga62vsSp2TmBKkds0mt+gn0tP4/vI4DnveTo4Ij+andMIRhOPW5paDOd/HQ1yzrSFCkw43E2pI1YOWBznDYCuIc8ggHi0u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737032847; c=relaxed/simple;
	bh=NLVUtRDWIyErhGq1btJXLWXuuVShqXuFKgAtujLSvrU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q7SWsZS0jtyX1Y/Qrk6t8yG9HXRd6iMT+zIW6Nal7dDJ5n0A0zvcflyEhmQH9v8RCNwS6Wi2iPtO2JVNwaV8CNi3fDeOLIa64cdHu5X+Etpudv09J4h16ImILX/05AoABxv07iQIYyECDjy7vEgM8edJ7xgCbZyqNOmCrk2hx68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=n62c+lQH; arc=none smtp.client-ip=209.85.208.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ed1-f98.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fdafso1851823a12.0
        for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 05:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737032843; x=1737637643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7P+v3T+nrQTMibupPu9ktHQrDK2ERVyoiAaGUmlwr34=;
        b=n62c+lQH0MrrRQQFas4C5JMk8qJxJNQsTb29k1yJbyez43m40/zCmKip9Z52CPoh06
         Y6hbrDbp1CT+nKJrIk5Pnp+XKVOPH0/wEPo3PfGFAhGpFjFnNVjPH+QYcBbSsvnEhUzz
         ZXSTuSQ5dfaEbVW348F/uJzt88TmAeB1BD37VDdDftvX6SyAcGFVHPlM30xXdASjh6hi
         L7Pe78yEvFkzxCr2ngEFqucOtGNAFiQq9ygFuyHRiJ8YLMFsoyuu/jMUrGuEmzAVYb1W
         O011O931wybJxn5Q3xGuPo24E94esoztJdwqd7pc5DJp0Q+fK8nWK4v2xcJLdJfLHrOp
         lClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737032843; x=1737637643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7P+v3T+nrQTMibupPu9ktHQrDK2ERVyoiAaGUmlwr34=;
        b=GoaDLWEjmNlQd2/72hmGlaeJa/GmhJZ7rFBnXPlvhaMPZkHWMiqSu6YLt3Z4Ihkoui
         M3R/phc+ADC4WZx+yL6Qnqlm61cDu7NjCj2YTas0TaOJD+x+Ptc12gH9a08kd20qjcS2
         7Wg2V+SOZ6sBAX21xZzzFBJMylhEbZiWd9aeB1zxo/AVwm+jXJw58DdPhqCsRbn2oKk0
         6dYoFFHxlixNuYcfTVJHbc1Lm8QRyO56Rx/senMiE6yhoM8FPXRW4tgbdUXusdG2qH33
         AYdNSyF6ci6ETiS9tjWyy8lrMwwArGb1lbZcsADEbYSnaRurr0GJMJWmFtq9lpSBE7Tg
         eByg==
X-Gm-Message-State: AOJu0YxQ2Z/5RszGYuOzQlngK3hU68cIsZyVQx2bgvQEE0YocFAHP23W
	L13lf4hY1O8A8keZc78gfBIq/lJ5LO9gg9KaHxtRkHUw3PWrkvtB5DBEbHj76nr0bCGVVv79ou0
	w9mZWppAsaxZZHcBFvxY9HVCq2Hq8+SwR
X-Gm-Gg: ASbGncut+nU1T7aq/3CmSHxtQ7M+uJvkv6OBbdPEqI5vw68e/Y2ClC1N9n3wgIXwwiZ
	GlALwf6NT+4YS5LqfUR+qK7pQ2yonFFYb8krQ2PIYshMrALk/df+5O4AVphVOryVQlv8w071aJo
	Zei3YlljPUz8uUGtKXuHEsX8dY3g5dfVQy7FaY6HmJejxGdk9Qdjdu5HgUpPV2/KckoAsHgQgZo
	Gyxb5dhztAKvE/5o2mS/huPmXuVToyIGuBwZriLrsuv8ni752GP3mYe0OY5npFWwVlJvbJk
X-Google-Smtp-Source: AGHT+IGViDPhV57wZ6b9jVwuuHeCZhjQncFp1lN6cuhdiqlXIycDF1nRHxi+kNX1Yeo7TN1wCIAeIuZIX8jO
X-Received: by 2002:a05:6402:3514:b0:5da:105b:86c2 with SMTP id 4fb4d7f45d1cf-5da105b87d5mr4665682a12.20.1737032843068;
        Thu, 16 Jan 2025 05:07:23 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id 4fb4d7f45d1cf-5d99efc9b94sm660964a12.28.2025.01.16.05.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 05:07:23 -0800 (PST)
X-Relaying-Domain: raspberrypi.com
From: Naushir Patuck <naush@raspberrypi.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jacopo.mondi@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH v1] media: uapi: pisp_be_config: Remove unused config fields
Date: Thu, 16 Jan 2025 13:07:21 +0000
Message-Id: <20250116130721.3354550-1-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fields should not be set by either the user or the kernel driver
so remove them. Replace them with padding bytes to maintain uapi
compatibility.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
---
 .../linux/media/raspberrypi/pisp_be_config.h  | 42 ++-----------------
 1 file changed, 4 insertions(+), 38 deletions(-)

diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
index cbeb714f4d61..82560db4da61 100644
--- a/include/uapi/linux/media/raspberrypi/pisp_be_config.h
+++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
@@ -716,13 +716,6 @@ struct pisp_be_hog_buffer_config {
 /**
  * struct pisp_be_config - RaspberryPi PiSP Back End Processing configuration
  *
- * @input_buffer:		Input buffer addresses
- * @tdn_input_buffer:		TDN input buffer addresses
- * @stitch_input_buffer:	Stitch input buffer addresses
- * @tdn_output_buffer:		TDN output buffer addresses
- * @stitch_output_buffer:	Stitch output buffer addresses
- * @output_buffer:		Output buffers addresses
- * @hog_buffer:			HOG buffer addresses
  * @global:			Global PiSP configuration
  * @input_format:		Input image format
  * @decompress:			Decompress configuration
@@ -761,28 +754,10 @@ struct pisp_be_hog_buffer_config {
  * @output_format:		Output format configuration
  * @hog:			HOG configuration
  * @axi:			AXI bus configuration
- * @lsc_extra:			LSC extra info
- * @cac_extra:			CAC extra info
- * @downscale_extra:		Downscaler extra info
- * @resample_extra:		Resample extra info
- * @crop:			Crop configuration
- * @hog_format:			HOG format info
- * @dirty_flags_bayer:		Bayer enable dirty flags
- *				(:c:type:`pisp_be_bayer_enable`)
- * @dirty_flags_rgb:		RGB enable dirty flags
- *				(:c:type:`pisp_be_rgb_enable`)
- * @dirty_flags_extra:		Extra dirty flags
  */
 struct pisp_be_config {
-	/* I/O configuration: */
-	struct pisp_be_input_buffer_config input_buffer;
-	struct pisp_be_tdn_input_buffer_config tdn_input_buffer;
-	struct pisp_be_stitch_input_buffer_config stitch_input_buffer;
-	struct pisp_be_tdn_output_buffer_config tdn_output_buffer;
-	struct pisp_be_stitch_output_buffer_config stitch_output_buffer;
-	struct pisp_be_output_buffer_config
-				output_buffer[PISP_BACK_END_NUM_OUTPUTS];
-	struct pisp_be_hog_buffer_config hog_buffer;
+	/* For backward compatibility */
+	uint8_t pad0[112];
 	/* Processing configuration: */
 	struct pisp_be_global_config global;
 	struct pisp_image_format_config input_format;
@@ -823,17 +798,8 @@ struct pisp_be_config {
 				output_format[PISP_BACK_END_NUM_OUTPUTS];
 	struct pisp_be_hog_config hog;
 	struct pisp_be_axi_config axi;
-	/* Non-register fields: */
-	struct pisp_be_lsc_extra lsc_extra;
-	struct pisp_be_cac_extra cac_extra;
-	struct pisp_be_downscale_extra
-				downscale_extra[PISP_BACK_END_NUM_OUTPUTS];
-	struct pisp_be_resample_extra resample_extra[PISP_BACK_END_NUM_OUTPUTS];
-	struct pisp_be_crop_config crop;
-	struct pisp_image_format_config hog_format;
-	__u32 dirty_flags_bayer; /* these use pisp_be_bayer_enable */
-	__u32 dirty_flags_rgb; /* use pisp_be_rgb_enable */
-	__u32 dirty_flags_extra; /* these use pisp_be_dirty_t */
+	/* For backward compatibility */
+	uint8_t pad1[84];
 } __attribute__((packed));
 
 /**
-- 
2.34.1


