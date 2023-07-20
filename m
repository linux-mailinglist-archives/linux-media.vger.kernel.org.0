Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAC4675A837
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 09:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbjGTHvP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 03:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbjGTHvM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 03:51:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4DA2127
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 00:51:04 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39D00842;
        Thu, 20 Jul 2023 09:50:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1689839405;
        bh=1760osyDeoVRX48GfVUxfuL5Dgbd9e8agjqYUQqVQhg=;
        h=From:To:Cc:Subject:Date:From;
        b=Kn1SsaOfwHtx0EzA5KlV01nXLmX432wZuIJ8v9FRnpGj2c7139jPqpQf1KlhsKRHa
         qyviuG2Okl/8llNvAlRR1b3eI7SP3jdhsqUxIklm6Mqe0sKGGeelkAGJ+oVvnpA/bS
         cP9L0+ypQtaOTiDqBg8xK2AvzlnJ14cin4ykA+Ng=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 0/8] v4l-utils: Support multiplexed streams
Date:   Thu, 20 Jul 2023 10:50:36 +0300
Message-Id: <20230720075044.442021-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

v5 can be found from:
https://lore.kernel.org/all/20230529085003.47207-1-tomi.valkeinen@ideasonboard.com/

Changes in v6:
- Use NUM_ROUTES_MAX all around
- Improve the routing test (testSubDevRouting)
- Improve the v4l2-ctl help text for subdev options

Range diff against v5 can be found below.

 Tomi

Tomi Valkeinen (8):
  v4l2-ctl: Improve sub-device options help text
  v4l2-ctl: Add routing and streams support
  media-ctl: Add support for routes and streams
  v4l2-ctl/compliance: Add routing and streams multiplexed streams
  v4l2-ctl/compliance: Add simple routing test
  media-ctl: Check for Streams API support
  utils/common: Set V4L2_SUBDEV_CLIENT_CAP_STREAMS for subdevs
  v4l2-ctl: Check for Streams API support

 utils/common/cv4l-helpers.h                 |   1 +
 utils/common/v4l-helpers.h                  |  18 +
 utils/common/v4l2-info.h                    |   6 +
 utils/media-ctl/libmediactl.c               |  43 +++
 utils/media-ctl/libv4l2subdev.c             | 345 +++++++++++++++++--
 utils/media-ctl/media-ctl.c                 | 113 +++++-
 utils/media-ctl/mediactl-priv.h             |   1 +
 utils/media-ctl/mediactl.h                  |  16 +
 utils/media-ctl/options.c                   |  15 +-
 utils/media-ctl/options.h                   |   1 +
 utils/media-ctl/v4l2subdev.h                |  66 +++-
 utils/v4l2-compliance/v4l2-compliance.cpp   | 132 +++++--
 utils/v4l2-compliance/v4l2-compliance.h     |   9 +-
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 117 ++++++-
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp          | 364 ++++++++++++++++++--
 utils/v4l2-ctl/v4l2-ctl.cpp                 |   2 +
 utils/v4l2-ctl/v4l2-ctl.h                   |   2 +
 17 files changed, 1128 insertions(+), 123 deletions(-)

Range-diff against v5:
-:  -------- > 1:  5b814067 v4l2-ctl: Improve sub-device options help text
1:  129c4dcd ! 2:  8e349ff0 v4l2-ctl: Add routing and streams support
    @@ Commit message
     
         Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
     
    - ## utils/v4l2-ctl/v4l2-ctl-subdev.cpp ##
    + ## utils/common/v4l2-info.h ##
     @@
    - #include "v4l2-ctl.h"
    + #include <linux/videodev2.h>
    + #include <linux/v4l2-subdev.h>
      
    -+#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
    -+
     +/*
     + * The max value comes from a check in the kernel source code
     + * drivers/media/v4l2-core/v4l2-ioctl.c check_array_args()
     + */
     +#define NUM_ROUTES_MAX 256
    ++
    + struct flag_def {
    + 	unsigned flag;
    + 	const char *str;
    +
    + ## utils/v4l2-ctl/v4l2-ctl-subdev.cpp ##
    +@@
    + #include "v4l2-ctl.h"
    + 
    ++#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
     +
      struct mbus_name {
      	const char *name;
    @@ utils/v4l2-ctl/v4l2-ctl-subdev.cpp: static const struct mbus_name mbus_names[] =
      void subdev_usage()
      {
      	printf("\nSub-Device options:\n"
    + 	       "Note: all parameters below (pad, code, etc.) are optional unless otherwise noted and default to 0\n"
     -	       "  --list-subdev-mbus-codes <pad>\n"
    +-	       "                      display supported mediabus codes for this pad\n"
     +	       "  --list-subdev-mbus-codes pad=<pad>,stream=<stream>\n"
    - 	       "                      display supported mediabus codes for this pad (0 is default)\n"
    ++	       "                      display supported mediabus codes for this pad and stream\n"
      	       "                      [VIDIOC_SUBDEV_ENUM_MBUS_CODE]\n"
     -	       "  --list-subdev-framesizes pad=<pad>,code=<code>\n"
    +-	       "                     list supported framesizes for this pad and code\n"
     +	       "  --list-subdev-framesizes pad=<pad>,stream=<stream>,code=<code>\n"
    - 	       "                     list supported framesizes for this pad and code\n"
    ++	       "                     list supported framesizes for this pad, stream and code\n"
      	       "                     [VIDIOC_SUBDEV_ENUM_FRAME_SIZE]\n"
      	       "                     <code> is the value of the mediabus code\n"
     -	       "  --list-subdev-frameintervals pad=<pad>,width=<w>,height=<h>,code=<code>\n"
    +-	       "                     list supported frame intervals for this pad and code and\n"
     +	       "  --list-subdev-frameintervals pad=<pad>,stream=<stream>,width=<w>,height=<h>,code=<code>\n"
    - 	       "                     list supported frame intervals for this pad and code and\n"
    ++	       "                     list supported frame intervals for this pad, stream, code and\n"
      	       "                     the given width and height [VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL]\n"
      	       "                     <code> is the value of the mediabus code\n"
     -	       "  --get-subdev-fmt [<pad>]\n"
     -	       "     		     query the frame format for the given pad [VIDIOC_SUBDEV_G_FMT]\n"
     -	       "  --get-subdev-selection pad=<pad>,target=<target>\n"
     +	       "  --get-subdev-fmt pad=<pad>,stream=<stream>\n"
    -+	       "     		     query the frame format for the given pad and optional stream [VIDIOC_SUBDEV_G_FMT]\n"
    -+	       "		     <pad> the pad to get the format from\n"
    -+	       "		     <stream> the stream to get the format from (0 if not specified)\n"
    ++	       "     		     query the frame format for the given pad and stream [VIDIOC_SUBDEV_G_FMT]\n"
     +	       "  --get-subdev-selection pad=<pad>,stream=<stream>,target=<target>\n"
      	       "                     query the frame selection rectangle [VIDIOC_SUBDEV_G_SELECTION]\n"
      	       "                     See --set-subdev-selection command for the valid <target> values.\n"
    @@ utils/v4l2-ctl/v4l2-ctl-subdev.cpp: static const struct mbus_name mbus_names[] =
     +	       "  --try-subdev-fmt pad=<pad>,stream=<stream>,width=<w>,height=<h>,code=<code>,field=<f>,colorspace=<c>,\n"
      	       "                   xfer=<xf>,ycbcr=<y>,hsv=<hsv>,quantization=<q>\n"
     -	       "                     set the frame format [VIDIOC_SUBDEV_S_FMT]\n"
    -+	       "                     set the frame format for the given pad and optional stream [VIDIOC_SUBDEV_S_FMT]\n"
    ++	       "                     set the frame format for the given pad and stream [VIDIOC_SUBDEV_S_FMT]\n"
     +	       "                     <pad> the pad to get the format from\n"
    -+	       "                     <stream> the stream to get the format from (0 if not specified)\n"
    ++	       "                     <stream> the stream to get the format\n"
      	       "                     <code> is the value of the mediabus code\n"
      	       "                     <f> can be one of the following field layouts:\n"
      	       "                       any, none, top, bottom, interlaced, seq_tb, seq_bt,\n"
2:  335faf8e ! 3:  5977db8f media-ctl: Add support for routes and streams
    @@ utils/media-ctl/libmediactl.c: struct media_pad *media_parse_pad(struct media_de
      {
     
      ## utils/media-ctl/libv4l2subdev.c ##
    +@@
    + #include "tools.h"
    + #include "v4l2subdev.h"
    + 
    ++/*
    ++ * The max value comes from a check in the kernel source code
    ++ * drivers/media/v4l2-core/v4l2-ioctl.c check_array_args()
    ++ */
    ++#define NUM_ROUTES_MAX 256
    ++
    + int v4l2_subdev_open(struct media_entity *entity)
    + {
    + 	if (entity->fd != -1)
     @@ utils/media-ctl/libv4l2subdev.c: void v4l2_subdev_close(struct media_entity *entity)
      }
      
    @@ utils/media-ctl/libv4l2subdev.c: int v4l2_subdev_set_frame_interval(struct media
     +
     +	p++;
     +
    -+	routes = calloc(256, sizeof(routes[0]));
    ++	routes = calloc(NUM_ROUTES_MAX, sizeof(routes[0]));
     +	if (!routes)
     +		return -ENOMEM;
     +
3:  1b4c8839 ! 4:  7af03ced v4l2-ctl/compliance: Add routing and streams multiplexed streams
    @@ utils/v4l2-compliance/v4l2-compliance.cpp: void testNode(struct node &node, stru
      		bool has_source = false;
      		bool has_sink = false;
     +		struct v4l2_subdev_routing sd_routing[2] = {};
    -+		struct v4l2_subdev_route sd_routes[2][256] = {};
    ++		struct v4l2_subdev_route sd_routes[2][NUM_ROUTES_MAX] = {};
     +		bool has_routes = !!(subdevcap.capabilities & V4L2_SUBDEV_CAP_STREAMS);
     +		int ret;
      
    @@ utils/v4l2-compliance/v4l2-compliance.cpp: void testNode(struct node &node, stru
     +
     +				sd_routing[which].which = which;
     +				sd_routing[which].routes = (__u64)sd_routes[which];
    -+				sd_routing[which].num_routes = 256;
    ++				sd_routing[which].num_routes = NUM_ROUTES_MAX;
     +
     +				ret = doioctl(&node, VIDIOC_SUBDEV_G_ROUTING, &sd_routing[which]);
     +				if (ret) {
4:  833caa0b ! 5:  abb2d296 v4l2-ctl/compliance: Add simple routing test
    @@ Metadata
      ## Commit message ##
         v4l2-ctl/compliance: Add simple routing test
     
    -    Add a very simple test for
    -    VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING.
    +    Add a simple test for VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING.
     
         We can't (at least at the moment) really know here what kind of routings
         the driver would accept, but we can test a VIDIOC_SUBDEV_G_ROUTING call,
         followed by a VIDIOC_SUBDEV_S_ROUTING call with the routing we
         received.
     
    +    Additionally, we can check that the returned pads and flags look fine,
    +    and also that setting obviously invalid routing will fail.
    +
         Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
    -    Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
     
      ## utils/v4l2-compliance/v4l2-compliance.cpp ##
     @@ utils/v4l2-compliance/v4l2-compliance.cpp: void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
    @@ utils/v4l2-compliance/v4l2-test-subdevs.cpp: int testSubDevSelection(struct node
     +
     +int testSubDevRouting(struct node *node, unsigned which)
     +{
    ++	const uint32_t all_route_flags_mask = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
     +	struct v4l2_subdev_routing routing = {};
    -+	struct v4l2_subdev_route routes[256] = {};
    ++	struct v4l2_subdev_route routes[NUM_ROUTES_MAX] = {};
    ++	unsigned int i;
    ++	int ret;
     +
     +	routing.which = which;
     +	routing.routes = (__u64)&routes;
    -+	routing.num_routes = 256;
    ++	routing.num_routes = 0;
    ++	memset(routing.reserved, 0xff, sizeof(routing.reserved));
    ++
    ++	/*
    ++	 * First test that G_ROUTING either returns success, or ENOSPC and
    ++	 * updates num_routes.
    ++	 */
    ++
    ++	ret = doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing);
    ++	fail_on_test(ret && ret != ENOSPC);
    ++	fail_on_test(ret == ENOSPC && routing.num_routes == 0);
    ++	fail_on_test(check_0(routing.reserved, sizeof(routing.reserved)));
    ++
    ++	if (routing.num_routes)
    ++		return 0;
     +
    ++	/* Then get the actual routes */
    ++
    ++	routing.num_routes = NUM_ROUTES_MAX;
     +	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing));
     +
    ++	/* Check the validity of route pads and flags */
    ++
    ++	if (node->pads) {
    ++		for (i = 0; i < routing.num_routes; ++i) {
    ++			const struct v4l2_subdev_route *route = &routes[i];
    ++			const struct media_pad_desc *sink;
    ++			const struct media_pad_desc *source;
    ++
    ++			fail_on_test(route->sink_pad >= node->entity.pads);
    ++			fail_on_test(route->source_pad >= node->entity.pads);
    ++
    ++			sink = &node->pads[route->sink_pad];
    ++			source = &node->pads[route->source_pad];
    ++
    ++			fail_on_test(!(sink->flags & MEDIA_PAD_FL_SINK));
    ++			fail_on_test(!(source->flags & MEDIA_PAD_FL_SOURCE));
    ++			fail_on_test(route->flags & ~all_route_flags_mask);
    ++		}
    ++	}
    ++
    ++	/* Set the same routes back, which should always succeed. */
    ++
    ++	memset(routing.reserved, 0xff, sizeof(routing.reserved));
     +	fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_ROUTING, &routing));
    ++	fail_on_test(check_0(routing.reserved, sizeof(routing.reserved)));
    ++
    ++	/* Test setting invalid pads */
    ++
    ++	if (node->pads) {
    ++		for (i = 0; i < routing.num_routes; ++i) {
    ++			struct v4l2_subdev_route *route = &routes[i];
    ++
    ++			route->sink_pad = node->entity.pads + 1;
    ++		}
    ++
    ++		memset(routing.reserved, 0xff, sizeof(routing.reserved));
    ++		fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_ROUTING, &routing) != EINVAL);
    ++		fail_on_test(check_0(routing.reserved, sizeof(routing.reserved)));
    ++	}
     +
     +	return 0;
     +}
5:  25214f41 = 6:  bedf5aa3 media-ctl: Check for Streams API support
6:  c2d70033 = 7:  6e432bea utils/common: Set V4L2_SUBDEV_CLIENT_CAP_STREAMS for subdevs
7:  eb47955d = 8:  05c3e4e6 v4l2-ctl: Check for Streams API support
-- 
2.34.1

