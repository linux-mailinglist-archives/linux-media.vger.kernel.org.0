Return-Path: <linux-media+bounces-61625-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEEJGckZBmrGegIAu9opvQ
	(envelope-from <linux-media+bounces-61625-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 20:51:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B102A5460C5
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 20:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E140230BF0DF
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 18:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0C53B5835;
	Thu, 14 May 2026 18:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EeYDrr0Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57BE3ACEEB
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 18:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778784518; cv=none; b=B2aBl8rOOc3ZiD5/Y21t254hVR+lgRN8l8qH5R8K69RW89eZw9V9wN+hVgP6/9RrCvrMGU4+Addb+z0KGcHDiNeYUY9wE0fCF6aVxWdN3/7W+uGnuJzJpGlLQOcYiMjI47qDfAbTUUgpn4Uc21etSYPsTbm2DbSG/adw2Q1gXdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778784518; c=relaxed/simple;
	bh=8I9TUEU2PGEMpyQVcCv9BVEuAiGowKzvOHtDDMMJ5eY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GryvbGyVfz4jsw3haN3/D63Rjlc4d1HBAKzvN/Zc+qZMwoiuCn1GtfZN81qpggpghsd4ICq7NMvlzL4Gs72ae7OtBU06m6EbVw3hkWim9Hia4+MbWfIsR9BhsgfhvB9YI4axmk2qgh/VcmL0qCsArCSXPxN6Tj1iWqMILaPA8RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EeYDrr0Q; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778784515; x=1810320515;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8I9TUEU2PGEMpyQVcCv9BVEuAiGowKzvOHtDDMMJ5eY=;
  b=EeYDrr0QKnmvxzUx1UsHXk1tDUCXJzC6LqwoOJow/EQaf0pRFyfnooi6
   VC2BiKXOB3oWxUXSYItnZwvypxG6G5s998lBW4/FdtpcYUPDPFGtrnOzM
   afzYvzVunVMvfArThym0aRCskwrR7iMj9rL6rTfDUPHoZkQl3U/FIK4+h
   EsgasGGiJPR5zPozbuBtmmvn6Ux8hyQfNTqa0v3Y2Rjl2D7M+zVstpSSU
   Rkyj2bo9LcXr4YG0jk1ynRDtWjGTMZ0xm6Br3EPHIobi0NmckMuAKWBB+
   HelFe1WIDDFMO+Ev1/PJN3mG8eXYlK7O+Ig3O4xn8Yns8oEQP6AupwF77
   w==;
X-CSE-ConnectionGUID: FhOjJ0LXSTG/McrfXXMZ9g==
X-CSE-MsgGUID: Vnur18PPSiOcc+Rv43ZuZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90044650"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="90044650"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 11:48:25 -0700
X-CSE-ConnectionGUID: 0qSebzHOTourkYgpVStr2w==
X-CSE-MsgGUID: Q07Lg8fKSW6UHd8BQv6hRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="237474943"
Received: from ubuntu.jf.intel.com ([10.54.60.90])
  by orviesa006.jf.intel.com with ESMTP; 14 May 2026 11:48:24 -0700
From: Miguel Vadillo <miguel.vadillo@intel.com>
To: linux-media@vger.kernel.org
Cc: wei.a.xu@intel.com,
	atul.raut@intel.com,
	sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	miguel.vadillo@intel.com
Subject: [PATCH v2 0/2] media: i2c: cvs: Add Intel CVS driver
Date: Thu, 14 May 2026 11:44:29 -0700
Message-ID: <20260514184431.288353-1-miguel.vadillo@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B102A5460C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-61625-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

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

Miguel Vadillo (2):
  media: i2c: cvs: Add driver of Intel Computer Vision Sensing
    Controller(CVS)
  media: pci: intel: Add CVS support for IPU bridge driver

 MAINTAINERS                          |    6 +
 drivers/media/i2c/Kconfig            |    2 +
 drivers/media/i2c/Makefile           |    1 +
 drivers/media/i2c/cvs/Kconfig        |   21 +
 drivers/media/i2c/cvs/Makefile       |    4 +
 drivers/media/i2c/cvs/core.c         | 1007 ++++++++++++++++++++++++++
 drivers/media/i2c/cvs/icvs.h         |  495 +++++++++++++
 drivers/media/i2c/cvs/v4l2.c         |  618 ++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c |   13 +-
 9 files changed, 2165 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/i2c/cvs/Kconfig
 create mode 100644 drivers/media/i2c/cvs/Makefile
 create mode 100644 drivers/media/i2c/cvs/core.c
 create mode 100644 drivers/media/i2c/cvs/icvs.h
 create mode 100644 drivers/media/i2c/cvs/v4l2.c

-- 
2.43.0


