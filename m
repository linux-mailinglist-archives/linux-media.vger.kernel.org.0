Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0740C24BA2B
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 14:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728715AbgHTMBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 08:01:46 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:51093 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728437AbgHTMAn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 08:00:43 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 8jFGkH3QYywL58jFHkZXLU; Thu, 20 Aug 2020 14:00:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597924839; bh=F3dthRD5hsrYdfPv0ndJuqxtQGGHuSa83ZXTRBS3sx4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Y8V6JgGwEcwtLnzrJYfYmn/2CqnP/7g+OZYhflutBKMGhgl/1CCdDimxhDqPEAQFf
         WNRI80Jlw59i7xA0jv5CwWOHkDq9jWYDFzCynPiNcCWlU2WLtsZAQrXp+OqxUYYtDZ
         lg/9VRmt6q4O8jv3R9LkioN/9pD5zogap+jn78hBMPxkcqI8nCtAMCXcjfOMfwUBMz
         DVHLxfd94CXywonkKqqfL3f8t4RIjFmIlrlz3gC2bUQAMz0XNN7S65K+MnfDw++vNf
         mHbGeCFT8/lA025mgt5Dm9lIvzYUAClE0xFX/dFEhATOQ7pMqmFA+OKfb63u876/a3
         2LnzCDAF/jKrw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Jonathan Bakker <xc-racer2@live.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.10] More fixes and improvements
Message-ID: <87327e52-44cc-a2b8-c3fe-619bd6022264@xs4all.nl>
Date:   Thu, 20 Aug 2020 14:00:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHe2uE+m3wtkPwsaBQgvhCa4xerDGgPk0iXdPrujAEHkLXb/6ssLv29cFy9o+fhEw+82LtKAc1+Yzt4IU91vwP11U/Ncnbhw+c+/OQOXwE7Oxck+SKUg
 ujbDrKDdm8KUDldoPsq1vnM9ZVFtSQjTo7Lx4cJHz/mOb/TBHNurXnEYVHupldX6jgGdYpECYdGhOUFXtwiwfIujZg4Rnrxrmv4J6wvpDgP8z/v6nKPZYlAa
 fVZjysGArKqSm771HhXDX+PzCiRb7/IQCfNwOnpoLJHTQ9bv9bTj7hp9nsSLNd0iDPNry+j47osbr2T2as8zzWjYpRoiYXbb+ev2FTjb8flb/eMiGdRGGMyz
 8YfuIqTC
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 9a538b83612c8b5848bf840c2ddcd86dda1c8c76:

  media: venus: core: Add support for opp tables/perf voting (2020-08-18 15:55:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.10b

for you to fetch changes up to f67362d52b22f1f5eb27dc33fd1e3c0fb12dce6b:

  media: radio: si476x: no need to check return value of debugfs_create functions (2020-08-20 13:58:23 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dafna Hirschfeld (16):
      media: staging: rkisp1: replace 9 coeff* fields with a 3x3 array
      media: staging: rkisp1: replace 3 fields 'ct_offset_*' with one array
      media: staging: rkisp1: rename RKISP1_CIF_ISP_STAT_AFM_FIN to RKISP1_CIF_ISP_STAT_AFM
      media: staging: rkisp1: improve documentation in file rkisp1-config.h
      media: staging: rkisp1: don't define vaddr field in rkisp1_buffer as an array
      media: staging: rkisp1: unify (un)register functions to have the same parameters
      media: staging: rkisp1: remove declaration of unimplemented function 'rkisp1_params_isr_handler'
      media: staging: rkisp1: group declaration of similar functions together
      media: staging: rkisp1: improve documentation of rkisp1-common.h
      media: Documentation: v4l: move table of v4l2_pix_format(_mplane) flags to pixfmt-v4l2.rst
      media: staging: rkisp1: set "*_data_tbl" fields in rkisp1_cif_isp_lsc_config as 2D arrays
      media: staging: rkisp1: replace two identical macros with one
      media: staging: rkisp1: change type of fields in 'rkisp1_cif_isp_lsc_config' from u32 to u16
      media: staging: rkisp1: call params isr only upon frame out
      media: staging: rkisp1: params: use rkisp1_param_set_bits to set reg in isr
      media: staging: rkisp1: params: don't release lock in isr before buffer is done

Ezequiel Garcia (2):
      hantro: h264: Get the correct fallback reference buffer
      hantro: postproc: Fix motion vector space allocation

Greg Kroah-Hartman (6):
      media: cec: no need to check return value of debugfs_create functions
      media: coda: no need to check return value of debugfs_create functions
      media: exynos4-is: no need to check return value of debugfs_create functions
      media: mtk-vpu: no need to check return value of debugfs_create functions
      media: sti: no need to check return value of debugfs_create functions
      media: radio: si476x: no need to check return value of debugfs_create functions

Gustavo A. R. Silva (1):
      media: Use fallthrough pseudo-keyword

Helen Koike (1):
      media: staging: rkisp1: uapi: remove __packed

Jonathan Bakker (10):
      media: exynos4-is: Remove static driver data for S5PV210 FIMC variants
      media: exynos4-is: Fix nullptr when no CSIS device present
      media: exynos4-is: Correct missing entity function initialization
      media: exynos4-is: Properly set JPEG options for parallel ports
      media: exynos4-is: Use global num_sensors rather than local index
      media: exynos4-is: Add support for multiple sensors on one port
      media: exynos4-is: Remove inh_sensor_ctrls
      media: exynos4-is: Remove unused struct member input_index
      media: exynos4-is: Handle duplicate calls to vidioc_streamoff
      dt-bindings: media: Correct samsung-fimc parallel port numbering

Julia Lawall (3):
      cx231xx: drop unnecessary list_empty
      saa7134: drop unnecessary list_empty
      tm6000: drop unnecessary list_empty

Tomasz Figa (1):
      media: exynos4-is: Request syscon only if ISP writeback is present

 Documentation/devicetree/bindings/media/samsung-fimc.txt     |   6 +-
 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst    |  17 ---
 Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst        |  17 +++
 Documentation/userspace-api/media/videodev2.h.rst.exceptions |   2 +-
 drivers/media/cec/core/cec-adap.c                            |   2 +-
 drivers/media/cec/core/cec-core.c                            |  27 ++---
 drivers/media/cec/core/cec-pin.c                             |   6 +-
 drivers/media/cec/usb/pulse8/pulse8-cec.c                    |   2 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c              |   2 +-
 drivers/media/dvb-frontends/af9013.c                         |   2 +-
 drivers/media/dvb-frontends/lg2160.c                         |   2 +-
 drivers/media/dvb-frontends/m88ds3103.c                      |   2 +-
 drivers/media/i2c/adv7180.c                                  |   2 +-
 drivers/media/i2c/adv7511-v4l2.c                             |   4 +-
 drivers/media/i2c/msp3400-kthreads.c                         |   2 +-
 drivers/media/i2c/ov5640.c                                   |   2 +-
 drivers/media/i2c/ov6650.c                                   |   4 +-
 drivers/media/i2c/ov9640.c                                   |   2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c                    |   2 +-
 drivers/media/i2c/smiapp/smiapp-core.c                       |   6 +-
 drivers/media/i2c/tda1997x.c                                 |  10 +-
 drivers/media/i2c/tvp5150.c                                  |   2 +-
 drivers/media/pci/bt8xx/bttv-driver.c                        |   2 +-
 drivers/media/pci/cx88/cx88-cards.c                          |   2 +-
 drivers/media/pci/cx88/cx88-video.c                          |   2 +-
 drivers/media/pci/saa7134/saa7134-cards.c                    |   4 +-
 drivers/media/pci/saa7134/saa7134-core.c                     |  14 +--
 drivers/media/pci/solo6x10/solo6x10-core.c                   |   2 +-
 drivers/media/pci/solo6x10/solo6x10-i2c.c                    |   2 +-
 drivers/media/platform/coda/coda-bit.c                       |   4 +-
 drivers/media/platform/coda/coda-common.c                    |  15 +--
 drivers/media/platform/exynos4-is/fimc-capture.c             |  27 ++---
 drivers/media/platform/exynos4-is/fimc-core.c                |  67 +----------
 drivers/media/platform/exynos4-is/fimc-core.h                |   5 -
 drivers/media/platform/exynos4-is/fimc-is.c                  |  17 +--
 drivers/media/platform/exynos4-is/fimc-reg.c                 |   9 +-
 drivers/media/platform/exynos4-is/media-dev.c                |  56 ++++++---
 drivers/media/platform/marvell-ccic/mcam-core.c              |   2 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.c                     |   5 -
 drivers/media/platform/omap3isp/ispvideo.c                   |   2 +-
 drivers/media/platform/qcom/venus/vdec.c                     |   2 +-
 drivers/media/platform/renesas-ceu.c                         |   4 +-
 drivers/media/platform/sti/bdisp/bdisp-debug.c               |  29 +----
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c                |   7 +-
 drivers/media/platform/sti/bdisp/bdisp.h                     |   2 +-
 drivers/media/platform/sti/hva/hva-debugfs.c                 |  22 +---
 drivers/media/radio/radio-si476x.c                           |  66 +++--------
 drivers/media/radio/si4713/si4713.c                          |   2 +-
 drivers/media/rc/iguanair.c                                  |   2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c            |   2 +-
 drivers/media/test-drivers/vivid/vivid-vbi-gen.c             |   2 +-
 drivers/media/tuners/fc0011.c                                |   2 +-
 drivers/media/tuners/tda18271-fe.c                           |   2 +-
 drivers/media/usb/cx231xx/cx231xx-core.c                     |  16 +--
 drivers/media/usb/dvb-usb-v2/af9015.c                        |   2 +-
 drivers/media/usb/dvb-usb-v2/gl861.c                         |   2 +-
 drivers/media/usb/dvb-usb-v2/lmedm04.c                       |   8 +-
 drivers/media/usb/dvb-usb-v2/mxl111sf-gpio.c                 |   4 +-
 drivers/media/usb/em28xx/em28xx-audio.c                      |   8 +-
 drivers/media/usb/go7007/go7007-driver.c                     |   2 +-
 drivers/media/usb/gspca/mr97310a.c                           |  10 +-
 drivers/media/usb/gspca/nw80x.c                              |   2 +-
 drivers/media/usb/gspca/ov519.c                              |   6 +-
 drivers/media/usb/gspca/sn9c20x.c                            |   2 +-
 drivers/media/usb/gspca/sunplus.c                            |   4 +-
 drivers/media/usb/gspca/xirlink_cit.c                        |   4 +-
 drivers/media/usb/gspca/zc3xx.c                              |   4 +-
 drivers/media/usb/pwc/pwc-v4l.c                              |   2 +-
 drivers/media/usb/siano/smsusb.c                             |   2 +-
 drivers/media/usb/tm6000/tm6000-alsa.c                       |   8 +-
 drivers/media/usb/tm6000/tm6000-core.c                       |  24 ++--
 drivers/media/usb/uvc/uvc_video.c                            |   4 +-
 drivers/staging/media/hantro/hantro_h264.c                   |   2 +-
 drivers/staging/media/hantro/hantro_postproc.c               |   4 +-
 drivers/staging/media/rkisp1/TODO                            |   1 -
 drivers/staging/media/rkisp1/rkisp1-common.h                 | 267 +++++++++++++++++++++++++++++++++----------
 drivers/staging/media/rkisp1/rkisp1-dev.c                    |  15 ++-
 drivers/staging/media/rkisp1/rkisp1-isp.c                    |  17 ++-
 drivers/staging/media/rkisp1/rkisp1-params.c                 | 100 +++++++---------
 drivers/staging/media/rkisp1/rkisp1-regs.h                   |   1 -
 drivers/staging/media/rkisp1/rkisp1-stats.c                  |  16 +--
 drivers/staging/media/rkisp1/uapi/rkisp1-config.h            | 247 ++++++++++++++++++++++++---------------
 include/media/cec.h                                          |   2 -
 83 files changed, 662 insertions(+), 628 deletions(-)
