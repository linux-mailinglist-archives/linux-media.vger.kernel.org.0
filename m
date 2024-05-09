Return-Path: <linux-media+bounces-11237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C288C14DA
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 20:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A86FBB222CB
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 18:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915597F7C6;
	Thu,  9 May 2024 18:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sxDXrfqk"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C92F7711E;
	Thu,  9 May 2024 18:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715279968; cv=none; b=CGH4haPL0JGqMuVpCvpfHPBRcpRUqQNvnLclE0VfsMZ1q8Q2ncEUhZHRwwN+7WlIzSE5vrigCYriOQATJl8PbFAwqqCciD+o6VQiAH2S5wPAWBrSB30QDfw6Kaq8vV/No4WDAW+2ESmuZ6ocXEQltIuarRaLQT/qj62ZGUYlTPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715279968; c=relaxed/simple;
	bh=YFk7gfrCyhRUbiaBKEU6P8eXBw7FlSAj1nozW8WnlUo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tuENfi07cQrQAjF3hQom9Ru8jfG1BjEM3+9eE1GyxcJ03ys34dzCGKINEHmOzX59Ynp5jHK2m/hw0kDEa8Mo0DcJIcABgJksTvTk5XQSIfajjFg1XlX2toQiWwb2Nmw/NnejzoUVg33gBdDfqW/ag6jRlCzDWtibWj+IbCjb1Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sxDXrfqk; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 449Icp2o059675;
	Thu, 9 May 2024 13:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715279931;
	bh=+EBsg+MBavvoLe4uw8H9uyV1BuH7NSV3Xnw72/49t8I=;
	h=From:To:CC:Subject:Date;
	b=sxDXrfqk2zVS185lviPF7OTRtVV01UEs9crR72p8RdzBPcT22jZrNj9t59nfysEq6
	 8MaHm48CW1GzF1Oq1gt25Z9E9yjnhnFbAhckDFzKc3Zi6nUMYCGfSlF7YhOIYqzElE
	 kvSi6wRGSPj92mlySBa3ecplabnAzPPHf7mIWmzE=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 449Icpqc028334
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 May 2024 13:38:51 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 May 2024 13:38:51 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 May 2024 13:38:50 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 449Ico8E003719;
	Thu, 9 May 2024 13:38:50 -0500
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
        <linux-rockchip@lists.infradead.org>
Subject: [PATCH v7 0/8] [PATCH v7 0/8] Add V4L2 M2M Driver for E5010 JPEG Encoder
Date: Fri, 10 May 2024 00:08:49 +0530
Message-ID: <20240509183849.4060521-1-devarsht@ti.com>
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


