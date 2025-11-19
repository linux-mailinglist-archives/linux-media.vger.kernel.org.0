Return-Path: <linux-media+bounces-47402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2D6C70D76
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 20:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 380B62B27A
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 19:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDFF3730DF;
	Wed, 19 Nov 2025 19:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YIiyXZGl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BD3369226
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 19:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581041; cv=none; b=LGsBVNKAYVnMPHrKy05sYoGByvKpmAV3fPSnz9/MUrcF95a1cuaS0YJAGekVmr9vF/RsYERcq6nnwp9DwXB9WT15Gi9XVGBxECu/brGYMDP0wCsGuN947fbyoZyDLPen4xran2M43NGty+jaUn+mJ9xSXUvpoWG/hIGUpJTWj0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581041; c=relaxed/simple;
	bh=yTYFXdI2ZyPR+UMxYGq17qZXJ4j99OhzHGQZUgONSkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uAcHtDhAwrF19Vr1DQtabWvZvRCubGGyP03r/SSijL/TdiJPsTdzA7hGgVFSxX0cgBpe6oF9g4B8Fa/YO79TheE4nE13zyzdCXlDk7wxi/cdOdBnjKMOq86xNfniv/sAVKP9rygPnsC3DdHcnYfKri2rJq8AIyF3C6qvNLiYTqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YIiyXZGl; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37a4e329a90so623301fa.0
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 11:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763581035; x=1764185835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuZc8jIJ73fliBU4Q8ei1XsWAfFxT58BcOIlqwL+4cM=;
        b=YIiyXZGlDfSO6Yko+dDvg77jCvf8SsHWYwGOaRfw0ik3CrugAeEJpMoeickmOKDbcp
         OspWDFd0XkNlGot9+NO4lvW4kocgYlfmkOUbLqxlEjJhKZkQadJY561pJwdZYl/glYfp
         LiCkKyGCOZ+k9CtP3t+FMvfmBid/W9Uj8FjyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763581035; x=1764185835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZuZc8jIJ73fliBU4Q8ei1XsWAfFxT58BcOIlqwL+4cM=;
        b=fA6ePM8uM+nL/cDIPJ6ac+kIClG6tjgyu6112Ghd9q78/w3umK2CEgROp6mom25cKJ
         mRQOIu9DfV7UhRg7FlEXrZYLEoHjGfjxA7K2o/M+Iglogkz9jK0lDD6zt5mACymNO2HH
         /z5lPhORD370YfChuFKJ1jDtnZHxYu88aEGWbPqVFrcLp6lPr5rG9XurMhUsfggOeboU
         i3jIyaakKbJe2fgm5TDNAtJlPREPXC+uzvfpSHE5b/63Fs5MqZsXGRbHbCWIiiSJQHs7
         EcOXGMduZaZok1zPdflFbFQs9iSN4v9cgm5vLxo135WM/ZWNSgkbMkolZsTgi2bXqAGg
         OYDA==
X-Gm-Message-State: AOJu0YySlieFJbSd+AWpiUfAa6+9f3FaAx+DtbAttGYkqOKjvtxaoSbW
	rCWgAwdZCzMyWF9vwuX8JvHU0xrcJf/Mrwrg+hqm8ZQZJ+w5xakqGV+jCsfDB4mzSA==
X-Gm-Gg: ASbGncvakjw9T7Y6tEeae/nwo1Fw57Wt7zWOZ+/mU2k6tjwbPEWMqxuPUk90VS4m59T
	+yU3GK1qFBp7rpuvdD2TG69z8gn6j+CPUifwhAvuMpjSiYqO8dW8ToTpF8VXwEdNuVG2LxB9qrk
	wj0+XWw3/FZzRPU7xdLjNYFZyoFJOlUnW+HMzfgvmyt7fG3CuBCHHlsXdMMdEWQTqO6PGR97nTq
	oWi2ydHlSeeBCn5pIXReY6IlbwxTf5+Yc6qHSnpATk9vMK52LhH1UQenxphTO/RKt34i7+3nIid
	XxW4DRMdqEE6eLiohYja4eTbjjGHmQub0S8DePQv9aY5N5aDTR8orKHDOUFR9SDkTdCsMaQm1y/
	qIJICosLJMdNGyrCBg674VRfeWqnYYBVOXVyfjeVByM6w3mjw5ZNmzVa2wzofx2orEPpKW3ZqGQ
	hYvK//9i3jRAxIg0FewQE0uSBf/vqgzTUXJN0PTfYf1ExQed7MPg16kAo8VuQPQE97yaYPCAAQ
X-Google-Smtp-Source: AGHT+IFoB7chSLIwfjSFTphqjgmua7Tjt0U+ohKJOcu/D64VE8zTccK69k87nmH3ArQfjCz5alhfSQ==
X-Received: by 2002:a05:6512:3b9c:b0:592:f9dd:8f28 with SMTP id 2adb3069b0e04-5969e305a42mr18282e87.35.1763581035322;
        Wed, 19 Nov 2025 11:37:15 -0800 (PST)
Received: from ribalda.c.googlers.com (80.38.88.34.bc.googleusercontent.com. [34.88.38.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbd15a1sm65790e87.98.2025.11.19.11.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:37:14 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 19 Nov 2025 19:37:13 +0000
Subject: [PATCH v2 4/6] media: uvcvideo: Document how to format GUIDs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-uvcdynctrl-v2-4-0359ffb98c9e@chromium.org>
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
In-Reply-To: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Manual formatting the GUIDs can lead to errors, document a
programmatically way to format the GUIDs from lsusb into something tha
the driver can use.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/linux/usb/uvc.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index b939a01da11466747249c64c72a3ea40cd364a59..dea23aabbad48270c807463c1a7e1c0d1b79fc1f 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -10,6 +10,14 @@
 
 /* ------------------------------------------------------------------------
  * GUIDs
+ *
+ * The GUID returned by lsusb can be converted to this format with the
+ * following python snippet:
+ *
+ * import uuid
+ * id = "{01234567-89ab-cdef-0123-456789abcdef}"
+ * le = uuid.UUID(id).bytes_le
+ * print("{" + ", ".join([f"0x{b:02x}" for b in le]) + "}")
  */
 #define UVC_GUID_UVC_CAMERA \
 	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \

-- 
2.52.0.rc1.455.g30608eb744-goog


