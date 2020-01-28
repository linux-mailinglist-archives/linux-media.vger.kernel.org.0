Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3743A14BF77
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 19:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbgA1SXc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 13:23:32 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1455 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgA1SXc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 13:23:32 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e307c140000>; Tue, 28 Jan 2020 10:23:16 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 Jan 2020 10:23:30 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 Jan 2020 10:23:30 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jan
 2020 18:23:30 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 28 Jan 2020 18:23:30 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.164.115]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e307c1d0001>; Tue, 28 Jan 2020 10:23:29 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v1 0/5] Add Tegra driver for video capture
Date:   Tue, 28 Jan 2020 10:23:16 -0800
Message-ID: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580235796; bh=Elsu1D65X4Evxza1MBTSUAm3LvDEhyy3UpMB56w6m48=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=SUdYEEX/bYAwxa541VvpGj+O05qa69B1SFGygfeCcGLpWo/SjL0ddyRcQxjLdUhDF
         KJd8SQF5q4/9cs+g5BpA1rb4u07H+LhvmogvoX7BsfAU1OrR8dF/VlGWOcJm9fJdqz
         WlzQ+goU/aU3aHimOv49UMNRYYelJiRoNQnCOYSJEeZqN9JeMfM5hwpTmVbamU6C0S
         rQegw1u+vsEkNjRgk/yo0o8UVXCeJCGBOiUhu91rwn0xdUoCCOV4qvK77TA5fxYyAU
         lZPmsAgW6PYBaGRjR20f3+UNdT8FNw1qePmkUgCCNvu3QpZiKmV25uQi6ltg9OVCEG
         aU302WAxeu5Wg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds Tegra210 VI and CSI driver for built-in test pattern
generator (TPG) capture.

Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
CSI port is one-to-one mapped to VI channel for video capture.

This series has TPG support only where it creates hard media links
between CSI subdevice and VI video device without device graphs.

v4l2-compliance results are available below the patch diff.

[v0]:	Includes,
	- Adds CSI TPG clock to Tegra210 clock driver
	- Host1x video driver with VI and CSI clients.
	- Support for Tegra210 only.
	- VI CSI TPG support with hard media links in driver.
	- Video formats supported by Tegra210 VI
	- CSI TPG supported video formats


Sowjanya Komatineni (5):
  dt-bindings: clock: tegra: Add clk id for CSI TPG clock
  clk: tegra: Add Tegra210 CSI TPG clock gate
  dt-binding: tegra: Add VI and CSI bindings
  media: tegra: Add Tegra Video input driver for Tegra210
  arm64: tegra: Add Tegra VI CSI suppport in device tree

 .../display/tegra/nvidia,tegra20-host1x.txt        |  10 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   8 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  31 +-
 drivers/clk/tegra/clk-tegra210.c                   |   7 +
 drivers/staging/media/Kconfig                      |   2 +
 drivers/staging/media/Makefile                     |   1 +
 drivers/staging/media/tegra/Kconfig                |  12 +
 drivers/staging/media/tegra/Makefile               |  11 +
 drivers/staging/media/tegra/TODO                   |  10 +
 drivers/staging/media/tegra/csi.h                  | 111 ++++
 drivers/staging/media/tegra/csi2_fops.c            | 335 +++++++++++
 drivers/staging/media/tegra/csi2_fops.h            |  15 +
 drivers/staging/media/tegra/host1x-video.c         | 120 ++++
 drivers/staging/media/tegra/host1x-video.h         |  33 ++
 drivers/staging/media/tegra/mc_common.h            | 131 +++++
 drivers/staging/media/tegra/tegra-channel.c        | 628 +++++++++++++++++++++
 drivers/staging/media/tegra/tegra-core.c           | 111 ++++
 drivers/staging/media/tegra/tegra-core.h           | 125 ++++
 drivers/staging/media/tegra/tegra-csi.c            | 380 +++++++++++++
 drivers/staging/media/tegra/tegra-vi.c             | 351 ++++++++++++
 drivers/staging/media/tegra/tegra-vi.h             | 101 ++++
 drivers/staging/media/tegra/vi2_fops.c             | 364 ++++++++++++
 drivers/staging/media/tegra/vi2_fops.h             |  15 +
 drivers/staging/media/tegra/vi2_formats.h          | 119 ++++
 drivers/staging/media/tegra/vi2_registers.h        | 194 +++++++
 include/dt-bindings/clock/tegra210-car.h           |   2 +-
 26 files changed, 3224 insertions(+), 3 deletions(-)
 create mode 100644 drivers/staging/media/tegra/Kconfig
 create mode 100644 drivers/staging/media/tegra/Makefile
 create mode 100644 drivers/staging/media/tegra/TODO
 create mode 100644 drivers/staging/media/tegra/csi.h
 create mode 100644 drivers/staging/media/tegra/csi2_fops.c
 create mode 100644 drivers/staging/media/tegra/csi2_fops.h
 create mode 100644 drivers/staging/media/tegra/host1x-video.c
 create mode 100644 drivers/staging/media/tegra/host1x-video.h
 create mode 100644 drivers/staging/media/tegra/mc_common.h
 create mode 100644 drivers/staging/media/tegra/tegra-channel.c
 create mode 100644 drivers/staging/media/tegra/tegra-core.c
 create mode 100644 drivers/staging/media/tegra/tegra-core.h
 create mode 100644 drivers/staging/media/tegra/tegra-csi.c
 create mode 100644 drivers/staging/media/tegra/tegra-vi.c
 create mode 100644 drivers/staging/media/tegra/tegra-vi.h
 create mode 100644 drivers/staging/media/tegra/vi2_fops.c
 create mode 100644 drivers/staging/media/tegra/vi2_fops.h
 create mode 100644 drivers/staging/media/tegra/vi2_formats.h
 create mode 100644 drivers/staging/media/tegra/vi2_registers.h


v4l2-compliance SHA: e7402fb758fd106955c3b7d5a5e961d1cb606f4a, 32 bits, 32-bit time_t

Compliance test for tegra-video device /dev/video0:

Driver Info:
        Driver name      : tegra-video
        Card type        : 54080000.vi-output-0
        Bus info         : platform:54080000.vi:0
        Driver version   : 5.5.0
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
Media Driver Info:
        Driver name      : host1x_video
        Model            : NVIDIA Tegra Video Input Device
        Serial           :
        Bus info         :
        Media version    : 5.5.0
        Hardware revision: 0x00000003 (3)
        Driver version   : 5.5.0
Interface Info:
        ID               : 0x03000003
        Type             : V4L Video
Entity Info:
        ID               : 0x00000001 (1)
        Name             : 54080000.vi-output-0
        Function         : V4L2 I/O
        Pad 0x01000002   : 0: Sink
          Link 0x0200001b: from remote pad 0x100001a of entity 'tpg-0': Data, Enabled

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

        test invalid ioctls: OK
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
        Standard Controls: 2 Private Controls: 0

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

Total for tegra-video device /dev/video0: 53, Succeeded: 53, Failed: 0, Warnings: 0

-- 
2.7.4

