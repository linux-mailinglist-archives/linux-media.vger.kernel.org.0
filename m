Return-Path: <linux-media+bounces-261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FCB7E9FBC
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 16:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B0E81F21879
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 15:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6492136E;
	Mon, 13 Nov 2023 15:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A2421360
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 15:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E939CC433C7;
	Mon, 13 Nov 2023 15:17:02 +0000 (UTC)
Message-ID: <b2ce0372-715f-44c0-a833-30643163bba9@xs4all.nl>
Date: Mon, 13 Nov 2023 16:17:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v6.8] Add support for more than 32 buffers
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

This patch series consists of the first 50 patches of the main patch series adding
support for VIDIOC_DELETE_BUFS:

https://patchwork.linuxtv.org/project/linux-media/list/?series=11627

These first 50 patches add support for more than 32 buffers (if the driver indicates
support for that), and converts drivers that directly access vb2_buffer or vb2_queue
fields (num_buffers, bufs) to use accessor functions.

This prepares the media subsystem for the next future step: deleting buffers.

Several test drivers are adapted to allow more than 32 buffers, and so is the
verisilicon driver.

A v4l-utils patch adding support for testing more than 32 buffers is here:

https://patchwork.linuxtv.org/project/linux-media/patch/20231107104132.445705-3-benjamin.gaignard@collabora.com/

That will be merged in v4l-utils once this PR is merged in staging.

Before the remaining 6 patches can be merged there is some more cleanup that
needs to happen first relating to how drivers (ab)use min_buffers_needed and
how they implement 'I need at least X buffers' in various ways.

Regards,

	Hans

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.8e

for you to fetch changes up to d56a3f47f38e5aca0f6f1bd933ec4a6ba2339bb5:

  media: verisilicon: vp9: Allow to change resolution while streaming (2023-11-13 13:28:56 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Gaignard (50):
      media: videobuf2: Rename offset parameter
      media: videobuf2: Rework offset 'cookie' encoding pattern
      media: videobuf2: Stop spamming kernel log with all queue counter
      media: videobuf2: Use vb2_buffer instead of index
      media: videobuf2: Access vb2_queue bufs array through helper functions
      media: videobuf2: Remove duplicated index vs q->num_buffers check
      media: videobuf2: Add helper to get queue number of buffers
      media: videobuf2: Use vb2_get_num_buffers() helper
      media: amphion: Use vb2_get_buffer() instead of directly access to buffers array
      media: amphion: Stop direct calls to queue num_buffers field
      media: mediatek: jpeg: Use vb2_get_buffer() instead of directly access to buffers array
      media: mediatek: vdec: Remove useless loop
      media: mediatek: vcodec: Stop direct calls to queue num_buffers field
      media: sti: hva: Remove useless check
      media: visl: Use vb2_get_buffer() instead of directly access to buffers array
      media: atomisp: Use vb2_get_buffer() instead of directly access to buffers array
      media: atomisp: Stop direct calls to queue num_buffers field
      media: dvb-core: Use vb2_get_buffer() instead of directly access to buffers array
      media: dvb-core: Do not initialize twice queue num_buffer field
      media: dvb-frontends: rtl2832: Stop direct calls to queue num_buffers field
      media: pci: dt3155: Remove useless check
      media: pci: tw686x: Stop direct calls to queue num_buffers field
      media: pci: cx18: Stop direct calls to queue num_buffers field
      media: pci: netup_unidvb: Stop direct calls to queue num_buffers field
      media: pci: tw68: Stop direct calls to queue num_buffers field
      media: i2c: video-i2c: Stop direct calls to queue num_buffers field
      media: coda: Stop direct calls to queue num_buffers field
      media: nxp: Stop direct calls to queue num_buffers field
      media: verisilicon: Stop direct calls to queue num_buffers field
      media: test-drivers: Stop direct calls to queue num_buffers field
      media: imx: Stop direct calls to queue num_buffers field
      media: meson: vdec: Stop direct calls to queue num_buffers field
      touchscreen: sur40: Stop direct calls to queue num_buffers field
      sample: v4l: Stop direct calls to queue num_buffers field
      media: cedrus: Stop direct calls to queue num_buffers field
      media: nuvoton: Stop direct calls to queue num_buffers field
      media: renesas: Stop direct calls to queue num_buffers field
      media: ti: Stop direct calls to queue num_buffers field
      media: usb: airspy: Stop direct calls to queue num_buffers field
      media: usb: cx231xx: Stop direct calls to queue num_buffers field
      media: usb: hackrf: Stop direct calls to queue num_buffers field
      media: usb: usbtv: Stop direct calls to queue num_buffers field
      media videobuf2: Be more flexible on the number of queue stored buffers
      media: core: Report the maximum possible number of buffers for the queue
      media: test-drivers: vivid: Increase max supported buffers for capture queues
      media: test-drivers: vicodec: Increase max supported capture queue buffers
      media: verisilicon: Refactor postprocessor to store more buffers
      media: verisilicon: Store chroma and motion vectors offset
      media: verisilicon: g2: Use common helpers to compute chroma and mv offsets
      media: verisilicon: vp9: Allow to change resolution while streaming

 Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst              |   8 +-
 Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst                  |   1 +
 drivers/input/touchscreen/sur40.c                                         |   5 +-
 drivers/media/common/videobuf2/videobuf2-core.c                           | 489 ++++++++++++++++++++++---------------
 drivers/media/common/videobuf2/videobuf2-v4l2.c                           |  85 ++++---
 drivers/media/dvb-core/dvb_vb2.c                                          |  19 +-
 drivers/media/dvb-frontends/rtl2832_sdr.c                                 |   5 +-
 drivers/media/i2c/video-i2c.c                                             |   5 +-
 drivers/media/pci/cx18/cx18-streams.c                                     |   5 +-
 drivers/media/pci/dt3155/dt3155.c                                         |   2 -
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c                        |   5 +-
 drivers/media/pci/tw68/tw68-video.c                                       |   5 +-
 drivers/media/pci/tw686x/tw686x-video.c                                   |   5 +-
 drivers/media/platform/amphion/vpu_dbg.c                                  |  30 ++-
 drivers/media/platform/amphion/vpu_v4l2.c                                 |   4 +-
 drivers/media/platform/chips-media/coda-common.c                          |   2 +-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c                      |   7 +-
 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |   9 +-
 drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c           |   2 +-
 drivers/media/platform/nuvoton/npcm-video.c                               |   2 +-
 drivers/media/platform/nxp/imx7-media-csi.c                               |   7 +-
 drivers/media/platform/renesas/rcar_drif.c                                |   5 +-
 drivers/media/platform/st/sti/hva/hva-v4l2.c                              |   9 +-
 drivers/media/platform/ti/am437x/am437x-vpfe.c                            |   5 +-
 drivers/media/platform/ti/cal/cal-video.c                                 |   5 +-
 drivers/media/platform/ti/davinci/vpif_capture.c                          |   5 +-
 drivers/media/platform/ti/davinci/vpif_display.c                          |   5 +-
 drivers/media/platform/ti/omap/omap_vout.c                                |   5 +-
 drivers/media/platform/verisilicon/hantro.h                               |   9 +-
 drivers/media/platform/verisilicon/hantro_drv.c                           |   4 +-
 drivers/media/platform/verisilicon/hantro_g2.c                            |  14 ++
 drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c                   |  18 +-
 drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c                    |  28 +--
 drivers/media/platform/verisilicon/hantro_hw.h                            |   7 +-
 drivers/media/platform/verisilicon/hantro_postproc.c                      |  95 +++++--
 drivers/media/platform/verisilicon/hantro_v4l2.c                          |  26 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c                         |   1 +
 drivers/media/test-drivers/visl/visl-dec.c                                |  32 ++-
 drivers/media/test-drivers/vivid/vivid-core.c                             |  14 ++
 drivers/media/test-drivers/vivid/vivid-meta-cap.c                         |   3 -
 drivers/media/test-drivers/vivid/vivid-meta-out.c                         |   5 +-
 drivers/media/test-drivers/vivid/vivid-touch-cap.c                        |   5 +-
 drivers/media/test-drivers/vivid/vivid-vbi-cap.c                          |   3 -
 drivers/media/test-drivers/vivid/vivid-vbi-out.c                          |   3 -
 drivers/media/test-drivers/vivid/vivid-vid-cap.c                          |   3 -
 drivers/media/test-drivers/vivid/vivid-vid-out.c                          |   5 +-
 drivers/media/usb/airspy/airspy.c                                         |   5 +-
 drivers/media/usb/cx231xx/cx231xx-417.c                                   |   5 +-
 drivers/media/usb/cx231xx/cx231xx-video.c                                 |   5 +-
 drivers/media/usb/hackrf/hackrf.c                                         |   5 +-
 drivers/media/usb/usbtv/usbtv-video.c                                     |   5 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c                             |  10 +-
 drivers/media/v4l2-core/v4l2-ioctl.c                                      |   4 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c                         |   4 +-
 drivers/staging/media/imx/imx-media-capture.c                             |   7 +-
 drivers/staging/media/meson/vdec/vdec.c                                   |  13 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c                          |   9 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c                          |   9 +-
 include/media/videobuf2-core.h                                            |  39 ++-
 include/uapi/linux/videodev2.h                                            |   7 +-
 samples/v4l/v4l2-pci-skeleton.c                                           |   5 +-
 61 files changed, 698 insertions(+), 450 deletions(-)

