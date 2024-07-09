Return-Path: <linux-media+bounces-14720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E5392ADE7
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 03:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C3A41C20FAC
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 01:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136AB39FD8;
	Tue,  9 Jul 2024 01:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="eSG2f345"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1800.securemx.jp [210.130.202.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E90D30358;
	Tue,  9 Jul 2024 01:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720489475; cv=none; b=ix/GBJnrsEVS0REYj8nzjaCFwnVLbVNAm3QGLxI52Shb1tgY4yFR4gl4e7crQskJm/Me4ppa1lOo1FTE9fqfKYKI84C/8DeCPGvc2z0tqwOS0ZN4ymLSVLibifiTHI7vkENlbVns/wNyQoqXNhfO41GJqsirSFeRcQlqsBjiFz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720489475; c=relaxed/simple;
	bh=Q83xjEUL1NZQogk0y4QQ08YEUB6zaP79T5+pa0Z7kD4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=InfdFXO3++uKVyJHA2J8uM22Li0PmVlct/7y5CB77aygCPgVhzT5a1/OhBSP2X+OFAGvR4FyM+KwHvwPhJVVyCES07MpBTbpKdwbjev2m+/eFOLx0Z0VAqCp2KA/3OJcU9pbloJVGFz4aA+mTEonl45ZDF+i7dmNZdnr8Yw5YPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=eSG2f345; arc=none smtp.client-ip=210.130.202.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1800) id 4690FGEw742851; Tue, 9 Jul 2024 09:15:16 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;i=
	yuji2.ishikawa@toshiba.co.jp;s=key2.smx;t=1720484072;x=1721693672;bh=Q83xjEUL
	1NZQogk0y4QQ08YEUB6zaP79T5+pa0Z7kD4=;b=eSG2f345loBhjWhmXLwuUF6I3Yjh9Mifl06+mg
	JBLHrfMbKxt6piXScXdncrXttgE8qEBgOCD7FKLvzmULYX3rx9jw4onnpGgPZTxxASkbezQQv4Cbl
	jQkh0LsamyLf2Dt1KUbdeOsIegkIMzUDDJK7+J3Cb6MID8q1mb23PAuxU3HK0F9inkBH6/NbTbSv8
	YTv5g5bwwh2ayJMsg4esq8bLSprG9ZLA+bpROMLuJMjO+bKsN2EqHAtLWQgD7goQ2DTLTBxAxnYdj
	AWdaLOWm86cM/qlbzuftc8F2ezKk3bXk+EHjd+yV69TL5UdhKsAiMQhy4FgFwrNnFWv+rC0zQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 4690ETtW1605432; Tue, 9 Jul 2024 09:14:30 +0900
X-Iguazu-Qid: 2yAaT64FYgJTTafAum
X-Iguazu-QSIG: v=2; s=0; t=1720484069; q=2yAaT64FYgJTTafAum; m=jQG016lu/7vjGIW8QL8mHidGAmurOhAtj8fW3xeXfy4=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1801) id 4690ERZY2534880
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 09:14:27 +0900
X-SA-MID: 26358967
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v11 0/6] Add Toshiba Visconti Video Input Interface driver
Date: Tue,  9 Jul 2024 09:08:42 +0900
X-TSB-HOP2: ON
Message-Id: <20240709000848.1108788-1-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is the Video Input Interface driver
for Toshiba's ARM SoC, Visconti.
This provides DT binding documentation,
device driver, documentation and MAINTAINER files.

A visconti VIIF driver instance exposes
1 media control device file, 3 video device files for capture
and 2 video device files for controlling image signal processor.
Detailed HW/SW are described in documentation directory.
The VIIF hardware has CSI2 receiver,
image signal processor and DMAC inside.
The subdevice for image signal processor provides
vendor specific V4L2 controls.

The device driver depends on two other drivers under development;
clock framework driver and IOMMU driver.
Corresponding features will be added later.

Best regards,
Yuji

Changelog v2:
- Resend v1 because a patch exceeds size limit.

Changelog v3:
- Add documentation to describe SW and HW
- Adapted to media control framework
- Introduced ISP subdevice, capture device
- Remove private IOCTLs and add vendor specific V4L2 controls
- Change function name avoiding camelcase and uppercase letters

Changelog v4:
- Split patches because a patch exceeds size limit
- fix dt-bindings document
- stop specifying ID numbers for driver instance explicitly at device tree
- use pm_runtime to trigger initialization of HW
  along with open/close of device files.
- add a entry for a header file at MAINTAINERS file

Changelog v5:
- Fix coding style problem in viif.c (patch 2/6)

Changelog v6:
- add register definition of BUS-IF and MPU in dt-bindings
- add CSI2RX subdevice (separeted from ISP subdevice)
- change directory layout (moved to media/platform/toshiba/visconti)
- change source file layout (removed hwd_xxxx.c)
- pointer to userland memory is removed from uAPI parameters
- change register access (from struct style to macro style)
- remove unused macros

Changelog v7:
- remove redundant "bindings" from header and description text
- fix multiline text of "description"
- change "compatible" to "visconti5-viif"
- explicitly define allowed properties for port::endpoint
- remove unused variables
- update kerneldoc comments
- update references to headers

Changelog v8:
- rename bindings description file
- remove/simplify items in bindings
- update operations around v4l2_async_notifier
- use v4l2_async_connection instead of v4l2_async_subdev
- use dev_err_probe()
- better error handling at probe
- remove redundant mutex
- add V4L2_CTRL_TYPE_VISCONTI_ISP constant

Changelog v9:
- dictionary ordering of dt-bindings properties
- applied sparce checker
- call div64_u64 for 64bit division
- rebase to media_staging tree
- fix warning for cast between ptr and dma_addr_t

Changelog v10:
- add an independent entry in MAINTAINERS
- add paddings to uAPI structs
- use parameter buffer to control ISP (instead of vendor specific controls)

Changelog v11:
- stop merging sensor's controls and capture device's
- fix strange indents at initializations
- remove feature VB2_USERPTR from viif_params and viif_stats
- fix usage in the document

Yuji Ishikawa (6):
  dt-bindings: media: platform: visconti: Add Toshiba Visconti Video
    Input Interface
  media: videodev2.h: add visconti viif meta buffer format
  media: platform: visconti: Add Toshiba Visconti Video Input Interface
    driver
  media: platform: visconti: add streaming interface for ISP parameters
    and status
  documentation: media: add documentation for Toshiba Visconti Video
    Input Interface driver
  MAINTAINERS: Add entries for Toshiba Visconti Video Input Interface

 .../admin-guide/media/v4l-drivers.rst         |    1 +
 .../admin-guide/media/visconti-viif.dot       |   18 +
 .../admin-guide/media/visconti-viif.rst       |  255 +++
 .../media/toshiba,visconti5-viif.yaml         |  105 +
 .../userspace-api/media/v4l/meta-formats.rst  |    1 +
 .../media/v4l/metafmt-visconti-viif.rst       |   48 +
 MAINTAINERS                                   |   11 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/toshiba/Kconfig        |    6 +
 drivers/media/platform/toshiba/Makefile       |    2 +
 .../media/platform/toshiba/visconti/Kconfig   |   19 +
 .../media/platform/toshiba/visconti/Makefile  |    8 +
 .../media/platform/toshiba/visconti/viif.c    |  651 ++++++
 .../media/platform/toshiba/visconti/viif.h    |  393 ++++
 .../platform/toshiba/visconti/viif_capture.c  | 1431 ++++++++++++
 .../platform/toshiba/visconti/viif_capture.h  |   21 +
 .../platform/toshiba/visconti/viif_common.c   |  239 ++
 .../platform/toshiba/visconti/viif_common.h   |   42 +
 .../platform/toshiba/visconti/viif_csi2rx.c   |  657 ++++++
 .../platform/toshiba/visconti/viif_csi2rx.h   |   24 +
 .../toshiba/visconti/viif_csi2rx_regs.h       |  102 +
 .../platform/toshiba/visconti/viif_isp.c      | 1190 ++++++++++
 .../platform/toshiba/visconti/viif_isp.h      |   24 +
 .../platform/toshiba/visconti/viif_params.c   | 2020 +++++++++++++++++
 .../platform/toshiba/visconti/viif_params.h   |   19 +
 .../platform/toshiba/visconti/viif_regs.h     |  721 ++++++
 .../platform/toshiba/visconti/viif_stats.c    |  336 +++
 .../platform/toshiba/visconti/viif_stats.h    |   14 +
 include/uapi/linux/videodev2.h                |    4 +
 include/uapi/linux/visconti_viif.h            | 1921 ++++++++++++++++
 31 files changed, 10285 insertions(+)
 create mode 100644 Documentation/admin-guide/media/visconti-viif.dot
 create mode 100644 Documentation/admin-guide/media/visconti-viif.rst
 create mode 100644 Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst
 create mode 100644 drivers/media/platform/toshiba/Kconfig
 create mode 100644 drivers/media/platform/toshiba/Makefile
 create mode 100644 drivers/media/platform/toshiba/visconti/Kconfig
 create mode 100644 drivers/media/platform/toshiba/visconti/Makefile
 create mode 100644 drivers/media/platform/toshiba/visconti/viif.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_capture.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_capture.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_common.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_common.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_csi2rx.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_csi2rx.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_csi2rx_regs.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_isp.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_isp.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_params.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_params.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_regs.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_stats.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_stats.h
 create mode 100644 include/uapi/linux/visconti_viif.h

-- 
2.25.1



