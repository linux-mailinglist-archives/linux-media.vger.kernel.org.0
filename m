Return-Path: <linux-media+bounces-23733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B52B49F6FA4
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 22:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4A2C1883E5B
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 21:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0358F1FF1C8;
	Wed, 18 Dec 2024 21:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cvya7/Xl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74021FD7A2
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 21:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734557975; cv=none; b=SVrVJth/Ms76CqdiB/J9iW3sSNFlj+1EMzIU1yx4GdE5fUOgswR14CFxO9BggtDlCFg5wCwavrFRSY2e8rEIRAB2JvwU4oLZ//gix6WxI3AW2jTsRrx7BaByr15SBzic4T4Mboum6I5oCMYl6TUJR6efdlfaB6GDxCdcebUPWyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734557975; c=relaxed/simple;
	bh=pXhSac2AzuqQbkJM9ihbaOkti5PzZszZwkRhNKmkfJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fkBSIy+kcmcHTwHYH3X6Gwku7LLAKH06yyNEPDz/TEmhZfxyj4HYP4H3pTg/KSpkHYSQxLxxMV/orZOL6YONF45vpwEMQS8yxuXm2SCRxZg6gTJ3khgJWD1dwnNFAtL+yhNQLg0MbTPSeKHC9LBwvcA3GC/5p1KTePIrsZstPGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cvya7/Xl; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-46741855f9bso521241cf.2
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 13:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734557972; x=1735162772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfZU82nxRgI9tSG07OHwYJOWywb24ZmTcs3vC8hLPzc=;
        b=cvya7/XldWw0nIYQfxM6UFMIl2tNFOAFlSPDFBSqRJiEtjEh8W0cTHfqsOvbJZsXAz
         KZ6eZFnOha2TOOQgQ2GApZxE7IKqgCBt7DLLChE9fnLCUHK2gNWrANIFQ8bnjatk1E4F
         IUPcAtFNu6DTw1EBUGLG5E259Yu/9WZOYuu6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734557972; x=1735162772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfZU82nxRgI9tSG07OHwYJOWywb24ZmTcs3vC8hLPzc=;
        b=JVMLarYvfUOEhp2WHdS6VR3fFTjMc/VhBe9LpYj+0TrD1oEJMPdenwWpvY07PF+1Fe
         8u1H4lkBQAQ4GgTuUPUBDE6DZVr9pIJiKMN/ienvE19hefgq7cLOqEFgGzZK9kOBYqeZ
         NIOqHrX7Cu4E26bTACleV/1Rs+AhdEVvqmT8gNsTUdGjO9JEPBnkoWdpxgXmkr9PIkGb
         p5qO0HfwqDG1KXjdQMhEKLytUp4J4C6W98rPOZ/JluDWWZPtJF7wSdpXyuLk1bLT3cuV
         VN/x2pynTXWmzWhozqJdgZa1IyusnrZLyhEVrB9GSnIlQS8OuiYmidJAFMOpk13AHGOE
         xsFQ==
X-Gm-Message-State: AOJu0YwT+AahsD7XlOwEtAVpZgJPrDk1Is3385iszCm60GroMaJMhaa0
	8MqpNN7mI8HN0EDHNdPIfTjNXl0FU6atsuHihChs5qZPFipFo4yzPj/nlBiPPLdrusV4tA0Xnl4
	=
X-Gm-Gg: ASbGncu04huWXAu6eCHKmodXb6kjCsdKWIKktVU/urrpoOShax5zA14EbxQ1ClcN6xt
	JPOdXaPgOAz9WrqfESlnIn7jSNlXOfohWknMnOuo2aO1JcZnw4jIpLTSF86vevy+VeWoUwKrlrU
	vM3JsRiL6duPgT7KsVJIrnWR3rzf6gYXU9yrCUur1uwGmHh0yb+No1GmbBPiHvoFZ1J6D+6F9O3
	mBzy4aH1Pvv1xXcRN3W2I/sTGmbM4E1z2nLzJgsY2OLZFfg04nnx1fSeTrsn7f4QllLa+I7200/
	0+KpeRjA2IgmFAztvJzzj4MCKFubFp8=
X-Google-Smtp-Source: AGHT+IH5B8CT5caGaubN47m+0nYzaaz42CsMyo9uKk36qPmU+8yT3pOqMjCCVmoaCdVWIT3yoeoM3A==
X-Received: by 2002:a05:622a:18a7:b0:467:681a:69f4 with SMTP id d75a77b69052e-46908e7fe14mr84435261cf.39.1734557972590;
        Wed, 18 Dec 2024 13:39:32 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2c6e312sm55176651cf.8.2024.12.18.13.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 13:39:31 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Dec 2024 21:39:11 +0000
Subject: [PATCH v2 4/4] media: uvcvideo: Announce the user our deprecation
 intentions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-uvc-deprecate-v2-4-ab814139e983@chromium.org>
References: <20241218-uvc-deprecate-v2-0-ab814139e983@chromium.org>
In-Reply-To: <20241218-uvc-deprecate-v2-0-ab814139e983@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

If the user sets the nodrop parameter, print a deprecation warning once.
Hopefully they will come to the mailing list if it is an ABI change.

Now that we have a callback, take this chance to parse the parameter as
a boolean. We still say to userspace that it is a uint to avoid ABI
changes.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 10812a841587..d8e8675dd2cd 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2424,8 +2424,25 @@ module_param_call(clock, uvc_clock_param_set, uvc_clock_param_get,
 MODULE_PARM_DESC(clock, "Video buffers timestamp clock");
 module_param_named(hwtimestamps, uvc_hw_timestamps_param, uint, 0644);
 MODULE_PARM_DESC(hwtimestamps, "Use hardware timestamps");
-module_param_named(nodrop, uvc_no_drop_param, uint, 0644);
+
+static int param_set_nodrop(const char *val, const struct kernel_param *kp)
+{
+	pr_warn_once("uvcvideo: "
+		     DEPRECATED
+		     "nodrop parameter will be eventually removed.\n");
+	return param_set_bool(val, kp);
+}
+
+static const struct kernel_param_ops param_ops_nodrop = {
+	.set = param_set_nodrop,
+	.get = param_get_uint,
+};
+
+param_check_uint(nodrop, &uvc_no_drop_param);
+module_param_cb(nodrop, &param_ops_nodrop, &uvc_no_drop_param, 0644);
+__MODULE_PARM_TYPE(nodrop, "uint");
 MODULE_PARM_DESC(nodrop, "Don't drop incomplete frames");
+
 module_param_named(quirks, uvc_quirks_param, uint, 0644);
 MODULE_PARM_DESC(quirks, "Forced device quirks");
 module_param_named(trace, uvc_dbg_param, uint, 0644);

-- 
2.47.1.613.gc27f4b7a9f-goog


