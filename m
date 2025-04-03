Return-Path: <linux-media+bounces-29354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8E6A7B180
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 23:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09C99175A2E
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 21:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6701F9AAB;
	Thu,  3 Apr 2025 21:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B5vuQkS/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8672A19D07A
	for <linux-media@vger.kernel.org>; Thu,  3 Apr 2025 21:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715890; cv=none; b=bEkLsnITR42/QFMNMfAFV4p6edqVqhoCT01SHbWjlbE2VSB0wfM5kE40KtzZW+Ue9ZQZJ2wvQsmBPzQ81u8/5mdDhv+E7ib6U741y5xYNPZgTOFg3bYsXn8ZENVENdcR6OfscuhBkULHHDHLwrnCugFTu54gv3XXkNj5bj1SclI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715890; c=relaxed/simple;
	bh=wmH981GE7NB8avOxeQuOBjPEsDZkeKkAIkl4REbfjxM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UYQj2ncSNv++TQ/YTc6lGujP2qo4SeD8zuxUbNQewIBSSq1lYyqBwZoLQMisN33TF0+Sn/7W7syhzEv6gOfmQO7zDZoEbnLQuV/01nG6ZTgYr2kjftlz+wbwVJ9o5hsLoHwW9fvC6S5aT1IOMUAgEQGS+EDyYx5HnaKsZVv+EkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B5vuQkS/; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5499bd3084aso1247514e87.0
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 14:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743715886; x=1744320686; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hjSF7rIGuoGtaKvs9zxkuKyK56xOJ/Ay8l6UKNTY2Eo=;
        b=B5vuQkS/k/MYI4QvGeEVjT6XEvXOwnP4U5bJoMT3krrQ9O8CpXybI2JDfxZmWGlHjB
         sVR7k1tvrdcj3PzTJ/dNVugZ3eK1dyhBD5DYH1HtDeToYoEjXrOjVc+UlOVhNqbSks7u
         zY90pL0SXAxeS+V+Xv/qXn0+mriP7ylXLy5F4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743715886; x=1744320686;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjSF7rIGuoGtaKvs9zxkuKyK56xOJ/Ay8l6UKNTY2Eo=;
        b=NFMZwEUQYLw9WHE0MUVn1u6CYEuuSgkHhzRj2C0o/lDtIvmiZRh1NPIzfm2sEvaho9
         TyHsZYuvNmxm/HBOE1kFH204JX7nc4ixflAlDwspPVQNlwWCCmhmc29Q0atUKZ54UgUl
         qIGO4LyP4zXkNgdpZ8hkur2JAYT1edQLItz8HtF+vlSbT3Bk06usWpy1NoYXsfNJA83X
         95HT1GjYMGOnxs0QafZiq1GechFcuIbyPQ3YcmO4QbnsGbttPeELqXavwkBDxxlL6W2p
         MlH+QT1gLrUm5CueBhiBdXbt1C57bGEn5D0CFu8JLavKUzlD910XTHTV68Pg1br9O+5G
         Z2bQ==
X-Gm-Message-State: AOJu0YxxbfEwi854/w4RAOIEyNeJfptn+x2IDr+/OgfnILF5GUmiHGaA
	cO/8JO+BkXx1AgwKWQ1dVBlXub2F9PEiFBQFewHAu8ky7GMy33d/9WABKrma5A==
X-Gm-Gg: ASbGncs7bn8Q78/qgHrYkaMKBY9cLGSxbVumH2d557kZzJdUKjG62a+2/CqpYDqUZxI
	GfxLCxIJv/h6U8qWecd+LVWcn20IlBahHysdWp8gLn3Py8iWhWfGfZ/x7HTVxx2DQL/qBc9ct5s
	gcLkw18FLnv+QJYvkEGQmkRmsu2rPZ8DV/JAzVEPhnQq93GDZu5iOJlSV33Thu6+dU/ZsshuExq
	l0A6M3tzW6wiTcgCMUIU0kpFWOc5d/VSoMrz6ZT9n4Mi3bsOuNnkbOtYpwKEWlfb7Wd6G8qwE30
	ezbxCkT/hStm7fk0o5BBn9Yu1IFTt9FbO/GvYeT6Jad+oLOY0QgZUu5pmpp0tfkqEF5LxdP3Aws
	a5qSVvqsnQi5s6YSZ3QUiSAqd
X-Google-Smtp-Source: AGHT+IFGh41JyNQ0kY4SKRyKQPfhOBTc1Kd5OKVwu4LAE7c7CdYOFKWYEFFOQUbjdl57cF/YjkaUvQ==
X-Received: by 2002:a05:6512:334e:b0:549:8963:eb05 with SMTP id 2adb3069b0e04-54c227dd3ddmr150486e87.37.1743715886542;
        Thu, 03 Apr 2025 14:31:26 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6d5sm252938e87.181.2025.04.03.14.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 14:31:25 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 0/4] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5 + other meta fixes
Date: Thu, 03 Apr 2025 21:31:23 +0000
Message-Id: <20250403-uvc-meta-v4-0-877aa6475975@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACv+7mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDI1MDEwNj3dKyZN3c1JJE3VRTUzNzc+MUQ6PEVCWg8oKi1LTMCrBR0bG1tQD
 z0bzRWgAAAA==
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
 .../media/v4l/metafmt-uvc-msxu-1-5.rst             | 23 ++++++
 .../userspace-api/media/v4l/metafmt-uvc.rst        |  4 +-
 MAINTAINERS                                        |  1 +
 drivers/media/usb/uvc/uvc_metadata.c               | 96 ++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_video.c                  | 12 +--
 drivers/media/usb/uvc/uvcvideo.h                   |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 include/linux/usb/uvc.h                            |  3 +
 include/uapi/linux/videodev2.h                     |  1 +
 10 files changed, 130 insertions(+), 13 deletions(-)
---
base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
change-id: 20250403-uvc-meta-e556773d12ae

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


