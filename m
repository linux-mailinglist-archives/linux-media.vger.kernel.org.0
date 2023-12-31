Return-Path: <linux-media+bounces-3129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF3E820B17
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 11:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 901C6B20D38
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092713211;
	Sun, 31 Dec 2023 10:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UeTBEpG4"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD45628F5
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704019163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mhBlZj/CgNkT50Cg6dHWCuxupCSZwH7Z6p0s/lyXU80=;
	b=UeTBEpG42zp4UNWU7x5sFLMRjir5454wmIbn0agDmARjRNDN7dgEZUZzD05f2VPOZfyLgG
	VZtfF83Qw29WzU+TJZDztX3T8FZ/X/7U2GupY/8iymykK5NBJ/8R9heUuXzilYv3Tvytzv
	sfIx40GJkdd4FME1u89wcRCYoOblYpk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-0XrpH9bPNOKtOjuFQYyEQg-1; Sun, 31 Dec 2023 05:39:21 -0500
X-MC-Unique: 0XrpH9bPNOKtOjuFQYyEQg-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-555e088203cso600147a12.0
        for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 02:39:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704019160; x=1704623960;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mhBlZj/CgNkT50Cg6dHWCuxupCSZwH7Z6p0s/lyXU80=;
        b=VVoHkb+O8JpeFd+L8wtMA6IqRarwqDwJnTa7pChGDaAdmth4mVHkZD1YIueCyteVzq
         kH9eLjY+H3kGjbf514ZfSm9v9kVDjkVg23073sZa1tay6ZNk/qxvBqPawuwW3snyqivv
         7SIOr3kgjjnna12MhM62VVIBhEm7ChO71DIJeJQCEARc+0nSHWpzPBbtj7X4GVOidQYg
         pDMJJu/23BQTN6R65gtujC6CQRQ/LjE9hh92uRXpBRBo++MQM23Nyy4uOOGhEdAqJVVg
         g1faovAkAVmvNNEpkeMnr9uUOnsTaz2/JiASFfYdhTfeUlX/xHqkFLtyJgR7rzAxggLL
         CLrw==
X-Gm-Message-State: AOJu0YxaWoGIdkTq4805x5+k0LpIzEiEBm41rAXAQgFB8iPWVR+UG+Qd
	FPHjCknnz1FBE4y0MyG1DwoFXiy6Guv1tKuz3Nrc0O9z8uTayiaWv5i0CXqffE81xeqqRsVcaZM
	JK8No9HF9b9A4rrxqEaiBBJ8c0Qiycx4=
X-Received: by 2002:a50:8ad7:0:b0:553:2f4a:3f10 with SMTP id k23-20020a508ad7000000b005532f4a3f10mr10720189edk.39.1704019160594;
        Sun, 31 Dec 2023 02:39:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvh9p5Ew7/8gSa9D2PtLP1k2ZaDstffo0v4th2UWhtr2LWt1X3VGBMKZNuabD9LTIABJkBvQ==
X-Received: by 2002:a50:8ad7:0:b0:553:2f4a:3f10 with SMTP id k23-20020a508ad7000000b005532f4a3f10mr10720183edk.39.1704019160299;
        Sun, 31 Dec 2023 02:39:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p13-20020a05640210cd00b0055298b38768sm13416193edu.80.2023.12.31.02.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 02:39:19 -0800 (PST)
Message-ID: <d5059986-0329-4e6a-a7a5-30da8ebd58a9@redhat.com>
Date: Sun, 31 Dec 2023 11:39:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] media: atomisp: Changes for 6.8-1
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

Here are the atomisp changes for 6.8.

My patches in this set been posted on the list, but only a couple of
minutes ago, leaving pretty much zero time for review. Sorry about that,
with the holidays the timing did not work out very well.

If you don't want to take this pull-request because of this it
would be good if you can at least take the patches up to
the "media: atomisp: Fix spelling mistake in ia_css_acc_types.h"
change. There are only 2 unreviewed patches from me in that
set, which fix the atomisp driver not working at all with
the latest media_stage/master code. And the rest of the patches
in that set are from others and have been reviewed by me.

If review finds any significant issues I'll do a set of follow up
patches to fix those.

Highlights:
- The first commit in this pull-request fixes the driver no longer
  working due to v4l2_subdev_state handling in media_stage/master

- Merged a bunch of spelling and other small fixes from various
  contributors

- Gracefully handle missing firmware:
  - Fix the driver crashing the system when the firmware is missing
  - Make the driver bind in power-managent-only mode when the firmware
    is missing so that the ISP is still properly turned off. This
    requires custom handling, not just standard PCI power-management.
    This allows the system to properly enter S0i3 with missing ISP
    firmware, allowing the atomisp driver to be used as a replacement
    for the pm-only drivers/platform/x86/atomisp/pm.c driver.

Regards,

Hans


The following changes since commit 02d4e62ae2452c83e4a3e279b8e4cb4dcbad4b31:

  media: i2c: mt9m114: use fsleep() in place of udelay() (2023-12-14 12:40:13 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.8-1

for you to fetch changes up to 1e529948fa3ae6249f1f15dbd77730ea54d0e649:

  media: atomisp: Update TODO (2023-12-31 11:07:38 +0100)

----------------------------------------------------------------
atomisp staging driver changes for 6.8

Highlights:
- The first commit in this pull-request fixes the driver no longer
  working due to v4l2_subdev_state handling in media_stage/master
- Merged a bunch of spelling and other small fixes from various
  contributors
- Gracefully handle missing firmware:
  - Fix the driver crashing the system when the firmware is missing
  - Make the driver bind in power-managent-only mode when the firmware
    is missing so that the ISP is still properly turned off. This
    requires custom handling, not just standard PCI power-management.
    This allows the system to properly enter S0i3 with missing ISP
    firmware, allowing the atomisp driver to be used as a replacement
    for the pm-only drivers/platform/x86/atomisp/pm.c driver.

----------------------------------------------------------------
Colin Ian King (1):
      media: atomisp: Remove redundant assignments to variables

Dipendra Khadka (13):
      media: atomisp: Fix spelling mistakes in ia_css_irq.h
      media: atomisp: Fix a spelling mistake in sh_css_defs.h
      media: atomisp: Fix repeated "of" in isp2400_input_system_public.h
      media: atomisp: Fix spelling mistake in isp2400_input_system_global.h
      media: atomisp: Fix spelling mistakes in circbuf.c
      media: atomisp: Fix spelling mistake in ia_css_circbuf.h
      media: atomisp: Fix spelling mistakes in sh_css_mipi.c
      media: atomisp: Fix spelling mistakes in queue.c
      media: atomisp: Fix spelling mistakes in rmgr_vbuf.c
      media: atomisp: Fix spelling mistakes in ia_css_macc_table.host.c
      media: atomisp: Fix spelling mistakes in ia_css_hdr_types.h
      media: atomisp: Fix spelling mistake in binary.c
      media: atomisp: Fix spelling mistake in ia_css_acc_types.h

Hans de Goede (15):
      media: atomisp: Adjust for v4l2_subdev_state handling changes in 6.8
      media: atomisp: Refactor sensor crop + fmt setting
      media: atomisp: Remove s_routing subdev call
      media: atomisp: Remove remaining deferred firmware loading code
      media: atomisp: Drop is_valid_device() function
      media: atomisp: Call pcim_enable_device() and pcim_iomap_regions() later
      media: atomisp: Fix probe error-exit path
      media: atomisp: Fix atomisp_pci_remove()
      media: atomisp: Group cpu_latency_qos_add_request() call together with other PM calls
      media: atomisp: Fix probe()/remove() power-management
      media: atomisp: Replace atomisp_drvfs attr with using driver.dev_groups attr
      media: atomisp: Move power-management [un]init into atomisp_pm_[un]init()
      media: atomisp: Bind and do power-management without firmware
      media: atomisp: Remove unnecessary msleep(10) from atomisp_mrfld_power() error path
      media: atomisp: Update TODO

Jonathan Bergh (1):
      media: atomisp: Removed duplicate comment and fixed comment format

 drivers/staging/media/atomisp/TODO                 |  10 -
 drivers/staging/media/atomisp/i2c/gc2235.h         |   5 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    | 133 ++++-----
 .../media/atomisp/pci/atomisp_compat_css20.c       |   2 +-
 drivers/staging/media/atomisp/pci/atomisp_drvfs.c  | 148 ++++------
 drivers/staging/media/atomisp/pci/atomisp_drvfs.h  |   5 +-
 .../staging/media/atomisp/pci/atomisp_internal.h   |   5 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |  60 ++--
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 319 +++++++++------------
 .../pci/base/circbuf/interface/ia_css_circbuf.h    |   2 +-
 .../media/atomisp/pci/base/circbuf/src/circbuf.c   |   6 +-
 .../staging/media/atomisp/pci/ia_css_acc_types.h   |   4 +-
 drivers/staging/media/atomisp/pci/ia_css_control.h |  29 +-
 .../staging/media/atomisp/pci/ia_css_firmware.h    |   6 +-
 drivers/staging/media/atomisp/pci/ia_css_irq.h     |   6 +-
 .../atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h |   4 +-
 .../kernels/macc/macc_1.0/ia_css_macc_table.host.c |   4 +-
 .../atomisp/pci/isp2400_input_system_global.h      |   2 +-
 .../atomisp/pci/isp2400_input_system_public.h      |   2 +-
 .../media/atomisp/pci/runtime/binary/src/binary.c  |   2 +-
 .../atomisp/pci/runtime/pipeline/src/pipeline.c    |   2 +-
 .../media/atomisp/pci/runtime/queue/src/queue.c    |  22 +-
 .../media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c |   6 +-
 drivers/staging/media/atomisp/pci/sh_css.c         |  33 +--
 drivers/staging/media/atomisp/pci/sh_css_defs.h    |   2 +-
 drivers/staging/media/atomisp/pci/sh_css_mipi.c    |   4 +-
 26 files changed, 344 insertions(+), 479 deletions(-)



