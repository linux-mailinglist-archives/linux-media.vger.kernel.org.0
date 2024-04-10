Return-Path: <linux-media+bounces-9037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C03889F43B
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 15:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2104128C6DC
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 13:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E4715F415;
	Wed, 10 Apr 2024 13:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T11EZJx8"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E63313D2BC
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 13:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712755658; cv=none; b=QZmXEkTFJrtDJeEiIUvQQBMJ8cJcCRv5eX07hdSbkcg/4FFEHrueSgZ7Eq1cX0pdY9Z/IfXD47OqRBm7CxpJjfAQS0fzzLY1EM+cnKv+uSPIRdoskcP7sBYwJvSFsIXPiI0BXfDy4or8Amb7wNSJN4r7dSw9UnxyjYC5m7OHRLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712755658; c=relaxed/simple;
	bh=uekwfcb18dx43Zuv2A5bZgoGi53LxIaSg0xkA8BmqxM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=a4lXZyfSjt8PhfJR5w6GCUNqonZE6qn7xUAWkKy7YR8I5p4DnzIWjRpS/kCHVwewY36HK75xWaikL+UaJaLBK3rQigRFe4eg3O6+HSN4UavfgbkK1urM4J+o3uzIhQoz9R1xTtWWCNp1+ocrl7NgmAuLQqNIirqirN9fQfJV87o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T11EZJx8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712755655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ts6+EaFTV3hqFveRg5zgnMS23rvp01fyPF7R6Av4b8Y=;
	b=T11EZJx8Qski/cTfwLxs3YDGSHup1utBwAGBEu/UBeM1gnfw8xrJLNgso2sUWo31G1NfvM
	Lbf1JVKwSo2phkWv9scO7K5AJpmqc+lt8nek1qVlRBFcvKAi1oWzvfiL6n7XSDdCkCtCUz
	fAdtFeRlsI5o2I4beEBdRqO+2/F3RKQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-AMALg4KlOTiiqHILatRx1A-1; Wed, 10 Apr 2024 09:27:33 -0400
X-MC-Unique: AMALg4KlOTiiqHILatRx1A-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a5190b1453fso401737966b.2
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 06:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712755651; x=1713360451;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ts6+EaFTV3hqFveRg5zgnMS23rvp01fyPF7R6Av4b8Y=;
        b=iEgqATWds3EgN3+Ivv0BOVv3m53CL64KjhHn4zk314eIRoSDD/pt3+SU0/AjhxUyB8
         1Zxg5Psn4UXhFEbMBNA9CvrLPqApGTr7Ieh0d2v15MRIt3qqX6O1kKKx8NNyotKb/+Qj
         QCOsleHCYv8BMo6XPVglG83BsOcpg9kOvIVC0HqjtO2/62T1Ls3JwYx6in9sDTA4iiCS
         yYEqcpHmRxL16ycsIPvc8tSBUEqB3PeyWzpFcN/lIVSX843Er1qWM6WsQsxoTZET7sVG
         z+o6ksKr3g319J9a0GBgVLMZA1XttvK2mpvsS6Uu+5evWqrHj7MSnPwvjFfjIDTyZlfg
         y72A==
X-Forwarded-Encrypted: i=1; AJvYcCWj1UjP0n4DOaqc/e99zIcYqPMJPb4Z2Zzv5+S0PQGT6RsRhAU44sok4ZMfg2OPXeU0bXBCwcq/CWV+XwmOUFqnT6wrY9tzyA2UkAU=
X-Gm-Message-State: AOJu0YwhaxjI6Ewcndq68k16HNDiGcUonZ8fHM5UEAkbUvcR7Wsj7qen
	KSomh2CVGzzq5iKACjM+4Og/rcL17zx7X6aHmIiTI4KuJveMiLuYaRia+92Z7iIDdiKySzTmZnJ
	9xuZ4EKimDUtMYssHW1ltyFp8L3GoeCk5qwvTJrPt7ZsrsP34Fyiwt5WUwN1+
X-Received: by 2002:a17:907:7202:b0:a51:9d21:2a1e with SMTP id dr2-20020a170907720200b00a519d212a1emr2069208ejc.73.1712755651394;
        Wed, 10 Apr 2024 06:27:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ+daPelqFrKT4dh1ETe0KM84w8B3Wi+iEbgtKxmadbgK2+t7oBjVXR985fyDy09YM4Js/mA==
X-Received: by 2002:a17:907:7202:b0:a51:9d21:2a1e with SMTP id dr2-20020a170907720200b00a519d212a1emr2069194ejc.73.1712755651009;
        Wed, 10 Apr 2024 06:27:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dr19-20020a170907721300b00a4a33cfe593sm6925153ejc.39.2024.04.10.06.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 06:27:30 -0700 (PDT)
Message-ID: <d73b0bb6-2fcb-4c53-aefb-fadc25b98105@redhat.com>
Date: Wed, 10 Apr 2024 15:27:29 +0200
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
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mauro, Hans,

Here is a first round of atomisp changes for 6.10,
this pull-request supersedes / replace my
"media: atomisp: Changes for 6.9-1" pull-request.

Various cleanup patches from Jonathan Bergh and Andy +
a set of patches from me which has been reviewed
by Andy and Kieran.

Highlights:
- Remove more dead / unwanted code
- Changes to make the atomisp driver work with libcamera,
  this has been tested with libcamera's simple pipelinehandler
  together with an ov2680 sensor

Regards,

Hans


The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.10-1

for you to fetch changes up to b3462fa5eff2ada1f2f6ae750f568af22d5b5db7:

  media: atomisp: Get rid of PCI device ID hack check (2024-04-10 12:48:18 +0200)

----------------------------------------------------------------
atomisp staging driver changes for 6.10-1

Highlights:
- Changes to make the atomisp driver work with libcamera,
  this has been tested with libcamera's simple pipelinehandler
  together with an ov2680 sensor
- Remove more dead / unwanted code
- Various cleanup patches from Jonathan Bergh and Andy Shevchenko

----------------------------------------------------------------
Andy Shevchenko (4):
      media: atomisp: Remove unsused macros
      media: atomisp: Put PMIC device after getting its I²C address
      media: atomisp: Replace open-coded i2c_find_device_by_fwnode()
      media: atomisp: Get rid of PCI device ID hack check

Hans de Goede (14):
      media: atomisp: Fix double negation in unsupported revision error
      media: atomisp: Remove isp_subdev_propagate()
      media: atomisp: Rename atomisp_set_crop_and_fmt()
      media: atomisp: Remove custom VCM handling
      media: atomisp: Remove ISP controls which get passed through to the camera
      media: atomisp: Stop setting sd->devnode for the ATOMISP_SUBDEV v4l2-subdev
      media: atomisp: Add DMABUF support
      media: atomisp: Change ISP subdev name to "ATOM ISP"
      media: atomisp: Make MC link from ISP to /dev/video# output node immutable
      media: atomisp: Implement link_setup() op for ISP subdev MC entity
      media: atomisp: Drop second V4L2_PIX_FMT_UYVY atomisp_output_fmts[] entry
      media: atomisp: Replace V4L2_PIX_FMT_RGB32 with V4L2_PIX_FMT_RGBX32
      media: atomisp: Disable broken V4L2_PIX_FMT_RGBX32 output support
      media: atomisp: Initialize sequence counters to 0 instead of -1

Jonathan Bergh (10):
      staging: media: atomisp: Fix various formatting issues and remove unneccesary braces
      staging: media: atomisp: Fix formatting issues and minor code issue
      staging: media: atomisp: Remove unnecessary braces from single line conditional statements
      staging: media: atomisp: Fixed "unsigned int *" rather than "unsigned *" declaration in variable declaration
      staging: media: atomisp: Ensure trailing statements are on a newline and remove spurious whitespaces
      staging: media: atomisp: Remove unnecessary parentheses from conditional statement
      staging: media: atomisp: Remove unneeded return statement from void function
      staging: media: atomisp: Remove old commented code and fix multiple block comment style
      staging: media: atomisp: Fix various multiline block comment formatting instances
      staging: media: atomisp: Remove extra whitespace after opening parentheses

Zhipeng Lu (1):
      media: atomisp: ssh_css: Fix a null-pointer dereference in load_video_binaries

 .../staging/media/atomisp/include/linux/atomisp.h  |  24 --
 .../media/atomisp/include/linux/atomisp_platform.h |   5 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |  31 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c      |  28 +-
 .../staging/media/atomisp/pci/atomisp_internal.h   |   7 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  | 362 +--------------------
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 102 +++---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  98 +++---
 drivers/staging/media/atomisp/pci/bits.h           |   4 +-
 drivers/staging/media/atomisp/pci/defs.h           |  37 ---
 .../pci/hive_isp_css_common/host/dma_local.h       |   1 -
 drivers/staging/media/atomisp/pci/hive_types.h     |  19 --
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |   3 +-
 drivers/staging/media/atomisp/pci/sh_css.c         |   1 +
 drivers/staging/media/atomisp/pci/sh_css_sp.c      | 113 ++++---
 15 files changed, 221 insertions(+), 614 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/defs.h



