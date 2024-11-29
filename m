Return-Path: <linux-media+bounces-22360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 798819DEC57
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 20:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D8A9B20C29
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 19:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5749A1A262D;
	Fri, 29 Nov 2024 19:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nVj/79Bh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7764F1A0BE3
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 19:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732908311; cv=none; b=IuSCw/mTTOuW1+P4ZEOPNLY95ue202BnJFFQemM5aLwNsGRyZq0qE2w6SMmGlFhaMUDfX15rbmz01G/T/+ivvdKV3RORXToW/od7ZAmaVAvEAbdNCB5KBlDOIWT5qCsnt+BBjlAlrwONe29QNEAimCWndtElwADoAJcQpJT5vjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732908311; c=relaxed/simple;
	bh=d3jo76PXC/T9EhC8p7wrOR6nkhpDa7Ba6c51n5/cPbw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WMipEF/L3b46ifhDPBsyJgScJeCk9GYDYPA7vWO+o8NCX8QsHRmd1D+4aK4F5Qs91nDX20Ho/8Rrz3aIvws7WL38c0luC46OJgR805Zh3GcVEL7Cvh34qu4Ywqy1xOJRo7ZI/jpP+wvICLsHZd44h0UyJuFASJa12/Lu09Ud774=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nVj/79Bh; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d88c6d0fa3so3766166d6.2
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 11:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732908308; x=1733513108; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2P6kqxYG7hM9Q3T51ND+biicoWpc9nKwaL2ZX51qqtU=;
        b=nVj/79BhZOAjgaa9mcN9C/0rhbTz0TIk+YETGTCxjMf0R9dBzVoiyZ11Au2COMWwz/
         PCASjnVS9bZa3r90jbdV/3/Kl0zSGzlyddCbS8mzQEw7h/tsW8TtcubWnVk93X/Y8mL4
         Wws60iMpMF+j+1mDoLwfMbZmB6VCpTgFz8MTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732908308; x=1733513108;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2P6kqxYG7hM9Q3T51ND+biicoWpc9nKwaL2ZX51qqtU=;
        b=vKNpufPoFweCohvV2chtYmJIv1BcUoAxy6i7MjI+dFyTYPFei6/qk7N6zOd26SU4As
         92efT9yBROgIh7YgR/PJuxU4y69jeSXgkoo4O9vcFQwgZZM9+AZBlCGqSdnIHW8Ui8H2
         uhkSdDnar2vv86rX0kofVKOK+2/6ujnDtK27GZHevtTiSo1lEbVUbFkPqEk9kejRfIFh
         lV3AwjLWKTS44xocOSWa37lQqlrlFHzrfXU7zp1A/Cr+pusf/4KrYsUWSFWCbbIUxe+q
         UC2UO9+Lc6bqsFz37/wxGoK7C2GDfAhRAU15OV36EfxmSdd57K7q7zVHQu2c6KzwV6Jw
         rR8A==
X-Forwarded-Encrypted: i=1; AJvYcCVbnS1byD+MOKPAXLDSVX2BtYuTcyIii1fCGGLvyPchDYHnv2ZLEia8WA42gQvQEDZgybjZ4dN/g+3RDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgF3s7+TpwHxKBJpQ4QSGoVQygRDJZJo3DqOTHcIYbknvKEurq
	+ZbafKmGTJv3U10Kis3wdjlPTbmxzijNZ2uk6mzZUt/+luaiD/pLfiF9XxF8GQ==
X-Gm-Gg: ASbGncvjuF5LRHE6iPZxzhOeksZGAlL217vYjnWsUhxYMk6N/KyZxQxyXTZ6syGMWhI
	GvvzLCwsIBIk+qRsjOBKPvVEBSco0KLg36LMBNja0joIgE9w57w2y1Hk5WRvFupQWkpilsQLzSU
	KNWXi9wBnk1uSxwNykZkelesUGCOm6Wqh985vn6KktDZsDIQEPd27lGWcuO7N265Uxk6XgYKL2b
	8igjEKLqoed1GtPTBADj+oE/oEIRmponcZmCO84fv7eMCf1c9QEI8gd0hNb9uSPOM6FMw04O7T+
	PR7p8So+hsjIxlPVOMVVofSp
X-Google-Smtp-Source: AGHT+IF3hgYG3FdIyAGfBcYlUz8j+jglg5M77s2kJmvE8nmaEsoixoMlG1D63xrZAR1waGtasuM8rw==
X-Received: by 2002:a05:6214:20c6:b0:6d4:1dc0:2623 with SMTP id 6a1803df08f44-6d864dd30a1mr191445156d6.32.1732908308478;
        Fri, 29 Nov 2024 11:25:08 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d87d899ec2sm14462146d6.50.2024.11.29.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 11:25:07 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/4] media: uvcvideo: Two fixes for async controls
Date: Fri, 29 Nov 2024 19:25:01 +0000
Message-Id: <20241129-uvc-fix-async-v3-0-ab675ce66db7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA4VSmcC/33MQQ6CMBCF4auQWTumM4UArryHcVHaCl1ATSuNh
 HB3C0sTXf4zed8K0QZnI1yKFYJNLjo/5ZCnAvSgpt6iM7mBBZdEXOOcND7cG1VcJo2sW1OKkqQ
 yDeTNM9j8PLzbPffg4suH5eAT7ddfUiIUaLumZq4kdY2+6iH40c3j2YcedizxX4AzUJFQqmurW
 hjzBWzb9gF5L88m7gAAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

This patchset fixes two bugs with the async controls for the uvc driver.

They were found while implementing the granular PM, but I am sending
them as a separate patches, so they can be reviewed sooner. They fix
real issues in the driver that need to be taken care.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
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
Ricardo Ribalda (4):
      media: uvcvideo: Do not replace the handler of an async ctrl
      media: uvcvideo: Remove dangling pointers
      media: uvcvideo: Annotate lock requirements for uvc_ctrl_set
      media: uvcvideo: Remove redundant NULL assignment

 drivers/media/usb/uvc/uvc_ctrl.c | 52 +++++++++++++++++++++++++++++++++++-----
 drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
 drivers/media/usb/uvc/uvcvideo.h | 14 +++++++++--
 3 files changed, 60 insertions(+), 8 deletions(-)
---
base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
change-id: 20241127-uvc-fix-async-2c9d40413ad8

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


