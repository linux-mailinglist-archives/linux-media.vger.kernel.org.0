Return-Path: <linux-media+bounces-29369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 935B4A7B7D9
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 08:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A92C7A813B
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 06:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B360C42AB4;
	Fri,  4 Apr 2025 06:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lua6EUnN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532D5149E17
	for <linux-media@vger.kernel.org>; Fri,  4 Apr 2025 06:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748661; cv=none; b=ufmbEKh7+hS06p/MVyxYNT7QMcDCcmFyfThMoFV1Ap86MT3ECXpgIOzmS5ffGHbSpeQea2WKWkAiRMkD4qjfZD2YzYJYTRDTnEwMMf6yoMi6JiJTo44aGdd1I+7LcKY+cvCcPqgrwHg0S3Vpf4gAt1JnBZjGq269xIN5eyEbMHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748661; c=relaxed/simple;
	bh=dRcNcXMhQCLQSc8KolpqK0jy3kQMHaeA6z8Dx0eFyNc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DmB0G228OwFxN/QbpJHp959ml1pzw1YKytwPBnFuU5XmBEYsK3xtPlHc3wPELQqQVM5nA1uSM0FfNaUUaLileb3E1+gY/trGWNByYsb8kz1WSRhOKJqpQnKEtbES4jY+RlqSXx6ZsRz2Puer25yS98lRuxZX2q631q4PuPKBNpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lua6EUnN; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499c5d9691so1937351e87.2
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 23:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743748657; x=1744353457; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E2/0MoQri2+kgKRxHCnO5QrE0iduVLuICWxx2heDZSo=;
        b=lua6EUnNIp42CF4fHgE1cVjU7MIZye6Jqk9SgwfvRSHd4/DpUUABYRo+j9phh788v0
         crENzkRXA0AeCUyjbE9SBRLtki94/2taQXJG3UNceu8wuz6DC3hOgvR1vHMJLGtBgCLM
         y/TR28oQLUb9OP4W9/op2++IotqXEhIMrGCy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743748657; x=1744353457;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2/0MoQri2+kgKRxHCnO5QrE0iduVLuICWxx2heDZSo=;
        b=F3h5xjX4BWU+HdLUoalS+0aeyGSVyiEzi6PYfF8BwrNu4PcM0lHRHPMKioCrVBXJX7
         dYfybnP86L3kUpnEq8b7UOxBDQwbDDEZGWEIVDFEeItjbOznv7hmK5eTvSlw51vYNp9y
         zjaM32zJ24/yKF1ugjWX0hgmzL1Ox8jTpuwjwM/RmJEoPGdg/QOfDH9v3SBaFWUmqRxI
         WG+6eTN0f/787eSTnx+RdjyyyKJPai395dOPDjg11ywafONcZvTy5acuG35WLC08RVea
         3ebhdx/4aCMIdi9/0K2OOyRQkveD3+w4EhUtRc+x/qIp1Ri+aCkRc2zZXdYp4+av3AHn
         U2mg==
X-Gm-Message-State: AOJu0YyLccCwi5U39CJGw9Shtdf+nymGoAFjEcADh2Fl87dXqzWBOdrb
	E7gFt9myt/3KZMpX4h8N7PwRuDDNFUGkyMtAYvH569o3QA2Up6DaEC9HtzBVmN5nYQO21aHcdD0
	=
X-Gm-Gg: ASbGncvxwCBTBa4YqJAQDNTBrL8HPBo3KvhkzkBnxNqOywlD+7bjXj/ciLZMDQrV7DI
	k5LqqrrxpkPcaYK1Gs6Qs+o3cBrP9PkveGvsy+lwxKWvgAxNfxtCHUOK5JoS9IvG4c8tTf2afIH
	wBlBvtWRzTenukit3zhjU9EDB9rAt8Q6mvcm7Vwwp7q1n60tyXyNral3h/8tGsbqrikr+t5xZg+
	2KjxnU5KioAWREV5+c91UZEh7mSK7qSQqhXbXN6lJKsSBh0P2YCNPPEdaxC6s3IA+I5bcQH3oBV
	SrLXmBDbI1W82JNKvFzbVh8H77iv5unCb23ykVLGJIGlw5jAXTOH5sDvlv5srQ5Yuncdv1PlpYM
	A+o9hxHuonYT5hrDT+c4zwArBMTzi1++Vupg=
X-Google-Smtp-Source: AGHT+IEOmx3SeghSSudCtmkKz07r0+wsw6tchEuaUxXFBzVyqDR4IR4qqRks8m0vtjYZGMsLKvWevQ==
X-Received: by 2002:a05:6512:15a6:b0:542:28b4:23ad with SMTP id 2adb3069b0e04-54c22776e3amr581480e87.16.1743748657175;
        Thu, 03 Apr 2025 23:37:37 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e672444sm338275e87.251.2025.04.03.23.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 23:37:36 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 0/4] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5 + other meta fixes
Date: Fri, 04 Apr 2025 06:37:33 +0000
Message-Id: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC1+72cC/23MQQ7CIBCF4as0sxaDlCnalfcwXRA6llm0GGiJp
 uHuYtcu/5eXb4dEkSlB3+wQKXPisNTAUwPO22UiwWNtUFKh1LIVW3ZiptUKQuyMaceLsgT1/or
 05PdBPYbantMa4ueQs/6tf5CshRRXY6zttMGbwbvzMcy8zecQJxhKKV+xnqynowAAAA==
X-Change-ID: 20250403-uvc-meta-e556773d12ae
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

This series introduces a new metadata format for UVC cameras and adds a
couple of improvements to the UVC metadata handling.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v5:
- Fix codestyle and kerneldoc warnings reported by media-ci
- Link to v4: https://lore.kernel.org/r/20250403-uvc-meta-v4-0-877aa6475975@chromium.org

Changes in v4:
- Rename format to V4L2_META_FMT_UVC_MSXU_1_5 (Thanks Mauro)
- Flag the new format with a quirk.
- Autodetect MSXU devices.
- Link to v3: https://lore.kernel.org/linux-media/20250313-uvc-metadata-v3-0-c467af869c60@chromium.org/

Changes in v3:
- Fix doc syntax errors.
- Link to v2: https://lore.kernel.org/r/20250306-uvc-metadata-v2-0-7e939857cad5@chromium.org

Changes in v2:
- Add metadata invalid fix
- Move doc note to a separate patch
- Introuce V4L2_META_FMT_UVC_CUSTOM (thanks HdG!).
- Link to v1: https://lore.kernel.org/r/20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org

---
Ricardo Ribalda (4):
      media: uvcvideo: Do not mark valid metadata as invalid
      media: Documentation: Add note about UVCH length field
      media: uvcvideo: Introduce V4L2_META_FMT_UVC_MSXU_1_5
      media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META

 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 .../media/v4l/metafmt-uvc-msxu-1-5.rst             | 23 +++++
 .../userspace-api/media/v4l/metafmt-uvc.rst        |  4 +-
 MAINTAINERS                                        |  1 +
 drivers/media/usb/uvc/uvc_metadata.c               | 97 ++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_video.c                  | 12 +--
 drivers/media/usb/uvc/uvcvideo.h                   |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 include/linux/usb/uvc.h                            |  3 +
 include/uapi/linux/videodev2.h                     |  1 +
 10 files changed, 131 insertions(+), 13 deletions(-)
---
base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
change-id: 20250403-uvc-meta-e556773d12ae

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


