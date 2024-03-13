Return-Path: <linux-media+bounces-6937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 234E287A368
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB5FD2834F3
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A162F168D2;
	Wed, 13 Mar 2024 07:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BCBhMmvS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02D612B6F
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314728; cv=none; b=mpz+8B8/RsW7gbLyMcA5b6ioonhIt1q6r9SP3BYai7JZWAHpzadR793Lj59Zf0iLJriYpMSsB/RrZfABS9UHRvkMVpFZoPb341zWtHqUPiSq/TZWGveDYJoga0+OH1EoR6sh5gMAvnNciKuxIjJfbn/ZRN5G7wBAODYXIieFv80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314728; c=relaxed/simple;
	bh=TR9Is8VLawKkTzPkvyPsbGcrXfu18qvce+Yx5jDrQos=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cqDbAbmu92FPS08gq4Ao6gINFs9bi/ZMiYylROq46Pfq1KedPTOhOf+BzsD3M+a3QGD0QJL/sHBqtRFCBzXUUrL8SOVyfrYKb2vWQn0zPnL1uF5eYIzwNVgwAiORMMcQTkpWruWyiAWM3luGhMnqt6GtW3Esoeyjed9uId4K0sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BCBhMmvS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314726; x=1741850726;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TR9Is8VLawKkTzPkvyPsbGcrXfu18qvce+Yx5jDrQos=;
  b=BCBhMmvSkmMlghbZTTEhRvucA5TeV7GDWTP8xnK0/Oso+3Qwbp7n3KCH
   8T8bxr6IEOBfyj0b03Z8eOuZHzCEcBno4ZygjxLB6ciBfoPXN4zQLN6wH
   /kqJ0FQ/i9TghAj2+fXIqywBM3kkXHIwRLH9LAj7R3YV8RHp4cQE4EwTI
   EQ4n+9Jq/RIepF/bSOppruNsJ6QRro8Ra+y+Sh8lv8eBBO4DTfPmiSCKq
   tcb7LnUjrENjCbL9dcgRG/pxCSIQ7gq/3Thw5SituRmMbyENNW7LZHEig
   tUALGlh9Cs5kJmWKN6nj3lWUbKk0AS/75pRjB/qG9rIkGCErQwCXTq5b+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5231320"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5231320"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16476054"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:22 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7D3A611F853;
	Wed, 13 Mar 2024 09:25:17 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v8 00/38] Generic line based metadata support, internal pads
Date: Wed, 13 Mar 2024 09:24:38 +0200
Message-Id: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Here are a few patches to add support generic, line based metadata as well
as internal pads. While the amount of code is not very large, to the
contrary it is quite small actually IMO, I presume what this is about and
why it is being proposed requires some explaining.

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

Instead what I'm proposing is to use specific metadata formats on the
sensor devices only, on internal pads (more about those soon) of the
sensors, only visible in the UAPI, and then generic mbus formats along the
pipeline and finally generic V4L2 metadata formats on the DMAs (specific
to bit depth and packing). This would unsnarl the two, defining what data
there is (specific mbus code) and how that is transported and packed
(generic mbus codes and V4L2 formats).

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

The internal (source) pads are an alternative to source routes [1]. The
source routes were not universally liked and I do have to say I like
re-using existing interface concepts (pads and everything you can do with
pads, including access format, selections etc.) wherever it makes sense,
instead of duplicating functionality.

Effectively internal source pads behave mostly just like sink pads, but
they describe a flow of data that originates from a sub-device instead of
arriving to a sub-device. The SUBDEV_S_ROUTING IOCTLs are used to enable
and disable routes from internal source pads to sub-device's source pads.
The subdev format IOCTLs are usable, too, so one can find which subdev
format is available on given internal source pad.

I've also pushed these here and I'll keep updating the branch, I've also
included untested OV2740 patches:

<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>

Questions and comments are most welcome.

Preliminary media-ctl and yavta patches can be found here:

<URL:https://git.retiisi.eu/?p=~sailus/yavta.git;a=shortlog;h=refs/heads/metadata>
<URL:https://git.retiisi.eu/?p=~sailus/v4l-utils.git;a=shortlog;h=refs/heads/metadata>

I have used IMX219 as an example on routing in a sensor driver in this
version.

The patches are on my master branch
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/>.

[1] <URL:https://lore.kernel.org/linux-media/20220831141357.1396081-20-tomi.valkeinen@ideasonboard.com/>

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

Sakari Ailus (38):
  media: mc: Add INTERNAL pad flag
  media: Documentation: Add "stream" into glossary
  media: uapi: Add generic serial metadata mbus formats
  media: uapi: Document which mbus format fields are valid for metadata
  media: uapi: Add generic 8-bit metadata format definitions
  media: v4l: Support line-based metadata capture
  media: Documentation: Additional streams generally don't harm capture
  media: Documentation: Document embedded data guidelines for camera
    sensors
  media: Documentation: v4l: Document internal source pads
  media: Documentation: Document S_ROUTING behaviour
  media: v4l: subdev: Add a function to lock two sub-device states, use
    it
  media: v4l: subdev: Move G_ROUTING handling below S_ROUTING
  media: v4l: subdev: Copy argument back to user also for S_ROUTING
  media: v4l: subdev: Add len_routes field to struct v4l2_subdev_routing
  media: v4l: subdev: Return routes set using S_ROUTING
  media: v4l: subdev: Allow a larger number of routes than there's room
    for
  media: v4l: subdev: Add trivial set_routing support
  media: ccs: No need to set streaming to false in power off
  media: ccs: Use {enable,disable}_streams operations
  media: ccs: Track streaming state
  media: ccs: Move ccs_validate_csi_data_format up
  media: ccs: Support frame descriptors
  media: uapi: ccs: Add media bus code for MIPI CCS embedded data
  media: ccs: Add support for embedded data stream
  media: ccs: Remove ccs_get_crop_compose helper
  media: ccs: Rely on sub-device state locking
  media: ccs: Compute binning configuration from sub-device state
  media: ccs: Compute scaling configuration from sub-device state
  media: ccs: Remove which parameter from ccs_propagate
  media: Documentation: ccs: Document routing
  media: uapi: v4l: subdev: Enable streams API
  media: uapi: Add media bus code for ov2740 embedded data
  media: ov2740: Switch to {enable,disable}_streams
  media: ov2740: Track streaming state
  media: ov2740: Add support for embedded data
  media: v4l: Add V4L2_SUBDEV_ROUTE_FL_IMMUTABLE sub-device routing flag
  media: ccs: Add IMMUTABLE route flag
  media: ov2740: Add IMMUTABLE route flag

 .../media/drivers/camera-sensor.rst           |   29 +
 .../userspace-api/media/drivers/ccs.rst       |   34 +-
 .../userspace-api/media/glossary.rst          |   15 +
 .../media/mediactl/media-types.rst            |    8 +
 .../userspace-api/media/v4l/dev-meta.rst      |   15 +
 .../userspace-api/media/v4l/dev-subdev.rst    |  178 ++-
 .../userspace-api/media/v4l/meta-formats.rst  |    1 +
 .../media/v4l/metafmt-generic.rst             |  304 +++++
 .../media/v4l/subdev-formats.rst              |  354 ++++++
 .../media/v4l/vidioc-enum-fmt.rst             |    7 +
 .../media/v4l/vidioc-subdev-g-routing.rst     |   47 +-
 .../media/videodev2.h.rst.exceptions          |    1 +
 drivers/media/i2c/ccs/ccs-core.c              | 1033 +++++++++++------
 drivers/media/i2c/ccs/ccs-quirk.h             |    7 +
 drivers/media/i2c/ccs/ccs.h                   |   27 +-
 drivers/media/i2c/ov2740.c                    |  234 +++-
 drivers/media/mc/mc-entity.c                  |   10 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   25 +-
 drivers/media/v4l2-core/v4l2-subdev.c         |  116 +-
 include/media/v4l2-subdev.h                   |   42 +
 include/uapi/linux/media-bus-format.h         |   13 +
 include/uapi/linux/media.h                    |    1 +
 include/uapi/linux/v4l2-mediabus.h            |   18 +-
 include/uapi/linux/v4l2-subdev.h              |   14 +-
 include/uapi/linux/videodev2.h                |   18 +
 25 files changed, 2062 insertions(+), 489 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst


base-commit: 10ca30599cad9d577bb3f4003c74ed2000a7693e
-- 
2.39.2


