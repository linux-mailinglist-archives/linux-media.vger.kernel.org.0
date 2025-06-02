Return-Path: <linux-media+bounces-33907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7B1ACAE86
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C5883AE7E0
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4C121C19B;
	Mon,  2 Jun 2025 13:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EQzFupVg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F0942A92
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 13:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869581; cv=none; b=HKyJMN49Od0wNLkZ54P85jpnTmKuOXe8eudnpwYD/ENZZygwCmN23DNQ3nQBDtPr6X0Jji5iIK525X8kD69ul+OM2QukP2am6/SMhVK4RS1tGfdh6YOtioG3wQTzjZSLmorhhnsUcdgXgE3LKi5ge7GJlrcJhacDS75hldw1wOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869581; c=relaxed/simple;
	bh=YjwDw5Dg5h3IS7aOLbbJcHTFYc+Cn/5+FgNseRUWlV8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L0HuRN/H9wz1Zl+b3L0NGjD3dW+xigbCIsv3I5T28KZyWBRp2x3Pb3QT+z/vARJHKrkyaEa0Xn8JQfE4F0pkR7R75fxAu0bhlbL85MVn4/fF458QeX0ZoD8DsiCGMd/eRwGIKBAH9ilK+vWU6MrFeIFuv96P9UosFe6VvdJEmdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EQzFupVg; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b10594812so5328840e87.1
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 06:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869577; x=1749474377; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wYdIj1JHXrltKCsXIaqKuGXb+KSTjSklYpchtb4ThlI=;
        b=EQzFupVgV9+Hdi5tzMfE4ag1COG53AXGcgKGeCNDXUakPfONqoKymduk5FnWDUnZkA
         L4zXNUwxZVaw5j5yPNrEru4n9gK4SWeUYuE+dLGNeARabtGArqkTLpYpThucb1VdXJsi
         blSH+SjqZ2JCjua/Y8jt6bwBPAYa6mbqAZDJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869577; x=1749474377;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYdIj1JHXrltKCsXIaqKuGXb+KSTjSklYpchtb4ThlI=;
        b=d5lOtCGdH5LITnZGOImdakN27ZNCkPchNOnEFRJafXBWkL/TnNozbY9bNuwb9IQ+v3
         EfwaEHdSxJFgxQLxmQ8nLvgWZ9/ogy9p6esGWILi4W+PWi2GRRaZJaEvuWx3XG7j+b2u
         2t5zirHFqhUhu6u9GruC9Giiok1UtalcZD5KQZ0gCNM9cGa/MpCjonVMVqdRYD4BhBBV
         gQOgTFM4lYq44JnrG3CkTzrD1mG+WpsqEHtRVSpbd4hYKn2Xg/bw8pB8qJUcSNrkQtvw
         9YdL+q/3CaNeAON7m2LD8Ay+5JbEgFlR11wm2me7aV6A5ur15yNI4emvwtZJatV6R+jE
         qdwA==
X-Gm-Message-State: AOJu0YzztVvfN+hQfg7/iJOm0cTnGxXABRs9D7xhCatPszwAHoLg7RUi
	rVqViul8RjvKdMizMsHNgTFmcW2EpEorgt10lsGfhjkX/u2Muso9DdandmFMxHX1OA==
X-Gm-Gg: ASbGnctBC5VI5UzWndE6HdQF6h/A/dgmwZlrIT7Y+nD3duviP60pmzH0ViK2tEbTIKb
	YoxITShVlH54HSlD8j9BM6+X5kGsYA6MpOlFXhZ1jYlFU+6QHn6r7Fidu4XJ48Y0mI38bvg5gjP
	mOcH5EHuWZoCjE5sjQAWaUhH41WxHDvLCZ2M7NiZllVD8qmB9iPFMaVlmIXMMiNrlOQqkKqJjUc
	2cddTz96h7sRWWAIV1O8Mjse6hJnPdYEdfSOqaGhW7QKM9PHdgl3ci7qw4LANMYtraVarHHiawT
	JK6/s2Uuec1+dcJoOg5W8GyoydGrsEWSULrzJzCn4clU/yKoaN4R/+KpmazU2BR+6TfNIxTtWcN
	v3QkZz78M4kGe8LC6HaDD+HMokA==
X-Google-Smtp-Source: AGHT+IHzdiYmRvKi9DTg5saWyBpGd8AvTFyUfEM2bxHJLynZbkqRb8Qsu0kgCMO4IGCXxQvzZApMzg==
X-Received: by 2002:a05:6512:b95:b0:553:32f3:7ec4 with SMTP id 2adb3069b0e04-55342f927abmr1729925e87.29.1748869576794;
        Mon, 02 Jun 2025 06:06:16 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d26esm1590160e87.41.2025.06.02.06.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:06:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/9] media: uvcvideo: Invert granular PM logic + PM fix
Date: Mon, 02 Jun 2025 13:06:12 +0000
Message-Id: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMShPWgC/4WNQQqDMBBFryKz7pQkNmC66j3ERYhRB2pSJia0i
 Hdv6gW6fA/++zskz+QT3Jsd2BdKFEMFdWnALTbMHmmsDEooLbTqMBeHM9sQ8tMyUiieN5TGju3
 NadMaCXX6Yj/R+8z2Q+WF0hb5c74U+bN/gkWiwFFI3cnJOKf0wy0cV8rrNfIMw3EcX72H4TO7A
 AAA
X-Change-ID: 20250528-uvc-grannular-invert-19ad34c59391
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hans@jjverkuil.nl>, 
 Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

It makes more sense to have a list of the ioctls that need power than
the other way around. This patchset takes care of this.

It also fixes one error in the PM logic introduced in a recent patchset.

To support CI I have included two patches that are in uvc/next but not
in media-committer:
media: uvcvideo: Refactor uvc_queue_streamon
media: uvcvideo: Refactor uvc_v4l2_compat_ioctl32
Do not review them again.

To avoid conflicts I am adding the fop patchset as well:
media: uvcvideo: Use vb2 ioctl and fop helpers
media: uvcvideo: Remove stream->is_streaming field
Please review them in https://patchwork.linuxtv.org/project/linux-media/list/?series=15664

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2. Thanks HdG:
- Rebase fop
- CodeStyle
- Refactor SEND_INITIAL to avoid lis_del()
- Squash "invert PM logic" and "unless is needed"
- Link to v1: https://lore.kernel.org/r/20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org

---
Hans Verkuil (1):
      media: uvcvideo: Use vb2 ioctl and fop helpers

Ricardo Ribalda (8):
      media: uvcvideo: Refactor uvc_queue_streamon
      media: uvcvideo: Refactor uvc_v4l2_compat_ioctl32
      media: uvcvideo: Remove stream->is_streaming field
      media: uvcvideo: Turn on the camera if V4L2_EVENT_SUB_FL_SEND_INITIAL
      media: uvcvideo: Do not enable camera during UVCIOC_CTRL_MAP*
      media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert PM logic
      media: core: export v4l2_compat_translate_cmd()
      media: uvcvideo: Support granular power saving for compat syscalls

 drivers/media/usb/uvc/uvc_ctrl.c              |   8 +-
 drivers/media/usb/uvc/uvc_driver.c            |  34 +--
 drivers/media/usb/uvc/uvc_metadata.c          |   8 +-
 drivers/media/usb/uvc/uvc_queue.c             | 154 +----------
 drivers/media/usb/uvc/uvc_v4l2.c              | 367 +++++---------------------
 drivers/media/usb/uvc/uvcvideo.h              |  38 +--
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |   1 +
 7 files changed, 87 insertions(+), 523 deletions(-)
---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20250528-uvc-grannular-invert-19ad34c59391

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


