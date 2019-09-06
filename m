Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22246AB57A
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 12:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388384AbfIFKMG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 06:12:06 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:64519 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727171AbfIFKMG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 06:12:06 -0400
X-UUID: 382e79b8fcb24b6d94b68d7ffa8a2dfc-20190906
X-UUID: 382e79b8fcb24b6d94b68d7ffa8a2dfc-20190906
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1695806442; Fri, 06 Sep 2019 18:11:57 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Sep 2019 18:11:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 6 Sep 2019 18:11:53 +0800
From:   Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>, <lkml@metux.net>
CC:     <ck.hu@mediatek.com>, <yuzhao@chromium.org>,
        <zwisler@chromium.org>, <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <frederic.chen@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <jungo.lin@mediatek.com>, <po-yang.huang@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>
Subject: [RFC PATCH V3 0/3] media: platform: Add support for Face Detection (FD) on mt8183 SoC
Date:   Fri, 6 Sep 2019 18:11:22 +0800
Message-ID: <20190906101125.3784-1-Jerry-Ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This RFC patch series is adding Face Detection (FD) driver on Mediatek
mt8183 SoC. It belongs to the first Mediatek's camera driver series based
on V4L2 and media controller framework. I posted the main part of the FD
driver as RFC to discuss first and would like some review comments.

==============
Introduction
==============

Face Detection (FD) unit provides hardware accelerated face detection
feature. It can detect different sizes of faces in a given image.

The driver is implemented as a normal V4L2 memory-to-memory device and
supports V4L2 controls for detection settings. It has two buffer queues.

1. Video output buffer: RAW image for face detection.

2. Meta capture buffer: Result of the detected faces.

==================
Changes in v3
==================

RFC v3 includes the following modification:
1. Adjust the private control ids and place them in
 include/uapi/linux/mtk-fd-v4l2-controls.h

2. Fixing review commnets in mtk_fd_40.c and mtk_fd.h

3. Define FD meta capture buffer in include/uapi/linux/videodev2.h

4. Remove the usage of get_reserved_memory by scp driver and 
 use dma_alloc api instead

Todo:
 - Add v4l2 control menus for private mtk fd control
 - Refine the job finish flow when system suspend

==================
Changes in v2
==================

RFC v2 includes the following modification:
1. Implement FD as a V4L2 mem2mem driver

2. Replace meta input with V4L2 controls

==================
Changes in v1
==================

RFC v1 includes the following modification:
1. Uses Request API instead of FD's buffer collection design

2. removed unnecessary abstraction structurally, including mtk_fd_ctx and
related ops

3. removed the fd_smem node from device tree

4. Fixed the common issues Tomasz commented on Mediatek ISP Pass 1's RFC v0
patch series

==================
Dependent patch
==================

FD driver depends on SCP driver. The patches are as following:

[1]. Add support for mt8183 SCP
https://patchwork.kernel.org/cover/11132177/

==================
Compliance test
==================

* Version: https://git.linuxtv.org/v4l-utils.git/commit/?id=b16f9e945d74aa5
* Note: Some of the failures are caused by the implementation of FD driver,
        which is a m2m device with VIDEO_OUT and META_CAPTURE queues,
        therefore we can't set V4L2_CAP_VIDEO_M2M in device capability, and
        fail in some non-m2m v4l2 test cases.
* Test command: v4l2-compliance -m 0
* test output:

v4l2-compliance SHA: not available, 32 bits

Compliance test for mtk-fd-4.0 device /dev/media0:

Media Driver Info:
        Driver name      : mtk-fd-4.0
        Model            : mtk-fd-4.0
        Serial           :
        Bus info         : platform:1502b000.fd
        Media version    : 4.19.67
        Hardware revision: 0x00000000 (0)
        Driver version   : 4.19.67

Required ioctls:
        test MEDIA_IOC_DEVICE_INFO: OK

Allow for multiple opens:
        test second /dev/media0 open: OK
        test MEDIA_IOC_DEVICE_INFO: OK
        test for unlimited opens: OK

Media Controller ioctls:
        test MEDIA_IOC_G_TOPOLOGY: OK
        Entities: 3 Interfaces: 1 Pads: 4 Links: 4
        test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
        test MEDIA_IOC_SETUP_LINK: OK

Total for mtk-fd-4.0 device /dev/media0: 7, Succeeded: 7, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-fd-4.0 device /dev/video0:

Driver Info:
        Driver name      : mtk-fd-4.0
        Card type        : mtk-fd-4.0
        Bus info         : platform:1502b000.fd
        Driver version   : 4.19.67
        Capabilities     : 0x84a02000
                Video Output Multiplanar
                Metadata Capture
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04a02000
                Video Output Multiplanar
                Metadata Capture
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : mtk-fd-4.0
        Model            : mtk-fd-4.0
        Serial           :
        Bus info         : platform:1502b000.fd
        Media version    : 4.19.67
        Hardware revision: 0x00000000 (0)
        Driver version   : 4.19.67
Interface Info:
        ID               : 0x0300000c
        Type             : V4L Video
Entity Info:
        ID               : 0x00000001 (1)
        Name             : mtk-fd-4.0-source
        Function         : V4L2 I/O
        Pad 0x01000002   : 0: Source
          Link 0x02000008: to remote pad 0x1000005 of entity 'mtk-fd-4.0-proc': Data, Enabled, Immutable

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
                fail: v4l2-compliance.cpp(668): dcaps & output_caps
        test VIDIOC_QUERYCAP: FAIL

Allow for multiple opens:
        test second /dev/video0 open: OK
                fail: v4l2-compliance.cpp(668): dcaps & output_caps
        test VIDIOC_QUERYCAP: FAIL
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
        Standard Controls: 1 Private Controls: 6

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
                fail: v4l2-test-formats.cpp(457): pixelformat 00000000 () for buftype 10 not reported by ENUM_FMT
        test VIDIOC_G_FMT: FAIL
                fail: v4l2-test-formats.cpp(457): pixelformat 00000000 () for buftype 10 not reported by ENUM_FMT
        test VIDIOC_TRY_FMT: FAIL
                fail: v4l2-test-formats.cpp(457): pixelformat ffffffff (-BE) for buftype 10 not reported by ENUM_FMT
        test VIDIOC_S_FMT: FAIL
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
                fail: v4l2-test-buffers.cpp(667): q2.reqbufs(node->node2, 1) != EBUSY
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
        test VIDIOC_EXPBUF: OK
        test Requests: OK

Total for mtk-fd-4.0 device /dev/video0: 45, Succeeded: 39, Failed: 6, Warnings: 0

Grand Total for mtk-fd-4.0 device /dev/media0: 52, Succeeded: 46, Failed: 6, Warnings: 0


