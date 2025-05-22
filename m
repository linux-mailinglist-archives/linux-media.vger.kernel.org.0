Return-Path: <linux-media+bounces-33192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1100BAC12EA
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 20:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A11B816E293
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 18:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB85429A9DE;
	Thu, 22 May 2025 17:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J9oaSQmC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C9219D8AC
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 17:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936732; cv=none; b=F1+uUZjWFyjLKNSGzu3b0A4cfRszrjcCpya/dFE/D9T6cvLbhaPylOSXKd/xwaRpApH5SBYqKbtIyEdKpOmh/OJ/MoXkC+qKhJjkPPhXWmPfioLqsS8asUeR1khcDs5Oxy4//DXd5gKga3mqps7UC0zDSnDLBhnj5bQ7VS6oN14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936732; c=relaxed/simple;
	bh=QcG3SUn+imyDe25SjF5FB7e+cnIdZBxIsQWIVlcGZhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SO0mjGbZvlY9M0W4f7VKWRpGVRzfAqcnDC0AnTKK8dmjlr+JLS9s/VLnn04mo5BWKuL50ThpRF/pSA7hBXS4+huZqn1/Mm6hjPswp4TTExAzQFtE01W0CeP21S2l5p5E9UTiH+p/xgPEe8RMnezaz7DQNNSPlQM8RTeZyIRccVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J9oaSQmC; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54b166fa41bso12606228e87.0
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 10:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747936728; x=1748541528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eq6hiXCLW/5+B6e/F9cx3BxUfpM989hM42lId2PS3xs=;
        b=J9oaSQmC5nZ644gvntnIywShg3iVyL5HLmt3gVNNMEPoRpg0yTjvPaaJVG9dERZ0NW
         mxp4J0WyREo5QI6Q2ifvWZCoJxVV8p6w20XV2Ti7x5EJT5Y1wXHp9gWuBZKBgjJnxP2X
         Z3/SAHcD9yIt070L3zb7wNsFO8tBVS88nVihg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936728; x=1748541528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eq6hiXCLW/5+B6e/F9cx3BxUfpM989hM42lId2PS3xs=;
        b=rhYcEaCBg8VRr9U+Ju41lPbtH0/HnLOskauyRJnLEOtHq+p8LuWNEPYS27w76R/YuK
         +9VMreNa8Tn/eBeLGNili3sP55NqcQQq4e+EsQQ2cxycI0L7/3NfD4/74MwOltgN9pP+
         PBwvYGre7XoxV1PVwPuEl7iuE+lr38sDGUeReKRNgY53pgdGHlho8LpZq6MDQ8OWqcF0
         iZYWD9/vy1XJNm7MeRZc5KM132e7PkWYNaQttfPX+9quu49jTd4PFY2fwj7Q4YM70llX
         fT9qXD0j8iO4flda4iNweCBRZY74bKTKQHb/zDOpxddyEhsQyIQbsc2kIrOF6uAj3qxu
         MPOg==
X-Gm-Message-State: AOJu0YzsqCOug1JaU4Ul3XfcBF2jXDmzUZmhLU0JqRp0GKbjgZuiFgOM
	YcKTzg2m7ASyfB2Jt3iENOswVLvpSva0uVqzTYdiGG75HbbdHyYiQdKo5TFx6W9hjeMkRcsGKTW
	gQyA=
X-Gm-Gg: ASbGnctgpGNcw639JkEr++CgIqAfb48K6qZH8B9RcnATlNi0X8iZf3uhbMO2hvO7YOh
	NRYpnC4ki5YTq2tkHgOaycaK7gXKsVp09lx0sUGuY4072vo8CGTaX863gTarZQjSQuBA1HsHUAY
	DGXF/iWuUhlKBAKVTdRgqKKKNdZlJVlznuD0vK05beji23d6A6GkWjhW0lEvbMgrKZhkMhkHZJh
	EJbnjzn+1y5W/l40Fsr+sDyvMfbbFZLjGf7nHHMa4bYNx9+11c8eN5OU8HERoHCzN5eomJmpeTv
	aVpLxRYrE3UwnxzDnz/egrVqyCcyY9WPydzPyCm/J0VpeK9yMcYxpYxFYIeZ3sEk12c4G6bEjRN
	r/pHlPL6y82HEX62lbVoYSjP7Sw==
X-Google-Smtp-Source: AGHT+IHtz+09CN3dUILoE5bvCx936+0JcoTZUsSxmv1K+SqjZ4Dfvhh4AkX2J/5LPVoG9ByQqGjbnQ==
X-Received: by 2002:a05:6512:39c9:b0:545:1104:617d with SMTP id 2adb3069b0e04-550e7195516mr10182880e87.11.1747936728367;
        Thu, 22 May 2025 10:58:48 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703e858sm3483992e87.227.2025.05.22.10.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:58:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 22 May 2025 17:58:46 +0000
Subject: [PATCH 1/3] media: uvcvideo: Refactor uvc_queue_streamon
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-uvc-fop-v1-1-3bfe7a00f31d@chromium.org>
References: <20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org>
In-Reply-To: <20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Do uvc_pm_get before we call uvc_queue_streamon. Although the current
code is correct, uvc_ioctl_streamon is allways called after uvc_pm_get,
this change makes the code more resiliant to future changes.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 668a4e9d772c6d91f045ca75e2744b3a6c69da6b..862b4e34e5b629cf324479a9bb59ebe8784ccd5d 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -853,15 +853,16 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 	if (handle->is_streaming)
 		return 0;
 
-	ret = uvc_queue_streamon(&stream->queue, type);
+	ret = uvc_pm_get(stream->dev);
 	if (ret)
 		return ret;
 
-	ret = uvc_pm_get(stream->dev);
+	ret = uvc_queue_streamon(&stream->queue, type);
 	if (ret) {
-		uvc_queue_streamoff(&stream->queue, type);
+		uvc_pm_put(stream->dev);
 		return ret;
 	}
+
 	handle->is_streaming = true;
 
 	return 0;

-- 
2.49.0.1151.ga128411c76-goog


