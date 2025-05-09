Return-Path: <linux-media+bounces-32166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7147AB1C3E
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 20:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5AD5A25B2D
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 18:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87F72405F8;
	Fri,  9 May 2025 18:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VNa/KW0w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977F123D2A1
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 18:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815059; cv=none; b=IcVHLFMZOMD5lrRW6E8zA5oj0GaB0O1bBl8qkXYkVTxV5O+eDQGBPFgbIyIpCQ3XiV6sqOL9fp+ieIWycCWTB37AuKsZ00yeI4F4lhbayhE1wfm+uhQjuxALJA8+iSHtEYaSTwD66bjV4fV0W+/SZCuyTgogTDke3gKYnsUJrVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815059; c=relaxed/simple;
	bh=WlqhFERSYY876eu6fXODc3hMDt3fXzrYrhbCeMIHbl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z9oN+9JFLMGjaOP2WWG5bv2qXQYOi/nRJMimLU3t9X4O24jdb4eI/XJJq2XjMnfBkN6KYauVCaPXrTjvWxeBM9rrB7Kh5Z3/o8LZm21TGTLM09j/TXi0gQkXB/Y9zmr08e9uD4dRK/zvojHtJSwnSb/tHC/esgd6S7k2R0jzef4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VNa/KW0w; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b1095625dso2755547e87.0
        for <linux-media@vger.kernel.org>; Fri, 09 May 2025 11:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746815055; x=1747419855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5MuBF0fz+s4ovvaXx6dw9lnVXB5+San6yqV1OmsO2s=;
        b=VNa/KW0w9vE2OLZY34beiVM3U04EL47LF2lhGqkuoAJS/lLcAQTcCWts95I0cLpmDq
         jX6qkcchxgXlCyPDvtlyxKoTndssNKttlCTbIIAGcLwsp6Qgi4kBb3aUp+J77hF44ATG
         1b6kg1OfhUBeyRGAksw2IEyNrAowW80hfs9WA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815055; x=1747419855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5MuBF0fz+s4ovvaXx6dw9lnVXB5+San6yqV1OmsO2s=;
        b=no/TvHlnkTeYum1V2xdqC6L3g1Ssj4ItHmAdAs/2UHU8zjVg518m3MP0iVE+OxvP9F
         qhAV7Jfpm8rLeLtqmQoAFvEd29LjeKG7JOGrSBJfN030dAfzm25rZnAl5K0mj16WZ2pn
         ykhQqAoDD8K9aMj3Lr5RtSmfHJZOOE1G/y+e5uBAueQMWgr4W4FEzoVixKxjMHwVS5mI
         xgip9iKJZRtkOgjb+wogDjEIoEw73WQ2189s99LWdhJiYPYtTWb7lxIwZtpqmA4VVX1m
         31Urg7nKcgh97zGaIlsLRN/4jPJLaxzyuYRzI9MfsTQkRZZnXT+9qSWkiKy8XeTEdWGH
         Q3yg==
X-Gm-Message-State: AOJu0YyXjuVRBvvHXot1X0NJ6PaQeN0CDeF3W3QetIEvh+RdoCoVL63T
	67fj3KANrwJQC/lbHztIiqR6ZdZUF1D2rHe0EG8uF3oqs7stYK6VyfaBVS2MceOuuhSNXWUcGh8
	=
X-Gm-Gg: ASbGncuwup7iqWkFjhwb3ptP3u11k6EZGfZWc68D5JOJtYBSk4F7aoGn2cHT8AcAU0E
	1Bsx+o/H8aLdxu8LApCU8DFHdRAaChdLWPbCRVrUXpjZeTI9UVcNM6ZxYBazaubIaAtDP+jy33w
	GLy0rA+mBnWb1FsoRflgAp2jxvKIQ3N2/qFLYR8QignBlus3llCQsuuu7+gqYddcZZmrgrymTYv
	+9Imy8PfoibLcusPhEHCvazIEtIOeLCYK/GRVex92Bl9qHdtdzTqQgAbUNvcQspsgQIDBJV+PRv
	0OHoBDffg6lTROdzZOTuS+SGuzudKUq6jXTzLC1bQh+jKfnjopW3xNWsHqUC9vLYfi9fBVS1e0S
	a5abM819pM1Y7nwPx44nTAKVzCSd9LCsE/+44UsSeFg==
X-Google-Smtp-Source: AGHT+IFNM+/aVwpNnZix2AaOhc8ZTeC4nexkneFN7uiQtkM/9+QW6ZoYqnTUOzndZ0VZRK/TUjRmwQ==
X-Received: by 2002:a05:6512:608b:b0:545:2cb6:af31 with SMTP id 2adb3069b0e04-54fc67b8e2emr1787962e87.15.1746815054930;
        Fri, 09 May 2025 11:24:14 -0700 (PDT)
Received: from ribalda.c.googlers.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6bc9sm349410e87.147.2025.05.09.11.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:24:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 09 May 2025 18:24:14 +0000
Subject: [PATCH 2/4] media: uvcvideo: Refactor uvc_queue_streamon
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-uvc-followup-v1-2-73bcde30d2b5@chromium.org>
References: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
In-Reply-To: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
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
2.49.0.1015.ga840276032-goog


