Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5101C35B32
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 13:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727405AbfFELXY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 07:23:24 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:37443 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726280AbfFELXY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 07:23:24 -0400
Received: from [IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9] ([IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YU0khksDf3qlsYU0nhfYER; Wed, 05 Jun 2019 13:23:21 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] Drop vidioc_enum_fmt_vid_*_mplane, driver
 improvements, add codec helpers
Message-ID: <abba589c-0a90-a773-9480-4197628c3926@xs4all.nl>
Date:   Wed, 5 Jun 2019 13:23:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPWIopRjTlW1Be3e1WWi9hcABydtHRYmfUAe/pQorsB/iFvUI+8GsQxH3lnpKwATJMb+zDjWo8aOP3coNmss7Rz9DtucaucODToUCQyx6upJbG+pLfs6
 +MoZFKFMzvAJ0RdouH3jMfmBC6k4Rhakeg6kUKtwKNQk1VC2r7xLW/Lpz5qgWcOOXWDetAHDothap5zK+1vmfbhiawj6f1C5CjHoG2NqIGpOOkOs+ymJ4ONH
 tS0hEH5y5lilRmdoq7lNn75L+BBBEwLglhRo4Td+2/9SvCOuiVj87vB22G1rjQSlxTQAru6OcLQV49/lyynVw8PVAZqEchKzQV+oD7DqyYM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This pull request drops the vidioc_enum_fmt_vid_{cap, out}_mplane callbacks;
instead just use vidioc_enum_fmt_vid_{cap, out}.

Convert lots of drivers to set device_caps in struct video_device instead of
in v4l2_capability: this gives the V4L2 core information about the capabilities
of the video device node. But this can only work if all drivers use it.

This conversion does all except media/pci and media/platform, and the input
touchscreen driver sur40.c (waiting for an Ack from the author for that one).

The final two patches add new helpers for codec drivers.

Regards,

	Hans

The following changes since commit 0864c9ce8fe83eadfd21b08e98997111d091660c:

  media: dt-bindings: Fix vendor-prefixes YAML (2019-06-03 10:47:34 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3j3

for you to fetch changes up to 54c979060f4afe8501a61fee6d504d883c6d2eff:

  vicodec: use new v4l2_m2m_ioctl_try_en/decoder_cmd funcs (2019-06-05 13:18:00 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Boris Brezillon (2):
      media: v4l2: Make sure all drivers set _MPLANE caps in vdev->device_caps
      media: v4l2: Get rid of ->vidioc_enum_fmt_vid_{cap, out}_mplane

Hans Verkuil (8):
      media/radio: set device_caps in struct video_device
      media/usb: set device_caps in struct video_device
      rtl2832_sdr: set device_caps in struct video_device
      usb/gadget/f_uvc: set device_caps in struct video_device
      vc04_services/bcm2835-camera: set device_caps in struct video_device
      staging/media: set device_caps in struct video_device
      v4l2-mem2mem: add try_en/decoder_cmd ioctl helpers
      vicodec: use new v4l2_m2m_ioctl_try_en/decoder_cmd funcs

 drivers/media/dvb-frontends/rtl2832_sdr.c                     |  5 ++---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c                      |  2 +-
 drivers/media/platform/exynos-gsc/gsc-core.c                  |  2 +-
 drivers/media/platform/exynos-gsc/gsc-core.h                  |  2 +-
 drivers/media/platform/exynos-gsc/gsc-m2m.c                   | 14 +++++++-------
 drivers/media/platform/exynos4-is/common.c                    |  5 +----
 drivers/media/platform/exynos4-is/common.h                    |  3 +--
 drivers/media/platform/exynos4-is/fimc-capture.c              | 10 +++++-----
 drivers/media/platform/exynos4-is/fimc-isp-video.c            |  9 +++++----
 drivers/media/platform/exynos4-is/fimc-lite.c                 | 10 ++++------
 drivers/media/platform/exynos4-is/fimc-m2m.c                  | 12 ++++++------
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c               |  4 ++--
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c                  | 18 +++++++++---------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c            | 12 ++++++------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c            | 12 ++++++------
 drivers/media/platform/qcom/camss/camss-video.c               |  2 +-
 drivers/media/platform/qcom/venus/vdec.c                      |  4 ++--
 drivers/media/platform/qcom/venus/venc.c                      |  4 ++--
 drivers/media/platform/rcar_fdp1.c                            |  4 ++--
 drivers/media/platform/rcar_jpu.c                             | 10 ++++++----
 drivers/media/platform/renesas-ceu.c                          |  2 +-
 drivers/media/platform/s5p-mfc/s5p_mfc.c                      |  2 ++
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c                  | 19 ++++++-------------
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c                  | 19 ++++++-------------
 drivers/media/platform/ti-vpe/vpe.c                           |  7 +++----
 drivers/media/platform/vicodec/vicodec-core.c                 | 37 ++++---------------------------------
 drivers/media/platform/vivid/vivid-core.c                     |  6 ++----
 drivers/media/platform/vivid/vivid-vid-common.c               | 20 --------------------
 drivers/media/platform/vivid/vivid-vid-common.h               |  2 --
 drivers/media/radio/dsbr100.c                                 |  3 +--
 drivers/media/radio/radio-cadet.c                             |  5 ++---
 drivers/media/radio/radio-isa.c                               |  4 +---
 drivers/media/radio/radio-keene.c                             |  3 +--
 drivers/media/radio/radio-ma901.c                             |  3 +--
 drivers/media/radio/radio-miropcm20.c                         |  4 ++--
 drivers/media/radio/radio-mr800.c                             |  5 ++---
 drivers/media/radio/radio-raremono.c                          |  3 +--
 drivers/media/radio/radio-sf16fmi.c                           |  3 +--
 drivers/media/radio/radio-si476x.c                            | 21 ++++++++-------------
 drivers/media/radio/radio-tea5764.c                           |  3 +--
 drivers/media/radio/radio-tea5777.c                           |  5 ++---
 drivers/media/radio/radio-timb.c                              |  3 +--
 drivers/media/radio/radio-wl1273.c                            | 12 ++++--------
 drivers/media/radio/si470x/radio-si470x-i2c.c                 |  7 +++----
 drivers/media/radio/si470x/radio-si470x-usb.c                 |  6 +++---
 drivers/media/radio/si4713/radio-platform-si4713.c            |  4 +---
 drivers/media/radio/si4713/radio-usb-si4713.c                 |  4 +---
 drivers/media/radio/tea575x.c                                 |  7 +++----
 drivers/media/radio/wl128x/fmdrv_v4l2.c                       | 10 +++-------
 drivers/media/usb/airspy/airspy.c                             |  6 ++----
 drivers/media/usb/au0828/au0828-video.c                       | 21 ++++++++++-----------
 drivers/media/usb/cpia2/cpia2_v4l.c                           |  9 ++-------
 drivers/media/usb/cx231xx/cx231xx-video.c                     | 28 ++++++++++++++--------------
 drivers/media/usb/em28xx/em28xx-video.c                       | 32 ++++++++++++++++----------------
 drivers/media/usb/go7007/go7007-v4l2.c                        | 15 ++++++---------
 drivers/media/usb/gspca/gspca.c                               |  6 ++----
 drivers/media/usb/hackrf/hackrf.c                             | 14 ++++++--------
 drivers/media/usb/hdpvr/hdpvr-video.c                         |  5 ++---
 drivers/media/usb/msi2500/msi2500.c                           |  5 ++---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c                      | 17 ++++++-----------
 drivers/media/usb/pwc/pwc-if.c                                |  2 ++
 drivers/media/usb/pwc/pwc-v4l.c                               |  3 ---
 drivers/media/usb/s2255/s2255drv.c                            |  5 ++---
 drivers/media/usb/stk1160/stk1160-v4l.c                       |  7 ++-----
 drivers/media/usb/stkwebcam/stk-webcam.c                      |  6 ++----
 drivers/media/usb/tm6000/tm6000-video.c                       | 20 ++++++++++----------
 drivers/media/usb/usbtv/usbtv-video.c                         |  5 ++---
 drivers/media/usb/usbvision/usbvision-video.c                 | 20 ++++++++++----------
 drivers/media/usb/zr364xx/zr364xx.c                           |  7 ++-----
 drivers/media/v4l2-core/v4l2-dev.c                            |  2 --
 drivers/media/v4l2-core/v4l2-ioctl.c                          | 21 +++++++++++----------
 drivers/media/v4l2-core/v4l2-mem2mem.c                        | 29 +++++++++++++++++++++++++++++
 drivers/staging/media/bcm2048/radio-bcm2048.c                 |  7 ++-----
 drivers/staging/media/davinci_vpfe/vpfe_video.c               |  9 +++++----
 drivers/staging/media/ipu3/ipu3-v4l2.c                        |  4 ++--
 drivers/staging/media/omap4iss/iss_video.c                    | 11 +++++------
 drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c        | 12 ++++++------
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c |  6 ++----
 drivers/usb/gadget/function/f_uvc.c                           |  1 +
 drivers/usb/gadget/function/uvc_v4l2.c                        |  4 ----
 include/media/v4l2-ioctl.h                                    | 14 ++------------
 include/media/v4l2-mem2mem.h                                  |  4 ++++
 82 files changed, 305 insertions(+), 425 deletions(-)
