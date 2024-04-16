Return-Path: <linux-media+bounces-9493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3038A672F
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 11:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21250B22CF0
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 09:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F338D85942;
	Tue, 16 Apr 2024 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T7hnYspT"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62DC75808
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 09:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713260039; cv=none; b=Z2O1S/v2MgUwHkb2ZWnjPo/sqFyZnjs/Qa/jQLVdeuarJO6mHazTaXzRgK1hokV6zPwMlw0DANpnJEw7M1VCDy3GptEJxeRal0etJ2zqSLMlgH1ahoonC1535Z9oZsEZxqq+VB0wJ833j2kYwcnaURs5wG9GXdiR5rtYNKYZDOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713260039; c=relaxed/simple;
	bh=ca68k94NQWIp9bYHRgsTpfmK0nVR9CeFpNkPjFdICxs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=LYmJlrqkT/EsKrhVelvBrYbqHjFHLnjd/C8sTEMIqjTaarmZzCLHd2Q0R4qhCge95MeuKt4HAuzIdLQG9UaL1vIByIrbmONKdZaC52wVe198G5NGJw1gM6VkbYfB8r27sYVJvvaB3wsM0P5Tf8fYNp45jrqeQeUjmvCpuIJzefM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T7hnYspT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713260035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hAEuY+FWy4sVIarXTyR98KXeQOoVg5ilAgSGVthmk8Y=;
	b=T7hnYspTB+u2KtPo7Sgw+1MB1Qvarmls+94kxbBCYWJg6cAHzK1iPxqCfj6XH8BRSz+S+q
	Vp1/Zbv2ZEfMD6KOWhTr7BJykwHTRZa9Mf32qR1F7L/XBh72bSBoGhMBEfc8+ROK86X+yg
	/FBPDAwGFBGzaz4E1yEqcyp4utjGXR8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-H8NWCU9nPRSgBNwDjYE4yg-1; Tue, 16 Apr 2024 05:33:54 -0400
X-MC-Unique: H8NWCU9nPRSgBNwDjYE4yg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a524b774e39so317228366b.1
        for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 02:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713260033; x=1713864833;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hAEuY+FWy4sVIarXTyR98KXeQOoVg5ilAgSGVthmk8Y=;
        b=iyYFWdBCmw5meSnDpGCPwpu/Rwj6pnPM07gBtvoJhmqB6/hsGyIA0eCsUsk/M3UHw6
         rSIGgDevlHKsQ3Y7QVdfxAqPiktZsK3n+BmyA2Lybh8VimH7Tzqlb9JwkW+uQQjQVxA5
         93w07n0tLtjF3SJi92rHlILhRmzek4TCU9DguBgh/KtDCzYo2nfxmJJqqHuHXmtLi+Ru
         cEHKtnxBOtoVw7vTJJzXU9hHdabedcVfk3An2BJCUJBXUdHTORmD+Z3dYt1oW67MTTu2
         7p5qpdQ/qFQVwyRxMs+xSYviM0eNittGbwSZthE+Y2nQlaqU+JKfeodO/m6NaDy39i75
         uzkw==
X-Forwarded-Encrypted: i=1; AJvYcCUWDjpyz62jcEwajBW2jbAVydxKfiM74XspAOYciDjAKrofwZd4RhF92lQRr2dpxFO1fSmEd1AwmP5iyWBu+b3y2x9dLy9SAVAGSUE=
X-Gm-Message-State: AOJu0YxuXQAIfdhK4d2ryC2FjQweP8Rd4dd3holGvrZFDlVHcYYJ8hSQ
	0zIkG+wiNXpUK1AgOC8i+JekTw9NKbVPetikpVP76E5wDOM5Ur+piiXGgfJp21y7CSmn1qlezsP
	owrfmZnq2TxywP20d//Mg1FhUQIL62OjVRoAJs5FNusHKNa5Qy2HnOyv4sodU
X-Received: by 2002:a17:906:5641:b0:a55:43e5:3372 with SMTP id v1-20020a170906564100b00a5543e53372mr910172ejr.20.1713260033152;
        Tue, 16 Apr 2024 02:33:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTq/46WHQNvItN7bjZ8V59D+PR+4M76xfaKJLw82+EQTHw+Y8dWhPFaZtlPNztfmZmItZcgA==
X-Received: by 2002:a17:906:5641:b0:a55:43e5:3372 with SMTP id v1-20020a170906564100b00a5543e53372mr910156ejr.20.1713260032812;
        Tue, 16 Apr 2024 02:33:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bo2-20020a170906d04200b00a524a37ac4dsm4424183ejb.179.2024.04.16.02.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 02:33:52 -0700 (PDT)
Message-ID: <5f89adf7-23e3-4966-ac50-838335b13207@redhat.com>
Date: Tue, 16 Apr 2024 11:33:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] media: atomisp: Changes for 6.10-2
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mauro, Hans,

Here is a second round of atomisp changes for 6.10,
this pull-request supersedes / replace my
"media: atomisp: Changes for 6.10-1" pull-request.

Various cleanup patches from Jonathan Bergh and Andy +
a set of patches from me which has been reviewed
by Andy and Kieran.

Highlights:
- Various cleanup patches from Jonathan Bergh and Andy Shevchenko
- Some more changes to make the atomisp driver work with libcamera,
  this has been tested with libcamera's simple pipelinehandler as
  well as a new atomisp pipelinehandler I'm working on together
  with an ov2680 sensor
- Remove more dead / unwanted code

Regards,

Hans


The following changes since commit 836e2548524d2dfcb5acaf3be78f203b6b4bde6f:

  media: usb: siano: Fix allocation of urbs (2024-04-16 00:02:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.10-2

for you to fetch changes up to 48d93af9d9b0fd40a21a656cb8cd8e25700bfed5:

  media: atomisp: Fix sh_css_config_input_network_2400() coding style (2024-04-16 11:19:52 +0200)

----------------------------------------------------------------
atomisp staging driver changes for 6.10-2

Highlights:
- Various cleanup patches from Jonathan Bergh and Andy Shevchenko
- Some more changes to make the atomisp driver work with libcamera,
  this has been tested with libcamera's simple pipelinehandler
  together with an ov2680 sensor
- Remove more dead / unwanted code

----------------------------------------------------------------
Andy Shevchenko (4):
      media: atomisp: Remove unsused macros
      media: atomisp: Put PMIC device after getting its I²C address
      media: atomisp: Replace open-coded i2c_find_device_by_fwnode()
      media: atomisp: Get rid of PCI device ID hack check

Hans de Goede (28):
      media: atomisp: Drop second V4L2_PIX_FMT_UYVY atomisp_output_fmts[] entry
      media: atomisp: Replace V4L2_PIX_FMT_RGB32 with V4L2_PIX_FMT_RGBX32
      media: atomisp: Disable broken V4L2_PIX_FMT_RGBX32 output support
      media: atomisp: Initialize sequence counters to 0 instead of -1
      media: atomisp: Add atomisp_s_sensor_power() helper
      media: atomisp: Turn on sensor power from atomisp_set_fmt()
      media: atomisp: Add atomisp_select_input() helper
      media: atomisp: Simplify atomisp_s_input() input argument checking
      media: atomisp: Ensure CSI-receiver[x] -> ISP links correctly reflect current sensor
      media: atomisp: Propagate set_fmt on sensor results to CSI port
      media: atomisp: Propagate v4l2_mbus_framefmt.field to CSI port sink pad
      media: atomisp: Call media_pipeline_alloc_start() in stream start
      media: atomisp: Drop atomisp_pipe_check() from atomisp_link_setup()
      media: atomisp: ov2722: Remove power on sensor from set_fmt() callback
      media: atomisp: Remove test pattern generator (TPG) support
      media: atomisp: Remove input_port_ID_t
      media: atomisp: Drop the atomisp custom lm3554 flash driver
      media: atomisp: Drop custom flash support
      media: atomisp: Drop unused frame_status tracking
      media: atomisp: Drop intel_v4l2_subdev_type
      media: atomisp: Remove gmin_platform VCM code.
      media: atomisp: Remove struct atomisp_platform_data
      media: atomisp: Remove clearing of ISP crop / compose rectangles on file release
      media: atomisp: Remove empty s_power() op from ISP subdev
      media: atomisp: Remove empty s_stream() op from CSI subdev
      media: atomisp: Cleanup atomisp_isr_thread() spinlock handling
      media: atomisp: Remove setting of f->fmt.pix.priv from atomisp_set_fmt()
      media: atomisp: Fix sh_css_config_input_network_2400() coding style

Jonathan Bergh (10):
      media: atomisp: Fix various formatting issues and remove unneccesary braces
      media: atomisp: Fix formatting issues and minor code issue
      media: atomisp: Remove unnecessary braces from single line conditional statements
      media: atomisp: Fixed "unsigned int *" rather than "unsigned *" declaration in variable declaration
      media: atomisp: Ensure trailing statements are on a newline and remove spurious whitespaces
      media: atomisp: Remove unnecessary parentheses from conditional statement
      media: atomisp: Remove unneeded return statement from void function
      media: atomisp: Remove old commented code and fix multiple block comment style
      media: atomisp: Fix various multiline block comment formatting instances
      media: atomisp: Remove extra whitespace after opening parentheses

 drivers/staging/media/atomisp/Makefile             |   1 -
 drivers/staging/media/atomisp/i2c/Kconfig          |  15 -
 drivers/staging/media/atomisp/i2c/Makefile         |   5 -
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |   2 +-
 drivers/staging/media/atomisp/i2c/atomisp-lm3554.c | 955 ---------------------
 .../staging/media/atomisp/i2c/atomisp-mt9m114.c    |   2 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c |  14 +-
 drivers/staging/media/atomisp/i2c/ov2722.h         |   1 -
 .../staging/media/atomisp/include/linux/atomisp.h  |  57 --
 .../atomisp/include/linux/atomisp_gmin_platform.h  |   6 +-
 .../media/atomisp/include/linux/atomisp_platform.h |  40 +-
 .../staging/media/atomisp/include/media/lm3554.h   | 132 ---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    | 271 +++---
 drivers/staging/media/atomisp/pci/atomisp_cmd.h    |  13 +-
 .../media/atomisp/pci/atomisp_compat_css20.c       |  31 +-
 drivers/staging/media/atomisp/pci/atomisp_csi2.c   |  26 +-
 drivers/staging/media/atomisp/pci/atomisp_fops.c   |  49 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c      | 123 +--
 .../staging/media/atomisp/pci/atomisp_internal.h   |  15 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  | 164 +---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |  53 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.h |  17 +-
 drivers/staging/media/atomisp/pci/atomisp_tpg.c    | 164 ----
 drivers/staging/media/atomisp/pci/atomisp_tpg.h    |  39 -
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 165 ++--
 drivers/staging/media/atomisp/pci/bits.h           |   4 +-
 drivers/staging/media/atomisp/pci/defs.h           |  37 -
 .../pci/hive_isp_css_common/host/dma_local.h       |   1 -
 .../pci/hive_isp_css_common/host/input_system.c    |  38 -
 drivers/staging/media/atomisp/pci/hive_types.h     |  19 -
 drivers/staging/media/atomisp/pci/ia_css.h         |   1 -
 .../media/atomisp/pci/ia_css_frame_public.h        |   8 -
 .../media/atomisp/pci/ia_css_stream_public.h       |  17 -
 drivers/staging/media/atomisp/pci/ia_css_tpg.h     |  79 --
 .../atomisp/pci/isp2400_input_system_global.h      |   1 -
 .../atomisp/pci/isp2400_input_system_public.h      |  15 -
 .../atomisp/pci/isp2401_input_system_global.h      |   1 -
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |  20 +-
 .../media/atomisp/pci/runtime/ifmtr/src/ifmtr.c    |  11 -
 .../atomisp/pci/runtime/isys/src/virtual_isys.c    |  28 +-
 drivers/staging/media/atomisp/pci/sh_css.c         | 137 +--
 .../staging/media/atomisp/pci/sh_css_internal.h    |   1 -
 drivers/staging/media/atomisp/pci/sh_css_mipi.c    |   2 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.c      | 127 ++-
 drivers/staging/media/atomisp/pci/sh_css_sp.h      |   7 -
 drivers/staging/media/atomisp/pci/system_global.h  |  12 -
 46 files changed, 364 insertions(+), 2562 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
 delete mode 100644 drivers/staging/media/atomisp/include/media/lm3554.h
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_tpg.c
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_tpg.h
 delete mode 100644 drivers/staging/media/atomisp/pci/defs.h
 delete mode 100644 drivers/staging/media/atomisp/pci/ia_css_tpg.h


