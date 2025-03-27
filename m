Return-Path: <linux-media+bounces-28893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCC1A73FE8
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 22:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB5D93BA558
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 21:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B721DB365;
	Thu, 27 Mar 2025 21:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N6JZakIK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625F11D6DA3
	for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 21:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109533; cv=none; b=dQ+4tuKkMBIyzPQKGgNjkk8e88Pa20G6tvfPIvP+avxaahZvf15YKNaGQqXIKYMJLFlbkpoju9VxEVYayewhTdR78LcSl/p8vti9q8yOjrYA5oMBXrGYqGLHTS2vju+39YYdiggO6Cxc4Df8bS/t2oRH+EWlSmGacOBa1AgNyMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109533; c=relaxed/simple;
	bh=TxX5jUZSYUIVTn11fnkYp4dDoBz40yBHO0WykwsdOaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HTn3qzbObCMoTJEl8MFrqAdm+Y3o08Ofskxw1tGzswXqUhMIek0dqQRthtHVX9by6IgKjgg5H8r6xaEs3wc+rtMhTv+GJFWNBXdrwtTPVTLGlw6cGN8IMy7Ypm8n95dG3L4zhAvsYTySUJIrmF1s4AAytscm98qr8yV0tncIx04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N6JZakIK; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476ae781d21so14223021cf.3
        for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 14:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743109531; x=1743714331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPotFYDYSrv3M9XvSy4jMhSd2liyPs79sEtxtKTVJFk=;
        b=N6JZakIK+stxAfhaLSndx+8gRKWBqgtHsn+N9PTu4QpZ2RENkQKuumT1DJ5U4pJ7J6
         Cg2XM5fWIyJ28/I84dwKeTamk1AiHBL/fKodE32y/UNmtQX8i0fh9lySEd8bD1Nh8Hks
         DaSeHZTvy3oGV8ZrWk7DVDwfsmtWwV11QAnJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743109531; x=1743714331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPotFYDYSrv3M9XvSy4jMhSd2liyPs79sEtxtKTVJFk=;
        b=NFeQmLK1pt8m/PY9rKGtyK5tOUI2k4IC93IjhBUIXKPKuXdOyilSHffWR31JW835Sd
         Ns34bxe32t6xNXS9UMxTCBrsb7dMMhXaBf9eYIRtS7PBkKY6P1gUZpUFlmyFCpzZ1rbW
         kHu5sBDBTfQ5oRi+ZN/G9tB/AMrm4ldFKLFnkb1OLlhvmJ/Irlsn997ouCE12XKqlx1l
         +JFLK1fxcpm8P8yxTBCx2c3Rt/mKu2EAIKpU7UnS8fn48wC6m+YHKVkgnCDgyVqgSWr4
         /0RFK19AW30fDsxj3jaj9bGhn8rCSs+W0gCmcstHO0+RtcUqHguOCX+eQf5hxlxErgoJ
         pjCQ==
X-Gm-Message-State: AOJu0Yy421B4hD6iD+5MiXY57tDQDqjM0Xy5BvgwJ6HFptaRSeX/06L9
	p3YjdJHNK62FPX9uKVtZJnH89NZSR9zYMjs/iXfRENlCbj0Y+oh64vVlMI2yuT2xRC405VnWhL8
	petJ/
X-Gm-Gg: ASbGncs3jaT47gWHgefn97C6bYbw50T6EfAPBA46uz+6kEaXqGGCgi5wjYmfmWgsulX
	QxbBKv/2QlDKkW6KEbKe7pR3aAnZROhFwy83HsQxtC9iqYJm1PeC7H4w9Mef0itPUWTrw8e+FSP
	7JFW7I5aKysTF/HGkXhru/N24PDkiPSKvluMeC/yZsJfkRmf1bPuONQSDOS9K4GOCIj6CgW0WyD
	dZxei6OGF7gaiFcABIZVKsv1nmZPYjmm9r77hPaBhqLqwKo/Q0iWwVU9OcnEYX99IOtCKuHMdnL
	4+/vGSDCWsCw42r04Km1qZDhJu1PYwGzSAqOxQhtHEXPduiahahnNfpe1/o8S+AatEVxp1mDY64
	A0A5TM4n096UQYTslfIRzkg==
X-Google-Smtp-Source: AGHT+IHj7YZZ63MNCoigRdtgWCTUNBYNqwOaQ+66Py4TXbFhO9b7we5UrotYcuAestOWglqJsI/5kA==
X-Received: by 2002:a05:622a:1928:b0:476:701b:d7ff with SMTP id d75a77b69052e-4776e1ffc15mr72943421cf.41.1743109531048;
        Thu, 27 Mar 2025 14:05:31 -0700 (PDT)
Received: from denia.c.googlers.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a1070csm2275421cf.9.2025.03.27.14.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 14:05:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 27 Mar 2025 21:05:27 +0000
Subject: [PATCH v6 1/5] media: uvcvideo: Keep streaming state in the file
 handle
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-uvc-granpower-ng-v6-1-35a2357ff348@chromium.org>
References: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
In-Reply-To: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Add a variable in the file handle state to figure out if a camera is in
the streaming state or not. This variable will be used in the future for
power management policies.

Now that we are at it, make use of guards to simplify the code.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 18 +++++++++++++-----
 drivers/media/usb/uvc/uvcvideo.h |  1 +
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 39065db44e864b8d107659197dac9ac33b01cf46..22886b47d81c2cfd0a744f34a50d296d606e54e8 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -841,11 +841,18 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 	if (!uvc_has_privileges(handle))
 		return -EBUSY;
 
-	mutex_lock(&stream->mutex);
+	guard(mutex)(&stream->mutex);
+
+	if (handle->is_streaming)
+		return 0;
+
 	ret = uvc_queue_streamon(&stream->queue, type);
-	mutex_unlock(&stream->mutex);
+	if (ret)
+		return ret;
 
-	return ret;
+	handle->is_streaming = true;
+
+	return 0;
 }
 
 static int uvc_ioctl_streamoff(struct file *file, void *fh,
@@ -857,9 +864,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
 	if (!uvc_has_privileges(handle))
 		return -EBUSY;
 
-	mutex_lock(&stream->mutex);
+	guard(mutex)(&stream->mutex);
+
 	uvc_queue_streamoff(&stream->queue, type);
-	mutex_unlock(&stream->mutex);
+	handle->is_streaming = false;
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b4ee701835fc016474d2cd2a0b67b2aa915c1c60..5ceb01e7831a83507550e1d3313e63da7494b2e4 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -630,6 +630,7 @@ struct uvc_fh {
 	struct uvc_streaming *stream;
 	enum uvc_handle_state state;
 	unsigned int pending_async_ctrls;
+	bool is_streaming;
 };
 
 /* ------------------------------------------------------------------------

-- 
2.49.0.472.ge94155a9ec-goog


