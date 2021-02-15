Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7ABA31B82E
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 12:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhBOLmW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 06:42:22 -0500
Received: from retiisi.eu ([95.216.213.190]:48260 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229805AbhBOLmT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 06:42:19 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 270F5634C98;
        Mon, 15 Feb 2021 13:39:32 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v7 0/3] Add %p4cc printk modifier for V4L2 and DRM fourcc codes
Date:   Mon, 15 Feb 2021 13:40:27 +0200
Message-Id: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This set adds support for %p4cc printk modifier for printing V4L2 and DRM
fourcc codes. The codes are cumbersome to print manually and by adding the
modifier, this task is saved from the V4L2 and DRM frameworks as well as
related drivers. DRM actually had it handled in a way (see 3rd patch) but
the printk modifier makes printing the format easier even there. On V4L2
side it saves quite a few lines of repeating different implementations of
printing the 4cc codes.

Further work will include converting the V4L2 drivers doing the same, as
well as converting DRM drivers from drm_get_format_name() to plain %p4cc.
I left these out from this version since individual drivers are easier
changed without dealing with multiple trees.

If DRM folks would prefer to convert drivers to %p4cc directly instead I
have no problem dropping the 3rd patch. Nearly all uses in DRM are in
printk family of functions that can readily use %p4cc instead of the
current arrangement that relies on caller-allocated temporary buffer.

Since v6:

- Don't drop spaces in fourcc codes.

- Print unprintable characters as dot ('.') instead of hexadecimal number
  in parentheses.

- Convert DRM from drm_get_format_name() to %p4cc. I wonder if this should
  be merged through the DRM tree, albeit it's probably unlikely to
  conflict with other changes. Further use of the function could be a
  problem.

- Make tests more realistic.

Since v5:

- Added V4L2 core conversion to %p4cc, as well as change the DRM
  fourcc printing function to use %p4cc.

- Add missing checkpatch.pl checks for %p4cc modifier.

Sakari Ailus (3):
  lib/vsprintf: Add support for printing V4L2 and DRM fourccs
  v4l: ioctl: Use %p4cc printk modifier to print FourCC codes
  drm: Switch to %p4cc format modifier

 Documentation/core-api/printk-formats.rst     | 16 ++++
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  5 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  5 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  5 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  5 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 +-
 .../arm/display/komeda/komeda_format_caps.h   | 11 ---
 .../arm/display/komeda/komeda_framebuffer.c   |  4 +-
 .../gpu/drm/arm/display/komeda/komeda_plane.c |  6 +-
 drivers/gpu/drm/arm/malidp_mw.c               |  7 +-
 drivers/gpu/drm/drm_atomic.c                  |  8 +-
 drivers/gpu/drm/drm_crtc.c                    |  7 +-
 drivers/gpu/drm/drm_fourcc.c                  | 25 ------
 drivers/gpu/drm/drm_framebuffer.c             | 11 +--
 drivers/gpu/drm/drm_mipi_dbi.c                |  5 +-
 drivers/gpu/drm/drm_plane.c                   |  8 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  5 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 14 +--
 .../drm/i915/display/intel_display_debugfs.c  | 19 ++---
 drivers/gpu/drm/i915/display/intel_sprite.c   |  6 +-
 drivers/gpu/drm/mcde/mcde_display.c           |  6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     |  9 +-
 drivers/gpu/drm/radeon/atombios_crtc.c        | 10 +--
 drivers/gpu/drm/sun4i/sun4i_backend.c         |  6 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         |  7 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 15 ++--
 drivers/media/v4l2-core/v4l2-ioctl.c          | 85 +++++--------------
 include/drm/drm_fourcc.h                      |  1 -
 lib/test_printf.c                             | 17 ++++
 lib/vsprintf.c                                | 39 +++++++++
 scripts/checkpatch.pl                         |  6 +-
 32 files changed, 161 insertions(+), 223 deletions(-)

-- 
2.29.2
