Return-Path: <linux-media+bounces-33542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 729F0AC703C
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 19:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1FD5A257AC
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 17:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7A728E59C;
	Wed, 28 May 2025 17:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hEioQEYj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE2928B4E0
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 17:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455096; cv=none; b=S6Y7r4SyDVQamShl706wzCR16ri2vqOLHRpX83y0dkvYL8KHkeCCOiXtacPuUmmXe3T8kvdXGcbobqXBMrArJVtB7EymmqVdjoAbNAX4GDIeAvd21o+i3PBErCbX9BE77qo/Vz0SSqsVRLNaw4vD5Tz4F8mVOi9TT+vIMiud9Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455096; c=relaxed/simple;
	bh=GiBxw+zm//U/C+YTQyovbdu6MSyJ+bZDAcgLx/2Kbzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KF7oP80z7de9zfFEdYBriLOnZHuJOTAOyiPoU5SIZxMY9y+ciFsybGp/KVIFMEut5n3a5qo8uyHWKwObt7Ixloe3y5j9lAmmBIJPCI0GVVHDsT2WXeS4DExVngPq+UuyZTf8BhenngRxFBFyRSWttYH6+QElrMU9ygHEY3RTZy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hEioQEYj; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so8174e87.1
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 10:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748455093; x=1749059893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3ix9DwpCMClF3M2JTkGqryLw82zMUUM9JySNSXWuyo=;
        b=hEioQEYj+rHQRZDZqjzH9Bftp1Av0E/CC5Ab8HjlwowUY6T0Pf78V6LKhtOontDeVT
         KL1AMkSKCCmuVvk+YyWYLu5d1pPBSSYIiSfqwjqeq/ewfDXnGPYoQah3sh6e3W8YUNcN
         GsdLtMz46mMay2HfVZn/Go9WPlcfi/bvORwxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455093; x=1749059893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3ix9DwpCMClF3M2JTkGqryLw82zMUUM9JySNSXWuyo=;
        b=l07hK8JeatXNRaDSEysbHGAX6KkcAH2XXyUPy2QdmqE4CDDEuxr5f1DvuOb6o3jl4+
         kKCMzsE4wv8vHoXp19zFSN5dQv5+d9WM+qM8BrvoqS3IvKry4lGKO7vl/B4vDYZZFhlj
         oOLWfJHmwGwA0rnrryJBm0IGjmfsN7pxdN2bi7fOgK+AJjQe1HcxtzXbnqWYNAibbPp5
         MJoHsrLUsBJDXibxRwaq1t9yS8LAgFB57LWhCDmoEx1Fo8v88WJ1DIzEUsGEsf9qZCNE
         Ny73QlT7ls7vqQQWeClgIWseH4TnjGdKQKjoLzDKFDwoxchW+9YmgpkbMrVwHhnM5P3h
         pgNA==
X-Gm-Message-State: AOJu0YxNXnL/Ro5d52SwhQS1nYvCcBcsfjoaQ4SME7jhgQlOetmIHxaO
	ajGk0Ckmi3aD+U2jxaEbCII67B+GZfL85s3WjnueHA3qA4V7LusQW3c594VlV0OdNA==
X-Gm-Gg: ASbGncubl4YfuDsTXZJoenRQyOTI2kauESqW5Tc8//hLxMrvV2bgqIdAuDMHDV/R1+5
	4IfS+dioICt7h+lLYAu4ic+lVxwdh4+F82chlbcW6wDDhBL9YD5iBBK2JnvilQyh2Fe7h7sP+Cq
	g5VVcb8SWMK3nexgLhu0kATRtDT5zQgqYn0Swy4jIfdhPLjR8SXaTqWA//UWnFQLyfcsbuV3UW3
	ZXY9Mfe3h9wMIiay5HEHb2Oj/nLp7AgiMsiY6GjRZlGPhM5xI+VbpYoZ33MsgY7O3blDIBJwRyj
	ZNYI4bd8wcnngxsUaEIsp0W05KbL5LGogWk7UMtOeMLA0IWppWXy387eAVJ3XKIckOhNJv7LYAU
	8GbEFlsmAg+sydtuqYpVmcBpqXg==
X-Google-Smtp-Source: AGHT+IG8Ik02jUgFA76IfXTO5TiYpbVuuWGX8ycRq2oZO4GvQe/uL9xzy0M7+OF/XwRGSYiVVuG2tA==
X-Received: by 2002:a05:6512:31cd:b0:553:34b7:5731 with SMTP id 2adb3069b0e04-55334b7581bmr712001e87.3.1748455093108;
        Wed, 28 May 2025 10:58:13 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a6eesm376805e87.98.2025.05.28.10.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:58:12 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 17:57:56 +0000
Subject: [PATCH 1/9] media: uvcvideo: Refactor uvc_queue_streamon
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-uvc-grannular-invert-v1-1-d01581f9cc25@chromium.org>
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
In-Reply-To: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Do uvc_pm_get before we call uvc_queue_streamon. Although the current
code is correct, uvc_ioctl_streamon is allways called after uvc_pm_get,
this change makes the code more resiliant to future changes.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/r/20250509-uvc-followup-v1-2-73bcde30d2b5@chromium.org
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
2.49.0.1266.g31b7d2e469-goog


