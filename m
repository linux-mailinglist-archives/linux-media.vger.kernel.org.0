Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E405773D25
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 18:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232129AbjHHQOZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 12:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232137AbjHHQNL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 12:13:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3613C04
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 08:47:13 -0700 (PDT)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11FB711A9;
        Tue,  8 Aug 2023 08:18:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691475526;
        bh=T1GjWaxrrH5i5nchvcRSkamrGPfH9v2sa8aAXXl84II=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=MsBl/yeXijIiYg2GnxyMxsAOIgAVy8hayYrFcU9eJw2y+P/QSDhO7xudKYnxowhdc
         RLMU4ir0ewDfm4acsWNq4xmM7+5ufTk0ewZk0XzBarp6kdo/lbVbvOx6okUAJ3thbm
         5UHzF1iDmP2i7Nz4b9E9/gQAdtLM5yLuHpKNY9Gw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date:   Tue, 08 Aug 2023 09:19:21 +0300
Subject: [PATCH v7 2/8] v4l2-ctl: Add routing and streams support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230808-streams-support-v7-2-bd0b42a5826d@ideasonboard.com>
References: <20230808-streams-support-v7-0-bd0b42a5826d@ideasonboard.com>
In-Reply-To: <20230808-streams-support-v7-0-bd0b42a5826d@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=22636;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=T1GjWaxrrH5i5nchvcRSkamrGPfH9v2sa8aAXXl84II=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk0d6F8pkytbr/s6QikgYDfft9kikPWcEdpGkQG
 BEKdfeoBK2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZNHehQAKCRD6PaqMvJYe
 9Z4pD/0ZXtXKFJ5LDh4+Krk/LXOl5dpRv5oCrUz+G8vg19OvILpFB7H/nwGnaOcZo6XolQxXccu
 hKhkrAyKj2t2Fge9U3okRv/K+QoKvZ0pvxW/COaCJlXF0PA4XIefT+VhPzYtLAB35AcjxHPqA6h
 jJTqwE+sLrNt8wAn323KV8Az79lXOzd+ZRpQPPo1o1tYebQ0HQ4s34YRJD+2dJxgO/R4haTYX4s
 VB1sQ2Qj/Q8ZWOahayiiThrdv0NJENtu3nI5sLTxXNuE1cEVEsOcsShuGsxqLRFJ/10ymAKv4Z/
 gj3Id55KdOmYFbZtskeK0zebIVfCGlUHEZi+nNBFtATrm1TIBVOgjy1ul05ri1QoAKY+bZVJYnK
 UKbuXlxU1pr+gLsbdpJZEjEmaqTFQAFyJDe9EAMebOZZP2eYe7WI4z0eet+lWQw8Vm9GVGGApek
 g0KmU5bIKKTsFz0pnRkb/Mio6dFudJs/a7kl2RuDg09f6f6/RPZ53elvS8ZCsJQ+jbuoHnq4n6z
 rp2ep/EklJiGFQnjLuGOCKGI4HNeHC0iIIqouVL2LFdkPu6RjJ9BDAY9sEsafotoquEZn/infTS
 nc3JA7nfyaNts64yffwRvZojCx5N+1JfQOgnJB0ko/W1L07AwUp28sK2oNPqe7p49e8l/Pidsiv
 vLasz0yQG56vcTw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
 utils/common/v4l2-info.h           |   6 +
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 308 ++++++++++++++++++++++++++++++++-----
 utils/v4l2-ctl/v4l2-ctl.cpp        |   2 +
 utils/v4l2-ctl/v4l2-ctl.h          |   2 +
 4 files changed, 282 insertions(+), 36 deletions(-)

diff --git a/utils/common/v4l2-info.h b/utils/common/v4l2-info.h
index 4a9aa3e8..6de5654c 100644
--- a/utils/common/v4l2-info.h
+++ b/utils/common/v4l2-info.h
@@ -11,6 +11,12 @@
 #include <linux/videodev2.h>
 #include <linux/v4l2-subdev.h>
 
+/*
+ * The max value comes from a check in the kernel source code
+ * drivers/media/v4l2-core/v4l2-ioctl.c check_array_args()
+ */
+#define NUM_ROUTES_MAX 256
+
 struct flag_def {
 	unsigned flag;
 	const char *str;
diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
index 22fd9052..d906b72d 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -1,5 +1,7 @@
 #include "v4l2-ctl.h"
 
+#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
+
 struct mbus_name {
 	const char *name;
 	__u32 code;
@@ -19,46 +21,56 @@ static const struct mbus_name mbus_names[] = {
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
 	       "Note: all parameters below (pad, code, etc.) are optional unless otherwise noted and default to 0\n"
-	       "  --list-subdev-mbus-codes <pad>\n"
-	       "                      display supported mediabus codes for this pad\n"
+	       "  --list-subdev-mbus-codes pad=<pad>,stream=<stream>\n"
+	       "                      display supported mediabus codes for this pad and stream\n"
 	       "                      [VIDIOC_SUBDEV_ENUM_MBUS_CODE]\n"
-	       "  --list-subdev-framesizes pad=<pad>,code=<code>\n"
-	       "                     list supported framesizes for this pad and code\n"
+	       "  --list-subdev-framesizes pad=<pad>,stream=<stream>,code=<code>\n"
+	       "                     list supported framesizes for this pad, stream and code\n"
 	       "                     [VIDIOC_SUBDEV_ENUM_FRAME_SIZE]\n"
 	       "                     <code> is the value of the mediabus code\n"
-	       "  --list-subdev-frameintervals pad=<pad>,width=<w>,height=<h>,code=<code>\n"
-	       "                     list supported frame intervals for this pad and code and\n"
+	       "  --list-subdev-frameintervals pad=<pad>,stream=<stream>,width=<w>,height=<h>,code=<code>\n"
+	       "                     list supported frame intervals for this pad, stream, code and\n"
 	       "                     the given width and height [VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL]\n"
 	       "                     <code> is the value of the mediabus code\n"
-	       "  --get-subdev-fmt [<pad>]\n"
-	       "     		     query the frame format for the given pad [VIDIOC_SUBDEV_G_FMT]\n"
-	       "  --get-subdev-selection pad=<pad>,target=<target>\n"
+	       "  --get-subdev-fmt pad=<pad>,stream=<stream>\n"
+	       "     		     query the frame format for the given pad and stream [VIDIOC_SUBDEV_G_FMT]\n"
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
+	       "                     set the frame format for the given pad and stream [VIDIOC_SUBDEV_S_FMT]\n"
+	       "                     <pad> the pad to get the format from\n"
+	       "                     <stream> the stream to get the format\n"
 	       "                     <code> is the value of the mediabus code\n"
 	       "                     <f> can be one of the following field layouts:\n"
 	       "                       any, none, top, bottom, interlaced, seq_tb, seq_bt,\n"
@@ -75,31 +87,74 @@ void subdev_usage()
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
@@ -109,6 +164,9 @@ void subdev_cmd(int ch, char *optarg)
 				frmsize.pad = strtoul(value, nullptr, 0);
 				break;
 			case 1:
+				frmsize.stream = strtoul(value, nullptr, 0);
+				break;
+			case 2:
 				frmsize.code = strtoul(value, nullptr, 0);
 				break;
 			default:
@@ -122,6 +180,7 @@ void subdev_cmd(int ch, char *optarg)
 		while (*subs != '\0') {
 			static constexpr const char *subopts[] = {
 				"pad",
+				"stream",
 				"code",
 				"width",
 				"height",
@@ -133,12 +192,15 @@ void subdev_cmd(int ch, char *optarg)
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
@@ -148,14 +210,40 @@ void subdev_cmd(int ch, char *optarg)
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
@@ -166,6 +254,9 @@ void subdev_cmd(int ch, char *optarg)
 				get_sel_pad = strtoul(value, nullptr, 0);
 				break;
 			case 1:
+				get_sel_stream = strtoul(value, nullptr, 0);
+				break;
+			case 2:
 				if (parse_selection_target(value, target)) {
 					fprintf(stderr, "Unknown selection target\n");
 					subdev_usage();
@@ -180,8 +271,33 @@ void subdev_cmd(int ch, char *optarg)
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
@@ -199,6 +315,7 @@ void subdev_cmd(int ch, char *optarg)
 				"quantization",
 				"xfer",
 				"pad",
+				"stream",
 				nullptr
 			};
 
@@ -245,6 +362,9 @@ void subdev_cmd(int ch, char *optarg)
 			case 9:
 				set_fmt_pad = strtoul(value, nullptr, 0);
 				break;
+			case 10:
+				set_fmt_stream = strtoul(value, nullptr, 0);
+				break;
 			default:
 				fprintf(stderr, "Unknown option\n");
 				subdev_usage();
@@ -265,6 +385,7 @@ void subdev_cmd(int ch, char *optarg)
 				"width",
 				"height",
 				"pad",
+				"stream",
 				nullptr
 			};
 
@@ -299,6 +420,9 @@ void subdev_cmd(int ch, char *optarg)
 			case 6:
 				vsel.pad = strtoul(value, nullptr, 0);
 				break;
+			case 7:
+				vsel.stream = strtoul(value, nullptr, 0);
+				break;
 			default:
 				fprintf(stderr, "Unknown option\n");
 				subdev_usage();
@@ -312,6 +436,7 @@ void subdev_cmd(int ch, char *optarg)
 		while (*subs != '\0') {
 			static constexpr const char *subopts[] = {
 				"pad",
+				"stream",
 				"fps",
 				nullptr
 			};
@@ -321,6 +446,9 @@ void subdev_cmd(int ch, char *optarg)
 				set_fps_pad = strtoul(value, nullptr, 0);
 				break;
 			case 1:
+				set_fps_stream = strtoul(value, nullptr, 0);
+				break;
+			case 2:
 				set_fps = strtod(value, nullptr);
 				break;
 			default:
@@ -330,6 +458,47 @@ void subdev_cmd(int ch, char *optarg)
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
@@ -395,6 +564,7 @@ void subdev_set(cv4l_fd &_fd)
 
 		memset(&fmt, 0, sizeof(fmt));
 		fmt.pad = set_fmt_pad;
+		fmt.stream = set_fmt_stream;
 		fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 
 		if (doioctl(fd, VIDIOC_SUBDEV_G_FMT, &fmt) == 0) {
@@ -431,7 +601,7 @@ void subdev_set(cv4l_fd &_fd)
 			else
 				fmt.which = V4L2_SUBDEV_FORMAT_TRY;
 
-			printf("ioctl: VIDIOC_SUBDEV_S_FMT (pad=%u)\n", fmt.pad);
+			printf("ioctl: VIDIOC_SUBDEV_S_FMT (pad=%u,stream=%u)\n", fmt.pad, fmt.stream);
 			ret = doioctl(fd, VIDIOC_SUBDEV_S_FMT, &fmt);
 			if (ret == 0 && (verbose || !options[OptSetSubDevFormat]))
 				print_framefmt(fmt.format);
@@ -442,6 +612,7 @@ void subdev_set(cv4l_fd &_fd)
 
 		memset(&sel, 0, sizeof(sel));
 		sel.pad = vsel.pad;
+		sel.stream = vsel.stream;
 		sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		sel.target = vsel.target;
 
@@ -462,7 +633,7 @@ void subdev_set(cv4l_fd &_fd)
 			else
 				sel.which = V4L2_SUBDEV_FORMAT_TRY;
 
-			printf("ioctl: VIDIOC_SUBDEV_S_SELECTION (pad=%u)\n", sel.pad);
+			printf("ioctl: VIDIOC_SUBDEV_S_SELECTION (pad=%u,stream=%u)\n", sel.pad, sel.stream);
 			int ret = doioctl(fd, VIDIOC_SUBDEV_S_SELECTION, &sel);
 			if (ret == 0 && (verbose || !options[OptSetSubDevSelection]))
 				print_subdev_selection(sel);
@@ -473,6 +644,7 @@ void subdev_set(cv4l_fd &_fd)
 
 		memset(&fival, 0, sizeof(fival));
 		fival.pad = set_fps_pad;
+		fival.stream = set_fps_stream;
 
 		if (set_fps <= 0) {
 			fprintf(stderr, "invalid fps %f\n", set_fps);
@@ -483,7 +655,7 @@ void subdev_set(cv4l_fd &_fd)
 		fival.interval.denominator = static_cast<uint32_t>(set_fps * fival.interval.numerator);
 		printf("Note: --set-subdev-fps is only for testing.\n"
 		       "Normally media-ctl is used to configure the video pipeline.\n");
-		printf("ioctl: VIDIOC_SUBDEV_S_FRAME_INTERVAL (pad=%u)\n", fival.pad);
+		printf("ioctl: VIDIOC_SUBDEV_S_FRAME_INTERVAL (pad=%u,stream=%u)\n", fival.pad, fival.stream);
 		if (doioctl(fd, VIDIOC_SUBDEV_S_FRAME_INTERVAL, &fival) == 0) {
 			if (!fival.interval.denominator || !fival.interval.numerator)
 				printf("\tFrames per second: invalid (%d/%d)\n",
@@ -494,6 +666,55 @@ void subdev_set(cv4l_fd &_fd)
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
+		printf("%u/%u -> %u/%u [",
+		       routes[i].sink_pad, routes[i].sink_stream,
+		       routes[i].source_pad, routes[i].source_stream);
+		print_flags(route_flags, ARRAY_SIZE(route_flags), routes[i].flags);
+		printf("]\n");
+	}
 }
 
 void subdev_get(cv4l_fd &_fd)
@@ -506,8 +727,9 @@ void subdev_get(cv4l_fd &_fd)
 		memset(&fmt, 0, sizeof(fmt));
 		fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		fmt.pad = get_fmt_pad;
+		fmt.stream = get_fmt_stream;
 
-		printf("ioctl: VIDIOC_SUBDEV_G_FMT (pad=%u)\n", fmt.pad);
+		printf("ioctl: VIDIOC_SUBDEV_G_FMT (pad=%u,stream=%u)\n", fmt.pad, fmt.stream);
 		if (doioctl(fd, VIDIOC_SUBDEV_G_FMT, &fmt) == 0)
 			print_framefmt(fmt.format);
 	}
@@ -519,8 +741,9 @@ void subdev_get(cv4l_fd &_fd)
 		memset(&sel, 0, sizeof(sel));
 		sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		sel.pad = get_sel_pad;
+		sel.stream = get_sel_stream;
 
-		printf("ioctl: VIDIOC_SUBDEV_G_SELECTION (pad=%u)\n", sel.pad);
+		printf("ioctl: VIDIOC_SUBDEV_G_SELECTION (pad=%u,stream=%u)\n", sel.pad, sel.stream);
 		if (options[OptAll] || get_sel_target == -1) {
 			while (valid_seltarget_at_idx(idx)) {
 				sel.target = seltarget_at_idx(idx);
@@ -539,8 +762,9 @@ void subdev_get(cv4l_fd &_fd)
 
 		memset(&fival, 0, sizeof(fival));
 		fival.pad = get_fps_pad;
+		fival.stream = get_fps_stream;
 
-		printf("ioctl: VIDIOC_SUBDEV_G_FRAME_INTERVAL (pad=%u)\n", fival.pad);
+		printf("ioctl: VIDIOC_SUBDEV_G_FRAME_INTERVAL (pad=%u,stream=%u)\n", fival.pad, fival.stream);
 		if (doioctl(fd, VIDIOC_SUBDEV_G_FRAME_INTERVAL, &fival) == 0) {
 			if (!fival.interval.denominator || !fival.interval.numerator)
 				printf("\tFrames per second: invalid (%d/%d)\n",
@@ -551,6 +775,17 @@ void subdev_get(cv4l_fd &_fd)
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
@@ -567,11 +802,12 @@ static void print_mbus_code(__u32 code)
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
@@ -624,13 +860,13 @@ void subdev_list(cv4l_fd &_fd)
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
@@ -639,8 +875,8 @@ void subdev_list(cv4l_fd &_fd)
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
index 8585278f..52974b40 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -64,6 +64,8 @@ static struct option long_options[] = {
 	{"get-fmt-video-out", no_argument, nullptr, OptGetVideoOutFormat},
 	{"set-fmt-video-out", required_argument, nullptr, OptSetVideoOutFormat},
 	{"try-fmt-video-out", required_argument, nullptr, OptTryVideoOutFormat},
+	{"get-routing", no_argument, 0, OptGetRouting},
+	{"set-routing", required_argument, 0, OptSetRouting},
 	{"help", no_argument, nullptr, OptHelp},
 	{"help-tuner", no_argument, nullptr, OptHelpTuner},
 	{"help-io", no_argument, nullptr, OptHelpIO},
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index 8f2726ea..bf519c3f 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -191,6 +191,8 @@ enum Option {
 	OptInfoEdid,
 	OptShowEdid,
 	OptFixEdidChecksums,
+	OptGetRouting,
+	OptSetRouting,
 	OptFreqSeek,
 	OptEncoderCmd,
 	OptTryEncoderCmd,

-- 
2.34.1

