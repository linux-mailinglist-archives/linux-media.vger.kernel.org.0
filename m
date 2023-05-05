Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 534C66F8BA3
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 23:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbjEEVxG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 17:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjEEVxE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 17:53:04 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4424C20
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 14:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683323583; x=1714859583;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KR+HWahDtAv5SGifHA6lBvmuSXnZao7mKUZmNHpnx7k=;
  b=jqYavytXtjI0aoxxo8wTXzO1KkY8sGsLDUJ8rs8wfVgBP5g7MePVFYZu
   Ktino9MNVjwAuNWk/AACqwqfOsn2Zfgs7YlkN2nX/2y+/r29XjF4fm1fa
   cWerlqVKvDP0NMq+KjOJCueQ9zv2DsOJK9eMhoErw9rJPaIc93jYFZGk2
   EPUXdrF7S9e6i/+75cXl3gYfbbNkw5zYTljD8VaVbbL60579GRk9YXQDq
   g1QYFJerK9yV29ypnpQlOr9E9025cuVszHQwXL8w57CHb5z0mPsAXQUEE
   yT+CPW3akO7whZP8QacAXZ2H+QKZzjEfMdBIqOxg+0cDMxfuAFMonS144
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="328925830"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="328925830"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 14:53:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="700626113"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="700626113"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 14:53:01 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 63FCB121354;
        Sat,  6 May 2023 00:52:58 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: [RFC 0/7] Generic line based metadata support, internal pads
Date:   Sat,  6 May 2023 00:52:50 +0300
Message-Id: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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


[1] <URL:https://lore.kernel.org/linux-media/20220831141357.1396081-20-tomi.valkeinen@ideasonboard.com/>

Sakari Ailus (7):
  media: mc: Add INTERNAL_SOURCE pad type flag
  media: v4l: subdev: Support INTERNAL_SOURCE pads in routing IOCTLs
  media: uapi: v4l: Document source routes
  media: mc: Check pad flag validity
  media: uapi: Add generic serial metadata mbus formats
  media: uapi: Add generic 8-bit metadata format definitions
  media: v4l: Support line-based metadata capture

 .../media/mediactl/media-types.rst            |   7 +
 .../userspace-api/media/v4l/dev-meta.rst      |  15 +
 .../userspace-api/media/v4l/dev-subdev.rst    |  18 +
 .../userspace-api/media/v4l/meta-formats.rst  |   1 +
 .../media/v4l/metafmt-generic.rst             | 317 ++++++++++++++++++
 .../media/v4l/subdev-formats.rst              | 257 ++++++++++++++
 .../media/v4l/vidioc-enum-fmt.rst             |   7 +
 .../media/v4l/vidioc-subdev-g-routing.rst     |   5 +
 drivers/media/mc/mc-entity.c                  |  20 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   8 +
 drivers/media/v4l2-core/v4l2-subdev.c         |   6 +-
 include/uapi/linux/media-bus-format.h         |   9 +
 include/uapi/linux/media.h                    |   1 +
 include/uapi/linux/v4l2-subdev.h              |   6 +-
 include/uapi/linux/videodev2.h                |  19 ++
 15 files changed, 691 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst

-- 
2.30.2

