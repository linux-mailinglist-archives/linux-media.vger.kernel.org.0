Return-Path: <linux-media+bounces-12899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4657902C43
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 01:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F8432853AC
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 23:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667411534E7;
	Mon, 10 Jun 2024 23:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lm6+NkQk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5974F152515
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 23:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718060999; cv=none; b=DMwQgFX25/ljad4ogfr2Oq7Y/YAz2j5zhtHl2l9YkihZa8ciXKpNepAw2ulQ15bc7F3hY8corEPAntDQqTktkWX3FXf/OuJVEPY4ooqMZq76Z3CGfidFqXwRQJkUcfb600EjrTe1by93lWGgTF9gBFOu1K9Qj+1Dg6S3KUhjgzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718060999; c=relaxed/simple;
	bh=j8MR+0Zdp3uWVc1WjRQyCRAas8P1RT3ZjAZLRfXEnB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PInwHUX2SC+NpRXASMbxYB1YjPbr8bd1wnRbgEx6Z8S8TNoNw6GXgdPbUfSZAwED1ZHfV8dYKZDrboP19H2Hfx0CAMgZcOdovhozZbDdbR7Q+C1UGeD0xHDUH8HEg6XBTihNOg492UqqmPSOM7EqWn6/KWq8kkpqbWdko1p+0zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lm6+NkQk; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-627ea4e0becso54291677b3.0
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 16:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718060997; x=1718665797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggXYPXXJz9pqRmEYjjKEnuceXrydB78eIdBvang4V2c=;
        b=Lm6+NkQkQqOkqRcP/pR4gBk95xatY6QxI3pmTLlh3/4DviH4OU3zkEtOjcHyt01cos
         PtVCs1GQcMiiKNJFwbUw1MYGg0YVWi4+ImyQ095Et+fIpkEFeEUAGbbtDGOK9/3vsN+J
         f6bIZ0yEioVCLYKnblLSNCR/DTJ/w3MlHlRpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060997; x=1718665797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggXYPXXJz9pqRmEYjjKEnuceXrydB78eIdBvang4V2c=;
        b=UbqVGMKqKNaYQsa2h5tLvOuYmN8OTEvEs+aqy4iGrwX/fB1czgYT8FnqIJr7TF3cjZ
         AYkZiOUL2LCIC6RaBw/ZNMAOvKp5I8cQSMZ/F9M/WDCwyB93Zmpsa3RSQb0dkofi2gw0
         srQ/UovCIhXPBy0tXQ4IZD1Kb9/cm0q0HgDRoRm9xnbeg0KCiNOupQbOdYu+xn21Db5x
         ENIGtvLDQ7x0Xq/fLdHmCT0udX639/GGbxqvNzOXVxZNVtV2Yy601zEJ6VsgAWYbh9WS
         2zyHmNrb0WUb3kzaudXikpvdopu05eTbX/9oMthNxkJzD+tHpPNeYREXvgzXyq9VEr5J
         GudQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUBQTIBJcWVyc3StVx1/ek+66TnyooTb3UqJuY/uiJWDVJjQ5+pm++MtxE5mah0AFiY5MPVmIh1SWeRU0DdhJwrc+ofRFRQKyioWQ=
X-Gm-Message-State: AOJu0YyG/dC47h5yRazMOdkTr5gnT9lGunWbsD9WzjyIesUicQt+hEui
	PjxnQXkWWCtZK1Dx/6KaJjHtBnmVabd3Whzp1ML4RM1CDlayrRh77hNch3v52w==
X-Google-Smtp-Source: AGHT+IFkwiQpPmkIhbjE6EIVr7NDSN5urKP15cf7bAX2HFwkUmXks8NU9qkevmNJ0yGvGrwYb+4/Ww==
X-Received: by 2002:a0d:d851:0:b0:618:95a3:70b9 with SMTP id 00721157ae682-62cd565129cmr109244957b3.36.1718060997387;
        Mon, 10 Jun 2024 16:09:57 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b06519d521sm35256946d6.65.2024.06.10.16.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 16:09:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 10 Jun 2024 23:09:54 +0000
Subject: [PATCH v2 3/7] media: uvcvideo: Probe the PLF characteristics
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240610-billion-v2-3-38e861475f85@chromium.org>
References: <20240610-billion-v2-0-38e861475f85@chromium.org>
In-Reply-To: <20240610-billion-v2-0-38e861475f85@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

The UVC 1.5 standard defines 4 values for the PLF control: Off, 50Hz,
60Hz and Auto. But it does not clearly define if all the values must be
implemented or not.

Instead of just using the UVC version to determine what the PLF control
can do, probe it.

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 52 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d82cfc56dfd5..5b77ac308c84 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -495,18 +495,60 @@ static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc15 = {
 				  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
 };
 
-static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
+static int __uvc_ctrl_add_mapping_to_list(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping);
 
 static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
 {
+	const struct uvc_control_mapping *out_mapping =
+					&uvc_ctrl_power_line_mapping_uvc11;
+	u8 *buf __free(kfree) = NULL;
+	u8 init_val;
+	int ret;
+
+	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	/* Save the default PLF value, so we can restore it. */
+	ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
+			     chain->dev->intfnum, ctrl->info.selector,
+			     buf, sizeof(*buf));
+	/* If we cannot read the control skip it. */
+	if (ret)
+		return ret;
+	init_val = *buf;
+
+	/* If PLF value cannot be set to off, it is limited. */
+	*buf = V4L2_CID_POWER_LINE_FREQUENCY_DISABLED;
+	ret = uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
+			     chain->dev->intfnum, ctrl->info.selector,
+			     buf, sizeof(*buf));
+	if (ret)
+		return __uvc_ctrl_add_mapping_to_list(chain, ctrl,
+					&uvc_ctrl_power_line_mapping_limited);
+
+	/* UVC 1.1 does not define auto, we can exit. */
 	if (chain->dev->uvc_version < 0x150)
-		return __uvc_ctrl_add_mapping(chain, ctrl,
-					      &uvc_ctrl_power_line_mapping_uvc11);
+		goto end;
+
+	/* Check if the device supports auto. */
+	*buf = V4L2_CID_POWER_LINE_FREQUENCY_AUTO;
+	ret = uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
+			     chain->dev->intfnum, ctrl->info.selector,
+			     buf, sizeof(*buf));
+	if (!ret)
+		out_mapping = &uvc_ctrl_power_line_mapping_uvc15;
+
+end:
+	/* Restore initial value and add mapping. */
+	*buf = init_val;
+	uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
+		       chain->dev->intfnum, ctrl->info.selector,
+		       buf, sizeof(*buf));
 
-	return __uvc_ctrl_add_mapping(chain, ctrl,
-				      &uvc_ctrl_power_line_mapping_uvc15);
+	return __uvc_ctrl_add_mapping_to_list(chain, ctrl, out_mapping);
 }
 
 static const struct uvc_control_mapping uvc_ctrl_mappings[] = {

-- 
2.45.2.505.gda0bf45e8d-goog


