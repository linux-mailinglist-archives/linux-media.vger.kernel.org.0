Return-Path: <linux-media+bounces-58421-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDK7KRgJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58421-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0663CF471
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40C1D3024021
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C56342CB0;
	Thu,  9 Apr 2026 20:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ssia84bR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFD333BBD2
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765731; cv=none; b=BhJUX8fnu8E36hk3XA4sOMPR5hsX1OvoQEbVtFwWw7V0jL2OU+JfEalRhgXBsxL+z8xEqvLm5K0osS7prCseXu5SSpG99O8w0SsuWX1DqAw/JH4yTXJHIAe7jmeNJJfWm2Gs1cOp6dpGlFA3hKC61SYJNodnlk32s68s7RrV20I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765731; c=relaxed/simple;
	bh=KDq4t9Itq32MsU9YJn/+eK2xbJHgHW8d414Bz1APh7o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H52FuYYq+3OzYnbi79fMrzoawppcfLFFrTkc6UV44TUYrV0IyFvIxq6kknsg3SMWBDwmtIrdIfDWRbHX0QIZBmTaQoHZcpsBb1+4IssP9PEhVj+V/jnlbHG2+YbhMvv4WrMZVkPoibm/AvDb2eKLXoHssmzK8jI4A4+uN8rdbtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ssia84bR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765729; x=1807301729;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KDq4t9Itq32MsU9YJn/+eK2xbJHgHW8d414Bz1APh7o=;
  b=Ssia84bRc28vWPKdX7qeqv6cDd9E1JFLViGkNRobvYmiFshAfmEk8PvT
   1pTKO3W1Lf3HV3GSZ2rkrviBEb46caPQR+0mFr+sO6CPHHqSORll1I2B1
   Mo9FpxVpuamNMaQUxPuIfGXVJ4a3jIIO5iIEt4ZpjsKLAkez76K++35RJ
   gOEGljdAdOFsx7h0DCyY6PM5x1Nlmtb+I8if8y/IaHt1+sNr58wRF/J72
   TDZ/F4V9tFJc7wBCYTrBhLhNoSqXiuRq7yGtMkBOdBsnJMJ/7UJ6ZXwkH
   +A/6MX9KWnSq311nfuUfXRyEwOMSjeStLvPq6sJqfrSZnuf9sWtwhrYVR
   w==;
X-CSE-ConnectionGUID: Ma8mS1UtQbmPvz7RPP05fA==
X-CSE-MsgGUID: /G89av3/TPKVPeMmaBjgjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87409043"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87409043"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:17 -0700
X-CSE-ConnectionGUID: /ohjRpr1RcOPqqJHRydVuw==
X-CSE-MsgGUID: 3v/tZf3sSJ2jUbuCFJEq/A==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:11 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 35D6A121902;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045kg-2M10;
	Thu, 09 Apr 2026 23:15:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v12 00/86] Generic line based metadata support, internal pads
Date: Thu,  9 Apr 2026 23:13:35 +0300
Message-ID: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58421-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxtv.org:url,retiisi.eu:url];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F0663CF471
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

I've tested the patches using the IPU6 / ov2740 pair of drivers as well as
Unicam / imx219.

Questions and comments are most welcome.

Preliminary media-ctl and yavta patches can be found here:

<URL:https://git.retiisi.eu/?p=~sailus/yavta.git;a=shortlog;h=refs/heads/metadata>
<URL:https://git.retiisi.eu/?p=~sailus/v4l-utils.git;a=shortlog;h=refs/heads/metadata>

I have used IMX219 as an example on routing in a sensor driver in this
version.

The patches are on my metadata branch
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/>.

These patches are on top of my metadata preparation set
<20260408153939.969381-1-sakari.ailus@linux.intel.com>, all of these can
be found in the GitWeb URL above.

The documentation build output can be found here:
<URL:https://www.retiisi.eu/~sailus/v4l2/tmp/common-raw/>.

since v11:

- Add a note (patch "media: Documentation: Add a note on Bayer raw mbus
  codes") to document the use of new generic raw formats

- Link to the LINK_FREQ control from the tx-rx driver documentation. 

- Refer to V4L2 fwnode endpoint parsing functions in tx-rx driver
  documentation.

- Rename V4L2_CID_COLOR_PATTERN as V4L2_CID_CFA_PATTERN. This matches
  better with the established use of the terms (CFA in particular).

- Improve and fix references in new camera sensor driver documentation.

- Improve and fix language regarding embedded data in camera sensor driver
  documentation.

- Improve language in routing documentation in dev-subdev.rst.

- Document the IMMUTABLE route flag in routing documentation.

- Add a note in routing documentation that a sub-device may have either
  user-created or static routes.

- Also use IMMUTABLE and STATIC flags in internal pads example.

- Elaborate image and metadata stream dependencies in imx219
  documentation.

- Don't mention selections in sub-device configuration documentation for
  internal pads.

- The source format of the camera sensor is configured using the source
  pad; document this in the Common raw sensor model.

- Move binning factors from camera controls class to image source class
  where they belong.

- Improve description of colour filter array patterns.

- Add that CFA_PATTERN_FLIP is a read-only control.

- Add references to metadata layouts into the metadata layout control.

- Refer to V4L2_METADATA_LAYOUT_OV2740 in ov2740 documentation (not
  V4L2_METADATA_LAYOUT_CCS).

- Note that ov2740 embedded data dpc correction threshold uses bits 9--2.

- Postpone adding 16 and higher bpp generic raw formats until we have a
  user (split into separate patches later in the set).

- Generic 16- and 24-bit format isn't really CSI-2 packed (but appears to
  be big endian) so rename the two accordingly.

- Small but numerous fixes in generic raw image data format documentation.

- Improve documentation of different parts of the pixel array and relation
  of that to the UAPI under common raw sensor model documentation.

- Reword documentation of the compose rectangle in common raw sensor
  model documentation.

- Add crop bounds rectangle to the common raw sensor model to convey the
  bounds of the pixel array. This allows using negative numbers as well.

- Document that the sensor's output format is configured on the source
  pad.

- Add references to relevant controls in generic raw format documentation.

- Introduce V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR sub-device capability
  bit. This bit is set by the userspace to signal support for the common
  raw sensor model and allows supporting common raw sensor model also in
  existing drivers.

- Introduce the static route flag to indicate a route is always present.

- Add new struct v4l2_subdev_client_info as argument to certain pad
  operations in order to support passing information on client
  capabilities to sub-device drivers.

- Added common raw format support to the CCS driver.

- Drop leftover mutex_unlock() in ccs_set_format().

- Fully rely on sub-device state locking in the CCS driver.

- Make METADATA_LAYOUT control read-only.

- Add new controls FRAME_LENGTH_LINES and LINE_LENGTH_PIXELS.

- Don't handle the CFA pattern control in set_ctrl() -- ops is NULL.

- Support the common raw sensor model in imx219:

	- Add support for BINNING_FACTORS, FRAME_LENGTH_LINES and
	  LINE_LENGTH_PIXELS controls.

	- Support both Common Raw Sensor Model and old behaviour,
	  depending on V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR bit. The
	  internal state is the same in both cases but the view to the
	  state and UAPI behaviour differs based on that bit.

	- Keep track of enabled streams; any started stream starts
	  streaming on the sensor.

	- Enumerate only generic raw mbus code on the internal image
	  source pad.

	- Support set_selection for setting analogue crop area.

	- Remove redundant comments in imx219_probe().

- Ipu6 driver changes:

	- Lots of cleanups.

	- Only start streaming on the upstream sub-device when all queues
	  in the pipeline have been set streaming.

	- Use VALIDATE_LATE link flag for links to video nodes.

	- Move streaming control to the CSI-2 driver. Streaming now starts
	  on the upstream sub-device once all participating video nodes
	  have been set streaming.

- Support generic raw formats in the unicam driver.

- Document that common raw sensor model requires implementing
  FRAME_LENGTH_LINES and LINE_LENGTH_PIXELS controls.

since v10:

- Merge a few patches that aren't strictly related to metadata, mostly
  documentation cleanups and improvements.

- Add V4L2_SUBDEV_ROUTE_FL_STATIC, to indicate a route is mutable but
  hardware specific so it remains even if disabled. An example of this are
  embedded data routes on camera sensors. IMMUTABLE implies STATIC.

- Postpone adding formats higher than 14 bpp and remove reference to
  "little endian" for the CSI-2 packed formats. It's not entirely clear
  how the data on higher bit depth formats are laid out in memory. The
  documentation suggests these are in big endian format but that would be
  impractical for CPU processing.

- Add references to controls in flipping documentation in
  subdev-formats.rst.

- Add -ENXIO return code for device specific invalid routing configuration
  and clarify routing error conditions for -EINVAL.

- Add braces for the case in imx219_enum_mbus_code() to make Clang happy.

- Rebase off of mc-streamon set (to my cleanup branch). The problem of
  when to stream on and off still needs to be addressed but I'm looking
  into a different, better integrated approach right now.

- Rename generic metadata formats at bit depths 16 and 24 as it seems
  these have more generic packing than CSI-2.

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

Laurent Pinchart (4):
  media: imx219: Add image stream
  media: imx219: Report internal routes to userspace
  media: imx219: Report streams using frame descriptors
  media: imx219: Add embedded data support

Sakari Ailus (82):
  media: mc: Add INTERNAL pad flag
  media: uapi: Add generic CSI-2 raw pixelformats
  media: uapi: Add new media bus codes for generic raw formats
  media: uapi: Add V4L2_CID_CONFIG_MODEL control
  media: uapi: Add V4L2_CID_CFA_PATTERN for describing color patterns
  media: Documentation: Reference CFA pattern control in pixelformat
    docs
  media: Documentation: Reference CFA_PATTERN control in raw mbus docs
  media: v4l: uapi: Add a control for color pattern flipping effect
  media: Documentation: Reference flipping controls in raw format docs
  media: Documentation: Document raw mbus codes and CFA for cameras
  media: uapi: Add V4L2_CID_METADATA_LAYOUT control
  media: Documentation: Refer to metadata layout in metadata
    documentation
  media: Documentation: v4l: Document internal sink pads
  media: Documentation: Document embedded data guidelines for camera
    sensors
  media: Documentation: Document non-CCS use of CCS embedded data layout
  media: uapi: Correct generic CSI-2 metadata format 4cc
  Revert "media: uapi: v4l: Don't expose generic metadata formats to
    userspace"
  media: v4l: Add V4L2_SUBDEV_ROUTE_FL_IMMUTABLE sub-device routing flag
  media: v4l: Add V4L2_SUBDEV_ROUTE_FL_STATIC sub-device routing flag
  media: Documentation: There are either immutable or mutable routes
  media: Documentation: Document IMMUTABLE and STATIC route flags
  media: Documentation: Add subdev configuration models, raw sensor
    model
  media: v4l2-subdev: Prevent accessing internal pads without STREAMS
    cap
  media: Documentation: Add scaling and post-scaler crop for common raw
  media: uapi: Add MIPI CCS configuration model
  media: uapi: Add V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR
  media: uapi: Add V4L2_CID_BINNING control for binning configuration
  media: uapi: Add controls for sub-sampling configuration
  media: v4l2-mc: Add v4l2_subdev_sensor_fll_llp_set()
  media: Documentation: Add binning and sub-sampling controls
  media: v4l2-subdev: Set STATIC route flag if IMMUTABLE route flag is
    set
  media: uapi: v4l: subdev: Enable streams API
  media: uapi: Add new controls for camera sensor FLL and LLP
  media: uapi: Add binning factor helper macros
  media: Documentation: Document frame controls for common raw sensor
    model
  media: v4l2-ctrl: Improve v4l2_ctrl_g_ctrl{,int64} documentation
  media: Documentation: Add sub-device internal pads example
  media: Documentation: Document streaming behaviour for common raw
    cameras
  media: Documentation: Add a note on Bayer raw mbus codes
  media: v4l2-subdev: Add generic raw formats to
    v4l2_subdev_get_frame_desc
  media: uapi: Add generic CSI-2 raw pixelformats for 16, 20, 24 and 28
    bpp
  media: uapi: Add more media bus codes for generic raw formats
  media: uapi: ccs: Add metadata layout for MIPI CCS embedded data
  media: ccs: Add support for generic raw mbus codes
  media: ccs: Add support for embedded data stream
  media: Documentation: ccs: Document routing
  media: ccs: Add IMMUTABLE and STATIC route flags
  media: uapi: Add metadata layout for ov2740 embedded data
  media: ov2740: Add support for embedded data
  media: ov2740: Add support for generic raw formats
  media: ov2740: Add metadata layout control
  media: ov2740: Add support for G_SELECTION IOCTL
  media: ov2740: Add support for FLL and LLP controls
  media: ov2740: Signal common raw sensor model support
  media: ov2740: Add IMMUTABLE and STATIC route flags
  media: imx219: Add internal pads, routes for common raw sensor model
  media: imx219: Add support for generic raw formats
  media: imx219: Add V4L2_CID_BINNING_FACTORS
  media: imx219: Allow configuring cropping and binning through CRSM
  media: imx219: Support LINE_LENGTH_PIXELS and FRAME_LENGTH_LINES
    controls
  media: ipu6: Add support for raw CFA-agnostic formats
  media: ipu6: Use VALIDATE_LATE flag to postpone V4L2 format validation
  media: ipu6: Move streaming control to CSI-2 receiver driver
  media: ipu6: Stream number on CSI-2 receiver source pads is always 0
  media: ipu6: Rename misnamed out_free_watermark label in video init
  media: ipu6: Always request a capture ack
  media: ipu6: Clean up link frequency calculation
  media: ipu6: Get watermark configuration directly from ipdata
  media: ipu6: Collect IPU streams into CSI-2 receiver sub-device
    context
  media: ipu6: Start streaming once all queues have started, stop when
    not
  media: ipu6: Add lockdep checks for CSI-2 streaming enable and disable
  media: ipu6: Remove nr_queues and nr_streaming fields in
    ipu6_isys_stream
  media: ipu6: Collect enabled stream IDs
  media: ipu6: Avoid accessing av->streams before streaming
  media: ipu6: Rework watermark calculation
  media: ipu6: Rework watermark setting
  media: ipu6: Bridge the gap between streams in V4L2 and IPU6 firmware
  media: ipu6: Drop {get,put}_streams_opened()
  media: ipu6: Serialise access to stream pointers by isys stream_lock
  media: ipu6: Move firmware init/cleanup to RPM callbacks
  media: ipu6: Don't track power status, rely on runtime PM
  media: bcm2835-unicam: Support generic raw formats

 .../driver-api/media/camera-sensor.rst        |  11 +
 .../media/drivers/camera-sensor.rst           |  79 ++
 .../userspace-api/media/drivers/ccs.rst       |  43 +-
 .../media/mediactl/media-types.rst            |   8 +
 .../media/v4l/common-raw-sensor.dia           | 442 ++++++++++
 .../media/v4l/common-raw-sensor.svg           | 134 +++
 .../userspace-api/media/v4l/dev-subdev.rst    | 178 +++-
 .../media/v4l/ext-ctrls-image-process.rst     |   6 +
 .../media/v4l/ext-ctrls-image-source.rst      | 133 +++
 .../userspace-api/media/v4l/meta-formats.rst  |   1 +
 .../media/v4l/metadata-layouts.rst            | 114 +++
 .../media/v4l/metafmt-generic.rst             |  48 +-
 .../media/v4l/pixfmt-raw-generic.rst          | 383 +++++++++
 .../userspace-api/media/v4l/pixfmt.rst        |   1 +
 .../media/v4l/subdev-config-model.rst         | 301 +++++++
 .../media/v4l/subdev-formats.rst              |  48 ++
 .../media/v4l/vidioc-subdev-g-client-cap.rst  |   6 +
 .../media/v4l/vidioc-subdev-g-routing.rst     |   9 +
 drivers/media/i2c/ccs/ccs-core.c              | 398 ++++++++-
 drivers/media/i2c/ccs/ccs.h                   |  17 +-
 drivers/media/i2c/imx219.c                    | 797 +++++++++++++++---
 drivers/media/i2c/ov2740.c                    | 379 +++++++--
 drivers/media/mc/mc-entity.c                  |  15 +-
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |   5 -
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 269 ++++--
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   9 +
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 125 +--
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   2 +
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |  25 +-
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |   2 +
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 707 +++++-----------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  42 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 261 +++---
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  50 +-
 .../media/platform/broadcom/bcm2835-unicam.c  |  27 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  21 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  16 +-
 drivers/media/v4l2-core/v4l2-mc.c             |  67 ++
 drivers/media/v4l2-core/v4l2-subdev.c         |  83 +-
 include/media/v4l2-ctrls.h                    |   4 +
 include/media/v4l2-mc.h                       |   8 +
 include/uapi/linux/media-bus-format.h         |  10 +
 include/uapi/linux/media.h                    |   1 +
 include/uapi/linux/v4l2-controls.h            |  33 +
 include/uapi/linux/v4l2-subdev.h              |  15 +
 include/uapi/linux/videodev2.h                |  24 +-
 46 files changed, 4165 insertions(+), 1192 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.dia
 create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.svg
 create mode 100644 Documentation/userspace-api/media/v4l/metadata-layouts.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
 create mode 100644 Documentation/userspace-api/media/v4l/subdev-config-model.rst


base-commit: 1921001887975f465397b3b5ed2535114d9a475c
-- 
2.47.3


