Return-Path: <linux-media+bounces-62544-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK3VOvKGD2qONAYAu9opvQ
	(envelope-from <linux-media+bounces-62544-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 00:28:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6480E5AC58A
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 00:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28FB4302AF0B
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 22:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA783D3B3;
	Thu, 21 May 2026 22:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIoGdz1s"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3881530567F
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 22:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779402479; cv=none; b=WjuUkKAo7NG2s3pLdGlv90QCpodCIPaPMwwIZhTJJ8cD4tl1DxTRFgkHV4Vh61RVsu5gmIBB6/SyRvbRrB5PixEfqHDYTBlsPgZUGxRq/dyUGzf8vU9S2NidWs+g6dW0HmLCw/DxJCRy5SCN4TR7nS+ts7O+myms8rS0uDo+Jzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779402479; c=relaxed/simple;
	bh=3QtlB6BtDRwqJSSEVjD+rY/Vxw5LBu36ogRAKQ+2ZcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cY+fZ+R3VNWIJ+gVGF5Pu64ViIX9ctyml2aDzT7FwLMQsJzGHz1/mcGg2tC6d39ckg7TzjT5qwgB67L4E6J6iglmAHyUvGz5cvP+ZcT7fWuCdK68s2KOuLyxplFj1C0fZbv06Rf/RanmmYMuPNWRFCvswkPT8UckGUM+r1BrRUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIoGdz1s; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779402478; x=1810938478;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3QtlB6BtDRwqJSSEVjD+rY/Vxw5LBu36ogRAKQ+2ZcA=;
  b=BIoGdz1sdTrAJXiO7iWpgO8Rw/SwwxFaZOy2QDxVoOAzfEFbLu2P1pGu
   TcZuNECfSMMtOU0dLh61l1ju4CA3FhleLFzMHESUfz+Q9qiypXPiWlZBU
   AlBiy/oJrQs9QJF3/HPeCtbQgcZJqhVd1ynxVjtobB6O6BFWpRWZZ54mO
   OeWzyklSLo4mVhlpSdchaCjXlOZRk5EHxaveAOYhwshSX1h+oyzXdOxjc
   rIgZxBp8BGo2+v6pmoGprggYAfq2xOzwbd0Vqxa6P5LkceCW/+wHlvtx0
   QVT46B4zjD0Df923G+nXV7w2V4rj/XqO/daPd0Ixklq/Ln4Y52ENlTfWE
   g==;
X-CSE-ConnectionGUID: 9QAEDlmkQYGGEkS8Dq/teA==
X-CSE-MsgGUID: aox6V64/QRmhoiEOlEzbrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="67857592"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="67857592"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 15:27:57 -0700
X-CSE-ConnectionGUID: iIjGvzmST7+3bLsx1adY9Q==
X-CSE-MsgGUID: MIlMx27rRl+DJlztULLgAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="271031202"
Received: from ubuntu.jf.intel.com ([10.54.60.90])
  by orviesa002.jf.intel.com with ESMTP; 21 May 2026 15:27:58 -0700
From: Miguel Vadillo <miguel.vadillo@intel.com>
To: linux-media@vger.kernel.org
Cc: wei.a.xu@intel.com,
	atul.raut@intel.com,
	sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	kieran.bingham@ideasonboard.com,
	miguel.vadillo@intel.com
Subject: [PATCH v3 0/3] media: i2c: cvs: Add Intel CVS driver
Date: Thu, 21 May 2026 15:23:56 -0700
Message-ID: <20260521222359.16716-1-miguel.vadillo@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62544-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 6480E5AC58A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Cover Letter
------------

This patch series introduces support for Intel Computer Vision Sensing
(CVS) devices found on Intel Luna Lake (LNL), Panther Lake (PTL), and
Arrow Lake (ARL) platforms.

OVERVIEW
--------

The CVS device acts as a V4L2 sub-device bridge that manages CSI-2
link ownership between the host (Linux) and firmware for camera
sensors. It provides:

1. CSI-2 link ownership arbitration between host and CVS firmware
2. MIPI CSI-2 configuration management
3. Privacy LED control coordination
4. Power management integration with runtime PM

The driver consists of two main components:
- core.c: Core driver with probe, command transport, and PM callbacks
- v4l2.c: V4L2 sub-device and media framework integration

HARDWARE DETAILS
----------------

CVS devices interface via:
- I2C for command/control communication with the device firmware
- GPIO signals for ownership handshaking (request/response)
- Optional reset and wake interrupt for full-capability variants
- Integration with Intel IPU (Image Processing Unit) via ipu_bridge

The driver supports two hardware capability levels:
- Light capability: Basic GPIO-based ownership (2 GPIOs)
- Full capability: Enhanced with reset control and wake IRQ (4 GPIOs)

In order to support both configurations and all devices on the field,
the driver detects the number of GPIOs and uses add_driver_gpios
respectively.

DEVICE QUIRKS
-------------

The driver includes a quirk table to handle device-specific variations
across different CVS implementations (e.g., Lattice, Synaptics vendors)
that may differ in:
- MIPI configuration requirements
- Buffer and header sizes
- Reset sequence requirements

FIRMWARE PROTOCOL
-----------------

The CVS firmware supports a command-response protocol over I2C with:
- Device state queries (GET_DEV_STATE, GET_DEV_CAPABILITY)
- Host identification (SET_DEV_HOST_ID)
- MIPI configuration (HOST_SET_MIPI_CONFIG, HOST_GET_MIPI_CONFIG)
- CSI ownership control (HOST_SENSOR_OWNER)

The protocol supports versioning (currently 2.2+) and optional
response prefixes for backward compatibility.

V4L2 INTEGRATION
----------------

The CVS driver registers as a V4L2 sub-device exposing:
- Sink pad: Receives frames from remote camera sensor
- Source pad: Emits frames to downstream IPU/consumers
- Async notifier: Discovers and connects to upstream sensors via ACPI

It implements standard V4L2 operations:
- enable/disable_stream: Start/stop streaming with ownership handoff
- set_fmt/get_fmt: Format negotiation with format mirroring
- get_mbus_config: CSI-2 bus configuration queries

PLATFORM SUPPORT
----------------

In addition to I2C-based operation, the driver supports platform device
instantiation for systems where CVS is exposed without I2C transport,
falling back to GPIO-only ownership control.

BIOS is presenting the device wrongly in some cases. These devices are
already on the field thus need to support as is.

POWER MANAGEMENT
----------------

Runtime PM integration allows the device to:
- Auto-suspend after 1 second of inactivity
- Resume on streaming start
- Coordinate with IPU power states

A PM runtime device link (DL_FLAG_PM_RUNTIME) is registered between
IPU (consumer) and CVS (supplier) so that the PM framework
automatically resumes CVS before IPU begins capture. CSI-2 link
ownership is claimed in cvs_runtime_resume() and released in
cvs_runtime_suspend(), decoupling ownership management from the V4L2
streaming path.

DEPENDENCIES
------------

- Intel IPU bridge (ipu-bridge.ko) for ACPI sensor discovery

SYSTEM DIAGRAM
--------------

Below diagram shows connections of CVS/ISH/IPU and Camera Sensor:

 -----------------------------------------------------------------------
| Host Processor                                                        |
|                                                                       |
|   ---------------   ---------------   ---------------                 |
|   |             |   |             |   |             |                 |
|   |     IPU     |   |     ISH     |   |camera driver|----|            |
|   |             |   |             |   |             |    |            |
|   ---------------   ---------------   ---------------    |            |
|         |                 |                 |            |            |
|         |                 |                 |            |            |
|         |                 |           ---------------    |            |
|         |                 |           |             |    |            |
|         |                 |           |  CVS driver |    |            |
|         |                 |           |             |    |            |
|         |                 |           ---------------    |            |
|         |                 |                 |            |            |
 ---------|-----------------|-----------------|------------|------------
          | CSI             | I2C             | I2C        |
          |                 |                 |            |
 ---------|-----------------|-----------------|----------  |
| CVS     |                                   |         |  |
|         |                                   |         |  | I2C
|   -----------------------------             |         |  |
|   |                           |-------------|         |  |
|   |          CVS FW           |                       |  |
|   |                           |                       |  |
|   -----------------------------                       |  |
|         | CSI                                         |  |
 ---------|---------------------------------------------   |
          | CSI                                            |
          |                                                |
      --------------------------------                     |
      |                              | I2C                 |
      |         Camera Sensor        |---------------------|
      |                              |
      --------------------------------

USAGE EXAMPLE
-------------

  # Load driver
  modprobe intel_cvs

  # Configure media pipeline (example with IPU7 + ov08x40)
  media-ctl -v -V \
    "\"Intel CVS\":1 [fmt:SGRBG10/3856x2176]"
  media-ctl -v -V \
    "\"Intel IPU7 CSI2 0\":0 [fmt:SGRBG10/3856x2176]"
  media-ctl -v -V \
    "\"Intel IPU7 CSI2 0\":1 [fmt:SGRBG10/3856x2176]"
  media-ctl -v -l \
    "\"Intel CVS\":1 -> \"Intel IPU7 CSI2 0\":0[1]"
  media-ctl -v -l \
    "\"Intel IPU7 CSI2 0\":1 -> \"Intel IPU7 ISYS Capture 0\":0[1]"
  media-ctl -v -V \
    "\"ov08x40 8-0010\":0 [fmt:SGRBG10/3856x2176]"
  yavta -c1 -n1 -s 3856x2176 \
    --file=/tmp/frame-CSI1.bin -f SGRBG10 /dev/video0

Changes in v3:
- Replace icvs_pci_tbl (which duplicated the IPU6 entries already in
  ipu6_pci_tbl from ipu6-pci-table.h) with icvs_ipu7_tbl containing
  only the two IPU7 IDs. Probe now iterates ipu6_pci_tbl first, then
  icvs_ipu7_tbl, eliminating the sparse unused-variable warning.
- Use cvs_read_i2c() for the prefix probe in cvs_hw_init() instead of
  open-coded i2c_master_send/recv; drop the redundant n.cmd_id
  assignment by reusing the cmd variable for both reads.
- Fix put_device(&ipu->dev) missing on error paths after
  ipu_bridge_init() succeeds; consolidate cleanup under err_put_ipu
  label and make device_link_add() failure a hard error.
- Add patch 3: ACPI scan fix to honor _DEP for Intel CVS devices so
  that the ACPI scan waits for CVS dependencies before marking the
  device ready.
- Link to v2: https://lore.kernel.org/linux-media/20260514184431.288353-1-miguel.vadillo@intel.com/

Changes in v2:
- Add MAINTAINERS entry for the CVS driver.
- Initialize status in cvs_send() to fix maybe-uninitialized warning.
- Convert command ID fields to __be16 and use be16/cpu helpers to fix
  sparse type warnings.
- Move icvs_pci_tbl out of icvs.h and into core.c to avoid unused
  static table warnings in other translation units.
- Update kernel-doc for cvs_send() to document @cmd correctly.
- Fix non-kernel-doc comment delimiter in icvs.h.
- Wrap long comment lines in core.c to keep within 80 columns.
- Move Kconfig entry to "Miscellaneous helper chips" section.
- Update Kconfig help text to focus on CVS function without mentioning
  firmware download or quirks.
- Use ipu6-pci-table.h for IPU6 PCI device ID definitions instead of
  redefining them locally.
- Link to v1: https://lore.kernel.org/linux-media/20260505223005.84162-1-miguel.vadillo@intel.com/

Miguel Vadillo (3):
  media: i2c: cvs: Add driver of Intel Computer Vision Sensing
    Controller(CVS)
  media: pci: intel: Add CVS support for IPU bridge driver
  ACPI: scan: Honor _DEP for Intel CVS devices

 MAINTAINERS                          |    6 +
 drivers/acpi/scan.c                  |    5 +-
 drivers/media/i2c/Kconfig            |    2 +
 drivers/media/i2c/Makefile           |    1 +
 drivers/media/i2c/cvs/Kconfig        |   21 +
 drivers/media/i2c/cvs/Makefile       |    4 +
 drivers/media/i2c/cvs/core.c         | 1042 ++++++++++++++++++++++++++
 drivers/media/i2c/cvs/icvs.h         |  495 ++++++++++++
 drivers/media/i2c/cvs/v4l2.c         |  618 +++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c |   13 +-
 10 files changed, 2203 insertions(+), 4 deletions(-)
 create mode 100644 drivers/media/i2c/cvs/Kconfig
 create mode 100644 drivers/media/i2c/cvs/Makefile
 create mode 100644 drivers/media/i2c/cvs/core.c
 create mode 100644 drivers/media/i2c/cvs/icvs.h
 create mode 100644 drivers/media/i2c/cvs/v4l2.c

-- 
2.43.0


