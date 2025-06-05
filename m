Return-Path: <linux-media+bounces-34148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF3EACF5BE
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 19:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E235171F35
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 17:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A330627A92B;
	Thu,  5 Jun 2025 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N3kPXvIw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2630A33062
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 17:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145986; cv=none; b=HpLJcPyfy0BigWQ65x/CIsNdsN8J0X1mQcyea6mZvNTc/KzeTFsVlKgwQjd34jo/5xUPWXEefBspbsmrcjUOpCVLOhd2t47h2PI1eQA7luBz3ewGTKN0H32A1BbCL/d3SQKVvI9j4zmrEc6+tIczK7CKA7ZCODLmSqaANNY4Lwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145986; c=relaxed/simple;
	bh=9bzS54upE3rRAonWBAvA9rFLasmw9Br1LIIjE4DGYuQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QaVhHoFLCMA01+Reuc/4pnXkhCs2ih4vLMKwLgjbhjrEe7i8nS/qN+yAkCPCY6JOod23y/97mQXu8kZH2Sc7pdDfbPWJ8Xu0yJh4ONfY3KOfV1TvGnoVHhEd6ytmGcc3YMfXYy8c1oQD7ac4GR7m2Z0biTKbCxKKRBKk7KROxIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N3kPXvIw; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54b10594812so1423832e87.1
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 10:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145982; x=1749750782; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qg8B5BhnvwwywdhBinf22u9UEobn5/4x1o1lWUndYM0=;
        b=N3kPXvIwmX+CDcGbVtvQyBHqnAw4wRwfWsKoRmpClmjchCcMtJsDTnkxxp8Bq86x4m
         4k5IFnZBE+AX4YgIUEa3F3+/bbOlXV7uVaGZ4T5P5bP6HUcTr6GlUgciNTod9rnBMhyp
         cCcAARQwisqCyj+yGzLEcOVsrZECC8+UPVg2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145982; x=1749750782;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qg8B5BhnvwwywdhBinf22u9UEobn5/4x1o1lWUndYM0=;
        b=Uzh1NDXH1qbJXuLDiOpRIexkg5+PV1R3iKin8rD+f2qgJN9yP7zoYUWdnkY+mGNVAb
         Z2twdbztc5uJhMbJ/VAB4Mc5IxNUnxvaSL0oTNxengs92tjbuC/74wmnJAzmyX74iURd
         J0m7po9rWauC+YRPX25uwwOAqeNM2G+Il/kDOQ0k4VNyhHWPb2+P6RBmi1DCMUF8HcIi
         IYuF0DRIwNhPXZdTQE8nvBPr1ifl9HezNyp84LqzmtriR/XXCsDhf21B/iZQrVVBIz4U
         y4Q8BWMx1KnPonUKBjEpsz8I1W+Ulfq6uuLK4CLmcDkzPd9PrjvXpPGTiqQ89uLILiXQ
         hgHw==
X-Gm-Message-State: AOJu0YzeuLxxBbYQd+dUG1TDFWMrFWnn7RqragwJMjbAVI8F7umVCnIz
	BMl4aXoZSPqvFZJacR7jj2xhic5PoO1rBE8VD59B9Qh3E/Dqlo5N+XP4crtS5izNdA==
X-Gm-Gg: ASbGncsISqU3z7e7nM6cE8eKFcVXKEuALY85hZ8p+SWhF13JVLgqhIwqbejs2pvZVuL
	rG1T8Qv8clKRhstuk1CFnm10TfOTJiyOu0SEpgA7a82AdCTDvilZwHE0zdWVZaF3490YI/IHNsD
	YqGU+3c5zhuWU/caNm3t89nO/XhUt0FoAxHsstoNvOYoX9xNsVItgboPX3h3D7oyOiIHTLP2n4r
	usMOg33/WHyU3SC08iubiVNVGvchW7bNxAf8tR4oOAtHd8pOIr06RUbd1OeUBVFuegoZkIr3g1j
	0QDqRKXytgQqXEBUhPbwrV1hG3dDJm3WYCLor/nbYws5O3iSkUb5ld+c4/hmoxRvArCBuYQ/3dV
	A2IjajxlQZlUXwSnHLdDXHt/X5A==
X-Google-Smtp-Source: AGHT+IGFGY6JTGI6n0VkqKupH8+3OyGz0rwOerV6A58fRuz/+CnpGIvq6+ZmFKqYacJXbJhZzyj18Q==
X-Received: by 2002:a05:6512:3b89:b0:553:3892:5ead with SMTP id 2adb3069b0e04-55366bd23bbmr23901e87.2.1749145982087;
        Thu, 05 Jun 2025 10:53:02 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 00/12] media: uvcvideo: Add support for orientation and
 rotation.
Date: Thu, 05 Jun 2025 17:52:53 +0000
Message-Id: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHXZQWgC/3WNyw7CIBREf6W5azGAoqkr/8N0gTzKXRTMhRJNw
 7+L3bs8kzkzG2RH6DLchg3IVcyYYgd5GMAEHWfH0HYGyaXiZ35iazUsdSUWXXqXKX/1YrRaafu
 Ebr3IeXzvi4+pc8BcEn32gyp+6f+tKhhnQnNj1Kj0Rdq7CZQWXJdjohmm1toXP2vZL7EAAAA=
X-Change-ID: 20250403-uvc-orientation-5f7f19da5adb
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The ACPI has ways to annotate the location of a USB device. Wire that
annotation to a v4l2 control.

To support all possible devices, add a way to annotate USB devices on DT
as well. The original binding discussion happened here:
https://lore.kernel.org/linux-devicetree/20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org/

The following patches are needed regardless if we finally add support
for orientation and rotation or not:
- media: uvcvideo: Always set default_value
- media: uvcvideo: Do not create MC entities for virtual entities

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Add support for rotation
- Rename fwnode to swentity
- Remove the patch to move the gpio file
- Remove patches already in media-committers
- Change priority of data origins
- Patch mipi-disco
- Link to v1: https://lore.kernel.org/r/20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org

---
Ricardo Ribalda (12):
      media: uvcvideo: Always set default_value
      media: v4l: fwnode: Support ACPI's _PLD for v4l2_fwnode_device_parse
      ACPI: mipi-disco-img: Do not duplicate rotation info into swnodes
      media: ipu-bridge: Use v4l2_fwnode_device_parse helper
      media: ipu-bridge: Use v4l2_fwnode for unknown rotations
      dt-bindings: usb: usb-device: Add orientation and rotation
      media: uvcvideo: Make uvc_alloc_entity non static
      media: uvcvideo: Add support for V4L2_CID_CAMERA_ORIENTATION
      media: uvcvideo: Add uvc_ctrl_query_entity helper
      media: uvcvideo: Add get_* functions to uvc_entity
      media: uvcvideo: Add support for V4L2_CID_CAMERA_ROTATION
      media: uvcvideo: Do not create MC entities for virtual entities

 .../devicetree/bindings/usb/usb-device.yaml        |  10 ++
 drivers/acpi/mipi-disco-img.c                      |  15 ---
 drivers/media/pci/intel/ipu-bridge.c               |  52 ++++----
 drivers/media/usb/uvc/Makefile                     |   3 +-
 drivers/media/usb/uvc/uvc_ctrl.c                   | 132 ++++++++++++++-------
 drivers/media/usb/uvc/uvc_driver.c                 |  18 ++-
 drivers/media/usb/uvc/uvc_entity.c                 |  11 ++
 drivers/media/usb/uvc/uvc_swentity.c               | 118 ++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h                   |  29 +++++
 drivers/media/v4l2-core/v4l2-fwnode.c              |  85 ++++++++++++-
 include/linux/usb/uvc.h                            |   3 +
 11 files changed, 377 insertions(+), 99 deletions(-)
---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20250403-uvc-orientation-5f7f19da5adb

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


