Return-Path: <linux-media+bounces-27049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F326A462A2
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5CDD17F107
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E46221D8E;
	Wed, 26 Feb 2025 14:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UgHQqe+C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E58221703
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 14:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579812; cv=none; b=NAgSfY4RYYEIfQ0mB53OO+cxuNsMXWD4YtkdDt9IA1KHWdRD0wuZNjK4oAoWxWBx1/Yzcm7gf0X5YkU17oE0AG4WDk1jLIHnoOhDNIzLgIWe8KorBmvNkUS6XmSZCV8AxZKOi4Re8Za9D+q1e1kAz25Vy1+hv+XDRxlZNZTZXmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579812; c=relaxed/simple;
	bh=kUrtbBhPfU47BIN9dxKT5jUwuyUmqkW+ixPlYUal9hA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=niaxQ1J6r/+Id/Rli/P6gdNZ7fYsTqsNXX81v5yRKSYtsRKe02bNL4p8xQKLPgZLE2S2HgTg9+8EngJJ50zurd9qga7gj+7mm3j+P+8+VMoi3lIxDxq74HFLzTa6uIkglmXXvLDxDaHnX7pBJ7QW2Tv3DZzQrfDGGJJUwxiHs14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UgHQqe+C; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c24ae82de4so53667585a.1
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 06:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740579809; x=1741184609; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oYRh7XF95bM+yB0zA37tKM364WBKNiiWdqWz3L09IaY=;
        b=UgHQqe+C/ukmoUPStXnE1g8iLJNieFwVV1aX1WCHBCA5lsn/7fh5QjzZTGQkkXmQvb
         ystyG1BXtYa25XiNX46fpWPjIIsJtxNGX/RE4NX3wozk2iXkuSAZY+BFnXYCZ83qcAp+
         y6CHFbzmQKEO2zGYTusBRKfYcnF08fOk2621Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740579809; x=1741184609;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYRh7XF95bM+yB0zA37tKM364WBKNiiWdqWz3L09IaY=;
        b=mGl6/Xb5tyLPrgrRccRFNfk6p+B8AB4UQc63z/ncsk9GiE9HUPxUz7+Pc1TPb24vjL
         6c5heUVP0UKiiZpXZFMUmPxnH2AhPKu7bhsngriez7+eUZ3EkZVzc8mp4ryoBoKkcYop
         6LIskEuxg8Ndd6LwLSO/THrqbj1v0lSX6b/KqA2oNHuKyMB9aCnVUtiMzBZoc5YfdMdl
         waoOtSQdcB02xWB9gUA+KwlNUrHVj3NhetDNRllRtMgmH2JtHLbGT5ptrwLxUMD5rqHK
         XVqdeICoGu19jiFzhJ7hg6+ADc9dlc7stZgCH5JJPEtj8KB1EOmk7EAMFdM6hQvkvVnX
         Q9Fg==
X-Gm-Message-State: AOJu0YyVJ6J/orYDQKn6JiWNHZLyRImEMF5emxpVzWs/uQi7rTFlir+T
	GSOSIlz6437AFSPU/OLQPllXlbTaWXk4HPzGWQyoVZ28YezCUfoyBcls6y/Xwg==
X-Gm-Gg: ASbGnctXYUFW8WGpiErAf6ETBe6iRFecb5sTyAo2eT5B9TO2wNjXQh9pPfpHKNbTKS4
	gTiSt95aakiScgvQqfbddWB2uA0iTwxNXK5rmlksdaXAzw4K5Qw/x+muYbwqGMSmgXNH3seaPDn
	zB8b1b1zPothh+KxxJ20+guPhnu8BEEa4bNgHSdb9Utnya/TF0WEsj3fTpi2CnGgsxqRF9lS1Rj
	A+DYw2bkCfzcJR5wTgU5EQXjf3t22huQgHBT90fOuzYF5bxx8fBA2D6yiyQ8cadA3q+AUD4owPV
	JzTtWbf8HfDNyj1cZH1Y1i5kjYdZx9LNT1YLkEd5Rwh7PBdmQTR7Q71jbpkEe5Ls1zJ+x9AIBjR
	toxs=
X-Google-Smtp-Source: AGHT+IFh7rod4VLiopNrrRx9x1fR3l/5IbitK00625UuT0JWMeRPvSxzNZpO3cdm74eCkQLsU6j9Yw==
X-Received: by 2002:a05:620a:f14:b0:7c2:2a54:8810 with SMTP id af79cd13be357-7c22a54882dmr1797565285a.23.1740579809599;
        Wed, 26 Feb 2025 06:23:29 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c23c33cfb0sm246336085a.103.2025.02.26.06.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:23:29 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 0/5] media: uvcvideo: Implement Granular Power Saving
Date: Wed, 26 Feb 2025 14:23:26 +0000
Message-Id: <20250226-uvc-granpower-ng-v4-0-3ec9be906048@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8jv2cC/33OSw6CMBCA4auQrq1ppw/QlfcwLugD6AJKWqkaw
 t0tJCbGEJf/JPPNzCja4GxE52JGwSYXnR9y8EOBdFcPrcXO5EZAgFMKEk9J4zbUw+gfNuChxUS
 eaCVqaXjJUV4bg23ccyOvt9ydi3cfXtuFRNfpHyxRTLBkFFQDUvCTvugu+N5N/dGHFq1ego8hC
 BC2Y0A2lG24EsKWSpY7Bvs29v5g2WBgiCkV0cJUP8ayLG8HaNxqOwEAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.1

Right now we power-up the device when a user open() the device and we
power it off when the last user close() the first video node.

This behaviour affects the power consumption of the device is multiple
use cases, such as:
- Polling the privacy gpio
- udev probing the device

This patchset introduces a more granular power saving behaviour where
the camera is only awaken when needed. It is compatible with
asynchronous controls.

While developing this patchset, two bugs were found. The patchset has
been developed so these fixes can be taken independently.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
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

 drivers/media/usb/uvc/uvc_ctrl.c | 13 +++++-
 drivers/media/usb/uvc/uvc_v4l2.c | 99 ++++++++++++++++++++++++++++++----------
 drivers/media/usb/uvc/uvcvideo.h |  6 +++
 3 files changed, 92 insertions(+), 26 deletions(-)
---
base-commit: d98e9213a768a3cc3a99f5e1abe09ad3baff2104
change-id: 20241126-uvc-granpower-ng-069185a6d474

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


