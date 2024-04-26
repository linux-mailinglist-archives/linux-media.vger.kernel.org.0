Return-Path: <linux-media+bounces-10195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA39C8B34AC
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 11:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6086C283415
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 09:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7191411F6;
	Fri, 26 Apr 2024 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xd2FQ5tG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E78F14039A
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 09:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125517; cv=none; b=bb8KmgHZkWjVpKKm2LMPL843Ji0YetssptxfDJHuyQUrbfCgceFeDgp4czd5qTa+LNq84OixX9s9xHa7ZJQBYyl+quNYh5HA0AVTrjlxtOOhTpqEZMcJy5LvILRKSgBLoIou6sy3N079idN1Yyms7stZZ0RxbQU4uRT2hvJzllE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125517; c=relaxed/simple;
	bh=9nAmmYOAJED3SDrEccooHsgDAmmknMXKeHSVDuXhv9g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o7fLwJZ/gDYzCwzlXcUqStABpupPfqM+1qK9Mt6Navfsd9RDhdSWQ5VZliv0QlLc1YMg3ZHCXNiBfFmFJbmloUpoYZmBh3YTB8E9Vg0K0OV/DP0MqJP5QM66hR3zAKy4/RdPDlAUeDx4n+uz/O8uKdh3PB8oOshpzpdwZsU//Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xd2FQ5tG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125515; x=1745661515;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9nAmmYOAJED3SDrEccooHsgDAmmknMXKeHSVDuXhv9g=;
  b=Xd2FQ5tGg7quKM0emxgPWw/Od7rM8vwL47LDjgCQCw8ABqqkF61x6s3g
   AkRVBYSSW9AcNkVLXQT/rmTGKNffVylru+8k9TZZZkUG/K3S5IQsmPDJW
   6VLMFwzeDskGl44561BRXcYw2xfjcxGu6mmpS6mNdXiWnN3vXI15ow3si
   H9G75/Qv9FL+BgaQ2nhx8xWZVXHKm8eOHoJhkNNgC9c6aIHqJ37AuO8QV
   rGBR8mA8dkqGiqn3W9h3sX/ZJ4jqWsvN5PlG2iQFb1GqA7lILSFnGJ32C
   PjS6P1wdfCkEY1z4UMnf17/tEBeTwg0qTWVrv4pqKAHwTGUZYk56ziWmS
   Q==;
X-CSE-ConnectionGUID: LPgNnwNFSAux4LeomRzXcA==
X-CSE-MsgGUID: lLBto08XRM6oqwiiRSyEYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9722789"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9722789"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:58:32 -0700
X-CSE-ConnectionGUID: uBj5DdWDS/KYfprR0tS93w==
X-CSE-MsgGUID: xlKJHV5NTiWtrEaDWI8A9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="56303336"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:58:29 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 22EE211F855;
	Fri, 26 Apr 2024 12:58:22 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v6 00/18] Intel IPU6 and IPU6 input system drivers
Date: Fri, 26 Apr 2024 12:58:04 +0300
Message-Id: <20240426095822.946453-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everyone,

This patch series adds a driver for Intel IPU6 input system.
IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
device which can be found in some Intel Client Platforms. User can use
IPU6 to capture images from MIPI camera sensors.

IPU6 has its own firmware which exposes ABIs to driver, and communicates
with CSE to do firmware authentication. IPU6 has its MMU hardware, so
the driver sets up a page table to allow IPU6 DMA to access the system
memory.

IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.

I can now capture images from ov01a10 and ov2740 sensors (including
metadata from the latter).

The series applies on top of the metadata patchset
<URL:https://lore.kernel.org/linux-media/20240416193319.778192-1-sakari.ailus@linux.intel.com/T/#t>.

The v4l2-compliance report (and yavta format enumeration) can be found
below. It seems v4l2-compliance isn't prepared for the same node
supporting different buffer types with different set of formats (pixel and
meta data) so that's why it fails. yavta however reveals the enumeration
is as expected.

v4l2-compliance 1.27.0-5198, 64 bits, 64-bit time_t
v4l2-compliance SHA: 8eaf0a14db34 2024-04-25 08:41:42

Compliance test for isys device /dev/video0:

Driver Info:
	Driver name      : isys
	Card type        : ipu6
	Bus info         : PCI:0000:00:05.0
	Driver version   : 6.9.0
	Capabilities     : 0xa4a00001
		Video Capture
		Metadata Capture
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24a00001
		Video Capture
		Metadata Capture
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : intel-ipu6
	Model            : ipu6
	Serial           : 
	Bus info         : PCI:0000:00:05.0
	Media version    : 6.9.0
	Hardware revision: 0x10280b14 (271059732)
	Driver version   : 6.9.0
Interface Info:
	ID               : 0x03000003
	Type             : V4L Video
Entity Info:
	ID               : 0x00000001 (1)
	Name             : Intel IPU6 ISYS Capture 0
	Function         : V4L2 I/O
	Pad 0x01000002   : 0: Sink, Must Connect
	  Link 0x020000a9: from remote pad 0x1000083 of entity 'Intel IPU6 CSI2 0' (Video Interface Bridge): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
		fail: v4l2-test-formats.cpp(601): dataformat 32314742 (BG12) for buftype 13 not reported by ENUM_FMT
	test VIDIOC_G_FMT: FAIL
		fail: v4l2-test-formats.cpp(601): dataformat 32314742 (BG12) for buftype 13 not reported by ENUM_FMT
	test VIDIOC_TRY_FMT: FAIL
		fail: v4l2-test-formats.cpp(601): dataformat 32314742 (BG12) for buftype 13 not reported by ENUM_FMT
	test VIDIOC_S_FMT: FAIL
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
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for isys device /dev/video0: 48, Succeeded: 45, Failed: 3, Warnings: 0

Device /dev/video0 opened.
Device `ipu6' on `PCI:0000:00:05.0' (driver 'isys') supports video, meta-data, capture, without mplanes.
- Available formats:
	Format 0: SBGGR12 (32314742, "BG12")
	Type: Video capture (1)
	Name: 12-bit Bayer BGBG/GRGR
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 1: SGBRG12 (32314247, "GB12")
	Type: Video capture (1)
	Name: 12-bit Bayer GBGB/RGRG
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 2: SGRBG12 (32314142, "BA12")
	Type: Video capture (1)
	Name: 12-bit Bayer GRGR/BGBG
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 3: SRGGB12 (32314752, "RG12")
	Type: Video capture (1)
	Name: 12-bit Bayer RGRG/GBGB
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 4: SBGGR10 (30314742, "BG10")
	Type: Video capture (1)
	Name: 10-bit Bayer BGBG/GRGR
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 5: SGBRG10 (30314247, "GB10")
	Type: Video capture (1)
	Name: 10-bit Bayer GBGB/RGRG
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 6: SGRBG10 (30314142, "BA10")
	Type: Video capture (1)
	Name: 10-bit Bayer GRGR/BGBG
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 7: SRGGB10 (30314752, "RG10")
	Type: Video capture (1)
	Name: 10-bit Bayer RGRG/GBGB
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 8: SBGGR8 (31384142, "BA81")
	Type: Video capture (1)
	Name: 8-bit Bayer BGBG/GRGR
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 9: SGBRG8 (47524247, "GBRG")
	Type: Video capture (1)
	Name: 8-bit Bayer GBGB/RGRG
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 10: SGRBG8 (47425247, "GRBG")
	Type: Video capture (1)
	Name: 8-bit Bayer GRGR/BGBG
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 11: SRGGB8 (42474752, "RGGB")
	Type: Video capture (1)
	Name: 8-bit Bayer RGRG/GBGB
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 12: pBCC (43434270, "pBCC")
	Type: Video capture (1)
	Name: 12-bit Bayer BGBG/GRGR Packed
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 13: pGCC (43434770, "pGCC")
	Type: Video capture (1)
	Name: 12-bit Bayer GBGB/RGRG Packed
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 14: pgCC (43436770, "pgCC")
	Type: Video capture (1)
	Name: 12-bit Bayer GRGR/BGBG Packed
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 15: pRCC (43435270, "pRCC")
	Type: Video capture (1)
	Name: 12-bit Bayer RGRG/GBGB Packed
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 16: SBGGR10P (41414270, "pBAA")
	Type: Video capture (1)
	Name: 10-bit Bayer BGBG/GRGR Packed
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 17: SGBRG10P (41414770, "pGAA")
	Type: Video capture (1)
	Name: 10-bit Bayer GBGB/RGRG Packed
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 18: SGRBG10P (41416770, "pgAA")
	Type: Video capture (1)
	Name: 10-bit Bayer GRGR/BGBG Packed
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 19: SRGGB10P (41415270, "pRAA")
	Type: Video capture (1)
	Name: 10-bit Bayer RGRG/GBGB Packed
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 20: UYVY (59565955, "UYVY")
	Type: Video capture (1)
	Name: UYVY 4:2:2
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 21: YUYV (56595559, "YUYV")
	Type: Video capture (1)
	Name: YUYV 4:2:2
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 22: RGB565 (50424752, "RGBP")
	Type: Video capture (1)
	Name: 16-bit RGB 5-6-5
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

	Format 23: BGR24 (33524742, "BGR3")
	Type: Video capture (1)
	Name: 24-bit BGR 8-8-8
	Frame size: 2x2 - 4672x3416 (by 2x2) (
)

Video format: SBGGR12 (32314742) 1920x1080 (stride 3840) field none buffer size 4151040


---
since v5:

- Address a compilation issue in an intermediate patch. No diff on top of
  the set compared to v5.

since v4:

- Move to single-planar buffers. The reason for using multi-planar buffers
  no longer exists.

- Clean up buffer setup and format access code.

- Align isys function naming (ipu6 prefix to ipu6_isys prefix).

- Separate formats for pixel and meta buffer types. This seems to be
  assumed by the V4L2 spec and v4l2-compliance.

- Disable user-settable bytesperline for now. This may be allowed later
  on. (For v4l2-compliance.)

- Enumerate formats valid for a given buffer type only. (For
  v4l2-compliance.)

- The minimum image size earlier did not satisfy alignment requirements.
  It's now 2x2 (was 1x1).

- Fix frame size enumeration type (CONTINUOUS -> STEPWISE).

- Use the PCI device as the device for V4L2 device.

- Obtain IPU6 ISYS format information dynamically instead of storing it in
  the device context struct.

- Drop the patch selecting MEDIA_CONTROLLER when VIDEO_V4L2_SUBDEV_API is
  selected. It doesn't belong to this set (although is nice otherwise).
  Select MEDIA_CONTROLLER separately for IPU6.

- Align subject line prefixes to "media: ".

since v3:

- Prepend the series with IPU bridge changes for more reliable
  IPU bridge initialisation.

- Split off the IPU6 PCI device ID table (due to the former change).

- Documentation improvements (mostly non-technical).

- Update copyright year.

- Remove unused struct ipu6_buttress_constraint and a few other unused
  definitions.

- Miscellaneous cleanups.

- Make functions static if they can be so.

- Merge watermark setup error handling bugfix from Hongju.

- Use media_pad_remote_pad_unique() instead of
  media_pad_remote_pad_first() in figuring out the remote sub-device.

- Determine the number of queues by counting the video nodes in the graph.

- Make the links from the external sub-devices to CSI-2 receivers enabled
  and immutable.

- Simplify determining CSI-2 port control base port offset.

- Create only as many links as needed between CSI-2 receivers and video
  nodes (one per video node).

v2 -> v3:
  - Add line-based metadata capture support
  - Fix header files inclusion issues
  - Fix the CSI2 timing calculation
  - Fix crash when remove module during streaming
  - Remove some unused code
  - Use cross-referencing links in documentation
  - Update Makefile to use ":=" for objects
  - Fix several bugs and coding style issues

v1 -> v2:
  - Add multiplexed streams support
  - Use auxiliary bus to register IPU6 devices
  - Add IPU6 hardware and driver overview documentation
  - Updata IPU6 admin-guide documentation
  - Update number of source pads and video nodes to support
    multiplexed streams

TODOs:
  - Add firmware CSI2 lanes configuration verification

Bingbu Cao (16):
  media: intel/ipu6: add Intel IPU6 PCI device driver
  media: intel/ipu6: add IPU auxiliary devices
  media: intel/ipu6: add IPU6 buttress interface driver
  media: intel/ipu6: CPD parsing for get firmware components
  media: intel/ipu6: add IPU6 DMA mapping API and MMU table
  media: intel/ipu6: add syscom interfaces between firmware and driver
  media: intel/ipu6: input system ABI between firmware and driver
  media: intel/ipu6: add IPU6 CSI2 receiver v4l2 sub-device
  media: intel/ipu6: add the CSI2 DPHY implementation
  media: intel/ipu6: input system video nodes and buffer queues
  media: intel/ipu6: add the main input system driver
  media: intel/ipu6: add Kconfig and Makefile
  media: MAINTAINERS: add maintainers for Intel IPU6 input system driver
  media: intel/ipu6: support line-based metadata capture support
  media: Documentation: add Intel IPU6 ISYS driver admin-guide doc
  media: Documentation: add documentation of Intel IPU6 driver and
    hardware overview

Sakari Ailus (2):
  media: ipu6: Add PCI device table header
  media: ivsc: csi: Use IPU bridge

 Documentation/admin-guide/media/ipu6-isys.rst |  161 ++
 .../admin-guide/media/ipu6_isys_graph.svg     |  548 +++++++
 .../admin-guide/media/v4l-drivers.rst         |    1 +
 .../driver-api/media/drivers/index.rst        |    1 +
 .../driver-api/media/drivers/ipu6.rst         |  205 +++
 MAINTAINERS                                   |   10 +
 drivers/media/pci/intel/Kconfig               |    1 +
 drivers/media/pci/intel/Makefile              |    1 +
 drivers/media/pci/intel/ipu6/Kconfig          |   18 +
 drivers/media/pci/intel/ipu6/Makefile         |   23 +
 drivers/media/pci/intel/ipu6/ipu6-bus.c       |  165 ++
 drivers/media/pci/intel/ipu6/ipu6-bus.h       |   58 +
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  |  912 +++++++++++
 drivers/media/pci/intel/ipu6/ipu6-buttress.h  |   92 ++
 drivers/media/pci/intel/ipu6/ipu6-cpd.c       |  362 +++++
 drivers/media/pci/intel/ipu6/ipu6-cpd.h       |  105 ++
 drivers/media/pci/intel/ipu6/ipu6-dma.c       |  502 ++++++
 drivers/media/pci/intel/ipu6/ipu6-dma.h       |   19 +
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c    |  413 +++++
 drivers/media/pci/intel/ipu6/ipu6-fw-com.h    |   47 +
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |  487 ++++++
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h   |  568 +++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  663 ++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   82 +
 .../media/pci/intel/ipu6/ipu6-isys-dwc-phy.c  |  536 +++++++
 .../media/pci/intel/ipu6/ipu6-isys-jsl-phy.c  |  242 +++
 .../media/pci/intel/ipu6/ipu6-isys-mcd-phy.c  |  720 +++++++++
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  811 ++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   78 +
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |  403 +++++
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |   59 +
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 1399 +++++++++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  141 ++
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 1367 ++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  206 +++
 drivers/media/pci/intel/ipu6/ipu6-mmu.c       |  845 ++++++++++
 drivers/media/pci/intel/ipu6/ipu6-mmu.h       |   73 +
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  226 +++
 .../intel/ipu6/ipu6-platform-isys-csi2-reg.h  |  172 ++
 .../media/pci/intel/ipu6/ipu6-platform-regs.h |  179 +++
 drivers/media/pci/intel/ipu6/ipu6.c           |  895 +++++++++++
 drivers/media/pci/intel/ipu6/ipu6.h           |  342 ++++
 drivers/media/pci/intel/ivsc/mei_csi.c        |   20 +-
 include/media/ipu6-pci-table.h                |   28 +
 44 files changed, 14184 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/admin-guide/media/ipu6-isys.rst
 create mode 100644 Documentation/admin-guide/media/ipu6_isys_graph.svg
 create mode 100644 Documentation/driver-api/media/drivers/ipu6.rst
 create mode 100644 drivers/media/pci/intel/ipu6/Kconfig
 create mode 100644 drivers/media/pci/intel/ipu6/Makefile
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6.h
 create mode 100644 include/media/ipu6-pci-table.h


base-commit: 4777fe7af482e327af9cd7041b2301b576b6de29
-- 
2.39.2


