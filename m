Return-Path: <linux-media+bounces-12509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 017448FB030
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 12:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 248251C22BBE
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 10:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4FB148832;
	Tue,  4 Jun 2024 10:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="paIYfbTt"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CA7148823;
	Tue,  4 Jun 2024 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717497638; cv=none; b=SD3MNnxqxZ1w+Y2qPCXyoWh7gvZ5+cJWp8ZbAp6PZAaZj7HkhjDmt/ixazi3oQ9uwQv7/Z8BBwHvJqLemFXfXsEUqjnrvFPF6x36vHlHMStp0VnWHy5s/hVXgeFzVz4pZK0L/tc4BbCOjlkPfWx9Y2FF0NYXi1qBdwVmptbsack=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717497638; c=relaxed/simple;
	bh=d1KQv8FT/ETWh3qGsfeda23SktFcE0gTbujVyZkB088=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eWx9qD4K1lGG/Xfg9cGG9lSq7nP4ZfnkYXGneTY2PqvANx6FFEOxCBI1XwbIi8VsvdGlI6FwVHMhupEDEWKktiw8RQY+BPGLVdokTIPZ76cmOwDUgcQqGifYkLCLZyVUd8X3eAwVyNeFC1yJIYpCt81FDfilewKIS9Acb9qt/iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=paIYfbTt; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454Ae4lY083800;
	Tue, 4 Jun 2024 05:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717497604;
	bh=hddo9HAPifqq5cXPPE/SjcpNlikR3rcZT61M3YzRnTI=;
	h=From:To:CC:Subject:Date;
	b=paIYfbTtZTKLGhkqBIiQRd7XpIrwSwW3UI45nQKx8bGbNJg5H2P/wPFwNwuMoORTR
	 2dK0Hjmz3ZhEA70QW+B24fkWiThgdmIKhAPPbiqRSY4t0EazdkoJs55O45GBArk4FJ
	 1xyeOfQhhv0cGdLADZk3EhSFZrRay872s90wDH0c=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454Ae3IK025616
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 05:40:03 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 05:40:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 05:40:03 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454Ae2XA056550;
	Tue, 4 Jun 2024 05:40:02 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
        <p.zabel@pengutronix.de>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>, <akpm@linux-foundation.org>,
        <gregkh@linuxfoundation.org>, <andriy.shevchenko@linux.intel.com>,
        <adobriyan@gmail.com>, <andi.shyti@linux.intel.com>,
        <airlied@gmail.com>, <daniel@ffwll.ch>, <jani.nikula@intel.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-rockchip@lists.infradead.org>, <davidgow@google.com>,
        <dlatypov@google.com>
Subject: [PATCH v12 00/13] Add V4L2 M2M Driver for E5010 JPEG Encoder
Date: Tue, 4 Jun 2024 16:10:01 +0530
Message-ID: <20240604104001.2235082-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

This adds support for V4L2 M2M based driver for E5010 JPEG Encoder
which is a stateful JPEG encoder from Imagination technologies
and is present in TI AM62A SoC.

While adding support for it, following additional framework changes were
made:
 - Moved reference quantization and huffman tables provided in
   ITU-T-REC-T.81 to v4l2-jpeg.c as suggested in mailing list [1].
 - Add macros to round to closest integer (either higher or lower) while
   rounding in order of 2.
 - Add KUnit tests for math functions.

v4l2-compliance test :
Link: https://gist.github.com/devarsht/1f039c631ca953a57f405cfce1b69e49

E5010 JPEG Encoder Manual tests :

Performance:
Link: https://gist.github.com/devarsht/c40672944fd71c9a53ab55adbfd9e28b

Functionality:
Link: https://gist.github.com/devarsht/8e88fcaabff016bb2bac83d89c9d23ce

Compression Quality:
Link: https://gist.github.com/devarsht/cbcc7cd97e8c48ba1486caa2b7884655

Multi Instance:
Link: https://gist.github.com/devarsht/22c2fca08cd3441fb40f2c7a4cebc95a

Crop support:
Link: https://gist.github.com/devarsht/de6f5142f678bb1a5338abfd9f814abd

Runtime PM:
Link: https://gist.github.com/devarsht/70cd95d4440ddc678489d93885ddd4dd

Math lib KUnit tests:
Link: https://gist.github.com/devarsht/3f9042825be3da4e133b8f4eda067876

[1]: 
https://lore.kernel.org/all/de46aefe-36da-4e1a-b4fa-b375b2749181@xs4all.nl/

Changelog:
V12:
 - Fix documentation and enable kernel-doc rendering for math.h and jpeg helpers
 - Add Reviewed-by and Acked-by tags
  
V10->V11:
 - Fix commenting for math.h, include headers per IWYU principle in
   math_kunit, update title for math.h kernel-doc

V9->V10:
 - Update commenting style in math.h and add notes for new jpeg header
   macros
 - Add KUnit dependency for math_kunit

V8->V9:
 - Remove kernel.h header file
 - Remove stale filler data on jpeg header in E5010 jpeg driver

V7->V8:
 - Add KUnit tests for math functions
 - Add roundclosest() for supporting rounding for non-multiple of 2
 - Update commit message as suggested
 - Add Reviewed-by and Acked-by tags to patches as received

V6->V7:
 - Fix cropping support
 - Move reference huffman and quantization tables to v4l2-jpeg.c
 - Fix suspend/resume use-case
 - Add Reviewed-by

V5->V6:
 - Fix sparse warnings

V4->V5:
 - Sort the #includes in driver file alphabetically
 - Rename huffman and quantization tables to not use '_'
 - Add Reviewed-by tag

V3->V4:
- Use ti-specific compatible ti,am62a-jpeg-enc as secondary one in
  dt-binding
- Remove clock-names as only single clock in dt-binding
- Fix issue with default params setting
- Correct v4l2 error prints
- Simplify register write functions with single statement return values
- Remove unrequired error checks from get_queue()
- Drop explicit device_caps setting as it is already taken care by v4l2
  core
- Remove unrequired multiplanar checks and memset from s_fmt, g_fmt
  callback functions
- Fix try_fmt callback to not update the queues
- Remove unrequired contiguous format attribute from queue_init
- Use dynamic allocation for video_device and remove unrequired
  assignments in probe()
- Remove unrequired checks from queue_setup function
- Return queued buffers back if start_streaming fails
- Use ARRAY_SIZE in place of hard-coding
- Use huffman and quantization tables from reference header file

V2->V3:
- Add DONOTMERGE patches for dts and defconfig
- Update driver with below changes :
  - Correct license headers
  - Use more generic name core instead of jasper for base registers
  - Add Comment for forward declarations
  - Simplify quantization table calculations
  - Use v4l2_apply_frmsize_constraints for updating framesize and remove
    unrequired functions
  - Place TODO at top of file and in commit message too
  - Use dev_err_probe helper in probe function
  - Fix return value checking for failure scenarios in probe function
  - Use v4l2_err/info/warn helpers instead of dev_err/info/warn helpers
  - Fix unexpected indentation
  - Correct commit message
- Update dt-bindings with below changes :
  - Add vendor specific compatible 
  - Fix commit title and message
  - Update reg names
  - Update clocks to 1
  - Fix dts example with proper naming

V1->V2:
 - Send dt-bindings and driver together

Patch-Diff between the series :
V11->V12 Range diff :
https://gist.github.com/devarsht/18455f1744b6b6b8f33dd505a4ca2651

V10->V11 Range diff :
https://gist.github.com/devarsht/cd76372bff7c125f75d06ba009264b75

V9->V10 Range diff :
https://gist.github.com/devarsht/b446acee460b8c65fb577d06b7bbc1da

V8->V9 Range diff :
https://gist.github.com/devarsht/3fd6c4e8031ab114248f93d01c8dfc74

V6->V7 Range diff :
https://gist.github.com/devarsht/1db185b1e187eaf397e9e4c37066777e

V5->V6 Range diff :
https://gist.github.com/devarsht/c89180ac2b0d2814614f2b59d0705c19

V4->V5 Range diff :
https://gist.github.com/devarsht/298790af819f299a0a05fec89371097b

V3->V4 Range diff :
https://gist.github.com/devarsht/22a744d999080de6e813bcfb5a596272

Previous patch series:
V11: https://lore.kernel.org/all/20240531170229.1270828-1-devarsht@ti.com/
V10: https://lore.kernel.org/all/20240530165925.2715837-1-devarsht@ti.com/
V9: https://lore.kernel.org/all/20240526175655.1093707-1-devarsht@ti.com/
V8: https://lore.kernel.org/all/20240517171532.748684-1-devarsht@ti.com/
V7: https://lore.kernel.org/all/20240510082603.1263256-1-devarsht@ti.com/
V6: https://lore.kernel.org/all/20240228141140.3530612-1-devarsht@ti.com/
V5: https://lore.kernel.org/all/20240215134641.3381478-1-devarsht@ti.com/
V4: https://lore.kernel.org/all/20240205114239.924697-1-devarsht@ti.com/
V3: https://lore.kernel.org/all/20230816152210.4080779-1-devarsht@ti.com/
V2: https://lore.kernel.org/all/20230727112546.2201995-1-devarsht@ti.com/


Daniel Latypov (1):
  lib: add basic KUnit test for lib/math

Devarsh Thakkar (12):
  media: dt-bindings: Add Imagination E5010 JPEG Encoder
  media: imagination: Add E5010 JPEG Encoder driver
  media: v4l2-jpeg: Export reference quantization and huffman tables
  media: Documentation: Document v4l2-jpeg helper macros
  media: imagination: Use exported tables from v4l2-jpeg core
  media: verisilicon : Use exported tables from v4l2-jpeg for hantro
    codec
  math.h: Add macros for rounding to closest value
  math.h: Use kernel-doc syntax for divison functions
  Documentation: core-api: Add math.h macros and functions
  lib: math_kunit: Add tests for new macros related to rounding to
    nearest value
  media: imagination: Round to closest multiple for cropping region
  gpu: ipu-v3: Use generic macro for rounding closest to specified value

 Documentation/core-api/kernel-api.rst         |    6 +
 .../bindings/media/img,e5010-jpeg-enc.yaml    |   75 +
 Documentation/driver-api/media/v4l2-core.rst  |    1 +
 Documentation/driver-api/media/v4l2-jpeg.rst  |   10 +
 MAINTAINERS                                   |    7 +
 drivers/gpu/ipu-v3/ipu-image-convert.c        |    4 +-
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/imagination/Kconfig    |   12 +
 drivers/media/platform/imagination/Makefile   |    3 +
 .../platform/imagination/e5010-core-regs.h    |  585 ++++++
 .../platform/imagination/e5010-jpeg-enc-hw.c  |  267 +++
 .../platform/imagination/e5010-jpeg-enc-hw.h  |   42 +
 .../platform/imagination/e5010-jpeg-enc.c     | 1644 +++++++++++++++++
 .../platform/imagination/e5010-jpeg-enc.h     |  168 ++
 .../platform/imagination/e5010-mmu-regs.h     |  311 ++++
 .../media/platform/verisilicon/hantro_jpeg.c  |  128 +-
 drivers/media/v4l2-core/v4l2-jpeg.c           |  162 +-
 include/linux/math.h                          |   86 +-
 include/media/v4l2-jpeg.h                     |   28 +
 lib/math/Kconfig                              |   14 +
 lib/math/Makefile                             |    1 +
 lib/math/math_kunit.c                         |  329 ++++
 23 files changed, 3761 insertions(+), 124 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
 create mode 100644 Documentation/driver-api/media/v4l2-jpeg.rst
 create mode 100644 drivers/media/platform/imagination/Kconfig
 create mode 100644 drivers/media/platform/imagination/Makefile
 create mode 100644 drivers/media/platform/imagination/e5010-core-regs.h
 create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.c
 create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.h
 create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.c
 create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.h
 create mode 100644 drivers/media/platform/imagination/e5010-mmu-regs.h
 create mode 100644 lib/math/math_kunit.c

-- 
2.39.1


