Return-Path: <linux-media+bounces-22446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6873F9E0771
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 16:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E5E9B3913B
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FE5207A2A;
	Mon,  2 Dec 2024 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fcXU1MHM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CF7205E34
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733149490; cv=none; b=dVGKYSk7uCn3fvU9mnQ+wDVc+18U3bsvcWVS9f5xxnX+Jzr7venrj8ww8s1msNMVy1MrazOQoxdryra72u8FSPyzHbW4IMFDc3RaA6FTcxn1Q3k8khsse1VzEc4U89lZt8d0NI9B7VeVW3x9Uap9Ze8DUlXzShVJogXdbIrmMYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733149490; c=relaxed/simple;
	bh=AywEVRIa8VWMmuquTxALkCvhjnUbojSmLJ871LrwGJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aewj1xlHduHkrTPfRjPJiBufVntMavQF6++sSKb9V5s+guJd0cWIXFhnXtAKt0ADp55QzkNyrwvFG/ejMqECaxdhIlbTH7S1b5Vbjb2wHz6kG+3mYh0pEHSS2Dc//upXsOzjmJjdB1Qz5czYwV92Db4zB7YOl5+3G67Vn01NwVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fcXU1MHM; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5f1ff6a2128so1531764eaf.2
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 06:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733149488; x=1733754288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GovaJn86FmnHeAFnjgqTGOhPMZTKviIql5RFEvQWovM=;
        b=fcXU1MHMRPMn5LDryzdrt2KzjjCKKip1+g8PaY1mnx192vtCVb0kL0uZ7zYMtLlMND
         bZjfuS0O8aMVWPKUz403KxkpKi6n7upPmRr74QEX7susveFQpQttuDl1vzIeVOxoNqdI
         2N2u0pF7iEF+paA8mSLgpF+SqlRGOELyZaDmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149488; x=1733754288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GovaJn86FmnHeAFnjgqTGOhPMZTKviIql5RFEvQWovM=;
        b=pJ9G0fZvKBe9W7r96il9yHQOLZNYvQRcCms9cUEfm8rYNfQdohG1LG4j84MaMbSNvk
         CGTJJ5BopdJW8zX70+En7ElMwGdt6dtIlhoMgsgFXRFzb/hW7it2Y/xI2qaV8/Lb8mgD
         U1UhMBZclhAZ/zUK9h+dA/qC8nKg1NqmJ65oM17JuV7mG4T7Yd01X1KVPjgVB7QV1rSK
         yWql3fXMTrYGh/uHlqRDRYQLzNMYvC7dD9BQotsOLrwgw8q84dZuSpHRXm1DDv0Q7YTv
         E3YWLnSY283YF7id+0EIAz0RwG5fz1WCVD/AibrqjdRx2rr5SeO2RaNDQS+dc6qC6AbJ
         jYLg==
X-Forwarded-Encrypted: i=1; AJvYcCXxQggH5fw8gePbgXSe2gCqRL83AoxPOXTEzVLP2p7GwMKrFMDG6WE1jP800DM9XwV2KnRqllSqedHObw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq+MsqZGPFJhSpiMXQLTy57pEkRnJoFvRS4ySValU7d1ZSe0rt
	dwXITkKySGlyG94q0Ccaf6Fi15hYVaGes5c0PLjPx7/MBXypb9oS3l8JykwJ6A==
X-Gm-Gg: ASbGncu/0Qc2+uJtXMEjwWXRs7ZtM9mFnmbWX/OixNfMjNBrs8nFCuaM5tnAnrxfLKR
	9d8VHj9fb0ZVZ66csdIatV1IPbuo8lIOiWxpND7DTiQZ/zZvNt0JxcAfC17PSiO8ANcc5MUdqXK
	mB9h7UtS7xZlMWT9Bt02bMfXiWh+D0UvoroLSLvoQWNPlKsVYSWPpVjmTJbzKcBvsHDWzKV20h1
	KWdrIA+gpImdEcT7MCeO7cmg52OV29l8+x+mM/oGuqYZLXfa1JtaS+RQDkPsLb3ZZvvAQbx8zZk
	OxJM68jlcqH6dVPxPWFoQSOQ
X-Google-Smtp-Source: AGHT+IEx+ANnkYfSAsAjHxydTAAtBt9M12WJreFy9bqMG2XSO0QA+Yiio2xXJ28N01qURnNZAEOWCA==
X-Received: by 2002:a05:6358:e481:b0:1ca:a079:42f with SMTP id e5c5f4694b2df-1cab159b85amr817878755d.5.1733149488534;
        Mon, 02 Dec 2024 06:24:48 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85be9087890sm179710241.25.2024.12.02.06.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:24:47 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Dec 2024 14:24:39 +0000
Subject: [PATCH v5 5/5] media: uvcvideo: Flush the control cache when we
 get an event
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-uvc-fix-async-v5-5-6658c1fe312b@chromium.org>
References: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
In-Reply-To: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Asynchronous controls trigger an event when they have completed their
operation.

This can make that the control cached value does not match the value in
the device.

Let's flush the cache to be on the safe side.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e90bf2aeb5e4..75d534072f50 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1672,6 +1672,9 @@ bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
 	struct uvc_device *dev = chain->dev;
 	struct uvc_ctrl_work *w = &dev->async_ctrl;
 
+	/* Flush the control cache, the data might have changed. */
+	ctrl->loaded = 0;
+
 	if (list_empty(&ctrl->info.mappings))
 		return false;
 

-- 
2.47.0.338.g60cca15819-goog


