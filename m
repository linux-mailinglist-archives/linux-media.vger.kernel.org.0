Return-Path: <linux-media+bounces-60492-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNczJ3dw+mngOwMAu9opvQ
	(envelope-from <linux-media+bounces-60492-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 00:34:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B08A34D462E
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 00:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B94B13027255
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 22:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A741F099C;
	Tue,  5 May 2026 22:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1Bn4god"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDB123EAB4
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 22:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778020432; cv=none; b=tcV8QesSWYa58lX5/o812Q/MoPnHetYbUZEkYhMctzKmi6EGhX6sMLtWKzZrVOnBOtZrnSWwvPqA5dQUpwVPsFdZ46CSIP7D9h2s5wumCXeZ2wfzY0sUMqCcs0fsENpEIN/GTMtE1OMyKh3zFxU+7qxKLyOZsNZk/Si2F+VwfuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778020432; c=relaxed/simple;
	bh=TT/Se4e2m0QR8mZX+OJWs/QHBj1lm/16+6WStrtFkKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nDYPs9RbELXDiiMLh7gENAw53tyDNBuicaQUxbGHfHeZZNoXZyeQNfWCulsGSBApxA4pHW1/h1q4qhX6rbo8+nEYgipbGlaV9YOMv9MSJu4XqCNMPQE9MZqCvFqBAfPql9eded7lCtjHQB+13uXODNpmho8LU2Qa5V37cNDEvpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1Bn4god; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778020431; x=1809556431;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TT/Se4e2m0QR8mZX+OJWs/QHBj1lm/16+6WStrtFkKo=;
  b=O1Bn4godb+dSuquJEFeLlw5eyJjUpmVP9o64CmlC8REdsCfhu9f1qbZ0
   L16Zcj4fM44ErPoQ3z+/t/oKfRBjE3rZa4SYq/bx4Ete0KiPhZMxg8tCK
   EC78QcPRRgHTZOTtWbit8rNQwHcfWUt0hd64fjH1kzJgR97owjEQrm8PJ
   QSAfEPnrGJZ4YrASY2/3+D1rgaAgJdPVS+1S8GOiHdcrwHZ1Kgd1UytvI
   NzHn0WopELj/BPVCSs3/XMG4YIYzcW5+6VBn90nCJputYCEedqzk5O0yM
   MUAMn/vDjlQLvuxxFDmtxA1XEt1zfZCp36y1+LExapbnDfVcLlWSe7sGS
   A==;
X-CSE-ConnectionGUID: +py/FfINR/SXfX2Z6+6rUw==
X-CSE-MsgGUID: AjGpGa9zSgOt84VeGtzMmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78843610"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="78843610"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 15:33:50 -0700
X-CSE-ConnectionGUID: qY5TbGLCRwSNNtWgMVYiHw==
X-CSE-MsgGUID: tjPT3EhRQ1Ob/7OQbKu2PA==
X-ExtLoop1: 1
Received: from ubuntu.jf.intel.com ([10.54.60.90])
  by fmviesa003.fm.intel.com with ESMTP; 05 May 2026 15:33:49 -0700
From: Miguel Vadillo <miguel.vadillo@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	miguel.vadillo@intel.com
Subject: [PATCH 0/2] media: i2c: cvs: Add driver of Intel Computer Vision Sensing Controller(CVS)
Date: Tue,  5 May 2026 15:30:03 -0700
Message-ID: <20260505223005.84162-1-miguel.vadillo@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B08A34D462E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60492-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

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
- Resume on streaming start or firmware operations
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

Miguel Vadillo (2):
  media: i2c: cvs: Add driver of Intel Computer Vision Sensing
    Controller(CVS)
  media: pci: intel: Add CVS support for IPU bridge driver

 drivers/media/i2c/Kconfig            |   1 +
 drivers/media/i2c/Makefile           |   1 +
 drivers/media/i2c/cvs/Kconfig        |  21 +
 drivers/media/i2c/cvs/Makefile       |   4 +
 drivers/media/i2c/cvs/core.c         | 984 +++++++++++++++++++++++++++
 drivers/media/i2c/cvs/icvs.h         | 515 ++++++++++++++
 drivers/media/i2c/cvs/v4l2.c         | 618 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c |  13 +-
 8 files changed, 2155 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/i2c/cvs/Kconfig
 create mode 100644 drivers/media/i2c/cvs/Makefile
 create mode 100644 drivers/media/i2c/cvs/core.c
 create mode 100644 drivers/media/i2c/cvs/icvs.h
 create mode 100644 drivers/media/i2c/cvs/v4l2.c

-- 
2.43.0


