Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADE05B9650
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 19:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405704AbfITRD4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 13:03:56 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:44068 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403929AbfITRDz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 13:03:55 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KH3rB3034497;
        Fri, 20 Sep 2019 12:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568999033;
        bh=TKIYvFFc8jP8BIIrXBcATu4ILnSrfAHWB7sD1Jm8JTY=;
        h=From:To:CC:Subject:Date;
        b=zO2P626nk/Lmr3z0CrIVgG+OtZVqOFjWrfLMak29NZEju7bmkRWyvvY+9QhoueiT/
         VOx7CkzfdbmrOip2KDmpqKx8b3hewonpiP/IXcZEwViGzLvHvt/Ry3dClFf8YR4hiq
         vCtg3enO/UMDYSm0pKS2NEE9v/aPuYyFRiKRsHnc=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KH3rGn094876
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 12:03:53 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 12:03:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 12:03:48 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KH3r6s054719;
        Fri, 20 Sep 2019 12:03:53 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 00/13]  media: am437x-vpfe: overdue maintenance
Date:   Fri, 20 Sep 2019 12:05:41 -0500
Message-ID: <20190920170554.29666-1-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series is a collection of patches we have been carrying for a
while.

A few patches do fix actual bug and v4l2-compliance errors/warnings.
Other are drivers re-work to simplify/clarify the code for easier
maintenance.

We also include the SPDX Licensing update which seemed to have been
missed by the global script thus far.

Changes since v2:
- Rename VPFE_MAX_ACTIVE_FMT to VPFE_NUM_FORMATS and corrected the
  comments
- Move the "Remove print_fourcc helper" patch to the end of the series
  and rebase it on the pending v4l2_fourcc_conv macros patches

Changes since v1:
- Address review comment from Joe, Hans and Prabhakar
- Cleaned-up the function entry debug log
- Split off the pcr change into its own patch
- Rework/combine two patches but remove code churn
- fix miscellaneous typos

=============================

v4l2-compliance SHA: 5b168dc8473911227890526bad26553d9e8ff81b, 32 bits

Compliance test for vpfe device /dev/video0:

Driver Info:
	Driver name      : vpfe
	Card type        : TI AM437x VPFE
	Bus info         : platform:vpfe 48326000.vpfe
	Driver version   : 5.3.0
	Capabilities     : 0x85200001
		Vide o Capture
		Read/Write
		Streaming
		Extended Pix Format
		D evice Capabilities
	Device Caps      : 0x05200001
		Video Capt ure
		Read/Write
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
	test VIDIOC_LOG_STATUS: OK

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
	test VIDIOC_ENUM/G/S/QUERY_STD: OK
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
	Standard Controls: 3 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
		fail: v4l2-test-formats.cpp(1419): node->frmsizes_count[pixfmt] > 1
	test Cropping: FAIL
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
	test read/write: OK
	test blocking wait: OK
	test MMAP (no poll): OK                           
	test MMAP (select): OK                            
	test MMAP (epoll): OK                             
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for vpfe device /dev/video0: 51, Succeeded: 50, Failed: 1, Warnings: 0
============================

Benoit Parrot (12):
  media: am437x-vpfe: Fix missing first line
  media: am437x-vpfe: Rework ISR routine for clarity
  media: am437x-vpfe: Wait for end of frame before tear-down
  media: am437x-vpfe: fix start streaming error path
  media: am437x-vpfe: Streamlined vb2 buffer cleanup
  media: am437x-vpfe: Setting STD to current value is not an error
  media: am437x-vpfe: Use a per instance format array instead of a
    static one
  media: am437x-vpfe: fix function trace debug log
  media: am437x-vpfe: TRY_FMT ioctl is not really trying anything
  media: am437x-vpfe: Remove per bus width static data
  media: am437x-vpfe: Switch to SPDX Licensing
  media: am437x-vpfe: Remove print_fourcc helper

Dave Gerlach (1):
  media: am437x-vpfe: Fix suspend path to always handle pinctrl config

 drivers/media/platform/am437x/am437x-vpfe.c   | 880 ++++++++----------
 drivers/media/platform/am437x/am437x-vpfe.h   |  43 +-
 .../media/platform/am437x/am437x-vpfe_regs.h  |  10 +-
 3 files changed, 406 insertions(+), 527 deletions(-)

-- 
2.17.1

