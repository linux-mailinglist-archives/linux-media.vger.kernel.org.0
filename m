Return-Path: <linux-media+bounces-33191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C27AC12E9
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 20:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 888721C01A18
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 18:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723AB22B5BC;
	Thu, 22 May 2025 17:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cZaVIeN+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BB61A23AD
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 17:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936731; cv=none; b=W8o0JySMxFOdsbtSX+m2SYXRCfT3apTmCWSpkb4nQrGjt5SM3JOn83URzFmy/AMH7VZh+lKVoqdtGvbKTxf8QgtbGQxNppjr0Fyc9WyEpfzXE87rEjUKPeRdI38YBDlvFI5xZf0dgBeb0FOL0Pfdc+n0t2lb+plQkocTsf+geBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936731; c=relaxed/simple;
	bh=WM4mqGnwWIq+GTvd/qPwycbFRDlvw8qxvlWEL7IVcs0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mThWBn2OKvRHPnaKZAwMCOKtbzY3NSG9yTbPx/t8VUubs4VcGDyZROdpP948WCDI0U8NJ9FcWtWTlQyXk4I4EfZsIa3f4uvXODzusS4sEM9A8nZuy/BTaey4CEvC94HCLB4Ev0pEcG9onU6vyNHgeTPV3scFK3Kgx1ExNK7L6Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cZaVIeN+; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54ea69e9352so10677107e87.2
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 10:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747936728; x=1748541528; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wvsVpWo8EPBJSTQDNOJLYM4ywiA/AIZNjwiuBOar6y8=;
        b=cZaVIeN+FFG62w9IbhzdLdksZBg0ehpMso1mNEb/BK4hbeT397myMdgsJqwiVmUPW7
         2dn/L1dy8jChcReBsMYn3TfL6k8ltQBewZSdqa8Ozpzo3P01nbD8ChXDLx7VoPAtC+G5
         PZSUmV/w7GWIAGSIVbE5+8R/y5riLw9fO4mNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936728; x=1748541528;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvsVpWo8EPBJSTQDNOJLYM4ywiA/AIZNjwiuBOar6y8=;
        b=XICy0hD9sRqpkS2lnV/Fch3s6FrV7G50zcwFdmfm2yALzXa3o8rorDItiB5MfH3olE
         lAhRuBrfSEWK/etzPs+l1y4WxCJwa+oVJQ9QpNtuEPkKfAJBbqDzU4v4FaPG4l94gXf8
         xkJ4rFFqVbEke2vX11bIfY0qU7p7Eo/0763yyuHsJQP9w5J4zTIMIynHSqGCM8WcQEPF
         NL2tLcwmobqDIjElvVukLtItuZXm69oQk9yAJmVko/l497BdYqkVkFG8ZPkFbX2BvGpi
         sb9woA+Rf0/sR7lEBGlqcl3RhuNl+p+kbeCVbXy8ylnIHAa3sTwWAgGqLyueAEe2ucSm
         L2FA==
X-Gm-Message-State: AOJu0YwhY5gywHC4JntN/5BNd3BIG6ouqst6tdMgtkODx6D2KLgsKqp7
	10liv8Cs8VBELqlcK5DAdCzO4tCCoK5uriozohkp+VyjW4j1pd3B4sjHFCgvFO49PkqPO1mU4Wx
	jidI=
X-Gm-Gg: ASbGnct16txG/bg2RjpSTVjcGL5aYqrmeLHKdaXzNnI7JDfba/5r/vx09H7aoIc3OUz
	rGoz5gQolD2HTi8m7JdhSNLBfYzftjW5TzBSti6TKVP+6ZLEpHc1txbFMeLirL4oXwqnzUkMjWv
	DiGykQH7PP5cS5x0TPB5ZnASjvMzziIg1qcG4fAF6W4fyDXx36aVrQmIUiUAlhNWmaXQ2te2JfV
	r3dEM/LuxW3NhE7gbQcW3qNJ3b5FoMq6HA8z4YzRro+Zct6U217+RVDpqfnqoAY3VHUXQN6+UD0
	egIjLd+JxtgYOFAHSGioiUo5mWlZ6/ADmBqAqiiBYVGigysJhD91pTG9FUQO0pO3PNzsF4OeTq0
	TNiOQ+/yDZpPLwNUg2lYS3XbGMA==
X-Google-Smtp-Source: AGHT+IFSfeToHQUzVi5cb09lELuZzLZ3wmsYR2bFg7GXWzUJQ40UCqhOzDaitIua2ApXg39bwqKMaw==
X-Received: by 2002:a05:6512:3d05:b0:549:4bf7:6463 with SMTP id 2adb3069b0e04-550e98ff25dmr9583995e87.44.1747936727987;
        Thu, 22 May 2025 10:58:47 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703e858sm3483992e87.227.2025.05.22.10.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:58:47 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: uvcvideo: use vb2 ioctl and fop helpers
Date: Thu, 22 May 2025 17:58:45 +0000
Message-Id: <20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVlL2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyND3dKyZN20/ALdJHOTVEsDA/OUFFNDJaDqgqLUtMwKsEnRsbW1ALc
 sRPJZAAAA
X-Change-ID: 20250521-uvc-fop-b74e9007dd51
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

This is a rebump of a 4 years old patch from Hans.
https://lore.kernel.org/linux-media/20210618122923.385938-21-ribalda@chromium.org/

It brings "new" helpers to the uvcdriver and removes tons of code.

The first patch of this series is part of another series:
https://patchwork.linuxtv.org/project/linux-media/list/?series=15227

I have uploaded my working tree at:
https://gitlab.freedesktop.org/linux-media/users/ribalda/-/commits/b4/uvc-fop
which shows the differences from the original patch, this is mainly for
helping the review to people familiar with the previous patch.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Hans Verkuil (1):
      media: uvcvideo: Use vb2 ioctl and fop helpers

Ricardo Ribalda (2):
      media: uvcvideo: Refactor uvc_queue_streamon
      media: uvcvideo: Remove stream->is_streaming field

 drivers/media/usb/uvc/uvc_driver.c   |  34 +----
 drivers/media/usb/uvc/uvc_metadata.c |   8 +-
 drivers/media/usb/uvc/uvc_queue.c    | 143 -------------------
 drivers/media/usb/uvc/uvc_v4l2.c     | 266 ++++-------------------------------
 drivers/media/usb/uvc/uvcvideo.h     |  38 +----
 5 files changed, 37 insertions(+), 452 deletions(-)
---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20250521-uvc-fop-b74e9007dd51

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


