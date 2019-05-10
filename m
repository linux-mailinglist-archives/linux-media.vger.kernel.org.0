Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB65319695
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 04:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbfEJCFW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 22:05:22 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:59382 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726795AbfEJCFW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 May 2019 22:05:22 -0400
X-UUID: ecd7cf782a8f43f98903f217b0e2f070-20190510
X-UUID: ecd7cf782a8f43f98903f217b0e2f070-20190510
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1072815746; Fri, 10 May 2019 09:59:49 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 May 2019 09:59:41 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 May 2019 09:59:42 +0800
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     <tfiga@chromium.org>, <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>
CC:     <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <frederic.chen@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <frankie.chiu@mediatek.com>, <seraph.huang@mediatek.com>,
        <ryan.yu@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <yuzhao@chromium.org>, <zwisler@chromium.org>, <shik@chromium.org>,
        <suleiman@chromium.org>
Subject: [RFC,V2,00/11] meida: platform: mtk-isp: Add Mediatek ISP Pass 1 driver
Date:   Fri, 10 May 2019 09:57:45 +0800
Message-ID: <20190510015755.51495-1-jungo.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <Jungo Lin <jungo.lin@mediatek.com>
References: <Jungo Lin <jungo.lin@mediatek.com>
Reply-To: Jungo Lin <jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This RFC patch series adding the driver for Pass 1 (P1) unit in
Mediatek's camera ISP system on mt8183 SoC, which
will be used in camera features of CrOS. It's the first time Mediatek
develops ISP kernel drivers based on V4L2 and media controller
framework. I posted the main part of the ISP Pass 1 driver as RFC to
discuss first and would like some review comments on the overall
architecture of the driver.

Pass 1 unit processes image signal from sensor devices and accepts the
tuning parameters to adjust the image quality. It performs optical
black correction, defect pixel correction, W/IR imbalance correction
and lens shading correction for RAW processing.

The driver is implemented with V4L2 and media controller framework so
we have the following entities to describe the ISP pass 1 path. (The
current metadata interface used in meta input and partial meta nodes
is only a temporary solution to kick off the driver development and is
not ready to be reviewed yet):

1. meta input (output video device): connects to ISP P1 sub device. It
accepts the tuning buffer from user.

2. ISP P1 (sub device): connects to partial meta 0/1/2/3,
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

* Patch 1~4 are dt-bindings & dts information related to
  ISP P1 driver & shared memory.

* Patch 5 is Kconfig configuration for ISP P1 driver.

* Patch 6 extends the original V4L2 image & meta formats.

* Patch 7 add private v4l2 control ID for ISP P1 driver.

* Patch 8 provides V4L2 utility functions & default video devices
  configuration for ISP P1 driver.

* Patch 9 is the heart of ISP P1 driver. It handles the ISP
  HW configuration, provides interrupt handling and initializes
  the V4L2 device nodes and other functions.

* Patch 10 adds communication with the co-processor on the SoC through
  the SCP driver.
The SCP driver path is listed below:
<URL: https://patchwork.kernel.org/cover/10872547/>

* Patch 11 provides ISP P1 shard memory management between ISP P1 &
co-processor. It is controlled by child device of ISP P1 driver.

Here is ISP P1 media topology:
It is included the main/sub sensor & sen-inf sub-devices which are
implemented in below patch:
<URL: https://patchwork.kernel.org/cover/10852957/>

/usr/bin/media-ctl -d /dev/media2 -p

Media controller API version 4.19.36

Media device information
------------------------
driver          mtk-cam
model           MTK-ISP-P1-V4L2
serial
bus info        platform:1a000000.camisp
hw revision     0x0
driver version  4.19.36

Device topology
- entity 1: MTK-ISP-P1-V4L2 (12 pads, 8 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev4
	pad0: Sink
		<- "MTK-ISP-P1-V4L2 meta input":0 []
	pad1: Source
		-> "MTK-ISP-P1-V4L2 main stream":0 []
	pad2: Source
		-> "MTK-ISP-P1-V4L2 packed out":0 []
	pad3: Source
		-> "MTK-ISP-P1-V4L2 partial meta 0":0 []
	pad4: Source
		-> "MTK-ISP-P1-V4L2 partial meta 1":0 []
	pad5: Source
		-> "MTK-ISP-P1-V4L2 partial meta 2":0 [DYNAMIC]
	pad6: Source
		-> "MTK-ISP-P1-V4L2 partial meta 3":0 [DYNAMIC]
	pad7: Source
	pad8: Source
	pad9: Source
	pad10: Source
	pad11: Sink
		<- "1a040000.seninf.mipi-csi":4 [ENABLED]

- entity 14: MTK-ISP-P1-V4L2 meta input (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video15
	pad0: Sink
		-> "MTK-ISP-P1-V4L2":0 []

- entity 20: MTK-ISP-P1-V4L2 main stream (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video16
	pad0: Source
		<- "MTK-ISP-P1-V4L2":1 []

- entity 26: MTK-ISP-P1-V4L2 packed out (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video17
	pad0: Source
		<- "MTK-ISP-P1-V4L2":2 []

- entity 32: MTK-ISP-P1-V4L2 partial meta 0 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video18
	pad0: Source
		<- "MTK-ISP-P1-V4L2":3 []

- entity 38: MTK-ISP-P1-V4L2 partial meta 1 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video19
	pad0: Source
		<- "MTK-ISP-P1-V4L2":4 []

- entity 44: MTK-ISP-P1-V4L2 partial meta 2 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video20
	pad0: Source
		<- "MTK-ISP-P1-V4L2":5 [DYNAMIC]

- entity 50: MTK-ISP-P1-V4L2 partial meta 3 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video21
	pad0: Source
		<- "MTK-ISP-P1-V4L2":6 [DYNAMIC]

- entity 56: 1a040000.seninf.mipi-csi (12 pads, 3 links)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev5
	pad0: Sink
		<- "ov5695 2-0036":0 [ENABLED]
	pad1: Sink
		<- "ov2685 4-003c":0 []
	pad2: Sink
	pad3: Sink
	pad4: Source
		-> "MTK-ISP-P1-V4L2":11 [ENABLED]
	pad5: Source
	pad6: Source
	pad7: Source
	pad8: Source
	pad9: Source
	pad10: Source
	pad11: Source

- entity 69: ov5695 2-0036 (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev6
	pad0: Source
		[fmt:SBGGR10_1X10/2592x1944 field:none colorspace:srgb]
		-> "1a040000.seninf.mipi-csi":0 [ENABLED]

- entity 73: ov2685 4-003c (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev7
	pad0: Source
		[fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
		-> "1a040000.seninf.mipi-csi":1 []

===========
= history =
===========

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
 - Revised driver soruces based on Tomasz's comments including
   part1/2/3/4 in RFC V0 patch.
 - Remove DMA cache mechanism.
   Support two new video devices (LCSO/LMVO) for advance camera
   features.
 - Fixed v4l2-compliance test failure items.
 - Add private controls for Mediatek camera middleware.
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

Camera ISP P1 driver depends on seninf driver, SCP driver & IOMMU driver.
The patches are as following:

[1]. media: support Mediatek sensor interface driver
https://patchwork.kernel.org/cover/10852957/

[2]. Add support for mt8183 SCP
https://patchwork.kernel.org/cover/10872547/

[3]. MT8183 IOMMU SUPPORT
https://patchwork.kernel.org/cover/10719217/

==================
 Compliance test
==================

The v4l2-compliance is built with the below lastest patch.
https://git.linuxtv.org/v4l-utils.git/commit/utils/v4l2-compliance?id=2aff3ef768c42cfdbb31d143ee2286a6b46e9db0

Note 1.
Revised testRequests function to bypass V4L2_CTRL_FLAG_READ_ONLY to
avoid VIDIOC_S_EXT_CTRLS failure due to EACASS with read only flag.

[Code]
	if (qctrl.flags & V4L2_CTRL_FLAG_READ_ONLY ||
		qctrl.flags & V4L2_CTRL_FLAG_WRITE_ONLY)
		continue;

Note 2.
Before passing streaming on testing, need to enable media links betwen
entity 1: MTK-ISP-P1-V4L2, entity 20: MTK-ISP-P1-V4L2 main stream
and entity 26: MTK-ISP-P1-V4L2 packed out.

/usr/bin/media-ctl -i
Enter a link to modify or enter to stop
1:1->20:0[1]
1:1->20:0[1]
Enter a link to modify or enter to stop
1:2->26:0[1]
1:2->26:0[1]
Enter a link to modify or enter to stop

v4l2-compliance test output:
/usr/bin/v4l2-compliance -m /dev/media2

v4l2-compliance SHA: not available, 32 bits

Compliance test for mtk-cam device /dev/media2:

Media Driver Info:
	Driver name      : mtk-cam
	Model            : MTK-ISP-P1-V4L2
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.36
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.36

Required ioctls:
	test MEDIA_IOC_DEVICE_INFO: OK

Allow for multiple opens:
	test second /dev/media2 open: OK
	test MEDIA_IOC_DEVICE_INFO: OK
	test for unlimited opens: OK

Media Controller ioctls:
	test MEDIA_IOC_G_TOPOLOGY: OK
	Entities: 11 Interfaces: 11 Pads: 33 Links: 21
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
	test MEDIA_IOC_SETUP_LINK: OK

Total for mtk-cam device /dev/media2: 7, Succeeded: 7, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for MTK-ISP-P1-V4L2 device /dev/video15:

Driver Info:
	Driver name      : MTK-ISP-P1-V4L2
	Card type        : MTK-ISP-P1-V4L2
	Bus info         : platform:1a000000.camisp
	Driver version   : 4.19.36
	Capabilities     : 0x8c200000
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x0c200000
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam
	Model            : MTK-ISP-P1-V4L2
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.36
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.36
Interface Info:
	ID               : 0x03000010
	Type             : V4L Video
Entity Info:
	ID               : 0x0000000e (14)
	Name             : MTK-ISP-P1-V4L2 meta input
	Function         : V4L2 I/O
	Pad 0x0100000f   : 0: Sink
	  Link 0x02000012: to remote pad 0x1000002 of entity 'MTK-ISP-P1-V4L2': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video15 open: OK
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

Total for MTK-ISP-P1-V4L2 device /dev/video15: 45, Succeeded: 45, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for MTK-ISP-P1-V4L2 device /dev/video16:

Driver Info:
	Driver name      : MTK-ISP-P1-V4L2
	Card type        : MTK-ISP-P1-V4L2
	Bus info         : platform:1a000000.camisp
	Driver version   : 4.19.36
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
	Driver name      : mtk-cam
	Model            : MTK-ISP-P1-V4L2
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.36
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.36
Interface Info:
	ID               : 0x03000016
	Type             : V4L Video
Entity Info:
	ID               : 0x00000014 (20)
	Name             : MTK-ISP-P1-V4L2 main stream
	Function         : V4L2 I/O
	Pad 0x01000015   : 0: Source
	  Link 0x02000018: from remote pad 0x1000003 of entity 'MTK-ISP-P1-V4L2': Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video16 open: OK
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
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

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

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 1 Private Controls: 2

Format ioctls (Input 0):
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

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for MTK-ISP-P1-V4L2 device /dev/video16: 45, Succeeded: 45, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for MTK-ISP-P1-V4L2 device /dev/video17:

Driver Info:
	Driver name      : MTK-ISP-P1-V4L2
	Card type        : MTK-ISP-P1-V4L2
	Bus info         : platform:1a000000.camisp
	Driver version   : 4.19.36
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
	Driver name      : mtk-cam
	Model            : MTK-ISP-P1-V4L2
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.36
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.36
Interface Info:
	ID               : 0x0300001c
	Type             : V4L Video
Entity Info:
	ID               : 0x0000001a (26)
	Name             : MTK-ISP-P1-V4L2 packed out
	Function         : V4L2 I/O
	Pad 0x0100001b   : 0: Source
	  Link 0x0200001e: from remote pad 0x1000004 of entity 'MTK-ISP-P1-V4L2': Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video17 open: OK
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
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

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

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 1 Private Controls: 2

Format ioctls (Input 0):
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

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for MTK-ISP-P1-V4L2 device /dev/video17: 45, Succeeded: 45, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for MTK-ISP-P1-V4L2 device /dev/video18:

Driver Info:
	Driver name      : MTK-ISP-P1-V4L2
	Card type        : MTK-ISP-P1-V4L2
	Bus info         : platform:1a000000.camisp
	Driver version   : 4.19.36
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
	Driver name      : mtk-cam
	Model            : MTK-ISP-P1-V4L2
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.36
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.36
Interface Info:
	ID               : 0x03000022
	Type             : V4L Video
Entity Info:
	ID               : 0x00000020 (32)
	Name             : MTK-ISP-P1-V4L2 partial meta 0
	Function         : V4L2 I/O
	Pad 0x01000021   : 0: Source
	  Link 0x02000024: from remote pad 0x1000005 of entity 'MTK-ISP-P1-V4L2': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video18 open: OK
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

Total for MTK-ISP-P1-V4L2 device /dev/video18: 45, Succeeded: 45, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for MTK-ISP-P1-V4L2 device /dev/video19:

Driver Info:
	Driver name      : MTK-ISP-P1-V4L2
	Card type        : MTK-ISP-P1-V4L2
	Bus info         : platform:1a000000.camisp
	Driver version   : 4.19.36
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
	Driver name      : mtk-cam
	Model            : MTK-ISP-P1-V4L2
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.36
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.36
Interface Info:
	ID               : 0x03000028
	Type             : V4L Video
Entity Info:
	ID               : 0x00000026 (38)
	Name             : MTK-ISP-P1-V4L2 partial meta 1
	Function         : V4L2 I/O
	Pad 0x01000027   : 0: Source
	  Link 0x0200002a: from remote pad 0x1000006 of entity 'MTK-ISP-P1-V4L2': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video19 open: OK
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

Total for MTK-ISP-P1-V4L2 device /dev/video19: 45, Succeeded: 45, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for MTK-ISP-P1-V4L2 device /dev/video20:

Driver Info:
	Driver name      : MTK-ISP-P1-V4L2
	Card type        : MTK-ISP-P1-V4L2
	Bus info         : platform:1a000000.camisp
	Driver version   : 4.19.36
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
	Driver name      : mtk-cam
	Model            : MTK-ISP-P1-V4L2
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.36
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.36
Interface Info:
	ID               : 0x0300002e
	Type             : V4L Video
Entity Info:
	ID               : 0x0000002c (44)
	Name             : MTK-ISP-P1-V4L2 partial meta 2
	Function         : V4L2 I/O
	Pad 0x0100002d   : 0: Source
	  Link 0x02000030: from remote pad 0x1000007 of entity 'MTK-ISP-P1-V4L2': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video20 open: OK
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

Total for MTK-ISP-P1-V4L2 device /dev/video20: 45, Succeeded: 45, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for MTK-ISP-P1-V4L2 device /dev/video21:

Driver Info:
	Driver name      : MTK-ISP-P1-V4L2
	Card type        : MTK-ISP-P1-V4L2
	Bus info         : platform:1a000000.camisp
	Driver version   : 4.19.36
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
	Driver name      : mtk-cam
	Model            : MTK-ISP-P1-V4L2
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.36
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.36
Interface Info:
	ID               : 0x03000034
	Type             : V4L Video
Entity Info:
	ID               : 0x00000032 (50)
	Name             : MTK-ISP-P1-V4L2 partial meta 3
	Function         : V4L2 I/O
	Pad 0x01000033   : 0: Source
	  Link 0x02000036: from remote pad 0x1000008 of entity 'MTK-ISP-P1-V4L2': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video21 open: OK
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

Total for MTK-ISP-P1-V4L2 device /dev/video21: 45, Succeeded: 45, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam device /dev/v4l-subdev4:

Media Driver Info:
	Driver name      : mtk-cam
	Model            : MTK-ISP-P1-V4L2
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.36
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.36
Interface Info:
	ID               : 0x0300004f
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000001 (1)
	Name             : MTK-ISP-P1-V4L2
	Function         : Video Statistics
	Pad 0x01000002   : 0: Sink
	  Link 0x02000012: from remote pad 0x100000f of entity 'MTK-ISP-P1-V4L2 meta input': Data
	Pad 0x01000003   : 1: Source
	  Link 0x02000018: to remote pad 0x1000015 of entity 'MTK-ISP-P1-V4L2 main stream': Data, Enabled
	Pad 0x01000004   : 2: Source
	  Link 0x0200001e: to remote pad 0x100001b of entity 'MTK-ISP-P1-V4L2 packed out': Data, Enabled
	Pad 0x01000005   : 3: Source
	  Link 0x02000024: to remote pad 0x1000021 of entity 'MTK-ISP-P1-V4L2 partial meta 0': Data
	Pad 0x01000006   : 4: Source
	  Link 0x0200002a: to remote pad 0x1000027 of entity 'MTK-ISP-P1-V4L2 partial meta 1': Data
	Pad 0x01000007   : 5: Source
	  Link 0x02000030: to remote pad 0x100002d of entity 'MTK-ISP-P1-V4L2 partial meta 2': Data, Dynamic
	Pad 0x01000008   : 6: Source
	  Link 0x02000036: to remote pad 0x1000033 of entity 'MTK-ISP-P1-V4L2 partial meta 3': Data, Dynamic
	Pad 0x01000009   : 7: Source
	Pad 0x0100000a   : 8: Source
	Pad 0x0100000b   : 9: Source
	Pad 0x0100000c   : 10: Source
	Pad 0x0100000d   : 11: Sink
	  Link 0x0200004d: from remote pad 0x100003d of entity '1a040000.seninf.mipi-csi': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK

Allow for multiple opens:
	test second /dev/v4l-subdev4 open: OK
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

Total for mtk-cam device /dev/v4l-subdev4: 125, Succeeded: 125, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam device /dev/v4l-subdev5:

Media Driver Info:
	Driver name      : mtk-cam
	Model            : MTK-ISP-P1-V4L2
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.36
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.36
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
	  Link 0x0200004d: to remote pad 0x100000d of entity 'MTK-ISP-P1-V4L2': Data
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
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 1):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 2):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 3):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 4):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 5):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 6):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 7):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 8):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 9):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 10):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 11):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
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

Total for mtk-cam device /dev/v4l-subdev5: 125, Succeeded: 125, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam device /dev/v4l-subdev6:

Media Driver Info:
	Driver name      : mtk-cam
	Model            : MTK-ISP-P1-V4L2
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.36
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.36
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

Total for mtk-cam device /dev/v4l-subdev6: 48, Succeeded: 48, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam device /dev/v4l-subdev7:

Media Driver Info:
	Driver name      : mtk-cam
	Model            : MTK-ISP-P1-V4L2
	Serial           : 
	Bus info         : platform:1a000000.camisp
	Media version    : 4.19.36
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.36
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

Total for mtk-cam device /dev/v4l-subdev7: 48, Succeeded: 48, Failed: 0, Warnings: 0

Grand Total for mtk-cam device /dev/media2: 668, Succeeded: 668, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------

Jungo Lin (11):
  dt-bindings: mt8183: Add binding for ISP Pass 1 reserved memory
  dts: arm64: mt8183: Add ISP Pass 1 shared memory node
  dt-bindings: mt8183: Added camera ISP Pass 1
  dts: arm64: mt8183: Add ISP Pass 1 nodes
  media: platform: Add Mediatek ISP Pass 1 driver Kconfig
  media: platform: Add Mediatek ISP P1 image & meta formats
  media: platform: Add Mediatek ISP P1 private control
  media: platform: Add Mediatek ISP P1 V4L2 functions
  media: platform: Add Mediatek ISP P1 device driver
  media: platform: Add Mediatek ISP P1 SCP communication
  media: platform: Add Mediatek ISP P1 shared memory device

 .../bindings/media/mediatek,camisp.txt        |   92 ++
 .../mediatek,reserve-memory-cam-smem.txt      |   42 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   45 +
 drivers/media/platform/Kconfig                |    2 +
 drivers/media/platform/mtk-isp/Kconfig        |   21 +
 .../platform/mtk-isp/isp_50/cam/Makefile      |   19 +
 .../mtk-isp/isp_50/cam/mtk_cam-ctrl.c         |  133 ++
 .../mtk-isp/isp_50/cam/mtk_cam-ctrl.h         |   32 +
 .../platform/mtk-isp/isp_50/cam/mtk_cam-dev.c |  758 +++++++++++
 .../platform/mtk-isp/isp_50/cam/mtk_cam-dev.h |  250 ++++
 .../mtk-isp/isp_50/cam/mtk_cam-regs.h         |  149 ++
 .../platform/mtk-isp/isp_50/cam/mtk_cam-scp.c |  481 +++++++
 .../platform/mtk-isp/isp_50/cam/mtk_cam-scp.h |  207 +++
 .../mtk-isp/isp_50/cam/mtk_cam-smem-dev.c     |  297 ++++
 .../mtk-isp/isp_50/cam/mtk_cam-smem.h         |   28 +
 .../mtk-isp/isp_50/cam/mtk_cam-v4l2-util.c    | 1086 +++++++++++++++
 .../mtk-isp/isp_50/cam/mtk_cam-v4l2-util.h    |   43 +
 .../platform/mtk-isp/isp_50/cam/mtk_cam.c     | 1206 +++++++++++++++++
 .../platform/mtk-isp/isp_50/cam/mtk_cam.h     |  300 ++++
 include/uapi/linux/v4l2-controls.h            |    4 +
 include/uapi/linux/videodev2.h                |   20 +
 21 files changed, 5215 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,camisp.txt
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-cam-smem.txt
 create mode 100644 drivers/media/platform/mtk-isp/Kconfig
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-dev.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-dev.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem-dev.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h

-- 
2.18.0

