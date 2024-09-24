Return-Path: <linux-media+bounces-18504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4039846C9
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 15:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 715EC2834B4
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 13:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF0C1A76CA;
	Tue, 24 Sep 2024 13:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F2KWoiTG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC411A3A9C
	for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 13:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727184814; cv=none; b=JBN6G78n/K7YKwPfoOnhrbIW9HltizxrhSRPPly7tO6oUysrgq4bkP+bziBKOUO73iRzHAq3gbZp6tKhLDF6OqBIWjnZRybpXNtQFEvVPaDQjrrRME4KU5rcfQs1tvKe1AtCRHC0O95j5LIueg1YWNRVdyCSGjnYlySBKJHmzr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727184814; c=relaxed/simple;
	bh=cEq7D7GYogekk6JdLCtsg3CQebwP5ANi5/On67Tn6vU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZYyj8OSDoXQMwkLFubFPHsScemjW04Mx2NhlzgJl0BtTC7tXfdVVSppKzRF7sad99izHAPLRDiNCkIdyrHI4WUz5iQRxUZ0DuN6r6xdOdl5Hd4xDVmWeAhv48Epk+1i5BhhRurjnH35ZHJYaGOHpa6a7mZM5dMdtj0QrY0WQqNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F2KWoiTG; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4582a0b438aso42347911cf.0
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 06:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727184812; x=1727789612; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4z0qxOdupfIRXdbnkFD/B9bzDAeZi9Dt7I+vMO5OZG4=;
        b=F2KWoiTG3RXazKszp465W3qDa5l5UEuCK6a6CVVvqoRXykIymyr9F7k/BA3A5btQ5h
         uyS3n+INiZxUREDrC3QIyKx1W0rHeq8RpiREMDrlxsn/21r4Nz4JI29qayTC8rtRqzhS
         rRpPNFDSADt53R4o4OBeNt7RbYtlE1T9rKRVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727184812; x=1727789612;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4z0qxOdupfIRXdbnkFD/B9bzDAeZi9Dt7I+vMO5OZG4=;
        b=de7qNOC8JxDtQ2AFf/ChgpOP7uj87NugGZ4bTaMeYvQSY14Pmh/84EeFyUmLmN+to9
         3OyHgqg8Q3U+9GKWa+tejW8xEYBjuWqPDOdSwxFOL/AoQ92CIY4Ktpkdbg0yenoDtRZ0
         2RDNfyrcFkL65GjJP45jN4QE4O39AuQ/01RykPKxWNMY4SmrgajTA4457wHz4108ImZT
         u9vnaoSheJyjsa4C2bzvIABSaL3SXRuDIl28MEsF79cdnkNhTzd1AmA7G0BDy+WCctjg
         ZKyG+XGeiB8gmVHDbilyYG5ojIRQpsAPTUneYyOv0Pfmw/S/rSeyGyK+ysOUpKfDU7QF
         kG1g==
X-Gm-Message-State: AOJu0Yz8TU4SUrb9nPdVwU2KbBqnMrKGG+5d986bYraWQc5vZhIW1vZB
	rzmD1xncQy0X4j8Dp1ygDYlcH1HGJVR48i7ewg2+dy4glkDnA3jH5n6Ud5qIjQ==
X-Google-Smtp-Source: AGHT+IEAbFJ2gs9LVV/+qhJ79xlUVTJtnBUQy0Wwae8OfDu95Oooo07L6KtmIVjtfF14G2a9ZF9lPQ==
X-Received: by 2002:ac8:5792:0:b0:458:2607:d5a7 with SMTP id d75a77b69052e-45b228a9d4fmr277173571cf.43.1727184811673;
        Tue, 24 Sep 2024 06:33:31 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b52572710sm6335101cf.22.2024.09.24.06.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 06:33:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 24 Sep 2024 13:33:29 +0000
Subject: [PATCH] media: uvcvideo: Force UVC version to 1.0a for 0408:4033
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-uvc-quanta-v1-1-2de023863767@chromium.org>
X-B4-Tracking: v=1; b=H4sIAKm/8mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSyMT3dKyZN3C0sS8kkRdU6NEQyODRCNz87RUJaCGgqLUtMwKsGHRsbW
 1AAZ0cltcAAAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Giuliano Lotta <giuliano.lotta@gmail.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The Quanta ACER HD User Facing camera reports a UVC 1.50 version, but
implements UVC 1.0a as shown by the UVC probe control being 26 bytes
long. Force the UVC version for that device.

Reported-by: Giuliano Lotta <giuliano.lotta@gmail.com>
Closes: https://lore.kernel.org/linux-media/fce4f906-d69b-417d-9f13-bf69fe5c81e3@koyu.space/
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index f0febdc08c2d..cc62bdf77c08 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2431,6 +2431,17 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
  */
 static const struct usb_device_id uvc_ids[] = {
 	/* Quanta ACER HD User Facing */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x0408,
+	  .idProduct		= 0x4033,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
+	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
+		.uvc_version = 0x010a,
+	  } },
+	/* Quanta ACER HD User Facing */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x0408,

---
base-commit: abf2050f51fdca0fd146388f83cddd95a57a008d
change-id: 20240924-uvc-quanta-52a120a277fe

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


