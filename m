Return-Path: <linux-media+bounces-12902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 118B6902C49
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 01:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD5B9285355
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 23:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31F9155305;
	Mon, 10 Jun 2024 23:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U26le7M2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD7915444B
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 23:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718061004; cv=none; b=YclaOCDxaICL81RIBAnSkRzDO6kwimw6roQtT26P8M8+M/MByMZ3hcgKxZtGyusGV7ndVPcKWTXZqEQzJh1UxwWOiaduyaH1mmmygB7D9Ygi7INzpdm9wyzXZUfN+tJKaySQ9+U72UqjQGjSbIfc4F5DnR3J7CrzgA8WNUoYK4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718061004; c=relaxed/simple;
	bh=+r2Q25v4QtfWRynLyRqPbgCpgtuh54ubGSY1KEdbNko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bNwvloxp9pHUGRiR2piUb9XtI3+bgNaSSRf50PlONDMqDyA1E4qa+fMJVI+94L0a+rUxPsP0efh2c+MTyQIYgOtkuLe9PlZhpMu2YYMamvGxhS9RwTLKftec21lBwljvYDXfFIdVInbdOn5lulkuXKb/HWqZP3pqENNST6T+zkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U26le7M2; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6b08d661dbaso230316d6.0
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 16:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718061001; x=1718665801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Er/qUnS8MdBJtpjo7BWYHXnD96tca0yCRfZOovxm8nw=;
        b=U26le7M204F4uxJv1Q80Ygo74iSqbHJkvY7VbNyuULhMZCDOZDrAa5ljLd6G1qf1ZH
         jn7ZzWOKsZLChSBHgCwPoaEAEt5m2f5Dl1ND6Q75ESFdcbJl8u6SrR68kbHuPb63dO7F
         i16m/ODeXqLKL7SGtvKpJwrhNz7K/YBkiA+hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718061001; x=1718665801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Er/qUnS8MdBJtpjo7BWYHXnD96tca0yCRfZOovxm8nw=;
        b=Sv1z8er8iA7RYeLVArUIjim4A1ZJrIdeHa8P+UEeBlIJdI+6VCF5GycIfVLiimEhKF
         q/neQqR4/oWQRat3b0sJJPiNPsZRpy56Biwb7+3cPKyA0vgFe3zfxVejg5IJIndiH/cl
         MrAe5dCCrAUeMKeeDYT5V60wC+cXGF4R+8ZnfcVqEB6g09jKJb2zHJEGN/qo06cIJj3L
         gNRTgIi979pvBN7iq7iC+ZwqKe1Qst8rfsG6S7zPwDSgi6HxlgQ2fPzJ134r2V6ZnwiG
         hhzsxlqQgFh2mO/O6HjrJgfVyFLjp7rMLJiR3KfuslCaZe0SJeVsVMFdrgNXLiSWH+uG
         OYqA==
X-Forwarded-Encrypted: i=1; AJvYcCUSK1KlKp8H6M3aUxlDU/azYa034C0hxGb+Hsr8Lu0xMSLs5EJCoGMJ2bGeDmrkYYvZi5p3S/xcJRruw0qv0EOfOq3otHd/x2MLOe0=
X-Gm-Message-State: AOJu0YzKnArub2R9pNysnphkhEL1X0VTP7YqvEWcdqjHh6vQGyqENaFs
	9vagE7pPIbWxLrDmcsgQ+frvkR2jHGYbDYMnRJykANkh8sJgaNxkhR9FYbOXtA==
X-Google-Smtp-Source: AGHT+IGGVcUXF3Q+TzeoBW1dpWSX4RCelVgPbdr7LwKtNneYSQiKMiE+ovxL9rBTwMEOW02U5O75Aw==
X-Received: by 2002:ad4:5747:0:b0:6ab:9214:ffd3 with SMTP id 6a1803df08f44-6b089f75071mr21382306d6.25.1718061001474;
        Mon, 10 Jun 2024 16:10:01 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b06519d521sm35256946d6.65.2024.06.10.16.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 16:10:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 10 Jun 2024 23:09:57 +0000
Subject: [PATCH v2 6/7] media: uvcvideo: Remove mappings form
 uvc_device_info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240610-billion-v2-6-38e861475f85@chromium.org>
References: <20240610-billion-v2-0-38e861475f85@chromium.org>
In-Reply-To: <20240610-billion-v2-0-38e861475f85@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

We do not have any quirk device making us of this. Remove from now. It
can be easily reverted later if needed.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 27 +--------------------------
 drivers/media/usb/uvc/uvcvideo.h |  1 -
 2 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d74019cb27fe..1c1710e3c486 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2679,32 +2679,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	if (!ctrl->initialized)
 		return;
 
-	/*
-	 * First check if the device provides a custom mapping for this control,
-	 * used to override standard mappings for non-conformant devices. Don't
-	 * process standard mappings if a custom mapping is found. This
-	 * mechanism doesn't support combining standard and custom mappings for
-	 * a single control.
-	 */
-	if (chain->dev->info->mappings) {
-		bool custom = false;
-
-		for (i = 0; chain->dev->info->mappings[i]; ++i) {
-			const struct uvc_control_mapping *mapping =
-				chain->dev->info->mappings[i];
-
-			if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
-			    ctrl->info.selector == mapping->selector) {
-				__uvc_ctrl_add_mapping(chain, ctrl, mapping);
-				custom = true;
-			}
-		}
-
-		if (custom)
-			return;
-	}
-
-	/* Process common mappings next. */
+	/* Process common mappings. */
 	for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
 		const struct uvc_control_mapping *mapping = &uvc_ctrl_mappings[i];
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 4df02a40c74f..ff9545dcf716 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -527,7 +527,6 @@ struct uvc_device_info {
 	u32	quirks;
 	u32	meta_format;
 	u16	uvc_version;
-	const struct uvc_control_mapping **mappings;
 };
 
 struct uvc_status_streaming {

-- 
2.45.2.505.gda0bf45e8d-goog


