Return-Path: <linux-media+bounces-28892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EE0A73FC8
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 22:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 977B17A36C9
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 21:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D55D1D6DD8;
	Thu, 27 Mar 2025 21:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nMrY91Tq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEF619DF75
	for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 21:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109531; cv=none; b=mmcTVJvevAlnw+xWV4zkWZW9/V/tGI6EjPef4DWmuInVgj4FzYCp0EfLRzhrzYaamR15ZYpbVg0p5lSmQH2HXC73JhEUJum7cmkmpmM4HQHyjfJcKC7CSpUGU5qbpUP/yxI6j4KiSye8wgvI/fI+9a8DnNdGgPfUHf7YiWx8crM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109531; c=relaxed/simple;
	bh=MAaDOHpVk8l5y3Bvz9xUmbXMFyQputnUsTd8zkUItDE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=StlK+8G84cnAwxduBz+nwhesQ4PwnyK8JAQbtxjItogYO4gDauwLjo4lK9KZXItIi+6aALdIaM1UzzIJizB55J8Hu98ubhUS7igtSsMSpfVNWZ+f16kS+Srk+zLGWuuVaEwp4vaUakc78nw8l9spg11VWfdq+LCimtgJ7krSVhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nMrY91Tq; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4775ce8a4b0so24958231cf.1
        for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 14:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743109529; x=1743714329; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AMYLMropbZCSC63vr44ogB0dG7buG5/6/cXoTt5SubM=;
        b=nMrY91TqdLHbONpYUdn1xVBQ/Q4UWkiMP+YpCe3hU51p27y0YbirGOMVwjKh9hygW4
         TXvxAB1YsDS6tnIKBVHbCE7V2St1W4I/oSYtlOGDXFRvYJSktY9czhJWkknD3/gvaYF2
         pigNyEAHpskkgQP72kS1zbIT/uDw9YPezH+j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743109529; x=1743714329;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMYLMropbZCSC63vr44ogB0dG7buG5/6/cXoTt5SubM=;
        b=WjwNtnyBFGv8XkuthBp/whSNEiiBd6OAPHXA4PpX2nDlyrClX6yxjXmmFIYQtcrTX6
         fJDQGko49droRYI05QROwu3ftbsdE3u1Gni2rRR/8zAuKrTapmLdKRgqOV7tPnZxRxHw
         qRkHas+4pPUJDaf46L3AFg/m5upLF7zst1qzc8FEJkA+t5RaCpHsZYjN0ON7/Dtd8C/0
         /fP5PGVCnbJuY4C3UbpJuXbg2JSDyqcm6Mex3UBL8YPkTmb4HylYJ3K3d/pj4CliN83W
         mZ1INX+8jIMX8hej4KWLJuscS/TavsaELHVOPXEbosEMB4py2qUVcUhOzFnQV1NvrOwA
         HFWg==
X-Gm-Message-State: AOJu0YzN/UWfTa6HVtkRXXKDmf6lqbsOC6KHe4RpGVbpzIZYfDa/tWIG
	YzlryioZzRhFrdNH15mXGE3kQjfHVTgKQVJjBRVYl7r5IQ/rlpHwHxoIoSxljA==
X-Gm-Gg: ASbGncvPsAuLj2W7hyRMDgt3eY1+8UEi1FuNp9jG7AwR7ykqrFaDpt2FRFhCDd/kpWr
	xw7io3m/eqnfaMRwA457XR4BxPFshbdErpQRjn5dRASqjgtVHqfLDW5YQMseGqg8Nhez0LLsI2S
	YoFHZrORD3QkySgjCcssBHbAMOVSVU0gMSt+4kELcS5Tch4pTUwiF6Uas5uyCzJxXkTPxNsocJO
	WPlBbjb2h25t9UNRy1o3qkedcv59OlSuxGPw0FNPCWin7nRmicFmAZHfXHnlroBZLxpWsa7IaR7
	NfBHZcxrJJKNXZPaPxLd3fEnNxhcEFj4DFPFW5f7civ+vRczQRJ0WOiYjHNlNJaHbQgmvwsssmF
	GVjkvaqFCbvOZByu4c0/1EA==
X-Google-Smtp-Source: AGHT+IGxrFio8vLeHzf4wv6jvGI2BMAIrzLkUQHAsBHF+m1IKzHOTH/P1z2k+W/U3eea8RgAMDwHRA==
X-Received: by 2002:a05:622a:40cd:b0:476:af54:5038 with SMTP id d75a77b69052e-4776e0ed305mr81222221cf.22.1743109528984;
        Thu, 27 Mar 2025 14:05:28 -0700 (PDT)
Received: from denia.c.googlers.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a1070csm2275421cf.9.2025.03.27.14.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 14:05:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 0/5] media: uvcvideo: Implement Granular Power Saving
Date: Thu, 27 Mar 2025 21:05:26 +0000
Message-Id: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJa95WcC/33PTW7DIBAF4KtErEs1DD8OWfUeVRcGBptFTIQb2
 iry3YsjVY0q1OUbab6Zd2MrlUQrOx1urFBNa8pLC+bpwPw8LhPxFFpmCKiEQMOv1fOpjMslf1D
 hy8TBWHHUowlqUKytXQrF9HknX99antP6nsvX/UIV+/QfrAoO3EiBLqLRyvoXP5d8Ttfzcy4T2
 72KP4YGBNkxsBmOonJa0+DM0DHko9H7QzZDYoAwOPA6HDuGejC6XdRukLeOLBhQPUP/GrLbRTd
 jlCE6QhvJij/Gtm3fBRVZqsMBAAA=
X-Change-ID: 20241126-uvc-granpower-ng-069185a6d474
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Right now we power-up the device when a user open() the device and we
power it off when the last user close() the first video node.

This behaviour affects the power consumption of the device is multiple
use cases, such as:
- Polling the privacy gpio
- udev probing the device

This patchset introduces a more granular power saving behaviour where
the camera is only awaken when needed. It is compatible with
asynchronous controls.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v6:
- Improve error handling
- Use __free instead of guards()
- Rename uvc_v4l2_unlocked_ioctl
- Link to v5: https://lore.kernel.org/r/20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org

Changes in v5:
- Improve "media: uvcvideo: Make power management granular" commit
  message.
- Link to v4: https://lore.kernel.org/r/20250226-uvc-granpower-ng-v4-0-3ec9be906048@chromium.org

Changes in v4:
- CodeStyle
- Create uvc_pm_ functions
- Link to v3: https://lore.kernel.org/r/20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org

Changes in v3:
- Fix build error on sh4.
- Link to v2: https://lore.kernel.org/r/20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org

Changes in v2:
- Add missing semicolon.
- Rebase on top of media-committers/next
- Link to v1: https://lore.kernel.org/r/20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org

---
Ricardo Ribalda (5):
      media: uvcvideo: Keep streaming state in the file handle
      media: uvcvideo: Create uvc_pm_(get|put) functions
      media: uvcvideo: Increase/decrease the PM counter per IOCTL
      media: uvcvideo: Make power management granular
      media: uvcvideo: Do not turn on the camera for some ioctls

 drivers/media/usb/uvc/uvc_ctrl.c |  37 +++++++++----
 drivers/media/usb/uvc/uvc_v4l2.c | 115 +++++++++++++++++++++++++++++++--------
 drivers/media/usb/uvc/uvcvideo.h |   5 ++
 3 files changed, 123 insertions(+), 34 deletions(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20241126-uvc-granpower-ng-069185a6d474

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


