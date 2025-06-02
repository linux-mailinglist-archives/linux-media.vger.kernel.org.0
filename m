Return-Path: <linux-media+bounces-33916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A24ACAEA1
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AC0A3B39AE
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00982236F2;
	Mon,  2 Jun 2025 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RDDOb4HY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8758C22257E
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869601; cv=none; b=VKioGgu7fTM/qH6/YjR1MEK3muSimy4lUk+LrRH+5/zf/EoDlzXXUeRaVW043fiej2bUfHolsEJpN5fT1XxFr+V/WDZ/cxhDzI+wCeGepaT6uHDe+1CZ9ZexpienNQYqnICj/NGoBTrPJClZ13IV4sIZ0wYwrVhUohonbvvDFLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869601; c=relaxed/simple;
	bh=s2fTm5oyVsyETmrw7htvXbIfGrXW6uLj/89qBBxdQx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=enuCEAL2GIA7PQjc9bM8bH6ZyjbdhRps70rWU6ybab7lLI9wTcNMFqPRp5SaAy29/M0dFxdTQD0axkgHCJxlV7TpaOW8r2lO1GmCEBNXzkipWRFINtqINng4ZmrFIWxL7+FKKfU/F4GrU84xsmtrXCMEtzC50Vr/lrEhoSy/hAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RDDOb4HY; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5532f6d184eso5528605e87.0
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 06:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869598; x=1749474398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbA76Sy+7dv3Hy+WD50S5fx7NglU/kONFwY4cFw22AQ=;
        b=RDDOb4HYsy7vJPgTgtVtYRzpHe0KjW5vl7sIPtj/llKWJdEH4kBJuQ0siKcCNCtbxD
         XyDBjMoMRkQ2uM0NRnTtLjMflT7vhxB0x/n1vl56Djm2OmvcV2v4JE6S+AdymDNwmbtC
         V6UHNKoJmnnRiwaWWJSXsilcp/2dWLGeaxDp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869598; x=1749474398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbA76Sy+7dv3Hy+WD50S5fx7NglU/kONFwY4cFw22AQ=;
        b=FFkho+yf8Xriaegdgha2iGjhLbbrmHxnap/DFFm9yAORW4HmBBer3zayUSAKsbX0ro
         PKy1S0WT0Yj4uFo6MEGgAwfJ2FUZjTT1B/Yx1hiNXItjFYi03R+UUTe20hntj+yAIHC+
         AJ1oBqUTad1FHh6yxhlViuO8mL6djt4c4ExsyBMe4DjOFTZkbtddsCGQHtDOF4sEtqZ1
         sWv+imI+9lx/sdvfLXFP1cVRBBN6DgR508QFrL9ndy6e4c7DEji0BVSvNegnGbpLLvMF
         K1IBSK8ksLsL1jvrWbe2caFp+I02UIJV4TzgEJUOPsd4ZCsnzGbdwdckjPH4fguTsS3P
         Nrjw==
X-Gm-Message-State: AOJu0YxS8Xb4bZZlItw9B5QEnOB0tdZw3zt5PIX6SL8xOJSKlWI8j7Mr
	qvgh15u2Q8tN7QFW/tsDQ3AOrdxiVOVJjeQnahk1Y82NFg6MqiHdWp8rupKrJMP7rg==
X-Gm-Gg: ASbGnct9BJ8a8/KHpewdPDf3dESPxBzKQojZxnm9IG/yWdkK837L+RSjM56IW5S90F3
	lJNx/Y1bmSaaZ1jnvq1b0vzg7+N2eZkEb0BxCdIJKoD83J05LP05zAR2jYk5ZCfMVjaZIZil1+w
	ey5kUfEdOnYuEAyZALboKVt7qsA+1fIs09rm7tLTKvhP0Ikxi6WESkTXV35N0313FwmBokFt83j
	yTwkXRrLCx7MoZhYkr7quILmEVuxo/bjevF9pYJmauJi4YL8BjSYLfXK7HJ4SHy3ZdtZojEdaOV
	2vwHnJ8sktt6KIQ4iIfvPbA1zoKlj2fTTJF6yVrx4saCx4vPIN6A6HcWAY1MAg/IyZ/RL7mUdvf
	vK0Xac2bNG3zC2vcImCRvs39KBQ==
X-Google-Smtp-Source: AGHT+IHe1vf7/F+KCeNYZJxpJFI7hvw+HxaaxkgDjKbbve9meQSh2ZyQ+hIz8qoG/mtgFJgJ8UxrEw==
X-Received: by 2002:a05:6512:3dac:b0:553:23fb:595 with SMTP id 2adb3069b0e04-5533b8f3be4mr4267094e87.14.1748869597674;
        Mon, 02 Jun 2025 06:06:37 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d26esm1590160e87.41.2025.06.02.06.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:06:35 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 13:06:21 +0000
Subject: [PATCH v2 9/9] media: uvcvideo: Support granular power saving for
 compat syscalls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-grannular-invert-v2-9-c871934ad880@chromium.org>
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Right now we cannot support granular power saving on compat syscalls
because the VIDIOC_*32 NRs defines are not accessible to drivers.

Use the v4l2_compat_translate_cmd  helper to convert the compat syscall
NRs into syscall NRs.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 13388879091c46ff74582226146521b5b5eb3d10..8358ca54b248dd1cf7c984b206b8e550cd883e54 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1237,15 +1237,13 @@ static long uvc_v4l2_pm_ioctl(struct file *file,
 static long uvc_v4l2_unlocked_ioctl(struct file *file,
 				    unsigned int cmd, unsigned long arg)
 {
-	/*
-	 * For now, we do not support granular power saving for compat
-	 * syscalls.
-	 */
+	unsigned int converted_cmd = cmd;
+
 	if (in_compat_syscall())
-		return uvc_v4l2_pm_ioctl(file, cmd, arg);
+		converted_cmd = v4l2_compat_translate_cmd(cmd);
 
 	/* The following IOCTLs do need to turn on the camera. */
-	switch (cmd) {
+	switch (converted_cmd) {
 	case UVCIOC_CTRL_QUERY:
 	case VIDIOC_G_CTRL:
 	case VIDIOC_G_EXT_CTRLS:

-- 
2.49.0.1266.g31b7d2e469-goog


