Return-Path: <linux-media+bounces-12900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC67B902C45
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 01:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 639AD1F2312A
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 23:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882FA153838;
	Mon, 10 Jun 2024 23:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gM2GEUK4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C2D1527AC
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 23:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718061001; cv=none; b=VrJGGmSaNkcrQ5eLrExyqFveT4cgYeDdjuJ8kNL8c6W2ulAoV3I95BwxJ8ZPJXKvX+sqSpLzzr1J/Y1CtXFLl21HASyXLbJi2aM3e43o0atUesfWnpKDS296FN4+oC/Mule1XoEW6oa/7NS0gA967c9FT2CnW8EogFiQzz8bvtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718061001; c=relaxed/simple;
	bh=iTfdC4btNMwXyVr7bat6V5XQY3nrpXEk8t37YJiWujI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q+w4zSCpPDng4q8hvw5CvbLFQfRQZ69eQNh1fQ8HFbQakp7msQrG/LenA+uxa83YfrskrQAB2ehJC0B6+rIOv2RtJzxIqCDILu9n5KcJjF+bcfNLgCZO/EC2O/MCcWA0yeJw7JhNVgbv37A1jJRs+69ubcUHP808YnVTjn+wbGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gM2GEUK4; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5bafcb42d28so235391eaf.0
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 16:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718060998; x=1718665798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRxFROHQ2dCXosAMLsg5w59iJitkjf3IVXz7c5nb/d0=;
        b=gM2GEUK4FluZMl+dKKSxY+zCkEcHDP1Cyeibd3YDwfrl4rnMWMxd0U/Ul5bueVvXnx
         kcP2v4sHFM7Xy5sKmnzKJh69HPCOUz/RkS2iJ+I8h7CSCIMwsKIjDumUR7FhkRZvy+kj
         pS8vg+9nSpr92rsFJv616ruhuqSsYOgAKXyKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060998; x=1718665798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRxFROHQ2dCXosAMLsg5w59iJitkjf3IVXz7c5nb/d0=;
        b=KqjBNtmR0SFOkFFbr4yaq78QTs0SgOiLxkw0myG99vv9uxuzlBrksAB62kxpQjuoCO
         A91mNqfSR4716+tEV3ltU1qvhiAIaWeeEUTg5KVyS+VutdW+BxdXy9+DOIg+Q6q7UqaP
         l0VYSKpWkiw8v0rLtKcklgr9gARxsxdKGAc2jz+umkHHa/+8GrE2jwYab45OzBCjTDKF
         OqQIYJ5oSz433J1jJY4LQK9YdlS+p/b2xwpjUWTKrVkHTVRVLjiyCJgBCUXF0j8Ist2E
         zal3Rgdaox6gv8BPRoCJsP0Lr4JOvt2JW8zO8CA8ARi2XieeTcrJtssd+dp1+S6+jM27
         L2Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVkayfHhiNDSFfxx3Ts5iBBsLpwX4XjZMyCnVAZT5ymdshfITJkdzhV9y/YdajoDauP3jcNhBPnhfd9EizD0jq7HHGjAfV7u+lCXAg=
X-Gm-Message-State: AOJu0Yyn24Mvor5f1xkoiQ/tuOtsLoK43JsDI8RTeCp4xvO4yrop+vLj
	zpCrsnhend0ONVRobgVK5nROZMWL+SVxT/aOu6R+Mzej0CEZzzoJaW63fenv3Q==
X-Google-Smtp-Source: AGHT+IFmlKoKWOJj2qo73Wl0NsPia9kSU0phIwncQtRQ3A99zhJAaMJL4Mw8zF7B8tzfmU8kOru5aA==
X-Received: by 2002:a05:6358:5294:b0:19f:1ce8:dc0 with SMTP id e5c5f4694b2df-19f1fe13fa9mr1605477555d.12.1718060998529;
        Mon, 10 Jun 2024 16:09:58 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b06519d521sm35256946d6.65.2024.06.10.16.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 16:09:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 10 Jun 2024 23:09:55 +0000
Subject: [PATCH v2 4/7] media: uvcvideo: Cleanup version-specific mapping
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240610-billion-v2-4-38e861475f85@chromium.org>
References: <20240610-billion-v2-0-38e861475f85@chromium.org>
In-Reply-To: <20240610-billion-v2-0-38e861475f85@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

We do not have more version specific mappings. Let's remove this code
for now. It can be easily reverted later if needed.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 5b77ac308c84..efc46f53ac81 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -847,14 +847,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
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
@@ -2656,7 +2648,6 @@ static void uvc_ctrl_prune_entity(struct uvc_device *dev,
 static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 			       struct uvc_control *ctrl)
 {
-	const struct uvc_control_mapping **mappings;
 	unsigned int i;
 
 	/*
@@ -2721,18 +2712,6 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 		    ctrl->info.selector == mapping->selector)
 			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
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
-			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
-	}
 }
 
 /*

-- 
2.45.2.505.gda0bf45e8d-goog


