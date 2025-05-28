Return-Path: <linux-media+bounces-33547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C991AAC7076
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 19:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F6354E5769
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 17:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC53D28ECD5;
	Wed, 28 May 2025 17:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ych1TWEw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395BF28E5FF
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455100; cv=none; b=jj2pOs8Tnfu40IciH87s2RwyM5iPUjS4K3XSTsJ1P2SuZIaU/E0IgNhNoBlUChitpgBCa+aXfpqnwqbtTnE5XsvWDgHqEI/fzTG2OB/HXDF8GB9mp8rCpg/nadBzr2X3rU8PPTUTCXTSz7wBLw9X6us9WGBYsb1kGPhy2nnu4qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455100; c=relaxed/simple;
	bh=UEBuYkRXWdWQnJ0xRRALcILURlb3/sc/+uI8fqdHllI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lrvomhq1w6dOvoSbpK8byp/LhrmuPVC8O3G81phmLrCNQ9GZ4RGIfP7Uq7GgmabI6rwpP6nHpCWdLeRtkP39hpeQeDze/HtZ/y3E1iFPrW8AhsDOYrUngku+ln/lI2EU0wgYBK+URqDKyXU7i+rvesZ3gI0eYDzg3QcrIBzQdUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ych1TWEw; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553246e975fso25086e87.0
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 10:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748455096; x=1749059896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqqzc4JWCwHMyJVbZCLvTBytETKRAUUhg+vp/MQs9Og=;
        b=Ych1TWEwiLuwVrBaMS/kWZWEgAvBDX7MI5Ofe0wGT7Ffrvxyl7GGO9XSFQI6C1gHWU
         Q4DboNV94Tw9qoEfgbHQXN+/jULJ4OGEbo6fl8adoEU5DtWRbJIxV3u569c1JhG7Y7v/
         nzbKh+IZ/ZHTmhfSgUOqN5iAei1lH+BUyeiCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455096; x=1749059896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqqzc4JWCwHMyJVbZCLvTBytETKRAUUhg+vp/MQs9Og=;
        b=pcRLm0WOoyaHOYrzKvIqGpw2A2L44E6iJHNeRgc6lvTTKRmYnRFDE03Rg8SfFw/PUD
         rSpOzQls/5eEQ2mIF/WaeRxOqTqmrHJSqGTW0/rzeOrbXRdKIm3nPJxhrgmLR6WsdGZM
         nY/um3OnG0UvA7XXcExhnI5WG71ygcVpHrKMcrWgw/bloQPIY6Mtn28HcgOwtjoVxQUy
         03ekbvKd9IGKVbG2tFkR6bdmlvSbabGvm3yPMVsYn39fkla7Juz7JnnAQv+AAdg0JMwz
         ABSzygKUUBkBnfZUlm2+5ssIHnUv/4/v+aJJxa4Wl+T6CPkdOFkkY9qhJa1kZ00YOY5u
         9Exg==
X-Gm-Message-State: AOJu0Yy/wVJHXKxndueXq4kE0vLfSkfVoT4VZLpqizxDlkJZJOiEy3/t
	M8pmMibFaqcbqRm7Nv7Ipo3jsUc+KFycX2IUsdn3LZC0+EOTTUpYjd+gi7R38Q67PjxaeNJhwPG
	xLkSr3A==
X-Gm-Gg: ASbGncuMPIZ7cSHb9h/kG+QzMvUaR/+xNbRfD7wiTuOJfMhdY8GnFyXYdY8YohGxUSr
	rdmzG+YnCmgrT6dXpcnKLK8q0GU1407dT10ohzDUKCsEvQGPKYGyLsQdfP5Fg1ymEhH9pi1fNuU
	hSznxStHTQeLX22DOq9TPWejBMdL0usWewMGAvAnkzKPq1CAdEhny8QG27BhJ7SSVxv3dlWEqD3
	hJxT8E+7BFVku83X0uog6+Ab+uJbKgSfLUMzydYKE1fSW44b4CSRxtlIfcAFqhEF5bFf9gkmmDL
	9cDDZUmK6uORGaeOpyer8MPL6UXR/9S61uDe/UpQ9HUBr83/bDtcwUhiaBElInP4lrMwHspRHTF
	MoEDaW0l9r7N2hjkOwpiRjlcNjA==
X-Google-Smtp-Source: AGHT+IHJoSbZmVCM0+OaR+drNPKZH3L2vkLptaYk24BZYjh1TfGUyjz9xyXLOq0xMcSeyU9sLHySbQ==
X-Received: by 2002:a05:6512:2c0a:b0:553:2bdc:e36a with SMTP id 2adb3069b0e04-5532bdce59dmr2042225e87.34.1748455096305;
        Wed, 28 May 2025 10:58:16 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a6eesm376805e87.98.2025.05.28.10.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:58:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 17:58:01 +0000
Subject: [PATCH 6/9] media: uvcvideo: Do not enable camera during
 UVCIOC_CTRL_MAP32
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-uvc-grannular-invert-v1-6-d01581f9cc25@chromium.org>
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
In-Reply-To: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The device does not need to be enabled to do this, it is merely an
internal data operation.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 65c708b3fb1066bf2e8f12ab7cdf119452ad40f9..2c6f3cf6bcc3f116bbdb3383d9af7d5be9832537 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1224,10 +1224,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 	void __user *up = compat_ptr(arg);
 	long ret;
 
-	ret = uvc_pm_get(handle->stream->dev);
-	if (ret)
-		return ret;
-
 	switch (cmd) {
 	case UVCIOC_CTRL_MAP32:
 		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
@@ -1245,7 +1241,13 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 		ret = uvc_v4l2_get_xu_query(&karg.xqry, up);
 		if (ret)
 			break;
+
+		ret = uvc_pm_get(handle->stream->dev);
+		if (ret)
+			return ret;
 		ret = uvc_xu_ctrl_query(handle->chain, &karg.xqry);
+		uvc_pm_put(handle->stream->dev);
+
 		if (ret)
 			break;
 		ret = uvc_v4l2_put_xu_query(&karg.xqry, up);
@@ -1258,8 +1260,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 		break;
 	}
 
-	uvc_pm_put(handle->stream->dev);
-
 	return ret;
 }
 #endif

-- 
2.49.0.1266.g31b7d2e469-goog


