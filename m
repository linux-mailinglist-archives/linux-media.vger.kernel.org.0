Return-Path: <linux-media+bounces-22571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D08C29E2DFD
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 22:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B10111640B0
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 21:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C0820C014;
	Tue,  3 Dec 2024 21:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LyCfcK68"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBE820B80A
	for <linux-media@vger.kernel.org>; Tue,  3 Dec 2024 21:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733260831; cv=none; b=sjCrkDOhSwBkR4aLwh/u+FpGe8kQ0wG212ADqwbfaawv6Ja6/E2reWWBzJDpTEiAeDfLf8/l+r6LVmj1zD543K5A00mD3lqxwnDpCmYvTHSx4UEibGhCRFZ9WjzrCDFmfBoPy9sQkg8lxvGzEqxG5fl+OPAF0iEXieiV969cDRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733260831; c=relaxed/simple;
	bh=jFTBG9LprJIjbHQlM1I0RJN2j3CUZpzoB8yyx/zxbSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fEjuKvMGwLXiiZhvrCJKoNa0jAfVmzNVaKzqFJgmyorEIdO6gIIMgASq3lAWEfKw7ssLfFLIyT7zAf9r0rrSRpzT+TCZwe6xpt1rgPWKZRoqeugqnOQFUAnFTVs2ciSPrypHMaH+w10bvMn2o634FGbKhJIuUS9udbZ2dg+SCwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LyCfcK68; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-71d5af465b7so2644319a34.2
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2024 13:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733260829; x=1733865629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLLkfyeupXOCJEsbtIiRnjf9v6qN6z82wPD/jzcKBAs=;
        b=LyCfcK68f5N6DK8XS3wwSUe+nlKahIqetZ+9qL/+vkDYLNgYksRTzeJvB2aNRsYtko
         4dvZu9OcRJhgIUngglhimUfE2S6HpL2qRnQG3de59EpLklP/DcTyNcJpnkNRH2VPYDfz
         GrJiJreNnCvDuXZ9iuCo8GlHhGX1oQFHHxHK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733260829; x=1733865629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLLkfyeupXOCJEsbtIiRnjf9v6qN6z82wPD/jzcKBAs=;
        b=bUzZfh4FXbW4+8Gvb1VmS1QfyNhOI8hmr9mG9sytO45rwT6Wh+wwfFZ2sgZ/1IsOus
         ciKcAGYJvsQ7qFs/Vdj4MGMIH8pYXTNyhMEPhxzL7xZ8x0WXh+NF9Uc32vMjFffyKKWu
         4Oubs4y+rwzgant7eB6ZAv/n6tM9xE2TA1/n2sEJSILTVEFwcSS7RYdaBdvOqYtBLmqN
         MbbI8vX4tDV+zKvWNXhBzi//sk8KEVa/jbmmBab331D+ij8QkxO31tJpD2nHOKuH+3pJ
         9EFAMCiuJRzxEKCmLnxQ0LtuQgrYBjdyWNGz+RBwPZTPrwVnr4SOaKIObYUUYpOujazz
         afwg==
X-Forwarded-Encrypted: i=1; AJvYcCW3tmrfk+CzyKXesbpuMfVNNpLEvIlt6oZL+nEAAhLE5ElsO/OZpOi/XEs3sdNGarfHLuou/0k1fcsbJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1LaJ4R7dfsHEdDLYMTQ2WI7ILG7iimrM6Ei3rstTJIAmweoeN
	Eg04qzoUprom8fDmSTcMAHDLpC9avR3TS6le02N1BwM7LnOhcbPtaW6OGrkgZA==
X-Gm-Gg: ASbGncugZOYISVAdO3XNHTiMfupkzGYTLNVss8PUqAnsWSq2Xa9VDmBtD3aTH9ocqcm
	e31U72TXz/z0w2A7n8jfwillf6ItOi/BcUTZxXo2zBJRRV5Yhq/OTH9JcpfyGAe9UHFmfZQu2mx
	4H0AEZp9Xo2Zm1riSOvjFJIr2VPJufMAlfV0IMdJLFco7iA8bPhSNC17t6u9zixxGZ2zSMaDkHv
	yXYB5cFqKoSMlpwTc0u3LoN4GWdt8OkVonKgvME8jHYuFlr8oiXO5M+oaOLlHXK2UhvN/DRn5aP
	glS0KNypZTDKe2P0DdlGlEaD
X-Google-Smtp-Source: AGHT+IHXPcyq+8B+KJ1dPXvdy3NU/VpWuqhFh2jcwyvKYbPbXmP0jy2dIclUy4Dce3/3CyVeNJ8Jdg==
X-Received: by 2002:a05:6358:5bcc:b0:1ca:9660:67db with SMTP id e5c5f4694b2df-1caeabd17d0mr509285255d.23.1733260829162;
        Tue, 03 Dec 2024 13:20:29 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b82a89d5csm2140364241.8.2024.12.03.13.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 13:20:27 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 03 Dec 2024 21:20:12 +0000
Subject: [PATCH v6 5/5] media: uvcvideo: Flush the control cache when we
 get an event
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-uvc-fix-async-v6-5-26c867231118@chromium.org>
References: <20241203-uvc-fix-async-v6-0-26c867231118@chromium.org>
In-Reply-To: <20241203-uvc-fix-async-v6-0-26c867231118@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Asynchronous controls trigger an event when they have completed their
operation.

This can make that the control cached value does not match the value in
the device.

Let's flush the cache to be on the safe side.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 3dc9b7a49f64..db29e0e8bfd4 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1622,6 +1622,9 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 
 	mutex_lock(&chain->ctrl_mutex);
 
+	/* Flush the control cache, the data might have changed. */
+	ctrl->loaded = 0;
+
 	handle = ctrl->handle;
 	if (handle)
 		uvc_ctrl_set_handle(handle, ctrl, NULL);

-- 
2.47.0.338.g60cca15819-goog


