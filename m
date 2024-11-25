Return-Path: <linux-media+bounces-21959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D04E9D8326
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 11:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46CA916219C
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 10:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8748A194AE6;
	Mon, 25 Nov 2024 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="HvBldsvK"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1801.securemx.jp [210.130.202.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A31F1917D8;
	Mon, 25 Nov 2024 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732529425; cv=none; b=h4avmvP7OfLZUMkjCoJUN5DI62G52Rrcrgg4z/bHArCvYWiInhH0j1tehLPvOKk5lXpuib0K0sh07wYFIM7EC85bk2vuY6S7PM7G9CLGh3EWpdQx+cmLzHzKcABMBPkXXm+yxrPr6BVAfydxy4cCLoH4FabP2tAvSB4D8H2dIyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732529425; c=relaxed/simple;
	bh=J2JxfeCOjqWHc8RRd68kvxXRP6VkGcPsYbMJuqwTRAc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iapE2leGL22wkEZVYBidYSPwV0EFM9QlMcLHDN2+wVIuhqyCOkDLV0XaE66EfW/OyEDF9TZcHB6NdPZgQUGnotOOlJwW/k3eBPIjrE1WNWwZEa4u0qJt/ckPmkbSti5sVm8t/0GbX/CWw1Hau6D2n+MTcYN/wdpWUlCg4Om0a70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=HvBldsvK; arc=none smtp.client-ip=210.130.202.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1801) id 4AP9RlWC2159795; Mon, 25 Nov 2024 18:27:47 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;i=
	yuji2.ishikawa@toshiba.co.jp;s=key2.smx;t=1732526828;x=1733736428;bh=J2JxfeCO
	jqWHc8RRd68kvxXRP6VkGcPsYbMJuqwTRAc=;b=HvBldsvKFIOFqmZQ65k/ykonui0qynNcaG8cbv
	QInAIhjvPGjJk17i7JgFlYk1q5YCqKyayN+2LO4NFgt9wiwzgWYgsJ5xQDzHP/gtPYbiFc9gE4Vs2
	DC5iBVaqdfnQ+Cmo/j8zXhpcO0dC2Pr158hb2ezKlF3fcueiq3Cnf4RJu23RtIET9TZgdaXaYGs1o
	NxRUE2TypTAfQX5m/qtMGrkgXPvSec8Mms/quUVkwuf4Qsb7PO2s/ltmESMOp8WWUq+Mqtsf/K3gt
	lDIQChkHavxyMiddDuzrdElvFbRgWuGPtFUmVIO19mibpU46aDoxC6HP8lK6EEpCQEuyBJMhA==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 4AP9R4Y0023547; Mon, 25 Nov 2024 18:27:05 +0900
X-Iguazu-Qid: 2yAaSvINfcyMh2D8CX
X-Iguazu-QSIG: v=2; s=0; t=1732526824; q=2yAaSvINfcyMh2D8CX; m=c1NCZEUx5oqiIehvz80KAJebifWoh5TbqT0krcQVLjU=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1802) id 4AP9R2b44128819
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 18:27:02 +0900
X-SA-MID: 35004168
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v12 0/8] Add Toshiba Visconti Video Input Interface driver
Date: Mon, 25 Nov 2024 18:21:38 +0900
X-TSB-HOP2: ON
Message-Id: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
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
image signal processor and video DMAC.

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
- add CSI2RX subdevice (separated from ISP subdevice)
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
- applied sparse checker
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

Changelog v12:
- Separated CSI2RX driver and made it independent driver
- Add a bindings for CSI2RX driver
- Add description of parameter/statistics interface to v4l2-ioctl.c
- use PM_RUNTIME_OPS macro for power management routines
- use v4l2_subdev_enable_streams() to start streaming
- implement callback enable_streams and disable_streams,
  instead of s_stream
- add spinlocks for variables shared among interrupt handlers
- use guard(spinlock)(locked_variable) macros
- call pm_runtime APIs at start/stop streaming,
  instead of file handle callbacks
- add new "resizer" subdevice between ISP and Capture devices.
- update capability of sub path capture: capture only RAW8 or RAW16
- document: add description of CSI2RX driver
- document: add description of resizer subdevice
- document: add block diagrams of VIIF and ISP
- document: update usage of the driver

Yuji Ishikawa (8):
  dt-bindings: media: platform: visconti: Add Toshiba Visconti MIPI
    CSI-2 Receiver
  dt-bindings: media: platform: visconti: Add Toshiba Visconti Video
    Input Interface
  media: uapi: add visconti viif meta buffer format
  media: platform: visconti: Add Toshiba Visconti CSI-2 Receiver driver
  media: platform: visconti: Add Toshiba Visconti Video Input Interface
    driver
  media: platform: visconti: Add streaming interface for ISP parameters
    and status
  documentation: media: add documentation for Toshiba Visconti Video
    Input Interface driver
  MAINTAINERS: Add entries for Toshiba Visconti Video Input Interface

 .../admin-guide/media/v4l-drivers.rst         |    1 +
 .../admin-guide/media/visconti-viif.dot       |   22 +
 .../admin-guide/media/visconti-viif.rst       |  435 ++++
 .../media/toshiba,visconti5-csi2rx.yaml       |  104 +
 .../media/toshiba,visconti5-viif.yaml         |   95 +
 .../userspace-api/media/v4l/meta-formats.rst  |    1 +
 .../media/v4l/metafmt-visconti-viif.rst       |   48 +
 MAINTAINERS                                   |   12 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/toshiba/Kconfig        |    6 +
 drivers/media/platform/toshiba/Makefile       |    2 +
 .../media/platform/toshiba/visconti/Kconfig   |   34 +
 .../media/platform/toshiba/visconti/Makefile  |   10 +
 .../platform/toshiba/visconti/csi2rx_drv.c    |  791 +++++++
 .../media/platform/toshiba/visconti/viif.c    |  598 +++++
 .../media/platform/toshiba/visconti/viif.h    |  379 +++
 .../platform/toshiba/visconti/viif_capture.c  | 1285 +++++++++++
 .../platform/toshiba/visconti/viif_capture.h  |   21 +
 .../platform/toshiba/visconti/viif_common.c   |  239 ++
 .../platform/toshiba/visconti/viif_common.h   |   45 +
 .../platform/toshiba/visconti/viif_isp.c      |  911 ++++++++
 .../platform/toshiba/visconti/viif_isp.h      |   19 +
 .../platform/toshiba/visconti/viif_params.c   | 2034 +++++++++++++++++
 .../platform/toshiba/visconti/viif_params.h   |   24 +
 .../platform/toshiba/visconti/viif_regs.h     |  717 ++++++
 .../platform/toshiba/visconti/viif_resizer.c  |  491 ++++
 .../platform/toshiba/visconti/viif_resizer.h  |   18 +
 .../platform/toshiba/visconti/viif_stats.c    |  301 +++
 .../platform/toshiba/visconti/viif_stats.h    |   14 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/uapi/linux/videodev2.h                |    4 +
 include/uapi/linux/visconti_viif.h            | 1921 ++++++++++++++++
 33 files changed, 10586 insertions(+)
 create mode 100644 Documentation/admin-guide/media/visconti-viif.dot
 create mode 100644 Documentation/admin-guide/media/visconti-viif.rst
 create mode 100644 Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
 create mode 100644 Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst
 create mode 100644 drivers/media/platform/toshiba/Kconfig
 create mode 100644 drivers/media/platform/toshiba/Makefile
 create mode 100644 drivers/media/platform/toshiba/visconti/Kconfig
 create mode 100644 drivers/media/platform/toshiba/visconti/Makefile
 create mode 100644 drivers/media/platform/toshiba/visconti/csi2rx_drv.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_capture.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_capture.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_common.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_common.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_isp.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_isp.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_params.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_params.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_regs.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_resizer.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_resizer.h
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_stats.c
 create mode 100644 drivers/media/platform/toshiba/visconti/viif_stats.h
 create mode 100644 include/uapi/linux/visconti_viif.h

-- 
2.25.1



