Return-Path: <linux-media+bounces-36379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DA9AEEF1D
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 08:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D7BD16D499
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 06:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34272245014;
	Tue,  1 Jul 2025 06:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NOqvjnd2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC82372605
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 06:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352327; cv=none; b=uSIZoQVrsH6o1Eq8axu8eC+GRpY5MbK6pnWE0sGxGaSVQpLfhBDifpaKdb8kwtSKeoJQrA2Xuo8PUuqfjOsqqO9sykDaqKSXNYxYyPDw/XC+E52jCjcTcSZXhDmeXvQi8xkGkRK6FfPizplgDLp2HviGm1N9W5F0xAPedLainwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352327; c=relaxed/simple;
	bh=tOJOXRdK/ryHyP8Dn27ldM3nIhR+TjE6xNNG4EiYLzA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DWHl3tg0Z/U3L4kBLumUb57MjzhLi1IyLbiRq0LiTHxCsJdx3FtrrB4NPB47CDpbKkgARf+ZM0UOLFVXJaoLKEXlZNLoNd303pYvgt11lmbNW+fMfSnbblMyU/ph8vHNGUtZkfh3rF1FcGkDXWRLKMPJ8+Qa/LZ+ZB+3EWbJIC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NOqvjnd2; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553b82f3767so3280286e87.3
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 23:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751352324; x=1751957124; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=InMRKcJ50unLTb5CVsAxGeAjYB3oV9wwcmedmgo5w5M=;
        b=NOqvjnd2xKeqn0HHCBpAs2wg0gYUphcNZMNn4V7iOiKJvODTw/jhMe6Q0HEzA+AFS9
         nrW1SIrlG7TwhvUef9rJpkHA4jo0yEX76nn3FVGGLQ8BFkxE1l29HMsWv4n8Q8zLmk0D
         kL3BH/i4rAjoU6COikplRl/5rbW4JGxUILQ30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352324; x=1751957124;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InMRKcJ50unLTb5CVsAxGeAjYB3oV9wwcmedmgo5w5M=;
        b=G/W9IeUxoyfUBKmg8/5AT0iKvsXRG6UF3q3OIWLEgSUZRi246g6oj8o6044JSkUIx8
         XDA+GMn9iqckZjB9CK/ZFYmr3exuiIFJUdtKW/cUI9VRFt9+QBjSgkkoq99oIVahoMsy
         bjZvZ8w67gKR5Wuo+ny+J0VLlA0wCEMARFrEXyY/vdIpukp87hr8OhUmLQ+eWDTTVnEG
         /xO3SOP+Ewn+/VZSfkb0eSwluGXgTkqb6BvdTTZ+2HtE7LuKglaIkJzmlQ7OhHVJ9hW3
         w1sNt+8DrzhQ4IxpFZu0ouydGjSwJV+tIk7CQZIgfNwDlQmm7Z3xoEQ22Y73W4z9DYcG
         b36g==
X-Gm-Message-State: AOJu0YwH0yBM4CBF4mWifCne+K4+D6m5bEqIymZd/Bst/397kPAP4dmh
	HpKkXcTiURa1IOxqKcfJOMzIiPdnfSlekxUD4XZy2bFGjN6d87a3hKZ2J2MUClZryXYfV8G2RPh
	LDVe4fA==
X-Gm-Gg: ASbGncsd/e/Nux+T8JG0MArbgB8+8LjHZqVmbmeqnwCHDjzF+ewF1aGvl7M3XsduLk+
	9jsEpFlILEYmNBLBT3F225hRXy9ITr0s1JpJP0Nf/0UB8yn01NDBU5am3zL1kHk8of71GuX3ixD
	5oA/f1J5leks8xIGmhAxopl+nNz7mRpqXzQZPIHor0Vqb7t9Dqvvmrq3c9h3Bagoe68TVA/GS56
	zUuo/iW1Sc5mo7gs1CvrjLiRMQv/ndc61yyAIsnRTrUr1BKAcMbQF6vEXHSLx3GqKbvgYFdAUkr
	krVHxqB/nCM9JFTMRfCdYkRScB/BM0bV2WYnVYhfSFgIUpGJovNEsLpmUzBjEsTTSw2ajbF7lgD
	rVjYyVqy7VmYUHO9ESPK13q3XNjeDVkipS2SO94wZnIq1mCXL8D4L
X-Google-Smtp-Source: AGHT+IEwAUtBMHtxo7zLfmi7VRr95b7DWNnA3oYoEc2VN/wYz2whDToc5FnjOck0R8fPlmIA96OuAQ==
X-Received: by 2002:a05:6512:3e2a:b0:540:2fd2:6c87 with SMTP id 2adb3069b0e04-5550b87ca2dmr5835228e87.16.1751352323861;
        Mon, 30 Jun 2025 23:45:23 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1704836e87.248.2025.06.30.23.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:45:23 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 0/7] media: uvcvideo: Invert granular PM logic + PM fix
Date: Tue, 01 Jul 2025 06:45:12 +0000
Message-Id: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPiDY2gC/4XNTQrCMBCG4atI1kby02jiynuIi3SStgFNZdoGp
 fTupt0oYnH5fjDPjKTzGHxHjpuRoE+hC23MUWw3BBoba0+Dy00EE4opoemQgNZoYxyuFmmIyWN
 PubFOFqCMNJzk0zv6KjwW9nzJ3YSub/G5fEl8Xv+AiVNGHeNK88oACHWCBttbGG67Fmsym0m8n
 T0TK47IDugDN7KwTmv2w5EfjmQrjsyOLZ2CUkGhysOXM03TC2MEnxxLAQAA
X-Change-ID: 20250528-uvc-grannular-invert-19ad34c59391
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hans@jjverkuil.nl>, 
 Hans Verkuil <hans@hverkuil.nl>
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
Changes in v4:
- CTRL_MAP DO need the device powered. Thanks Laurent
- CodeStyle
- use EXPORT_SYMBOL_GPL
- Link to v3: https://lore.kernel.org/r/20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org

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

Ricardo Ribalda (6):
      media: uvcvideo: Handle locks in uvc_queue_return_buffers
      media: uvcvideo: Split uvc_stop_streaming()
      media: uvcvideo: Remove stream->is_streaming field
      media: uvcvideo: Turn on the camera if V4L2_EVENT_SUB_FL_SEND_INITIAL
      media: core: export v4l2_translate_cmd
      media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert PM logic

 drivers/media/usb/uvc/uvc_ctrl.c     |  10 +-
 drivers/media/usb/uvc/uvc_driver.c   |  37 +---
 drivers/media/usb/uvc/uvc_metadata.c |   8 +-
 drivers/media/usb/uvc/uvc_queue.c    | 199 +++++---------------
 drivers/media/usb/uvc/uvc_v4l2.c     | 345 +++++------------------------------
 drivers/media/usb/uvc/uvcvideo.h     |  37 +---
 drivers/media/v4l2-core/v4l2-ioctl.c |   5 +-
 include/media/v4l2-ioctl.h           |   1 +
 8 files changed, 112 insertions(+), 530 deletions(-)
---
base-commit: 35392e855abf7d02ad3b061cbc75c7c7c37f0577
change-id: 20250528-uvc-grannular-invert-19ad34c59391

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


