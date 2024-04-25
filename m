Return-Path: <linux-media+bounces-10139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0F38B2B43
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BAD71F2117A
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E27155A37;
	Thu, 25 Apr 2024 21:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1eL5l8I"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF9A20DFF
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081701; cv=none; b=IF1NJPI79Y0uZE/LD5SeOh0vbLHGhKwDlyqsT7FG367XPVkrPveV0rF8HjfqtkEnkhqnJrD6oEPiF6SELziIycxsgdvYVUng/YBDy5VhHNcT9sNIlb/XUYYoxC2OeGGlP7j7DPetAj63W3Do9x1rUEysCIuWNzHue1A7EvuMu6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081701; c=relaxed/simple;
	bh=K8kU5/EVM9sgfpdwTRhS1ItAwU7TraU4hw9LDI2y8GQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PG0bWnk56QUz7B4cXgCjfhjCwvsQ7GyFRn3OaUpm8JGYATgo18/2Bv297m7V9rC0J0EjtkwcQiiTLQUmINYBsaL6deywU1I2Fl47zED5aaG8i8QkDQyV9nh7LvjSydTwAhLVmdiCyj820WncoE0BkESsGKglvrUeaBDEePaxKdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1eL5l8I; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714081699; x=1745617699;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K8kU5/EVM9sgfpdwTRhS1ItAwU7TraU4hw9LDI2y8GQ=;
  b=d1eL5l8IPSoyxaWl5UWAFVSuLr88U39bqVFKZPhoJ05kn8DMTXih4tvY
   UqZbrEn5mBfAAHyKR18v2R5VxqyYL+hqN00+KFccQeWZyud7yA/jSZjqi
   OGyyhPoj0vENg65DVhEt/5ExQUzxcDUeVfFdYVBjZfboiehO0ww7NpPGK
   MTCcDeNdGU+gphYDdeGajGONglIW3owQP4N5aXB6s3+pzT9pN7QqRnUfZ
   RZh6/q8sZbVDImxM8RkBfAkvt6l+JRuA0Td198se8hUNHz66k8eZEmCuq
   gRVAh3Vk2WpfSb4UYHQ2JCcQ9NrIs+Rim/ie309v69/+qPcB2/1c7zZ8T
   Q==;
X-CSE-ConnectionGUID: AfAgGwb9Qx+KJ5uhwba70g==
X-CSE-MsgGUID: LPThyJclR8CNwLK6SGiXjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9655146"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9655146"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:48:18 -0700
X-CSE-ConnectionGUID: 8in5wc9zSvCEcwO3sBJzfQ==
X-CSE-MsgGUID: QCU1Rm/RSa+x0fiUKgYycQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="30020632"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:48:15 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6C5B911FC19;
	Fri, 26 Apr 2024 00:48:10 +0300 (EEST)
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
Subject: [PATCH v5 00/18] [PATCH v4 00/19] Intel IPU6 and IPU6 input system drivers
Date: Fri, 26 Apr 2024 00:47:51 +0300
Message-Id: <20240425214809.930227-1-sakari.ailus@linux.intel.com>
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


base-commit: e2277a28f49e50fd30d9307c2c6f0342e3cf45cc
-- 
2.39.2


