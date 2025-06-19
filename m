Return-Path: <linux-media+bounces-35269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15617AE04C6
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53BB63BACE0
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D0025393A;
	Thu, 19 Jun 2025 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLb3jNKm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E587423F294
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334334; cv=none; b=Elv6Snp0gXXiX9yV9sH1UCJVWrUE5bCDoRf83lWyiZ/zfZaZ9kpVP2N7fFaAqjjjS8nCRcbsGeKWo5ljg6tuRkdVGvc8YHFIevHHzuCCrSc0A3D10dJD/8YcwKdumZcEdVWhwvoMUAj/Pi9HIyMBt3v7O7VrVY8qC7XuPXPu1Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334334; c=relaxed/simple;
	bh=7SjIXV1ZTUFanq0ptHkWXGAWzezVZ30h6fo/tpiZEAc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DbhmLg5Ld0PolOPw8XjPye3nESJ4LCHZjjZ1oMYmRtw/kfhsXTwIDqmTWVA1CzZyU8rYe6lbUuCf/h8yfhv2avMT8yZa94xxaG1NSwQVVTlS0XR3Ek69iEMkFGB8l7uuBTIDiiuIINYrOvzvVvjpgqv4FwQOorHIOwR8EL+WVwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLb3jNKm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334332; x=1781870332;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7SjIXV1ZTUFanq0ptHkWXGAWzezVZ30h6fo/tpiZEAc=;
  b=FLb3jNKmsGERmV70aSIrtEaLEHuOhdbR6Uqucy1XxqmzCy7FxRJGeMJ2
   iIeBNGkBg+PIubjAzP4UCoqB8YokQhBTJDH9qeSglXEELdUZrW2Pai+tN
   eXHbuT0+y7E+qJnUSKNqkC7om7337ph+o/2xLtn2wH77GIqxZgxCRUJGj
   ZL6fTG7dGXM6Wnda1dI4dKpyXwjoRETC0B2CZfJc52BEttvGgSWygjrIo
   TQ8mfKtHY7oIkBPQOFds5fh9iCPD8HnGFRxm3EVIujFiISw+RhCY9vLXj
   kGZnk2V8GQyOHeMJA541r2ovy5pUDZap7omaYl4HRDBPXKhhu6hYOB2y+
   A==;
X-CSE-ConnectionGUID: UymljuOlS/uwdkZ583plwg==
X-CSE-MsgGUID: r8KYpJNwTU+L0ez3KGTtPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="64014770"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="64014770"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:46 -0700
X-CSE-ConnectionGUID: CndB1D86QZeLP+UER1KgqA==
X-CSE-MsgGUID: K3gpjZV5QeyPTpZ3sBIMGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155192133"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A265311F8AE;
	Thu, 19 Jun 2025 14:58:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AHc-1x;
	Thu, 19 Jun 2025 14:58:36 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 00/64] Generic line based metadata support, internal pads
Date: Thu, 19 Jun 2025 14:57:32 +0300
Message-Id: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Here are a few patches to add support generic, line based metadata as well
as internal pads, sub-device configuration models (including the common
raw sensor model) and a streaming control helper for MC-enabled drivers.
The amount of code and documentation is in this version is no longer small
but it still requires some explaining.

Metadata mbus codes and formats have existed for some time in V4L2. They
however have been only used by drivers that produce the data itself and
effectively this metadata has always been statistics of some sort (at
least when it comes to ISPs). What is different here is that we intend to
add support for metadata originating from camera sensors.

Camera sensors produce different kinds of metadata, embedded data (usually
register address--value pairs used to capture the frame, in a more or less
sensor specific format), histograms (in a very sensor specific format),
dark pixels etc. The number of these formats is probably going to be about
as large as image data formats if not larger, as the image data formats
are much better standardised but a smaller subset of them will be
supported by V4L2, at least initially but possibly much more in the long
run.

Having this many device specific formats would be a major problem for all
the other drivers along that pipeline (not to mention the users of those
drivers), including bridge (e.g. CSI-2 to parallel) but especially CSI-2
receiver drivers that have DMA: the poor driver developer would not only
need to know camera sensor specific formats but to choose the specific
packing of that format suitable for the DMA used by the hardware. It is
unlikely many of these would ever get tested while being present on the
driver API. Also adding new sensors with new embedded data formats would
involve updating all bridge and CSI-2 receiver drivers. I don't expect
this to be a workable approach.

Instead what I'm proposing is to use controls to convey the colour pattern
and metadata layout. Generic mbus codes convey the width of the data
transferred on serial buses (for now, corresponding parallel formats may
be added when needed) but the control is only relevant on the UAPI, not
between drivers. This approach unsnarls the layout of the data and its
colour components, defining what data there is (specific mbus code) and
how that is transported and packed (generic mbus codes and V4L2 formats)
separately.

The user space would be required to "know" the path of that data from the
sensor's internal pad to the V4L2 video node. I do not see this as these
devices require at least some knowledge of the pipeline, i.e. hardware at
hand. Separating what the data means and how it is packed may even be
beneficial: it allows separating code that interprets the data (sensor
internal mbus code) from the code that accesses it (packing).

These formats are in practice line based, meaning that there may be
padding at the end of the line, depending on the bus as well as the DMA.
If non-line based formats are needed, it is always possible to set the
"height" field to 1.

Internal sink pads behave mostly like regular sink pads, but they describe
a flow of data that originates from a sub-device instead of arriving to a
sub-device. The SUBDEV_S_ROUTING IOCTLs are used to enable and disable
routes from internal sink pads to sub-device's source pads. The subdev
format IOCTLs are usable, too, so one can find which subdev format is
available on given internal sink pad.

I've tested the patches using the IPU6 and ov2740 drivers, meaning not all
of this has been tested after making changes (e.g. the imx219 patches have
been only compile tested).

Questions and comments are most welcome.

Preliminary media-ctl and yavta patches can be found here:

<URL:https://git.retiisi.eu/?p=~sailus/yavta.git;a=shortlog;h=refs/heads/metadata>
<URL:https://git.retiisi.eu/?p=~sailus/v4l-utils.git;a=shortlog;h=refs/heads/metadata-l>

I have used IMX219 as an example on routing in a sensor driver in this
version.

The patches are on my metadata branch
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/>.

These patches are on top of my v4l2-mc streaming control helper set, all
of these can be found in the GitWeb URL above.

The documentation build output can be found here:
<URL:https://www.retiisi.eu/~sailus/v4l2/tmp/common-raw/>.

since v9:

- Introduce controls for sub-device configuration models (separately
  discussed in <20250203085853.1361401-1-sakari.ailus@linux.intel.com>),
  with the following changes:

	- Fix spelling and improve wording in documentation based on
	  comments.
	
	- Use US English spelling for V4L2 control names.
	
	- Allow for more than one internal pad for pixel data.
	
	- Introduce (or change a bit) generic mbus codes for raw pixel
	  data and metadata.
	
	- Introduce generic and CSI-2 specifc V4L2 pixelformats for image
	  data and metadata. Also 16- and 24-bit formats are generic, not
	  specific to CSI-2.

	- Introduce new controls to convey metadata layout on bus and by
	  extension, in memory, instead of relying on separate metadata
	  mbus codes, aligning with pixel data.

	- Use generic metadata codes in the example.

- Include imx219 embedded data support patches from Laurent, with
  modifications.

- Patches to IPU6 ISYS driver needed to support metadata capture. Luma
  formats added, too.

- Improved debug prints in v4l2_subdev_{en,dis}able_streams().

- Added a patch to make media_entity_to_video_device() NULL-safe.

- Drop _media-glossary-data-unit reference, use :term: to reference it.

- Include a patch to set IPU6 ISYS minimum height to 1.

- Patch 'media: uapi: Document which mbus format fields are valid for
  metadata' already merged.

- Patch 'media: uapi: v4l: Add generic 8-bit metadata format definitions'
  already merged.

- Patch 'media: v4l: Support line-based metadata capture' already merged.

- Patch 'media: Documentation: Document S_ROUTING behaviour' already merged.

- Patch 'media: v4l: subdev: Add len_routes field to struct
  v4l2_subdev_routing' already merged.

since v8:

- Move the patch adding internal pad flag past the routing API reworks, as
  well as a few other patches, in order to separate the patches to those
  that could still be merged for v6.10 (routing changes) and those that
  couldn't (sensor API related). The patch on the edge is "media: uapi:
  v4l: subdev: Enable streams API".

- Include Laurent's two patches to address crop API issues wrt. streams.

- Add two patches to prepare for CCS driver rework (media: ccs: Move
  ccs_pm_get_init function up and media: ccs: Rename out label of
  ccs_start_streaming).

- Address issues in the ov2740 driver patches (as well as the driver
  itself), 4 more patches towards the end of the set.

- Improved generic metadata format names, align with other existing
  formats.

- Improved ov2740 embedded data documentation.

- Reworked streams and camera sensor documentation based on Laurent's
  comments mainly. In particular, the contradictory concept of internal
  source pads no longer should exist in the patches.

- Fixed pad numbering in the CCS example.

- Fixed S_ROUTING behaviour when len_routes is too small and when
  S_ROUTING isn't implemented by the driver.

- Reorder sections in meta-formats.rst alphabetically.

- Add a note per struct fields that certain struct v4l2_subdev_format are
  zero for metadata mbus codes.

- CCS driver patch cleanups.

- CCS driver metadata width fix for space-efficient embedded data at 16
  bpp and over.

- Postpone CCS frame descriptor quirk for now.

- Use MIPI_CSI2_DT_USER_DEFINED(0) instead of a numerical value for
  compressed data datatype.

since v7:

- Add embedded data support for the ov2740 driver.

- Add three patches on top, to add an IMMUTABLE flag to source streams
  when they cannot be disabled.

- Improved documentation of len_routes and num_routes arguments of
  [GS]_ROUTING.

- Remove one inclusion of twice-included media/v4l2-fwnode.h in
  drivers/media/i2c/ccs/ccs-core.c .

- Add missing forward declaration of ccs_internal_ops in
  drivers/media/i2c/ccs/ccs-core.c .

since v6:

- Improve embedded data UAPI documentation on camera sensors.

- Improve wording of stream glossary entry.

- Improve internal pad flag documentation.

- Fix definition of "data unit" and remove an extra "only" in INTERNAL pad
  flag description (1st patch).

- Use IMX219 driver in examples consistently.

- Remove the CSI-2 to parallel bridge from the example to simplify the
  example.

- Minor rewording of some parts of the routing examples.

- Rebase on unified sub-device state information access functions:
  <URL:https://lore.kernel.org/linux-media/20231027095913.1010187-1-sakari.ailus@linux.intel.com/T/#t>

- In CCS driver, do not maintain current active configuration in driver's
  device context struct (apart from mbus codes). Rely on sub-device state
  locking and clean up the code. (Multiple patches towards the end of the
  set.)

- Arrange the CCS patches early in the set towards the end of the set.

- Move the patch enabling streams API to the end of the set.

- Rework IOCTL argument copying condition for [GS]_ROUTING).

- Handle copying back routes in S_ROUTING, do not rely on G_ROUTING
  IOCTL implementation.

- Rebase on metadata preparation patchset v6:
  <URL:https://lore.kernel.org/linux-media/20231106121805.1266696-1-sakari.ailus@linux.intel.com/T/#t>.

since v5:

- Rebase on new set of preparation patches.

- Switch CCS driver from s_stream to enable_streams/disable_streams. Keep
  streaming state information --- the sensor remains in streaming state if
  any of the streams is enabled.

- Fix setting mbus code on embedded data in get_frame_desc() op in the CCS
  driver.

since v4:

- Add a patch to acquire two sub-device states that may use the same lock.

- Add a patch for CCS driver to remove ccs_get_crop_compose() helper.

- Add a patch for CCS driver moving acquiring and releasing the mutex to
  the s_stream callback.

- Add a patch for CCS driver to rely on sub-device state locking using a
  single driver-provided lock.

- Fixed calculating minimum number of routes in copying the routes
  (thanks, Laurent).

- Moved a label in S_ROUTING handling to make Clang happy (hopefully).

- Fixed setting emb_data_ctrl register for CCS embedded data support.

- Rebase on Laurent's cleanup patches.

- Wrap a few long lines.

- Write in embedded data documentation sensor drivers generally don't
  allow configuring it.

since v3:

- Separate preparation patches from this set.

- Add a definition for "Data unit", a pixel that is not image data and use
  it instead in format documentation.

- Fix more numbered lists in dev-subdev.rst.

- Remove a redundant definition for V4L2_META_FMT_GENERIC_CSI2_2_24 ---
  V4L2_META_FMT_GENERIC_CSI2_12 can be used instead.

- Use "X" instead of "p" to denote padding in format documentation.

- Use IMX219 in examples instead of CCS.

- Document that the generic V4L2 CSI-2 metadata formats use padding
  defined in CSI-2 spec and packing defined in CCS spec.

- Add patches to align [GS]_ROUTING behaviour with V4L2. This means mainly
  returning configured routes as part of S_ROUTING as well. "len_routes"
  field is added to denote the length of the array and having more routes
  than fits in the array is no longer an error. Also added more reserved
  fields.

- Added trivial support for S_ROUTING (via G_ROUTING implementation) for
  use in drivers with static-only routes.

- Added helper functions to obtain mbus format as well as crop and compose
  rectangles that are streams-independent.

- Added a patch to define generic CSI-2 long packet types.

- Removed MEDIA_BUS_FMT_IS_META() macro. It didn't seem useful in the end.

- Use a single CCS embedded data format. The bit depth can be selected
  using the meta stream on the source pad.

- Fix mbus code numbers (there were holes due to removed redundant
  formats).

- Fix generic mbus code documentation (byte was being used instead of
  bit).

- Fix spelling of "length".

- Added a patch to remove v4l2_subdev_enable_streams_api that disables
  streams API. This should be merged once libcamera support for streams
  works nicely.

- Don't use strings in printing frame descriptor flags.

- Warn on string truncation in printing frame descriptor.

since v2:

- Add a better example, with formats.

- Add CCS static data media bus codes.

- Added an example demonstrating the use of internal pads. --- Is the
  level of detail enough for the purpose?

- Improved documentation.

- Added a macro to tell whether a format is a metadata format.
  (Documentation could be added.)

- A small ReST syntax fix in the same section.

- Drop leftovers of a patch checking for the INTERNAL_SOURCE flag.

since v1:

- Make the new pad flag just "INTERNAL", requiring either SINK or SOURCE
  pad flag to accompany it. Removed the union in struct v4l2_subdev_route.

- Add the term "stream" to MC glossary.

- Improved and fixed documentation (according to comments).

- Note these formats are little endian.

- Remove 1X8 from the names of the mbus codes. These formats have generally
  8 bits per pixel.

- Fix mbus code numbering (had holes in RFC).

- Add new metadata fields to debug prints.

- Fix a minor documentation build issue.

Laurent Pinchart (6):
  media: i2c: imx219: Inline imx219_update_pad_format() in its caller
  media: i2c: imx219: Add internal image sink pad
  media: i2c: imx219: Add image stream
  media: i2c: imx219: Report internal routes to userspace
  media: i2c: imx219: Report streams using frame descriptors
  media: i2c: imx219: Add embedded data support

Sakari Ailus (58):
  media: ov2740: Remove shorthand variables
  media: Documentation: Move streams documentation one level up
  media: Documentation: Clean up figure titles
  media: ccs: No need to set streaming to false in power off
  media: ccs: Move ccs_pm_get_init function up
  media: ccs: Rename out label of ccs_start_streaming
  media: ccs: Move ccs_validate_csi_data_format up
  media: Documentation: Refer to internal pads in metadata documentation
  media: ccs: Use {enable,disable}_streams operations
  media: ccs: Track streaming state
  media: ccs: Support frame descriptors
  media: uapi: v4l: subdev: Enable streams API
  media: mc: Add INTERNAL pad flag
  media: v4l2-mc: Ignore internal pads in finding source sub-devices
  media: uapi: Add generic CSI-2 raw pixelformats
  media: uapi: Add new media bus codes for generic raw formats
  media: uapi: Add V4L2_CID_CONFIG_MODEL control
  media: uapi: Add V4L2_CID_COLOR_PATTERN for describing color patterns
  media: v4l: uapi: Add a control for color pattern flipping effect
  media: Documentation: Document raw mbus codes and CFA for cameras
  media: uapi: Add V4L2_CID_METADATA_LAYOUT control
  media: Documentation: v4l: Document internal sink pads
  media: Documentation: Document embedded data guidelines for camera
    sensors
  media: uapi: ccs: Add metadata layout for MIPI CCS embedded data
  media: Documentation: Document non-CCS use of CCS embedded data layout
  media: ccs: Add support for embedded data stream
  media: Documentation: ccs: Document routing
  media: ccs: Remove ccs_get_crop_compose helper
  media: ccs: Rely on sub-device state locking
  media: ccs: Compute binning configuration from sub-device state
  media: ccs: Compute scaling configuration from sub-device state
  media: ccs: Remove which parameter from ccs_propagate
  media: ccs: Detemine emb_data_ctrl register from sub-device state
  media: Documentation: Rework embedded data documentation
  media: Documentation: Add a hyphen to list-based
  media: Documentation: Reword split of sensor driver to two classes
  media: uapi: Documentation: Improve column width hints for examples
  media: uapi: Correct generic CSI-2 metadata format 4cc
  Revert "media: uapi: v4l: Don't expose generic metadata formats to
    userspace"
  media: Documentation: Add subdev configuration models, raw sensor
    model
  media: Documentation: Add scaling and post-scaler crop for common raw
  media: uapi: Add MIPI CCS configuration model
  media: uapi: Add V4L2_CID_BINNING control for binning configuration
  media: uapi: Add controls for sub-sampling configuration
  media: Documentation: Add binning and sub-sampling controls
  media: uapi: Add metadata layout for ov2740 embedded data
  media: ov2740: Add support for embedded data
  media: ov2740: Add support for generic raw formats
  media: ov2740: Add metadata layout control
  media: ov2740: Add support for G_SELECTION IOCTL
  media: v4l: Add V4L2_SUBDEV_ROUTE_FL_IMMUTABLE sub-device routing flag
  media: ccs: Add IMMUTABLE route flag
  media: ov2740: Add IMMUTABLE route flag
  media: imx219: Add support for generic raw formats
  media: ccs: Add frame descriptor quirk
  media: ipu6: isys: Set embedded data type correctly for metadata
    formats
  media: ipu6: Add support for luma-only formats
  media: ipu6: Add support for raw CFA-agnostic formats

 .../media/drivers/camera-sensor.rst           |   87 +-
 .../userspace-api/media/drivers/ccs.rst       |   43 +-
 .../media/mediactl/media-types.rst            |    9 +
 .../media/v4l/common-raw-sensor.dia           |  442 +++++++
 .../media/v4l/common-raw-sensor.svg           |  134 ++
 .../userspace-api/media/v4l/dev-raw-vbi.rst   |    6 +-
 .../userspace-api/media/v4l/dev-subdev.rst    |  173 ++-
 .../media/v4l/ext-ctrls-camera.rst            |   40 +
 .../media/v4l/ext-ctrls-image-process.rst     |    4 +
 .../media/v4l/ext-ctrls-image-source.rst      |   34 +
 .../media/v4l/metadata-layouts.rst            |  111 ++
 .../media/v4l/metafmt-generic.rst             |   15 +-
 .../media/v4l/pixfmt-raw-generic.rst          |  398 ++++++
 .../media/v4l/subdev-config-model.rst         |  260 ++++
 .../media/v4l/subdev-formats.rst              |   48 +-
 .../media/v4l/vidioc-subdev-g-routing.rst     |    5 +
 drivers/media/i2c/ccs/ccs-core.c              | 1088 +++++++++++------
 drivers/media/i2c/ccs/ccs-quirk.h             |    7 +
 drivers/media/i2c/ccs/ccs.h                   |   26 +-
 drivers/media/i2c/imx219.c                    |  442 ++++++-
 drivers/media/i2c/ov2740.c                    |  337 +++--
 drivers/media/mc/mc-entity.c                  |   15 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |    8 +
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |   18 +
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |   16 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   13 +
 drivers/media/v4l2-core/v4l2-mc.c             |    4 +
 drivers/media/v4l2-core/v4l2-subdev.c         |   30 -
 include/uapi/linux/media-bus-format.h         |   10 +
 include/uapi/linux/media.h                    |    1 +
 include/uapi/linux/v4l2-controls.h            |   22 +
 include/uapi/linux/v4l2-subdev.h              |    5 +
 include/uapi/linux/videodev2.h                |   24 +-
 33 files changed, 3326 insertions(+), 549 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.dia
 create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.svg
 create mode 100644 Documentation/userspace-api/media/v4l/metadata-layouts.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
 create mode 100644 Documentation/userspace-api/media/v4l/subdev-config-model.rst

-- 
2.39.5


