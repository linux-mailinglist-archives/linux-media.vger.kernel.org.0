Return-Path: <linux-media+bounces-33902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD192ACAE65
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 14:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30D171BA0776
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 12:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D83921D3DD;
	Mon,  2 Jun 2025 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fqhGoqDF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB5E1FFC7E
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869153; cv=none; b=ee12Vn7E/R3HzJ1JMJTFGjFUzlaM8H7imWSBtHJa6Ks6jfH3f0wKywqv3isMRk/K82GgPIQeobuAG3HHgf7tvL2+t6rthBPWFlqOW/6ozuh882ouNE0gjKzcAOrNjFZQNdP3+vjcQ5MomldonZQTH6mEwqAg0mLoKInz+D/C5Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869153; c=relaxed/simple;
	bh=pAwYR7oteo3vN3c/HkFqcbWJsyd0dKKMMaP2gKBrNyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y7293YDMzvKNRB+2fgtbNnyMOnYNSIoqrKEeUTlSN3zwOQr1sOh5lGLevW/BGCzlveWIUqtb/YNv+TSz8QwPBL5IH5Hejy5eYB7v7KytDKQn0DAlXXWCu1GddTnT8I9C3QSS3hIOvj56SaVKNyw9ObD8mItANT8Vw+E0PbAl++U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fqhGoqDF; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-551efd86048so5158551e87.3
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 05:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869149; x=1749473949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YmjTdxkPOA1uf9GrAFrNIGDFJaY+dZi3frhM7shyiw=;
        b=fqhGoqDFhiA6lmteLazdFiNZ4vNoMm4aK0k4n5O8njS27lm5TVsyqCNaymkeXlg9cS
         SGuforgNkCC65tNJ7oPsT7KYSqCRMFA1WsLP6Rp+c2gxgMyFKwT+luu6QcVM/HLj/Qvo
         R2Ha7DE+8mO0lx9izTV0d74ILc/ppooSrbxuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869149; x=1749473949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YmjTdxkPOA1uf9GrAFrNIGDFJaY+dZi3frhM7shyiw=;
        b=JtJQTiwSG4KdnGD6n0plbhrRBx2xy07s/gwgn/umzPvTMJna41GZ5DD25qiHpx57PX
         i+uhyYpOhnjgURjqXwQHZcjIywh514Ji47gvfUiPgjAT4U7UaZkzrnrpe5/SlwJPzZe6
         0j1KZjIP7sYJncvLtyjpKbHKmsXwjlwChuWbDQJopOdsMu+hZaOSVF0rQHCisEQztsRM
         KeQMOGmpDb/bAVUHwL+hlRUAuLt9EEpb15qdpjuYLH6YMgXsDMly4ixxnAnOBbzO6CGd
         wBjGpSr0ighBGoT0qC77ghC4kqmvqXbn4KrEQs7l/L+7Wet003c3LSQARkQjICfGLItL
         P3Uw==
X-Gm-Message-State: AOJu0Ywj6MMDBWkCAQ95uGiYEO4HvXxJtC6Enbh+28iBBvNLvvaq6H1A
	2X16kAaR5UY1bBbHRDpSUAXVlHjWnGJd5meJuSZQtSuZakSvHLMsCzVuEZkqOJMRLA==
X-Gm-Gg: ASbGncuEvJdmh6xXGp1Nh8Qg/gISqhouv6MYvOGrAMF8qIoqxoAgyLqsnROg/Omxx8B
	HY3U1X7vPDjg0XHtjXN1E7aaSsxY+0XrJZNmeqQRaR0ex64xhEC0yf1Yu47AEE7thc4s6GZDY98
	K+4p82zIULputFGJUWcMTiqH3KcpoW4EAHZHq4h35CRr+UvgtsuEAMXyREeTOPsaBzxXCtQQyMh
	ZZv/3T2emzbyQEOfzxqZdSZo3Qx9olykEgcx9cTWhzDDmHegrndd8PTNrxFup2qlyJiGxMSWGWw
	R7Ml3T0KGXfq3SBk3IW/kGf98fEfWrAC9hUtUIpqg3fiTbGw0eouR6HGQJLge1e9InJfDTwa2Ty
	r9dYcW385/4ZSc2iIol1U5InJZQ==
X-Google-Smtp-Source: AGHT+IENDYsuYrVM/PI/1zsFe+YIqnGhU0k6On7h3XKKfr6W2ID3ogEuuMlqT9Xqt6MGTCUJahfdTw==
X-Received: by 2002:a05:6512:3d25:b0:553:3945:82a7 with SMTP id 2adb3069b0e04-5533d160fe8mr3828575e87.12.1748869148648;
        Mon, 02 Jun 2025 05:59:08 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379377a8sm1601140e87.239.2025.06.02.05.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 05:59:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 12:59:02 +0000
Subject: [PATCH v2 1/3] media: uvcvideo: Refactor uvc_queue_streamon
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-fop-v2-1-508a293eae81@chromium.org>
References: <20250602-uvc-fop-v2-0-508a293eae81@chromium.org>
In-Reply-To: <20250602-uvc-fop-v2-0-508a293eae81@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

Do uvc_pm_get before we call uvc_queue_streamon. Although the current
code is correct, uvc_ioctl_streamon is always called after uvc_pm_get,
this change makes the code more resiliant to future changes.

This change also avoids calling streamoff, which is a rather ugly thing
to do.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
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
2.49.0.1266.g31b7d2e469-goog


