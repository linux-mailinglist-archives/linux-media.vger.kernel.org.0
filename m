Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66BD1DF289
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2020 00:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731212AbgEVWyU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 18:54:20 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36924 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731168AbgEVWyS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 18:54:18 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04MMsGuD075413;
        Fri, 22 May 2020 17:54:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590188056;
        bh=MoErf7Bq8CzEWRxaOKi60rfpYwItw5VtGvSflT1n+N4=;
        h=From:To:CC:Subject:Date;
        b=kFJuVaKERM0ylxUTT9FsJZc3qIBTyzhGiuMRegqdsVeCfDsXQDOJ13IUIrxJjt4ok
         EDpWDvtTc19L89iHG555+y319WWlJjGj4RL4auLA6JljGvPWxkvdL/NQMZWB9/5bTk
         tb+KjwlYs29y7zFkux9gzQWK9/0nCH263IMldBI0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04MMsGl0060995
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 22 May 2020 17:54:16 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 22
 May 2020 17:54:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 22 May 2020 17:54:16 -0500
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04MMsGe7128455;
        Fri, 22 May 2020 17:54:16 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 0/2] media: ti-vpe: Add the VIP driver
Date:   Fri, 22 May 2020 17:54:10 -0500
Message-ID: <20200522225412.29440-1-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series add support for the TI VIP video capture engine.
VIP stands for Video Input Port, it can be found on devices such as
DRA7xx and provides a parallel interface to a video source such as
a sensor or TV decoder.  Each VIP can support two inputs (slices) and
a SoC can be configured with a variable number of VIP's.
Each slice can support two ports each connected to its own
sub-device.

Here is the output of v4l2-compliance against this driver:

# v4l2-compliance -s -d 1
v4l2-compliance SHA: not available, 32 bits
Compliance test for vip device /dev/video1:

	Driver name      : vip
	Card type        : vip
	Bus info         : platform:vip1:vin2a:stream0
	Driver version   : 5.7.0
	Capabilities     : 0x85200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x05200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video1 open: OK
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
	Standard Controls: 5 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK
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
	Video Capture: Frame #002		warn: v4l2-test-buffers.cpp(446): got sequence number 4, expected 3
	Video Capture: Frame #005		warn: v4l2-test-buffers.cpp(446): got sequence number 8, expected 7
	Video Capture: Frame #008		warn: v4l2-test-buffers.cpp(446): got sequence number 12, expected 11
	Video Capture: Frame #011		warn: v4l2-test-buffers.cpp(446): got sequence number 16, expected 15
	Video Capture: Frame #014		warn: v4l2-test-buffers.cpp(446): got sequence number 20, expected 19
	Video Capture: Frame #017		warn: v4l2-test-buffers.cpp(446): got sequence number 24, expected 23
	Video Capture: Frame #020		warn: v4l2-test-buffers.cpp(446): got sequence number 28, expected 27
	Video Capture: Frame #023		warn: v4l2-test-buffers.cpp(446): got sequence number 32, expected 31
	Video Capture: Frame #026		warn: v4l2-test-buffers.cpp(446): got sequence number 36, expected 35
	Video Capture: Frame #029		warn: v4l2-test-buffers.cpp(446): got sequence number 40, expected 39
	Video Capture: Frame #032		warn: v4l2-test-buffers.cpp(446): got sequence number 44, expected 43
	Video Capture: Frame #035		warn: v4l2-test-buffers.cpp(446): got sequence number 48, expected 47
	Video Capture: Frame #038		warn: v4l2-test-buffers.cpp(446): got sequence number 52, expected 51
	Video Capture: Frame #041		warn: v4l2-test-buffers.cpp(446): got sequence number 56, expected 55
	Video Capture: Frame #044		warn: v4l2-test-buffers.cpp(446): got sequence number 60, expected 59
	Video Capture: Frame #047		warn: v4l2-test-buffers.cpp(446): got sequence number 64, expected 63
	Video Capture: Frame #050		warn: v4l2-test-buffers.cpp(446): got sequence number 68, expected 67
	Video Capture: Frame #053		warn: v4l2-test-buffers.cpp(446): got sequence number 72, expected 71
	Video Capture: Frame #056		warn: v4l2-test-buffers.cpp(446): got sequence number 76, expected 75
	test MMAP (no poll): OK                           
	Video Capture: Frame #002 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 4, expected 3
	Video Capture: Frame #005 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 8, expected 7
	Video Capture: Frame #008 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 12, expected 11
	Video Capture: Frame #011 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 16, expected 15
	Video Capture: Frame #014 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 20, expected 19
	Video Capture: Frame #017 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 24, expected 23
	Video Capture: Frame #020 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 28, expected 27
	Video Capture: Frame #023 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 32, expected 31
	Video Capture: Frame #026 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 36, expected 35
	Video Capture: Frame #029 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 40, expected 39
	Video Capture: Frame #032 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 44, expected 43
	Video Capture: Frame #035 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 48, expected 47
	Video Capture: Frame #038 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 52, expected 51
	Video Capture: Frame #041 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 56, expected 55
	Video Capture: Frame #044 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 60, expected 59
	Video Capture: Frame #047 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 64, expected 63
	Video Capture: Frame #050 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 68, expected 67
	Video Capture: Frame #053 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 72, expected 71
	Video Capture: Frame #056 (select)		warn: v4l2-test-buffers.cpp(446): got sequence number 76, expected 75
	test MMAP (select): OK                            
	Video Capture: Frame #002 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 4, expected 3
	Video Capture: Frame #005 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 8, expected 7
	Video Capture: Frame #008 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 12, expected 11
	Video Capture: Frame #011 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 16, expected 15
	Video Capture: Frame #014 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 20, expected 19
	Video Capture: Frame #017 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 24, expected 23
	Video Capture: Frame #020 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 28, expected 27
	Video Capture: Frame #023 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 32, expected 31
	Video Capture: Frame #026 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 36, expected 35
	Video Capture: Frame #029 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 40, expected 39
	Video Capture: Frame #032 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 44, expected 43
	Video Capture: Frame #035 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 48, expected 47
	Video Capture: Frame #038 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 52, expected 51
	Video Capture: Frame #041 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 56, expected 55
	Video Capture: Frame #044 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 60, expected 59
	Video Capture: Frame #047 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 64, expected 63
	Video Capture: Frame #050 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 68, expected 67
	Video Capture: Frame #053 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 72, expected 71
	Video Capture: Frame #056 (epoll)		warn: v4l2-test-buffers.cpp(446): got sequence number 76, expected 75
	test MMAP (epoll): OK                             
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for vip device /dev/video1: 51, Succeeded: 51, Failed: 0, Warnings: 57

Benoit Parrot (2):
  dt-binbings: media: ti-vpe: Document the VIP driver
  media: ti-vpe: Add the VIP driver

 .../devicetree/bindings/media/ti,vip.yaml     |  394 ++
 MAINTAINERS                                   |    1 +
 drivers/media/platform/Kconfig                |   13 +
 drivers/media/platform/ti-vpe/Makefile        |    2 +
 drivers/media/platform/ti-vpe/vip.c           | 4158 +++++++++++++++++
 drivers/media/platform/ti-vpe/vip.h           |  724 +++
 6 files changed, 5292 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
 create mode 100644 drivers/media/platform/ti-vpe/vip.c
 create mode 100644 drivers/media/platform/ti-vpe/vip.h

-- 
2.17.1

