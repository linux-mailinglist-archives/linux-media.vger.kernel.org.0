Return-Path: <linux-media+bounces-44652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0800ABE1444
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 04:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13A361884BFC
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 02:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FC42192EA;
	Thu, 16 Oct 2025 02:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="eIUuuptO"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw.securemx.jp (mo-csw1802.securemx.jp [210.130.202.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AEF213E7A;
	Thu, 16 Oct 2025 02:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760581844; cv=none; b=lV/yyzAxBET0BPWl+CpABzsg6s1DthIFfa/3O11QaBp3M0X93RIJAGUSZofmyzb3psChosTk9rxudfchkJyx7wTDZMLeU79dmDyiaQnz7jSviQoPXRnMn/uSHAdbHLOB3WG/FFGzjZPPE4LI/jZ64l1jET2crbNtmgH834B5dMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760581844; c=relaxed/simple;
	bh=6487dQJ72+FpkLm2+SWiiplnbsgdxncFCSrRaLV8C8E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kl2gd/unswueFqvhubCLvt974lCtEgwdHxX6EVzWhqbTE9XScKZXtm0HRzhY5HzkDO3KGTe+0y2tWBsD0Yku52S6Fnlh0eT8gkAFuWkU5kDm5pNgreojKhI6UtFYy0ENwZ7RJUiZ2jULMYcJ7FE7TKxSz36+nVijM3iqO++Wt+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=eIUuuptO; arc=none smtp.client-ip=210.130.202.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:
	Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	To:Cc;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=1760581823;x=1761791423;bh=
	6487dQJ72+FpkLm2+SWiiplnbsgdxncFCSrRaLV8C8E=;b=eIUuuptOqi8+qMz1/VcrPzg9ydIa2V
	oUyZ+7Q7wOj2F7b/ZM7/kOAt9utrrDrLYJ/oemXu+iDzhTNEFRbdi4zxNDsZYEz9vj4jdqcLlxiz2
	q0DfJlAYpVLeojphHYtcb7gpT+Sr5PcKwtq98PI1I6+ddrTbHHB255ot/I9tENB0s8mao40h9v9W7
	WimZinZe/G2dNUWVf/XJpHN6qpDZDzT7I3mnbOmmp9JX5ocbdiRht8FEQ2W9IqvQB3Z4IaVuoyuoT
	Pvv8pJGZ5yBV9l17i1ZCBO75nWY0ddQZ+1iN+l1rDocs/16O+65WVYn0p4CZ6qD9qhh4G3FV557Sw
	bMgQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1802) id 59G2UM1u3462945; Thu, 16 Oct 2025 11:30:23 +0900
X-Iguazu-Qid: 2yAbDoX6m4uSdf7SPJ
X-Iguazu-QSIG: v=2; s=0; t=1760581822; q=2yAbDoX6m4uSdf7SPJ; m=H8LKC+R93897E+eX8Ht1unoem40n2D5KR5LIB7GHdYE=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cnBkk4H6mz1xnZ; Thu, 16 Oct 2025 11:30:22 +0900 (JST)
X-SA-MID: 53072912
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Subject: [PATCH v13 0/7] Add Toshiba Visconti Video Input Interface driver
Date: Thu, 16 Oct 2025 11:24:37 +0900
X-TSB-HOP2: ON
Message-Id: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGVX8GgC/4XOTW7DIBAF4KtYrAtiwGBsVVXvUWUxxlBPIpsUn
 P4oyt1L3Hbd3bzRzKd3ZSVkCoUNzZXl8E6F0loD6IeG+RnX18BpqgumpDKyV4bXG5/WjepAkcd
 eQtsricYhqz/nHCJ97uDLoeaY08K3OQf8U1qAXYLWCjAWKsCBf12OpASVmU74gc9bqtOIwidxP
 P+6Obxdar/tB2dLKAX3ekPzeG8HEqwErZUTWmoL/7FPd3fEErhPy0Lb0Gh01krXOaf7iDiNbQS
 009Qpr6HrPUzR2M517HC7fQP54R68OgEAAA==
X-Change-ID: 20250925-visconti-viif-f9014920a58a
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.3

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

Changelog v13:
- Link to v12: https://lore.kernel.org/all/20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp/
- working tree: https://git.linuxtv.org/media_stage.git
  - base-commit(v12): 6390834c6f9b2c5e33f52f34579efa0d0df073db
  - base-commit(v13): 3a8660878839faadb4f1a6dd72c3179c1df56787
- corresponding update of clock framework driver is discussed in:
  - https://lore.kernel.org/all/20251016013328.303611-1-yuji2.ishikawa@toshiba.co.jp/
- remove resizer subdevice
- rebase to Linux 6.18-rc1
- wrap one line at 80 characters
- change banner comment style
- update comment style; spacing at the start and end, capitalize first letter
- add support for clock and reset framework. The clock driver will be updated
  by another submission.
- add debugfs to pass debug and status information
- add callback for ioctl(VIDIOC_ENUM_FRAMESIZES)
- MAINTAINERS: update email address of Nobuhiro Iwamatsu
- csi2: change compatible string
- viif: remove CROP and COMPOSE API from ISP subdevice, add struct
  viif_l2_crop_config instead.
- viif: correct teardown sequence at error of probe() and remove()
- document: VIIF specific keyword "AG" stands for "algorithm gain" instead of
  "analog gain"
- document: update illustration and description on preprocess part

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

---
Yuji Ishikawa (7):
      dt-bindings: media: platform: visconti: Add Toshiba Visconti MIPI CSI-2 Receiver
      dt-bindings: media: platform: visconti: Add Toshiba Visconti Video Input Interface
      media: uapi: Add visconti viif meta buffer formats
      media: platform: visconti: Add Toshiba Visconti CSI-2 Receiver driver
      media: platform: visconti: Add Toshiba Visconti Video Input Interface driver
      media: platform: visconti: Add streaming interface for ISP parameters and statistics
      documentation: media: Add documentation for Toshiba Visconti Video Input Interface driver

 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 Documentation/admin-guide/media/visconti-viif.dot  |   18 +
 Documentation/admin-guide/media/visconti-viif.rst  |  540 +++++
 .../bindings/media/toshiba,visconti5-csi2.yaml     |  125 ++
 .../bindings/media/toshiba,visconti5-viif.yaml     |  110 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../media/v4l/metafmt-visconti-viif.rst            |   48 +
 MAINTAINERS                                        |   12 +
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/toshiba/Kconfig             |    6 +
 drivers/media/platform/toshiba/Makefile            |    3 +
 drivers/media/platform/toshiba/visconti/Kconfig    |   35 +
 drivers/media/platform/toshiba/visconti/Makefile   |   10 +
 .../media/platform/toshiba/visconti/csi2rx_drv.c   |  954 +++++++++
 drivers/media/platform/toshiba/visconti/viif.c     |  710 ++++++
 drivers/media/platform/toshiba/visconti/viif.h     |  391 ++++
 .../media/platform/toshiba/visconti/viif_capture.c | 1470 +++++++++++++
 .../media/platform/toshiba/visconti/viif_capture.h |   24 +
 .../media/platform/toshiba/visconti/viif_common.c  |  250 +++
 .../media/platform/toshiba/visconti/viif_common.h  |   47 +
 drivers/media/platform/toshiba/visconti/viif_isp.c |  981 +++++++++
 drivers/media/platform/toshiba/visconti/viif_isp.h |   20 +
 .../media/platform/toshiba/visconti/viif_params.c  | 2257 ++++++++++++++++++++
 .../media/platform/toshiba/visconti/viif_params.h  |   20 +
 .../media/platform/toshiba/visconti/viif_regs.h    |  726 +++++++
 .../media/platform/toshiba/visconti/viif_stats.c   |  320 +++
 .../media/platform/toshiba/visconti/viif_stats.h   |   16 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 include/uapi/linux/videodev2.h                     |    4 +
 include/uapi/linux/visconti_viif.h                 | 1911 +++++++++++++++++
 31 files changed, 11014 insertions(+)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20250925-visconti-viif-f9014920a58a
prerequisite-message-id: <20251016013328.303611-1-yuji2.ishikawa@toshiba.co.jp>
prerequisite-patch-id: 73a37b4200a5a30406de3bc8eb79af986ff9592d
prerequisite-patch-id: 78e9d304c8aeee089bc3381505724b466f01ae47

Best regards,
-- 
Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>



