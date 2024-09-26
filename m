Return-Path: <linux-media+bounces-18595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F9C986C20
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 07:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 114F41F22460
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 05:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBEF186E37;
	Thu, 26 Sep 2024 05:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OZnvO57H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D24E1714AA
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 05:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727329815; cv=none; b=M96aHok0PLvu+yq4qslGC78yuRLeRbt7ppKhAAff1CNcsS5Poq4zEtFOe7v28pPINCUfHOcMLMRsGNPX+7v7fOLr3HKqT5LBcpauuPfRRdw2n5hhzjdRweN/DYjofpaXIeo9AhydyxGbpuy7BISPfiW41yDEKCZIUTesqhb3/x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727329815; c=relaxed/simple;
	bh=Bfu7bqhrmzOz9Ey2Adj2zHRWUZVXSf36bOoXdS7G1BU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nkK46GnZKdsuj1/jnuH+O9yPm/K02KejZIRAavgAasa1YyjjKltCFpZmvqEMEVSYkbEm3ddnnrjIGV8hHWKVWOHdfSGRtdXjJjMGjxnDhx+47M2y6Yf8NQU1XDqm50i/E7DmUdllZS8N1yFLThOy0jozfUvnYihIn3dLlv+KqOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OZnvO57H; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-458320b30e7so3688701cf.0
        for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 22:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727329812; x=1727934612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYIvqRnC2mqEpaPGnRTLTAO+wgXxtOMY+ADw+uJOyw8=;
        b=OZnvO57HA6FDm+Fwkd89McBAPowcvbSdIEMk86MotSNhQdIZKwax19WLh2XjaYyo13
         GYDsQdPe0zTvzZMTqsmW5+XbTak08dmOz+4weyzXnlSx5BY/b2YJoJN5Fb4XnZMdXDRN
         aWp+0lH1iYfZbJ5FYq+Zv+IQPEw51faDnwK7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727329812; x=1727934612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYIvqRnC2mqEpaPGnRTLTAO+wgXxtOMY+ADw+uJOyw8=;
        b=tLhK8abw7Z6VnKCILW4YAjnGGASS4LLXl+ZVeKswtjIhFKkRGi5mLHqliD//IhHEdI
         LvMx8HhokSaB0uuQIJPnlnBPi6WAEsXI1i0WSzhI17J93VirEgQnA/OzfT6Rr+E9ziD+
         x4/R4XZBAe3bEqR987O9iW0jxk5dvIszLpd9zHdU8BB2DZcx5qMIK75h+GsmsuV0FpRW
         hPpj9qKgVQGytDWXn/RgoaMl5uIzrkOjDzJgMnrw7vc5NILFH5MLLqAObO/cJOgBMbUh
         7Va6BbZS4AiY0LTmB7J1lLUfWAub/3QxN+LGqMEBQtfnYDfFwWmCpCp0e4WVUbCFKyXv
         Cpxg==
X-Forwarded-Encrypted: i=1; AJvYcCXkPnjd/PgF1Aexl2Y10GdgrPqznaPQIqWgXYu8hBzmc52HysI8kFyQexTewoGFySNxeOP9ffF1X2LSFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGdqhTa3DBiKPR7EuUTnbwwE4Y1TTg06p/nAsDdCaddFEl88q6
	i2WxiN4H3WKk+OVTYinYbp6nhkXCGPJI+kiualK6woQl/xzCfZoh8ud9EUgm7g==
X-Google-Smtp-Source: AGHT+IHpOZiuMWVYTw3bufjx9CXLF6X5TIqgtqRz1AT4LYEzDp58FI5NPEJFOE2ClOgshqTOtjB2iQ==
X-Received: by 2002:a05:622a:130f:b0:44f:fb77:74ce with SMTP id d75a77b69052e-45b5e030abcmr70037471cf.47.1727329812443;
        Wed, 25 Sep 2024 22:50:12 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5264b629sm22406781cf.64.2024.09.25.22.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 22:50:10 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 26 Sep 2024 05:49:58 +0000
Subject: [PATCH v7 2/3] media: uvcvideo: Avoid race condition during
 unregister
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-guenter-mini-v7-2-690441953d4a@chromium.org>
References: <20240926-guenter-mini-v7-0-690441953d4a@chromium.org>
In-Reply-To: <20240926-guenter-mini-v7-0-690441953d4a@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
X-Mailer: b4 0.13.0

The control events are handled asynchronously by the driver. Once the
control event are handled, the urb is re-submitted.

If we simply kill the urb, there is a chance that a control event is
waiting to be processed, which will re-submit the urb after the device is
disconnected.

Fix this by calling uvc_status_suspend(), which flushes the async
controls and kills the URB in a race-free manner.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_status.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index e438ae5af2e8..d8d5b327693f 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -294,7 +294,7 @@ int uvc_status_init(struct uvc_device *dev)
 
 void uvc_status_unregister(struct uvc_device *dev)
 {
-	usb_kill_urb(dev->int_urb);
+	uvc_status_suspend(dev);
 	uvc_input_unregister(dev);
 }
 

-- 
2.46.1.824.gd892dcdcdd-goog


