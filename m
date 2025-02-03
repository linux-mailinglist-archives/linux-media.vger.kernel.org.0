Return-Path: <linux-media+bounces-25583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC415A2596C
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 13:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF4083A8850
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21EC204F6F;
	Mon,  3 Feb 2025 12:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mYJba8qh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1F92046A6
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 12:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585653; cv=none; b=Kx1VwFE0cXbzLY+ilFzBBK5cgVZqBfl6x8vxPeLFXxUUbmiXrX9zgnJLQtLIZ932N6Ns77WrlWQsGTJMyYWXK55L2BF33X8TeiWPOHSCszFyUbecyJYXg7aYSjrg2A0ZiJu3oxXS4/D7sx0JX0HXTZ8SMQkviv876IJTzQwu6EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585653; c=relaxed/simple;
	bh=XXTT/tWxhDROjkut4sJvEGq+bxWZv4Rs7XbeCY5Ewqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gh6cBQhetnOPo1y0GsCJjJATVnJvGMfb5EPBry3xiXohlvvX152gCwLDMO6yxs/cO4tjOWyZ1qj8jUTRhjd2FWkFQXWT9fBPXUV5LV3LqaNQcMhF1fhhtCMXrMaVJUCwNDYKmuKZA5WBH1wPtcLnEUI7z9u35Tu31QcltYCZVuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mYJba8qh; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-46df3fc7176so37999591cf.2
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 04:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738585651; x=1739190451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UyBErLHGx5G6ormV1VB8YFEdyWYN72j7JODKBi0RF4=;
        b=mYJba8qhsOCoJya0nvTmeeuy+dXdJwQfDYKiJGFYJjTDMm6mTqnD6qfoBJZLqSKWg8
         bluJuXY82E37XCR2vS/84mLnxlldGmaiIZgAzklLVHJUws2J4zx5G0y5xnM1VRFLRXV4
         sODygUyf+gIr1JIsVq/1NL/0rW+GRMljl1nOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585651; x=1739190451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UyBErLHGx5G6ormV1VB8YFEdyWYN72j7JODKBi0RF4=;
        b=Dxg+ApXfWSysav1sXhFI85tuFqXjyQ2wcpoIlfCUEgLnpxyhWL5mGbjZUr+fs7iO54
         GfwH5Cxtrj4M3Gy+ucE1XGzoqFdldPq1pc4nWIxachXvp7Hw4dWpOSOcEI8QrAYMPirN
         Qcre+b37JO0vEDOGIuS5VvLsRwwb+i477N3xJQunyiS3FpOZ8s7Q5iNMERIuH19R0sni
         41InBXljg9rED2UD7vqMRdlNH2Jq+FHsCYtlgR5OLSh57cxfqYDRSzlBJ2X1p2tpl/wu
         7Lo/9x2qwOXMl/N4CdkYJDnABS1+MhiRFkh/khWMJD+ajttrQlmA0Or2tQ3B57Uy+a12
         eS0A==
X-Gm-Message-State: AOJu0Ywa6v7oxGQJKkvRjl6m8+R+EsWfW6RWujXw0KbMl7kGeQ+IBFZ/
	JNL6gv+bxXEIVLQX3zihkUwHmii7jDXYF4IgMts7E40Pyzm61yVpUuF1NmauMQ==
X-Gm-Gg: ASbGncu1+2GBhKsp1J8iUFNEhZ2tAF8PYzWJHqxFRSKa6AmJ3/2FxZPYbYeciiFq3D7
	G0Te69itUFVr7KJtyMQpySdI4JcK16rj9f0FTw1w9Si7c1wRF7VCPH9iCLCvie93nrtlnX9KBrN
	Gyw8NtUzKY0KDS+WpLSmpsdYn/asKNAEGoeP0fKg9AoKER6IDz/2qIZEqP+ntZalRip4mikE+vo
	umcHfV+pbDX2SaxOaghCQsY1LrZ49RQKTad3ctbBq/eJT7UYvlGo51nLbgDoCgkn9vNSKgyuwmS
	tb2boGZyiatEW7VeTUXB5uLwDIHs29cvkjNN1q5fRDDbRb5cSZN57lQ/h6lIBLrS/w==
X-Google-Smtp-Source: AGHT+IG9E0NH+LYROfpL2Nq2MBiFHcnAII6p/7ifysSOUvC6cvXCw7X7TxWgfCpTwJkAsyCKZgKCJg==
X-Received: by 2002:a05:622a:4296:b0:467:681c:425c with SMTP id d75a77b69052e-46fd0a806f5mr333036041cf.1.1738585650743;
        Mon, 03 Feb 2025 04:27:30 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e0c12sm48240941cf.37.2025.02.03.04.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:27:30 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 12:26:22 +0000
Subject: [PATCH v2 3/6] media: uvcvideo: Add a uvc_status guard
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-granpower-ng-v2-3-bef4b55e7b67@chromium.org>
References: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
In-Reply-To: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

It helps will help will the error handling of PM functions.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvcvideo.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index bc87e1f2c669..be0817da538c 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -763,6 +763,8 @@ void uvc_status_suspend(struct uvc_device *dev);
 int uvc_status_get(struct uvc_device *dev);
 void uvc_status_put(struct uvc_device *dev);
 
+DEFINE_GUARD(uvc_status, struct uvc_device *, uvc_status_get(_T), uvc_status_put(_T))
+
 /* Controls */
 extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
 

-- 
2.48.1.362.g079036d154-goog


