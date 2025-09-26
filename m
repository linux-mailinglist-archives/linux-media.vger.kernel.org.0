Return-Path: <linux-media+bounces-43262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 626BCBA3D2C
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 15:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75924620D86
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 13:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEF33002DA;
	Fri, 26 Sep 2025 13:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mSIAMbl3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4667C2F99A8
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 13:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892306; cv=none; b=Rn9ZCjaMpshO57Jmsclb28rr+WCBVOI9qmZz7p3QVjptPVBCvkYRDr9/gYVqXdcYzsnqlbliJx3Yx4s/kDV1tVibh+Qv4gQPNcRku/scUyLTstABg5EdxsOVDyNjdR1wDAJCtDpwqYrUoxYa2KieU5oDM+PvYBgvN9o1Z4pBKkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892306; c=relaxed/simple;
	bh=K3KdMz7C2S+sjjhpcJ2VrrH58ALa5ic8heuJ7M4ymXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n/uGYJYGJpAK1YsTlz6iGc0j1VgSYWKFfuU3JnxMxOeS/VNU9ngXFLvnH53rS0OxnBEFox7glIxEYWfSTVPZnraZMuglX3TI2Sl1T/teVkq5xeT4eu0KAX5qbFw74g2CawPDE16b2R7JYos8tA8OQq/PbEgca173DNPecdIWGI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mSIAMbl3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5821dec0408so3098133e87.1
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 06:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758892295; x=1759497095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yK5cgdjGWBYF8FS7tGEMMwrGVxWyiTSoe6v1uuSmXRU=;
        b=mSIAMbl3eTr+7VxRl3P0MNZWVUQCXmyAjlkt5xOkpMbeNLAm9uAl2J4pO453MmOiyC
         eR5BMfA+XUNGxAiTsSzXwXqHSZzFU9i+OYryqN1Jl1ZL6RtN9qcT+nxc2ooHY/hse2s3
         ulTqMpeG3GcGMWldTAcmsbyQxrV4t+Q/9ig48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758892295; x=1759497095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yK5cgdjGWBYF8FS7tGEMMwrGVxWyiTSoe6v1uuSmXRU=;
        b=EzH6nm1hRiFTAFY+voVKjJv/xsepof+jQAHQz3QKlCtoWO09AdhCxdAeKOEmDY90El
         dWVFSqU6qiQxrKn+MvG2V2caoKvwYGzO5mQM+NGvqSekKLcoO794H8dkPUujIuFvZwi3
         Y3PYUahZ3HCMCWFRQVjUvLwKssqu7RCTrn8xD+8Yriy41XtgOtpdFc7REb5rbMk7Zj9+
         n3LZfM6ZmnNaUCq3+WkqpE3VJWKLtjgefnSPqmWhyb8xjIRcrJN13d9VCy/q9nDX8LjF
         655UqLvo76GnJY4S/1+ZXx2R4Cf1LwhK2I95qUz8XRlSqCK0UyhexYHB/F2X43ffwunl
         7OXw==
X-Gm-Message-State: AOJu0Yw/fWgW3dq8fDWong3GmKMj4xyPjN/F6J1KivlCAXN+CxCBxU65
	r4t+IQTa3rtm4RYD1UHF5a/woggmrGgr+QewCbwpG3zz6k4/LJBEbluZgBWk1GSsTA==
X-Gm-Gg: ASbGnctmfjsVfRj3IoKPCjLdOxKWLsrk7I38TPNJKP3U9P3SWfL0iwE+wOLmC3yL2Mp
	15I1zuEMR/fNakpn8aeOMis0lWXlESeIo/1F2sldgKwvvRN+qd7It5ru0DCc7XCnmJmUbbpSfez
	cUygmvyibs8GEQaY9jX0tEq4S8tFRRftJGNg8WE1vCSBRitvbKFdtYtj5g3YD703xgoC8CeQ+UB
	5gfB7zsdZ4SmEOYesX5Wk2al6Efmi6jYlGCQZr24MuOcqPremjz62N4Xx5yDTdzTSlo558XhZOY
	ZKW37vKEpOb070g49oAzn2UezvzBfZAz0+dKpAj5LklPfmBPKzyOQUz8DR57f+iyw3/OzCapoIf
	iGuPphOl2Ulopqqddgc9I4tchyodIX/SxxXGoOuX2AaTO26BnzcQwGCiuhpMQdLOpUquDcb5Bkq
	Mk+fJSft+nJoBB
X-Google-Smtp-Source: AGHT+IGFsjXQDMDVCJ1rn/evMz3fd3PTtDOlV/BZM7pcfvKWARbqj04ku2ig/REcBSICwb5/1B/aQQ==
X-Received: by 2002:a05:6512:23a8:b0:57b:3600:8b4b with SMTP id 2adb3069b0e04-582d092964emr2268576e87.7.1758892295046;
        Fri, 26 Sep 2025 06:11:35 -0700 (PDT)
Received: from ribalda.c.googlers.com (64.153.228.35.bc.googleusercontent.com. [35.228.153.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58527c6b014sm123872e87.43.2025.09.26.06.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:11:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Sep 2025 13:11:33 +0000
Subject: [PATCH v3 09/12] media: uvcvideo: Fill ctrl->info.selector earlier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-uvc-orientation-v3-9-6dc2fa5b4220@chromium.org>
References: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
In-Reply-To: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
To: Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

This is a preparation patch. A future helper will remove the selector
argument and use the information embedded in the uvc_control structure.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index aa9de84de9236540c46ee78fb8458873d503786e..98e454fcdeb2ee36d334068fd750e6203931699d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2720,7 +2720,8 @@ static void uvc_ctrl_fixup_xu_info(struct uvc_device *dev,
  * Query control information (size and flags) for XU controls.
  */
 static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
-	const struct uvc_control *ctrl, struct uvc_control_info *info)
+				 struct uvc_control *ctrl,
+				 struct uvc_control_info *info)
 {
 	u8 *data;
 	int ret;
@@ -2733,6 +2734,9 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
 	info->index = ctrl->index;
 	info->selector = ctrl->index + 1;
 
+	/* We need to fill info.selector to get the flags and the length. */
+	ctrl->info.selector = info->selector;
+
 	/* Query and verify the control length (GET_LEN) */
 	ret = uvc_query_ctrl(dev, UVC_GET_LEN, ctrl->entity->id, dev->intfnum,
 			     info->selector, data, 2);

-- 
2.51.0.536.g15c5d4f767-goog


