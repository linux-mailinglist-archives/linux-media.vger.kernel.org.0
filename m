Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 715E234C435
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 08:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhC2G6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 02:58:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44954 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhC2G55 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 02:57:57 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: benjamin.gaignard)
        with ESMTPSA id 503441F45B59
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, lee.jones@linaro.org,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, hverkuil-cisco@xs4all.nl,
        emil.l.velikov@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 00/13] Add HANTRO G2/HEVC decoder support for IMX8MQ
Date:   Mon, 29 Mar 2021 08:57:30 +0200
Message-Id: <20210329065743.11961-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IMX8MQ got two VPUs but until now only G1 has been enabled.
This series aim to add the second VPU (aka G2) and provide basic 
HEVC decoding support.

To be able to decode HEVC it is needed to add/update some of the
structures in the uapi. In addition of them one HANTRO dedicated
control is required to inform the driver of the numbre of bits to skip
at the beginning of the slice header.
The hardware require to allocate few auxiliary buffers to store the
references frame or tile size data.

The driver has been tested with fluster test suite stream.
For example with this command: ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2SL-Gst1.0

Finally the both VPUs will have a node the device-tree and be
independent from v4l2 point of view.

A branch with all the dev is available here:
https://gitlab.collabora.com/benjamin.gaignard/for-upstream/-/commits/upstream_g2_v7

version 7:
 - Remove 'q' from syscon phandle name to make usable for iMX8MM too.
   Update the bindings documentation.
 - Add review/ack tags.
 - Rebase on top of media_tree/master
 - Be more accurate when computing the size of the memory needed motion
   vectors.
 - Explain why the all clocks need to set in the both DT node.

version 6:
 - fix the errors reported by kernel test robot

version 5:
 - use syscon instead of VPU reset driver.
 - Do not break kernel/DT backward compatibility.
 - Add documentation for dedicated Hantro control.
 - Fix the remarks done by Ezequeil (typo, comments, unused function)
 - Run v4l2-compliance without errors (see below).
 - Do not add field to distinguish version, check postproc reg instead

version 4:
- Split the changes in hevc controls in 2 commits to make them easier to
  review.
- Change hantro_codec_ops run() prototype to return errors   
- Hantro v4l2 dedicated control is now only an integer
- rebase on top of VPU reset changes posted here:
  https://www.spinics.net/lists/arm-kernel/msg878440.html
- Various fix from previous remarks
- Limit the modifications in API to what the driver needs

version 3:
- Fix typo in Hantro v4l2 dedicated control
- Add documentation for the new structures and fields
- Rebased on top of media_tree for-linus-5.12-rc1 tag

version 2:
- remove all change related to scaling
- squash commits to a coherent split
- be more verbose about the added fields
- fix the comments done by Ezequiel about dma_alloc_coherent usage
- fix Dan's comments about control copy, reverse the test logic
in tile_buffer_reallocate, rework some goto and return cases.
- be more verbose about why I change the bindings
- remove all sign-off expect mime since it is confusing
- remove useless clocks in VPUs nodes

./v4l2-compliance -m 1 
v4l2-compliance 1.21.0-4705, 64 bits, 64-bit time_t
v4l2-compliance SHA: 733f7a54f79d 2021-02-03 08:25:49

Compliance test for hantro-vpu device /dev/media1:

Media Driver Info:
	Driver name      : hantro-vpu
	Model            : hantro-vpu
	Serial           : 
	Bus info         : platform: hantro-vpu
	Media version    : 5.11.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.11.0

Required ioctls:
	test MEDIA_IOC_DEVICE_INFO: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/media1 open: OK
	test MEDIA_IOC_DEVICE_INFO: OK
	test for unlimited opens: OK

Media Controller ioctls:
	test MEDIA_IOC_G_TOPOLOGY: OK
	Entities: 3 Interfaces: 1 Pads: 4 Links: 4
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
	test MEDIA_IOC_SETUP_LINK: OK

Total for hantro-vpu device /dev/media1: 8, Succeeded: 8, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for hantro-vpu device /dev/video1:

Driver Info:
	Driver name      : hantro-vpu
	Card type        : nxp,imx8mq-vpu-g2-dec
	Bus info         : platform: hantro-vpu
	Driver version   : 5.11.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : hantro-vpu
	Model            : hantro-vpu
	Serial           : 
	Bus info         : platform: hantro-vpu
	Media version    : 5.11.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.11.0
Interface Info:
	ID               : 0x0300000c
	Type             : V4L Video
Entity Info:
	ID               : 0x00000001 (1)
	Name             : nxp,imx8mq-vpu-g2-dec-source
	Function         : V4L2 I/O
	Pad 0x01000002   : 0: Source
	  Link 0x02000008: to remote pad 0x1000004 of entity 'nxp,imx8mq-vpu-g2-dec-proc': Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video1 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 1

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for hantro-vpu device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0

Grand Total for hantro-vpu device /dev/media1: 54, Succeeded: 54, Failed: 0, Warnings: 0

Benjamin

Benjamin Gaignard (13):
  dt-bindings: mfd: Add 'nxp,imx8mq-vpu-ctrl' to syscon list
  dt-bindings: media: nxp,imx8mq-vpu: Update the bindings for G2 support
  media: hantro: Use syscon instead of 'ctrl' register
  media: hevc: Add fields and flags for hevc PPS
  media: hevc: Add decode params control
  media: hantro: change hantro_codec_ops run prototype to return errors
  media: hantro: Define HEVC codec profiles and supported features
  media: hantro: Only use postproc when post processed formats are
    defined
  media: uapi: Add a control for HANTRO driver
  media: hantro: handle V4L2_PIX_FMT_HEVC_SLICE control
  media: hantro: Introduce G2/HEVC decoder
  media: hantro: IMX8M: add variant for G2/HEVC codec
  arm64: dts: imx8mq: Add node to G2 hardware

 .../bindings/media/nxp,imx8mq-vpu.yaml        |  53 +-
 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 .../userspace-api/media/drivers/hantro.rst    |  14 +
 .../userspace-api/media/drivers/index.rst     |   1 +
 .../media/v4l/ext-ctrls-codec.rst             | 108 +++-
 .../media/v4l/vidioc-queryctrl.rst            |   6 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  43 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  26 +-
 drivers/staging/media/hantro/Makefile         |   2 +
 drivers/staging/media/hantro/hantro.h         |  18 +-
 drivers/staging/media/hantro/hantro_drv.c     |  99 ++-
 .../staging/media/hantro/hantro_g1_h264_dec.c |  10 +-
 .../media/hantro/hantro_g1_mpeg2_dec.c        |   4 +-
 .../staging/media/hantro/hantro_g1_vp8_dec.c  |   6 +-
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 587 ++++++++++++++++++
 drivers/staging/media/hantro/hantro_g2_regs.h | 198 ++++++
 .../staging/media/hantro/hantro_h1_jpeg_enc.c |   4 +-
 drivers/staging/media/hantro/hantro_hevc.c    | 325 ++++++++++
 drivers/staging/media/hantro/hantro_hw.h      |  69 +-
 .../staging/media/hantro/hantro_postproc.c    |  14 +
 drivers/staging/media/hantro/hantro_v4l2.c    |   5 +-
 drivers/staging/media/hantro/imx8m_vpu_hw.c   | 128 +++-
 .../media/hantro/rk3399_vpu_hw_jpeg_enc.c     |   4 +-
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |   4 +-
 .../media/hantro/rk3399_vpu_hw_vp8_dec.c      |   6 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   6 +
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   1 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   2 +
 .../staging/media/sunxi/cedrus/cedrus_h265.c  |  12 +-
 include/media/hevc-ctrls.h                    |  33 +-
 include/uapi/linux/v4l2-controls.h            |  13 +
 31 files changed, 1682 insertions(+), 120 deletions(-)
 create mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
 create mode 100644 drivers/staging/media/hantro/hantro_g2_hevc_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_g2_regs.h
 create mode 100644 drivers/staging/media/hantro/hantro_hevc.c

-- 
2.25.1

