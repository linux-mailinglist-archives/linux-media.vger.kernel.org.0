Return-Path: <linux-media+bounces-22566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2689E2DF2
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 22:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8CB9163905
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 21:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBAB820A5DA;
	Tue,  3 Dec 2024 21:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UaTaLJ3y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79F31D7E21
	for <linux-media@vger.kernel.org>; Tue,  3 Dec 2024 21:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733260819; cv=none; b=mULA2TyUvBDeLbTfDuiVwNrgcQvEEIammkZu5ypxIQ9umPGSHaiqH6cJczMdfWUvN2EuARcAaBjvW19lpF+zpDLyfWQaY+44e1IR6vfoCoz1MLVAflFU6/3bg19N7XknmiP8uUYYzSFTkzv3se23ruGz5J2XPUVRhVHNMfsSAkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733260819; c=relaxed/simple;
	bh=yiWDnaKGAQEWPrsfioXG/kObvCMvGeal7SEo5lhjLR4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R8iQBPKmaVmdzx5GTVLWn9FcKfAVc84HQKfq5TZFo5hbN1Sc6maKap0+kPVXKM9y+J+sXHZr3eHbMOJBLarhXx1YeiygLYXwbdPj5vHceurmm3x00hK+uxYeSi1RkRzeOhQMQhsyqs4x7wddAfDK+fo+MNPrfp+N7wEO7x8ayVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UaTaLJ3y; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5f1dc7c6c67so2006840eaf.2
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2024 13:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733260817; x=1733865617; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uUqstwO6CPdmwqX+lS/TVSPD1mImadQ02+TDMxhYNVY=;
        b=UaTaLJ3yKVdZtfZDQV3rJNRFw/oMdFed8PoD75MW+FXE4eDEo58bgf5TBrLWaE/8ei
         24FIxKOl6amFASh7hMzgcjfuS1OVwE2lpP1UrBkmi2VqmEKfc9XbSZzJIoYbo6bvNgaz
         srJhf3D2dwbxowyk9e0E+CX6Ks4nN0W1JNEuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733260817; x=1733865617;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUqstwO6CPdmwqX+lS/TVSPD1mImadQ02+TDMxhYNVY=;
        b=iUHdgkErFMdnrizz8EQSqEN8ll2M4f1ZPoK8vFPOzrz0pFqyQR3XY5AxyrvThroqCz
         yKC8wCuCNexmAGzDWDnXoqfiiYyv/g1NBYDKEwrGUhALim5fOtCdFMcsPUL/diZoi21T
         EEJdlki/LuK0b4whwDA9PiehsniIuaHRvVdlhBJSTrxBChSq6qge30CHK94wYPs3mLTS
         +vrGDZw1/MkPbAFyk+4LOM799NG0RPpRrMzGH1AUldd4y4Y5SqHx0n2oo8Nu5rRB/avX
         QDp0WUBd02A/FdFDBz9SBfJ26Y+ioZoA5rrLg1+hnBn9M24q6nhsz4v9WikI+b6+V6a0
         5uUA==
X-Forwarded-Encrypted: i=1; AJvYcCWvD7XjcXPHN8E0NoipRIODLkgC+p4N1Ae7+I+l2H0RwnYkiii5qM8iT1lFI4/s+f/AmCHvPiZj1xTKNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ffUp89aT6NWy7g/RRcNAd1IdHffp8Hn1yFTBUnMWsbVyU+LY
	LtT9OaOM59PVVz6J1Fsh8Yx/VTcUDiNVXaiZLdBjJH2GLcNx6puX1dM4HOx5yw==
X-Gm-Gg: ASbGncv+uWt3i/MabnZk+BQMIVvjIyZYpnykWQU72Z07Du7DnVf/dQxSL0rwPwTgMkT
	Ydzp2n2HwYsbGyzsUzCyuMOeZUWEiCzx0r+ej62EpCjA7fCAv7m++A4ugyxseku1vwRSx4mw6Sd
	PNJ6PwugtXNr6EcFQDCbUhGfo4xxRU06NPIpx9FwF1z41JIoGzlORKk9kEC/sLy43rS3LxmYm+b
	DCqLD0t8VnwKkOsx7YOnY8+OiSbw3wwVR3IP5Ap9fw1DyRwuiNpAqL8ThzMLIvVqHprlw+NgKmN
	qhlMtLg4q55hWTg2f3MDenFP
X-Google-Smtp-Source: AGHT+IFnyLClwQKx37V6c/n+dQbcqXTB6MUoxPxvurt9+oxmPu3dvp2pF9OjaExGvkUIISSviNv1Sw==
X-Received: by 2002:a05:6358:310f:b0:1c3:98de:facf with SMTP id e5c5f4694b2df-1caeaaba9a2mr420928655d.13.1733260816848;
        Tue, 03 Dec 2024 13:20:16 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b82a89d5csm2140364241.8.2024.12.03.13.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 13:20:15 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 0/5] media: uvcvideo: Two +1 fixes for async controls
Date: Tue, 03 Dec 2024 21:20:07 +0000
Message-Id: <20241203-uvc-fix-async-v6-0-26c867231118@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAh2T2cC/33MO27DMAyA4asEmqtCpJ7u1HsUHfRyrCF2IDVCg
 8B3L5OlheFmIfCT4HdjLdeSG3s73FjNvbSyzBTm5cDi5Odj5iVRMxSoANDyS498LN/ct+scOcY
 hKaFA+uQY/ZxrpuPD+/iknkr7Wur1wXe4b/+TOnDBc3AWUUsILr7HqS6ncjm9LvXI7ljHpwASo
 EF4HwZtRUo7gPwLDFtAEuCDsTpmY1KwO4B6CigCRpTWqRS8E+MOoH8BGltAE2CMdhHGLAHDBlj
 X9QdU6pzssQEAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

This patchset fixes two +1 bugs with the async controls for the uvc driver.

They were found while implementing the granular PM, but I am sending
them as a separate patches, so they can be reviewed sooner. They fix
real issues in the driver that need to be taken care.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v6:
- Swap order of patches
- Use uvc_ctrl_set_handle again
- Move loaded=0 to uvc_ctrl_status_event()
- Link to v5: https://lore.kernel.org/r/20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org

Changes in v5:
- Move set handle to the entity_commit
- Replace uvc_ctrl_set_handle with get/put_handle.
- Add a patch to flush the cache of async controls.
- Link to v4: https://lore.kernel.org/r/20241129-uvc-fix-async-v4-0-f23784dba80f@chromium.org

Changes in v4:
- Fix implementation of uvc_ctrl_set_handle.
- Link to v3: https://lore.kernel.org/r/20241129-uvc-fix-async-v3-0-ab675ce66db7@chromium.org

Changes in v3:
- change again! order of patches.
- Introduce uvc_ctrl_set_handle.
- Do not change ctrl->handle if it is not NULL.

Changes in v2:
- Annotate lockdep
- ctrl->handle != handle
- Change order of patches
- Move documentation of mutex
- Link to v1: https://lore.kernel.org/r/20241127-uvc-fix-async-v1-0-eb8722531b8c@chromium.org

---
Ricardo Ribalda (5):
      media: uvcvideo: Only save async fh if success
      media: uvcvideo: Remove redundant NULL assignment
      media: uvcvideo: Remove dangling pointers
      media: uvcvideo: Annotate lock requirements for uvc_ctrl_set
      media: uvcvideo: Flush the control cache when we get an event

 drivers/media/usb/uvc/uvc_ctrl.c | 83 ++++++++++++++++++++++++++++++++++------
 drivers/media/usb/uvc/uvc_v4l2.c |  2 +
 drivers/media/usb/uvc/uvcvideo.h |  9 ++++-
 3 files changed, 82 insertions(+), 12 deletions(-)
---
base-commit: 291a8d98186f0a704cb954855d2ae3233971f07d
change-id: 20241127-uvc-fix-async-2c9d40413ad8

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


