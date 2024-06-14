Return-Path: <linux-media+bounces-13267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAF1908BE1
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 14:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66B59B267C1
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 12:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A8F19AD45;
	Fri, 14 Jun 2024 12:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ybaa0PRF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860E71993BA
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 12:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718368903; cv=none; b=GsUKFirQ7SfLR7jTEUpIhtPGyu6pIUk2W+qR69Nph9pTs5l7ChcBpz+Dja3SZEp4v1zuXgm/TXshnM0f6MWIyjMw2GQqxbkvWeH82oeLKZFJil9dDzQu8Y6d6fbIckvq27hsYXa0cbyLkV8QYrR6m4EKm0aRdPgfKi+3nMTLov4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718368903; c=relaxed/simple;
	bh=qBhEPUORN0+wfjTZKZ+VX36yspUBM554ilvl/WxMkYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DFbAkKPHpdQblDt8tliOfk3FGTZ6hzS4yciwG5/7v5pkVtbMQtyXmb9e0TaYgI1nyoM4A8lZhPQhcbR2/TgIWbNoQ76Y7dIiBn0YFYjQHBgTXvuQjnHBEqc3uWVfdklSvij5xLAGU4Mf33avdvay5dsQ5bdUGbpx2iVFSdaiUgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ybaa0PRF; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6b064841f81so16998686d6.1
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 05:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718368901; x=1718973701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gp8nRHlyjFIEZs46UyxWOxZiNNyfZrapMqA1AdjCANo=;
        b=Ybaa0PRFN7IrdBIf28pGUp9N0wNde7PPgfna2APda/FI+XxKukWqcG/L8f8UjQV4lj
         QuTSpCkNclRYsM7GUpmDLjv2J9QzB60CUrLg+WmOV8jgeEMUWbPWq589XfXYpeejR3da
         hMT+a7ElF02A/tDPkhNMQR+i17ubGHSiZWhOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718368901; x=1718973701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gp8nRHlyjFIEZs46UyxWOxZiNNyfZrapMqA1AdjCANo=;
        b=BStBV8QDu9LboX+Gmys7LPzQYt5mNS5E7PqwxbHNU8hxCAur3a0crhgMZF53/F8OOb
         5ygBOBgCdTj/G4gN/VaxPjLyGskJ0uqCUfwvaesdSfWwtDIMV+yAzSPZY/6VcIKYFwYn
         QHTRb0hRc2Tj9+V3cMgXiptEqj/MppNl0/KD0pCdRI7R9nIGi/qLO/Ifx41cjtltyC7K
         lhaG9h5+6YVCEmm/Pz2atSchpM3585SGapWHD360sX4WInWzEYjsY0s1zTjvAjXfivw6
         naIpMLUlD6batam2RsmOZQ+E1XaOhxV5cArbxHuNtlZMmcuz11WIwhkRl8wevkOgXJjv
         2jvg==
X-Forwarded-Encrypted: i=1; AJvYcCUB4wXvFyRxwytpAcY/hYg0iDc0J127daCk/+92P68944etGQaarLoif9086FnxuUPfKpaBzrnttKFPSHpVT+iZ2Uq3rBr5tCrpJ3E=
X-Gm-Message-State: AOJu0YxpbU54ErD7tnmvA56tEk3x6JTGxB3DjQPWGpJEH0XwBTsRbEHE
	9SAyefFZ/DYMRScSKSpaoobTcSR5CexwTnxKBwQ82yEoAHdUQD/YQGewqS0HrQ==
X-Google-Smtp-Source: AGHT+IHJtNT5OlxAJG5HTDAFmHTNEauVEn25IMzysKx6zq1wIY70PbE6ooXmIq4IYnjopljkwoIOcg==
X-Received: by 2002:a0c:f7c5:0:b0:6b2:ad94:2195 with SMTP id 6a1803df08f44-6b2afd6ab6dmr27101546d6.46.1718368901539;
        Fri, 14 Jun 2024 05:41:41 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5c202e8sm17734056d6.50.2024.06.14.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 05:41:40 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 14 Jun 2024 12:41:29 +0000
Subject: [PATCH v6 3/4] media: uvcvideo: Avoid race condition during
 unregister
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-guenter-mini-v6-3-7b7fdc3b21b3@chromium.org>
References: <20240614-guenter-mini-v6-0-7b7fdc3b21b3@chromium.org>
In-Reply-To: <20240614-guenter-mini-v6-0-7b7fdc3b21b3@chromium.org>
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

uvc_status_suspend() flushes the async controls and stops the urb in a
correct manner.

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_status.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 375a95dd3011..8fd8250110e2 100644
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
2.45.2.627.g7a2c4fd464-goog


