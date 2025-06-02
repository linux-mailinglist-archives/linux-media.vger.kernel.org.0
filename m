Return-Path: <linux-media+bounces-33908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF089ACAE8B
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B6D33A5CB2
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DC921FF34;
	Mon,  2 Jun 2025 13:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SqF2Bqem"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEDF21C9F8
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 13:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869583; cv=none; b=GiRPSBqIqCh4Y9HdJtHt2xPFZCHIPkDQoMPYe8b+VBpdBi8E0ejksThjq1JzhENcHrtW6IjXytxn23QEoxpMQmbKmSB3a6g3bhjfe3Jz4x1o0zILLUrF0+m2x+f8ogpBpXiNN//ThKV/4HqursYE0ka6bFbp+fr5QzhQXI3wrjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869583; c=relaxed/simple;
	bh=GiBxw+zm//U/C+YTQyovbdu6MSyJ+bZDAcgLx/2Kbzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aNx8XL823E18qcRwvWVicR1JmMPae4yNMuWgA5AsWcBkFzMnKid/dfVCuQraVhKg3TTSdpS93e7A6st740EMUUsFTl0r8EP1SP3p7Tzo9ol66PADoIv13WEP5kBFeGoMt55o+t47mAdNuBcvdq6BRbtQT23E9V0nGAIxV8qo2aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SqF2Bqem; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54e7967cf67so5195097e87.0
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 06:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869580; x=1749474380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3ix9DwpCMClF3M2JTkGqryLw82zMUUM9JySNSXWuyo=;
        b=SqF2BqemjlN3PyEv+6ysEqgBcANAIwdMs0x3RpDqVYrDPAv+yzO4nu5+xkZ664Q30h
         bDkGpGj0AnUENr/kC8EYkqk8Cy4iYOFkD9WgKafKH7HPKwzJKXZdS4kLzI0hyeXZEj+M
         1xaXJZg7ar+y0PgitAHvnZLLFSJBWm6UjNaNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869580; x=1749474380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3ix9DwpCMClF3M2JTkGqryLw82zMUUM9JySNSXWuyo=;
        b=jMb9H7oV4M54xRLYnYz0e66EQP16V7vi//XH1AOEL5JTn+1BCaW3ahLCP6oHSOwV9C
         Tewe+1iwNgcwMU2jCeqY5+sWkbQj+iJmvDrwOZ9fnBSGe0NHmPOjMHJNY0WWdmktAblZ
         kXEpA3bYq8LolgXzPrrb6mi0PWnfF5Mxa2oRvP29radc/XQ7NwHUt7m5KlqSBMupwwOf
         fpiZnBVkgkcZZL0FTe+Qdkest1t9DXan3OKmtQgffYzQdqYAtmIedSyjBNvpRApVoriM
         Vl8hWpTh13zlYXdQL/qHdu+y59U3ro0CguoakVBt+Ead27Ko7C5upp9usIqE8mEvCaKj
         fEHQ==
X-Gm-Message-State: AOJu0YzXYWhXaVAXfPQBfq+IqyL+7b8zucqpHZmuPZHvO5ota0n1rald
	k0nW76SJfmnuFbU9siRyA0yKQYNETXoOyz/un3SbUjbFLxBvRmotcJif9Lva+Txmcw==
X-Gm-Gg: ASbGncvwGMUxcZxE0LdNMACIJtqk5dUZtplSax0TQ8DtpuhIcGtcd4baazW44MbjTj2
	VWp4qX5m40pZL7ljRJ06UN1gAW7API6LAwFpYiw9Oz56fijgiQ4R4VkyBNcup0pEGZoEhXelEXW
	Lwcg4HbCXIXZL2T1idBcTXJC1y1PMXarocOjyWM2uvNM2EqJjbV+MCdOzuzXcXEPT78spGC9t1H
	9lNKEwwUIOwFGab0ahkX5cQ4x+QwxGsHe4YHMuBWar2/QZaBmKTA5ZsCsUgdncsuAKnpU6+GDXE
	uuRLoevnH443e0fqgb2+B7silfQuDkb4+tRVG13auFJV/yUp55zGvY4R6aJSdzPQY8suTZ703mO
	8NcRBCXLBePXAH72JG/FAlva9nw==
X-Google-Smtp-Source: AGHT+IHaaeE2s/cM26BtGjZ20Lo2h4M+xB/fRejUpWThG9ibDbgdLRLCR7Fm2kvuEswuI/eNsNuKXw==
X-Received: by 2002:a05:6512:1103:b0:553:2cc1:2bb3 with SMTP id 2adb3069b0e04-55342f9276bmr2219289e87.36.1748869579468;
        Mon, 02 Jun 2025 06:06:19 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d26esm1590160e87.41.2025.06.02.06.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:06:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 13:06:13 +0000
Subject: [PATCH v2 1/9] media: uvcvideo: Refactor uvc_queue_streamon
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-grannular-invert-v2-1-c871934ad880@chromium.org>
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
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


