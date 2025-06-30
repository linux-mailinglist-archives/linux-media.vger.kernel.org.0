Return-Path: <linux-media+bounces-36305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B6EAEE07B
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 16:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E93C189DFFD
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 14:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2911328C2BC;
	Mon, 30 Jun 2025 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YWJlR7E1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2BC283C9F
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 14:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293231; cv=none; b=Rf8MumEAhPoyaJ7VUr4kiuudYWGBF3txA/cM/TiSn3O5I75JerjdDP0bBAPnaYlO003NjS3RlzTDiDmUroT7jGqXq0cbHW63wtyOHsLINdJgzQrQorgG0gtaw/QZ71b7aTRGBps7LCjU0sTzidNJhN5X0BJaO0u0UIixBm0jU9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293231; c=relaxed/simple;
	bh=OafmBIcOTF47LRhSiURHmAtXcB8tK+H+W9mG9qIszg4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r7vL/TzCB5vO+Mhge3wpdaIXGHLzA2BjjLm5hPWHApWqp1rFRfKADnnkbyvsTghd3SNjPPmDSBcLv/EHDoL6XkPCCnCsspvjgOD1XyyIbZGX6fxgRNWYsz1yf5Jk3Gr09U7/OVO6H+ihSFiskhsraf0giBGKA9G4Ok19iI+YwwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YWJlR7E1; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b544e7b4so2203739e87.3
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 07:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751293228; x=1751898028; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C7qo43JiUv9pfOvnEmucu4vwD92N40JPzjyRBFKlC38=;
        b=YWJlR7E1JyQip78iNTgadjgmC1u0Vr2nP8MhCL339s4Ht25wytDe7K69vI/jNFsE9F
         yRvWaTU/rmP9AUtRc9/JsxoC/+rmOiDL/bzW8kRalZ/qv2zSsdwLVd3Ou7yYcK1IXNYq
         TpOGN96MQTNeEm09D+rlmx51dMjBeoF/xMUn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293228; x=1751898028;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7qo43JiUv9pfOvnEmucu4vwD92N40JPzjyRBFKlC38=;
        b=th1Zcn373OKn0BeJ5bt/WOvFM80I6oYS4C8vQuHJ6Z+NemrY1vSS+8pG+6YQwShdqW
         DCoX8MQPHbcPsPRueJG5FMqDA+3DMmQQz14Pe8hl4hvCPHhLERH4oZBJpaY+cTxv63tv
         eMUjlRUeOwx/gZV+QeBZuOXB8X2yMtkMFgwDYDl4t7zTTpY6oMtr4krN7Zj4F/r3qhP6
         6VLOOgGit9VjXZ+M9HL9JAgsTBZfVftVsX6PYrmPIe0zgTtt/s4a2cIzjGVgkDKqpDUZ
         0UgC7DOKxdXTqmRpElGQ+2A5kxCSzfrIib3iQbNAEyhzaCMjBHponqYOKZikXr6QQ3EB
         3i/w==
X-Gm-Message-State: AOJu0Yx549pImQCb19/Az+SF3Y3j+ytgGQsGjS6R09fIvsh+Z4t2rbN1
	27nqRlPiUMD2n/iOuZU/ugvdRWuvlH8rf3JF5imfcwzbMmsIW/JuSdrTQJsSYt7kJstqPD5wQt4
	WBdEedQ==
X-Gm-Gg: ASbGncs0+28heH2isnzJGPuokXvbvLJ38Jlzm4AmJnQPfRk90yvJwBvr+l0JttHLWcn
	DbX5GMVs+xyrC/KZ9xct98UclFEdmkMFyPJtpyVxvB0/YpqZO4sHXMCt4pJ4c2dh61QZ99XX9za
	fuCEQYj23EXtQ+8C++9htTFdDf+q5wQAdn8q05/KrND96zGkx95sSQZ/fi56x1YMaLp5UoguAfd
	xtEjfa2NMg0E1CgR1hbStDQ/fGbB1eg325+O5jefdLhLPCVErIj/zeS/r0MWFANcIp15XjVyDNE
	ZGINtLme5uIqVQx3tIerVNjUwMaViZKfhNHhh6fQc0Eb6kjmTpgumra09aGeg3OOEcmVXejRrEO
	fLokk/BVfeW9aupxfSU7UiS3B6ntKOoLjtHTP+GmXTw==
X-Google-Smtp-Source: AGHT+IFjUPnnIKIepFsVN49yk2JqozD2vxKepCaQ0GoGH+mEklLWPTsXJ5Iglvrd61PZzLFUVGZmVQ==
X-Received: by 2002:a05:6512:3d2a:b0:553:2ef3:f73d with SMTP id 2adb3069b0e04-5550b82effcmr4220413e87.14.1751293227739;
        Mon, 30 Jun 2025 07:20:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d8ea8sm1432363e87.210.2025.06.30.07.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:20:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/8] media: uvcvideo: Invert granular PM logic + PM fix
Date: Mon, 30 Jun 2025 14:20:25 +0000
Message-Id: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACqdYmgC/4XNTQrCMBCG4atI1kby02jiynuIi5Ck7YBNZNIGp
 fTupt0Igrh8P5hnZpIDQsjkvJsJhgIZUqwh9zviehu7QMHXJoIJxZTQdCqOdmhjnO4WKcQScKT
 cWC8bp4w0nNTTB4YWnht7vdXuIY8JX9uXwtf1D1g4ZdQzrjRvjXNCXVyPaYBpOCTsyGoW8XGOT
 PxwRHWcPnEjG+u1Zl/OsixvMkNWRQMBAAA=
X-Change-ID: 20250528-uvc-grannular-invert-19ad34c59391
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hans@jjverkuil.nl>
X-Mailer: b4 0.14.2

It makes more sense to have a list of the ioctls that need power than
the other way around. This patchset takes care of this.

It also fixes one error in the PM logic introduced in a recent patchset.

To support CI I have included patches that are in uvc/for-next but not
in media-committer:
media: uvcvideo: Remove stream->is_streaming field
media: uvcvideo: Split uvc_stop_streaming()
media: uvcvideo: Handle locks in uvc_queue_return_buffers
media: uvcvideo: Use vb2 ioctl and fop helpers
Do not review them again.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3:
- Rebase
- Merge Invert PM patch with add support for compat ioctls
- Export different core function
- Inline the pm_ioctl patch
- Fix typo in comment
- Link to v2: https://lore.kernel.org/r/20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org

Changes in v2. Thanks HdG:
- Rebase fop
- CodeStyle
- Refactor SEND_INITIAL to avoid lis_del()
- Squash "invert PM logic" and "unless is needed"
- Link to v1: https://lore.kernel.org/r/20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org

---
Hans Verkuil (1):
      media: uvcvideo: Use vb2 ioctl and fop helpers

Ricardo Ribalda (7):
      media: uvcvideo: Handle locks in uvc_queue_return_buffers
      media: uvcvideo: Split uvc_stop_streaming()
      media: uvcvideo: Remove stream->is_streaming field
      media: uvcvideo: Turn on the camera if V4L2_EVENT_SUB_FL_SEND_INITIAL
      media: uvcvideo: Do not enable camera during UVCIOC_CTRL_MAP*
      media: core: export v4l2_translate_cmd
      media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert PM logic

 drivers/media/usb/uvc/uvc_ctrl.c     |   8 +-
 drivers/media/usb/uvc/uvc_driver.c   |  37 +---
 drivers/media/usb/uvc/uvc_metadata.c |   8 +-
 drivers/media/usb/uvc/uvc_queue.c    | 199 +++++---------------
 drivers/media/usb/uvc/uvc_v4l2.c     | 356 +++++------------------------------
 drivers/media/usb/uvc/uvcvideo.h     |  37 +---
 drivers/media/v4l2-core/v4l2-ioctl.c |   5 +-
 include/media/v4l2-ioctl.h           |   1 +
 8 files changed, 115 insertions(+), 536 deletions(-)
---
base-commit: 35392e855abf7d02ad3b061cbc75c7c7c37f0577
change-id: 20250528-uvc-grannular-invert-19ad34c59391

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


