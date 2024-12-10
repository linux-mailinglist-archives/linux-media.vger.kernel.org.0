Return-Path: <linux-media+bounces-23111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A6A9EBDC7
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 23:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8808916968A
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 22:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EFD21127A;
	Tue, 10 Dec 2024 22:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZizVTI5a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30141F1905
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 22:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733869354; cv=none; b=iaYP3m78Rc9GI7aqXZ3wFfTQ+Hai3C/O7l86IAfQjIbpbeFOhbmrbbyPTbBMVcYELYM1dBsJ+JV6xonhbv1nhvTHlxdzKZdolypJcc41vpr0fkuufGQfizFH0Gd3SnsB9Y0/4W2T2JvC/Rduz3kl+BIR86x2NvLUPc7Tog6Dqp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733869354; c=relaxed/simple;
	bh=K72388Mo46bPaPYonT5jJ6Lw47MWUey0RMwa7LB7+rA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLixuU53hoJympBNQCQovIXFny5SJT81c4nMgMTBjmyDY9q0/RtHEftCP5GrkiCjoNshqAgcj5l69FPxMwBg+KQzpHPKyFE5/Jt4O0h+N++/8X/7nkyGeZU9zFcu+UJmTWjLASqAcntoKz+EYrgDTK4IicR3SD8bSCfQ66jnZ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZizVTI5a; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4676859b911so20436191cf.2
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 14:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733869352; x=1734474152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJLKxDvZkcys4CNhxAUoQwbKiFgypyACQZbRSa8Ir9s=;
        b=ZizVTI5a/DNfthesS7iIWDxpaRQfpXo4AiqT18JO7TPnDp+HCwawjlk9OvBgqhGxEb
         ie6ODoosk99RBcC6dh+MCvIMA7NLUYRKA++E647UOuJrn6/PsVFF5vGZGywKFDffHA9y
         NwIFfRFG9eJVrYFLWKSYZnjWVkaqJa02hONX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733869352; x=1734474152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJLKxDvZkcys4CNhxAUoQwbKiFgypyACQZbRSa8Ir9s=;
        b=MJJcBYzOTHjhq0YUROS8CLizQ2iBI7B5pt2zLjs1JlkIJuOrpngNdFaajys3yOhw3y
         UGCm7imMsP5KrtGGf9WNZPrSIuHWVugBFmfU6jANzpG//Pi0iYMo9udHI91hrersT6DH
         OUAgwDuaZ8yZ9jy7SqJwV7M0eHoOYz6TxX26vlHVhcCT7+1sZS4ZhaCuX8b0XLBeP08c
         24t4oTwHtHyLHQl4f1JIE6jdohXq47R5ZCxKtGC3J4kEDUgOXFoQMjmZWWmWMRNRf7Ta
         hSLwrl7/vQqbVW5/xObPD8TtlABffmLXCupOKyHRIBHW+2ksse18DeFfek6l8Phksu6q
         f6iQ==
X-Gm-Message-State: AOJu0YxMOCJA3+KZo7GBNn/VkzzJeYy+GTKiuJ8+v4dK2CM5kbYZg6B1
	CxqtH71rND5UG9NxiHQR7J7Sxew3PMhW90WXUjOr1xk99psNFUWCr62BaO9KFA==
X-Gm-Gg: ASbGncvUI+L+yoalkhKo3zzM6iQjC3vFu++CIE70Zyn//BzKfWtBJhBWuBE0TOezmpq
	o7SNYFhjvMwonE49LMtf7hojcON1A2eG270T3qHY5DqOuWOVPd6xbcW2IFbn5gL5xR/lqZxAUYT
	3SCeHPSZC4q43iLHIPiT1hWkc9xyRvlYOICYqx5jl7ypw9kQsRBBoLmtumDlys9FxnBIQz6tSO2
	hFe0Dklm3B9vsAnj7Jp7+6wYAfbaGtWqI9B1ocBm+KPFEoBLHtzJMPECMWBKQ2U6YKuQdvCsoWt
	qMbvlJ1syvuLRKVCWz8AHSbQa7Fc
X-Google-Smtp-Source: AGHT+IGwaoCAcWJN2GJxUO5RU2+RMPWc2ZQl9JG0CXgAkbSPwqLMrUX3CS7unfn384D0Zdx4YTo8rg==
X-Received: by 2002:a05:622a:5448:b0:467:6833:e30c with SMTP id d75a77b69052e-46789309cdfmr11188201cf.30.1733869351829;
        Tue, 10 Dec 2024 14:22:31 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467776034b0sm11232441cf.74.2024.12.10.14.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 14:22:30 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 22:22:23 +0000
Subject: [PATCH 2/3] media: uvcvideo: Do not send events for not changed
 controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-uvc-data-backup-v1-2-77141e439cc3@chromium.org>
References: <20241210-uvc-data-backup-v1-0-77141e439cc3@chromium.org>
In-Reply-To: <20241210-uvc-data-backup-v1-0-77141e439cc3@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@kernel.org
X-Mailer: b4 0.13.0

Only send events for controls that have actually changed.
E.g.: We are changing entities A, B and C. If we get an error while
we change B we do not continue setting C. But the current code sends an
event also for C.

Due to the fact that the controls are grouped by entities, and the user
might group them in different orders, we cannot send the events at the
end, but when we change an entity.

Cc: stable@kernel.org
Fixes: b4012002f3a3 ("[media] uvcvideo: Add support for control events")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 7e2fc97c9f43..9496ac970267 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1669,7 +1669,9 @@ static bool uvc_ctrl_xctrls_has_control(const struct v4l2_ext_control *xctrls,
 }
 
 static void uvc_ctrl_send_events(struct uvc_fh *handle,
-	const struct v4l2_ext_control *xctrls, unsigned int xctrls_count)
+				 struct uvc_entity *entity,
+				 const struct v4l2_ext_control *xctrls,
+				 unsigned int xctrls_count)
 {
 	struct uvc_control_mapping *mapping;
 	struct uvc_control *ctrl;
@@ -1680,6 +1682,9 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
 	for (i = 0; i < xctrls_count; ++i) {
 		ctrl = uvc_find_control(handle->chain, xctrls[i].id, &mapping);
 
+		if (ctrl->entity != entity)
+			continue;
+
 		if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
 			/* Notification will be sent from an Interrupt event. */
 			continue;
@@ -1911,11 +1916,12 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
 					uvc_ctrl_find_ctrl_idx(entity, ctrls,
 							       err_ctrl);
 			goto done;
+		} else if (ret > 0 && !rollback) {
+			uvc_ctrl_send_events(handle, entity,
+					     ctrls->controls, ctrls->count);
 		}
 	}
 
-	if (!rollback)
-		uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
 done:
 	mutex_unlock(&chain->ctrl_mutex);
 	return ret < 0 ? ret : 0;

-- 
2.47.0.338.g60cca15819-goog


