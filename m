Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66EEB7E2154
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbjKFMZz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:25:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231604AbjKFMZw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:25:52 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F82BD
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273547; x=1730809547;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3dEY521b6v/NNDTtgYqsRUSM+SAI8RjZZMcNQkNCSNI=;
  b=FU4Elo4G80lQufVykK/aQS9SXsdVyBdvDq75SK9aSMCQwOWHSBWcHM9T
   mFh6I5jh49O0p3mlwOyT2urJxi2ozMlnN1kCSXljepzQQo+pH11P2lP2v
   N1k81MQw4wFKpmOjjYo18593cKBUa1rtwpfW6LYEz4W1y3Gf8YmWwTRx7
   vlSzNbOqxZBpKLWbBGM5FxOqsNYNr5DpjXZbv7ZGl+SbenJI1yIPggFxE
   AO/fQ/iGM2guMFdcsOHXt+InllzkGUiB6wkD+gVi7X5/7v5cPAMyg00VA
   eI9BGgl3o8O69lALM2VqbKz7GjyXbNOIumiYQvvdsu8SsFOj6DQ1l9xaJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="455747194"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="455747194"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:25:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="797291534"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="797291534"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:25:44 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 39C8211F724;
        Mon,  6 Nov 2023 14:25:40 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v7 00/31] Generic line based metadata support, internal pads
Date:   Mon,  6 Nov 2023 14:25:08 +0200
Message-Id: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

This set depends on these patches:

<URL:https://lore.kernel.org/linux-media/20231002105557.28972-1-sakari.ailus@linux.intel.com/T/#t>

I've also pushed these here and I'll keep updating the branch, I've also
included untested OV2740 patches:

<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>

Questions and comments are most welcome.

Preliminary media-ctl and yavta patches can be found here:

<URL:https://git.retiisi.eu/?p=~sailus/yavta.git;a=shortlog;h=refs/heads/metadata>
<URL:https://git.retiisi.eu/?p=~sailus/v4l-utils.git;a=shortlog;h=refs/heads/metadata>

I have used IMX219 as an example on routing in a sensor driver in this
version. I also hope I can add OV2740 support in the next version after
testing the patches.

[1] <URL:https://lore.kernel.org/linux-media/20220831141357.1396081-20-tomi.valkeinen@ideasonboard.com/>

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

Sakari Ailus (31):
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

 .../media/drivers/camera-sensor.rst           |   29 +
 .../userspace-api/media/drivers/ccs.rst       |   34 +-
 .../userspace-api/media/glossary.rst          |   15 +
 .../media/mediactl/media-types.rst            |    8 +
 .../userspace-api/media/v4l/dev-meta.rst      |   15 +
 .../userspace-api/media/v4l/dev-subdev.rst    |  177 ++-
 .../userspace-api/media/v4l/meta-formats.rst  |    1 +
 .../media/v4l/metafmt-generic.rst             |  304 +++++
 .../media/v4l/subdev-formats.rst              |  288 +++++
 .../media/v4l/vidioc-enum-fmt.rst             |    7 +
 .../media/v4l/vidioc-subdev-g-routing.rst     |   40 +-
 .../media/videodev2.h.rst.exceptions          |    1 +
 drivers/media/i2c/ccs/ccs-core.c              | 1014 +++++++++++------
 drivers/media/i2c/ccs/ccs-quirk.h             |    7 +
 drivers/media/i2c/ccs/ccs.h                   |   27 +-
 drivers/media/mc/mc-entity.c                  |   10 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   25 +-
 drivers/media/v4l2-core/v4l2-subdev.c         |  109 +-
 include/media/v4l2-subdev.h                   |   42 +
 include/uapi/linux/media-bus-format.h         |   12 +
 include/uapi/linux/media.h                    |    1 +
 include/uapi/linux/v4l2-mediabus.h            |   18 +-
 include/uapi/linux/v4l2-subdev.h              |    8 +-
 include/uapi/linux/videodev2.h                |   18 +
 24 files changed, 1784 insertions(+), 426 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst


base-commit: 5b1efab1ccf0358c33605661492bcd478bd3b677
-- 
2.39.2

