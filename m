Return-Path: <linux-media+bounces-14547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6402924713
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 20:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 294A11F22C82
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 18:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1932B1C6894;
	Tue,  2 Jul 2024 18:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cA6ofpDk"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984DB2F4A
	for <linux-media@vger.kernel.org>; Tue,  2 Jul 2024 18:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719943918; cv=none; b=Fy0JtgNM2UNHj/S/VVVEgxnjqav4bjkVooqYkJfzspk1ywM8Q15JekW2IgeY3ACWmofJFjg/yBy/L3XW4g3XKoD2ZLknKaiJW+sSa3L7S+nRJPEQ5EsMSpgQw/2jECQzIt0W1I1zxLldaQ/YnBBKNY5U0zCgWKhS/X4FxqT2Ixw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719943918; c=relaxed/simple;
	bh=ppNdLftGFidPsoC9xkJKJCnwtg1oxBxbelcgU0oRIZc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=qVpkzLXtxSoFvRhEAEUmnlfjOScWmFU+ybGQDzpO7eONem7EPU7WIDh7tEL1WunNcCZsoy6WhIeqzioa+GJVmc5pzAkTYXUtVA7uNwaLvBHfYs/xgLdUMwQs2ovZpbUpJfoOSx3IsWcNTrDgo/H0zT0KEpguKuMBIrmy6nVedl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cA6ofpDk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719943915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7niLs/oLL4wN0v4lpWgFBHE66+tB200/5grYPxx8sBo=;
	b=cA6ofpDkdOy1sG6KQWpBSxzsGhyD+aR3JYVnZKqwG7TGLCr+4rn4pYwKqhi3/WopPS0JYQ
	CaADVFoHSrpWu4lRrlja0RoXXJFbOg5akg/PjqioZeYKPUbr+KOZ1KsezwvqOmfdDysFoY
	qeS8jyM6iYU4awCXpIZ2FwsqtRgKdAA=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-jVPKLZg3Mly7BZ1M7EMsmg-1; Tue, 02 Jul 2024 14:11:54 -0400
X-MC-Unique: jVPKLZg3Mly7BZ1M7EMsmg-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ee7a53e7cfso4698791fa.2
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2024 11:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719943912; x=1720548712;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7niLs/oLL4wN0v4lpWgFBHE66+tB200/5grYPxx8sBo=;
        b=va+d/NQEHPurBedEZIQyDxnBE8DhhrGpQsRw14j6HC8w9KnAs67Y7NkEnZKF48/QTY
         AQsjZ+/b0WZprm0rblNke9TbSRm0XsnV5Aq+97KF0DaYSHki/53xFFm5hGDCgKY9veh+
         BL4Chqptym04zfQfKAnXuxxGMRGNVO2eHA2kxkF9tfAuAjJPRHVFdFwwDQoUZLtVPv+B
         g0Ar31tO0l/wMY6yoZJggnDGVYPuPrloxFtF0FNDmMWN9YO6fmlJJgnug+xBc11wve8n
         IuYJuWS8PWKTnJRBYcK5fyZP5g/KZZ7SetKQIScdPdZaW8aXZe/DlUoDNlz2vTKFBSzn
         DaoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe5kkeje5+WMKUmUbS9vnnRvRmieOlwK2NdtYHYKRSA0ki8HzIIkiC9YHFukG0uWXZY+s3XfFxswfDk82weJ97jJ1a2ZWGsViocSc=
X-Gm-Message-State: AOJu0YzHN3rGaGL6tSlkHiCGKBQ3NWwvQSL2k2o65/dYQetTGF2edovm
	SOvG9x8F/rwQyfQeQ+t5tUvy4zb9wIMIvTPvtEl06QOf3h4SRShYRkaVI9i6V/9kBK81IIj1cV2
	Lar9Xt/JBMogHMO4zLTGUt6+YFjOBq2M3JgivDkvyXBjf9HgHGF67xIW1dFgp
X-Received: by 2002:a05:651c:198b:b0:2ec:4487:6a8f with SMTP id 38308e7fff4ca-2ee5e6ba645mr72345781fa.37.1719943912570;
        Tue, 02 Jul 2024 11:11:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCkmx0jbTUeMJDmVb0PBgl2zEOoHmEL7kOxFJCEDIto0dL/XYhi53y6yVbRtI4FMhq27ViRA==
X-Received: by 2002:a05:651c:198b:b0:2ec:4487:6a8f with SMTP id 38308e7fff4ca-2ee5e6ba645mr72345671fa.37.1719943912135;
        Tue, 02 Jul 2024 11:11:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b? (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58615038a86sm5970374a12.95.2024.07.02.11.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 11:11:51 -0700 (PDT)
Message-ID: <43245a4b-1e5a-4d27-876b-853a67b0ad28@redhat.com>
Date: Tue, 2 Jul 2024 20:11:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] media: atomisp: Changes for 6.10-1
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro, Hans,

Here is a first round of atomisp changes for 6.11.

Highlights:
- Update driver for the atomisp firmware now being available in linux-firmware
- Couple of cleanups from Andy Shevchenko
- Bunch of spelling fixes

Regards,

Hans


The following changes since commit a0157b5aa34eb43ec4c5510f9c260bbb03be937e:

  media: venus: fix use after free in vdec_close (2024-06-30 11:22:44 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.11-1

for you to fetch changes up to 841c19674e180f58b3dd34f991672cce09dfaf39:

  media: atomisp: Fix spelling mistakes in sh_css_sp.c (2024-07-02 12:39:37 +0200)

----------------------------------------------------------------
atomisp staging driver changes for 6.11-1

Highlights:
- Update driver for the atomisp firmware now being available in linux-firmware
- Couple of cleanups from Andy Shevchenko
- Bunch of spelling fixes

----------------------------------------------------------------
Andy Shevchenko (3):
      media: atomisp: Clean up unused macros from math_support.h
      media: atomisp: Replace COMPILATION_ERROR_IF() by static_assert()
      media: atomisp: Remove unused GPIO related defines and APIs

Colin Ian King (1):
      media: atomisp: Fix spelling mistake "pipline" -> "pipeline"

Hans de Goede (5):
      media: atomisp: Remove unused mipicsi_flag module parameter
      media: atomisp: Remove firmware_name module parameter
      media: atomisp: Prefix firmware paths with "intel/ipu/"
      media: atomisp: Update TODO
      media: atomisp: csi2-bridge: Add DMI quirk for OV5693 on Xiaomi Mipad2

Roshan Khatri (5):
      media: atomisp: Fix spelling mistake in sh_css_internal.h
      media: atomisp: Fix spelling mistake in ia_css_eed1_8.host.c
      media: atomisp: Fix spelling mistake in hmm_bo.c
      media: atomisp: Fix spelling mistake in ia_css_debug.c
      media: atomisp: Fix spelling mistakes in sh_css_sp.c

 drivers/staging/media/atomisp/TODO                 |  31 +-----
 drivers/staging/media/atomisp/pci/atomisp_common.h |   1 -
 .../media/atomisp/pci/atomisp_csi2_bridge.c        |  14 +++
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |   2 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  37 +++----
 .../base/circbuf/interface/ia_css_circbuf_comm.h   |   6 ++
 .../pci/camera/util/interface/ia_css_util.h        |  11 ---
 .../media/atomisp/pci/camera/util/src/util.c       |  25 +++--
 .../staging/media/atomisp/pci/gpio_block_defs.h    |  17 ----
 .../atomisp/pci/hive_isp_css_common/gpio_global.h  |  23 -----
 .../pci/hive_isp_css_common/host/gpio_local.h      |  21 ----
 .../pci/hive_isp_css_common/host/gpio_private.h    |   9 +-
 .../pci/hive_isp_css_include/assert_support.h      |  23 -----
 .../media/atomisp/pci/hive_isp_css_include/gpio.h  |  46 ---------
 .../pci/hive_isp_css_include/host/gpio_public.h    |  46 ---------
 .../pci/hive_isp_css_include/math_support.h        | 110 +--------------------
 .../pci/hive_isp_css_include/type_support.h        |   5 +-
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     |   4 +-
 drivers/staging/media/atomisp/pci/ia_css_3a.h      |   5 +
 drivers/staging/media/atomisp/pci/ia_css_dvs.h     |   4 +
 .../staging/media/atomisp/pci/ia_css_metadata.h    |   4 +
 drivers/staging/media/atomisp/pci/ia_css_types.h   |   2 +
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c    |   2 +-
 .../pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c |   6 +-
 .../media/atomisp/pci/runtime/binary/src/binary.c  |   2 -
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |   4 +-
 .../runtime/spctrl/interface/ia_css_spctrl_comm.h  |   4 +
 drivers/staging/media/atomisp/pci/sh_css.c         |  48 +--------
 drivers/staging/media/atomisp/pci/sh_css_frac.h    |   4 +-
 .../staging/media/atomisp/pci/sh_css_internal.h    |  19 +++-
 drivers/staging/media/atomisp/pci/sh_css_sp.c      |  24 ++---
 31 files changed, 118 insertions(+), 441 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gpio_local.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/gpio.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/host/gpio_public.h


