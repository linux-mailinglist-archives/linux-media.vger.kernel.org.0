Return-Path: <linux-media+bounces-28215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 463BFA611A3
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 13:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D678A880DAE
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 12:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552EA1FF7D6;
	Fri, 14 Mar 2025 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HQLotulo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA9F1FF5FB
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 12:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741955987; cv=none; b=dFB8e28f6BHMSrJMzZgezCYZy1IjqcgbBfzPq3lX5bTOiwACDo0E0eOtRtCYRPdKOX3UkpRrLQYAnI4vO3zk0DqRlqP7UqRb9Irg08vdhzwesX38hSgNDqNmpucJ5wyaFJdlYGzqfCOvoaRCdcmeNGZG8QAtNVajyCWxjbPh50E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741955987; c=relaxed/simple;
	bh=dxUpB1tGOworbd0sAwMOcMt/CpptUDHtvAP/Ih3P+Ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s5ACz/Y7al8uxJTD6c0AXcGXugVhbawi29wAzw3fabBzYEmyDh5HSnMziEHxQW3pts2ltK/0mXXuc100ibrwmzbamFLU5FqC0jjfaKK+A3iiu+BSCmhadf9eMAd71VNDQ44JkNyb4iFDGwy3U/ngvmuPQQRIRKpi6l8Cy46A8pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HQLotulo; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e41e18137bso15145446d6.1
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 05:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741955985; x=1742560785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGpztL6BjNBivYA0NChHSF5JTshEi+LMCDwRcuw+8OI=;
        b=HQLotulovV5XaZGA6dT9CYr0Lli5JFWL8doUoEgwoJ0sM2Ne626h41NxlblccD4ep/
         I/eXn54cqbfV0ArpSPK49sWzvuiJuPjFLHI1fQhunB2fZAUdDgixbT4afKKDqZO8BZ8t
         n0dsXvlYtDJ/QrKHQh6WtFpMmn6Viga3dqwNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741955985; x=1742560785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGpztL6BjNBivYA0NChHSF5JTshEi+LMCDwRcuw+8OI=;
        b=rG1Xbs2Z1PpJbUbAVCAm9fgYebICKOhliw0Y+nu6+kFgUFH7V5nvEz+1/+qq7rxYv/
         3JVmANwrPf4Wd8UTjE1uxyZw4ZhvGtjkNqrcTX2tztE0OYUHeHwGA/gG2M4Qr+z2POK5
         v8Tc3ei5XK85/FnkY43cQeAGG3GFoRdXyPY1Bq416uF1CKsCUwcDon+/15nMBFIz90Oo
         cjU897QYodaU7bLGPbNhogrYchBnA4exH47oGhBvMtrD+WS5vhV51G92mxiD3cGAeUhF
         Ka6zpqp3Vd1BCkPZVLcWryJxBJSBgnDKoPZDS9IEtiHhyIbzTkulJKwv8dJpA9HvJXus
         7c7g==
X-Forwarded-Encrypted: i=1; AJvYcCU+iLDlD6Ereq+7JNad93IMV5M1RsTCZ1QKEiwwFXdAA9lCGV7bLHpX8v6DYpm9NmwWpCBsyGfH/nqr9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlpwc9zl9lADJcNghNNxOXrLJ50GK0BjAxfaemrLz8UJR7I2C+
	/QLmPGeHmDsWDKRs6rMNTu5+uH16Mv8C0EYQc9m19Ous1JXJxcXuk1gCEyBLmMgikXYXCkHSmy7
	dHw==
X-Gm-Gg: ASbGncs84b04SxeznmQ6kbK+2KF+/sEJEKBhKdnT2lsIWfBCk5+HSQSIDdhI2tljLhh
	g7rKt8F5iZmaM12Ge0nHwMAJvoU3W7u9gphQtQN2zhdY/bimqKW4ztOmtrEJfWl+4PAuSXmqUsb
	jVVpPrIEAvGkvUozyhsBXUb1UWzcW3q3g6kZL7uHdUvu+Z3AobVkS2hUocrEkakxCNS/r0VWapi
	blNgrz7GFZ0AJlWs+Js72hpYFoWyJdiSHwth3X0fHS0U2pzInxKZDqKe6TiCmlYwfYFYpy0dRO1
	NHLiacSTB4OWF8Ks7AVRo4AlbEHlZ61EfMNQtI/44cDtCEjuF2HGjkWD6dfZSbPjzVyi2SX00nX
	qLrxdWHFz/CQ0U35Ps+Z84g==
X-Google-Smtp-Source: AGHT+IHtgUymcNvTlk8gc+ET81zehXYtGld8Q10RH9uzFtc/wuhFJJlTZSaH1eoYEa2rNaGXyrS9Ww==
X-Received: by 2002:a05:6214:260c:b0:6e6:2395:7634 with SMTP id 6a1803df08f44-6eaeaab0fd0mr28848156d6.27.1741955984973;
        Fri, 14 Mar 2025 05:39:44 -0700 (PDT)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade24b8c2sm23031586d6.50.2025.03.14.05.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 05:39:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 14 Mar 2025 12:39:41 +0000
Subject: [PATCH v2 2/2] media: vivid: Add more webcam resolutions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-vivid-fix-twice-v2-2-dcfca4053704@chromium.org>
References: <20250314-vivid-fix-twice-v2-0-dcfca4053704@chromium.org>
In-Reply-To: <20250314-vivid-fix-twice-v2-0-dcfca4053704@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hidenori Kobayashi <hidenorik@chromium.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Add 3 more common resolution for webcams. This is required to increase
the test coverage of unit tests based on vivid.

Co-developed-by: Hidenori Kobayashi <hidenorik@chromium.org>
Signed-off-by: Hidenori Kobayashi <hidenorik@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index 623ba1e5e54791c0ac62aa2f0fcc3dcd444c873a..df726961222be874c39d19e1fb457bd816ab45fd 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -25,9 +25,12 @@
 /* Sizes must be in increasing order */
 static const struct v4l2_frmsize_discrete webcam_sizes[] = {
 	{  320, 180 },
+	{  320, 240 },
 	{  640, 360 },
 	{  640, 480 },
 	{ 1280, 720 },
+	{ 1280, 960 },
+	{ 1600, 1200 },
 	{ 1920, 1080 },
 	{ 3840, 2160 },
 };

-- 
2.49.0.rc1.451.g8f38331e32-goog


