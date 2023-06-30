Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1601744368
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 22:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbjF3Unt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 16:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbjF3Unr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 16:43:47 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697473C02
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 13:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688157826; x=1719693826;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GTayDQmBl1zDdCctJpk/4LjBxjlF+8AnHOSxJBJtGcs=;
  b=gNX7lbvx1zBVdVNZuEBuq6HaF76sC1jKO3iJBVLwMQUncLof4SzLcnSV
   KGRofCaztmZu2YX1nmVJFrCMBUFMltKPlIMI7yL+20RZ3y1Q2JsbXq3hR
   SBGRW9dMI4Ip6+ZbDvs895gKPxJchD1xnmjSssy7S3ZJhKKXTq5e9p/L4
   xp6j7LIOg3fUwImbVNi019noDyg3i+1OpnXFxhAMQbbjl8/PMIXMDGTeD
   G7PdpIL+AUmuyi592J/P6f3wnBfp0mWMP1VH5/B8YeThztVAr1K8oCALd
   t2ApJxBirVXpMcoKLcuSC+IapcGG+FFW2mGMpZ3q27rPb5rmkRdxqeeHV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="448866683"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="448866683"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 13:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="841987145"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="841987145"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 13:43:44 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 063D61203D3;
        Fri, 30 Jun 2023 23:43:38 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl
Subject: [PATCH 0/7] Generic line based metadata support, internal pads
Date:   Fri, 30 Jun 2023 23:43:31 +0300
Message-Id: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

Here are a few patches to add support generic, line based metadata as well
as internal source pads. While the amount of code is not very large, to
the contrary it is quite small actually IMO, I presume what this is about
and why it is being proposed requires some explaining.

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

<URL:https://lore.kernel.org/linux-media/20230505205416.55002-1-sakari.ailus@linux.intel.com/T/#t>

I've also pushed these here and I'll keep updating the branch:

<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>

Questions and comments are most welcome.

Driver support is to be added, as well as an example.

[1] <URL:https://lore.kernel.org/linux-media/20220831141357.1396081-20-tomi.valkeinen@ideasonboard.com/>

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

Sakari Ailus (7):
  media: mc: Check pad flag validity
  media: mc: Add INTERNAL pad flag
  media: v4l: subdev: Support INTERNAL pads in routing IOCTLs
  media: uapi: v4l: Document source routes
  media: uapi: Add generic serial metadata mbus formats
  media: uapi: Add generic 8-bit metadata format definitions
  media: v4l: Support line-based metadata capture

 .../userspace-api/media/glossary.rst          |   6 +
 .../media/mediactl/media-types.rst            |   6 +
 .../userspace-api/media/v4l/dev-meta.rst      |  15 +
 .../userspace-api/media/v4l/dev-subdev.rst    |  20 ++
 .../userspace-api/media/v4l/meta-formats.rst  |   1 +
 .../media/v4l/metafmt-generic.rst             | 331 ++++++++++++++++++
 .../media/v4l/subdev-formats.rst              | 257 ++++++++++++++
 .../media/v4l/vidioc-enum-fmt.rst             |   7 +
 .../media/videodev2.h.rst.exceptions          |   1 +
 drivers/media/mc/mc-entity.c                  |  17 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |  13 +-
 drivers/media/v4l2-core/v4l2-subdev.c         |   3 +-
 include/uapi/linux/media-bus-format.h         |   9 +
 include/uapi/linux/media.h                    |   1 +
 include/uapi/linux/videodev2.h                |  19 +
 15 files changed, 701 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst

-- 
2.39.2

