Return-Path: <linux-media+bounces-26725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBD5A4112F
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CFF4188B65D
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AE320DD72;
	Sun, 23 Feb 2025 18:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cK1JYMk0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39BB20D513
	for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 18:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337176; cv=none; b=Ja0wt1lF97ZREE3XuqJZiCwzF/1SaPA2oOSL1ku7+w47xxxf02N8Gpmtzjj9sN1gh74VieOjeOWw2YHcoj7fR37sLRJm53zQ+A7nCuq0f+pgePxo7P+Lq/V6EHP097gY94QFbxPqj2vGCZeD1y9i8K/ZS9hCSn16irVRlh5T19M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337176; c=relaxed/simple;
	bh=lWWjDY2I/8kPY7a6V4ZbdxW4J2FNahz8aBfrPuD04k4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FjZoFOSc1vjT4xZi2a2WRSR/P+zfB2Sh+Hx+UQj5CSqJpFVnF3VSvo0jpfRa6WEPzm4kqPBSzR4Qhsn1/udfEphh6gwxZVNaGnV/rGKuNP0uFBLUr5F/yeF/X4EdfRNmBOl31yCLWJpQ7j2DDKQqBVzMf8kHI/ZLoQSv1xXt7KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cK1JYMk0; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c07b65efeeso372201185a.2
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 10:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337174; x=1740941974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9BY7E7vHC4YHTi+FAvg+DDleZXfy5R/P4AUAZGGpCU=;
        b=cK1JYMk09PrJTEtONWSosnmUSUqqpTW3w+tbk+yuC+1yYsFMJWb5dzRieytzUuuwwN
         wa1YdS081INLyZyycrT021sjmFP6VhYgt3qbLg6XtQLYcui0iigtEqZH36KCvHU0dDRr
         xz8kZPcP7O2RXprL910DlSg7K9MN+VYUptPE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337174; x=1740941974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9BY7E7vHC4YHTi+FAvg+DDleZXfy5R/P4AUAZGGpCU=;
        b=E5X4xllFZu/H5hp19qKiDlgJa0XieIYDAW3pACmOyccAOBuJyH4J8BGZ0FcIjmo3Gs
         rrU/EnxKJ6Ih9sjGemlQtwsTawj/elLB8FYl5F+JBfYrOGhOrgTys6xTHectUKGfxdH3
         amOk2zsydKVxpXjlCbg1+F90CNjyY011bT/LC8bQYZGuK4+uPSm66hR/3ukU3DCl8Ptu
         HNCTe1kHe0BK40SVVcE0F1ZpfJnsH6R/YHYcabdTp7jS9SjGJrNavzdYmNgHmRc8oIN6
         YRY1ClPh+wAD0GksisM/atxmBH7lKYJ8sxp0bhUhgpm0CKVvUr6RsuNsRtfYgf3YAr7U
         QDsQ==
X-Gm-Message-State: AOJu0YxSC9bV4XrfYDgQQaEFtGq6IU4M2hIMfRqzOupdfxy68n9cYHbr
	xkGu/1aNI6dLgN3MqDv1KrvVUVqJoxicqF5F8EkEQx7opLlEBVUaA6rM88Rf2g==
X-Gm-Gg: ASbGncvr+2/qffw0neEFeuWCSdUpW7ePfyZ6jc5aUYpUwHj5YaV33oD/qp6DtiFAg7W
	QtmoLYeImgOnHQLLVY6Tt6QCGXUYB70A7sBFr9hgKIaRg9wVlbv95wtVpBcpTgt4mjhOGJ+cr5u
	lUuewt7zfx/wqFhvLC191wFlkQn2+Z8bgtCzddmVQuYFUSjMiKFpC4DYOcvEvwhuVZYGUMHSO5F
	gQyR7gKjsZ+shC2OfszbusA1f6Jilc5D/Uap+RsXmsrb/9CgDjUlkbvJPXTNAiQJP7UFa13ZnU5
	Ygwp9qVC3fxrH6M8BV9EbZIrWIYzj44W/TXugIMQBM+Zz7HFtoCvXbTSAxu4SBgmIbky8h0Lzuj
	Ua6g=
X-Google-Smtp-Source: AGHT+IG41KzlGhpkWHI86/yfKt+dY9ha4b9ql5LXo9JQXG1jbyYnUpn/M+Qt6Q5FogdDhwrNVGX+Bg==
X-Received: by 2002:a05:620a:44c6:b0:7c0:c2d7:5f2d with SMTP id af79cd13be357-7c0cef0e576mr1229924085a.28.1740337173910;
        Sun, 23 Feb 2025 10:59:33 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:32 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:09 +0000
Subject: [PATCH v3 06/12] media: atomisp: Remove vidioc_g/s callback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-6-4292911cab6b@chromium.org>
References: <20250223-queryctrl-v3-0-4292911cab6b@chromium.org>
In-Reply-To: <20250223-queryctrl-v3-0-4292911cab6b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The v4l2 ioctl framework can implement vidioc_g/s_ctrl with
vidioc_g/s_ext_ctrl() and we provide those.

These are the last references of vidioc_s/g_ctrl in the codebase. We can
attempt to remove them now.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 6b84bd8e6cf3..1fb2ba819de3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1565,8 +1565,6 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
 	.vidioc_g_input = atomisp_g_input,
 	.vidioc_s_input = atomisp_s_input,
 	.vidioc_query_ext_ctrl = atomisp_query_ext_ctrl,
-	.vidioc_s_ctrl = atomisp_s_ctrl,
-	.vidioc_g_ctrl = atomisp_g_ctrl,
 	.vidioc_s_ext_ctrls = atomisp_s_ext_ctrls,
 	.vidioc_g_ext_ctrls = atomisp_g_ext_ctrls,
 	.vidioc_enum_framesizes   = atomisp_enum_framesizes,

-- 
2.48.1.601.g30ceb7b040-goog


