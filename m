Return-Path: <linux-media+bounces-20796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAD29BB448
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 13:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 320501C213FD
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 12:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6E91B5823;
	Mon,  4 Nov 2024 12:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CdqK+VR/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514291B4F15
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 12:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730722370; cv=none; b=pS2xbgCeYnXJBaS73J/Kyd9aKkoc3auvMLsc0rbG1RivyvGkDSnlhdqrLqFoQCr7Cv863JtcbPO1AZ1sg+lU9qu03DRrwTz86opKXc+jH8/uEUAdfmYCQpZVqI5gThF97UVPEJ+EnU1dirnxX2OxQa/+QDweoKikcXstBA+MGpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730722370; c=relaxed/simple;
	bh=Gam4qQM+TuwrG8GErWRg/K7gPWF/f54RrRvlRbIL5iE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Lb2KWUViVURGLyAb72hrcDrW8uSMH993BSt5EAmOtop8+B4USBBpo598C9QRfmsvwimufNCLzFWTel9Ipf8F0I/35oZS4VcI780Z82CCwfVduQTNhONr6QsU9PvMZMmOBVy5tqDSpFanM4ihy2GTlMLMMKW8EckdkeldUuzoE6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CdqK+VR/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730722365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+6tWW/+vQgvNSHVhkomxNT41xc0hxNY2CFQnhPSigtY=;
	b=CdqK+VR/Yr2IKwO33SOBK3rYVmr3DRpXFtz3sGBuQ01yct3TLhSbPGLqlS0yh2+aF+k0AT
	COu08zxxvshBwbKmJGsG25/bI7a1/fJA9k9hKUATYc3/Haudup68IUhSFWoVU2c8SFRvFw
	cAJWWEw0rOrskL/ocgs0BOq/xV8MDNA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-ht3tP2pmOCaHZNZ-hVXEcw-1; Mon, 04 Nov 2024 07:12:43 -0500
X-MC-Unique: ht3tP2pmOCaHZNZ-hVXEcw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a99efc7d881so274019366b.1
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 04:12:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730722362; x=1731327162;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+6tWW/+vQgvNSHVhkomxNT41xc0hxNY2CFQnhPSigtY=;
        b=Q0ooUS6lUJ1QPEQwhQEUiwmq1CA1o5M/PEdPiyQuIYhjDkeOsbu5TWQQi6oh006bAU
         QKQKmas/lw+yRPsOHubu+Ee7BzpHffNkV30JrhbBp1IYuH6MKBymhTty709G6Y/tdqXg
         o3/FUxcLkePIbwa55/ggrGVk/ubLW1oCh4DsS8lMMw5e9MqBPA5oGyt5/klVpup55tfw
         TOd/+ZgrkVpj2kDsvo4rIs+YFIePp4XChsVWKfEFW2uG+bdQ5ffes9WVM+9VnrxGNHaL
         sqGy/Qm8UpFGcH2G6xHBvhbkzFQVfBrtTwzbn8nmAUgrAC/GiGvW4hrUtD7+q8CFLOPf
         9zCA==
X-Forwarded-Encrypted: i=1; AJvYcCW4R0iq5cXoEDn7GxZrq75fpEcZUITVKND2+WxrdwwutOQTkRaWGSv9WL+m6EO2TPQzfSyywIWUpUKvnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygoNUjNRWg0u8XbFFs+aQwa7N5gRcs4x0y0NxLpNZFhrdx8Me0
	aoNfd4RMGnDAHAbdnjR4UVdKDsnWsz9F7xxN0EW7c4A+Vc1mV9f2EYfsA1sFSM0LHSM7WartU4P
	B3FlgqtLFS2NrpRKOYkS2IJvA8aB7Gb2rqD8+E/3f1utpPamlvNJs27Sn37y9
X-Received: by 2002:a17:907:724d:b0:a9a:bbcc:5092 with SMTP id a640c23a62f3a-a9e50978806mr951870966b.39.1730722361838;
        Mon, 04 Nov 2024 04:12:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkzpDHbVMG4FZetPpNKm2YMn2sUtYYGGinwQN5iB3OYNqNoNo0b/+t2pqWCCRW9cdz3vhTHQ==
X-Received: by 2002:a17:907:724d:b0:a9a:bbcc:5092 with SMTP id a640c23a62f3a-a9e50978806mr951868166b.39.1730722361030;
        Mon, 04 Nov 2024 04:12:41 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56494584sm543836566b.6.2024.11.04.04.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 04:12:40 -0800 (PST)
Message-ID: <51e5e1cf-8aff-44fc-b40c-a0074a770a69@redhat.com>
Date: Mon, 4 Nov 2024 13:12:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] media: atomisp: Changes for 6.13-1
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro, Hans,

Here are the atomisp changes for 6.13.

Highlights:
- Working mt9m114 sensor on Asus T100TA (using atomisp specific sensor
  driver for now)
- Drop unused libmsrlisthelper
- Bunch of janitorial fixes

Regards,

Hans


The following changes since commit c7ccf3683ac9746b263b0502255f5ce47f64fe0a:

  media: ati_remote: don't push static constants on stack for %*ph (2024-10-29 16:37:23 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.13-1

for you to fetch changes up to 4a442841b0450a8bfaa46ae68b7eaea816bdaa58:

  media: atomisp: Add check for rgby_data memory allocation failure (2024-11-04 13:03:33 +0100)

----------------------------------------------------------------
atomisp staging driver changes for 6.13-1

Highlights:
- Working mt9m114 sensor on Asus T100TA (using atomisp specific sensor
  driver for now)
- Bunch of janetorial fixes

----------------------------------------------------------------
Andy Shevchenko (1):
      media: atomisp: Remove License information boilerplate

Colin Ian King (1):
      media: atomisp: remove redundant re-checking of err

Everest K.C. (2):
      media: atomisp: hmm_bo: Fix spelling errors in hmm_bo.h
      media: atomisp: Fix spelling errors reported by codespell

Hans de Goede (5):
      media: atomisp: Remove unused libmsrlisthelper
      media: atomisp: Fix WARN_ON() in vb2_start_streaming() triggering
      media: atomisp: mt9m114: Disable V4L2_CID_3A_LOCK control
      media: atomisp: mt9m114: Add missing mutex_init() call
      media: atomisp: mt9m114: Fix fmt->code not getting set on try_fmt

Li Huafei (1):
      media: atomisp: Add check for rgby_data memory allocation failure

Yu Jiaoliang (1):
      media: atomisp: Fix typos in comment

 drivers/staging/media/atomisp/i2c/Kconfig          |  10 -
 drivers/staging/media/atomisp/i2c/Makefile         |   2 -
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c |  10 -
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |  10 -
 .../media/atomisp/i2c/atomisp-libmsrlisthelper.c   | 211 ---------------------
 .../staging/media/atomisp/i2c/atomisp-mt9m114.c    |  24 +--
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c |  10 -
 drivers/staging/media/atomisp/i2c/gc2235.h         |  13 --
 drivers/staging/media/atomisp/i2c/mt9m114.h        |  11 --
 drivers/staging/media/atomisp/i2c/ov2722.h         |  11 --
 drivers/staging/media/atomisp/include/hmm/hmm.h    |  11 --
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h |  15 +-
 .../staging/media/atomisp/include/hmm/hmm_common.h |  11 --
 .../staging/media/atomisp/include/linux/atomisp.h  |  11 --
 .../atomisp/include/linux/atomisp_gmin_platform.h  |   9 -
 .../media/atomisp/include/linux/atomisp_platform.h |  11 --
 .../media/atomisp/include/linux/libmsrlisthelper.h |  28 ---
 .../staging/media/atomisp/include/mmu/isp_mmu.h    |  11 --
 .../media/atomisp/include/mmu/sh_mmu_mrfld.h       |  11 --
 drivers/staging/media/atomisp/pci/atomisp-regs.h   |  11 --
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |  11 --
 drivers/staging/media/atomisp/pci/atomisp_cmd.h    |  11 --
 drivers/staging/media/atomisp/pci/atomisp_common.h |  11 --
 drivers/staging/media/atomisp/pci/atomisp_compat.h |  11 --
 .../media/atomisp/pci/atomisp_compat_css20.c       |  11 --
 .../media/atomisp/pci/atomisp_compat_css20.h       |  11 --
 .../media/atomisp/pci/atomisp_compat_ioctl32.h     |  11 --
 drivers/staging/media/atomisp/pci/atomisp_csi2.c   |  11 --
 drivers/staging/media/atomisp/pci/atomisp_csi2.h   |  11 --
 .../staging/media/atomisp/pci/atomisp_dfs_tables.h |  11 --
 drivers/staging/media/atomisp/pci/atomisp_drvfs.c  |  11 --
 drivers/staging/media/atomisp/pci/atomisp_drvfs.h  |  11 --
 drivers/staging/media/atomisp/pci/atomisp_fops.c   |  11 --
 drivers/staging/media/atomisp/pci/atomisp_fops.h   |  11 --
 .../staging/media/atomisp/pci/atomisp_internal.h   |  11 --
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |  24 +--
 drivers/staging/media/atomisp/pci/atomisp_ioctl.h  |  11 --
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |  11 --
 drivers/staging/media/atomisp/pci/atomisp_subdev.h |  11 --
 drivers/staging/media/atomisp/pci/atomisp_tables.h |  11 --
 .../media/atomisp/pci/atomisp_trace_event.h        |  11 --
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  13 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.h   |  11 --
 .../pci/base/circbuf/interface/ia_css_circbuf.h    |   9 -
 .../base/circbuf/interface/ia_css_circbuf_comm.h   |   9 -
 .../base/circbuf/interface/ia_css_circbuf_desc.h   |   9 -
 .../media/atomisp/pci/base/circbuf/src/circbuf.c   |   9 -
 .../pci/base/refcount/interface/ia_css_refcount.h  |   9 -
 .../media/atomisp/pci/base/refcount/src/refcount.c |   9 -
 drivers/staging/media/atomisp/pci/bits.h           |   9 -
 .../camera/pipe/interface/ia_css_pipe_binarydesc.h |   9 -
 .../camera/pipe/interface/ia_css_pipe_stagedesc.h  |   9 -
 .../pci/camera/pipe/interface/ia_css_pipe_util.h   |   9 -
 .../atomisp/pci/camera/pipe/src/pipe_binarydesc.c  |   9 -
 .../atomisp/pci/camera/pipe/src/pipe_stagedesc.c   |   9 -
 .../media/atomisp/pci/camera/pipe/src/pipe_util.c  |   9 -
 .../pci/camera/util/interface/ia_css_util.h        |   9 -
 .../media/atomisp/pci/camera/util/src/util.c       |   9 -
 drivers/staging/media/atomisp/pci/cell_params.h    |   9 -
 .../atomisp/pci/css_2401_system/csi_rx_global.h    |   9 -
 .../atomisp/pci/css_2401_system/host/csi_rx.c      |   9 -
 .../pci/css_2401_system/host/csi_rx_local.h        |   9 -
 .../pci/css_2401_system/host/csi_rx_private.h      |   9 -
 .../atomisp/pci/css_2401_system/host/ibuf_ctrl.c   |   9 -
 .../pci/css_2401_system/host/ibuf_ctrl_local.h     |   9 -
 .../atomisp/pci/css_2401_system/host/isys_dma.c    |   9 -
 .../pci/css_2401_system/host/isys_dma_private.h    |   9 -
 .../atomisp/pci/css_2401_system/host/isys_irq.c    |   9 -
 .../pci/css_2401_system/host/isys_irq_local.h      |   9 -
 .../pci/css_2401_system/host/isys_irq_private.h    |   9 -
 .../pci/css_2401_system/host/isys_stream2mmio.c    |   9 -
 .../css_2401_system/host/isys_stream2mmio_local.h  |   9 -
 .../host/isys_stream2mmio_private.h                |   9 -
 .../pci/css_2401_system/host/pixelgen_local.h      |   9 -
 .../pci/css_2401_system/host/pixelgen_private.h    |   9 -
 .../css_2401_system/hrt/PixelGen_SysBlock_defs.h   |   9 -
 .../pci/css_2401_system/hrt/ibuf_cntrl_defs.h      |   9 -
 .../css_2401_system/hrt/mipi_backend_common_defs.h |   9 -
 .../pci/css_2401_system/hrt/mipi_backend_defs.h    |   9 -
 .../atomisp/pci/css_2401_system/hrt/rx_csi_defs.h  |   9 -
 .../pci/css_2401_system/hrt/stream2mmio_defs.h     |   9 -
 .../atomisp/pci/css_2401_system/ibuf_ctrl_global.h |   9 -
 .../atomisp/pci/css_2401_system/isys_dma_global.h  |   9 -
 .../atomisp/pci/css_2401_system/isys_irq_global.h  |   9 -
 .../pci/css_2401_system/isys_stream2mmio_global.h  |   9 -
 .../atomisp/pci/css_2401_system/pixelgen_global.h  |   9 -
 .../atomisp/pci/css_receiver_2400_common_defs.h    |   9 -
 .../media/atomisp/pci/css_receiver_2400_defs.h     |   9 -
 drivers/staging/media/atomisp/pci/css_trace.h      |   9 -
 drivers/staging/media/atomisp/pci/dma_v2_defs.h    |   9 -
 drivers/staging/media/atomisp/pci/gdc_v2_defs.h    |   9 -
 drivers/staging/media/atomisp/pci/gp_timer_defs.h  |   9 -
 .../staging/media/atomisp/pci/gpio_block_defs.h    |   9 -
 .../atomisp/pci/hive_isp_css_common/debug_global.h |   9 -
 .../atomisp/pci/hive_isp_css_common/dma_global.h   |  10 -
 .../pci/hive_isp_css_common/event_fifo_global.h    |   9 -
 .../pci/hive_isp_css_common/fifo_monitor_global.h  |   9 -
 .../atomisp/pci/hive_isp_css_common/gdc_global.h   |   9 -
 .../pci/hive_isp_css_common/gp_device_global.h     |   9 -
 .../pci/hive_isp_css_common/gp_timer_global.h      |   9 -
 .../atomisp/pci/hive_isp_css_common/gpio_global.h  |   9 -
 .../atomisp/pci/hive_isp_css_common/hmem_global.h  |   9 -
 .../atomisp/pci/hive_isp_css_common/host/debug.c   |   9 -
 .../pci/hive_isp_css_common/host/debug_local.h     |   9 -
 .../pci/hive_isp_css_common/host/debug_private.h   |   9 -
 .../atomisp/pci/hive_isp_css_common/host/dma.c     |   9 -
 .../pci/hive_isp_css_common/host/dma_local.h       |   9 -
 .../pci/hive_isp_css_common/host/dma_private.h     |   9 -
 .../pci/hive_isp_css_common/host/event_fifo.c      |   9 -
 .../hive_isp_css_common/host/event_fifo_local.h    |   9 -
 .../hive_isp_css_common/host/event_fifo_private.h  |   9 -
 .../pci/hive_isp_css_common/host/fifo_monitor.c    |   9 -
 .../hive_isp_css_common/host/fifo_monitor_local.h  |   9 -
 .../host/fifo_monitor_private.h                    |   9 -
 .../atomisp/pci/hive_isp_css_common/host/gdc.c     |   9 -
 .../pci/hive_isp_css_common/host/gdc_local.h       |   9 -
 .../pci/hive_isp_css_common/host/gdc_private.h     |   9 -
 .../pci/hive_isp_css_common/host/gp_device.c       |   9 -
 .../pci/hive_isp_css_common/host/gp_device_local.h |   9 -
 .../hive_isp_css_common/host/gp_device_private.h   |   9 -
 .../pci/hive_isp_css_common/host/gp_timer.c        |   9 -
 .../pci/hive_isp_css_common/host/gp_timer_local.h  |   9 -
 .../hive_isp_css_common/host/gp_timer_private.h    |   9 -
 .../pci/hive_isp_css_common/host/gpio_private.h    |   9 -
 .../atomisp/pci/hive_isp_css_common/host/hmem.c    |   9 -
 .../pci/hive_isp_css_common/host/hmem_local.h      |   9 -
 .../pci/hive_isp_css_common/host/hmem_private.h    |   9 -
 .../pci/hive_isp_css_common/host/input_formatter.c |   9 -
 .../host/input_formatter_local.h                   |   9 -
 .../host/input_formatter_private.h                 |   9 -
 .../pci/hive_isp_css_common/host/input_system.c    |  11 +-
 .../atomisp/pci/hive_isp_css_common/host/irq.c     |   9 -
 .../pci/hive_isp_css_common/host/irq_local.h       |   9 -
 .../pci/hive_isp_css_common/host/irq_private.h     |   9 -
 .../atomisp/pci/hive_isp_css_common/host/isp.c     |   9 -
 .../pci/hive_isp_css_common/host/isp_local.h       |   9 -
 .../pci/hive_isp_css_common/host/isp_private.h     |   9 -
 .../atomisp/pci/hive_isp_css_common/host/mmu.c     |   9 -
 .../pci/hive_isp_css_common/host/mmu_local.h       |   9 -
 .../atomisp/pci/hive_isp_css_common/host/sp.c      |   9 -
 .../pci/hive_isp_css_common/host/sp_local.h        |   9 -
 .../pci/hive_isp_css_common/host/sp_private.h      |   9 -
 .../pci/hive_isp_css_common/host/timed_ctrl.c      |   9 -
 .../hive_isp_css_common/host/timed_ctrl_local.h    |   9 -
 .../hive_isp_css_common/host/timed_ctrl_private.h  |   9 -
 .../pci/hive_isp_css_common/host/vamem_local.h     |   9 -
 .../atomisp/pci/hive_isp_css_common/host/vmem.c    |   9 -
 .../pci/hive_isp_css_common/host/vmem_local.h      |   9 -
 .../pci/hive_isp_css_common/host/vmem_private.h    |   9 -
 .../hive_isp_css_common/input_formatter_global.h   |   9 -
 .../atomisp/pci/hive_isp_css_common/irq_global.h   |   9 -
 .../atomisp/pci/hive_isp_css_common/isp_global.h   |   9 -
 .../atomisp/pci/hive_isp_css_common/mmu_global.h   |   9 -
 .../atomisp/pci/hive_isp_css_common/sp_global.h    |   9 -
 .../pci/hive_isp_css_common/timed_ctrl_global.h    |   9 -
 .../atomisp/pci/hive_isp_css_common/vamem_global.h |   9 -
 .../atomisp/pci/hive_isp_css_common/vmem_global.h  |   9 -
 .../staging/media/atomisp/pci/hive_isp_css_defs.h  |   9 -
 .../pci/hive_isp_css_include/assert_support.h      |   9 -
 .../pci/hive_isp_css_include/bitop_support.h       |   9 -
 .../atomisp/pci/hive_isp_css_include/csi_rx.h      |   9 -
 .../media/atomisp/pci/hive_isp_css_include/debug.h |   9 -
 .../device_access/device_access.h                  |   8 -
 .../media/atomisp/pci/hive_isp_css_include/dma.h   |   9 -
 .../atomisp/pci/hive_isp_css_include/event_fifo.h  |   9 -
 .../pci/hive_isp_css_include/fifo_monitor.h        |   9 -
 .../atomisp/pci/hive_isp_css_include/gdc_device.h  |   9 -
 .../atomisp/pci/hive_isp_css_include/gp_device.h   |   9 -
 .../atomisp/pci/hive_isp_css_include/gp_timer.h    |   9 -
 .../media/atomisp/pci/hive_isp_css_include/hmem.h  |   9 -
 .../pci/hive_isp_css_include/host/csi_rx_public.h  |   9 -
 .../pci/hive_isp_css_include/host/debug_public.h   |   9 -
 .../pci/hive_isp_css_include/host/dma_public.h     |   9 -
 .../hive_isp_css_include/host/event_fifo_public.h  |   9 -
 .../host/fifo_monitor_public.h                     |   9 -
 .../pci/hive_isp_css_include/host/gdc_public.h     |   9 -
 .../hive_isp_css_include/host/gp_device_public.h   |   9 -
 .../hive_isp_css_include/host/gp_timer_public.h    |   9 -
 .../pci/hive_isp_css_include/host/hmem_public.h    |   9 -
 .../host/input_formatter_public.h                  |   9 -
 .../pci/hive_isp_css_include/host/irq_public.h     |   9 -
 .../pci/hive_isp_css_include/host/isp_public.h     |   9 -
 .../hive_isp_css_include/host/isys_dma_public.h    |   9 -
 .../hive_isp_css_include/host/isys_irq_public.h    |   9 -
 .../host/isys_stream2mmio_public.h                 |   9 -
 .../pci/hive_isp_css_include/host/mmu_public.h     |   9 -
 .../hive_isp_css_include/host/pixelgen_public.h    |   9 -
 .../pci/hive_isp_css_include/host/sp_public.h      |   9 -
 .../pci/hive_isp_css_include/host/tag_public.h     |   9 -
 .../hive_isp_css_include/host/timed_ctrl_public.h  |   9 -
 .../pci/hive_isp_css_include/host/vamem_public.h   |   9 -
 .../pci/hive_isp_css_include/host/vmem_public.h    |   9 -
 .../pci/hive_isp_css_include/input_formatter.h     |   9 -
 .../pci/hive_isp_css_include/input_system.h        |   9 -
 .../media/atomisp/pci/hive_isp_css_include/irq.h   |   9 -
 .../media/atomisp/pci/hive_isp_css_include/isp.h   |   9 -
 .../atomisp/pci/hive_isp_css_include/isys_irq.h    |   9 -
 .../pci/hive_isp_css_include/isys_stream2mmio.h    |   9 -
 .../pci/hive_isp_css_include/math_support.h        |   9 -
 .../pci/hive_isp_css_include/misc_support.h        |   9 -
 .../atomisp/pci/hive_isp_css_include/mmu_device.h  |   9 -
 .../atomisp/pci/hive_isp_css_include/pixelgen.h    |   9 -
 .../pci/hive_isp_css_include/platform_support.h    |   9 -
 .../pci/hive_isp_css_include/print_support.h       |   9 -
 .../media/atomisp/pci/hive_isp_css_include/queue.h |   9 -
 .../atomisp/pci/hive_isp_css_include/resource.h    |   9 -
 .../media/atomisp/pci/hive_isp_css_include/sp.h    |   9 -
 .../media/atomisp/pci/hive_isp_css_include/tag.h   |   9 -
 .../atomisp/pci/hive_isp_css_include/timed_ctrl.h  |   9 -
 .../pci/hive_isp_css_include/type_support.h        |   9 -
 .../media/atomisp/pci/hive_isp_css_include/vamem.h |   9 -
 .../media/atomisp/pci/hive_isp_css_include/vmem.h  |   9 -
 .../pci/hive_isp_css_shared/host/queue_local.h     |   9 -
 .../pci/hive_isp_css_shared/host/queue_private.h   |   9 -
 .../atomisp/pci/hive_isp_css_shared/host/tag.c     |   9 -
 .../pci/hive_isp_css_shared/host/tag_local.h       |   9 -
 .../pci/hive_isp_css_shared/host/tag_private.h     |   9 -
 .../atomisp/pci/hive_isp_css_shared/queue_global.h |   9 -
 .../pci/hive_isp_css_shared/sw_event_global.h      |   9 -
 .../atomisp/pci/hive_isp_css_shared/tag_global.h   |   9 -
 .../pci/hive_isp_css_streaming_to_mipi_types_hrt.h |   9 -
 drivers/staging/media/atomisp/pci/hive_types.h     |   9 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c        |  11 --
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     |  11 --
 drivers/staging/media/atomisp/pci/ia_css.h         |   9 -
 drivers/staging/media/atomisp/pci/ia_css_3a.h      |   9 -
 .../staging/media/atomisp/pci/ia_css_acc_types.h   |   9 -
 drivers/staging/media/atomisp/pci/ia_css_buffer.h  |   9 -
 drivers/staging/media/atomisp/pci/ia_css_control.h |   9 -
 .../media/atomisp/pci/ia_css_device_access.c       |   9 -
 .../media/atomisp/pci/ia_css_device_access.h       |   9 -
 drivers/staging/media/atomisp/pci/ia_css_dvs.h     |   9 -
 drivers/staging/media/atomisp/pci/ia_css_env.h     |   9 -
 drivers/staging/media/atomisp/pci/ia_css_err.h     |   9 -
 .../media/atomisp/pci/ia_css_event_public.h        |   9 -
 .../staging/media/atomisp/pci/ia_css_firmware.h    |   9 -
 drivers/staging/media/atomisp/pci/ia_css_frac.h    |   9 -
 .../media/atomisp/pci/ia_css_frame_format.h        |   9 -
 .../media/atomisp/pci/ia_css_frame_public.h        |   9 -
 .../staging/media/atomisp/pci/ia_css_host_data.h   |   9 -
 .../staging/media/atomisp/pci/ia_css_input_port.h  |   9 -
 drivers/staging/media/atomisp/pci/ia_css_irq.h     |   9 -
 .../staging/media/atomisp/pci/ia_css_isp_configs.c |   9 -
 .../staging/media/atomisp/pci/ia_css_isp_configs.h |   9 -
 .../staging/media/atomisp/pci/ia_css_isp_params.c  |   9 -
 .../staging/media/atomisp/pci/ia_css_isp_params.h  |   9 -
 .../staging/media/atomisp/pci/ia_css_isp_states.c  |   9 -
 .../staging/media/atomisp/pci/ia_css_isp_states.h  |   9 -
 .../staging/media/atomisp/pci/ia_css_metadata.h    |   9 -
 drivers/staging/media/atomisp/pci/ia_css_mipi.h    |   9 -
 drivers/staging/media/atomisp/pci/ia_css_mmu.h     |   9 -
 .../staging/media/atomisp/pci/ia_css_mmu_private.h |   9 -
 drivers/staging/media/atomisp/pci/ia_css_morph.h   |   9 -
 drivers/staging/media/atomisp/pci/ia_css_pipe.h    |   9 -
 .../staging/media/atomisp/pci/ia_css_pipe_public.h |   9 -
 drivers/staging/media/atomisp/pci/ia_css_prbs.h    |   9 -
 .../staging/media/atomisp/pci/ia_css_properties.h  |   9 -
 drivers/staging/media/atomisp/pci/ia_css_shading.h |   9 -
 drivers/staging/media/atomisp/pci/ia_css_stream.h  |   9 -
 .../media/atomisp/pci/ia_css_stream_format.h       |   9 -
 .../media/atomisp/pci/ia_css_stream_public.h       |   9 -
 drivers/staging/media/atomisp/pci/ia_css_timer.h   |   8 -
 drivers/staging/media/atomisp/pci/ia_css_types.h   |   9 -
 drivers/staging/media/atomisp/pci/ia_css_version.h |   9 -
 .../media/atomisp/pci/ia_css_version_data.h        |   9 -
 drivers/staging/media/atomisp/pci/if_defs.h        |   9 -
 .../atomisp/pci/input_formatter_subsystem_defs.h   |   9 -
 .../media/atomisp/pci/input_selector_defs.h        |   9 -
 .../media/atomisp/pci/input_switch_2400_defs.h     |   9 -
 .../media/atomisp/pci/input_system_ctrl_defs.h     |   9 -
 .../staging/media/atomisp/pci/input_system_defs.h  |   9 -
 .../media/atomisp/pci/irq_controller_defs.h        |   9 -
 drivers/staging/media/atomisp/pci/irq_types_hrt.h  |   9 -
 .../pci/isp/kernels/aa/aa_2/ia_css_aa2.host.c      |   9 -
 .../pci/isp/kernels/aa/aa_2/ia_css_aa2.host.h      |   9 -
 .../pci/isp/kernels/aa/aa_2/ia_css_aa2_param.h     |   9 -
 .../pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h     |   9 -
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c  |   9 -
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h  |   9 -
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr_param.h |   9 -
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h |   9 -
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c   |   9 -
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h   |   9 -
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2_param.h  |   9 -
 .../isp/kernels/anr/anr_2/ia_css_anr2_table.host.c |   9 -
 .../isp/kernels/anr/anr_2/ia_css_anr2_table.host.h |   9 -
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2_types.h  |   9 -
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.c       |   9 -
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.h       |   9 -
 .../pci/isp/kernels/bh/bh_2/ia_css_bh_param.h      |   9 -
 .../pci/isp/kernels/bh/bh_2/ia_css_bh_types.h      |   9 -
 .../pci/isp/kernels/bnlm/ia_css_bnlm.host.c        |   9 -
 .../pci/isp/kernels/bnlm/ia_css_bnlm.host.h        |   9 -
 .../pci/isp/kernels/bnlm/ia_css_bnlm_param.h       |   9 -
 .../pci/isp/kernels/bnlm/ia_css_bnlm_types.h       |   9 -
 .../isp/kernels/bnr/bnr2_2/ia_css_bnr2_2.host.c    |   9 -
 .../isp/kernels/bnr/bnr2_2/ia_css_bnr2_2.host.h    |   9 -
 .../isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_param.h   |   9 -
 .../isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h   |   9 -
 .../pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c  |   9 -
 .../pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.h  |   9 -
 .../pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr_param.h |   9 -
 .../pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c  |   9 -
 .../pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.h  |   9 -
 .../pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr_param.h |   9 -
 .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.host.c   |   9 -
 .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.host.h   |   9 -
 .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_param.h  |   9 -
 .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_types.h  |   9 -
 .../conversion_1.0/ia_css_conversion.host.c        |   9 -
 .../conversion_1.0/ia_css_conversion.host.h        |   9 -
 .../conversion_1.0/ia_css_conversion_param.h       |   9 -
 .../conversion_1.0/ia_css_conversion_types.h       |   9 -
 .../copy_output_1.0/ia_css_copy_output.host.c      |   9 -
 .../copy_output_1.0/ia_css_copy_output.host.h      |   9 -
 .../copy_output_1.0/ia_css_copy_output_param.h     |   9 -
 .../isp/kernels/crop/crop_1.0/ia_css_crop.host.c   |   9 -
 .../isp/kernels/crop/crop_1.0/ia_css_crop.host.h   |   9 -
 .../isp/kernels/crop/crop_1.0/ia_css_crop_param.h  |   9 -
 .../isp/kernels/crop/crop_1.0/ia_css_crop_types.h  |   9 -
 .../pci/isp/kernels/csc/csc_1.0/ia_css_csc.host.c  |   9 -
 .../pci/isp/kernels/csc/csc_1.0/ia_css_csc.host.h  |   9 -
 .../pci/isp/kernels/csc/csc_1.0/ia_css_csc_param.h |   9 -
 .../pci/isp/kernels/csc/csc_1.0/ia_css_csc_types.h |   9 -
 .../isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c    |   9 -
 .../isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.h    |   9 -
 .../isp/kernels/ctc/ctc1_5/ia_css_ctc1_5_param.h   |   9 -
 .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c    |   9 -
 .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.h    |   9 -
 .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2_param.h   |   9 -
 .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h   |   9 -
 .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.c  |   9 -
 .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.h  |   9 -
 .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_param.h |   9 -
 .../kernels/ctc/ctc_1.0/ia_css_ctc_table.host.c    |   9 -
 .../kernels/ctc/ctc_1.0/ia_css_ctc_table.host.h    |   9 -
 .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_types.h |   9 -
 .../pci/isp/kernels/de/de_1.0/ia_css_de.host.c     |   9 -
 .../pci/isp/kernels/de/de_1.0/ia_css_de.host.h     |   9 -
 .../pci/isp/kernels/de/de_1.0/ia_css_de_param.h    |   9 -
 .../pci/isp/kernels/de/de_1.0/ia_css_de_types.h    |   9 -
 .../pci/isp/kernels/de/de_2/ia_css_de2.host.c      |   9 -
 .../pci/isp/kernels/de/de_2/ia_css_de2.host.h      |   9 -
 .../pci/isp/kernels/de/de_2/ia_css_de2_param.h     |   9 -
 .../pci/isp/kernels/de/de_2/ia_css_de2_types.h     |   9 -
 .../pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c     |   9 -
 .../pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.h     |   9 -
 .../pci/isp/kernels/dp/dp_1.0/ia_css_dp_param.h    |   9 -
 .../pci/isp/kernels/dp/dp_1.0/ia_css_dp_types.h    |   9 -
 .../pci/isp/kernels/dpc2/ia_css_dpc2.host.c        |   9 -
 .../pci/isp/kernels/dpc2/ia_css_dpc2.host.h        |   9 -
 .../pci/isp/kernels/dpc2/ia_css_dpc2_param.h       |   9 -
 .../pci/isp/kernels/dpc2/ia_css_dpc2_types.h       |   9 -
 .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c  |   9 -
 .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h  |   9 -
 .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_param.h |   9 -
 .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_types.h |   9 -
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c    |   9 -
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8.host.h    |   9 -
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h   |   9 -
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h   |   9 -
 .../isp/kernels/fc/fc_1.0/ia_css_formats.host.c    |   9 -
 .../isp/kernels/fc/fc_1.0/ia_css_formats.host.h    |   9 -
 .../isp/kernels/fc/fc_1.0/ia_css_formats_param.h   |   9 -
 .../isp/kernels/fc/fc_1.0/ia_css_formats_types.h   |   9 -
 .../fixedbds/fixedbds_1.0/ia_css_fixedbds_param.h  |   9 -
 .../fixedbds/fixedbds_1.0/ia_css_fixedbds_types.h  |   9 -
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c  |   9 -
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h  |   9 -
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_param.h |   9 -
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_types.h |   9 -
 .../pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c     |   9 -
 .../pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.h     |   9 -
 .../pci/isp/kernels/gc/gc_1.0/ia_css_gc_param.h    |   9 -
 .../isp/kernels/gc/gc_1.0/ia_css_gc_table.host.c   |   9 -
 .../isp/kernels/gc/gc_1.0/ia_css_gc_table.host.h   |   9 -
 .../pci/isp/kernels/gc/gc_1.0/ia_css_gc_types.h    |   9 -
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2.host.c      |   9 -
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2.host.h      |   9 -
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2_param.h     |   9 -
 .../isp/kernels/gc/gc_2/ia_css_gc2_table.host.c    |   9 -
 .../isp/kernels/gc/gc_2/ia_css_gc2_table.host.h    |   9 -
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2_types.h     |   9 -
 .../atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.c  |   9 -
 .../atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.h  |   9 -
 .../atomisp/pci/isp/kernels/hdr/ia_css_hdr_param.h |   9 -
 .../atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h |   9 -
 .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c  |   9 -
 .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.h  |   9 -
 .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io_param.h |   9 -
 .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io_types.h |   9 -
 .../ipu2_io_ls/common/ia_css_common_io_param.h     |   8 -
 .../ipu2_io_ls/common/ia_css_common_io_types.h     |   8 -
 .../yuv444_io_ls/ia_css_yuv444_io.host.c           |   8 -
 .../yuv444_io_ls/ia_css_yuv444_io.host.h           |   8 -
 .../yuv444_io_ls/ia_css_yuv444_io_param.h          |   8 -
 .../yuv444_io_ls/ia_css_yuv444_io_types.h          |   8 -
 .../iterator/iterator_1.0/ia_css_iterator.host.c   |   9 -
 .../iterator/iterator_1.0/ia_css_iterator.host.h   |   9 -
 .../iterator/iterator_1.0/ia_css_iterator_param.h  |   9 -
 .../isp/kernels/macc/macc1_5/ia_css_macc1_5.host.c |   9 -
 .../isp/kernels/macc/macc1_5/ia_css_macc1_5.host.h |   9 -
 .../kernels/macc/macc1_5/ia_css_macc1_5_param.h    |   9 -
 .../macc/macc1_5/ia_css_macc1_5_table.host.c       |   9 -
 .../macc/macc1_5/ia_css_macc1_5_table.host.h       |   9 -
 .../kernels/macc/macc1_5/ia_css_macc1_5_types.h    |   9 -
 .../isp/kernels/macc/macc_1.0/ia_css_macc.host.c   |   9 -
 .../isp/kernels/macc/macc_1.0/ia_css_macc.host.h   |   9 -
 .../isp/kernels/macc/macc_1.0/ia_css_macc_param.h  |   9 -
 .../kernels/macc/macc_1.0/ia_css_macc_table.host.c |   9 -
 .../kernels/macc/macc_1.0/ia_css_macc_table.host.h |   9 -
 .../isp/kernels/macc/macc_1.0/ia_css_macc_types.h  |   9 -
 .../isp/kernels/norm/norm_1.0/ia_css_norm.host.c   |   9 -
 .../isp/kernels/norm/norm_1.0/ia_css_norm.host.h   |   9 -
 .../isp/kernels/norm/norm_1.0/ia_css_norm_param.h  |   9 -
 .../pci/isp/kernels/ob/ob2/ia_css_ob2.host.c       |   9 -
 .../pci/isp/kernels/ob/ob2/ia_css_ob2.host.h       |   9 -
 .../pci/isp/kernels/ob/ob2/ia_css_ob2_param.h      |   9 -
 .../pci/isp/kernels/ob/ob2/ia_css_ob2_types.h      |   9 -
 .../pci/isp/kernels/ob/ob_1.0/ia_css_ob.host.c     |   9 -
 .../pci/isp/kernels/ob/ob_1.0/ia_css_ob.host.h     |   9 -
 .../pci/isp/kernels/ob/ob_1.0/ia_css_ob_param.h    |   9 -
 .../pci/isp/kernels/ob/ob_1.0/ia_css_ob_types.h    |   9 -
 .../kernels/output/output_1.0/ia_css_output.host.c |   9 -
 .../kernels/output/output_1.0/ia_css_output.host.h |   9 -
 .../output/output_1.0/ia_css_output_param.h        |   9 -
 .../output/output_1.0/ia_css_output_types.h        |   9 -
 .../kernels/qplane/qplane_2/ia_css_qplane.host.c   |   9 -
 .../kernels/qplane/qplane_2/ia_css_qplane.host.h   |   9 -
 .../kernels/qplane/qplane_2/ia_css_qplane_param.h  |   9 -
 .../kernels/qplane/qplane_2/ia_css_qplane_types.h  |   9 -
 .../pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c  |   9 -
 .../pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.h  |   9 -
 .../pci/isp/kernels/raw/raw_1.0/ia_css_raw_param.h |   9 -
 .../pci/isp/kernels/raw/raw_1.0/ia_css_raw_types.h |   9 -
 .../raw_aa_binning_1.0/ia_css_raa.host.c           |   9 -
 .../raw_aa_binning_1.0/ia_css_raa.host.h           |   9 -
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c  |   9 -
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.h  |   9 -
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref_param.h |   9 -
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref_state.h |   9 -
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref_types.h |   9 -
 .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c  |   9 -
 .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.h  |   9 -
 .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_param.h |   9 -
 .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h |   9 -
 .../pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.c     |   9 -
 .../pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.h     |   9 -
 .../pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h    |   9 -
 .../pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h    |   9 -
 .../kernels/sdis/common/ia_css_sdis_common.host.h  |   9 -
 .../kernels/sdis/common/ia_css_sdis_common_types.h |   9 -
 .../isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c   |   9 -
 .../isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.h   |   9 -
 .../isp/kernels/sdis/sdis_1.0/ia_css_sdis_types.h  |   9 -
 .../isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c    |   9 -
 .../isp/kernels/sdis/sdis_2/ia_css_sdis2.host.h    |   9 -
 .../isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h   |   9 -
 .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.c  |   9 -
 .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.h  |   9 -
 .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_param.h |   9 -
 .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_types.h |   9 -
 .../pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h   |   8 -
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c  |   9 -
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h  |   9 -
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_param.h |   9 -
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_state.h |   9 -
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_types.h |   9 -
 .../pci/isp/kernels/uds/uds_1.0/ia_css_uds_param.h |   9 -
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c     |   9 -
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.h     |   9 -
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf_param.h    |   9 -
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf_types.h    |   9 -
 .../pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c     |   9 -
 .../pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.h     |   9 -
 .../pci/isp/kernels/wb/wb_1.0/ia_css_wb_param.h    |   9 -
 .../pci/isp/kernels/wb/wb_1.0/ia_css_wb_types.h    |   9 -
 .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c  |   9 -
 .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.h  |   9 -
 .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_param.h |   9 -
 .../kernels/xnr/xnr_1.0/ia_css_xnr_table.host.c    |   9 -
 .../kernels/xnr/xnr_1.0/ia_css_xnr_table.host.h    |   9 -
 .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_types.h |   9 -
 .../pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c |   9 -
 .../pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.h |   9 -
 .../isp/kernels/xnr/xnr_3.0/ia_css_xnr3_param.h    |   9 -
 .../isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h    |   9 -
 .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c  |   9 -
 .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.h  |   9 -
 .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_param.h |   9 -
 .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_types.h |   9 -
 .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.c   |   9 -
 .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.h   |   9 -
 .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_param.h  |   9 -
 .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_types.h  |   9 -
 .../pci/isp/modes/interface/input_buf.isp.h        |   8 -
 .../atomisp/pci/isp/modes/interface/isp_const.h    |   8 -
 .../atomisp/pci/isp/modes/interface/isp_types.h    |   9 -
 .../atomisp/pci/isp2400_input_system_global.h      |   9 -
 .../media/atomisp/pci/isp2400_input_system_local.h |   9 -
 .../atomisp/pci/isp2400_input_system_private.h     |   9 -
 .../atomisp/pci/isp2400_input_system_public.h      |   9 -
 .../staging/media/atomisp/pci/isp2400_support.h    |   9 -
 .../atomisp/pci/isp2401_input_system_global.h      |   9 -
 .../media/atomisp/pci/isp2401_input_system_local.h |   9 -
 .../atomisp/pci/isp2401_input_system_private.h     |   9 -
 .../media/atomisp/pci/isp_acquisition_defs.h       |   9 -
 .../staging/media/atomisp/pci/isp_capture_defs.h   |   9 -
 .../staging/media/atomisp/pci/mamoiada_params.h    |   9 -
 drivers/staging/media/atomisp/pci/mmu/isp_mmu.c    |  11 --
 .../staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c   |  11 --
 drivers/staging/media/atomisp/pci/mmu_defs.h       |   9 -
 .../pci/runtime/binary/interface/ia_css_binary.h   |   9 -
 .../media/atomisp/pci/runtime/binary/src/binary.c  |  11 +-
 .../pci/runtime/bufq/interface/ia_css_bufq.h       |   9 -
 .../pci/runtime/bufq/interface/ia_css_bufq_comm.h  |   9 -
 .../media/atomisp/pci/runtime/bufq/src/bufq.c      |   9 -
 .../pci/runtime/debug/interface/ia_css_debug.h     |   9 -
 .../debug/interface/ia_css_debug_internal.h        |   9 -
 .../runtime/debug/interface/ia_css_debug_pipe.h    |   9 -
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |   9 -
 .../pci/runtime/event/interface/ia_css_event.h     |   9 -
 .../media/atomisp/pci/runtime/event/src/event.c    |   9 -
 .../pci/runtime/eventq/interface/ia_css_eventq.h   |   9 -
 .../media/atomisp/pci/runtime/eventq/src/eventq.c  |   9 -
 .../pci/runtime/frame/interface/ia_css_frame.h     |   9 -
 .../runtime/frame/interface/ia_css_frame_comm.h    |   9 -
 .../media/atomisp/pci/runtime/frame/src/frame.c    |  11 +-
 .../pci/runtime/ifmtr/interface/ia_css_ifmtr.h     |   9 -
 .../media/atomisp/pci/runtime/ifmtr/src/ifmtr.c    |   9 -
 .../runtime/inputfifo/interface/ia_css_inputfifo.h |   9 -
 .../atomisp/pci/runtime/inputfifo/src/inputfifo.c  |   9 -
 .../runtime/isp_param/interface/ia_css_isp_param.h |   9 -
 .../isp_param/interface/ia_css_isp_param_types.h   |   8 -
 .../atomisp/pci/runtime/isp_param/src/isp_param.c  |   9 -
 .../pci/runtime/isys/interface/ia_css_isys.h       |   9 -
 .../pci/runtime/isys/interface/ia_css_isys_comm.h  |   9 -
 .../atomisp/pci/runtime/isys/src/csi_rx_rmgr.c     |   9 -
 .../atomisp/pci/runtime/isys/src/csi_rx_rmgr.h     |   9 -
 .../atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c  |   9 -
 .../atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.h  |   9 -
 .../atomisp/pci/runtime/isys/src/isys_dma_rmgr.c   |   9 -
 .../atomisp/pci/runtime/isys/src/isys_dma_rmgr.h   |   9 -
 .../media/atomisp/pci/runtime/isys/src/isys_init.c |   9 -
 .../pci/runtime/isys/src/isys_stream2mmio_rmgr.c   |   9 -
 .../pci/runtime/isys/src/isys_stream2mmio_rmgr.h   |   9 -
 .../media/atomisp/pci/runtime/isys/src/rx.c        |   9 -
 .../atomisp/pci/runtime/isys/src/virtual_isys.c    |   9 -
 .../atomisp/pci/runtime/isys/src/virtual_isys.h    |   9 -
 .../runtime/pipeline/interface/ia_css_pipeline.h   |   9 -
 .../pipeline/interface/ia_css_pipeline_common.h    |   9 -
 .../atomisp/pci/runtime/pipeline/src/pipeline.c    |   9 -
 .../pci/runtime/queue/interface/ia_css_queue.h     |   9 -
 .../runtime/queue/interface/ia_css_queue_comm.h    |   9 -
 .../media/atomisp/pci/runtime/queue/src/queue.c    |   9 -
 .../atomisp/pci/runtime/queue/src/queue_access.c   |   9 -
 .../atomisp/pci/runtime/queue/src/queue_access.h   |   9 -
 .../pci/runtime/rmgr/interface/ia_css_rmgr.h       |   9 -
 .../pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h  |   9 -
 .../media/atomisp/pci/runtime/rmgr/src/rmgr.c      |   9 -
 .../media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c |   9 -
 .../pci/runtime/spctrl/interface/ia_css_spctrl.h   |   9 -
 .../runtime/spctrl/interface/ia_css_spctrl_comm.h  |   9 -
 .../media/atomisp/pci/runtime/spctrl/src/spctrl.c  |   9 -
 .../tagger/interface/ia_css_tagger_common.h        |   9 -
 .../media/atomisp/pci/runtime/timer/src/timer.c    |   9 -
 .../atomisp/pci/scalar_processor_2400_params.h     |   9 -
 drivers/staging/media/atomisp/pci/sh_css.c         |  12 --
 drivers/staging/media/atomisp/pci/sh_css_defs.h    |   9 -
 .../staging/media/atomisp/pci/sh_css_firmware.c    |   9 -
 .../staging/media/atomisp/pci/sh_css_firmware.h    |   9 -
 drivers/staging/media/atomisp/pci/sh_css_frac.h    |   9 -
 .../staging/media/atomisp/pci/sh_css_host_data.c   |   9 -
 drivers/staging/media/atomisp/pci/sh_css_hrt.c     |   9 -
 drivers/staging/media/atomisp/pci/sh_css_hrt.h     |   9 -
 .../staging/media/atomisp/pci/sh_css_internal.h    |   9 -
 drivers/staging/media/atomisp/pci/sh_css_legacy.h  |   9 -
 drivers/staging/media/atomisp/pci/sh_css_metrics.c |   9 -
 drivers/staging/media/atomisp/pci/sh_css_metrics.h |   9 -
 drivers/staging/media/atomisp/pci/sh_css_mipi.c    |  11 +-
 drivers/staging/media/atomisp/pci/sh_css_mipi.h    |   9 -
 drivers/staging/media/atomisp/pci/sh_css_mmu.c     |   9 -
 .../staging/media/atomisp/pci/sh_css_param_dvs.c   |   9 -
 .../staging/media/atomisp/pci/sh_css_param_dvs.h   |   9 -
 .../media/atomisp/pci/sh_css_param_shading.c       |   9 -
 .../media/atomisp/pci/sh_css_param_shading.h       |   9 -
 drivers/staging/media/atomisp/pci/sh_css_params.c  |  11 +-
 drivers/staging/media/atomisp/pci/sh_css_params.h  |   9 -
 .../media/atomisp/pci/sh_css_params_internal.h     |   9 -
 .../staging/media/atomisp/pci/sh_css_properties.c  |   9 -
 drivers/staging/media/atomisp/pci/sh_css_sp.c      |   9 -
 drivers/staging/media/atomisp/pci/sh_css_sp.h      |   9 -
 .../media/atomisp/pci/sh_css_stream_format.c       |   9 -
 .../media/atomisp/pci/sh_css_stream_format.h       |   9 -
 drivers/staging/media/atomisp/pci/sh_css_struct.h  |   9 -
 drivers/staging/media/atomisp/pci/sh_css_uds.h     |   9 -
 drivers/staging/media/atomisp/pci/sh_css_version.c |   9 -
 drivers/staging/media/atomisp/pci/str2mem_defs.h   |   9 -
 .../media/atomisp/pci/streaming_to_mipi_defs.h     |   9 -
 drivers/staging/media/atomisp/pci/system_local.c   |   9 -
 drivers/staging/media/atomisp/pci/system_local.h   |   9 -
 .../media/atomisp/pci/timed_controller_defs.h      |   9 -
 drivers/staging/media/atomisp/pci/version.h        |   9 -
 603 files changed, 26 insertions(+), 5733 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
 delete mode 100644 drivers/staging/media/atomisp/include/linux/libmsrlisthelper.h


