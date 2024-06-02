Return-Path: <linux-media+bounces-12386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 331698D7401
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 08:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6FEB1F21323
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 06:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8121C23767;
	Sun,  2 Jun 2024 06:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b="v2yvh1f2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B25522F03
	for <linux-media@vger.kernel.org>; Sun,  2 Jun 2024 06:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717311095; cv=none; b=ikLe0u1icr7HYlvUYKd4X8Gw25mIHpJcd+vehCLsbn51Y/FeQdyMxsIDiTS+pX9oe5Rncxt3KeeghYqmCgZ85umBHL+dg21aS9jUsfP4xLCNjReP2nb0pXyyRITdQJs/Ny112u/XYSklgU+dkrKlepiCJQp3ySOxYtSvEcqY0gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717311095; c=relaxed/simple;
	bh=gSjMoKbtzCffDVhjfe9ytkmiYDkVYHzr8dXdT1TdldA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lX2v4dTMAPEaQkitEue9FqpGdflKs2MtiEwnoIZcQ7T0pBwDab4O5meiRdFKiDK6z4nwHhCnh8kyb9S13ZBYltWvI7BAUHIxT3ICQjwtnsQSqQ8rW1KjZWANb8poq32gMKjJ6pMvccEcOFQLiBAVAD6bEKE09vu2RZAYN4IejCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work; spf=pass smtp.mailfrom=frame.work; dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b=v2yvh1f2; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frame.work
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f47f07acd3so29351015ad.0
        for <linux-media@vger.kernel.org>; Sat, 01 Jun 2024 23:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frame.work; s=google; t=1717311093; x=1717915893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yOhL7ZQUqFZFtWXgaxpj099OG9lqzO/G2dfPeO1Tn6M=;
        b=v2yvh1f2nbUzB+Bm96OZuFeAmiF4LEH9miMkC5PyfPp/pGH8CtAVLK9+gd4Iu4iChP
         B6HRChhE7qMysPXf4juvpHDKIQh+/mpm9dX3CfSHZCJ3pDRxguCClUwNejbPBhucaT+q
         suqYpD3Cs7NKIGLX7694TVf7lf/2LkkCr6WkQZAbxyq/0QV0xSwuXnto9mHXCdRaUG6v
         3v4jchCKxmaLqTnafOt30VOR5LJ6RpTy7Zv8n4BD+Wn9Gp2pM8jJ9hLyjzTbDJYOD2oG
         uxtlqTV576eDy2vmBUXrRb0biix5d3LdSH8eUHcQBlQD8q3NMHfK0hkhEChJU0Hulh3T
         9CKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717311093; x=1717915893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOhL7ZQUqFZFtWXgaxpj099OG9lqzO/G2dfPeO1Tn6M=;
        b=iU8FFkdzuQ3GXHLhLf8lgQGHKwl5zAz1ePYyD9GJpn2o0hH4A9PFKsEd/hneUGOYAX
         KIFExIoTvJxde98mEKUWbA6r7p7rxng8ecYQz8g7dPmfd2n8WTv4/fhGMHqf2pn/pjro
         Yqyg/Po0qrLT8EiUWbNi0iSKWpX1NEqV6yushf/AG4qa87a25IQnKSIVcLdM6ZhlT0oB
         wXOZovpBkC6q1nhAGX1nxNDnwbZ0I2vdPrRNGinCo5ux7HMbSQDLCoZt4bQrealuvfS/
         haHXdIetPVGZ7+0eMdQvbCQTNkot7sniRFfkckrkf6kQn+uidLm7mSDX+gPUoGwH/z9z
         qILA==
X-Gm-Message-State: AOJu0YyzFQcsVhwB3Wjnx2T7xQp5AxEPa3sOAguX+H/3Vqxg7gUFCumq
	Q2m9XEpSlpshrSSY0rAg1BwYBVu0LQz2mDifq4wOEmkC1cUm2hck6lIR3PKgT+hsYyfCt5zxZ3T
	d
X-Google-Smtp-Source: AGHT+IHiw6jVlIYLb+LtpF8+U8Y73q7WXtXlxR8gMpQFiknLfVbz3pIQ8I4cawbuxf6Krr2BA0Bsxw==
X-Received: by 2002:a17:902:e746:b0:1f4:8bcb:8b01 with SMTP id d9443c01a7336-1f63708f15amr77253135ad.40.1717311093061;
        Sat, 01 Jun 2024 23:51:33 -0700 (PDT)
Received: from marigold-dvt1-sku2.home (118-167-0-106.dynamic-ip.hinet.net. [118.167.0.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63232dd91sm43584025ad.23.2024.06.01.23.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 23:51:32 -0700 (PDT)
From: Daniel Schaefer <dhs@frame.work>
To: linux-media@vger.kernel.org
Cc: Daniel Schaefer <dhs@frame.work>,
	Edgar Thier <info@edgarthier.net>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Levin <ktl@frame.work>
Subject: [PATCH] media: uvcvideo: Override default flags
Date: Sun,  2 Jun 2024 14:50:53 +0800
Message-ID: <20240602065053.36850-1-dhs@frame.work>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the UVC device has a control that is readonly it doesn't set the
SET_CUR flag. For example the privacy control has SET_CUR flag set in
the defaults in the `uvc_ctrls` variable. Even if the device does not
have it set, it's not cleared by uvc_ctrl_get_flags.

Originally written with assignment in commit 859086ae3636 ("media:
uvcvideo: Apply flags from device to actual properties"). But changed to
|= in commit 0dc68cabdb62 ("media: uvcvideo: Prevent setting unavailable
flags"). It would not clear the default flags.

With this patch applied the correct flags are reported to user space.
Tested with:

```
> v4l2-ctl --list-ctrls | grep privacy
privacy 0x009a0910 (bool)   : default=0 value=0 flags=read-only
```

Cc: Edgar Thier <info@edgarthier.net>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Levin <ktl@frame.work>
Signed-off-by: Daniel Schaefer <dhs@frame.work>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4b685f883e4d..f50542e26542 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2031,15 +2031,23 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
 	else
 		ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id,
 				     dev->intfnum, info->selector, data, 1);
-	if (!ret)
-		info->flags |= (data[0] & UVC_CONTROL_CAP_GET ?
-				UVC_CTRL_FLAG_GET_CUR : 0)
-			    |  (data[0] & UVC_CONTROL_CAP_SET ?
-				UVC_CTRL_FLAG_SET_CUR : 0)
-			    |  (data[0] & UVC_CONTROL_CAP_AUTOUPDATE ?
-				UVC_CTRL_FLAG_AUTO_UPDATE : 0)
-			    |  (data[0] & UVC_CONTROL_CAP_ASYNCHRONOUS ?
-				UVC_CTRL_FLAG_ASYNCHRONOUS : 0);
+	if (!ret) {
+		info->flags = (data[0] & UVC_CONTROL_CAP_GET)
+			? (info->flags | UVC_CTRL_FLAG_GET_CUR)
+			: (info->flags & ~UVC_CTRL_FLAG_GET_CUR);
+
+		info->flags = (data[0] & UVC_CONTROL_CAP_SET)
+			? (info->flags | UVC_CTRL_FLAG_SET_CUR)
+			: (info->flags & ~UVC_CTRL_FLAG_SET_CUR);
+
+		info->flags = (data[0] & UVC_CONTROL_CAP_AUTOUPDATE)
+			? (info->flags | UVC_CTRL_FLAG_AUTO_UPDATE)
+			: (info->flags & ~UVC_CTRL_FLAG_AUTO_UPDATE);
+
+		info->flags = (data[0] & UVC_CONTROL_CAP_ASYNCHRONOUS)
+			? (info->flags | UVC_CTRL_FLAG_ASYNCHRONOUS)
+			: (info->flags & ~UVC_CTRL_FLAG_ASYNCHRONOUS);
+	}
 
 	kfree(data);
 	return ret;
-- 
2.43.0


