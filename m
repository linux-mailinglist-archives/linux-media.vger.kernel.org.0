Return-Path: <linux-media+bounces-20987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 672569BDFCA
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 08:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B994282155
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 07:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DEEF1D356F;
	Wed,  6 Nov 2024 07:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="dVb1cqFy"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88341D270A
	for <linux-media@vger.kernel.org>; Wed,  6 Nov 2024 07:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730879727; cv=pass; b=jWpWvOtLzB7zklVdHgqaLM963LdTN3ZNXc5vEjl9YTE5BM6sX5JidopJbd+AekLY4KQFO/hJDgGsLXLfFUhVbz0H5uqckZ2r97I0U0Yy2MEjH/jdsI7cwvhMagz5BpEHULhXugMlu/jF6nbm3zjUO2FX9hXOTiqCZRgWMAZngEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730879727; c=relaxed/simple;
	bh=2GDp1AshOeWDptveaHxpuZs0D1xFX3yefoV0B2vi3SA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DJ/YAmawDTj2z9+S9nnfU/rGIz1u63+gn7c3FCIjPZdp/D1dk3ed4Lv61pWlIxk78qIJ7NH6VOrl8HU34sRqCPPkBhFLRz6Y5Xh9SBBC6RZhitVT3mMEeE2uC6tufpcVeqh4f/YuPL1LUk20D6PDR5Sol1flP5mTjMN3m6ukzE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=dVb1cqFy; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4XjyDV4J1PzyRk;
	Wed,  6 Nov 2024 09:55:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1730879722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=/5HadUwBl3ydMRSVQ2Wp6hT7sjkhYh/OqQVQb69N5r0=;
	b=dVb1cqFy2ZNzTCGSZi8mYiiZ/TmilZKtPtyngqvOdoik/bQ1mzM1Mdz7doZnzPOUlrjbiv
	jo04+EX8aP/AWJvBZbJjdhOlWZ8cZL2WKZkc5ZaPKUj7ibAYY3DeR5+q5+uxM+IuaOa43a
	/AOfNq3UoS9UhltQ7GESYNuEqKB1zSQ=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1730879722; a=rsa-sha256; cv=none;
	b=YaEiq6c7OUtSiWXaL/f5Cv65hZemvBRIWc8vddTC9qPQsQAeSaAS08CbW6SDtz8aTtMr8M
	baIvXUFoub/O3ZOSfKXhgI1+tk7W9LTioPtyvmwD5PJloeBLzZ22HUkBubUcJU8OT3gX0E
	U3kA5dvySTTGn6/iqmpJjWyw9cpg5mM=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1730879722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=/5HadUwBl3ydMRSVQ2Wp6hT7sjkhYh/OqQVQb69N5r0=;
	b=ARz+v7gZErVLGUR8ZgMnxbddiwu4oLJ2gyC07AhMd/u8zxmzpOa5vjLVe6JfGddNdUtIyr
	LZUgGmWHocHShiE3NJiRXY8e2lOPjlW8deX8DS/TTR2HK2tj5HhehO41GuEezQnsAYXRdy
	OgjlVDzLcYk6tiPPvilyf2JRaRTm+3w=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1DF60634C93;
	Wed,  6 Nov 2024 09:55:21 +0200 (EET)
Date: Wed, 6 Nov 2024 07:55:20 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR 6.13] ISP, sensor, other driver fixes
Message-ID: <Zysg6Cm0KaAsjOIW@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here's a number of important fixes and improvements for the IPU6 driver,
improvements and fixes for the RPi CFE, st-mipid02 and ov5645 drivers, DT
support for the ov08x40 driver, fixes for the dw9768, venus, gspca, amphion
drivers as well as a small MC cleanup.

Please pull.


The following changes since commit c7ccf3683ac9746b263b0502255f5ce47f64fe0a:

  media: ati_remote: don't push static constants on stack for %*ph (2024-10-29 16:37:23 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.13-2-signed

for you to fetch changes up to a015e1fe7bb39a00013d7d35556190c096056c0b:

  media: i2c: dw9768: Use runtime PM autosuspend (2024-11-06 08:42:33 +0200)

----------------------------------------------------------------
V4L2 patches for 6.13

----------------------------------------------------------------
Alain Volmat (5):
      media: i2c: gc2145: introduce enable/disable_streams ops
      media: i2c: st-mipid02: fix mipid02_stream_enable error handling
      media: i2c: st-mipid02: use enable/disable_streams pad ops
      media: i2c: st-mipid02: add pm_runtime handling
      media: i2c: st-mipid02: remove parallel mbus format on sink pad

Bingbu Cao (9):
      media: ipu6: not override the dma_ops of device in driver
      media: ipu6: use the IPU6 DMA mapping APIs to do mapping
      media: ipu6: remove architecture DMA ops dependency in Kconfig
      media: Documentation: ipu6: remove the dma_ops part from the doc
      media: ipu6: use PFN_UP() and sg_virt() for code simplicity
      media: ipu6: move the l2_unmap() up before l2_map()
      media: ipu6: optimize the IPU6 MMU mapping flow
      media: ipu6: optimize the IPU6 MMU unmapping flow
      media: ipu6: make the ipu6_mmu_unmap() as a void function

Bryan O'Donoghue (5):
      media: dt-bindings: Remove assigned-clock-* from various schema
      media: ov08x40: Fix burst write sequence
      media: dt-bindings: Add OmniVision OV08X40
      media: ov08x40: Rename ext_clk to xvclk
      media: ov08x40: Add OF probe support

Dan Carpenter (1):
      media: raspberrypi: Do some cleanup in probe()

Hans de Goede (1):
      media: ov2740: Don't log ov2740_check_hwcfg() errors twice

Jinjie Ruan (4):
      media: i2c: dw9768: Fix pm_runtime_set_suspended() with runtime pm enabled
      media: amphion: Fix pm_runtime_set_suspended() with runtime pm enabled
      media: venus: Fix pm_runtime_set_suspended() with runtime pm enabled
      media: gspca: ov534-ov772x: Fix off-by-one error in set_frame_rate()

Lad Prabhakar (6):
      media: i2c: ov5645: Use local `dev` pointer for subdev device assignment
      media: i2c: ov5645: Replace dev_err with dev_err_probe in probe function
      media: i2c: ov5645: Use v4l2_async_register_subdev_sensor()
      media: i2c: ov5645: Drop `power_lock` mutex
      media: i2c: ov5645: Use subdev active state
      media: i2c: ov5645: Switch to {enable,disable}_streams

Laurent Pinchart (3):
      media: i2c: mt9p031: Drop support for legacy platform data
      media: i2c: mt9p031: Drop I2C device ID table
      media: i2c: mt9p031: Switch from OF to fwnode API

Ricardo Ribalda (1):
      media: raspberrypi: Remove redundant "no IRQ" message

Sakari Ailus (2):
      media: ipu6: Fix DMA and physical address debugging messages for 32-bit
      media: mc: Rename pad as origin in __media_pipeline_start()

Stanislaw Gruszka (2):
      media: intel/ipu6: do not handle interrupts when device is disabled
      media: intel/ipu6: remove buttress ish structure

Tarang Raval (1):
      media: mt9p031: Refactor format handling for different sensor models

Tomi Valkeinen (1):
      media: raspberrypi: cfe: Fix mapping of dmabuf buffers

Tommaso Merciai (3):
      media: v4l2-subdev: Refactor events
      media: i2c: Drop HAS_EVENTS and event handlers
      media: i2c: imx415: Drop HAS_EVENTS flag

Zhi Mao (1):
      media: i2c: dw9768: Use runtime PM autosuspend

 .../devicetree/bindings/media/i2c/hynix,hi846.yaml |  10 -
 .../bindings/media/i2c/ovti,ov08x40.yaml           | 120 ++++++++
 .../devicetree/bindings/media/i2c/ovti,ov5648.yaml |  11 -
 .../devicetree/bindings/media/i2c/ovti,ov8865.yaml |  10 -
 .../devicetree/bindings/media/i2c/ovti,ov9282.yaml |   8 -
 .../devicetree/bindings/media/i2c/sony,imx258.yaml |   7 -
 .../devicetree/bindings/media/i2c/sony,imx334.yaml |   8 -
 .../devicetree/bindings/media/i2c/sony,imx335.yaml |   8 -
 .../devicetree/bindings/media/i2c/sony,imx412.yaml |   8 -
 Documentation/driver-api/media/drivers/ipu6.rst    |  15 -
 MAINTAINERS                                        |   2 +-
 drivers/media/i2c/alvium-csi2.c                    |   5 +-
 drivers/media/i2c/ds90ub953.c                      |   5 +-
 drivers/media/i2c/ds90ub960.c                      |   5 +-
 drivers/media/i2c/dw9768.c                         |  15 +-
 drivers/media/i2c/gc0308.c                         |   4 -
 drivers/media/i2c/gc05a2.c                         |  10 +-
 drivers/media/i2c/gc08a3.c                         |  10 +-
 drivers/media/i2c/gc2145.c                         |  41 +--
 drivers/media/i2c/imx219.c                         |  10 +-
 drivers/media/i2c/imx283.c                         |  10 +-
 drivers/media/i2c/imx290.c                         |  10 +-
 drivers/media/i2c/imx415.c                         |   3 +-
 drivers/media/i2c/max96714.c                       |   6 +-
 drivers/media/i2c/max96717.c                       |   6 +-
 drivers/media/i2c/mt9p031.c                        |  96 +++----
 drivers/media/i2c/ov01a10.c                        |   6 +-
 drivers/media/i2c/ov08x40.c                        | 181 ++++++++++--
 drivers/media/i2c/ov2740.c                         |   5 +-
 drivers/media/i2c/ov5645.c                         | 278 ++++++++----------
 drivers/media/i2c/ov64a40.c                        |  10 +-
 drivers/media/i2c/ov8858.c                         |   9 +-
 drivers/media/i2c/st-mipid02.c                     | 117 ++++----
 drivers/media/i2c/thp7312.c                        |   5 +-
 drivers/media/mc/mc-entity.c                       |  14 +-
 drivers/media/pci/intel/ipu6/Kconfig               |   8 +-
 drivers/media/pci/intel/ipu6/ipu6-bus.c            |   6 -
 drivers/media/pci/intel/ipu6/ipu6-buttress.c       |  65 ++---
 drivers/media/pci/intel/ipu6/ipu6-buttress.h       |   6 -
 drivers/media/pci/intel/ipu6/ipu6-cpd.c            |  18 +-
 drivers/media/pci/intel/ipu6/ipu6-dma.c            | 208 +++++++-------
 drivers/media/pci/intel/ipu6/ipu6-dma.h            |  34 ++-
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c         |  14 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |  68 ++++-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h     |   1 +
 drivers/media/pci/intel/ipu6/ipu6-isys.c           |  19 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu.c            | 310 +++++++++------------
 drivers/media/pci/intel/ipu6/ipu6-mmu.h            |   4 +-
 .../pci/intel/ipu6/ipu6-platform-buttress-regs.h   |   2 -
 drivers/media/pci/intel/ipu6/ipu6.c                |   3 +
 drivers/media/platform/amphion/vpu_drv.c           |   2 +-
 drivers/media/platform/qcom/venus/core.c           |   2 +-
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   |  13 +-
 drivers/media/usb/gspca/ov534.c                    |   2 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |  22 +-
 include/media/i2c/mt9p031.h                        |  18 --
 include/media/media-entity.h                       |  10 +-
 57 files changed, 969 insertions(+), 934 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml
 delete mode 100644 include/media/i2c/mt9p031.h

-- 
Kind regards,

Sakari Ailus

