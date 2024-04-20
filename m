Return-Path: <linux-media+bounces-9812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D286E8ABAEC
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 12:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A1481F21B99
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 10:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA3E17BCC;
	Sat, 20 Apr 2024 10:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E0m/xdVg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E322561D
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713607532; cv=none; b=A5XpiYKRcAzVMM+pj7KleNCPuhFqAMtucxFtonRq7JyzKgDWtl6/pacA2kVSH2Qha3/quRUOYBW3bgpmzh8caB1Qw7YVBCYwy8XRTnHtPPROiJ/o0gr0ujYc6bfhunnjx8vHhI+F+FjhOx8NLsv6GiFsyaFRFmboAG/NQTRauak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713607532; c=relaxed/simple;
	bh=zihVfk5iKf23gSxIBf0qYFS1ogp/wJGyQKvA/tYP1vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0DpyfAnpPiwt2PSWRCjYzOUAOrlzByRefM/II8oiBZa1YgSOyB7Ezl67ksJ+KM3ftnYBuXqxDFudosHNPOdRgtjeHHLsrA04yfENbwVpvOqHDVetSxep5znP+xQKucRUP3p9ILMTkcIlOW1QenxwXKRD61G8zRnyXtYvWofd5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E0m/xdVg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74DD61A2;
	Sat, 20 Apr 2024 12:04:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713607477;
	bh=zihVfk5iKf23gSxIBf0qYFS1ogp/wJGyQKvA/tYP1vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E0m/xdVgISNB6YIlq2GX/3DPZkyEqAVTMnMwqNHrJ5OKOKrgoZAq4NF42NWS4XYmW
	 71PoWvgBDgtpvNMrIf8nSVRUyyHqdSYkc7ZCiPCkO5fpfurGiCZ7BsxTlf6N7ZuJw3
	 n4NJ83TierSIzkeWHtd4vmL//nL1sUv5y/G+6iA8=
Date: Sat, 20 Apr 2024 13:05:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 00/46] Generic line based metadata support, internal
 pads
Message-ID: <20240420100518.GA5618@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patches. This is progressing nicely, and I think we
can merge part of this series for v6.10. Patches from 01/46 to 08/46 and
from 11/46 to 17/46 are nearly there, just a few of them will need a new
(and hopefully final) version. You could additionally merge the
CCS-specific patches 18/46 to 24/46 if desired. Some ov2740 rework could
go in too.

The rest of the patches (and in particular 09/46 and 10/46) depend on
internal pads support, which still needs discussions and additional
documentation for raw sensors.

When posting v10, please move 09/46 and 10/46 after 24/46.

On Tue, Apr 16, 2024 at 10:32:33PM +0300, Sakari Ailus wrote:
> Hi folks,
> 
> Here are a few patches to add support generic, line based metadata as well
> as internal pads. While the amount of code is not very large, to the
> contrary it is quite small actually IMO, I presume what this is about and
> why it is being proposed requires some explaining.
> 
> Metadata mbus codes and formats have existed for some time in V4L2. They
> however have been only used by drivers that produce the data itself and
> effectively this metadata has always been statistics of some sort (at
> least when it comes to ISPs). What is different here is that we intend to
> add support for metadata originating from camera sensors.
> 
> Camera sensors produce different kinds of metadata, embedded data (usually
> register address--value pairs used to capture the frame, in a more or less
> sensor specific format), histograms (in a very sensor specific format),
> dark pixels etc. The number of these formats is probably going to be about
> as large as image data formats if not larger, as the image data formats
> are much better standardised but a smaller subset of them will be
> supported by V4L2, at least initially but possibly much more in the long
> run.
> 
> Having this many device specific formats would be a major problem for all
> the other drivers along that pipeline (not to mention the users of those
> drivers), including bridge (e.g. CSI-2 to parallel) but especially CSI-2
> receiver drivers that have DMA: the poor driver developer would not only
> need to know camera sensor specific formats but to choose the specific
> packing of that format suitable for the DMA used by the hardware. It is
> unlikely many of these would ever get tested while being present on the
> driver API. Also adding new sensors with new embedded data formats would
> involve updating all bridge and CSI-2 receiver drivers. I don't expect
> this to be a workable approach.
> 
> Instead what I'm proposing is to use specific metadata formats on the
> sensor devices only, on internal pads (more about those soon) of the
> sensors, only visible in the UAPI, and then generic mbus formats along the
> pipeline and finally generic V4L2 metadata formats on the DMAs (specific
> to bit depth and packing). This would unsnarl the two, defining what data
> there is (specific mbus code) and how that is transported and packed
> (generic mbus codes and V4L2 formats).
> 
> The user space would be required to "know" the path of that data from the
> sensor's internal pad to the V4L2 video node. I do not see this as these
> devices require at least some knowledge of the pipeline, i.e. hardware at
> hand. Separating what the data means and how it is packed may even be
> beneficial: it allows separating code that interprets the data (sensor
> internal mbus code) from the code that accesses it (packing).
> 
> These formats are in practice line based, meaning that there may be
> padding at the end of the line, depending on the bus as well as the DMA.
> If non-line based formats are needed, it is always possible to set the
> "height" field to 1.
> 
> The internal sink pads are an alternative to source routes [1]. The source
> routes were not universally liked and I do have to say I like re-using
> existing interface concepts (pads and everything you can do with pads,
> including access format, selections etc.) wherever it makes sense, instead
> of duplicating functionality.
> 
> Effectively internal sink pads behave mostly just like sink pads, but they
> describe a flow of data that originates from a sub-device instead of
> arriving to a sub-device. The SUBDEV_S_ROUTING IOCTLs are used to enable
> and disable routes from internal sink pads to sub-device's source pads.
> The subdev format IOCTLs are usable, too, so one can find which subdev
> format is available on given internal sink pad.
> 
> I've also pushed these here and I'll keep updating the branch, I've also
> included untested OV2740 patches:
> 
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>
> 
> Questions and comments are most welcome.
> 
> Preliminary media-ctl and yavta patches can be found here:
> 
> <URL:https://git.retiisi.eu/?p=~sailus/yavta.git;a=shortlog;h=refs/heads/metadata>
> <URL:https://git.retiisi.eu/?p=~sailus/v4l-utils.git;a=shortlog;h=refs/heads/metadata>
> 
> I have used IMX219 as an example on routing in a sensor driver in this
> version.
> 
> The patches are on my master branch
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/>.
> 
> [1] <URL:https://lore.kernel.org/linux-media/20220831141357.1396081-20-tomi.valkeinen@ideasonboard.com/>
> 
> since v8:
> 
> - Move the patch adding internal pad flag past the routing API reworks, as
>   well as a few other patches, in order to separate the patches to those
>   that could still be merged for v6.10 (routing changes) and those that
>   couldn't (sensor API related). The patch on the edge is "media: uapi:
>   v4l: subdev: Enable streams API".
> 
> - Include Laurent's two patches to address crop API issues wrt. streams.
> 
> - Add two patches to prepare for CCS driver rework (media: ccs: Move
>   ccs_pm_get_init function up and media: ccs: Rename out label of
>   ccs_start_streaming).
> 
> - Address issues in the ov2740 driver patches (as well as the driver
>   itself), 4 more patches towards the end of the set.
> 
> - Improved generic metadata format names, align with other existing
>   formats.
> 
> - Improved ov2740 embedded data documentation.
> 
> - Reworked streams and camera sensor documentation based on Laurent's
>   comments mainly. In particular, the contradictory concept of internal
>   source pads no longer should exist in the patches.
> 
> - Fixed pad numbering in the CCS example.
> 
> - Fixed S_ROUTING behaviour when len_routes is too small and when
>   S_ROUTING isn't implemented by the driver.
> 
> - Reorder sections in meta-formats.rst alphabetically.
> 
> - Add a note per struct fields that certain struct v4l2_subdev_format are
>   zero for metadata mbus codes.
> 
> - CCS driver patch cleanups.
> 
> - CCS driver metadata width fix for space-efficient embedded data at 16
>   bpp and over.
> 
> - Postpone CCS frame descriptor quirk for now.
> 
> - Use MIPI_CSI2_DT_USER_DEFINED(0) instead of a numerical value for
>   compressed data datatype.
> 
> since v7:
> 
> - Add embedded data support for the ov2740 driver.
> 
> - Add three patches on top, to add an IMMUTABLE flag to source streams
>   when they cannot be disabled.
> 
> - Improved documentation of len_routes and num_routes arguments of
>   [GS]_ROUTING.
> 
> - Remove one inclusion of twice-included media/v4l2-fwnode.h in
>   drivers/media/i2c/ccs/ccs-core.c .
> 
> - Add missing forward declaration of ccs_internal_ops in
>   drivers/media/i2c/ccs/ccs-core.c .
> 
> since v6:
> 
> - Improve embedded data UAPI documentation on camera sensors.
> 
> - Improve wording of stream glossary entry.
> 
> - Improve internal pad flag documentation.
> 
> - Fix definition of "data unit" and remove an extra "only" in INTERNAL pad
>   flag description (1st patch).
> 
> - Use IMX219 driver in examples consistently.
> 
> - Remove the CSI-2 to parallel bridge from the example to simplify the
>   example.
> 
> - Minor rewording of some parts of the routing examples.
> 
> - Rebase on unified sub-device state information access functions:
>   <URL:https://lore.kernel.org/linux-media/20231027095913.1010187-1-sakari.ailus@linux.intel.com/T/#t>
> 
> - In CCS driver, do not maintain current active configuration in driver's
>   device context struct (apart from mbus codes). Rely on sub-device state
>   locking and clean up the code. (Multiple patches towards the end of the
>   set.)
> 
> - Arrange the CCS patches early in the set towards the end of the set.
> 
> - Move the patch enabling streams API to the end of the set.
> 
> - Rework IOCTL argument copying condition for [GS]_ROUTING).
> 
> - Handle copying back routes in S_ROUTING, do not rely on G_ROUTING
>   IOCTL implementation.
> 
> - Rebase on metadata preparation patchset v6:
>   <URL:https://lore.kernel.org/linux-media/20231106121805.1266696-1-sakari.ailus@linux.intel.com/T/#t>.
> 
> since v5:
> 
> - Rebase on new set of preparation patches.
> 
> - Switch CCS driver from s_stream to enable_streams/disable_streams. Keep
>   streaming state information --- the sensor remains in streaming state if
>   any of the streams is enabled.
> 
> - Fix setting mbus code on embedded data in get_frame_desc() op in the CCS
>   driver.
> 
> since v4:
> 
> - Add a patch to acquire two sub-device states that may use the same lock.
> 
> - Add a patch for CCS driver to remove ccs_get_crop_compose() helper.
> 
> - Add a patch for CCS driver moving acquiring and releasing the mutex to
>   the s_stream callback.
> 
> - Add a patch for CCS driver to rely on sub-device state locking using a
>   single driver-provided lock.
> 
> - Fixed calculating minimum number of routes in copying the routes
>   (thanks, Laurent).
> 
> - Moved a label in S_ROUTING handling to make Clang happy (hopefully).
> 
> - Fixed setting emb_data_ctrl register for CCS embedded data support.
> 
> - Rebase on Laurent's cleanup patches.
> 
> - Wrap a few long lines.
> 
> - Write in embedded data documentation sensor drivers generally don't
>   allow configuring it.
> 
> since v3:
> 
> - Separate preparation patches from this set.
> 
> - Add a definition for "Data unit", a pixel that is not image data and use
>   it instead in format documentation.
> 
> - Fix more numbered lists in dev-subdev.rst.
> 
> - Remove a redundant definition for V4L2_META_FMT_GENERIC_CSI2_2_24 ---
>   V4L2_META_FMT_GENERIC_CSI2_12 can be used instead.
> 
> - Use "X" instead of "p" to denote padding in format documentation.
> 
> - Use IMX219 in examples instead of CCS.
> 
> - Document that the generic V4L2 CSI-2 metadata formats use padding
>   defined in CSI-2 spec and packing defined in CCS spec.
> 
> - Add patches to align [GS]_ROUTING behaviour with V4L2. This means mainly
>   returning configured routes as part of S_ROUTING as well. "len_routes"
>   field is added to denote the length of the array and having more routes
>   than fits in the array is no longer an error. Also added more reserved
>   fields.
> 
> - Added trivial support for S_ROUTING (via G_ROUTING implementation) for
>   use in drivers with static-only routes.
> 
> - Added helper functions to obtain mbus format as well as crop and compose
>   rectangles that are streams-independent.
> 
> - Added a patch to define generic CSI-2 long packet types.
> 
> - Removed MEDIA_BUS_FMT_IS_META() macro. It didn't seem useful in the end.
> 
> - Use a single CCS embedded data format. The bit depth can be selected
>   using the meta stream on the source pad.
> 
> - Fix mbus code numbers (there were holes due to removed redundant
>   formats).
> 
> - Fix generic mbus code documentation (byte was being used instead of
>   bit).
> 
> - Fix spelling of "length".
> 
> - Added a patch to remove v4l2_subdev_enable_streams_api that disables
>   streams API. This should be merged once libcamera support for streams
>   works nicely.
> 
> - Don't use strings in printing frame descriptor flags.
> 
> - Warn on string truncation in printing frame descriptor.
> 
> since v2:
> 
> - Add a better example, with formats.
> 
> - Add CCS static data media bus codes.
> 
> - Added an example demonstrating the use of internal pads. --- Is the
>   level of detail enough for the purpose?
> 
> - Improved documentation.
> 
> - Added a macro to tell whether a format is a metadata format.
>   (Documentation could be added.)
> 
> - A small ReST syntax fix in the same section.
> 
> - Drop leftovers of a patch checking for the INTERNAL_SOURCE flag.
> 
> since v1:
> 
> - Make the new pad flag just "INTERNAL", requiring either SINK or SOURCE
>   pad flag to accompany it. Removed the union in struct v4l2_subdev_route.
> 
> - Add the term "stream" to MC glossary.
> 
> - Improved and fixed documentation (according to comments).
> 
> - Note these formats are little endian.
> 
> - Remove 1X8 from the names of the mbus codes. These formats have generally
>   8 bits per pixel.
> 
> - Fix mbus code numbering (had holes in RFC).
> 
> - Add new metadata fields to debug prints.
> 
> - Fix a minor documentation build issue.
> 
> Laurent Pinchart (2):
>   media: v4l2-subdev: Fix stream handling for crop API
>   media: v4l2-subdev: Clearly document that the crop API won't be
>     extended
> 
> Sakari Ailus (44):
>   media: Documentation: Add "stream" into glossary
>   media: uapi: Add generic serial metadata mbus formats
>   media: uapi: Document which mbus format fields are valid for metadata
>   media: uapi: v4l: Add generic 8-bit metadata format definitions
>   media: v4l: Support line-based metadata capture
>   media: Documentation: Additional streams generally don't harm capture
>   media: Documentation: Document embedded data guidelines for camera
>     sensors
>   media: Documentation: v4l: Document internal sink pads
>   media: Documentation: Document S_ROUTING behaviour
>   media: v4l: subdev: Add a function to lock two sub-device states, use
>     it
>   media: v4l: subdev: Move G_ROUTING handling below S_ROUTING
>   media: v4l: subdev: Copy argument back to user also for S_ROUTING
>   media: v4l: subdev: Add len_routes field to struct v4l2_subdev_routing
>   media: v4l: subdev: Return routes set using S_ROUTING
>   media: v4l: subdev: Add trivial set_routing support
>   media: ccs: No need to set streaming to false in power off
>   media: ccs: Move ccs_pm_get_init function up
>   media: ccs: Rename out label of ccs_start_streaming
>   media: ccs: Use {enable,disable}_streams operations
>   media: ccs: Track streaming state
>   media: ccs: Move ccs_validate_csi_data_format up
>   media: ccs: Support frame descriptors
>   media: uapi: v4l: subdev: Enable streams API
>   media: mc: Add INTERNAL pad flag
>   media: uapi: ccs: Add media bus code for MIPI CCS embedded data
>   media: Documentation: Document non-CCS use of CCS embedded data format
>   media: Documentation: ccs: Document routing
>   media: ccs: Add support for embedded data stream
>   media: ccs: Remove ccs_get_crop_compose helper
>   media: ccs: Rely on sub-device state locking
>   media: ccs: Compute binning configuration from sub-device state
>   media: ccs: Compute scaling configuration from sub-device state
>   media: ccs: Remove which parameter from ccs_propagate
>   media: uapi: Add media bus code for ov2740 embedded data
>   media: ov2740: Fix LINK_FREQ and PIXEL_RATE control value reporting
>   media: ov2740: Remove shorthand variables
>   media: ov2740: Switch to {enable,disable}_streams
>   media: ov2740: Track streaming state
>   media: ov2740: Add support for embedded data
>   media: ov2740: Add generic sensor fwnode properties as controls
>   media: ov2740: Add support for G_SELECTION IOCTL
>   media: v4l: Add V4L2_SUBDEV_ROUTE_FL_IMMUTABLE sub-device routing flag
>   media: ccs: Add IMMUTABLE route flag
>   media: ov2740: Add IMMUTABLE route flag
> 
>  .../media/drivers/camera-sensor.rst           |   32 +
>  .../userspace-api/media/drivers/ccs.rst       |   38 +-
>  .../userspace-api/media/glossary.rst          |   15 +
>  .../media/mediactl/media-types.rst            |    9 +
>  .../userspace-api/media/v4l/dev-meta.rst      |   21 +
>  .../userspace-api/media/v4l/dev-subdev.rst    |  179 ++-
>  .../userspace-api/media/v4l/meta-formats.rst  |    3 +-
>  .../media/v4l/metafmt-generic.rst             |  328 +++++
>  .../media/v4l/subdev-formats.rst              |  374 +++++-
>  .../media/v4l/vidioc-enum-fmt.rst             |    7 +
>  .../media/v4l/vidioc-subdev-g-crop.rst        |    6 +-
>  .../media/v4l/vidioc-subdev-g-routing.rst     |   60 +-
>  .../media/videodev2.h.rst.exceptions          |    1 +
>  drivers/media/i2c/ccs/ccs-core.c              | 1050 +++++++++++------
>  drivers/media/i2c/ccs/ccs.h                   |   27 +-
>  drivers/media/i2c/ov2740.c                    |  304 +++--
>  drivers/media/mc/mc-entity.c                  |   15 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   25 +-
>  drivers/media/v4l2-core/v4l2-subdev.c         |  118 +-
>  include/media/v4l2-subdev.h                   |   42 +
>  include/uapi/linux/media-bus-format.h         |   13 +
>  include/uapi/linux/media.h                    |    1 +
>  include/uapi/linux/v4l2-mediabus.h            |   18 +-
>  include/uapi/linux/v4l2-subdev.h              |   18 +-
>  include/uapi/linux/videodev2.h                |   18 +
>  25 files changed, 2183 insertions(+), 539 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst

-- 
Regards,

Laurent Pinchart

