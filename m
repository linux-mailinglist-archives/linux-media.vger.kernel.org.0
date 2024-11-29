Return-Path: <linux-media+bounces-22371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 041559DECF1
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 22:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C352281C43
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 21:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9450A1AA1C6;
	Fri, 29 Nov 2024 21:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e/8AYeGv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B171A08AB
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 21:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732915836; cv=none; b=S6kgNasyN5Wg3mPuebCwJg7JjV/BsU6h7TCVSiiIUc889V/L1OHDg2fq6BlaiXuz85gz00daj2ZT21olcZNl3wyQoInJtPfNIvqsNC+B0NaDK77OekCxJMgCZo2VrzlLBuzZRCbFi7bjUkbCHZuCpJrmSdDRWsHJ9kW97DwUMjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732915836; c=relaxed/simple;
	bh=hem3w0cqOpuUXnWOHaCYg59eIwff39vWTS7lxdWqD60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dMz3ydbna10nAYAJOPNf/KP09gh1S8XbFNN+eObGXVo+ImUX5U9oMtsS+GpAyEJ64gWB7nQ4XYU+7E7ffXMoY0R3s1/RDESBZxqKGcbP27v/3jLXCTQ13TJhSeGPplUnMpRvKn8Nz0wEzMuwV5fnPxX693CBqcH4P6BGnei9p4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e/8AYeGv; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-515526c43cbso529773e0c.2
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 13:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732915833; x=1733520633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2rn5S7/m2AnqfUGp/AXrxEjHYa6ExomvekQA1z9JF8=;
        b=e/8AYeGvFl0mTTpkqIdVoIQlg7ntOEz9BgkVB+GNsqQQnOiS1b0UddHAUVy32Gb/3k
         Cxo7l7cHzHcv6+bm0aOE559bbAd5Xew5Rupki6+dM/QHnxU2kRBFLWpPLxBM6fuDjCnk
         j+3rkyfyyvR4GUpL/fXb5fFXq0bqsjzGO4RcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732915833; x=1733520633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2rn5S7/m2AnqfUGp/AXrxEjHYa6ExomvekQA1z9JF8=;
        b=OykHsVWD1DIidlOYEuHqVgIxa5ihMTQ0FEQo4I2CiGccStSMfdVwpLLltP8rXhQPaw
         7Aoiwe+Dhgro38LGBIGGLnHmgWSHM3SH/vX49W3K1ahPTH77baGW8lj253c86ezMPoRN
         G58ZSGusJHnDyQUWHxOYTRY0jvcnBkI6jt9JpB6rQBkJIdKqM9pZrB+wYCUw0VruTvBl
         tUcWLaISsgBTNZRq9+wVZ4l8XqLA3bQYGWbmcXtAQy2YaqkliJZeoKBLuSw9MqPzNiSp
         wqzUNassXawbqGLZ01zjK6ClVvzNLYCAN+L662yYHXXu5wP+99k7FFPfq9DYWRlLi4I/
         cZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWJRHo7VkTm06rkqAi+Yv26lbX+WU2/fSdY6nbGHbCNzUanuNL7yzdxW9b6MMlNMw9qiU/yfALGfteTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSSiW5xgiVlNHzwzRb+c1mEoGyM7zza2Ov820hzNcQ/gGg71w+
	X5P5DqrNESSD4KWS9jC8azm82yOtL0Zj6qFvANY+QOmr7DMVESu5mFnMBr8LUg==
X-Gm-Gg: ASbGnctwmD9wRt77zOqKxQtaBd9P9MVctviFlbDcpPzhBudUWTsITzYyTFMWl6IbmhP
	hO5UCQrqXkP+rM/bRLgeOg+OHWFdlNSZNCjr+h1v3XfgHzXcJa5ZGMHi+Enw9JwMtYf701NX/tI
	2Lqt2/ung7IcZz+66y/gSYxnTQSUNKY6Xv+hl/w0er/lqCUJJWCT7koHUULymIxjUPE88o0eM7h
	vVhmsB8NcPcHYg9nFX00NSKl1q21UqhPdl8/vZUaPy4rGv3Xbz4TwQcLK8R30GfvXq+KneIhOpD
	CDiccLuodLCehHRN/iuZhckM
X-Google-Smtp-Source: AGHT+IEcGD+/QiSnHqDspBxFeqf8V4eyWtSEYu06OHOVvuFJxL4mfm7VoAcu1T8tpb9Ahblgt2JqVw==
X-Received: by 2002:a05:6122:6089:b0:515:4b68:c37f with SMTP id 71dfb90a1353d-51556926b00mr18430743e0c.6.1732915833363;
        Fri, 29 Nov 2024 13:30:33 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0c1b7asm607254e0c.36.2024.11.29.13.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 13:30:31 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 21:30:17 +0000
Subject: [PATCH v4 3/4] media: uvcvideo: Annotate lock requirements for
 uvc_ctrl_set
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-uvc-fix-async-v4-3-f23784dba80f@chromium.org>
References: <20241129-uvc-fix-async-v4-0-f23784dba80f@chromium.org>
In-Reply-To: <20241129-uvc-fix-async-v4-0-f23784dba80f@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Make it explicit that the function is always called with ctrl_mutex
being held.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index bc96fb475b9c..e02540162dd4 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1968,6 +1968,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	s32 max;
 	int ret;
 
+	lockdep_assert_held(&chain->ctrl_mutex);
+
 	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
 		return -EACCES;
 

-- 
2.47.0.338.g60cca15819-goog


