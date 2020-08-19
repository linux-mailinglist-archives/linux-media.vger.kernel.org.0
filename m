Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E60D024A37C
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 17:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbgHSPpE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 11:45:04 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:55987 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726570AbgHSPpC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 11:45:02 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8QGpkdvrEuuXO8QGqkhu1z; Wed, 19 Aug 2020 17:45:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597851900; bh=j5AgZl2rj+P56oZnGMct9V41LOQLuMm7NbZ5mHpk/Ks=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YXV+1/1oiOCD64jHHuStig7JX4fi40yotwxnBKlJm0FeupbG9Z6Ua6EE/mCt5C2pf
         8S12VNTiZcAlW3WelhkUZz9F59Ng2ej+NQSfcwSa0goCDXSgsgfFFTrNlgrJhmstMn
         OtI30TPUzHd7GJhSKeSFPNE2FZVceDUQyP8vK07XCshe0CLGVByr3/ZJX58Yy0dlAi
         1yGwQYuKCJTEGL1gecqQrSEt3lCykQzni8gD8559fKvzVGSwCR6NqO/sR1bd2Juh1V
         CGC+zPCSbwuQEq4f2tXeMy09inMwoOCfWQ3l5FO4kpvQSh7v1uJfTXpeAoEThBoTbs
         JUyouvOUuERQg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.10] Various fixes/improvements
Message-ID: <4f43533b-c6a9-6741-851b-af8d0a74880d@xs4all.nl>
Date:   Wed, 19 Aug 2020 17:44:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPrt5ktG9bOUqO34KKssfDoSjAE5vAm+b8yWWoYJcoklK3tjs3umgbAeHIP1ych3DWF1BaeCPqssXN4BvQw83TX9YV+nFeY4Wc0EB1HF7Qjfo0agzRT6
 JrLQH4H9AGIoR+YLUOfwEhNRM4WE6hc/Zqmetvh/kHlih83r/gc8ZN/sbkidIJ3Y/46VUT8mgPJzCjAGYQrluwBD9EBtwRbGihLWMTR6C+XyZ86YVanBgZTQ
 jOlgsLtmF/BNj/YVMeBnCdrIgriX8olxeEbHw+sPb5o=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 9a538b83612c8b5848bf840c2ddcd86dda1c8c76:

  media: venus: core: Add support for opp tables/perf voting (2020-08-18 15:55:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.10a

for you to fetch changes up to bd3dcad470cc3f3102dbc96bb8827802c12d5e87:

  media: exynos4-is: Simplify the pinctrl code (2020-08-19 16:52:30 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Allen Pais (11):
      media: bt8xx: convert tasklets to use new tasklet_setup() API
      media: mantis: convert tasklets to use new tasklet_setup() API
      media: ngene: convert tasklets to use new tasklet_setup() API
      media: smipcie: convert tasklets to use new tasklet_setup() API
      media: ttpci: convert tasklets to use new tasklet_setup() API
      media: tw5864: convert tasklets to use new tasklet_setup() API
      media: marvell-ccic: convert tasklets to use new tasklet_setup() API
      media: pxa_camera: convert tasklets to use new tasklet_setup() API
      media: sti: convert tasklets to use new tasklet_setup() API
      media/radio: wl128x: convert tasklets to use new tasklet_setup() API
      media: ttusb-dec: convert tasklets to use new tasklet_setup() API

Andrey Konovalov (3):
      media: camss: Make use of V4L2_CAP_IO_MC
      media: camss: add support for vidioc_enum_framesizes ioctl
      media: camss: __video_try_fmt(): don't use hardcoded constants

Daniel W. S. Almeida (15):
      media: sunxi: sun8i-rotate.c: remove useless error message
      media: cobalt: cobalt-omnitek.c: fix comparison to bool
      media: mtk-vcodec: mtk_vcodec_dec.c: fix comparison to bool
      media: vicodec: vicodec-core.c: fix assignment of 0/1 to bool variable
      media: pci: saa7164.c: Replace if(cond) BUG with BUG_ON
      media: pci: saa7164-dvb.c: replace if(cond) BUG() with BUG_ON()
      media: pci: saa7164-vbi.c: replace if (cond) BUG() with BUG_ON()
      media: pci: saa7164-core.c: replace if (cond) BUG() with BUG_ON()
      media: usb: dib0700_devices.c: remove useless if/else
      media: dvb-frontends: mb86a16.c: remove useless if/else
      media: pci: cx23855-video.c: remove duplicate argument in 'or'
      media: i2c: imx219.c: fix assignment of 0/1 to bool variable
      media: i2c: tda1997x.c: Fix assignment of 0/1 to bool variable
      media: pci: cobalt-i2c.c: fix comparison of 0/1 to bool variable
      media: mtk-vcodec: vdec_vp9_if.c: fix comparison to bool

Fabio Estevam (1):
      media: fsl-viu: Do not redefine out_be32()/in_be32() for CONFIG_M68K

Frederic Chen (1):
      media: mc-device.c: change media_device_request_alloc to match media_ioctl_info

Ismael Luceno (1):
      MAINTAINERS: Remove broken bluecherry.net email

Lubomir Rintel (4):
      media: cafe-driver: use drvdata instead of back-casting from v4l2_device
      media: marvell-ccic: mmp: get rid of mmpcam_devices list
      media: marvell-ccic: mmp: use generic dev_pm_ops
      media: marvell-ccic: add support for runtime PM

Niklas Söderlund (2):
      rcar-vin: Unconditionally unregister notifier on remove
      rcar-vin: Register media device when all sub-devices bound

Sylwester Nawrocki (2):
      media: Revert "media: exynos4-is: Add missed check for pinctrl_lookup_state()"
      media: exynos4-is: Simplify the pinctrl code

Tom Rix (1):
      media: tw5864: check status of tw5864_frameinterval_get

YueHaibing (1):
      media: staging: tegra-vde: Mark tegra_vde_runtime_suspend/resume as __maybe_unused

 MAINTAINERS                                              |   1 -
 drivers/media/dvb-frontends/mb86a16.c                    |   7 +--
 drivers/media/i2c/imx219.c                               |   2 +-
 drivers/media/i2c/tda1997x.c                             |   6 +--
 drivers/media/mc/mc-device.c                             |   7 +--
 drivers/media/pci/bt8xx/dvb-bt8xx.c                      |   7 +--
 drivers/media/pci/cobalt/cobalt-i2c.c                    |   8 +--
 drivers/media/pci/cobalt/cobalt-omnitek.c                |   2 +-
 drivers/media/pci/cx23885/cx23885-video.c                |   2 +-
 drivers/media/pci/mantis/mantis_dma.c                    |   4 +-
 drivers/media/pci/mantis/mantis_dma.h                    |   2 +-
 drivers/media/pci/mantis/mantis_dvb.c                    |   2 +-
 drivers/media/pci/ngene/ngene-core.c                     |  12 ++---
 drivers/media/pci/saa7164/saa7164-buffer.c               |   8 ++-
 drivers/media/pci/saa7164/saa7164-core.c                 |  12 ++---
 drivers/media/pci/saa7164/saa7164-dvb.c                  |   7 +--
 drivers/media/pci/saa7164/saa7164-vbi.c                  |   6 +--
 drivers/media/pci/smipcie/smipcie-main.c                 |   6 +--
 drivers/media/pci/ttpci/av7110.c                         |  20 +++----
 drivers/media/pci/ttpci/budget-ci.c                      |  15 +++---
 drivers/media/pci/ttpci/budget-core.c                    |   6 +--
 drivers/media/pci/tw5864/tw5864-video.c                  |  15 ++++--
 drivers/media/platform/exynos4-is/media-dev.c            |  29 ++---------
 drivers/media/platform/exynos4-is/media-dev.h            |  11 ----
 drivers/media/platform/fsl-viu.c                         |   2 +-
 drivers/media/platform/marvell-ccic/cafe-driver.c        |  10 ++--
 drivers/media/platform/marvell-ccic/mcam-core.c          |  38 +++-----------
 drivers/media/platform/marvell-ccic/mmp-driver.c         | 133 ++++++++++++++++++-----------------------------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c       |   7 ++-
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c     |   2 +-
 drivers/media/platform/pxa_camera.c                      |   6 +--
 drivers/media/platform/qcom/camss/camss-video.c          | 112 +++++++++++++++++++++++++++++++++------
 drivers/media/platform/rcar-vin/rcar-core.c              |  22 ++++----
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c    |  10 ++--
 drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c |   5 +-
 drivers/media/radio/wl128x/fmdrv_common.c                |  12 ++---
 drivers/media/test-drivers/vicodec/vicodec-core.c        |   4 +-
 drivers/media/usb/dvb-usb/dib0700_devices.c              |  11 ++--
 drivers/media/usb/ttusb-dec/ttusb_dec.c                  |   7 ++-
 drivers/staging/media/tegra-vde/vde.c                    |   4 +-
 40 files changed, 275 insertions(+), 307 deletions(-)
