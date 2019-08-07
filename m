Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6E9484BFD
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 14:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387777AbfHGMsb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 08:48:31 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:18642 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727171AbfHGMsb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Aug 2019 08:48:31 -0400
X-UUID: 153bcff7da074251bc0960a9867f42ca-20190807
X-UUID: 153bcff7da074251bc0960a9867f42ca-20190807
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 859971120; Wed, 07 Aug 2019 20:48:08 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 7 Aug 2019 20:48:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 7 Aug 2019 20:48:08 +0800
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     <tfiga@chromium.org>, <hverkuil-cisco@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <ddavenport@chromium.org>, <robh@kernel.org>,
        <Sean.Cheng@mediatek.com>, <sj.huang@mediatek.com>,
        <frederic.chen@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <frankie.chiu@mediatek.com>, <ryan.yu@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <yuzhao@chromium.org>,
        <zwisler@chromium.org>, <shik@chromium.org>,
        <suleiman@chromium.org>, <jungo.lin@mediatek.com>
Subject: [RFC,v4,0/4] media: platform: mtk-isp: Add Mediatek ISP Pass 1 driver
Date:   Wed, 7 Aug 2019 20:47:59 +0800
Message-ID: <20190807124803.29884-1-jungo.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <Jungo Lin <jungo.lin@mediatek.com>
References: <Jungo Lin <jungo.lin@mediatek.com>
Reply-To: Jungo Lin <jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 89B9591F9A85B648C00FEA54FDF94C710A6794ED604B252E42CEA584EEE992A32000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This RFC patch series adding the driver for Pass 1 (P1) unit in
Mediatek's camera ISP system on mt8183 SoC, which will be used in
camera features of CrOS. It's the first time Mediatek develops
ISP kernel drivers based on V4L2 and media controller framework.
I posted the main part of the ISP Pass 1 driver as RFC to discuss
first and would like some review comments on the overall architecture
of the driver.

Pass 1 unit processes image signal from sensor devices and accepts the
tuning parameters to adjust the image quality. It performs optical
black correction, defect pixel correction, W/IR imbalance correction
and lens shading correction for RAW processing.

The driver is implemented with V4L2 and media controller framework so
we have the following entities to describe the ISP pass 1 path.

(The current metadata interface used in meta input and partial meta
nodes is only a temporary solution to kick off the driver development
and is not ready to be reviewed yet.)

1. meta input (output video device): connect to ISP P1 sub device.
It accepts the tuning buffer from user.

2. ISP P1 (sub device): connect to partial meta 0/1/2/3,
main stream and packed out video devices. When processing an image,
Pass 1 hardware supports multiple output images with different sizes
and formats so it needs two capture video devices ("main stream" and
"packed out") to return the image data to the user.

3. main stream (capture video device): return the processed image data
which is used in capture scenario.

4. packed out (capture video device): return the processed image data
which is used in preview scenario.

5. partial meta 0 (capture video device): return the AE/AWB statistics.

6. partial meta 1 (capture video device): return the AF statistics.

7. partial meta 2 (capture video device): return the local contrast
   enhanced statistics.

8. partial meta 3 (capture video device): return the local motion
   vector statistics.

The overall patches of the series is:

* Patch 1 & 2 are dt-bindings & dts information related to ISP P1 driver.
* Patch 3 extends the original V4L2 image & meta formats for ISP P1 driver.
* Patch 4 is the heart of ISP P1 driver. It handles the ISP
  HW configuration. Moreover, implement standard V4L2 video driver that utilizes
  V4L2 and media framework APIs. Communicate with co-process via SCP communication
  to compose ISP registers in the firmware.

Here is ISP P1 media topology:
It is included the main/sub sensor & sen-inf sub-devices which are implemented
in below patch[1][2][3]:

For Mediatek ISP P1 driver, it also depends on MT8183 SCP[6] & IOMMU[7] patchsets

/usr/bin/media-ctl -p -d /dev/media1

Media controller API version 4.19.59

Media device information
------------------------
driver          mtk-cam-p1
model           mtk-cam-p1
serial          
bus info        platform:1a000000.camisp
hw revision     0x0
driver version  4.19.59

Device topology
- entity 1: mtk-cam-p1 (12 pads, 8 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev5
	pad0: Sink
		<- "mtk-cam-p1 meta input":0 []
	pad1: Source
		-> "mtk-cam-p1 main stream":0 [ENABLED,IMMUTABLE]
	pad2: Source
		-> "mtk-cam-p1 packed out":0 []
	pad3: Source
		-> "mtk-cam-p1 partial meta 0":0 []
	pad4: Source
		-> "mtk-cam-p1 partial meta 1":0 []
	pad5: Source
		-> "mtk-cam-p1 partial meta 2":0 []
	pad6: Source
		-> "mtk-cam-p1 partial meta 3":0 []
	pad7: Source
	pad8: Source
	pad9: Source
	pad10: Source
	pad11: Sink
		<- "1a040000.seninf.mipi-csi":4 [ENABLED,IMMUTABLE]

- entity 14: mtk-cam-p1 meta input (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video25
	pad0: Source
		-> "mtk-cam-p1":0 []

- entity 20: mtk-cam-p1 main stream (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video26
	pad0: Sink
		<- "mtk-cam-p1":1 [ENABLED,IMMUTABLE]

- entity 26: mtk-cam-p1 packed out (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video27
	pad0: Sink
		<- "mtk-cam-p1":2 []

- entity 32: mtk-cam-p1 partial meta 0 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video28
	pad0: Sink
		<- "mtk-cam-p1":3 []

- entity 38: mtk-cam-p1 partial meta 1 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video29
	pad0: Sink
		<- "mtk-cam-p1":4 []

- entity 44: mtk-cam-p1 partial meta 2 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video30
	pad0: Sink
		<- "mtk-cam-p1":5 []

- entity 50: mtk-cam-p1 partial meta 3 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video31
	pad0: Sink
		<- "mtk-cam-p1":6 []

- entity 56: 1a040000.seninf.mipi-csi (12 pads, 3 links)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev6
	pad0: Sink
		[fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
		<- "ov5695 2-0036":0 []
	pad1: Sink
		[fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
		<- "ov2685 4-003c":0 []
	pad2: Sink
		[fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
	pad3: Sink
		[fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
	pad4: Source
		[fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
		-> "mtk-cam-p1":11 [ENABLED,IMMUTABLE]
	pad5: Source
		[fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
	pad6: Source
		[fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
	pad7: Source
		[fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
	pad8: Source
		[fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
	pad9: Source
		[fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
	pad10: Source
		[fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
	pad11: Source
		[fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]

- entity 69: ov5695 2-0036 (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev7
	pad0: Source
		[fmt:SBGGR10_1X10/2592x1944 field:none colorspace:srgb]
		-> "1a040000.seninf.mipi-csi":0 []

- entity 73: ov2685 4-003c (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev8
	pad0: Source
		[fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
		-> "1a040000.seninf.mipi-csi":1 []

===========
= history =
===========

version 4:
 - Fix Tomasz's comments which are addressed in MTK ISP P1 driver v3 patch[4]
 - Fix some Tomasz comments which are addressed in DIP's v2 patch[5]
 - Extend MTK proprietary image formats to support bayer order
 - Support V4L2_BUF_FLAG_TSTAMP_SRC_SOE for capture devices

Todo:
 - vb2_ops's buf_request_complete callback function implementation
 - Add rst documents for Mediatek meta formats
 - New meta buffer structure design & re-factoring
 - Support V4L2_BUF_FLAG_TIMESTAMP_BOOTTIME timestamp flag
 - Align and pack IPI comamnd structures for EC ROM size shrink

version 3:
 - Remove ISP Pass 1 reserved memory device node and change to use SCP's
   reserved memory region. (Rob Herring)
 - Fix comments of ISP Pass 1 device node & dt-bindings document (Rob Herring)
 - Revise ISP Pass1 Kconfig
 - Add rst documents for Mediatek image formats (Hans Verkuil)
 - Fix kernel warning messages when running v4l2_compliance test
 - Move AFO buffer enqueue & de-queue from request API to non-request
 - mtk_cam-ctrl.h/mtk_cam-ctrl.c
   Revise Mediatek ISP Pass1 specific V4L2 control naming & file licence declaration (Hans Verkuil)
   Split GET_BIN_INFO control into two controls to get width & height in-dependently (Hans Verkuil)
 - mtk_cam-v4l2-util.h/mtk_cam-v4l2-util.c
   Merging mtk_cam-dev.c and mtk_cam-v4l2-util.c. (Drew Davenport)
   Remove the pix_mode argument in related functions and unreachable code. (Drew Davenport)
   Fix Drew's comments which are addressed in v2 patch
   Fix some Tomasz comments which are addressed in DIP's v1 patch[3]
 - mtk_cam-regs.h / mtk_cam.h / mtk_cam.c
   Fix Drew's comments which are addressed in v2 patch
   Fix some Tomasz comments which are addressed in DIP's v1 patch[3]
   Refactoring mtk_isp_config & mtk_isp_req_enqueue functions
 - mtk_cam-scp.h / mtk_cam-scp.c
   Move function declarations from mtk_cam.h to mtk_cam-scp.h (Drew Davenport)
   Fix some Tomasz comments which are addressed in DIP's v1 patch[3]
   Fix ISP de-initialize timing KE issue
 - mtk_cam-smem.h / mtk_cam-smem-dev.c
   Get the reserved shared memory via SCP driver (Tomasz Figa)

Todo:
 - Add rst documents for Mediatek meta formats
 - New meta buffer structure design & re-factoring

version 2:
 - Add 3A enhancement feature which includes:
   Separates 3A pipeline out of frame basis to improve
   AE/AWB (exposure and white balance) performance.
   Add 2 SCP sub-commands for 3A meta buffers.
 - Add new child device to manage P1 shared memory between P1 HW unit
   and co-processor.
 - Remove mediatek,cam_smem.txt & cam_smem dts node in mt8183.dtsi.
 - Revised document wording for dt-bindings documents & dts information.
 - Remove mtk_cam-ctx.h & mtk_cam-dev-ctx-core.c and move these
   source codes to mtk_cam-dev.h & mtk_cam-dev.c.
 - mtk_cam-dev.h / mtk_cam-dev.c
   Revised mtk_cam_video_device & mtk_cam_dev to remove unused structure fields
   or add comments.
   Revised buffer size for LMVO & LCSO.
   Fix pixel format utility function.
   Add vb2_dma_contig_set_max_seg_size to configure DMA max segment size.
 - mtk_cam-v4l2-util.c
   Refactoring V4L2 async mechanism with seninf driver only
   Refactoring CIO (Connection IO) implementation with active sensor
   Revised stream on function for 3A enhancement feature
   Add new V4L2 en-queue/de-queue utility functions for 3A enhancement feature
 - mtk_cam-regs.h / mtk_cam.h / mtk_cam.c
   Add meta buffer index register definitions
   Add meta DMA configuration function.
   Separate with frame-base and non-frame-base en-queue/de-queue functions
   Add isp_setup_scp_rproc function to get RPC handle
   Add mtk_cam_reserved_memory_init for shared memory management
 - mtk_cam-scp.h / mtk_cam-scp.c
   Add new meta strictures for 3A enhancement feature
   Add new IPI command utility function for 3A enhancement feature
   Enhance isp_composer_dma_sg_init function flow
   Shorten overall IPI command structure size
   Remove scp_state state checking
   Improve code readability
 - mtk_cam-smem.h / mtk_cam-smem-dev.c
   Add mtk_cam_alloc_smem_dev to allocate one new child device of ISP driver.
   Handling P1 driver 's reserved memory & allocate DMA buffers based on this
   memory region.

TODOs:
 - 3A enhancement feature bug fixing

version 1:
 - Revised driver sources based on Tomasz's comments including
   part1/2/3/4 in RFC V0 patch.
 - Remove DMA cache mechanism.
   Support two new video devices (LCSO/LMVO) for advance camera
   features.
 - Fixed v4l2-compliance test failure items.
 - Add private controls for Mediatek camera middle-ware.
 - Replace VPU driver's APIs with new SCP driver interface for
   co-processor communication.
 - Refactoring mtk_cam_scp.c to use ring-buffers mechanism for IPI
   commands RX handling.
 - Fix internal bugs.

TODOs:
 - Remove mtk_cam_smem_drv.c & mtk_cam_smem.h and implement DMA pool
   for shared memory management.
 - Revised file names.
 - Support non frame-sync AFO/AAO DMA buffers

version 0:
- Initial submission

==================
 Dependent patch
==================

Camera ISP P1 driver depends on seninf driver, SCP driver.
The patches are listed as following:

[1]. BACKPORT: FROMLIST: platform: mtk-isp: Add Mediatek sensor interface driver
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1482517

[2]. WIP: media: ov5695: support ov5695 sensor in mt8183
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1614887

[3]. WIP: media: ov2685: support ov2685 sensor in mt8183
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1614885

[4]. media: platform: mtk-isp: Add Mediatek ISP Pass 1 driver
https://patchwork.linuxtv.org/cover/56778/

[5]. [RFC,V2,4/6] platform: mtk-isp: Add Mediatek DIP driver
https://patchwork.linuxtv.org/patch/57472/

[6]. Add support for mt8183 SCP
https://patchwork.kernel.org/cover/11076543/

[7]. MT8183 IOMMU SUPPORT
https://patchwork.kernel.org/cover/10984739/

==================
 Compliance test
==================

The v4l2-compliance is built with the below lastest patch.
https://git.linuxtv.org/v4l-utils.git/commit/?id=28be49b4e9d72c5866188cf5ba408541c665c921

Note 1.
This testing depends on the above seninf & sensors patches[1][2][3].

Note 2.
The current failure items are related to Mediatek seninf driver which
is under developing in other patchset.[1]

/usr/bin/v4l2-compliance -m /dev/media1

v4l2-compliance SHA: not available, 32 bits

Compliance test for mtk-cam-p1 device /dev/media1:

Media Driver Info:
	Driver name      : mtk-cam-p1
	Model            : mtk-cam-p1
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.59
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.59

Required ioctls:
	test MEDIA_IOC_DEVICE_INFO: OK

Allow for multiple opens:
	test second /dev/media1 open: OK
	test MEDIA_IOC_DEVICE_INFO: OK
	test for unlimited opens: OK

Media Controller ioctls:
	test MEDIA_IOC_G_TOPOLOGY: OK
	Entities: 11 Interfaces: 11 Pads: 33 Links: 21
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
	test MEDIA_IOC_SETUP_LINK: OK

Total for mtk-cam-p1 device /dev/media1: 7, Succeeded: 7, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-p1 device /dev/video25:

Driver Info:
	Driver name      : mtk-cam-p1
	Card type        : mtk-cam-p1
	Bus info         : platform:1a000000.camisp
	Driver version   : 4.19.59
	Capabilities     : 0x8c200000
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x0c200000
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-p1
	Model            : mtk-cam-p1
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.59
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.59
Interface Info:
	ID               : 0x03000010
	Type             : V4L Video
Entity Info:
	ID               : 0x0000000e (14)
	Name             : mtk-cam-p1 meta input
	Function         : V4L2 I/O
	Pad 0x0100000f   : 0: Source
	  Link 0x02000012: to remote pad 0x1000002 of entity 'mtk-cam-p1': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video25 open: OK
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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

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

Total for mtk-cam-p1 device /dev/video25: 45, Succeeded: 45, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-p1 device /dev/video26:

Driver Info:
	Driver name      : mtk-cam-p1
	Card type        : mtk-cam-p1
	Bus info         : platform:1a000000.camisp
	Driver version   : 4.19.59
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-p1
	Model            : mtk-cam-p1
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.59
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.59
Interface Info:
	ID               : 0x03000016
	Type             : V4L Video
Entity Info:
	ID               : 0x00000014 (20)
	Name             : mtk-cam-p1 main stream
	Function         : V4L2 I/O
	Pad 0x01000015   : 0: Sink
	  Link 0x02000018: from remote pad 0x1000003 of entity 'mtk-cam-p1': Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video26 open: OK
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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

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
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-p1 device /dev/video26: 45, Succeeded: 45, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-p1 device /dev/video27:

Driver Info:
	Driver name      : mtk-cam-p1
	Card type        : mtk-cam-p1
	Bus info         : platform:1a000000.camisp
	Driver version   : 4.19.59
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-p1
	Model            : mtk-cam-p1
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.59
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.59
Interface Info:
	ID               : 0x0300001c
	Type             : V4L Video
Entity Info:
	ID               : 0x0000001a (26)
	Name             : mtk-cam-p1 packed out
	Function         : V4L2 I/O
	Pad 0x0100001b   : 0: Sink
	  Link 0x0200001e: from remote pad 0x1000004 of entity 'mtk-cam-p1': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video27 open: OK
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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

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
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-p1 device /dev/video27: 45, Succeeded: 45, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-p1 device /dev/video28:

Driver Info:
	Driver name      : mtk-cam-p1
	Card type        : mtk-cam-p1
	Bus info         : platform:1a000000.camisp
	Driver version   : 4.19.59
	Capabilities     : 0x84a00000
		Metadata Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04a00000
		Metadata Capture
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-p1
	Model            : mtk-cam-p1
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.59
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.59
Interface Info:
	ID               : 0x03000022
	Type             : V4L Video
Entity Info:
	ID               : 0x00000020 (32)
	Name             : mtk-cam-p1 partial meta 0
	Function         : V4L2 I/O
	Pad 0x01000021   : 0: Sink
	  Link 0x02000024: from remote pad 0x1000005 of entity 'mtk-cam-p1': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video28 open: OK
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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

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

Total for mtk-cam-p1 device /dev/video28: 45, Succeeded: 45, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-p1 device /dev/video29:

Driver Info:
	Driver name      : mtk-cam-p1
	Card type        : mtk-cam-p1
	Bus info         : platform:1a000000.camisp
	Driver version   : 4.19.59
	Capabilities     : 0x84a00000
		Metadata Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04a00000
		Metadata Capture
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-p1
	Model            : mtk-cam-p1
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.59
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.59
Interface Info:
	ID               : 0x03000028
	Type             : V4L Video
Entity Info:
	ID               : 0x00000026 (38)
	Name             : mtk-cam-p1 partial meta 1
	Function         : V4L2 I/O
	Pad 0x01000027   : 0: Sink
	  Link 0x0200002a: from remote pad 0x1000006 of entity 'mtk-cam-p1': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video29 open: OK
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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

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

Total for mtk-cam-p1 device /dev/video29: 45, Succeeded: 45, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-p1 device /dev/video30:

Driver Info:
	Driver name      : mtk-cam-p1
	Card type        : mtk-cam-p1
	Bus info         : platform:1a000000.camisp
	Driver version   : 4.19.59
	Capabilities     : 0x84a00000
		Metadata Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04a00000
		Metadata Capture
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-p1
	Model            : mtk-cam-p1
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.59
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.59
Interface Info:
	ID               : 0x0300002e
	Type             : V4L Video
Entity Info:
	ID               : 0x0000002c (44)
	Name             : mtk-cam-p1 partial meta 2
	Function         : V4L2 I/O
	Pad 0x0100002d   : 0: Sink
	  Link 0x02000030: from remote pad 0x1000007 of entity 'mtk-cam-p1': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video30 open: OK
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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

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

Total for mtk-cam-p1 device /dev/video30: 45, Succeeded: 45, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-p1 device /dev/video31:

Driver Info:
	Driver name      : mtk-cam-p1
	Card type        : mtk-cam-p1
	Bus info         : platform:1a000000.camisp
	Driver version   : 4.19.59
	Capabilities     : 0x84a00000
		Metadata Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04a00000
		Metadata Capture
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-p1
	Model            : mtk-cam-p1
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.59
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.59
Interface Info:
	ID               : 0x03000034
	Type             : V4L Video
Entity Info:
	ID               : 0x00000032 (50)
	Name             : mtk-cam-p1 partial meta 3
	Function         : V4L2 I/O
	Pad 0x01000033   : 0: Sink
	  Link 0x02000036: from remote pad 0x1000008 of entity 'mtk-cam-p1': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video31 open: OK
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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

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

Total for mtk-cam-p1 device /dev/video31: 45, Succeeded: 45, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-p1 device /dev/v4l-subdev5:

Media Driver Info:
	Driver name      : mtk-cam-p1
	Model            : mtk-cam-p1
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.59
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.59
Interface Info:
	ID               : 0x0300004f
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000001 (1)
	Name             : mtk-cam-p1
	Function         : Video Pixel Formatter
	Pad 0x01000002   : 0: Sink
	  Link 0x02000012: from remote pad 0x100000f of entity 'mtk-cam-p1 meta input': Data
	Pad 0x01000003   : 1: Source
	  Link 0x02000018: to remote pad 0x1000015 of entity 'mtk-cam-p1 main stream': Data, Enabled, Immutable
	Pad 0x01000004   : 2: Source
	  Link 0x0200001e: to remote pad 0x100001b of entity 'mtk-cam-p1 packed out': Data
	Pad 0x01000005   : 3: Source
	  Link 0x02000024: to remote pad 0x1000021 of entity 'mtk-cam-p1 partial meta 0': Data
	Pad 0x01000006   : 4: Source
	  Link 0x0200002a: to remote pad 0x1000027 of entity 'mtk-cam-p1 partial meta 1': Data
	Pad 0x01000007   : 5: Source
	  Link 0x02000030: to remote pad 0x100002d of entity 'mtk-cam-p1 partial meta 2': Data
	Pad 0x01000008   : 6: Source
	  Link 0x02000036: to remote pad 0x1000033 of entity 'mtk-cam-p1 partial meta 3': Data
	Pad 0x01000009   : 7: Source
	Pad 0x0100000a   : 8: Source
	Pad 0x0100000b   : 9: Source
	Pad 0x0100000c   : 10: Source
	Pad 0x0100000d   : 11: Sink
	  Link 0x0200004d: from remote pad 0x100003d of entity '1a040000.seninf.mipi-csi': Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK

Allow for multiple opens:
	test second /dev/v4l-subdev5 open: OK
	test for unlimited opens: OK

Debug ioctls:
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

Sub-Device ioctls (Sink Pad 0):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 2):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 3):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 4):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 5):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 6):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 7):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 8):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 9):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 10):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 11):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for mtk-cam-p1 device /dev/v4l-subdev5: 125, Succeeded: 125, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-p1 device /dev/v4l-subdev6:

Media Driver Info:
	Driver name      : mtk-cam-p1
	Model            : mtk-cam-p1
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.59
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.59
Interface Info:
	ID               : 0x03000051
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000038 (56)
	Name             : 1a040000.seninf.mipi-csi
	Function         : Video Interface Bridge
	Pad 0x01000039   : 0: Sink
	  Link 0x02000047: from remote pad 0x1000046 of entity 'ov5695 2-0036': Data
	Pad 0x0100003a   : 1: Sink
	  Link 0x0200004b: from remote pad 0x100004a of entity 'ov2685 4-003c': Data
	Pad 0x0100003b   : 2: Sink
	Pad 0x0100003c   : 3: Sink
	Pad 0x0100003d   : 4: Source
	  Link 0x0200004d: to remote pad 0x100000d of entity 'mtk-cam-p1': Data, Enabled, Immutable
	Pad 0x0100003e   : 5: Source
	Pad 0x0100003f   : 6: Source
	Pad 0x01000040   : 7: Source
	Pad 0x01000041   : 8: Source
	Pad 0x01000042   : 9: Source
	Pad 0x01000043   : 10: Source
	Pad 0x01000044   : 11: Source

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK

Allow for multiple opens:
	test second /dev/v4l-subdev6 open: OK
	test for unlimited opens: OK

Debug ioctls:
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

Sub-Device ioctls (Sink Pad 0):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(381): s_fmt.format.code == ~0U
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(381): s_fmt.format.code == ~0U
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 1):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(381): s_fmt.format.code == ~0U
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(313): fmt.code == 0 || fmt.code == ~0U
		fail: v4l2-test-subdevs.cpp(356): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 2):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(381): s_fmt.format.code == ~0U
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(313): fmt.code == 0 || fmt.code == ~0U
		fail: v4l2-test-subdevs.cpp(356): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 3):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(381): s_fmt.format.code == ~0U
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(313): fmt.code == 0 || fmt.code == ~0U
		fail: v4l2-test-subdevs.cpp(356): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 4):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(381): s_fmt.format.code == ~0U
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
  test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(313): fmt.code == 0 || fmt.code == ~0U
		fail: v4l2-test-subdevs.cpp(356): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 5):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(381): s_fmt.format.code == ~0U
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(313): fmt.code == 0 || fmt.code == ~0U
		fail: v4l2-test-subdevs.cpp(356): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 6):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(381): s_fmt.format.code == ~0U
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(313): fmt.code == 0 || fmt.code == ~0U
		fail: v4l2-test-subdevs.cpp(356): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 7):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(381): s_fmt.format.code == ~0U
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(313): fmt.code == 0 || fmt.code == ~0U
		fail: v4l2-test-subdevs.cpp(356): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 8):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(381): s_fmt.format.code == ~0U
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(313): fmt.code == 0 || fmt.code == ~0U
		fail: v4l2-test-subdevs.cpp(356): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 9):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(381): s_fmt.format.code == ~0U
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(313): fmt.code == 0 || fmt.code == ~0U
		fail: v4l2-test-subdevs.cpp(356): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 10):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(381): s_fmt.format.code == ~0U
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(313): fmt.code == 0 || fmt.code == ~0U
		fail: v4l2-test-subdevs.cpp(356): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 11):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(381): s_fmt.format.code == ~0U
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(313): fmt.code == 0 || fmt.code == ~0U
		fail: v4l2-test-subdevs.cpp(356): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for mtk-cam-p1 device /dev/v4l-subdev6: 125, Succeeded: 101, Failed: 24, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-p1 device /dev/v4l-subdev7:

Media Driver Info:
	Driver name      : mtk-cam-p1
	Model            : mtk-cam-p1
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.59
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.59
Interface Info:
	ID               : 0x03000053
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000045 (69)
	Name             : ov5695 2-0036
	Function         : Camera Sensor
	Pad 0x01000046   : 0: Source
	  Link 0x02000047: to remote pad 0x1000039 of entity '1a040000.seninf.mipi-csi': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK

Allow for multiple opens:
	test second /dev/v4l-subdev7 open: OK
	test for unlimited opens: OK

Debug ioctls:
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

Sub-Device ioctls (Source Pad 0):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 11 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for mtk-cam-p1 device /dev/v4l-subdev7: 48, Succeeded: 48, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-p1 device /dev/v4l-subdev8:

Media Driver Info:
	Driver name      : mtk-cam-p1
	Model            : mtk-cam-p1
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.59
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.59
Interface Info:
	ID               : 0x03000055
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000049 (73)
	Name             : ov2685 4-003c
	Function         : Camera Sensor
	Pad 0x0100004a   : 0: Source
	  Link 0x0200004b: to remote pad 0x100003a of entity '1a040000.seninf.mipi-csi': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK

Allow for multiple opens:
	test second /dev/v4l-subdev8 open: OK
	test for unlimited opens: OK

Debug ioctls:
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

Sub-Device ioctls (Source Pad 0):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 10 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for mtk-cam-p1 device /dev/v4l-subdev8: 48, Succeeded: 48, Failed: 0, Warnings: 0

Grand Total for mtk-cam-p1 device /dev/media1: 668, Succeeded: 644, Failed: 24, Warnings: 0

=========================================================================================

Jungo Lin (4):
  media: dt-bindings: mt8183: Added camera ISP Pass 1
  dts: arm64: mt8183: Add ISP Pass 1 nodes
  media: platform: Add Mediatek ISP P1 image & meta formats
  media: platform: Add Mediatek ISP P1 V4L2 device driver

 .../bindings/media/mediatek,camisp.txt        |   73 +
 .../media/uapi/v4l/pixfmt-mtisp-sbggr10.rst   |   65 +
 .../media/uapi/v4l/pixfmt-mtisp-sbggr10f.rst  |   90 +
 .../media/uapi/v4l/pixfmt-mtisp-sbggr12.rst   |   61 +
 .../media/uapi/v4l/pixfmt-mtisp-sbggr12f.rst  |  110 +
 .../media/uapi/v4l/pixfmt-mtisp-sbggr14.rst   |   73 +
 .../media/uapi/v4l/pixfmt-mtisp-sbggr14f.rst  |  110 +
 .../media/uapi/v4l/pixfmt-mtisp-sbggr8.rst    |   51 +
 .../media/uapi/v4l/pixfmt-mtisp-sbggr8f.rst   |   78 +
 Documentation/media/uapi/v4l/pixfmt-rgb.rst   |    8 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   31 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/mtk-isp/Kconfig        |   17 +
 .../media/platform/mtk-isp/isp_50/Makefile    |    3 +
 .../platform/mtk-isp/isp_50/cam/Makefile      |    6 +
 .../platform/mtk-isp/isp_50/cam/mtk_cam-hw.c  |  622 +++++
 .../platform/mtk-isp/isp_50/cam/mtk_cam-hw.h  |   65 +
 .../platform/mtk-isp/isp_50/cam/mtk_cam-ipi.h |  222 ++
 .../mtk-isp/isp_50/cam/mtk_cam-regs.h         |   95 +
 .../platform/mtk-isp/isp_50/cam/mtk_cam.c     | 2066 +++++++++++++++++
 .../platform/mtk-isp/isp_50/cam/mtk_cam.h     |  242 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |   37 +
 include/uapi/linux/videodev2.h                |   39 +
 24 files changed, 4166 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,camisp.txt
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr10.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr10f.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr12.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr12f.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr14.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr14f.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr8.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr8f.rst
 create mode 100644 drivers/media/platform/mtk-isp/Kconfig
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-hw.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-hw.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ipi.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h


