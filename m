Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2300CC0D7
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 18:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729542AbfJDQ1p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 12:27:45 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37124 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbfJDQ1p (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 12:27:45 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94GRhUo059478;
        Fri, 4 Oct 2019 11:27:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570206463;
        bh=z/FQT/zqiKCQuTMa4VCzOKlQBQ7jltkGNHHaNBU5bmw=;
        h=From:To:CC:Subject:Date;
        b=QiX5bhqK5SMp3X6ev4LfT1k6hiTktdARXqhsPuTzRf3FZfW7yV+z880Jua/BmHMiH
         1UYmA7e7h0kCR8khJAp49R/WgfdTBb9xKFEeO71SD7V3M80kxDriPqlGeY9aDpWcP+
         MXIgDxAs6Jp818pfp0EKrjs24rUVPNh6fDyHHXoc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94GRhKY055837
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 4 Oct 2019 11:27:43 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 11:27:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 11:27:42 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94GRgA2028904;
        Fri, 4 Oct 2019 11:27:42 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 00/21] media: vpe: maintenance
Date:   Fri, 4 Oct 2019 11:29:31 -0500
Message-ID: <20191004162952.4963-1-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This a collection of backlog patches I have been carrying for the VPE
driver.

It adds supports for SEQ_BT as well as NV21.
And fixes a number of issues both through v4l2-compliance and normal
usage.

Changes since v1:
- Added a missing from my first set fixing a Makefile issue
- Added a csc table fix to match the technical specification
- Base on Hans' comment I reworked the last two patches which
  yielded one more patch
- This also led me to create additional patches to the
  v4l2_format_info table to simplify pixel encoding lookup

======================================
v4l2-compliance SHA: 5b168dc8473911227890526bad26553d9e8ff81b, 32 bits

Compliance test for vpe device /dev/video0:

Driver Info:
	Driver name      : vpe
	Card type        : vpe
	Bus info         : platform:vpe
	Driver version   : 5.3.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
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
	Standard Controls: 1 Private Controls: 1

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		warn: v4l2-test-buffers.cpp(683): VIDIOC_CREATE_BUFS not supported
		warn: v4l2-test-buffers.cpp(683): VIDIOC_CREATE_BUFS not supported
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	Video Capture Multiplanar: Captured 58 buffers    
	test MMAP (no poll): OK
	Video Capture Multiplanar: Captured 58 buffers    
	test MMAP (select): OK
	Video Capture Multiplanar: Captured 58 buffers    
	test MMAP (epoll): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for vpe device /dev/video0: 51, Succeeded: 51, Failed: 0, Warnings: 2
======================================

Benoit Parrot (18):
  media: ti-vpe: Fix a parallel build issue
  media: ti-vpe: vpe: Fix Motion Vector vpdma stride
  media: ti-vpe: vpe: Add missing null pointer checks
  media: ti-vpe: vpe: Remove unnecessary use of container_of
  media: ti-vpe: vpe: fix a v4l2-compliance failure causing a kernel
    panic
  media: ti-vpe: vpe: fix a v4l2-compliance warning about invalid pixel
    format
  media: ti-vpe: vpe: Make sure YUYV is set as default format
  media: ti-vpe: vpe: fix a v4l2-compliance failure about invalid
    sizeimage
  media: ti-vpe: vpe: fix a v4l2-compliance failure about frame sequence
    number
  media: ti-vpe: vpe: ensure buffers are cleaned up properly in abort
    cases
  media: ti-vpe: vpdma: Use fixed type for address in descriptor
  media: ti-vpe: Set the DMA mask and coherent mask
  media: ti-vpe: vpe: use standard struct instead of duplicating fields
  media: ti-vpe: vpe: fix v4l2_compliance issue related to xfer_func
  media: ti-vpe: csc: rgb-to-yuv HD full range coeff are wrong
  media: v4l2-common: add pixel encoding support
  media: v4l2-common: add RGB565 and RGB55 to v4l2_format_info
  media: ti-vpe: vpe: don't rely on colorspace member for conversion

Nikhil Devshatwar (2):
  media: ti-vpe: Add support for SEQ_BT
  media: ti-vpe: Add support for NV21 format

Ram Prasad (1):
  media: ti-vpe: Set MAX height supported to 2048 pixels

 drivers/media/platform/Makefile            |   4 +-
 drivers/media/platform/ti-vpe/csc.c        | 220 +++++++-----
 drivers/media/platform/ti-vpe/csc.h        |   4 +-
 drivers/media/platform/ti-vpe/vpdma.c      |  11 +-
 drivers/media/platform/ti-vpe/vpdma.h      |   2 +
 drivers/media/platform/ti-vpe/vpdma_priv.h |   5 +-
 drivers/media/platform/ti-vpe/vpe.c        | 379 ++++++++++++---------
 drivers/media/v4l2-core/v4l2-common.c      | 164 +++++----
 include/media/v4l2-common.h                |  20 ++
 9 files changed, 496 insertions(+), 313 deletions(-)

-- 
2.17.1

