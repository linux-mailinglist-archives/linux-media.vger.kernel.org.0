Return-Path: <linux-media+bounces-35099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A98D2ADD05C
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 16:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48274401A43
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 14:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675A42E3B1B;
	Tue, 17 Jun 2025 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YYMzb4YF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C2525B1D2
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 14:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171357; cv=none; b=Mv2gWywbhnDB9i/5oIFwou4sFaVScHCDrGhAK6tqAbOLq5U59zDJuwRfYua9pdUgAk9O9wmpOBtvjfSh4fmRrHqEDfrXNfmDS+/XBUaTvsJ9Bv+3D4/3UHEJgUc2zal07iDU5tOw5xKThCDmIsLfPGaaTCQ/eZPt13zoIzWRlg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171357; c=relaxed/simple;
	bh=z9afmbfslk+OIL3RmqQEpk4yStHq/QO3InjB/6ZBCQs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oljqKnHRCL/DqUMuHSzSbS15jCZu7vKuLShIcoOh+7dCg8hzPwiOhZwO/kxDiA1xe6p876WUuLmaDuHht5/rhlGlw7EvYZaKNzmPIbQ2Oytanrsg4w1TjpCuPO8bSylNxBmrd/1YyHNIXvmDT1t0MH7badGcyWlKg2qSGkYaJT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YYMzb4YF; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55220699ba8so7137912e87.2
        for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 07:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750171353; x=1750776153; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O/YXd5BO13SOl3Wd39GbkaobYlJMrxTyr2XePxfsZP0=;
        b=YYMzb4YFDINse7/PlCSHx+l1y9ubnElFmL1qxaijzGP8+Ts4P4ObIGvV2KsYatrBlP
         fSz8/cKqRTJgInN20vsqwEemVm+ucyyvRR937hQMK5Tbrtr5VpyMfT+grqzM6yNE+VrI
         By8cJvu8nEaNzcqwMq6sHE3syIslnbS14Md44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171353; x=1750776153;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/YXd5BO13SOl3Wd39GbkaobYlJMrxTyr2XePxfsZP0=;
        b=aMYL+VI0kYhw9L/Du3yojYKo6VkxIABDF0pbuCxJZS+Xzc8S/kuVaQnbrqfwpOMOmL
         wCdzvROt5kclcylshS8aPdhmgHUOJniLE8HRZgCH1QbBOm5gAYB9dqvWnVvL2MXFawk9
         vbqy6oBXyhwhYeX8dq2yeKfldtcfkMTjnwmp+Kg+C669iWi3iQulGUwyb0jFfC9iloqy
         M5T7Go7M5DpOaI2DBfn/6GgNWjUp9sni4khtHzzdX50XDXNoHembIJcy5dyqZHRBhbqE
         SmTQBjO+J7NmwQv3RepqS1daF+pLwxTC3FU01nUSp3DZ4QMLbnT1LUw3ucv11H+5rCBL
         hkZw==
X-Gm-Message-State: AOJu0Yz6oSFjj6z+lS9+dWcio4LGcs8kJ6EXQnC/oawEKw7y4/lriuWf
	a+cLT9A8efe752JqKuygK/d3Sp+RGrWUMN+raFfCUia1Wo2hWa/1kgRlNPZXmTPxWWJqAI5rXLj
	mKDo=
X-Gm-Gg: ASbGncvSt0LUD2YcH2tYBiWwCP2Z0eb9YzvvTUaaXiHhSGvsY9XiivwE1/kv3vfEMHK
	Hw6uWwEl1LAxhwrb4xX1WnYpwlGXU9OgbOSXCXQ5ts1tGZxYUh5ZVY3X5lqSs/6L5kpHE2iIMXs
	iCTO9GPv/syv6YdhRbVEl8PBI4tSEr05EwlN0VjUUMTxgA7zEbhFCWYL7r471AUn9euWAf4moqV
	sUEsM5xjSrvHyFUSAuzeoFdD3qqEQ4dsR3KTskZNwmgx/2TIjYoq7zHM/dGkBFUylFaVn2387eF
	hlvh6fVl3Z0Jvp8OdjlcIOOvy4TDIzWUXygjPaQDnc9CXa6g25hJfZoYpt+JS10BzizuyJaY0ft
	tZHGyCaySKKOtV8HVHv0TpQPGXTK/ImGSqYygJy/mvwAKmWRcsFW2
X-Google-Smtp-Source: AGHT+IHr7PhxVGJnuMKthmWF/Mg1Looptz4cOMLCSvwica9ESVLBExnQdDMxEUUBejM4ufXZds+8+Q==
X-Received: by 2002:a05:6512:3a95:b0:553:2c65:f1d1 with SMTP id 2adb3069b0e04-553b6e8be88mr3347203e87.13.1750171352743;
        Tue, 17 Jun 2025 07:42:32 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ae234437sm1814992e87.53.2025.06.17.07.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:42:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 0/5] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5 + other meta fixes
Date: Tue, 17 Jun 2025 14:42:21 +0000
Message-Id: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM1+UWgC/23MQQ6DIBCF4as0rEuDODDaVe/RdEEAlYXSgJI2x
 rsX3dQ2Lt9kvn8m0QZnI7meZhJsctH5IQ88n4ju1NBa6kzehDMuGLCSTknT3o6KWiEkYmkKriz
 J789gG/faUvdH3p2Low/vrZxgvR5EElBGK0SlJKCoUdx0F3zvpv7iQ0vWThJ7Czsrsm2wrhEaz
 Q1nB1Z+rfyxMlssoDBQ6ZJz/WeXZfkAHdmtNxsBAAA=
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
 .../media/v4l/metafmt-uvc-msxu-1-5.rst             |  23 ++++
 .../userspace-api/media/v4l/metafmt-uvc.rst        |   4 +-
 MAINTAINERS                                        |   1 +
 drivers/media/usb/uvc/uvc_driver.c                 |   7 ++
 drivers/media/usb/uvc/uvc_metadata.c               | 133 +++++++++++++++++++--
 drivers/media/usb/uvc/uvc_video.c                  |  12 +-
 drivers/media/usb/uvc/uvcvideo.h                   |   3 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 include/linux/usb/uvc.h                            |   3 +
 include/uapi/linux/videodev2.h                     |   1 +
 11 files changed, 175 insertions(+), 14 deletions(-)
---
base-commit: c3021d6a80ff05034dfee494115ec71f1954e311
change-id: 20250403-uvc-meta-e556773d12ae

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


