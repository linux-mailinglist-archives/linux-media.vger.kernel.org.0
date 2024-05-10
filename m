Return-Path: <linux-media+bounces-11289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D37608C1FA9
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B5121F22560
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 08:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D553615FCE2;
	Fri, 10 May 2024 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="foGbgR0L"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B9D15FA79;
	Fri, 10 May 2024 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715329595; cv=none; b=JcmFBMdvrRRFn8epeUYzA+b4/45YQlTtG6hocvUSNr8Y6bENSGjEfjY4nm8uJ7O8WiLKn3h6mWYlJlDYdsOQWgFNcxG1w91UFUwxG/V5afRUo1Rif7H6Da/z4Ku7E79mfYeubPMAhPDQa1JKSh5TOTcYnrt7oxIh00bTb8qRaQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715329595; c=relaxed/simple;
	bh=lmS7VnlfUd05Nz7aon027BKPxnUS2qorpXtvxlpUmI8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KE/O/9k1sVfIEJ/vtH0Mlxqiu77jTcvqUWa1DLBz6/4L7pEsKmyEF8v7+ArZsMCarvCmClsjZTa/VHbQ1KWlzmWD09n1ZabaGJzHwgNPGp051bOSfFqb+yHZnfg5DqU3T3/ErEwuIzKyo2ncHa/HXOSgRdVblE7/jQp7HfiM424=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=foGbgR0L; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44A8Q5uk046308;
	Fri, 10 May 2024 03:26:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715329565;
	bh=YdcFZc8R+BnYa7VpNx181spvw1M0wU17yKzxqlsBZ3o=;
	h=From:To:CC:Subject:Date;
	b=foGbgR0LjfWNsD0tojjtFSbMofx/jQj0C4DE9XZCaeohL0DfumndDHqO3H6EwacqX
	 XRZHKRKqeSXbcJPslJ+T4fxJt8nEuEI0CGCG4BVXp55Y9qs9wtMzibT26RU61WOcgT
	 TiJsX9h6PbtEPLx2SFHWbWce4eExAmOj7/wSmFB4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44A8Q4Rx012222
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 May 2024 03:26:05 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 May 2024 03:26:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 May 2024 03:26:04 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44A8Q3Os084438;
	Fri, 10 May 2024 03:26:04 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>, <akpm@linux-foundation.org>,
        <gregkh@linuxfoundation.org>, <andriy.shevchenko@linux.intel.com>,
        <adobriyan@gmail.com>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <jani.nikula@intel.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-rockchip@lists.infradead.org>
Subject: [PATCH RESEND v7 0/8] Add V4L2 M2M Driver for E5010 JPEG Encoder
Date: Fri, 10 May 2024 13:56:03 +0530
Message-ID: <20240510082603.1263256-1-devarsht@ti.com>
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

Resending this V7 series to have proper linking of patches in the series
with cover-letter while doing git send-email.

Original cover letter: 
This adds support for V4L2 M2M based driver for E5010 JPEG Encoder
which is a stateful JPEG encoder from Imagination technologies
and is present in TI AM62A SoC.

While adding support for it, following additional framework changes were
made:
 - Moved reference quantization and huffman tables provided in
   ITU-T-REC-T.81 to v4l2-jpeg.c as suggested in mailing list [1].
 - Add macros to round to closest integer (either higher or lower) while
   rounding in order of 2.

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

[1]: 
https://lore.kernel.org/all/de46aefe-36da-4e1a-b4fa-b375b2749181@xs4all.nl/

Changelog:
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

V3->V4 Range diff :
https://gist.github.com/devarsht/22a744d999080de6e813bcfb5a596272

V4->V5 Range diff :
https://gist.github.com/devarsht/298790af819f299a0a05fec89371097b

V5->V6 Range diff :
https://gist.github.com/devarsht/c89180ac2b0d2814614f2b59d0705c19

V6->V7 Range diff :
https://gist.github.com/devarsht/1db185b1e187eaf397e9e4c37066777e

Previous patch series:
V2: https://lore.kernel.org/all/20230727112546.2201995-1-devarsht@ti.com/
V3: https://lore.kernel.org/all/20230816152210.4080779-1-devarsht@ti.com/
V4: https://lore.kernel.org/all/20240205114239.924697-1-devarsht@ti.com/
V5: https://lore.kernel.org/all/20240215134641.3381478-1-devarsht@ti.com/
V6: https://lore.kernel.org/all/20240228141140.3530612-1-devarsht@ti.com/

Devarsh Thakkar (8):
  media: dt-bindings: Add Imagination E5010 JPEG Encoder
  media: imagination: Add E5010 JPEG Encoder driver
  media: v4l2-jpeg: Export reference quantization and huffman tables
  media: imagination: Use exported tables from v4l2-jpeg core
  media: verisilcon : Use exported tables from v4l2-jpeg for hantro
    codec
  math.h Add macros to round to closest specified power of 2
  media: imagination: Round to closest multiple for cropping region
  gpu: ipu-v3: Use generic macro for rounding to nearest multiple

 .../bindings/media/img,e5010-jpeg-enc.yaml    |   75 +
 MAINTAINERS                                   |    7 +
 drivers/gpu/ipu-v3/ipu-image-convert.c        |    4 +-
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/imagination/Kconfig    |   12 +
 drivers/media/platform/imagination/Makefile   |    3 +
 .../platform/imagination/e5010-core-regs.h    |  585 ++++++
 .../platform/imagination/e5010-jpeg-enc-hw.c  |  267 +++
 .../platform/imagination/e5010-jpeg-enc-hw.h  |   42 +
 .../platform/imagination/e5010-jpeg-enc.c     | 1646 +++++++++++++++++
 .../platform/imagination/e5010-jpeg-enc.h     |  168 ++
 .../platform/imagination/e5010-mmu-regs.h     |  311 ++++
 .../media/platform/verisilicon/hantro_jpeg.c  |  128 +-
 drivers/media/v4l2-core/v4l2-jpeg.c           |  162 +-
 include/linux/math.h                          |   36 +
 include/media/v4l2-jpeg.h                     |   11 +
 17 files changed, 3341 insertions(+), 118 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
 create mode 100644 drivers/media/platform/imagination/Kconfig
 create mode 100644 drivers/media/platform/imagination/Makefile
 create mode 100644 drivers/media/platform/imagination/e5010-core-regs.h
 create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.c
 create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.h
 create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.c
 create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.h
 create mode 100644 drivers/media/platform/imagination/e5010-mmu-regs.h

-- 
2.39.1


