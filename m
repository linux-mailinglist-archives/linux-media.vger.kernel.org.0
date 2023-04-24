Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9966EAAB9
	for <lists+linux-media@lfdr.de>; Fri, 21 Apr 2023 14:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbjDUMqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Apr 2023 08:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232098AbjDUMp7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Apr 2023 08:45:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8726A2D56
        for <linux-media@vger.kernel.org>; Fri, 21 Apr 2023 05:45:26 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A1CE127D;
        Fri, 21 Apr 2023 14:44:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682081078;
        bh=ChVWHrJJGQkZp67IwZk8nVzndDVmiDjPx3qEHo301HM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bwWQAweAJMyA1C1GRcgn4OKJnBLtgvkuTgdrgeEwueLlD2A24bPtdkyMBdhIBDjEw
         BsxZtxlwW6MGDv8y6IuCucjQ0SoLIBp1ak43m0npnv+XtOLwbFvPnRIGpUbFxdgotR
         VOIa10A1X3xT1V8tXBCB03tmjq7ssM0DZMorWBXQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 1/8] v4l2-ctl: Add routing and streams support
Date:   Fri, 21 Apr 2023 15:44:21 +0300
Message-Id: <20230421124428.393261-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421124428.393261-1-tomi.valkeinen@ideasonboard.com>
References: <20230421124428.393261-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to get and set subdev routes and to get and set
configurations per stream.

Based on work from Jacopo Mondi <jacopo@jmondi.org> and
Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 310 ++++++++++++++++++++++++++---
 utils/v4l2-ctl/v4l2-ctl.cpp        |   2 +
 utils/v4l2-ctl/v4l2-ctl.h          |   2 +
 3 files changed, 281 insertions(+), 33 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
index 33cc1342..7ab64646 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -1,5 +1,13 @@
 #include "v4l2-ctl.h"
 
+#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
+
+/*
+ * The max value comes from a check in the kernel source code
+ * drivers/media/v4l2-core/v4l2-ioctl.c check_array_args()
+ */
+#define NUM_ROUTES_MAX 256
+
 struct mbus_name {
 	const char *name;
 	__u32 code;
@@ -19,45 +27,57 @@ static const struct mbus_name mbus_names[] = {
 #define SelectionFlags 		(1L<<4)
 
 static __u32 list_mbus_codes_pad;
+static __u32 list_mbus_codes_stream = 0;
 static __u32 get_fmt_pad;
+static __u32 get_fmt_stream = 0;
 static __u32 get_sel_pad;
+static __u32 get_sel_stream = 0;
 static __u32 get_fps_pad;
+static __u32 get_fps_stream = 0;
 static int get_sel_target = -1;
 static unsigned int set_selection;
 static struct v4l2_subdev_selection vsel;
 static unsigned int set_fmt;
 static __u32 set_fmt_pad;
+static __u32 set_fmt_stream = 0;
 static struct v4l2_mbus_framefmt ffmt;
 static struct v4l2_subdev_frame_size_enum frmsize;
 static struct v4l2_subdev_frame_interval_enum frmival;
 static __u32 set_fps_pad;
+static __u32 set_fps_stream = 0;
 static double set_fps;
+static struct v4l2_subdev_routing routing;
+static struct v4l2_subdev_route routes[NUM_ROUTES_MAX];
 
 void subdev_usage()
 {
 	printf("\nSub-Device options:\n"
-	       "  --list-subdev-mbus-codes <pad>\n"
+	       "  --list-subdev-mbus-codes pad=<pad>,stream=<stream>\n"
 	       "                      display supported mediabus codes for this pad (0 is default)\n"
 	       "                      [VIDIOC_SUBDEV_ENUM_MBUS_CODE]\n"
-	       "  --list-subdev-framesizes pad=<pad>,code=<code>\n"
+	       "  --list-subdev-framesizes pad=<pad>,stream=<stream>,code=<code>\n"
 	       "                     list supported framesizes for this pad and code\n"
 	       "                     [VIDIOC_SUBDEV_ENUM_FRAME_SIZE]\n"
 	       "                     <code> is the value of the mediabus code\n"
-	       "  --list-subdev-frameintervals pad=<pad>,width=<w>,height=<h>,code=<code>\n"
+	       "  --list-subdev-frameintervals pad=<pad>,stream=<stream>,width=<w>,height=<h>,code=<code>\n"
 	       "                     list supported frame intervals for this pad and code and\n"
 	       "                     the given width and height [VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL]\n"
 	       "                     <code> is the value of the mediabus code\n"
-	       "  --get-subdev-fmt [<pad>]\n"
-	       "     		     query the frame format for the given pad [VIDIOC_SUBDEV_G_FMT]\n"
-	       "  --get-subdev-selection pad=<pad>,target=<target>\n"
+	       "  --get-subdev-fmt pad=<pad>,stream=<stream>\n"
+	       "     		     query the frame format for the given pad and optional stream [VIDIOC_SUBDEV_G_FMT]\n"
+	       "		     <pad> the pad to get the format from\n"
+	       "		     <stream> the stream to get the format from (0 if not specified)\n"
+	       "  --get-subdev-selection pad=<pad>,stream=<stream>,target=<target>\n"
 	       "                     query the frame selection rectangle [VIDIOC_SUBDEV_G_SELECTION]\n"
 	       "                     See --set-subdev-selection command for the valid <target> values.\n"
-	       "  --get-subdev-fps [<pad>]\n"
+	       "  --get-subdev-fps pad=<pad>,stream=<stream>\n"
 	       "                     query the frame rate [VIDIOC_SUBDEV_G_FRAME_INTERVAL]\n"
 	       "  --set-subdev-fmt   (for testing only, otherwise use media-ctl)\n"
-	       "  --try-subdev-fmt pad=<pad>,width=<w>,height=<h>,code=<code>,field=<f>,colorspace=<c>,\n"
+	       "  --try-subdev-fmt pad=<pad>,stream=<stream>,width=<w>,height=<h>,code=<code>,field=<f>,colorspace=<c>,\n"
 	       "                   xfer=<xf>,ycbcr=<y>,hsv=<hsv>,quantization=<q>\n"
-	       "                     set the frame format [VIDIOC_SUBDEV_S_FMT]\n"
+	       "                     set the frame format for the given pad and optional stream [VIDIOC_SUBDEV_S_FMT]\n"
+	       "                     <pad> the pad to get the format from\n"
+	       "                     <stream> the stream to get the format from (0 if not specified)\n"
 	       "                     <code> is the value of the mediabus code\n"
 	       "                     <f> can be one of the following field layouts:\n"
 	       "                       any, none, top, bottom, interlaced, seq_tb, seq_bt,\n"
@@ -74,31 +94,74 @@ void subdev_usage()
 	       "                     <q> can be one of the following quantization methods:\n"
 	       "                       default, full-range, lim-range\n"
 	       "  --set-subdev-selection (for testing only, otherwise use media-ctl)\n"
-	       "  --try-subdev-selection pad=<pad>,target=<target>,flags=<flags>,\n"
+	       "  --try-subdev-selection pad=<pad>,stream=<stream>,target=<target>,flags=<flags>,\n"
 	       "                         top=<x>,left=<y>,width=<w>,height=<h>\n"
 	       "                     set the video capture selection rectangle [VIDIOC_SUBDEV_S_SELECTION]\n"
 	       "                     target=crop|crop_bounds|crop_default|compose|compose_bounds|\n"
 	       "                            compose_default|compose_padded|native_size\n"
 	       "                     flags=le|ge|keep-config\n"
-	       "  --set-subdev-fps pad=<pad>,fps=<fps> (for testing only, otherwise use media-ctl)\n"
+	       "  --set-subdev-fps pad=<pad>,stream=<stream>,fps=<fps> (for testing only, otherwise use media-ctl)\n"
 	       "                     set the frame rate [VIDIOC_SUBDEV_S_FRAME_INTERVAL]\n"
+	       "  --get-routing      Print the route topology\n"
+	       "  --set-routing <routes>\n"
+	       "                     Comma-separated list of route descriptors to setup\n"
+	       "\n"
+	       "Routes are defined as\n"
+	       "	routes		= route { ',' route } ;\n"
+	       "	route		= sink '->' source '[' flags ']' ;\n"
+	       "	sink		= sink-pad '/' sink-stream ;\n"
+	       "	source		= source-pad '/' source-stream ;\n"
+	       "\n"
+	       "where\n"
+	       "	sink-pad	= Pad numeric identifier for sink\n"
+	       "	sink-stream	= Stream numeric identifier for sink\n"
+	       "	source-pad	= Pad numeric identifier for source\n"
+	       "	source-stream	= Stream numeric identifier for source\n"
+	       "	flags		= Route flags (0: inactive, 1: active)\n"
 	       );
 }
 
 void subdev_cmd(int ch, char *optarg)
 {
 	char *value, *subs;
+	char *endp;
 
 	switch (ch) {
 	case OptListSubDevMBusCodes:
-		if (optarg)
-			list_mbus_codes_pad = strtoul(optarg, nullptr, 0);
+		if (optarg) {
+			/* Legacy pad-only parsing */
+			list_mbus_codes_pad = strtoul(optarg, &endp, 0);
+			if (*endp == 0)
+				break;
+		}
+
+		subs = optarg;
+		while (subs && *subs != '\0') {
+			static constexpr const char *subopts[] = {
+				"pad",
+				"stream",
+				nullptr
+			};
+
+			switch (parse_subopt(&subs, subopts, &value)) {
+			case 0:
+				list_mbus_codes_pad = strtoul(value, nullptr, 0);
+				break;
+			case 1:
+				list_mbus_codes_stream = strtoul(value, nullptr, 0);
+				break;
+			default:
+				subdev_usage();
+				std::exit(EXIT_FAILURE);
+			}
+		}
 		break;
 	case OptListSubDevFrameSizes:
 		subs = optarg;
 		while (*subs != '\0') {
 			static constexpr const char *subopts[] = {
 				"pad",
+				"stream",
 				"code",
 				nullptr
 			};
@@ -108,6 +171,9 @@ void subdev_cmd(int ch, char *optarg)
 				frmsize.pad = strtoul(value, nullptr, 0);
 				break;
 			case 1:
+				frmsize.stream = strtoul(value, nullptr, 0);
+				break;
+			case 2:
 				frmsize.code = strtoul(value, nullptr, 0);
 				break;
 			default:
@@ -121,6 +187,7 @@ void subdev_cmd(int ch, char *optarg)
 		while (*subs != '\0') {
 			static constexpr const char *subopts[] = {
 				"pad",
+				"stream",
 				"code",
 				"width",
 				"height",
@@ -132,12 +199,15 @@ void subdev_cmd(int ch, char *optarg)
 				frmival.pad = strtoul(value, nullptr, 0);
 				break;
 			case 1:
-				frmival.code = strtoul(value, nullptr, 0);
+				frmival.stream = strtoul(value, nullptr, 0);
 				break;
 			case 2:
-				frmival.width = strtoul(value, nullptr, 0);
+				frmival.code = strtoul(value, nullptr, 0);
 				break;
 			case 3:
+				frmival.width = strtoul(value, nullptr, 0);
+				break;
+			case 4:
 				frmival.height = strtoul(value, nullptr, 0);
 				break;
 			default:
@@ -147,14 +217,40 @@ void subdev_cmd(int ch, char *optarg)
 		}
 		break;
 	case OptGetSubDevFormat:
-		if (optarg)
-			get_fmt_pad = strtoul(optarg, nullptr, 0);
+		if (optarg) {
+			/* Legacy pad-only parsing */
+			get_fmt_pad = strtoul(optarg, &endp, 0);
+			if (*endp == 0)
+				break;
+		}
+
+		subs = optarg;
+		while (subs && *subs != '\0') {
+			static constexpr const char *subopts[] = {
+				"pad",
+				"stream",
+				nullptr
+			};
+
+			switch (parse_subopt(&subs, subopts, &value)) {
+			case 0:
+				get_fmt_pad = strtoul(value, nullptr, 0);
+				break;
+			case 1:
+				get_fmt_stream = strtoul(value, nullptr, 0);
+				break;
+			default:
+				subdev_usage();
+				std::exit(EXIT_FAILURE);
+			}
+		}
 		break;
 	case OptGetSubDevSelection:
 		subs = optarg;
 		while (*subs != '\0') {
 			static constexpr const char *subopts[] = {
 				"pad",
+				"stream",
 				"target",
 				nullptr
 			};
@@ -165,6 +261,9 @@ void subdev_cmd(int ch, char *optarg)
 				get_sel_pad = strtoul(value, nullptr, 0);
 				break;
 			case 1:
+				get_sel_stream = strtoul(value, nullptr, 0);
+				break;
+			case 2:
 				if (parse_selection_target(value, target)) {
 					fprintf(stderr, "Unknown selection target\n");
 					subdev_usage();
@@ -179,8 +278,33 @@ void subdev_cmd(int ch, char *optarg)
 		}
 		break;
 	case OptGetSubDevFPS:
-		if (optarg)
-			get_fps_pad = strtoul(optarg, nullptr, 0);
+		if (optarg) {
+			/* Legacy pad-only parsing */
+			get_fps_pad = strtoul(optarg, &endp, 0);
+			if (*endp == 0)
+				break;
+		}
+
+		subs = optarg;
+		while (subs && *subs != '\0') {
+			static constexpr const char *subopts[] = {
+				"pad",
+				"stream",
+				nullptr
+			};
+
+			switch (parse_subopt(&subs, subopts, &value)) {
+			case 0:
+				get_fps_pad = strtoul(value, nullptr, 0);
+				break;
+			case 1:
+				get_fps_stream = strtoul(value, nullptr, 0);
+				break;
+			default:
+				subdev_usage();
+				std::exit(EXIT_FAILURE);
+			}
+		}
 		break;
 	case OptSetSubDevFormat:
 	case OptTrySubDevFormat:
@@ -198,6 +322,7 @@ void subdev_cmd(int ch, char *optarg)
 				"quantization",
 				"xfer",
 				"pad",
+				"stream",
 				nullptr
 			};
 
@@ -244,6 +369,9 @@ void subdev_cmd(int ch, char *optarg)
 			case 9:
 				set_fmt_pad = strtoul(value, nullptr, 0);
 				break;
+			case 10:
+				set_fmt_stream = strtoul(value, nullptr, 0);
+				break;
 			default:
 				fprintf(stderr, "Unknown option\n");
 				subdev_usage();
@@ -264,6 +392,7 @@ void subdev_cmd(int ch, char *optarg)
 				"width",
 				"height",
 				"pad",
+				"stream",
 				nullptr
 			};
 
@@ -298,6 +427,9 @@ void subdev_cmd(int ch, char *optarg)
 			case 6:
 				vsel.pad = strtoul(value, nullptr, 0);
 				break;
+			case 7:
+				vsel.stream = strtoul(value, nullptr, 0);
+				break;
 			default:
 				fprintf(stderr, "Unknown option\n");
 				subdev_usage();
@@ -311,6 +443,7 @@ void subdev_cmd(int ch, char *optarg)
 		while (*subs != '\0') {
 			static constexpr const char *subopts[] = {
 				"pad",
+				"stream",
 				"fps",
 				nullptr
 			};
@@ -320,6 +453,9 @@ void subdev_cmd(int ch, char *optarg)
 				set_fps_pad = strtoul(value, nullptr, 0);
 				break;
 			case 1:
+				set_fps_stream = strtoul(value, nullptr, 0);
+				break;
+			case 2:
 				set_fps = strtod(value, nullptr);
 				break;
 			default:
@@ -329,6 +465,47 @@ void subdev_cmd(int ch, char *optarg)
 			}
 		}
 		break;
+	case OptSetRouting: {
+		struct v4l2_subdev_route *r;
+		char *end, *ref, *tok;
+		unsigned int flags;
+
+		memset(&routing, 0, sizeof(routing));
+		memset(routes, 0, sizeof(routes[0]) * NUM_ROUTES_MAX);
+		routing.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+		routing.num_routes = 0;
+		routing.routes = (__u64)routes;
+
+		if (!optarg)
+			break;
+
+		r = (v4l2_subdev_route *)routing.routes;
+		ref = end = strdup(optarg);
+		while ((tok = strsep(&end, ",")) != NULL) {
+			if (sscanf(tok, "%u/%u -> %u/%u [%u]",
+				   &r->sink_pad, &r->sink_stream,
+				   &r->source_pad, &r->source_stream,
+				   &flags) != 5) {
+				free(ref);
+				fprintf(stderr, "Invalid route information specified\n");
+				subdev_usage();
+				std::exit(EXIT_FAILURE);
+			}
+
+			if (flags & ~(V4L2_SUBDEV_ROUTE_FL_ACTIVE)) {
+				fprintf(stderr, "Invalid route flags specified: %#x\n", flags);
+				subdev_usage();
+				std::exit(EXIT_FAILURE);
+			}
+
+			r->flags = flags;
+
+			r++;
+			routing.num_routes++;
+		}
+		free(ref);
+		break;
+	}
 	default:
 		break;
 	}
@@ -394,6 +571,7 @@ void subdev_set(cv4l_fd &_fd)
 
 		memset(&fmt, 0, sizeof(fmt));
 		fmt.pad = set_fmt_pad;
+		fmt.stream = set_fmt_stream;
 		fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 
 		if (doioctl(fd, VIDIOC_SUBDEV_G_FMT, &fmt) == 0) {
@@ -430,7 +608,7 @@ void subdev_set(cv4l_fd &_fd)
 			else
 				fmt.which = V4L2_SUBDEV_FORMAT_TRY;
 
-			printf("ioctl: VIDIOC_SUBDEV_S_FMT (pad=%u)\n", fmt.pad);
+			printf("ioctl: VIDIOC_SUBDEV_S_FMT (pad=%u,stream=%u)\n", fmt.pad, fmt.stream);
 			ret = doioctl(fd, VIDIOC_SUBDEV_S_FMT, &fmt);
 			if (ret == 0 && (verbose || !options[OptSetSubDevFormat]))
 				print_framefmt(fmt.format);
@@ -441,6 +619,7 @@ void subdev_set(cv4l_fd &_fd)
 
 		memset(&sel, 0, sizeof(sel));
 		sel.pad = vsel.pad;
+		sel.stream = vsel.stream;
 		sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		sel.target = vsel.target;
 
@@ -461,7 +640,7 @@ void subdev_set(cv4l_fd &_fd)
 			else
 				sel.which = V4L2_SUBDEV_FORMAT_TRY;
 
-			printf("ioctl: VIDIOC_SUBDEV_S_SELECTION (pad=%u)\n", sel.pad);
+			printf("ioctl: VIDIOC_SUBDEV_S_SELECTION (pad=%u,stream=%u)\n", sel.pad, sel.stream);
 			int ret = doioctl(fd, VIDIOC_SUBDEV_S_SELECTION, &sel);
 			if (ret == 0 && (verbose || !options[OptSetSubDevSelection]))
 				print_subdev_selection(sel);
@@ -472,6 +651,7 @@ void subdev_set(cv4l_fd &_fd)
 
 		memset(&fival, 0, sizeof(fival));
 		fival.pad = set_fps_pad;
+		fival.stream = set_fps_stream;
 
 		if (set_fps <= 0) {
 			fprintf(stderr, "invalid fps %f\n", set_fps);
@@ -482,7 +662,7 @@ void subdev_set(cv4l_fd &_fd)
 		fival.interval.denominator = static_cast<uint32_t>(set_fps * fival.interval.numerator);
 		printf("Note: --set-subdev-fps is only for testing.\n"
 		       "Normally media-ctl is used to configure the video pipeline.\n");
-		printf("ioctl: VIDIOC_SUBDEV_S_FRAME_INTERVAL (pad=%u)\n", fival.pad);
+		printf("ioctl: VIDIOC_SUBDEV_S_FRAME_INTERVAL (pad=%u,stream=%u)\n", fival.pad, fival.stream);
 		if (doioctl(fd, VIDIOC_SUBDEV_S_FRAME_INTERVAL, &fival) == 0) {
 			if (!fival.interval.denominator || !fival.interval.numerator)
 				printf("\tFrames per second: invalid (%d/%d)\n",
@@ -493,6 +673,55 @@ void subdev_set(cv4l_fd &_fd)
 					fival.interval.denominator, fival.interval.numerator);
 		}
 	}
+	if (options[OptSetRouting]) {
+		if (doioctl(fd, VIDIOC_SUBDEV_S_ROUTING, &routing) == 0)
+			printf("Routing set\n");
+	}
+}
+
+struct flag_name {
+	__u32 flag;
+	const char *name;
+};
+
+static void print_flags(const struct flag_name *flag_names, unsigned int num_entries, __u32 flags)
+{
+	bool first = true;
+	unsigned int i;
+
+	for (i = 0; i < num_entries; i++) {
+		if (!(flags & flag_names[i].flag))
+			continue;
+		if (!first)
+			printf(",");
+		printf("%s", flag_names[i].name);
+		flags &= ~flag_names[i].flag;
+		first = false;
+	}
+
+	if (flags) {
+		if (!first)
+			printf(",");
+		printf("0x%x", flags);
+	}
+}
+
+static void print_routes(const struct v4l2_subdev_routing *r)
+{
+	unsigned int i;
+	struct v4l2_subdev_route *routes = (struct v4l2_subdev_route *)r->routes;
+
+	static const struct flag_name route_flags[] = {
+		{ V4L2_SUBDEV_ROUTE_FL_ACTIVE, "ACTIVE" },
+	};
+
+	for (i = 0; i < r->num_routes; i++) {
+		printf("%d/%d -> %d/%d [",
+		       routes[i].sink_pad, routes[i].sink_stream,
+		       routes[i].source_pad, routes[i].source_stream);
+		print_flags(route_flags, ARRAY_SIZE(route_flags), routes[i].flags);
+		printf("]\n");
+	}
 }
 
 void subdev_get(cv4l_fd &_fd)
@@ -505,8 +734,9 @@ void subdev_get(cv4l_fd &_fd)
 		memset(&fmt, 0, sizeof(fmt));
 		fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		fmt.pad = get_fmt_pad;
+		fmt.stream = get_fmt_stream;
 
-		printf("ioctl: VIDIOC_SUBDEV_G_FMT (pad=%u)\n", fmt.pad);
+		printf("ioctl: VIDIOC_SUBDEV_G_FMT (pad=%u, stream=%u)\n", fmt.pad, fmt.stream);
 		if (doioctl(fd, VIDIOC_SUBDEV_G_FMT, &fmt) == 0)
 			print_framefmt(fmt.format);
 	}
@@ -518,8 +748,9 @@ void subdev_get(cv4l_fd &_fd)
 		memset(&sel, 0, sizeof(sel));
 		sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		sel.pad = get_sel_pad;
+		sel.stream = get_sel_stream;
 
-		printf("ioctl: VIDIOC_SUBDEV_G_SELECTION (pad=%u)\n", sel.pad);
+		printf("ioctl: VIDIOC_SUBDEV_G_SELECTION (pad=%u,stream=%u)\n", sel.pad, sel.stream);
 		if (options[OptAll] || get_sel_target == -1) {
 			while (valid_seltarget_at_idx(idx)) {
 				sel.target = seltarget_at_idx(idx);
@@ -538,8 +769,9 @@ void subdev_get(cv4l_fd &_fd)
 
 		memset(&fival, 0, sizeof(fival));
 		fival.pad = get_fps_pad;
+		fival.stream = get_fps_stream;
 
-		printf("ioctl: VIDIOC_SUBDEV_G_FRAME_INTERVAL (pad=%u)\n", fival.pad);
+		printf("ioctl: VIDIOC_SUBDEV_G_FRAME_INTERVAL (pad=%u,stream=%u)\n", fival.pad, fival.stream);
 		if (doioctl(fd, VIDIOC_SUBDEV_G_FRAME_INTERVAL, &fival) == 0) {
 			if (!fival.interval.denominator || !fival.interval.numerator)
 				printf("\tFrames per second: invalid (%d/%d)\n",
@@ -550,6 +782,17 @@ void subdev_get(cv4l_fd &_fd)
 					fival.interval.denominator, fival.interval.numerator);
 		}
 	}
+
+	if (options[OptGetRouting]) {
+		memset(&routing, 0, sizeof(routing));
+		memset(routes, 0, sizeof(routes[0]) * NUM_ROUTES_MAX);
+		routing.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+		routing.num_routes = NUM_ROUTES_MAX;
+		routing.routes = (__u64)routes;
+
+		if (doioctl(fd, VIDIOC_SUBDEV_G_ROUTING, &routing) == 0)
+			print_routes(&routing);
+	}
 }
 
 static void print_mbus_code(__u32 code)
@@ -566,11 +809,12 @@ static void print_mbus_code(__u32 code)
 		printf("\t0x%04x", code);
 }
 
-static void print_mbus_codes(int fd, __u32 pad)
+static void print_mbus_codes(int fd, __u32 pad, __u32 stream)
 {
 	struct v4l2_subdev_mbus_code_enum mbus_code = {};
 
 	mbus_code.pad = pad;
+	mbus_code.stream = stream;
 	mbus_code.which = V4L2_SUBDEV_FORMAT_TRY;
 
 	for (;;) {
@@ -623,13 +867,13 @@ void subdev_list(cv4l_fd &_fd)
 	int fd = _fd.g_fd();
 
 	if (options[OptListSubDevMBusCodes]) {
-		printf("ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=%u)\n",
-		       list_mbus_codes_pad);
-		print_mbus_codes(fd, list_mbus_codes_pad);
+		printf("ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=%u,stream=%u)\n",
+		       list_mbus_codes_pad, list_mbus_codes_stream);
+		print_mbus_codes(fd, list_mbus_codes_pad, list_mbus_codes_stream);
 	}
 	if (options[OptListSubDevFrameSizes]) {
-		printf("ioctl: VIDIOC_SUBDEV_ENUM_FRAME_SIZE (pad=%u)\n",
-		       frmsize.pad);
+		printf("ioctl: VIDIOC_SUBDEV_ENUM_FRAME_SIZE (pad=%u,stream=%u)\n",
+		       frmsize.pad, frmsize.stream);
 		frmsize.index = 0;
 		frmsize.which = V4L2_SUBDEV_FORMAT_TRY;
 		while (test_ioctl(fd, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &frmsize) >= 0) {
@@ -638,8 +882,8 @@ void subdev_list(cv4l_fd &_fd)
 		}
 	}
 	if (options[OptListSubDevFrameIntervals]) {
-		printf("ioctl: VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL (pad=%u)\n",
-		       frmival.pad);
+		printf("ioctl: VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL (pad=%u,stream=%u)\n",
+		       frmival.pad, frmival.stream);
 		frmival.index = 0;
 		frmival.which = V4L2_SUBDEV_FORMAT_TRY;
 		while (test_ioctl(fd, VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &frmival) >= 0) {
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 8585278f..1cfb50f7 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -64,6 +64,8 @@ static struct option long_options[] = {
 	{"get-fmt-video-out", no_argument, nullptr, OptGetVideoOutFormat},
 	{"set-fmt-video-out", required_argument, nullptr, OptSetVideoOutFormat},
 	{"try-fmt-video-out", required_argument, nullptr, OptTryVideoOutFormat},
+	{"set-routing", required_argument, 0, OptSetRouting},
+	{"get-routing", no_argument, 0, OptGetRouting},
 	{"help", no_argument, nullptr, OptHelp},
 	{"help-tuner", no_argument, nullptr, OptHelpTuner},
 	{"help-io", no_argument, nullptr, OptHelpIO},
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index 8f2726ea..9396c974 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -191,6 +191,8 @@ enum Option {
 	OptInfoEdid,
 	OptShowEdid,
 	OptFixEdidChecksums,
+	OptSetRouting,
+	OptGetRouting,
 	OptFreqSeek,
 	OptEncoderCmd,
 	OptTryEncoderCmd,
-- 
2.34.1

