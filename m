Return-Path: <linux-media+bounces-22128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D4B9DA351
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 08:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 226BD16686F
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 07:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BAF178395;
	Wed, 27 Nov 2024 07:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ob9aMd2W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8F2154449
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 07:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732693584; cv=none; b=uJ/9+Shb7pZGhyn/u1WUBS2LGTogMhdZ7kBnsaJUssXGSDcu3n1fVIfi13o3a17gZ4iH2L6Y60zUkWm+5esCAN5i0tmbe7+8P4COtmz6ztj0ILtJ+8XOddKrDIUCYoiVCLNBFp/N7x5fgWuMbM74HkOaNnb47NbMZvIyx+ons8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732693584; c=relaxed/simple;
	bh=P7cJDdqJWrLuL8K2uEZRvjaoWn4MVm6+xAAkGWyiVYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxiIsSfUve+uyRVHmD+/UIFbNo+KSIgK5d8x/twBPVF11Uwr/cVnwBKcCBbwqMFfk/XyT5P9xhMqhkizfpOZRinDHvh9XnzwbptWo1fe3LX9nvj8HoovBOuhqWzZZeICtIEwKDiLBTpZgMtrcAEcAUz4auWAa8gR2Fsb26yBgqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ob9aMd2W; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b31b66d2e3so330127585a.2
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 23:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732693581; x=1733298381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKrUO2mKilVMnb8uGrp8DPUwicBtZJtjKmdkARmt5l4=;
        b=ob9aMd2WGwHgFzxBQK5Pw0cyNcdvykqiYRNd8WSqBf9QMq/utIA1p1SlM1PQiwpR2T
         Qy3UPxY0TAZKFOmkra9zg3NU/ulQTTjP9BEmKwzaLtmjNXY923JoHIk4ccytcZpn2YNX
         BEaZhPNeNCvZcdc3CTAlWd28JrBIL+InP6DCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732693581; x=1733298381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKrUO2mKilVMnb8uGrp8DPUwicBtZJtjKmdkARmt5l4=;
        b=Q6gfx602WRPo9jyOSAGF9/m8qxbNTJnU1IHqFcMvAZMYo84BIHc85YzqZi36mCtqHT
         mueFZGDXdqGE99G8BRrUkuCPRhbf3Ai1Ftt4Q49jc+R0+LAfxSQhRlPPwkSqIg8W5nDO
         wPbv1HM7LLXpBftITGfXRT/FiVEU1s7L2+H+qGLr88i68mj8u1YteTH9p+vmzV16TeQx
         P+gupSHB0hY1jnpCYTqkx0tGM+tS572fekzsPYSERpiy1ICGuxT8N1wjBrKfjkrxUPYc
         w/GQrIRBeJspgkYpwcRCFykww6f/+7sGQKx7V9PuKEILSMXZ23ZLG0YQSc8u4ajIRfIC
         yF2A==
X-Forwarded-Encrypted: i=1; AJvYcCVAWAf05r5vYc6br8Bwjv8/tnzaN19wc2ut2k7n4CJVBRFFmi42mnzy7TN85XB8uozl8USFTP/5cdiN7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyweQAzvVlqQR/iZ0vEkIx9tTBbhMZaJwel3a9loo5dBd1VfmNb
	FJHyA0EGSK59ktlc9lezy68/hJhCPI9WSv2xDWfbbZDjdgA00bN4FTafh7Wyyw==
X-Gm-Gg: ASbGnct66Tt+jvvE+Q86ookIHKE9G5PBGmC2VR9RXX29Ty0XGuswbb3CV4GiMULiDCK
	v6eT56nFdjDrk7AquOueIzen3+uOwSKNrjhCpJ/uOjNl5GquBcL6U9ardkfR9GwLO4tY8/ZH/eX
	6ksqUzQwt4cOElMZSNl8HhEdvON6ttnwmiHbaDt0Pkg4qT1tItRzEF8XsgkFDH1RhMMIAPRcVoG
	i9ZU4hkZ7NGWNPr7EEsUYRK5OTIVRtCGi1LzkcwUhYEruXeMVFt2KcWzO1ydtEiGaj9gQo39DKV
	W0sUUko/CHh29A64Kl40d8es
X-Google-Smtp-Source: AGHT+IHjZqETEPShgvU8rMJKDjffubDyJxiF4XR9EMU6bbMMSHIwCT/IdCc48x4fk/k07H62yBxdcA==
X-Received: by 2002:ad4:5766:0:b0:6cb:ce4c:1cc1 with SMTP id 6a1803df08f44-6d864d1f41dmr29507186d6.20.1732693581473;
        Tue, 26 Nov 2024 23:46:21 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451a97b1asm63750386d6.40.2024.11.26.23.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 23:46:20 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 27 Nov 2024 07:46:10 +0000
Subject: [PATCH 1/2] media: uvcvideo: Do not set an async control owned by
 other fh
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-uvc-fix-async-v1-1-eb8722531b8c@chromium.org>
References: <20241127-uvc-fix-async-v1-0-eb8722531b8c@chromium.org>
In-Reply-To: <20241127-uvc-fix-async-v1-0-eb8722531b8c@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

If a file handle is waiting for a response from an async control, avoid
that other file handle operate with it.

Without this patch, the first file handle will never get the event
associated to that operation.

Cc: stable@vger.kernel.org
Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4fe26e82e3d1..5d3a28edf7f0 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1950,6 +1950,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
 		return -EACCES;
 
+	/* Other file handle is waiting a response from this async control. */
+	if (ctrl->handle && ctrl->handle != handle)
+		return -EBUSY;
+
 	/* Clamp out of range values. */
 	switch (mapping->v4l2_type) {
 	case V4L2_CTRL_TYPE_INTEGER:

-- 
2.47.0.338.g60cca15819-goog


