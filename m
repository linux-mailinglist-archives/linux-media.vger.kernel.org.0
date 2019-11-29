Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2910210D3F8
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2019 11:30:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbfK2KaA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Nov 2019 05:30:00 -0500
Received: from mga11.intel.com ([192.55.52.93]:27927 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbfK2KaA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Nov 2019 05:30:00 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Nov 2019 02:29:58 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; 
   d="scan'208";a="203694628"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Nov 2019 02:29:50 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
        ville.syrjala@linux.intel.com,
        Andy Walls <awalls@md.metrocast.net>,
        Bernie Thompson <bernie@plugable.com>,
        =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jaya Kumar <jayalk@intworks.biz>,
        Kirti Wankhede <kwankhede@nvidia.com>,
        Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Robin van der Gracht <robin@protonic.nl>,
        Steve Glendinning <steve.glendinning@shawell.net>,
        ivtv-devel@ivtvdriver.org, kvm@vger.kernel.org,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v2 00/14] video, drm, etc: constify fbops in struct fb_info
Date:   Fri, 29 Nov 2019 12:29:30 +0200
Message-Id: <cover.1575022735.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is v2 of https://patchwork.freedesktop.org/series/70119/

I wanted to make our struct fb_ops const because we don't modify
it... and this is what I ended up with to fix it and a bunch of others.

I would appreciate acks to merge all this via the drm-misc tree. This is
especially important for patches 1-8 to reasonably get the job
done. Patches 9-14 are somewhat easier to merge at leisure afterwards,
but there really isn't much conflict potential IMO.

Daniel, please double-check me adding your Reviewed-by on the later
patches wasn't overzealous.

BR,
Jani.


Cc: Andy Walls <awalls@md.metrocast.net>
Cc: Bernie Thompson <bernie@plugable.com>
Cc: Bruno Prémont <bonbons@linux-vserver.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Jaya Kumar <jayalk@intworks.biz>
Cc: Kirti Wankhede <kwankhede@nvidia.com>
Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: Robin van der Gracht <robin@protonic.nl>
Cc: Steve Glendinning <steve.glendinning@shawell.net>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: ivtv-devel@ivtvdriver.org
Cc: kvm@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-omap@vger.kernel.org


Jani Nikula (14):
  video: fb_defio: preserve user fb_ops
  drm/fb-helper: don't preserve fb_ops across deferred IO use
  video: smscufx: don't restore fb_mmap after deferred IO cleanup
  video: udlfb: don't restore fb_mmap after deferred IO cleanup
  video: fbdev: vesafb: modify the static fb_ops directly
  video: fbmem: use const pointer for fb_ops
  video: omapfb: use const pointer for fb_ops
  video: fbdev: make fbops member of struct fb_info a const pointer
  drm: constify fb ops across all drivers
  video: constify fb ops across all drivers
  HID: picoLCD: constify fb ops
  media: constify fb ops across all drivers
  samples: vfio-mdev: constify fb ops
  auxdisplay: constify fb ops

 drivers/auxdisplay/cfag12864bfb.c             |  2 +-
 drivers/auxdisplay/ht16k33.c                  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c        |  2 +-
 drivers/gpu/drm/armada/armada_fbdev.c         |  2 +-
 drivers/gpu/drm/drm_fb_helper.c               | 27 +++----------------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  2 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c       |  4 +--
 drivers/gpu/drm/omapdrm/omap_fbdev.c          |  2 +-
 drivers/gpu/drm/radeon/radeon_fb.c            |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c |  2 +-
 drivers/gpu/drm/tegra/fb.c                    |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c            |  2 +-
 drivers/hid/hid-picolcd_fb.c                  |  3 +--
 drivers/media/pci/ivtv/ivtvfb.c               |  3 +--
 drivers/media/platform/vivid/vivid-osd.c      |  3 +--
 drivers/video/fbdev/68328fb.c                 |  2 +-
 drivers/video/fbdev/acornfb.c                 |  2 +-
 drivers/video/fbdev/amba-clcd.c               |  2 +-
 drivers/video/fbdev/amifb.c                   |  2 +-
 drivers/video/fbdev/arcfb.c                   |  2 +-
 drivers/video/fbdev/arkfb.c                   |  2 +-
 drivers/video/fbdev/asiliantfb.c              |  2 +-
 drivers/video/fbdev/atmel_lcdfb.c             |  2 +-
 drivers/video/fbdev/aty/aty128fb.c            |  2 +-
 drivers/video/fbdev/aty/atyfb_base.c          |  2 +-
 drivers/video/fbdev/aty/radeon_base.c         |  2 +-
 drivers/video/fbdev/au1100fb.c                |  2 +-
 drivers/video/fbdev/au1200fb.c                |  2 +-
 drivers/video/fbdev/broadsheetfb.c            |  2 +-
 drivers/video/fbdev/bw2.c                     |  2 +-
 drivers/video/fbdev/carminefb.c               |  2 +-
 drivers/video/fbdev/cg14.c                    |  2 +-
 drivers/video/fbdev/cg3.c                     |  2 +-
 drivers/video/fbdev/cg6.c                     |  2 +-
 drivers/video/fbdev/chipsfb.c                 |  2 +-
 drivers/video/fbdev/cirrusfb.c                |  2 +-
 drivers/video/fbdev/clps711x-fb.c             |  2 +-
 drivers/video/fbdev/cobalt_lcdfb.c            |  2 +-
 drivers/video/fbdev/controlfb.c               |  2 +-
 drivers/video/fbdev/core/fb_defio.c           |  3 ---
 drivers/video/fbdev/core/fbmem.c              | 19 ++++++++-----
 drivers/video/fbdev/cyber2000fb.c             |  2 +-
 drivers/video/fbdev/da8xx-fb.c                |  2 +-
 drivers/video/fbdev/dnfb.c                    |  2 +-
 drivers/video/fbdev/efifb.c                   |  2 +-
 drivers/video/fbdev/ep93xx-fb.c               |  2 +-
 drivers/video/fbdev/fb-puv3.c                 |  2 +-
 drivers/video/fbdev/ffb.c                     |  2 +-
 drivers/video/fbdev/fm2fb.c                   |  2 +-
 drivers/video/fbdev/fsl-diu-fb.c              |  2 +-
 drivers/video/fbdev/g364fb.c                  |  2 +-
 drivers/video/fbdev/gbefb.c                   |  2 +-
 drivers/video/fbdev/geode/gx1fb_core.c        |  2 +-
 drivers/video/fbdev/geode/gxfb_core.c         |  2 +-
 drivers/video/fbdev/geode/lxfb_core.c         |  2 +-
 drivers/video/fbdev/goldfishfb.c              |  2 +-
 drivers/video/fbdev/grvga.c                   |  2 +-
 drivers/video/fbdev/gxt4500.c                 |  2 +-
 drivers/video/fbdev/hecubafb.c                |  2 +-
 drivers/video/fbdev/hgafb.c                   |  2 +-
 drivers/video/fbdev/hitfb.c                   |  2 +-
 drivers/video/fbdev/hpfb.c                    |  2 +-
 drivers/video/fbdev/hyperv_fb.c               |  2 +-
 drivers/video/fbdev/i740fb.c                  |  2 +-
 drivers/video/fbdev/imsttfb.c                 |  2 +-
 drivers/video/fbdev/imxfb.c                   |  2 +-
 drivers/video/fbdev/intelfb/intelfbdrv.c      |  2 +-
 drivers/video/fbdev/kyro/fbdev.c              |  2 +-
 drivers/video/fbdev/leo.c                     |  2 +-
 drivers/video/fbdev/macfb.c                   |  2 +-
 drivers/video/fbdev/matrox/matroxfb_crtc2.c   |  2 +-
 drivers/video/fbdev/maxinefb.c                |  2 +-
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c    |  2 +-
 drivers/video/fbdev/mbx/mbxfb.c               |  2 +-
 drivers/video/fbdev/metronomefb.c             |  2 +-
 drivers/video/fbdev/mmp/fb/mmpfb.c            |  2 +-
 drivers/video/fbdev/mx3fb.c                   |  5 ++--
 drivers/video/fbdev/neofb.c                   |  2 +-
 drivers/video/fbdev/nvidia/nvidia.c           |  2 +-
 drivers/video/fbdev/ocfb.c                    |  2 +-
 drivers/video/fbdev/offb.c                    |  2 +-
 drivers/video/fbdev/omap/omapfb_main.c        |  2 +-
 .../video/fbdev/omap2/omapfb/omapfb-main.c    |  2 +-
 drivers/video/fbdev/p9100.c                   |  2 +-
 drivers/video/fbdev/platinumfb.c              |  2 +-
 drivers/video/fbdev/pm2fb.c                   |  2 +-
 drivers/video/fbdev/pm3fb.c                   |  2 +-
 drivers/video/fbdev/pmag-aa-fb.c              |  2 +-
 drivers/video/fbdev/pmag-ba-fb.c              |  2 +-
 drivers/video/fbdev/pmagb-b-fb.c              |  2 +-
 drivers/video/fbdev/ps3fb.c                   |  2 +-
 drivers/video/fbdev/pvr2fb.c                  |  2 +-
 drivers/video/fbdev/pxa168fb.c                |  2 +-
 drivers/video/fbdev/pxafb.c                   |  4 +--
 drivers/video/fbdev/q40fb.c                   |  2 +-
 drivers/video/fbdev/riva/fbdev.c              |  2 +-
 drivers/video/fbdev/s3c-fb.c                  |  2 +-
 drivers/video/fbdev/s3c2410fb.c               |  2 +-
 drivers/video/fbdev/s3fb.c                    |  2 +-
 drivers/video/fbdev/sa1100fb.c                |  2 +-
 drivers/video/fbdev/savage/savagefb_driver.c  |  2 +-
 drivers/video/fbdev/sh7760fb.c                |  2 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c        |  4 +--
 drivers/video/fbdev/simplefb.c                |  2 +-
 drivers/video/fbdev/sis/sis_main.c            |  2 +-
 drivers/video/fbdev/skeletonfb.c              |  2 +-
 drivers/video/fbdev/sm712fb.c                 |  2 +-
 drivers/video/fbdev/smscufx.c                 |  3 +--
 drivers/video/fbdev/ssd1307fb.c               |  2 +-
 drivers/video/fbdev/sstfb.c                   |  2 +-
 drivers/video/fbdev/stifb.c                   |  2 +-
 drivers/video/fbdev/sunxvr1000.c              |  2 +-
 drivers/video/fbdev/sunxvr2500.c              |  2 +-
 drivers/video/fbdev/sunxvr500.c               |  2 +-
 drivers/video/fbdev/tcx.c                     |  2 +-
 drivers/video/fbdev/tdfxfb.c                  |  2 +-
 drivers/video/fbdev/tgafb.c                   |  2 +-
 drivers/video/fbdev/tmiofb.c                  |  2 +-
 drivers/video/fbdev/tridentfb.c               |  2 +-
 drivers/video/fbdev/udlfb.c                   |  1 -
 drivers/video/fbdev/uvesafb.c                 |  2 +-
 drivers/video/fbdev/valkyriefb.c              |  2 +-
 drivers/video/fbdev/vesafb.c                  |  6 ++---
 drivers/video/fbdev/vfb.c                     |  2 +-
 drivers/video/fbdev/vga16fb.c                 |  2 +-
 drivers/video/fbdev/vt8500lcdfb.c             |  2 +-
 drivers/video/fbdev/vt8623fb.c                |  2 +-
 drivers/video/fbdev/w100fb.c                  |  2 +-
 drivers/video/fbdev/wm8505fb.c                |  2 +-
 drivers/video/fbdev/xen-fbfront.c             |  2 +-
 drivers/video/fbdev/xilinxfb.c                |  2 +-
 include/linux/fb.h                            |  2 +-
 samples/vfio-mdev/mdpy-fb.c                   |  2 +-
 136 files changed, 156 insertions(+), 175 deletions(-)

-- 
2.20.1

