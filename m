Return-Path: <linux-media+bounces-7237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDFC87F44C
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 00:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D21B11F236F6
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 23:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8145FDD5;
	Mon, 18 Mar 2024 23:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EVd9vVLB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D961D5FB9E
	for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 23:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710806137; cv=none; b=chKMUH60pNt6uVBZzeUYEreajQR/mjjzhT5/NkIsrrRCIx3dLCgeJytTQ/aQM57HoJD5xUu0X2GUn7vU+ETtsCgamEgAbtqDu6io26jgmayVkp0POoEoS9ARZbriayvw98RNJTF5wLg7zvREQjBPntbl+ubr4MyH2rpobJyuDMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710806137; c=relaxed/simple;
	bh=RsdInsKRFjFPeria6YprFZPQUFBlBulfguGTv/hRZ1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NdumJ4QXLiY4g1sP/wrTI+65rrV8eoDu2PFjVK5u73311SGWpMJ+MssNrksrprBBTAZexOKTcLzxJUWUhvofy3JO20QqrdvGrd7LrxHTfa9jWI6SotuwPRlx1dgZiaq4tQmSU5I2KNZD8dIUxMUPyj280wTBTTQy6tWupEL5rmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EVd9vVLB; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6e67cf739d0so2131527a34.1
        for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 16:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710806135; x=1711410935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zp7PBpqLGtiHuxscR4MF6KkBApKCYsHGzqcNSer1N74=;
        b=EVd9vVLB2cENY3Pesh2lL4O+CK66/vBx6go/d5Zr+120DXmGAxj4lfBqbntQlZo7QE
         hh31GXxK99TCPMk5H9nAL9ZP2wETMSlsHbjlFcxu+tK+sLPSSDIm6t7dLweaJ6V2i9i9
         2tjDbb1JroiyuAOu+afR0h8ZwTf7ujH3YU+7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710806135; x=1711410935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zp7PBpqLGtiHuxscR4MF6KkBApKCYsHGzqcNSer1N74=;
        b=rk37nDHFfa5YhJbPw+KADqdVrrnZMrAxXH3wxz9I1qkAOka3btzJSsc4uguw7/nKHl
         HCfoBifvhRHfE9ZyLFyz0OFCYlnzkx4PVN+3w9iNUUQ5D9LYVTZszNAqCHz0c1MQz7wj
         iJ3R8tng5IbF/JOOFxox2sFR7djjhjPR5Un0jQAEEAENTC2j97J0S7NDuBdBXyL6jOHn
         4gWvQuGapqE469Bkmh9HSARKl09vXR+rQ/msUQCgkLxDNb5Oe5doo9BUI4Vc7TIUA/+o
         RTUFge5hvRb9NXYuuldTh6cLOxUBDHYDL11M5cF+5RJFOIGCfklJMZwgZfqGT8RA0jNw
         ZMAg==
X-Forwarded-Encrypted: i=1; AJvYcCUEVWAMJS1Fw+2V5YVwXS5lPmPbnbxIH+/FYM9Me/rwApwieEwMheRChqRcWhKqSFoSucd5nxPV/Yk3rGI/+LXsKBd22n57c7fWkV8=
X-Gm-Message-State: AOJu0YxgpabZ+owBuwMl22f1YUTSR2lW4XUJ08574DUNzCi+T50mFjGG
	MT1rmBqIRJQTPJiExUpBTHJhsGmukvGojByPkmRMoPLGZJV5FCuum2QRkQGGI7zV9PvbDBSbiip
	W7g==
X-Google-Smtp-Source: AGHT+IGrUiFb9DP1hUk66/tEb1lXZjM4msiRZHH9Q61RHuQ1IhIkA3/IUKJ/6Fgiej0iK+12KRDq3w==
X-Received: by 2002:a9d:68c7:0:b0:6e6:7b62:3028 with SMTP id i7-20020a9d68c7000000b006e67b623028mr10352580oto.36.1710806135001;
        Mon, 18 Mar 2024 16:55:35 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id h15-20020ae9ec0f000000b00787930320b6sm4991690qkg.70.2024.03.18.16.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 16:55:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 18 Mar 2024 23:55:26 +0000
Subject: [PATCH 4/5] media: uvcvideo: Cleanup version-specific mapping
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240318-billion-v1-4-2f7bc0ee2030@chromium.org>
References: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>
In-Reply-To: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

We do not have more version specific mappings. Let's remove this code
for now. It can be easily reverted later if needed.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 9a0b81aca30d1..41578ded1174e 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -851,14 +851,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 };
 
-static const struct uvc_control_mapping *uvc_ctrl_mappings_uvc11[] = {
-	NULL, /* Sentinel */
-};
-
-static const struct uvc_control_mapping *uvc_ctrl_mappings_uvc15[] = {
-	NULL, /* Sentinel */
-};
-
 /* ------------------------------------------------------------------------
  * Utility functions
  */
@@ -2660,7 +2652,6 @@ static void uvc_ctrl_prune_entity(struct uvc_device *dev,
 static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 			       struct uvc_control *ctrl)
 {
-	const struct uvc_control_mapping **mappings;
 	unsigned int i;
 
 	/*
@@ -2726,18 +2717,6 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 		    ctrl->info.selector == mapping->selector)
 			__uvc_ctrl_add_custom_mapping(chain, ctrl, mapping);
 	}
-
-	/* Finally process version-specific mappings. */
-	mappings = chain->dev->uvc_version < 0x0150
-		 ? uvc_ctrl_mappings_uvc11 : uvc_ctrl_mappings_uvc15;
-
-	for (i = 0; mappings[i]; ++i) {
-		const struct uvc_control_mapping *mapping = mappings[i];
-
-		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
-		    ctrl->info.selector == mapping->selector)
-			__uvc_ctrl_add_custom_mapping(chain, ctrl, mapping);
-	}
 }
 
 /*

-- 
2.44.0.291.gc1ea87d7ee-goog


