Return-Path: <linux-media+bounces-7234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D8987F447
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 00:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB6A01F236BC
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 23:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5770F5FB91;
	Mon, 18 Mar 2024 23:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eqgB+gtF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DA95F870
	for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 23:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710806134; cv=none; b=W3zdkMV9rEDILp5QhB4KKUJr9Y0oCqEK/XWg5Iml0PoAYniCsVE5FYDxdrE3QF0rR/8fsKl0ufXyBybwyqcoEKvFxOdkyl0XEph7D0Jum0+200hDx4acu5JoDJN2lzut2e6+4XOaeP3HqN9xscFmrPU+j5ajx06cyYRgmH4SISs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710806134; c=relaxed/simple;
	bh=rowtwgwTzTc2/qlsuivkpFe9gApODrL9SLk4LA5CMVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g5Er5MD8uCVIj6djEfZB+xuQ4mvLupqxxrK0c+7dduzpMHS15A0ZJ/MgNC70uhAQPve0j2WRgCvaTa9LyxSdE372IhmQZcbAyjqg1hFKMGlWWERe2JdKy7fRySkCaQJrmt5fJFh2xAFUa0As726Y4Ebg5SXpLDJN6HtVJejN/04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eqgB+gtF; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-78a13117a3dso3871985a.1
        for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 16:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710806132; x=1711410932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jncCK9aTJnH9oQYheR4m1KC9owq0XH6MuF35O7AIQjE=;
        b=eqgB+gtFFx2gq3JHR2O9FZIj0vY7Mc3Km8Ef8slS7Z9afMVY5v2n10DtT5DqPiNTXn
         tm6oKKrA1QeDouE4ashrSGohrZXik2bnEcQi5HNDtxjV+HWTMhzsCTXyyU09uWh5Kdts
         2u/JqHQ5ueWDw22hi9lWtWGJXub/fp767zq7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710806132; x=1711410932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jncCK9aTJnH9oQYheR4m1KC9owq0XH6MuF35O7AIQjE=;
        b=n+qfLBRPcEEfaa6CzDxkzAOwhIJAofaYzKhllnzEsdOHXFKZJWo3yZi3sTnFbtcD6C
         d/L2UKoFU1Ns3hxB5GcRWitu6U7qTV0QZtxjBQCScCfDY7flI1ku85JkwGHgmtqx1aTw
         1cU70ZkRvBYZz6UuCT70rOm6O3ebINcQL2F42blgtKz/MXoeyU48lkfQ9uY8GgUykQp5
         e+GKo1TGFkVQ6YZmcYFeAdoLydurSwvKiISjAW+1F9RvT58Gept+x2LBbSKzcVdX7Uid
         BdMRo/UFaiBXiZpuutVsE14NKEA6xb0IU7T/E1FBN9KIvweNegChf4nOCHgufHMY36mc
         g60Q==
X-Forwarded-Encrypted: i=1; AJvYcCV69SI0sRCRjbvdF1KbXe+ZKrN+Dxz/W/ohdoiBgKHCKpMw2kDh1IGQF1pq6hrje0i1MkfcRzsTIy9CpQoRouXWWnaEULTM0I+d01A=
X-Gm-Message-State: AOJu0Yy2UlTWO9sGGps3nYMIGKg0xMGGoiaEsl2Mwvp6joFK+Sxigdyu
	pTKZyoP5DrA7I3Z9S9FMEYhWx6HL9OavGIaVRQpSqF9T0OzQaI3unVl45a74hw==
X-Google-Smtp-Source: AGHT+IHeJjk+X8VL/kQzFnMLRimmoKUCR3xzZLlpLovHDemxVv6glcUkJy2psvzsXL54QGoJkWlqRg==
X-Received: by 2002:a05:620a:2714:b0:787:4148:f6e3 with SMTP id b20-20020a05620a271400b007874148f6e3mr1868765qkp.37.1710806132048;
        Mon, 18 Mar 2024 16:55:32 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id h15-20020ae9ec0f000000b00787930320b6sm4991690qkg.70.2024.03.18.16.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 16:55:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 18 Mar 2024 23:55:23 +0000
Subject: [PATCH 1/5] media: uvcvideo: Allow custom control mapping
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240318-billion-v1-1-2f7bc0ee2030@chromium.org>
References: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>
In-Reply-To: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Some advanced controls might not be completely implemented by vendors.

If the controls are a enumeration, UVC does not gives a way to probe
what is implemented and what is not.

Lets create a new callback function where heuristics can be implemented
to detect what is implemented and what not.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 15 ++++++++--
 drivers/media/usb/uvc/uvcvideo.h | 59 +++++++++++++++++++++-------------------
 2 files changed, 43 insertions(+), 31 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e59a463c27618..3e939b4fbaaaf 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2434,6 +2434,14 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	return -ENOMEM;
 }
 
+static int __uvc_ctrl_add_custom_mapping(struct uvc_video_chain *chain,
+	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
+{
+	if (mapping && mapping->add_mapping)
+		return mapping->add_mapping(chain, ctrl, mapping);
+	return __uvc_ctrl_add_mapping(chain, ctrl, mapping);
+}
+
 int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	const struct uvc_control_mapping *mapping)
 {
@@ -2637,7 +2645,8 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 
 			if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
 			    ctrl->info.selector == mapping->selector) {
-				__uvc_ctrl_add_mapping(chain, ctrl, mapping);
+				__uvc_ctrl_add_custom_mapping(chain, ctrl,
+							      mapping);
 				custom = true;
 			}
 		}
@@ -2652,7 +2661,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 
 		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
 		    ctrl->info.selector == mapping->selector)
-			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
+			__uvc_ctrl_add_custom_mapping(chain, ctrl, mapping);
 	}
 
 	/* Finally process version-specific mappings. */
@@ -2664,7 +2673,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 
 		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
 		    ctrl->info.selector == mapping->selector)
-			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
+			__uvc_ctrl_add_custom_mapping(chain, ctrl, mapping);
 	}
 }
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6fb0a78b1b009..611350a82c37f 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -101,34 +101,6 @@ struct uvc_control_info {
 	u32 flags;
 };
 
-struct uvc_control_mapping {
-	struct list_head list;
-	struct list_head ev_subs;
-
-	u32 id;
-	char *name;
-	u8 entity[16];
-	u8 selector;
-
-	u8 size;
-	u8 offset;
-	enum v4l2_ctrl_type v4l2_type;
-	u32 data_type;
-
-	const u32 *menu_mapping;
-	const char (*menu_names)[UVC_MENU_NAME_LEN];
-	unsigned long menu_mask;
-
-	u32 master_id;
-	s32 master_manual;
-	u32 slave_ids[2];
-
-	s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
-		   const u8 *data);
-	void (*set)(struct uvc_control_mapping *mapping, s32 value,
-		    u8 *data);
-};
-
 struct uvc_control {
 	struct uvc_entity *entity;
 	struct uvc_control_info info;
@@ -336,6 +308,37 @@ struct uvc_video_chain {
 	u8 ctrl_class_bitmap;			/* Bitmap of valid classes */
 };
 
+struct uvc_control_mapping {
+	struct list_head list;
+	struct list_head ev_subs;
+
+	u32 id;
+	char *name;
+	u8 entity[16];
+	u8 selector;
+
+	u8 size;
+	u8 offset;
+	enum v4l2_ctrl_type v4l2_type;
+	u32 data_type;
+
+	const u32 *menu_mapping;
+	const char (*menu_names)[UVC_MENU_NAME_LEN];
+	unsigned long menu_mask;
+
+	u32 master_id;
+	s32 master_manual;
+	u32 slave_ids[2];
+
+	int (*add_mapping)(struct uvc_video_chain *chain,
+			   struct uvc_control *ctrl,
+			   const struct uvc_control_mapping *mapping);
+	s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
+		   const u8 *data);
+	void (*set)(struct uvc_control_mapping *mapping, s32 value,
+		    u8 *data);
+};
+
 struct uvc_stats_frame {
 	unsigned int size;		/* Number of bytes captured */
 	unsigned int first_data;	/* Index of the first non-empty packet */

-- 
2.44.0.291.gc1ea87d7ee-goog


