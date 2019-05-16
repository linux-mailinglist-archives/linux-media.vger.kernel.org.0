Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3C7201AA
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 10:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfEPItN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 04:49:13 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:47563 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726383AbfEPItN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 04:49:13 -0400
X-UUID: beefc6fb036349f2b0be1247a46429d7-20190516
X-UUID: beefc6fb036349f2b0be1247a46429d7-20190516
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1219569347; Thu, 16 May 2019 16:49:02 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 May 2019 16:49:00 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 16 May 2019 16:49:01 +0800
Message-ID: <1557996540.11458.135.camel@mtksdccf07>
Subject: Re: [RFC PATCH V1 0/6] media: platform: Add support for Face
 Detection (FD) on mt8183 SoC
From:   Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>,
        <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <holmes.chiou@mediatek.com>, <frederic.chen@mediatek.com>,
        <jungo.lin@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <linux-media@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <devicetree@vger.kernel.org>, <shik@chromium.org>,
        <suleiman@chromium.org>
Date:   Thu, 16 May 2019 16:49:00 +0800
In-Reply-To: <fdc47528-0bfc-898d-c478-ef864769de3f@xs4all.nl>
References: <20190423104505.38778-1-Jerry-Ch.chen@mediatek.com>
         <fdc47528-0bfc-898d-c478-ef864769de3f@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans:

Thanks for your comments.

On Mon, 2019-05-13 at 11:14 +0200, Hans Verkuil wrote:
> On 4/23/19 12:44 PM, Jerry-ch Chen wrote:
> > Hello,
> > 
> > This RFC patch series is adding Face Detection (FD) driver on Mediatek
> > mt8183 SoC. It belongs to the first Mediatek's camera driver series based
> > on V4L2 and media controller framework. I posted the main part of the FD
> > driver as RFC to discuss first and would like some review comments.
> > 
> > ==============
> > Introduction
> > ==============
> > 
> > Face Detection (FD) unit provides hardware accelerated face detection
> > feature. It can detect different sizes of faces in a given image.
> > Furthermore, it has the capability to detect the faces of Rotation-in-Plane
> > from -180 to +180 degrees and Rotation-off-Plane from -90 to +90 degrees.
> > 
> > The driver is implemented with V4L2 and media controller framework. We have
> > the following entities describing the FD path. Since a FD frame has
> > multiple buffers, the driver uses Request API to control the multiple
> > buffer's enqueue flow.
> > 
> > 1. Meta input (output video device): connects to FD sub device. It accepts
> >    the input parameter buffer from userspace. The metadata interface is
> >    only a temporary solution to kick off driver development and is not
> >    ready for reviewed yet.
> > 
> > 2. RAW (output video device): connects to FD sub device. It accepts input
> >    image buffer from userspace.
> > 
> > 3. FD (sub device): connects to Meta output. When processing an image,
> >    FD hardware only returns the statistics of detected faces so it needs
> >    only one capture video devices to return the streaming data to the user.
> > 
> > 4. Meta output (capture video device): Return the result of detected faces
> >    in meta capture buffers.
> 
> I'm a bit confused. What should be in a valid request? One Meta Input buffer
> and one RAW buffer?
> 

We will revise this part and add the following description.
A valid request for FD driver should have one meta input buffer, one RAW
buffer and one meta output buffer.

> Out of curiosity: is there a limit to the number of faces the HW can detect?
> 

From HW point of view, the limit to the number of faces is 1024.

Sincerely,

	Jerry

> Regards,
> 
> 	Hans
> 
> > 
> > The overall file structure of the FD driver is as following:
> > 
> > * mtk_fd-v4l2.c: implements FD V4L2 and vb2 operations.
> > 
> > * mtk_fd-dev.c: implements fd driver software flow. FD driver supports
> > 2 software pipes at the same time. All the pipes share the same FD hardware
> > to process the images.
> > 
> > * mtk_fd-40.c: implements the hardware driving part.
> > 
> > * mtk_fd-smem.c: provides the shared memory management required operation.
> > We reserved a memory region for the co-processor and FD to exchange the
> > tuning and hardware configuration data.
> > 
> > ==================
> > Changes in v1
> > ==================
> > 
> > RFC v1 includes the following modification:
> > 1. Uses Request API instead of FD's buffer collection design
> > 
> > 2. removed unnecessary abstraction structurally, including mtk_fd_ctx and
> > related ops
> > 
> > 3. removed the fd_smem node from device tree
> > 
> > 4. Fixed the common issues Tomasz commented on Mediatek ISP Pass 1's RFC v0
> > patch series
> > 
> > ==================
> > Dependent patch
> > ==================
> > 
> > FD driver depends on MDP 3 driver and SCP driver. The patches are as
> > following:
> > 
> > [1]. support mdp3 on mt8183 platform
> > https://patchwork.kernel.org/cover/10844219/
> > 
> > [2]. Add support for mt8183 SCP
> > https://patchwork.kernel.org/cover/10872547/
> > 
> > ==================
> > Compliance test
> > ==================
> > 
> > v4l2-compliance SHA: not available, 32 bits
> > 
> > Compliance test for mtk-fd-4.0 device /dev/media1:
> > 
> > Media Driver Info:
> > 	Driver name      : mtk-fd-4.0
> > 	Model            : MTK-FD-V4L2
> > 	Serial           :
> > 	Bus info         : platform:1502b000.fd
> > 	Media version    : 4.19.33
> > 	Hardware revision: 0x00000000 (0)
> > 	Driver version   : 4.19.33
> > 
> > Required ioctls:
> > 	test MEDIA_IOC_DEVICE_INFO: OK
> > 
> > Allow for multiple opens:
> > 	test second /dev/media1 open: OK
> > 	test MEDIA_IOC_DEVICE_INFO: OK
> > 	test for unlimited opens: OK
> > 
> > Media Controller ioctls:
> > 	test MEDIA_IOC_G_TOPOLOGY: OK
> > 	Entities: 8 Interfaces: 8 Pads: 12 Links: 14
> > 	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
> > 	test MEDIA_IOC_SETUP_LINK: OK
> > 
> > Total for mtk-fd-4.0 device /dev/media1: 7, Succeeded: 7, Failed: 0, Warnings: 0
> > --------------------------------------------------------------------------------
> > Compliance test for mtk-fd-4.0 device /dev/v4l-subdev3:
> > 
> > Media Driver Info:
> > 	Driver name      : mtk-fd-4.0
> > 	Model            : MTK-FD-V4L2
> > 	Serial           :
> > 	Bus info         : platform:1502b000.fd
> > 	Media version    : 4.19.33
> > 	Hardware revision: 0x00000000 (0)
> > 	Driver version   : 4.19.33
> > Interface Info:
> > 	ID               : 0x03000005
> > 	Type             : V4L Sub-Device
> > Entity Info:
> > 	ID               : 0x00000001 (1)
> > 	Name             : MTK-FD-V4L2
> > 	Function         : Video Pixel Formatter
> > 	Pad 0x01000002   : 0: Sink
> > 	  Link 0x0200000b: from remote pad 0x1000008 of entity 'MTK-FD-V4L2 FDInput': Data, Enabled
> > 	Pad 0x01000003   : 1: Sink
> > 	  Link 0x02000011: from remote pad 0x100000e of entity 'MTK-FD-V4L2 FDConfig': Data, Enabled
> > 	Pad 0x01000004   : 2: Source
> > 	  Link 0x02000017: to remote pad 0x1000014 of entity 'MTK-FD-V4L2 FDOutput': Data, Enabled
> > 
> > Required ioctls:
> > 	test MC information (see 'Media Driver Info' above): OK
> > 
> > Allow for multiple opens:
> > 	test second /dev/v4l-subdev3 open: OK
> > 	test for unlimited opens: OK
> > 
> > Debug ioctls:
> > 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> > 
> > Input ioctls:
> > 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> > 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> > 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > 	test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Sub-Device ioctls (Sink Pad 0):
> > 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> > 	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > 
> > Sub-Device ioctls (Sink Pad 1):
> > 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> > 	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > 
> > Sub-Device ioctls (Source Pad 2):
> > 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> > 	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > 
> > Control ioctls:
> > 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> > 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> > 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > 	Standard Controls: 0 Private Controls: 0
> > 
> > Format ioctls:
> > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
> > 	test VIDIOC_G/S_PARM: OK (Not Supported)
> > 	test VIDIOC_G_FBUF: OK (Not Supported)
> > 	test VIDIOC_G_FMT: OK (Not Supported)
> > 	test VIDIOC_TRY_FMT: OK (Not Supported)
> > 	test VIDIOC_S_FMT: OK (Not Supported)
> > 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > 	test Cropping: OK (Not Supported)
> > 	test Composing: OK (Not Supported)
> > 	test Scaling: OK (Not Supported)
> > 
> > Codec ioctls:
> > 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls:
> > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> > 	test VIDIOC_EXPBUF: OK (Not Supported)
> > 	test Requests: OK (Not Supported)
> > 
> > Total for mtk-fd-4.0 device /dev/v4l-subdev3: 62, Succeeded: 62, Failed: 0, Warnings: 0
> > --------------------------------------------------------------------------------
> > Compliance test for MTK-FD-V4L2 device /dev/video12:
> > 
> > Driver Info:
> > 	Driver name      : MTK-FD-V4L2
> > 	Card type        : MTK-FD-V4L2
> > 	Bus info         : platform:1502b000.fd
> > 	Driver version   : 4.19.33
> > 	Capabilities     : 0x84202000
> > 		Video Output Multiplanar
> > 		Streaming
> > 		Extended Pix Format
> > 		Device Capabilities
> > 	Device Caps      : 0x04202000
> > 		Video Output Multiplanar
> > 		Streaming
> > 		Extended Pix Format
> > Media Driver Info:
> > 	Driver name      : mtk-fd-4.0
> > 	Model            : MTK-FD-V4L2
> > 	Serial           :
> > 	Bus info         : platform:1502b000.fd
> > 	Media version    : 4.19.33
> > 	Hardware revision: 0x00000000 (0)
> > 	Driver version   : 4.19.33
> > Interface Info:
> > 	ID               : 0x03000009
> > 	Type             : V4L Video
> > Entity Info:
> > 	ID               : 0x00000007 (7)
> > 	Name             : MTK-FD-V4L2 FDInput
> > 	Function         : V4L2 I/O
> > 	Pad 0x01000008   : 0: Source
> > 	  Link 0x0200000b: to remote pad 0x1000002 of entity 'MTK-FD-V4L2': Data, Enabled
> > 
> > Required ioctls:
> > 	test MC information (see 'Media Driver Info' above): OK
> > 	test VIDIOC_QUERYCAP: OK
> > 
> > Allow for multiple opens:
> > 	test second /dev/video12 open: OK
> > 	test VIDIOC_QUERYCAP: OK
> > 	test VIDIOC_G/S_PRIORITY: OK
> > 	test for unlimited opens: OK
> > 
> > Debug ioctls:
> > 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> > 
> > Input ioctls:
> > 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> > 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> > 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > 	test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Control ioctls:
> > 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> > 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> > 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > 	Standard Controls: 0 Private Controls: 0
> > 
> > Format ioctls:
> > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > 	test VIDIOC_G/S_PARM: OK (Not Supported)
> > 	test VIDIOC_G_FBUF: OK (Not Supported)
> > 	test VIDIOC_G_FMT: OK
> > 	test VIDIOC_TRY_FMT: OK
> > 	test VIDIOC_S_FMT: OK
> > 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > 	test Cropping: OK (Not Supported)
> > 	test Composing: OK (Not Supported)
> > 	test Scaling: OK
> > 
> > Codec ioctls:
> > 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls:
> > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > 	test VIDIOC_EXPBUF: OK
> > 	test Requests: OK
> > 
> > Total for MTK-FD-V4L2 device /dev/video12: 45, Succeeded: 45, Failed: 0, Warnings: 0
> > --------------------------------------------------------------------------------
> > Compliance test for MTK-FD-V4L2 device /dev/video13:
> > 
> > Driver Info:
> > 	Driver name      : MTK-FD-V4L2
> > 	Card type        : MTK-FD-V4L2
> > 	Bus info         : platform:1502b000.fd
> > 	Driver version   : 4.19.33
> > 	Capabilities     : 0x8c200000
> > 		Streaming
> > 		Extended Pix Format
> > 		Device Capabilities
> > 	Device Caps      : 0x0c200000
> > 		Streaming
> > 		Extended Pix Format
> > Media Driver Info:
> > 	Driver name      : mtk-fd-4.0
> > 	Model            : MTK-FD-V4L2
> > 	Serial           :
> > 	Bus info         : platform:1502b000.fd
> > 	Media version    : 4.19.33
> > 	Hardware revision: 0x00000000 (0)
> > 	Driver version   : 4.19.33
> > Interface Info:
> > 	ID               : 0x0300000f
> > 	Type             : V4L Video
> > Entity Info:
> > 	ID               : 0x0000000d (13)
> > 	Name             : MTK-FD-V4L2 FDConfig
> > 	Function         : V4L2 I/O
> > 	Pad 0x0100000e   : 0: Source
> > 	  Link 0x02000011: to remote pad 0x1000003 of entity 'MTK-FD-V4L2': Data, Enabled
> > 
> > Required ioctls:
> > 	test MC information (see 'Media Driver Info' above): OK
> > 	test VIDIOC_QUERYCAP: OK
> > 
> > Allow for multiple opens:
> > 	test second /dev/video13 open: OK
> > 	test VIDIOC_QUERYCAP: OK
> > 	test VIDIOC_G/S_PRIORITY: OK
> > 	test for unlimited opens: OK
> > 
> > Debug ioctls:
> > 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> > 
> > Input ioctls:
> > 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> > 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> > 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > 	test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Control ioctls:
> > 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> > 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> > 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > 	Standard Controls: 0 Private Controls: 0
> > 
> > Format ioctls:
> > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > 	test VIDIOC_G/S_PARM: OK (Not Supported)
> > 	test VIDIOC_G_FBUF: OK (Not Supported)
> > 	test VIDIOC_G_FMT: OK
> > 	test VIDIOC_TRY_FMT: OK
> > 	test VIDIOC_S_FMT: OK
> > 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > 	test Cropping: OK (Not Supported)
> > 	test Composing: OK (Not Supported)
> > 	test Scaling: OK (Not Supported)
> > 
> > Codec ioctls:
> > 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls:
> > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > 	test VIDIOC_EXPBUF: OK
> > 	test Requests: OK
> > 
> > Total for MTK-FD-V4L2 device /dev/video13: 45, Succeeded: 45, Failed: 0, Warnings: 0
> > --------------------------------------------------------------------------------
> > Compliance test for MTK-FD-V4L2 device /dev/video14:
> > 
> > Driver Info:
> > 	Driver name      : MTK-FD-V4L2
> > 	Card type        : MTK-FD-V4L2
> > 	Bus info         : platform:1502b000.fd
> > 	Driver version   : 4.19.33
> > 	Capabilities     : 0x84a00000
> > 		Metadata Capture
> > 		Streaming
> > 		Extended Pix Format
> > 		Device Capabilities
> > 	Device Caps      : 0x04a00000
> > 		Metadata Capture
> > 		Streaming
> > 		Extended Pix Format
> > Media Driver Info:
> > 	Driver name      : mtk-fd-4.0
> > 	Model            : MTK-FD-V4L2
> > 	Serial           :
> > 	Bus info         : platform:1502b000.fd
> > 	Media version    : 4.19.33
> > 	Hardware revision: 0x00000000 (0)
> > 	Driver version   : 4.19.33
> > Interface Info:
> > 	ID               : 0x03000015
> > 	Type             : V4L Video
> > Entity Info:
> > 	ID               : 0x00000013 (19)
> > 	Name             : MTK-FD-V4L2 FDOutput
> > 	Function         : V4L2 I/O
> > 	Pad 0x01000014   : 0: Sink
> > 	  Link 0x02000017: from remote pad 0x1000004 of entity 'MTK-FD-V4L2': Data, Enabled
> > 
> > Required ioctls:
> > 	test MC information (see 'Media Driver Info' above): OK
> > 	test VIDIOC_QUERYCAP: OK
> > 
> > Allow for multiple opens:
> > 	test second /dev/video14 open: OK
> > 	test VIDIOC_QUERYCAP: OK
> > 	test VIDIOC_G/S_PRIORITY: OK
> > 	test for unlimited opens: OK
> > 
> > Debug ioctls:
> > 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> > 
> > Input ioctls:
> > 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> > 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> > 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > 	test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Control ioctls:
> > 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> > 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> > 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > 	Standard Controls: 0 Private Controls: 0
> > 
> > Format ioctls:
> > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > 	test VIDIOC_G/S_PARM: OK (Not Supported)
> > 	test VIDIOC_G_FBUF: OK (Not Supported)
> > 	test VIDIOC_G_FMT: OK
> > 	test VIDIOC_TRY_FMT: OK
> > 	test VIDIOC_S_FMT: OK
> > 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > 	test Cropping: OK (Not Supported)
> > 	test Composing: OK (Not Supported)
> > 	test Scaling: OK (Not Supported)
> > 
> > Codec ioctls:
> > 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls:
> > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > 	test VIDIOC_EXPBUF: OK
> > 	test Requests: OK
> > 
> > Total for MTK-FD-V4L2 device /dev/video14: 45, Succeeded: 45, Failed: 0, Warnings: 0
> > --------------------------------------------------------------------------------
> > Compliance test for mtk-fd-4.0 device /dev/v4l-subdev4:
> > 
> > Media Driver Info:
> > 	Driver name      : mtk-fd-4.0
> > 	Model            : MTK-FD-V4L2
> > 	Serial           :
> > 	Bus info         : platform:1502b000.fd
> > 	Media version    : 4.19.33
> > 	Hardware revision: 0x00000000 (0)
> > 	Driver version   : 4.19.33
> > Interface Info:
> > 	ID               : 0x0300001d
> > 	Type             : V4L Sub-Device
> > Entity Info:
> > 	ID               : 0x00000019 (25)
> > 	Name             : MTK-FD-V4L2-STREAM-1
> > 	Function         : Video Pixel Formatter
> > 	Pad 0x0100001a   : 0: Sink
> > 	  Link 0x02000023: from remote pad 0x1000020 of entity 'MTK-FD-V4L2-STREAM-1 FDInput': Data, Enabled
> > 	Pad 0x0100001b   : 1: Sink
> > 	  Link 0x02000029: from remote pad 0x1000026 of entity 'MTK-FD-V4L2-STREAM-1 FDConfig': Data, Enabled
> > 	Pad 0x0100001c   : 2: Source
> > 	  Link 0x0200002f: to remote pad 0x100002c of entity 'MTK-FD-V4L2-STREAM-1 FDOutput': Data, Enabled
> > 
> > Required ioctls:
> > 	test MC information (see 'Media Driver Info' above): OK
> > 
> > Allow for multiple opens:
> > 	test second /dev/v4l-subdev4 open: OK
> > 	test for unlimited opens: OK
> > 
> > Debug ioctls:
> > 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> > 
> > Input ioctls:
> > 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> > 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> > 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > 	test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Sub-Device ioctls (Sink Pad 0):
> > 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> > 	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > 
> > Sub-Device ioctls (Sink Pad 1):
> > 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> > 	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > 
> > Sub-Device ioctls (Source Pad 2):
> > 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> > 	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > 
> > Control ioctls:
> > 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> > 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> > 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > 	Standard Controls: 0 Private Controls: 0
> > 
> > Format ioctls:
> > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
> > 	test VIDIOC_G/S_PARM: OK (Not Supported)
> > 	test VIDIOC_G_FBUF: OK (Not Supported)
> > 	test VIDIOC_G_FMT: OK (Not Supported)
> > 	test VIDIOC_TRY_FMT: OK (Not Supported)
> > 	test VIDIOC_S_FMT: OK (Not Supported)
> > 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > 	test Cropping: OK (Not Supported)
> > 	test Composing: OK (Not Supported)
> > 	test Scaling: OK (Not Supported)
> > 
> > Codec ioctls:
> > 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls:
> > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> > 	test VIDIOC_EXPBUF: OK (Not Supported)
> > 	test Requests: OK (Not Supported)
> > 
> > Total for mtk-fd-4.0 device /dev/v4l-subdev4: 62, Succeeded: 62, Failed: 0, Warnings: 0
> > --------------------------------------------------------------------------------
> > Compliance test for MTK-FD-V4L2-STR device /dev/video15:
> > 
> > Driver Info:
> > 	Driver name      : MTK-FD-V4L2-STR
> > 	Card type        : MTK-FD-V4L2-STREAM-1
> > 	Bus info         : platform:1502b000.fd
> > 	Driver version   : 4.19.33
> > 	Capabilities     : 0x84202000
> > 		Video Output Multiplanar
> > 		Streaming
> > 		Extended Pix Format
> > 		Device Capabilities
> > 	Device Caps      : 0x04202000
> > 		Video Output Multiplanar
> > 		Streaming
> > 		Extended Pix Format
> > Media Driver Info:
> > 	Driver name      : mtk-fd-4.0
> > 	Model            : MTK-FD-V4L2
> > 	Serial           :
> > 	Bus info         : platform:1502b000.fd
> > 	Media version    : 4.19.33
> > 	Hardware revision: 0x00000000 (0)
> > 	Driver version   : 4.19.33
> > Interface Info:
> > 	ID               : 0x03000021
> > 	Type             : V4L Video
> > Entity Info:
> > 	ID               : 0x0000001f (31)
> > 	Name             : MTK-FD-V4L2-STREAM-1 FDInput
> > 	Function         : V4L2 I/O
> > 	Pad 0x01000020   : 0: Source
> > 	  Link 0x02000023: to remote pad 0x100001a of entity 'MTK-FD-V4L2-STREAM-1': Data, Enabled
> > 
> > Required ioctls:
> > 	test MC information (see 'Media Driver Info' above): OK
> > 	test VIDIOC_QUERYCAP: OK
> > 
> > Allow for multiple opens:
> > 	test second /dev/video15 open: OK
> > 	test VIDIOC_QUERYCAP: OK
> > 	test VIDIOC_G/S_PRIORITY: OK
> > 	test for unlimited opens: OK
> > 
> > Debug ioctls:
> > 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> > 
> > Input ioctls:
> > 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> > 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> > 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > 	test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Control ioctls:
> > 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> > 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> > 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > 	Standard Controls: 0 Private Controls: 0
> > 
> > Format ioctls:
> > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > 	test VIDIOC_G/S_PARM: OK (Not Supported)
> > 	test VIDIOC_G_FBUF: OK (Not Supported)
> > 	test VIDIOC_G_FMT: OK
> > 	test VIDIOC_TRY_FMT: OK
> > 	test VIDIOC_S_FMT: OK
> > 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > 	test Cropping: OK (Not Supported)
> > 	test Composing: OK (Not Supported)
> > 	test Scaling: OK
> > 
> > Codec ioctls:
> > 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls:
> > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > 	test VIDIOC_EXPBUF: OK
> > 	test Requests: OK
> > 
> > Total for MTK-FD-V4L2-STR device /dev/video15: 45, Succeeded: 45, Failed: 0, Warnings: 0
> > --------------------------------------------------------------------------------
> > Compliance test for MTK-FD-V4L2-STR device /dev/video16:
> > 
> > Driver Info:
> > 	Driver name      : MTK-FD-V4L2-STR
> > 	Card type        : MTK-FD-V4L2-STREAM-1
> > 	Bus info         : platform:1502b000.fd
> > 	Driver version   : 4.19.33
> > 	Capabilities     : 0x8c200000
> > 		Streaming
> > 		Extended Pix Format
> > 		Device Capabilities
> > 	Device Caps      : 0x0c200000
> > 		Streaming
> > 		Extended Pix Format
> > Media Driver Info:
> > 	Driver name      : mtk-fd-4.0
> > 	Model            : MTK-FD-V4L2
> > 	Serial           :
> > 	Bus info         : platform:1502b000.fd
> > 	Media version    : 4.19.33
> > 	Hardware revision: 0x00000000 (0)
> > 	Driver version   : 4.19.33
> > Interface Info:
> > 	ID               : 0x03000027
> > 	Type             : V4L Video
> > Entity Info:
> > 	ID               : 0x00000025 (37)
> > 	Name             : MTK-FD-V4L2-STREAM-1 FDConfig
> > 	Function         : V4L2 I/O
> > 	Pad 0x01000026   : 0: Source
> > 	  Link 0x02000029: to remote pad 0x100001b of entity 'MTK-FD-V4L2-STREAM-1': Data, Enabled
> > 
> > Required ioctls:
> > 	test MC information (see 'Media Driver Info' above): OK
> > 	test VIDIOC_QUERYCAP: OK
> > 
> > Allow for multiple opens:
> > 	test second /dev/video16 open: OK
> > 	test VIDIOC_QUERYCAP: OK
> > 	test VIDIOC_G/S_PRIORITY: OK
> > 	test for unlimited opens: OK
> > 
> > Debug ioctls:
> > 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> > 
> > Input ioctls:
> > 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> > 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> > 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > 	test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Control ioctls:
> > 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> > 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> > 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > 	Standard Controls: 0 Private Controls: 0
> > 
> > Format ioctls:
> > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > 	test VIDIOC_G/S_PARM: OK (Not Supported)
> > 	test VIDIOC_G_FBUF: OK (Not Supported)
> > 	test VIDIOC_G_FMT: OK
> > 	test VIDIOC_TRY_FMT: OK
> > 	test VIDIOC_S_FMT: OK
> > 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > 	test Cropping: OK (Not Supported)
> > 	test Composing: OK (Not Supported)
> > 	test Scaling: OK (Not Supported)
> > 
> > Codec ioctls:
> > 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls:
> > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > 	test VIDIOC_EXPBUF: OK
> > 	test Requests: OK
> > 
> > Total for MTK-FD-V4L2-STR device /dev/video16: 45, Succeeded: 45, Failed: 0, Warnings: 0
> > --------------------------------------------------------------------------------
> > Compliance test for MTK-FD-V4L2-STR device /dev/video17:
> > 
> > Driver Info:
> > 	Driver name      : MTK-FD-V4L2-STR
> > 	Card type        : MTK-FD-V4L2-STREAM-1
> > 	Bus info         : platform:1502b000.fd
> > 	Driver version   : 4.19.33
> > 	Capabilities     : 0x84a00000
> > 		Metadata Capture
> > 		Streaming
> > 		Extended Pix Format
> > 		Device Capabilities
> > 	Device Caps      : 0x04a00000
> > 		Metadata Capture
> > 		Streaming
> > 		Extended Pix Format
> > Media Driver Info:
> > 	Driver name      : mtk-fd-4.0
> > 	Model            : MTK-FD-V4L2
> > 	Serial           :
> > 	Bus info         : platform:1502b000.fd
> > 	Media version    : 4.19.33
> > 	Hardware revision: 0x00000000 (0)
> > 	Driver version   : 4.19.33
> > Interface Info:
> > 	ID               : 0x0300002d
> > 	Type             : V4L Video
> > Entity Info:
> > 	ID               : 0x0000002b (43)
> > 	Name             : MTK-FD-V4L2-STREAM-1 FDOutput
> > 	Function         : V4L2 I/O
> > 	Pad 0x0100002c   : 0: Sink
> > 	  Link 0x0200002f: from remote pad 0x100001c of entity 'MTK-FD-V4L2-STREAM-1': Data, Enabled
> > 
> > Required ioctls:
> > 	test MC information (see 'Media Driver Info' above): OK
> > 	test VIDIOC_QUERYCAP: OK
> > 
> > Allow for multiple opens:
> > 	test second /dev/video17 open: OK
> > 	test VIDIOC_QUERYCAP: OK
> > 	test VIDIOC_G/S_PRIORITY: OK
> > 	test for unlimited opens: OK
> > 
> > Debug ioctls:
> > 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> > 
> > Input ioctls:
> > 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> > 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> > 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > 	test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Control ioctls:
> > 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> > 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> > 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > 	Standard Controls: 0 Private Controls: 0
> > 
> > Format ioctls:
> > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > 	test VIDIOC_G/S_PARM: OK (Not Supported)
> > 	test VIDIOC_G_FBUF: OK (Not Supported)
> > 	test VIDIOC_G_FMT: OK
> > 	test VIDIOC_TRY_FMT: OK
> > 	test VIDIOC_S_FMT: OK
> > 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > 	test Cropping: OK (Not Supported)
> > 	test Composing: OK (Not Supported)
> > 	test Scaling: OK (Not Supported)
> > 
> > Codec ioctls:
> > 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls:
> > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > 	test VIDIOC_EXPBUF: OK
> > 	test Requests: OK
> > 
> > Total for MTK-FD-V4L2-STR device /dev/video17: 45, Succeeded: 45, Failed: 0, Warnings: 0
> > 
> > Grand Total for mtk-fd-4.0 device /dev/media1: 401, Succeeded: 401, Failed: 0, Warnings: 0
> > 
> > 
> > Jerry-ch Chen (6):
> >   dt-bindings: mt8183: Add binding for FD shared memory
> >   dts: arm64: mt8183: Add FD shared memory node
> >   dt-bindings: mt8183: Added FD dt-bindings
> >   dts: arm64: mt8183: Add FD nodes
> >   media: platform: Add Mediatek FD driver KConfig
> >   platform: mtk-isp: Add Mediatek FD driver
> > 
> >  .../bindings/media/mediatek,mt8183-fd.txt     |   34 +
> >  .../mediatek,reserve-memory-fd_smem.txt       |   44 +
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   29 +
> >  drivers/media/platform/Kconfig                |    2 +
> >  drivers/media/platform/mtk-isp/Kconfig        |   18 +
> >  drivers/media/platform/mtk-isp/Makefile       |   16 +
> >  drivers/media/platform/mtk-isp/fd/Makefile    |   25 +
> >  .../media/platform/mtk-isp/fd/mtk_fd-dev.c    |  754 +++++++++++
> >  .../media/platform/mtk-isp/fd/mtk_fd-dev.h    |  315 +++++
> >  drivers/media/platform/mtk-isp/fd/mtk_fd-hw.h |  158 +++
> >  .../media/platform/mtk-isp/fd/mtk_fd-smem.c   |  322 +++++
> >  .../media/platform/mtk-isp/fd/mtk_fd-smem.h   |   39 +
> >  .../media/platform/mtk-isp/fd/mtk_fd-v4l2.c   | 1171 +++++++++++++++++
> >  drivers/media/platform/mtk-isp/fd/mtk_fd_40.c |  555 ++++++++
> >  14 files changed, 3482 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
> >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-fd_smem.txt
> >  create mode 100644 drivers/media/platform/mtk-isp/Kconfig
> >  create mode 100644 drivers/media/platform/mtk-isp/Makefile
> >  create mode 100755 drivers/media/platform/mtk-isp/fd/Makefile
> >  create mode 100755 drivers/media/platform/mtk-isp/fd/mtk_fd-dev.c
> >  create mode 100755 drivers/media/platform/mtk-isp/fd/mtk_fd-dev.h
> >  create mode 100755 drivers/media/platform/mtk-isp/fd/mtk_fd-hw.h
> >  create mode 100755 drivers/media/platform/mtk-isp/fd/mtk_fd-smem.c
> >  create mode 100755 drivers/media/platform/mtk-isp/fd/mtk_fd-smem.h
> >  create mode 100755 drivers/media/platform/mtk-isp/fd/mtk_fd-v4l2.c
> >  create mode 100755 drivers/media/platform/mtk-isp/fd/mtk_fd_40.c
> > 
> 


