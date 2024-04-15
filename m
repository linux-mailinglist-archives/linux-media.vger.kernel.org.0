Return-Path: <linux-media+bounces-9349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FED8A4E51
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A09F01F21B73
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8471E67C53;
	Mon, 15 Apr 2024 12:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P15C1oQn"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434C062147
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182562; cv=none; b=OElxdJynCzo/niF0/8H804NATGxaZoyDGC2rAtRm1KXZd8Rh3ghsKnCgI2kURpv4laaDk5HtqXR7CB4CUCDLAauPsyUQeT2gfSl8jBZGqFG+5OWktBxCFp/6CDTpPwcv4Y62k6QZqiQMBXiyzLYVjQ+hY3jhAgj/rsq4SLvu5eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182562; c=relaxed/simple;
	bh=O6mLwsEVJ+eGuUv4D4JOn5A9QN9bLINJSU0f3rUFl9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l9zwAe1sZtNjxHMtiFzJ4wK7z14XCGxJyIr22uZyRKbqyie8CEvTqnXIgU4kiSmUlbFGqz74qYqn2Ph+l6U5ZrLh1PONzecvXMtVa/VhMrfFkqI8SYnY2szLXH+3YJEJyoGHOqkhXqy/kivwefQsQEYirS/7DUaPokmrkAXuHm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P15C1oQn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Wk022/UUMWcL2llFbz3dfu2U/zWrHdMGzW4zt5SmeoU=;
	b=P15C1oQnrq0Kai8+iSM2/pcHz3GpC7HGHDbtw3svOVjQt4LTn1bqHrUcXQqQRWl3J3MD4E
	O/p312UldD8pUz3HOMd72k1gYfWIXvSqkPm76uvjfK3vZZQyMSINOJtJi5arlS/5OifC64
	q/67qZ+uTIlVrE8o6snI3LHyL5mTBRw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-347-vneLoQn9Ph2upPSX8-Vc8g-1; Mon,
 15 Apr 2024 08:02:34 -0400
X-MC-Unique: vneLoQn9Ph2upPSX8-Vc8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4470F1C0C65E;
	Mon, 15 Apr 2024 12:02:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09628C01594;
	Mon, 15 Apr 2024 12:02:32 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 00/23] media: atomisp: Further media-controller related fixes + dead code removal
Date: Mon, 15 Apr 2024 14:01:57 +0200
Message-ID: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Hi all,

This patch-set contains a couple of atomisp driver fixes for issues which
I found while working on a libcamera pipeline handler for the atomisp
(and thus controlling the atomisp driver in a more media-controller centric
fashion).

Patches 1-8 are more or less prep work for fixing an ABBA deadlock in
atomisp_link_setup() in patch 9.

Diving into the code for this made my hands itch to remove of bunch of
atomisp custom internal APIs for things like flash support, so the rest
of the series is just removing a whole bunch of dead / unwanted code.

This series is also available here:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

I'll do a forced push there addressing any review-comments + adding
tags before adding a signed-tag for a pull-request to Mauro for this.

Regards,

Hans


Hans de Goede (23):
  media: atomisp: Add atomisp_s_sensor_power() helper
  media: atomisp: Turn on sensor power from atomisp_set_fmt()
  media: atomisp: Add atomisp_select_input() helper
  media: atomisp: Simplify atomisp_s_input() input argument checking
  media: atomisp: Ensure CSI-receiver[x] -> ISP links correctly reflect
    current sensor
  media: atomisp: Propagate set_fmt on sensor results to CSI port
  media: atomisp: Propagate v4l2_mbus_framefmt.field to CSI port sink
    pad
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
  media: atomisp: Remove clearing of ISP crop / compose rectangles on
    file release
  media: atomisp: Remove empty s_power() op from ISP subdev
  media: atomisp: Remove empty s_stream() op from CSI subdev
  media: atomisp: Cleanup atomisp_isr_thread() spinlock handling
  media: atomisp: Remove setting of f->fmt.pix.priv from
    atomisp_set_fmt()

 drivers/staging/media/atomisp/Makefile        |   1 -
 drivers/staging/media/atomisp/i2c/Kconfig     |  15 -
 drivers/staging/media/atomisp/i2c/Makefile    |   5 -
 .../media/atomisp/i2c/atomisp-gc2235.c        |   2 +-
 .../media/atomisp/i2c/atomisp-lm3554.c        | 955 ------------------
 .../media/atomisp/i2c/atomisp-mt9m114.c       |   2 +-
 .../media/atomisp/i2c/atomisp-ov2722.c        |  14 +-
 drivers/staging/media/atomisp/i2c/ov2722.h    |   1 -
 .../media/atomisp/include/linux/atomisp.h     |  57 --
 .../include/linux/atomisp_gmin_platform.h     |   6 +-
 .../atomisp/include/linux/atomisp_platform.h  |  40 +-
 .../media/atomisp/include/media/lm3554.h      | 132 ---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 255 ++---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  13 +-
 .../media/atomisp/pci/atomisp_compat_css20.c  |  31 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  26 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  |  49 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c |  95 +-
 .../media/atomisp/pci/atomisp_internal.h      |  12 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 135 +--
 .../media/atomisp/pci/atomisp_subdev.c        |  46 +-
 .../media/atomisp/pci/atomisp_subdev.h        |  17 +-
 .../staging/media/atomisp/pci/atomisp_tpg.c   | 164 ---
 .../staging/media/atomisp/pci/atomisp_tpg.h   |  39 -
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  87 +-
 .../hive_isp_css_common/host/input_system.c   |  38 -
 drivers/staging/media/atomisp/pci/ia_css.h    |   1 -
 .../media/atomisp/pci/ia_css_frame_public.h   |   8 -
 .../media/atomisp/pci/ia_css_stream_public.h  |  17 -
 .../staging/media/atomisp/pci/ia_css_tpg.h    |  79 --
 .../atomisp/pci/isp2400_input_system_global.h |   1 -
 .../atomisp/pci/isp2400_input_system_public.h |  15 -
 .../atomisp/pci/isp2401_input_system_global.h |   1 -
 .../pci/runtime/debug/src/ia_css_debug.c      |  17 -
 .../atomisp/pci/runtime/ifmtr/src/ifmtr.c     |  11 -
 .../pci/runtime/isys/src/virtual_isys.c       |  28 +-
 drivers/staging/media/atomisp/pci/sh_css.c    | 121 +--
 .../media/atomisp/pci/sh_css_internal.h       |   1 -
 .../staging/media/atomisp/pci/sh_css_mipi.c   |   2 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  14 -
 drivers/staging/media/atomisp/pci/sh_css_sp.h |   7 -
 .../staging/media/atomisp/pci/system_global.h |  12 -
 42 files changed, 211 insertions(+), 2361 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
 delete mode 100644 drivers/staging/media/atomisp/include/media/lm3554.h
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_tpg.c
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_tpg.h
 delete mode 100644 drivers/staging/media/atomisp/pci/ia_css_tpg.h

-- 
2.44.0


