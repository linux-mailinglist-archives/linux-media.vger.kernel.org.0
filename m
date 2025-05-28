Return-Path: <linux-media+bounces-33544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4128AC703F
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 19:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C43B21BC59F1
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 17:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BDD28EA4A;
	Wed, 28 May 2025 17:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OpB4pEm8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1D128E56D
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 17:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455098; cv=none; b=TUuOMynax1I9dZ5tQyC38Orbx9VDQ5B4p901RYu1oisv04Ps4vcOAN3rOEOyTO5NOmJWc7t0oaacizkBjD0dqg8uCtezqyJWj8nWpGrg/uaA5SfkRQ3ixLRlRyyRGxY6D+Iz7x0pmaG7R79dXiNq8Jfe/Tou0hIY0e6/cL/TIOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455098; c=relaxed/simple;
	bh=jqykq6B/kJzsStcArhfP2exmz11fn7LB6mdjY5eqB4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LX3NacIwHoTikcqoGfRkOzMZ2r03HCSfb9nFYIDfdrwe3LziMh74nKFKzm7TxIDzAtyvO4Wh0Q1krY8lRQ3M/WAtFMBG9W+7PpPd0dfMLgPVjrdC1CmsqpWana0j02wA+UtT89xkVeRjY0YaCQxOBnd7z6q6hWLjiAEYMdagJgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OpB4pEm8; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-551fe46934eso152215e87.1
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748455095; x=1749059895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TMQfG/b+RrG3RPI5Hk1oXSiQtb/gQB19d4Z/Tsqyas=;
        b=OpB4pEm8hK6RclpuKqliAbMPbxpm5fWV9gw92ejeV8ZqNPMp5pG6PEU/DJMCrY5xJu
         V6JQ66cFtGbpeQ6LI7pK2S1QnyC/wv4REc8b72v9dT+K+hkfuMfvZb589TkCFlBVPO62
         QS8Jfy4xmxXwkCwUTKWqhImHZOlTwL5JmfE84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455095; x=1749059895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TMQfG/b+RrG3RPI5Hk1oXSiQtb/gQB19d4Z/Tsqyas=;
        b=wxK3IROWcGVS4+6Q9YHwEBz/Uu3r8SxDVrww9A4+tDTQ1XJRVVdeonGossbTDXIyCB
         gVMdrowrFPAMPRvO2fOZgj/L8Ti/GJL0VLVxA83xU+cKpdcux5aNPTN/omN5CW1vTfnY
         omKWUBXuP8sS/rKZTPV0tzZqGTumt2K3KOHRmVhMg9ZC+RH3wkR+/lv3ugMDCvlphFz+
         bEft3CJeWEne58+0IeHeC02a95T2397YlXK86z9lw5rfWVdF0ruAnGr/cJ8hKeuPw/An
         qZF1J6YNf1kalUzop7C/mRFPlQ578yvayY+NV/IKBuxrOESBc8cAo+xmVl+ZWK42UaaV
         vB3A==
X-Gm-Message-State: AOJu0YyWssEzHEZPVa0meBl6FPZ9BgOqn2rDWNXHWQagaGnBzQ7gIcYK
	sYj69c0IWoPytqQgFhH+r+qP01cSGI+C637FeoA1GSct+oJ850T6bpg8kLawnu1ctg==
X-Gm-Gg: ASbGncsHlVBLO4t+3Hl6niH+eIEv/VYpPi7vTXT3ylkg+Ir/w/mAzPtep5mNdWmvzdZ
	8KRlN79x3vuA+knfYvHo9lwVzQt+5A6J/KWtb0Dq9/mJOBpMCW8tS/dhbXUMHc0CYjl/OlT/ElV
	dGbynt9Nd1Gmb1DLmDQksnjL8keNcKnrdvYXcadGfm/R12ra8gr0DsS6DjenV+9oc57tvT/Ihji
	msN97bAbD3mDtzAEUCRhJRXUFprllATfkUYQ5KLpg60spKxhUB03lhtOO7adzoCMpS3ya9Qfxzq
	U14W4GvjIp4p8cJpjUZEYNlaIS0K1oS4cZcLpulteS2nleEh6vGbxtZnDX3kfXxJLz1tVWWire/
	3MkjaxiT0ZG03RSUX9v6vgi42Sg==
X-Google-Smtp-Source: AGHT+IHHwo3xql0dM/NDDGD2B5GCCQgwSRpZcvv2I4srv82vxwYj8aiHY3T6f0CcxKjZR6ZAHHBXAg==
X-Received: by 2002:a05:6512:1314:b0:552:21db:8f5b with SMTP id 2adb3069b0e04-55335b3239emr194102e87.27.1748455094821;
        Wed, 28 May 2025 10:58:14 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a6eesm376805e87.98.2025.05.28.10.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:58:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 17:57:59 +0000
Subject: [PATCH 4/9] media: uvcvideo: Remove stream->is_streaming field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-uvc-grannular-invert-v1-4-d01581f9cc25@chromium.org>
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
In-Reply-To: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The is_streaming field is used by modular PM to know if the device is
currently streaming or not.

With the transition to vb2 and fop helpers, we can use vb2 functions for
the same functionality.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 12 +++++-------
 drivers/media/usb/uvc/uvcvideo.h |  1 -
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 49cc64dd7e2e737f431b9df9df68921d9c543751..65c708b3fb1066bf2e8f12ab7cdf119452ad40f9 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -617,7 +617,8 @@ static int uvc_v4l2_release(struct file *file)
 
 	uvc_ctrl_cleanup_fh(handle);
 
-	if (handle->is_streaming)
+	if (stream->queue.queue.owner == file->private_data &&
+	    uvc_queue_streaming(&stream->queue))
 		uvc_pm_put(stream->dev);
 
 	/* Release the file handle. */
@@ -684,7 +685,7 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 	struct uvc_streaming *stream = handle->stream;
 	int ret;
 
-	if (handle->is_streaming)
+	if (uvc_queue_streaming(&stream->queue))
 		return 0;
 
 	ret = uvc_pm_get(stream->dev);
@@ -697,8 +698,6 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 		return ret;
 	}
 
-	handle->is_streaming = true;
-
 	return 0;
 }
 
@@ -707,16 +706,15 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
 {
 	struct uvc_fh *handle = fh;
 	struct uvc_streaming *stream = handle->stream;
+	bool was_streaming = uvc_queue_streaming(&stream->queue);
 	int ret;
 
 	ret = vb2_ioctl_streamoff(file, fh, type);
 	if (ret)
 		return ret;
 
-	if (handle->is_streaming) {
-		handle->is_streaming = false;
+	if (was_streaming)
 		uvc_pm_put(stream->dev);
-	}
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 3ddbf065a2cbae40ee48cb06f84ca8f0052990c4..f895f690f7cdc1af942d5f3a5f10e9dd1c956a35 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -626,7 +626,6 @@ struct uvc_fh {
 	struct uvc_video_chain *chain;
 	struct uvc_streaming *stream;
 	unsigned int pending_async_ctrls;
-	bool is_streaming;
 };
 
 /* ------------------------------------------------------------------------

-- 
2.49.0.1266.g31b7d2e469-goog


