Return-Path: <linux-media+bounces-37038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF4AAFBAC8
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 20:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B98787AC8D4
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 18:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFC82727E8;
	Mon,  7 Jul 2025 18:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X1a4akaD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D942652AE
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 18:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751913246; cv=none; b=J2vV5G4qntLMNKKgPRbOBN4tADAm51yUEBA8XUSKlOfKAn8tM8OuVfTH4NBiYC8piZf64x+4Tqzbb1pCPbO2z1L/WhOKXzcSJ2XcXy26jJO+kpPOscGs3PiINynWE3Uk06WofVmS8N/gHS+0d/wCv9hy2k3riBJzQm6ME4mJUqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751913246; c=relaxed/simple;
	bh=8K+GjBl/FE9E58iFy0BSlb50AFIZ1lCSp8aNhG9rQUA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wvn/ME2j7OMUj/TIZtGK1kYDxvN/se6ygHdF3+pZuJLHR4poeSvxmcnPWkc6Y+AIhx0ObyYTDDF1O+YTPUr4Xno4mnhSrL3bCnZPIKYeQ85jNBmX8f03c4OE5K4rie8RYHeAbtCjMXB09bnLhvDWUhcq6uxkLMJUxiEqxzUYb1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X1a4akaD; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32f1763673cso28033561fa.3
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 11:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751913242; x=1752518042; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GI3mp7khiC3aiN54V1s1kSnePibHGblj0uNsT4N64ys=;
        b=X1a4akaDudcpWGG6x3wdASzM2j0EkRw1PXvxGw8Y1XeoVH0rXperSPOG8bHV5J5uQh
         cuoWkX7ZU1mPjcjP2HJCCWUMpKaqzdr0CSYO+fS3CvVBS7ECxz51e5s2y3DIzUILS4Y7
         iIZa1W43MYuzEI2J0qEiPCD8lPYFh+/38HYEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751913242; x=1752518042;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GI3mp7khiC3aiN54V1s1kSnePibHGblj0uNsT4N64ys=;
        b=CYit0EBqyN8rZquK3ijjr5JPrhuWP5dk5rbIcD5AxAS7TPILHc0wwJ+iXIEALBLzIg
         nZ5jkI3yviZS4pgusxrnNSyz/lHyzB/M6Cv5U5Z4ClJntSKo7cE47flNlIHWogkAhpyv
         F/cv1fcLTo04+7/NrvFYDqHznshhc0kX6NJXBL+m0UULS5YSrJbCCWc/pfL3P4X9G14Y
         HI/ldNQuw9BlT5GgDYEqER0sbbKqO15ROvonsqo5wI9mrBIr+cPpP2oYcM9JqBsnrbdv
         T+03GiSVpaiqBymCs8mro38zHf3GIX5m4z6fKQmYaJeGGsCycB0QwCG9cyQmYOlIVrfl
         oeAw==
X-Gm-Message-State: AOJu0YwAEPKYeoY12RhIKEkyPtkMo+HLjkkyRDBHX/UbA7DvRulmp+DW
	tcfUrIdLIDt9ryj9cPiumYl8rlPF06xB7KtgFcrwjg5q9CYRhU/dn0xE+X6GqnyHtg==
X-Gm-Gg: ASbGncsViJoqav3uecf9EOEpFaDfilgIOm+88OqGSqV6NvK6qc7meJRppkoFXZwfADq
	Jr41Yl9wrNzJARV4S3FsKzgH1XyGx8pWjY7u6u3tcfLrhHR+HeSbBtIH3c2fkxCq5401eKLGdgR
	M6OHu2zdaILJII2LfoqZrRo0QJlSQI2Bv0aOiWaTLUd2ueH8EYZxeIQ+G9xpUBJhoADP0LQTdVJ
	I6U+PdAbDQ92ZoNrpSijSImNPsjae8pNH+JVIJSL1VtzRRtTfmhZ7YlfF2pOKRplPw7OVjlrlEZ
	VXPEpjBR5kBgDe9agR/U9Ch8TwNMDLdY9MI2pezCKERwWW1RIcyplGLbyOEYplg+oEZPY3gjvGL
	ekcs8cKcjfwifcyLWfzrGWVgEmkZDffJOzaBYpmiYd9HNWgXRQ2q2
X-Google-Smtp-Source: AGHT+IEZCncGnL0Aldaey4MgBeMqfZh2uyJKivyRIHEvg5ihpDRPGtDR+uZRcmp1UvTuk7T00/T0hA==
X-Received: by 2002:a05:6512:2c8f:b0:549:5866:6489 with SMTP id 2adb3069b0e04-557aad3a2ecmr3691237e87.47.1751913242430;
        Mon, 07 Jul 2025 11:34:02 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d31a6sm1417630e87.61.2025.07.07.11.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 11:34:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v8 0/5] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5 + other meta fixes
Date: Mon, 07 Jul 2025 18:34:00 +0000
Message-Id: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABgTbGgC/23MQQ6CMBCF4auYrq0pQ9sBV97DuGjKAF0ApoVGQ
 7i7hY1oWL7JfP/MAnlHgV1PM/MUXXBDn0ZxPjHbmr4h7qq0GQhQQoqcT9HyjkbDSSmNmFcZGGL
 p/empdq8tdX+k3bowDv69laNcrweRKLngBaIxWqIqUd1s64fOTd1l8A1bO1HtrdxZlWyNZYmyt
 lCBOLD6a/WP1cliJrNKFjYHsAcWdzbDncVkS5uukBNAof/ssiwfeRSDvFcBAAA=
X-Change-ID: 20250403-uvc-meta-e556773d12ae
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hansg@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

This series introduces a new metadata format for UVC cameras and adds a
couple of improvements to the UVC metadata handling.

The new metadata format can be enabled in runtime with quirks.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v8:
- Dynamically fill dev->meta_formats instead of be const.
- Link to v7: https://lore.kernel.org/r/20250617-uvc-meta-v7-0-9c50623e2286@chromium.org

Changes in v7:
- Add patch: Introduce dev->meta_formats
- Link to v6: https://lore.kernel.org/r/20250604-uvc-meta-v6-0-7141d48c322c@chromium.org

Changes in v6 (Thanks Laurent):
- Fix typo in metafmt-uvc.rst
- Improve metafmt-uvc-msxu-1-5.rst
- uvc_meta_v4l2_try_format() block MSXU format unless the quirk is
  active
- Refactor uvc_enable_msxu
- Document uvc_meta_detect_msxu
- Rebase series
- Add R-b
- Link to v5: https://lore.kernel.org/r/20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org

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
- Introduce V4L2_META_FMT_UVC_CUSTOM (thanks HdG!).
- Link to v1: https://lore.kernel.org/r/20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org

---
Ricardo Ribalda (5):
      media: uvcvideo: Do not mark valid metadata as invalid
      media: Documentation: Add note about UVCH length field
      media: uvcvideo: Introduce dev->meta_formats
      media: uvcvideo: Introduce V4L2_META_FMT_UVC_MSXU_1_5
      media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META

 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 .../media/v4l/metafmt-uvc-msxu-1-5.rst             |  23 +++++
 .../userspace-api/media/v4l/metafmt-uvc.rst        |   4 +-
 MAINTAINERS                                        |   1 +
 drivers/media/usb/uvc/uvc_driver.c                 |   7 ++
 drivers/media/usb/uvc/uvc_metadata.c               | 115 +++++++++++++++++++--
 drivers/media/usb/uvc/uvc_video.c                  |  12 +--
 drivers/media/usb/uvc/uvcvideo.h                   |   7 ++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 include/linux/usb/uvc.h                            |   3 +
 include/uapi/linux/videodev2.h                     |   1 +
 11 files changed, 161 insertions(+), 14 deletions(-)
---
base-commit: a8598c7de1bcd94461ca54c972efa9b4ea501fb9
change-id: 20250403-uvc-meta-e556773d12ae

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


