Return-Path: <linux-media+bounces-56606-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB2nDpDdvml3ggMAu9opvQ
	(envelope-from <linux-media+bounces-56606-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 19:04:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 905572E6A91
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 19:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40E893012EAC
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 18:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A2E314B6A;
	Sat, 21 Mar 2026 18:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIvjhXOA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2652257825
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 18:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774116229; cv=none; b=dtgepby8yHH313f2pe7bDZ+iqppPsIliD5CeAjt0lNTnMwsPbfDfsejh1FmVkxa4Mx9hWszNHne1KSA0hC9XDC+7/x4/3Yi8J1CB13M+UueHRj2ZN1IqHPA95nDS/SU8wngVYccRkmdmmGvAakaMmABbhpfK4lVLNPfvJthas0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774116229; c=relaxed/simple;
	bh=kkliumfrBj/KUpyZ2z/98xNzejRCkHbDDoG9Y8PXRrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jtLLdjCce1nNejvGIPzWlUtAg+hLoOGTKDePwfs3cPgBRlXIBXdBe3VU5sAfmzK5lSzdEho4nTNlRgabViwdfOhCKYj3oCd4ROZ59W9+GJAMVNqVeecHHrnHASWJQBlRvddx1JVYDtPePv6lpaRbwbp3l/1o+nIBPf6H2/RYVAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIvjhXOA; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35b9d29480aso1307390a91.1
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 11:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774116227; x=1774721027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cfe4fPxKN+j6yka3426Xb3STNR5oCzt1Nw0bzEAXdLk=;
        b=WIvjhXOALsrvsRTMG7sf/bqILHF2bXyGLWgS7689zwjMOByUlTWT1BNqva9Yl1mz7Q
         MqgADp4sioT0Un62EbuhAuh2F6HKGlMli2xquDU1Qfhnmk52lIQgh2Id1TmJLfAg6AC4
         75BuH5ue8dNoNoxd9n59O70BOVGHhKPZVbyrKGDyeW/+vlui+fat6SKyezF26gfWeUjD
         137xUMR7S8P/X2y4SdAtVvhI44z/7OYT57cDwsYup3WoxEZW5WXQOdu33HRIWIyRbDMI
         yom76iSz07FyNLdVgpi+2dEj3ZjW/iMxblfb9UaE3r4P6qsubI8VOEdGRmkhjvYmM+sY
         qNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774116227; x=1774721027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfe4fPxKN+j6yka3426Xb3STNR5oCzt1Nw0bzEAXdLk=;
        b=dmUUgslE5y+1Q3W+rROgMHrLIukuh5GQw4SHBPPvGQtJ2clusZYZdG1VJ1JdBP1plx
         sCN68dSVg7aM3jkd6HmVWINefIXIKu2s9x/s5MX0FfUpXWSSIj7Qs8l1qnnzg9HaMfKn
         AS6cxi+XN8smKO4oGKSWZvrGVrXhR+7Y8H9n7A1aI3TFdOD2PjOHmqHKR9g3BlQNw3DX
         9W+q3kKmI7xB60dlpLGlYGEUqYesj4AS+ZEZBLo+/DrF2mA+RUNl5JkzmbAGI4cZFCqq
         yflDYzosIHsI8YRpYDxborR8R/SzoSQ6lZYI/XmILKMqhVd9WM/siOSP155+h5cwW2UB
         HUmA==
X-Forwarded-Encrypted: i=1; AJvYcCVyyo3iXir/inlEl5ozMwfipyQVjS6TqPmLYIFnmAQb4hNY5w9olXNMLlgQVxeM1SEZC9MzmrNOGQ9EYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfGsmZQi1ty+93ppdqLzdfGBEx381rOGwEuLVa9TlTXH/v6ct+
	7hzf7oso5qy25BaE5qA7L6qAsYq4O1tuJb6xTGfPnN1Cu3g8oWraibPy
X-Gm-Gg: ATEYQzzmEdYEaC66w8xOBxcNEH8/VSiINgfpufUEnia3DKnYfqk8D3jcAIG+kq2aPrK
	FxncOB8ZIVfr7HVIHjt0ltni67IIDypGbVN1SfqfaLMHfo4fCgH/6Q9syNyGawKFjTl5ssF0S7f
	yoNwzzGEW21/Z3Y6Q2g8mRQRUYMVt8gZHpHVboOhsiVcrvGqTpiZadybzLg+AHjg5PZnunvYNtq
	qB40Looa9h7EpNlmIGjTJ0E2bW+k7SexuKhjgvGHLdUKegtRH443j0n7HDCRyoz30WRneFZv8LZ
	8NvYiw8BYbLr+3yI442Xy0uAV7hm8QORzDIn6NgjmQKSENv5Ee30IyCWw9TT1o6gU3pl6mG2j6d
	Sg12oeHZCmCUYKBrG5adh5jxnWQupe10GHzQnXvYZqvOBUVOS7cJAvd56y4u9t79b7hGYk3SPhV
	3/W+N1jtw/Zfm3bA9G38NK/WTPxIuT6Ibp5nQxUNGXlViVNhF2mFk=
X-Received: by 2002:a17:90b:3e44:b0:359:9158:7459 with SMTP id 98e67ed59e1d1-35bd297b148mr6423292a91.0.1774116226817;
        Sat, 21 Mar 2026 11:03:46 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.. ([27.63.17.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd40e4c41sm5877793a91.10.2026.03.21.11.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 11:03:46 -0700 (PDT)
From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Abinash Singh <abinashlalotra@gmail.com>,
	Abinash Singh <abinashsinghlalotra@gmail.com>
Subject: [PATCH] staging: atomisp: u32 over uint32_t
Date: Sat, 21 Mar 2026 23:33:30 +0530
Message-ID: <20260321180330.26737-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,nxp.com,ti.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-56606-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abinashsinghlalotra@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 905572E6A91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abinash Singh <abinashlalotra@gmail.com>

Replace usage of uint32_t with u32 to comply with kernel coding
style guidelines.

Reported by checkpatch.pl.
CHECK: Prefer kernel type 'u32' over 'uint32_t'

Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
---
Similar cleanup done in:
d6e1f701c61f ("staging: gpib: tnt4882: u8 over uint8_t")

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings


 .../media/atomisp/pci/atomisp_subdev.c        | 240 +++++++++---------
 .../media/atomisp/pci/atomisp_subdev.h        | 116 ++++-----
 2 files changed, 180 insertions(+), 176 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 3d56ca83ecb7..f9bb92f1ad51 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -23,18 +23,30 @@
 #include "atomisp_ioctl.h"
 
 const struct atomisp_in_fmt_conv atomisp_in_fmt_conv[] = {
-	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8, 8, ATOMISP_INPUT_FORMAT_RAW_8, IA_CSS_BAYER_ORDER_BGGR },
-	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8, 8, ATOMISP_INPUT_FORMAT_RAW_8, IA_CSS_BAYER_ORDER_GBRG },
-	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8, 8, ATOMISP_INPUT_FORMAT_RAW_8, IA_CSS_BAYER_ORDER_GRBG },
-	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8, 8, ATOMISP_INPUT_FORMAT_RAW_8, IA_CSS_BAYER_ORDER_RGGB },
-	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10, 10, ATOMISP_INPUT_FORMAT_RAW_10, IA_CSS_BAYER_ORDER_BGGR },
-	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10, 10, ATOMISP_INPUT_FORMAT_RAW_10, IA_CSS_BAYER_ORDER_GBRG },
-	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10, 10, ATOMISP_INPUT_FORMAT_RAW_10, IA_CSS_BAYER_ORDER_GRBG },
-	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10, 10, ATOMISP_INPUT_FORMAT_RAW_10, IA_CSS_BAYER_ORDER_RGGB },
-	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12, 12, ATOMISP_INPUT_FORMAT_RAW_12, IA_CSS_BAYER_ORDER_BGGR },
-	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12, 12, ATOMISP_INPUT_FORMAT_RAW_12, IA_CSS_BAYER_ORDER_GBRG },
-	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12, 12, ATOMISP_INPUT_FORMAT_RAW_12, IA_CSS_BAYER_ORDER_GRBG },
-	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12, 12, ATOMISP_INPUT_FORMAT_RAW_12, IA_CSS_BAYER_ORDER_RGGB },
+	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8, 8, ATOMISP_INPUT_FORMAT_RAW_8,
+	  IA_CSS_BAYER_ORDER_BGGR },
+	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8, 8, ATOMISP_INPUT_FORMAT_RAW_8,
+	  IA_CSS_BAYER_ORDER_GBRG },
+	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8, 8, ATOMISP_INPUT_FORMAT_RAW_8,
+	  IA_CSS_BAYER_ORDER_GRBG },
+	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8, 8, ATOMISP_INPUT_FORMAT_RAW_8,
+	  IA_CSS_BAYER_ORDER_RGGB },
+	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10, 10, ATOMISP_INPUT_FORMAT_RAW_10,
+	  IA_CSS_BAYER_ORDER_BGGR },
+	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10, 10, ATOMISP_INPUT_FORMAT_RAW_10,
+	  IA_CSS_BAYER_ORDER_GBRG },
+	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10, 10, ATOMISP_INPUT_FORMAT_RAW_10,
+	  IA_CSS_BAYER_ORDER_GRBG },
+	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10, 10, ATOMISP_INPUT_FORMAT_RAW_10,
+	  IA_CSS_BAYER_ORDER_RGGB },
+	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12, 12, ATOMISP_INPUT_FORMAT_RAW_12,
+	  IA_CSS_BAYER_ORDER_BGGR },
+	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12, 12, ATOMISP_INPUT_FORMAT_RAW_12,
+	  IA_CSS_BAYER_ORDER_GBRG },
+	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12, 12, ATOMISP_INPUT_FORMAT_RAW_12,
+	  IA_CSS_BAYER_ORDER_GRBG },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12, 12, ATOMISP_INPUT_FORMAT_RAW_12,
+	  IA_CSS_BAYER_ORDER_RGGB },
 	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, 8, ATOMISP_INPUT_FORMAT_YUV422_8, 0 },
 	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, 8, ATOMISP_INPUT_FORMAT_YUV422_8, 0 },
 #if 0 // disabled due to clang warnings
@@ -42,7 +54,8 @@ const struct atomisp_in_fmt_conv atomisp_in_fmt_conv[] = {
 	{ V4L2_MBUS_FMT_CUSTOM_NV12, 12, 12, IA_CSS_FRAME_FORMAT_NV12, 0 },
 	{ V4L2_MBUS_FMT_CUSTOM_NV21, 12, 12, IA_CSS_FRAME_FORMAT_NV21, 0 },
 #endif
-	{ V4L2_MBUS_FMT_CUSTOM_YUV420, 12, 12, ATOMISP_INPUT_FORMAT_YUV420_8_LEGACY, 0 },
+	{ V4L2_MBUS_FMT_CUSTOM_YUV420, 12, 12,
+	  ATOMISP_INPUT_FORMAT_YUV420_8_LEGACY, 0 },
 #if 0
 	{ V4L2_MBUS_FMT_CUSTOM_M10MO_RAW, 8, 8, IA_CSS_FRAME_FORMAT_BINARY_8, 0 },
 #endif
@@ -96,7 +109,7 @@ const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv(u32 code)
 }
 
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_by_atomisp_in_fmt(
-    enum atomisp_input_format atomisp_in_fmt)
+	enum atomisp_input_format atomisp_in_fmt)
 {
 	int i;
 
@@ -112,12 +125,14 @@ bool atomisp_subdev_format_conversion(struct atomisp_sub_device *asd)
 	struct v4l2_mbus_framefmt *sink, *src;
 
 	sink = atomisp_subdev_get_ffmt(&asd->subdev, NULL,
-				       V4L2_SUBDEV_FORMAT_ACTIVE, ATOMISP_SUBDEV_PAD_SINK);
+				       V4L2_SUBDEV_FORMAT_ACTIVE,
+				       ATOMISP_SUBDEV_PAD_SINK);
 	src = atomisp_subdev_get_ffmt(&asd->subdev, NULL,
-				      V4L2_SUBDEV_FORMAT_ACTIVE, ATOMISP_SUBDEV_PAD_SOURCE);
+				      V4L2_SUBDEV_FORMAT_ACTIVE,
+				      ATOMISP_SUBDEV_PAD_SOURCE);
 
-	return atomisp_is_mbuscode_raw(sink->code)
-	       && !atomisp_is_mbuscode_raw(src->code);
+	return atomisp_is_mbuscode_raw(sink->code) &&
+	       !atomisp_is_mbuscode_raw(src->code);
 }
 
 /*
@@ -132,8 +147,8 @@ bool atomisp_subdev_format_conversion(struct atomisp_sub_device *asd)
  *
  * Return 0 on success or a negative error code otherwise.
  */
-static long isp_subdev_ioctl(struct v4l2_subdev *sd,
-			     unsigned int cmd, void *arg)
+static long isp_subdev_ioctl(struct v4l2_subdev *sd, unsigned int cmd,
+			     void *arg)
 {
 	return 0;
 }
@@ -154,8 +169,7 @@ static int isp_subdev_subscribe_event(struct v4l2_subdev *sd,
 	    sub->type != V4L2_EVENT_ATOMISP_ACC_COMPLETE)
 		return -EINVAL;
 
-	if (sub->type == V4L2_EVENT_FRAME_SYNC &&
-	    !atomisp_css_valid_sof(isp))
+	if (sub->type == V4L2_EVENT_FRAME_SYNC && !atomisp_css_valid_sof(isp))
 		return -EINVAL;
 
 	return v4l2_event_subscribe(fh, sub, 16, NULL);
@@ -180,8 +194,7 @@ static int isp_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int isp_subdev_validate_rect(struct v4l2_subdev *sd, uint32_t pad,
-				    uint32_t target)
+static int isp_subdev_validate_rect(struct v4l2_subdev *sd, u32 pad, u32 target)
 {
 	switch (pad) {
 	case ATOMISP_SUBDEV_PAD_SINK:
@@ -202,9 +215,8 @@ static int isp_subdev_validate_rect(struct v4l2_subdev *sd, uint32_t pad,
 }
 
 struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
-	struct v4l2_subdev_state *sd_state,
-	u32 which, uint32_t pad,
-	uint32_t target)
+					  struct v4l2_subdev_state *sd_state,
+					  u32 which, u32 pad, u32 target)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
 
@@ -227,10 +239,9 @@ struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
 	return NULL;
 }
 
-struct v4l2_mbus_framefmt
-*atomisp_subdev_get_ffmt(struct v4l2_subdev *sd,
-			 struct v4l2_subdev_state *sd_state, uint32_t which,
-			 uint32_t pad)
+struct v4l2_mbus_framefmt *
+atomisp_subdev_get_ffmt(struct v4l2_subdev *sd,
+			struct v4l2_subdev_state *sd_state, u32 which, u32 pad)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
 
@@ -241,8 +252,7 @@ struct v4l2_mbus_framefmt
 }
 
 static void isp_get_fmt_rect(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *sd_state,
-			     uint32_t which,
+			     struct v4l2_subdev_state *sd_state, u32 which,
 			     struct v4l2_mbus_framefmt **ffmt,
 			     struct v4l2_rect *crop[ATOMISP_SUBDEV_PADS_NUM],
 			     struct v4l2_rect *comp[ATOMISP_SUBDEV_PADS_NUM])
@@ -290,29 +300,32 @@ static const char *atomisp_pad_str(unsigned int pad)
 }
 
 int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *sd_state,
-				 u32 which, uint32_t pad, uint32_t target,
-				 u32 flags, struct v4l2_rect *r)
+				 struct v4l2_subdev_state *sd_state, u32 which,
+				 u32 pad, u32 target, u32 flags,
+				 struct v4l2_rect *r)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
 	struct atomisp_device *isp = isp_sd->isp;
 	struct v4l2_mbus_framefmt *ffmt[ATOMISP_SUBDEV_PADS_NUM];
 	struct v4l2_rect *crop[ATOMISP_SUBDEV_PADS_NUM],
-		       *comp[ATOMISP_SUBDEV_PADS_NUM];
+		*comp[ATOMISP_SUBDEV_PADS_NUM];
 
 	if ((pad == ATOMISP_SUBDEV_PAD_SINK && target != V4L2_SEL_TGT_CROP) ||
-	    (pad == ATOMISP_SUBDEV_PAD_SOURCE && target != V4L2_SEL_TGT_COMPOSE))
+	    (pad == ATOMISP_SUBDEV_PAD_SOURCE &&
+	     target != V4L2_SEL_TGT_COMPOSE))
 		return -EINVAL;
 
 	isp_get_fmt_rect(sd, sd_state, which, ffmt, crop, comp);
 
 	dev_dbg(isp->dev,
 		"sel: pad %s tgt %s l %d t %d w %d h %d which %s f 0x%8.8x\n",
-		atomisp_pad_str(pad), target == V4L2_SEL_TGT_CROP
-		? "V4L2_SEL_TGT_CROP" : "V4L2_SEL_TGT_COMPOSE",
+		atomisp_pad_str(pad),
+		target == V4L2_SEL_TGT_CROP ? "V4L2_SEL_TGT_CROP" :
+					      "V4L2_SEL_TGT_COMPOSE",
 		r->left, r->top, r->width, r->height,
-		which == V4L2_SUBDEV_FORMAT_TRY ? "V4L2_SUBDEV_FORMAT_TRY"
-		: "V4L2_SUBDEV_FORMAT_ACTIVE", flags);
+		which == V4L2_SUBDEV_FORMAT_TRY ? "V4L2_SUBDEV_FORMAT_TRY" :
+						  "V4L2_SUBDEV_FORMAT_ACTIVE",
+		flags);
 
 	r->width = rounddown(r->width, ATOM_ISP_STEP_WIDTH);
 	r->height = rounddown(r->height, ATOM_ISP_STEP_HEIGHT);
@@ -324,8 +337,8 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 		crop[pad]->width = ffmt[pad]->width;
 		crop[pad]->height = ffmt[pad]->height;
 
-		if (atomisp_subdev_format_conversion(isp_sd)
-		    && crop[pad]->width && crop[pad]->height) {
+		if (atomisp_subdev_format_conversion(isp_sd) &&
+		    crop[pad]->width && crop[pad]->height) {
 			crop[pad]->width -= isp_sd->sink_pad_padding_w;
 			crop[pad]->height -= isp_sd->sink_pad_padding_h;
 		}
@@ -352,7 +365,8 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 
 			atomisp_subdev_set_selection(sd, sd_state, which,
 						     ATOMISP_SUBDEV_PAD_SOURCE,
-						     V4L2_SEL_TGT_COMPOSE, flags, &tmp);
+						     V4L2_SEL_TGT_COMPOSE,
+						     flags, &tmp);
 		}
 
 		if (which == V4L2_SUBDEV_FORMAT_TRY)
@@ -375,10 +389,9 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 			dvs_w = dvs_h = 0;
 		}
 		atomisp_css_video_set_dis_envelope(isp_sd, dvs_w, dvs_h);
-		atomisp_css_input_set_effective_resolution(isp_sd,
-							   ATOMISP_INPUT_STREAM_GENERAL,
-							   crop[pad]->width,
-							   crop[pad]->height);
+		atomisp_css_input_set_effective_resolution(
+			isp_sd, ATOMISP_INPUT_STREAM_GENERAL, crop[pad]->width,
+			crop[pad]->height);
 	} else if (isp_sd->run_mode->val != ATOMISP_RUN_MODE_PREVIEW) {
 		/* Only compose target is supported on source pads. */
 		if (isp_sd->vfpp->val == ATOMISP_VFPP_DISABLE_LOWLAT) {
@@ -387,8 +400,8 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 			r->height = crop[ATOMISP_SUBDEV_PAD_SINK]->height;
 		}
 
-		if (crop[ATOMISP_SUBDEV_PAD_SINK]->width == r->width
-		    && crop[ATOMISP_SUBDEV_PAD_SINK]->height == r->height)
+		if (crop[ATOMISP_SUBDEV_PAD_SINK]->width == r->width &&
+		    crop[ATOMISP_SUBDEV_PAD_SINK]->height == r->height)
 			isp_sd->params.yuv_ds_en = false;
 		else
 			isp_sd->params.yuv_ds_en = true;
@@ -416,18 +429,18 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 		 */
 		if (r->width * crop[ATOMISP_SUBDEV_PAD_SINK]->height <
 		    crop[ATOMISP_SUBDEV_PAD_SINK]->width * r->height)
-			atomisp_css_input_set_effective_resolution(isp_sd,
-				ATOMISP_INPUT_STREAM_GENERAL,
-				rounddown(crop[ATOMISP_SUBDEV_PAD_SINK]->
-					  height * r->width / r->height,
+			atomisp_css_input_set_effective_resolution(
+				isp_sd, ATOMISP_INPUT_STREAM_GENERAL,
+				rounddown(crop[ATOMISP_SUBDEV_PAD_SINK]->height *
+						  r->width / r->height,
 					  ATOM_ISP_STEP_WIDTH),
 				crop[ATOMISP_SUBDEV_PAD_SINK]->height);
 		else
-			atomisp_css_input_set_effective_resolution(isp_sd,
-				ATOMISP_INPUT_STREAM_GENERAL,
+			atomisp_css_input_set_effective_resolution(
+				isp_sd, ATOMISP_INPUT_STREAM_GENERAL,
 				crop[ATOMISP_SUBDEV_PAD_SINK]->width,
-				rounddown(crop[ATOMISP_SUBDEV_PAD_SINK]->
-					  width * r->height / r->width,
+				rounddown(crop[ATOMISP_SUBDEV_PAD_SINK]->width *
+						  r->height / r->width,
 					  ATOM_ISP_STEP_WIDTH));
 	} else {
 		comp[pad]->width = r->width;
@@ -445,8 +458,8 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 	*r = *atomisp_subdev_get_rect(sd, sd_state, which, pad, target);
 
-	dev_dbg(isp->dev, "sel actual: l %d t %d w %d h %d\n",
-		r->left, r->top, r->width, r->height);
+	dev_dbg(isp->dev, "sel actual: l %d t %d w %d h %d\n", r->left, r->top,
+		r->width, r->height);
 
 	return 0;
 }
@@ -460,30 +473,28 @@ static int isp_subdev_set_selection(struct v4l2_subdev *sd,
 	if (rval)
 		return rval;
 
-	return atomisp_subdev_set_selection(sd, sd_state, sel->which,
-					    sel->pad,
+	return atomisp_subdev_set_selection(sd, sd_state, sel->which, sel->pad,
 					    sel->target, sel->flags, &sel->r);
 }
 
 void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *sd_state,
-			     uint32_t which,
+			     struct v4l2_subdev_state *sd_state, u32 which,
 			     u32 pad, struct v4l2_mbus_framefmt *ffmt)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
 	struct atomisp_device *isp = isp_sd->isp;
 	struct v4l2_mbus_framefmt *__ffmt =
-	    atomisp_subdev_get_ffmt(sd, sd_state, which, pad);
+		atomisp_subdev_get_ffmt(sd, sd_state, which, pad);
 
 	dev_dbg(isp->dev, "ffmt: pad %s w %d h %d code 0x%8.8x which %s\n",
 		atomisp_pad_str(pad), ffmt->width, ffmt->height, ffmt->code,
-		which == V4L2_SUBDEV_FORMAT_TRY ? "V4L2_SUBDEV_FORMAT_TRY"
-		: "V4L2_SUBDEV_FORMAT_ACTIVE");
+		which == V4L2_SUBDEV_FORMAT_TRY ? "V4L2_SUBDEV_FORMAT_TRY" :
+						  "V4L2_SUBDEV_FORMAT_ACTIVE");
 
 	switch (pad) {
 	case ATOMISP_SUBDEV_PAD_SINK: {
 		const struct atomisp_in_fmt_conv *fc =
-		    atomisp_find_in_fmt_conv(ffmt->code);
+			atomisp_find_in_fmt_conv(ffmt->code);
 		struct v4l2_rect r = {};
 
 		if (!fc) {
@@ -503,17 +514,18 @@ void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 					     V4L2_SEL_TGT_CROP, 0, &r);
 
 		if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-			atomisp_css_input_set_resolution(isp_sd,
-							 ATOMISP_INPUT_STREAM_GENERAL, ffmt);
-			atomisp_css_input_set_binning_factor(isp_sd,
-							     ATOMISP_INPUT_STREAM_GENERAL,
-							     0);
-			atomisp_css_input_set_bayer_order(isp_sd, ATOMISP_INPUT_STREAM_GENERAL,
-							  fc->bayer_order);
-			atomisp_css_input_set_format(isp_sd, ATOMISP_INPUT_STREAM_GENERAL,
-						     fc->atomisp_in_fmt);
-			atomisp_css_set_default_isys_config(isp_sd, ATOMISP_INPUT_STREAM_GENERAL,
-							    ffmt);
+			atomisp_css_input_set_resolution(
+				isp_sd, ATOMISP_INPUT_STREAM_GENERAL, ffmt);
+			atomisp_css_input_set_binning_factor(
+				isp_sd, ATOMISP_INPUT_STREAM_GENERAL, 0);
+			atomisp_css_input_set_bayer_order(
+				isp_sd, ATOMISP_INPUT_STREAM_GENERAL,
+				fc->bayer_order);
+			atomisp_css_input_set_format(
+				isp_sd, ATOMISP_INPUT_STREAM_GENERAL,
+				fc->atomisp_in_fmt);
+			atomisp_css_set_default_isys_config(
+				isp_sd, ATOMISP_INPUT_STREAM_GENERAL, ffmt);
 		}
 
 		break;
@@ -538,8 +550,8 @@ static int isp_subdev_get_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
-	fmt->format = *atomisp_subdev_get_ffmt(sd, sd_state, fmt->which,
-					       fmt->pad);
+	fmt->format =
+		*atomisp_subdev_get_ffmt(sd, sd_state, fmt->which, fmt->pad);
 
 	return 0;
 }
@@ -610,8 +622,8 @@ static int atomisp_link_setup(struct media_entity *entity,
 			      const struct media_pad *local,
 			      const struct media_pad *remote, u32 flags)
 {
-	struct v4l2_subdev *sd = container_of(entity, struct v4l2_subdev,
-					      entity);
+	struct v4l2_subdev *sd =
+		container_of(entity, struct v4l2_subdev, entity);
 	struct atomisp_sub_device *asd = v4l2_get_subdevdata(sd);
 	struct atomisp_device *isp = asd->isp;
 	int i;
@@ -624,7 +636,8 @@ static int atomisp_link_setup(struct media_entity *entity,
 	}
 
 	for (i = 0; i < isp->input_cnt; i++) {
-		if (&isp->inputs[i].csi_port->entity.pads[CSI2_PAD_SOURCE] == remote)
+		if (&isp->inputs[i].csi_port->entity.pads[CSI2_PAD_SOURCE] ==
+		    remote)
 			break;
 	}
 
@@ -649,9 +662,9 @@ static const struct media_entity_operations isp_subdev_media_ops = {
 };
 
 static const char *const ctrl_run_mode_menu[] = {
-	[ATOMISP_RUN_MODE_VIDEO]		= "Video",
-	[ATOMISP_RUN_MODE_STILL_CAPTURE]	= "Still capture",
-	[ATOMISP_RUN_MODE_PREVIEW]		= "Preview",
+	[ATOMISP_RUN_MODE_VIDEO] = "Video",
+	[ATOMISP_RUN_MODE_STILL_CAPTURE] = "Still capture",
+	[ATOMISP_RUN_MODE_PREVIEW] = "Preview",
 };
 
 static const struct v4l2_ctrl_config ctrl_run_mode = {
@@ -665,9 +678,9 @@ static const struct v4l2_ctrl_config ctrl_run_mode = {
 };
 
 static const char *const ctrl_vfpp_mode_menu[] = {
-	"Enable",			/* vfpp always enabled */
-	"Disable to scaler mode",	/* CSS into video mode and disable */
-	"Disable to low latency mode",	/* CSS into still mode and disable */
+	"Enable", /* vfpp always enabled */
+	"Disable to scaler mode", /* CSS into video mode and disable */
+	"Disable to low latency mode", /* CSS into still mode and disable */
 };
 
 static const struct v4l2_ctrl_config ctrl_vfpp = {
@@ -762,7 +775,8 @@ static const struct v4l2_ctrl_config ctrl_disable_dz = {
 };
 
 static int atomisp_init_subdev_pipe(struct atomisp_sub_device *asd,
-				    struct atomisp_video_pipe *pipe, enum v4l2_buf_type buf_type)
+				    struct atomisp_video_pipe *pipe,
+				    enum v4l2_buf_type buf_type)
 {
 	int ret;
 
@@ -816,7 +830,8 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	pads[ATOMISP_SUBDEV_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 
 	asd->fmt[ATOMISP_SUBDEV_PAD_SINK].fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
-	asd->fmt[ATOMISP_SUBDEV_PAD_SOURCE].fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	asd->fmt[ATOMISP_SUBDEV_PAD_SOURCE].fmt.code =
+		MEDIA_BUS_FMT_SBGGR10_1X10;
 
 	me->ops = &isp_subdev_media_ops;
 	me->function = MEDIA_ENT_F_PROC_VIDEO_ISP;
@@ -824,7 +839,8 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	if (ret < 0)
 		return ret;
 
-	ret = atomisp_init_subdev_pipe(asd, &asd->video_out, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	ret = atomisp_init_subdev_pipe(asd, &asd->video_out,
+				       V4L2_BUF_TYPE_VIDEO_CAPTURE);
 	if (ret)
 		return ret;
 
@@ -836,26 +852,18 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	if (ret)
 		return ret;
 
-	asd->run_mode = v4l2_ctrl_new_custom(&asd->ctrl_handler,
-					     &ctrl_run_mode, NULL);
-	asd->vfpp = v4l2_ctrl_new_custom(&asd->ctrl_handler,
-					 &ctrl_vfpp, NULL);
-	asd->continuous_viewfinder = v4l2_ctrl_new_custom(&asd->ctrl_handler,
-				     &ctrl_continuous_viewfinder,
-				     NULL);
-	asd->continuous_raw_buffer_size =
-	    v4l2_ctrl_new_custom(&asd->ctrl_handler,
-				 &ctrl_continuous_raw_buffer_size,
-				 NULL);
-
-	asd->enable_raw_buffer_lock =
-	    v4l2_ctrl_new_custom(&asd->ctrl_handler,
-				 &ctrl_enable_raw_buffer_lock,
-				 NULL);
-	asd->disable_dz =
-	    v4l2_ctrl_new_custom(&asd->ctrl_handler,
-				 &ctrl_disable_dz,
-				 NULL);
+	asd->run_mode =
+		v4l2_ctrl_new_custom(&asd->ctrl_handler, &ctrl_run_mode, NULL);
+	asd->vfpp = v4l2_ctrl_new_custom(&asd->ctrl_handler, &ctrl_vfpp, NULL);
+	asd->continuous_viewfinder = v4l2_ctrl_new_custom(
+		&asd->ctrl_handler, &ctrl_continuous_viewfinder, NULL);
+	asd->continuous_raw_buffer_size = v4l2_ctrl_new_custom(
+		&asd->ctrl_handler, &ctrl_continuous_raw_buffer_size, NULL);
+
+	asd->enable_raw_buffer_lock = v4l2_ctrl_new_custom(
+		&asd->ctrl_handler, &ctrl_enable_raw_buffer_lock, NULL);
+	asd->disable_dz = v4l2_ctrl_new_custom(&asd->ctrl_handler,
+					       &ctrl_disable_dz, NULL);
 
 	/* Make controls visible on subdev as well. */
 	asd->subdev.ctrl_handler = &asd->ctrl_handler;
@@ -876,8 +884,8 @@ void atomisp_subdev_cleanup_pending_events(struct atomisp_sub_device *asd)
 	struct v4l2_event event;
 	unsigned int i, pending_event;
 
-	list_for_each_entry_safe(fh, fh_tmp,
-				 &asd->subdev.devnode->fh_list, list) {
+	list_for_each_entry_safe(fh, fh_tmp, &asd->subdev.devnode->fh_list,
+				 list) {
 		pending_event = v4l2_event_pending(fh);
 		for (i = 0; i < pending_event; i++)
 			v4l2_event_dequeue(fh, &event, 1);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index e1d0168cb91d..73a3fcff22ff 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -18,14 +18,14 @@
 #include "ia_css.h"
 
 /* EXP_ID's ranger is 1 ~ 250 */
-#define ATOMISP_MAX_EXP_ID     (250)
+#define ATOMISP_MAX_EXP_ID (250)
 
-#define ATOMISP_SUBDEV_PAD_SINK			0
-#define ATOMISP_SUBDEV_PAD_SOURCE		1
-#define ATOMISP_SUBDEV_PADS_NUM			2
+#define ATOMISP_SUBDEV_PAD_SINK 0
+#define ATOMISP_SUBDEV_PAD_SOURCE 1
+#define ATOMISP_SUBDEV_PADS_NUM 2
 
 struct atomisp_in_fmt_conv {
-	u32     code;
+	u32 code;
 	u8 bpp; /* bits per pixel */
 	u8 depth; /* uncompressed */
 	enum atomisp_input_format atomisp_in_fmt;
@@ -99,54 +99,54 @@ struct atomisp_pad_format {
  * struct ia_css_isp_config but without un-supported and deprecated parts.
  */
 struct atomisp_css_params {
-	struct ia_css_wb_config   wb_config;
-	struct ia_css_cc_config   cc_config;
-	struct ia_css_tnr_config  tnr_config;
-	struct ia_css_ecd_config  ecd_config;
-	struct ia_css_ynr_config  ynr_config;
-	struct ia_css_fc_config   fc_config;
+	struct ia_css_wb_config wb_config;
+	struct ia_css_cc_config cc_config;
+	struct ia_css_tnr_config tnr_config;
+	struct ia_css_ecd_config ecd_config;
+	struct ia_css_ynr_config ynr_config;
+	struct ia_css_fc_config fc_config;
 	struct ia_css_formats_config formats_config;
-	struct ia_css_cnr_config  cnr_config;
+	struct ia_css_cnr_config cnr_config;
 	struct ia_css_macc_config macc_config;
-	struct ia_css_ctc_config  ctc_config;
-	struct ia_css_aa_config   aa_config;
-	struct ia_css_aa_config   baa_config;
-	struct ia_css_ce_config   ce_config;
-	struct ia_css_ob_config   ob_config;
-	struct ia_css_dp_config   dp_config;
-	struct ia_css_de_config   de_config;
-	struct ia_css_gc_config   gc_config;
-	struct ia_css_nr_config   nr_config;
-	struct ia_css_ee_config   ee_config;
-	struct ia_css_anr_config  anr_config;
-	struct ia_css_3a_config   s3a_config;
-	struct ia_css_xnr_config  xnr_config;
-	struct ia_css_dz_config   dz_config;
+	struct ia_css_ctc_config ctc_config;
+	struct ia_css_aa_config aa_config;
+	struct ia_css_aa_config baa_config;
+	struct ia_css_ce_config ce_config;
+	struct ia_css_ob_config ob_config;
+	struct ia_css_dp_config dp_config;
+	struct ia_css_de_config de_config;
+	struct ia_css_gc_config gc_config;
+	struct ia_css_nr_config nr_config;
+	struct ia_css_ee_config ee_config;
+	struct ia_css_anr_config anr_config;
+	struct ia_css_3a_config s3a_config;
+	struct ia_css_xnr_config xnr_config;
+	struct ia_css_dz_config dz_config;
 	struct ia_css_cc_config yuv2rgb_cc_config;
 	struct ia_css_cc_config rgb2yuv_cc_config;
-	struct ia_css_macc_table  macc_table;
+	struct ia_css_macc_table macc_table;
 	struct ia_css_gamma_table gamma_table;
-	struct ia_css_ctc_table   ctc_table;
+	struct ia_css_ctc_table ctc_table;
 
-	struct ia_css_xnr_table   xnr_table;
+	struct ia_css_xnr_table xnr_table;
 	struct ia_css_rgb_gamma_table r_gamma_table;
 	struct ia_css_rgb_gamma_table g_gamma_table;
 	struct ia_css_rgb_gamma_table b_gamma_table;
 
-	struct ia_css_vector      motion_vector;
-	struct ia_css_anr_thres   anr_thres;
+	struct ia_css_vector motion_vector;
+	struct ia_css_anr_thres anr_thres;
 
 	struct ia_css_dvs_6axis_config *dvs_6axis;
 	struct ia_css_dvs2_coefficients *dvs2_coeff;
 	struct ia_css_shading_table *shading_table;
-	struct ia_css_morph_table   *morph_table;
+	struct ia_css_morph_table *morph_table;
 
 	/*
 	 * Used to store the user pointer address of the frame. driver needs to
 	 * translate to ia_css_frame * and then set to CSS.
 	 */
-	void		*output_frame;
-	u32	isp_config_id;
+	void *output_frame;
+	u32 isp_config_id;
 
 	/* Indicates which parameters need to be updated. */
 	struct atomisp_parameters update_flag;
@@ -174,8 +174,8 @@ struct atomisp_subdev_params {
 
 	bool dis_proj_data_valid;
 
-	struct ia_css_dz_config   dz_config;  /** Digital Zoom */
-	struct ia_css_capture_config   capture_config;
+	struct ia_css_dz_config dz_config; /** Digital Zoom */
+	struct ia_css_capture_config capture_config;
 
 	struct ia_css_isp_config config;
 
@@ -194,10 +194,10 @@ struct atomisp_subdev_params {
 	struct ia_css_dvs2_statistics *dvs_stat;
 	struct ia_css_dvs_6axis_config *dvs_6axis;
 	u32 exp_id;
-	int  dvs_hor_coef_bytes;
-	int  dvs_ver_coef_bytes;
-	int  dvs_ver_proj_bytes;
-	int  dvs_hor_proj_bytes;
+	int dvs_hor_coef_bytes;
+	int dvs_ver_coef_bytes;
+	int dvs_ver_proj_bytes;
+	int dvs_hor_proj_bytes;
 
 	/* Flag to check if driver needs to update params to css */
 	bool css_update_params_needed;
@@ -240,8 +240,8 @@ struct atomisp_sub_device {
 	unsigned int s3a_bufs_in_css[IA_CSS_PIPE_ID_NUM];
 	unsigned int dis_bufs_in_css;
 
-	unsigned int metadata_bufs_in_css
-	[ATOMISP_INPUT_STREAM_NUM][IA_CSS_PIPE_ID_NUM];
+	unsigned int metadata_bufs_in_css[ATOMISP_INPUT_STREAM_NUM]
+					 [IA_CSS_PIPE_ID_NUM];
 	/* The list of free and available metadata buffers for CSS */
 	struct list_head metadata[ATOMISP_METADATA_TYPE_NUM];
 	/* The list of metadata buffers which have been en-queued to CSS */
@@ -264,7 +264,7 @@ struct atomisp_sub_device {
 	int input_curr;
 
 	atomic_t sof_count;
-	atomic_t sequence;      /* Sequence value that is assigned to buffer. */
+	atomic_t sequence; /* Sequence value that is assigned to buffer. */
 	atomic_t sequence_temp;
 
 	/*
@@ -280,7 +280,7 @@ struct atomisp_sub_device {
 	bool copy_mode; /* CSI2+ use copy mode */
 
 	int raw_buffer_bitmap[ATOMISP_MAX_EXP_ID / 32 +
-						 1]; /* Record each Raw Buffer lock status */
+			      1]; /* Record each Raw Buffer lock status */
 	int raw_buffer_locked_count;
 	spinlock_t raw_buffer_bitmap_lock;
 
@@ -302,33 +302,29 @@ const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv(u32 code);
 
 /* ISP2400 */
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_by_atomisp_in_fmt(
-    enum atomisp_input_format atomisp_in_fmt);
+	enum atomisp_input_format atomisp_in_fmt);
 
 /* ISP2401 */
-const struct atomisp_in_fmt_conv
-*atomisp_find_in_fmt_conv_by_atomisp_in_fmt(enum atomisp_input_format
-	atomisp_in_fmt);
+const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_by_atomisp_in_fmt(
+	enum atomisp_input_format atomisp_in_fmt);
 
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_compressed(u32 code);
 bool atomisp_subdev_format_conversion(struct atomisp_sub_device *asd);
 
 /* Get pointer to appropriate format */
-struct v4l2_mbus_framefmt
-*atomisp_subdev_get_ffmt(struct v4l2_subdev *sd,
-			 struct v4l2_subdev_state *sd_state, uint32_t which,
-			 uint32_t pad);
+struct v4l2_mbus_framefmt *
+atomisp_subdev_get_ffmt(struct v4l2_subdev *sd,
+			struct v4l2_subdev_state *sd_state, u32 which, u32 pad);
 struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
-	struct v4l2_subdev_state *sd_state,
-	u32 which, uint32_t pad,
-	uint32_t target);
+					  struct v4l2_subdev_state *sd_state,
+					  u32 which, u32 pad, u32 target);
 int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *sd_state,
-				 u32 which, uint32_t pad, uint32_t target,
-				 u32 flags, struct v4l2_rect *r);
+				 struct v4l2_subdev_state *sd_state, u32 which,
+				 u32 pad, u32 target, u32 flags,
+				 struct v4l2_rect *r);
 /* Actually set the format */
 void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *sd_state,
-			     uint32_t which,
+			     struct v4l2_subdev_state *sd_state, u32 which,
 			     u32 pad, struct v4l2_mbus_framefmt *ffmt);
 
 void atomisp_subdev_cleanup_pending_events(struct atomisp_sub_device *asd);
-- 
2.43.0


