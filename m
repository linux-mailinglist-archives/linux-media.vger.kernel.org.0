Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81D796EAAB7
	for <lists+linux-media@lfdr.de>; Fri, 21 Apr 2023 14:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbjDUMpe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Apr 2023 08:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbjDUMpc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Apr 2023 08:45:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF43C645
        for <linux-media@vger.kernel.org>; Fri, 21 Apr 2023 05:44:58 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4211C75B;
        Fri, 21 Apr 2023 14:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682081077;
        bh=LrUYVNSah+NGj9fOQPWArAbiB8G1G8YX7daQufiOJjw=;
        h=From:To:Cc:Subject:Date:From;
        b=PHtf3O5ii3pRjF77bB5lT6ivnzm3fqWRs4QKqffLHzXHgPObgCvgkKPOIOdQmOZtA
         CEqQMI0YLKIyGoMOcnTfP71CKgkEN76lqFb8P41q8RFBGadXmEAphGkclhlRseOe5g
         8j4Th07r03K1TzFuNvvmKao54wOr1l1e1un9oSPU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 0/8] v4l-utils: Support multiplexed streams
Date:   Fri, 21 Apr 2023 15:44:20 +0300
Message-Id: <20230421124428.393261-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

Hi,

You can find the diff to v3 below. Main changes in v4:

- Add support for the client capabilities ioctl. Note: there is a HACK
  patch that adds the relevant changes to the kernel headers. The HACK
  patch should be dropped before merging, when the client capabilities is
  in upstream kernel.

- Simple v4l2-compliance test for routing, which just gets and sets the
  routing.

- Add legacy style command line parameter parsing for v4l2-ctl

 Tomi

Tomi Valkeinen (8):
  v4l2-ctl: Add routing and streams support
  media-ctl: Add support for routes and streams
  v4l2-ctl/compliance: Add routing and streams multiplexed streams
  v4l2-ctl/compliance: Add simple routing test
  HACK: include/linux: Add client capabilities
  media-ctl: Check for Streams API support
  utils/common: Set V4L2_SUBDEV_CLIENT_CAP_STREAMS for subdevs
  v4l2-ctl: Check for Streams API support

 include/linux/v4l2-subdev.h                 |  21 ++
 utils/common/cv4l-helpers.h                 |   1 +
 utils/common/v4l-helpers.h                  |  17 +
 utils/media-ctl/libmediactl.c               |  41 +++
 utils/media-ctl/libv4l2subdev.c             | 335 ++++++++++++++++--
 utils/media-ctl/media-ctl.c                 | 121 ++++++-
 utils/media-ctl/mediactl-priv.h             |   1 +
 utils/media-ctl/mediactl.h                  |  16 +
 utils/media-ctl/options.c                   |  15 +-
 utils/media-ctl/options.h                   |   1 +
 utils/media-ctl/v4l2subdev.h                |  58 +++-
 utils/v4l2-compliance/v4l2-compliance.cpp   | 132 +++++--
 utils/v4l2-compliance/v4l2-compliance.h     |   9 +-
 utils/v4l2-compliance/v4l2-test-subdevs.cpp |  59 +++-
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp          | 365 ++++++++++++++++++--
 utils/v4l2-ctl/v4l2-ctl.cpp                 |   2 +
 utils/v4l2-ctl/v4l2-ctl.h                   |   2 +
 17 files changed, 1072 insertions(+), 124 deletions(-)

Interdiff against v3:
diff --git a/include/linux/v4l2-subdev.h b/include/linux/v4l2-subdev.h
index 654d659d..4a195b68 100644
--- a/include/linux/v4l2-subdev.h
+++ b/include/linux/v4l2-subdev.h
@@ -233,6 +233,24 @@ struct v4l2_subdev_routing {
 	__u32 reserved[6];
 };
 
+/*
+ * The client is aware of streams. Setting this flag enables the use of 'stream'
+ * fields (referring to the stream number) with various ioctls. If this is not
+ * set (which is the default), the 'stream' fields will be forced to 0 by the
+ * kernel.
+ */
+ #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
+
+/**
+ * struct v4l2_subdev_client_capability - Capabilities of the client accessing
+ *					  the subdev
+ *
+ * @capabilities: A bitmask of V4L2_SUBDEV_CLIENT_CAP_* flags.
+ */
+struct v4l2_subdev_client_capability {
+	__u64 capabilities;
+};
+
 /* Backwards compatibility define --- to be removed */
 #define v4l2_subdev_edid v4l2_edid
 
@@ -250,6 +268,9 @@ struct v4l2_subdev_routing {
 #define VIDIOC_SUBDEV_S_SELECTION		_IOWR('V', 62, struct v4l2_subdev_selection)
 #define VIDIOC_SUBDEV_G_ROUTING			_IOWR('V', 38, struct v4l2_subdev_routing)
 #define VIDIOC_SUBDEV_S_ROUTING			_IOWR('V', 39, struct v4l2_subdev_routing)
+#define VIDIOC_SUBDEV_G_CLIENT_CAP		_IOR('V',  101, struct v4l2_subdev_client_capability)
+#define VIDIOC_SUBDEV_S_CLIENT_CAP		_IOWR('V',  102, struct v4l2_subdev_client_capability)
+
 /* The following ioctls are identical to the ioctls in videodev2.h */
 #define VIDIOC_SUBDEV_G_STD			_IOR('V', 23, v4l2_std_id)
 #define VIDIOC_SUBDEV_S_STD			_IOW('V', 24, v4l2_std_id)
diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 3cee372b..502df6ac 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -82,6 +82,7 @@ public:
 	bool has_rw() const { return v4l_has_rw(this); }
 	bool has_streaming() const { return v4l_has_streaming(this); }
 	bool has_ext_pix_format() const { return v4l_has_ext_pix_format(this); }
+	bool has_streams_support() const { return subdev_supports_streams; }
 
 	int querycap(v4l2_capability &cap, bool force = false)
 	{
diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index c09cd987..2dd7f061 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -39,6 +39,7 @@ struct v4l_fd {
 	bool have_selection;
 	bool is_subdev;
 	bool is_media;
+	bool subdev_supports_streams;
 
 	int (*open)(struct v4l_fd *f, const char *file, int oflag, ...);
 	int (*close)(struct v4l_fd *f);
@@ -507,6 +508,12 @@ static inline int v4l_open(struct v4l_fd *f, const char *devname, bool non_block
 
 static inline int v4l_subdev_s_fd(struct v4l_fd *f, int fd, const char *devname)
 {
+	struct v4l2_subdev_client_capability clientcap = {};
+	struct v4l2_subdev_capability subdevcap = {};
+	bool subdev_streams;
+	bool client_streams;
+	int ret;
+
 	if (f->fd >= 0)
 		f->close(f);
 
@@ -528,6 +535,16 @@ static inline int v4l_subdev_s_fd(struct v4l_fd *f, int fd, const char *devname)
 	f->have_next_ctrl = false;
 	f->have_selection = false;
 
+	ret = ioctl(f->fd, VIDIOC_SUBDEV_QUERYCAP, &subdevcap);
+	subdev_streams = !ret && (subdevcap.capabilities & V4L2_SUBDEV_CAP_STREAMS);
+
+	clientcap.capabilities = V4L2_SUBDEV_CLIENT_CAP_STREAMS;
+
+	ret = ioctl(f->fd, VIDIOC_SUBDEV_S_CLIENT_CAP, &clientcap);
+	client_streams = !ret && (clientcap.capabilities & V4L2_SUBDEV_CLIENT_CAP_STREAMS);
+
+	f->subdev_supports_streams = subdev_streams && client_streams;
+
 	return f->fd;
 }
 
diff --git a/utils/media-ctl/libmediactl.c b/utils/media-ctl/libmediactl.c
index 0b591d69..c32fe56a 100644
--- a/utils/media-ctl/libmediactl.c
+++ b/utils/media-ctl/libmediactl.c
@@ -896,7 +896,7 @@ struct media_pad *media_parse_pad_stream(struct media_device *media,
 		s = strtoul(p, &ep, 10);
 
 		if (ep == p) {
-			printf("Unable to parse stream: '%s'\n", orig_p);
+			media_dbg(media, "Unable to parse stream: '%s'\n", orig_p);
 			if (endp)
 				*endp = (char*)p;
 			return NULL;
diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
index d203e5b4..186708ff 100644
--- a/utils/media-ctl/libv4l2subdev.c
+++ b/utils/media-ctl/libv4l2subdev.c
@@ -42,6 +42,12 @@
 
 int v4l2_subdev_open(struct media_entity *entity)
 {
+	struct v4l2_subdev_client_capability clientcap = {};
+	struct v4l2_subdev_capability subdevcap = {};
+	bool subdev_streams;
+	bool client_streams;
+	int ret;
+
 	if (entity->fd != -1)
 		return 0;
 
@@ -54,6 +60,16 @@ int v4l2_subdev_open(struct media_entity *entity)
 		return ret;
 	}
 
+	ret = ioctl(entity->fd, VIDIOC_SUBDEV_QUERYCAP, &subdevcap);
+	subdev_streams = !ret && (subdevcap.capabilities & V4L2_SUBDEV_CAP_STREAMS);
+
+	clientcap.capabilities = V4L2_SUBDEV_CLIENT_CAP_STREAMS;
+
+	ret = ioctl(entity->fd, VIDIOC_SUBDEV_S_CLIENT_CAP, &clientcap);
+	client_streams = !ret && (clientcap.capabilities & V4L2_SUBDEV_CLIENT_CAP_STREAMS);
+
+	entity->supports_streams = subdev_streams && client_streams;
+
 	return 0;
 }
 
@@ -74,6 +90,11 @@ int v4l2_subdev_get_format(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
+	if (!entity->supports_streams && stream) {
+		media_dbg(entity->media, "Streams API not supported\n");
+		return -ENOTSUP;
+	}
+
 	memset(&fmt, 0, sizeof(fmt));
 	fmt.pad = pad;
 	fmt.stream = stream;
@@ -99,6 +120,11 @@ int v4l2_subdev_set_format(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
+	if (!entity->supports_streams && stream) {
+		media_dbg(entity->media, "Streams API not supported\n");
+		return -ENOTSUP;
+	}
+
 	memset(&fmt, 0, sizeof(fmt));
 	fmt.pad = pad;
 	fmt.stream = stream;
@@ -127,6 +153,11 @@ int v4l2_subdev_get_selection(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
+	if (!entity->supports_streams && stream) {
+		media_dbg(entity->media, "Streams API not supported\n");
+		return -ENOTSUP;
+	}
+
 	memset(&u.sel, 0, sizeof(u.sel));
 	u.sel.pad = pad;
 	u.sel.target = target;
@@ -166,6 +197,11 @@ int v4l2_subdev_set_selection(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
+	if (!entity->supports_streams && stream) {
+		media_dbg(entity->media, "Streams API not supported\n");
+		return -ENOTSUP;
+	}
+
 	memset(&u.sel, 0, sizeof(u.sel));
 	u.sel.pad = pad;
 	u.sel.stream = stream;
@@ -210,6 +246,11 @@ int v4l2_subdev_set_routing(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
+	if (!entity->supports_streams) {
+		media_dbg(entity->media, "Streams API not supported\n");
+		return -ENOTSUP;
+	}
+
 	ret = ioctl(entity->fd, VIDIOC_SUBDEV_S_ROUTING, &routing);
 	if (ret == -1)
 		return -errno;
@@ -221,7 +262,9 @@ int v4l2_subdev_get_routing(struct media_entity *entity,
 			    struct v4l2_subdev_route **routes,
 			    unsigned int *num_routes)
 {
-	struct v4l2_subdev_routing routing = { 0 };
+	struct v4l2_subdev_routing routing = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
 	struct v4l2_subdev_route *r;
 	int ret;
 
@@ -229,7 +272,8 @@ int v4l2_subdev_get_routing(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
-	routing.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	if (!entity->supports_streams)
+		return -ENOTSUP;
 
 	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_ROUTING, &routing);
 	if (ret == -1 && errno != ENOSPC)
@@ -341,6 +385,11 @@ int v4l2_subdev_get_frame_interval(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
+	if (!entity->supports_streams && stream) {
+		media_dbg(entity->media, "Streams API not supported\n");
+		return -ENOTSUP;
+	}
+
 	memset(&ival, 0, sizeof(ival));
 	ival.pad = pad;
 	ival.stream = stream;
@@ -364,6 +413,11 @@ int v4l2_subdev_set_frame_interval(struct media_entity *entity,
 	if (ret < 0)
 		return ret;
 
+	if (!entity->supports_streams && stream) {
+		media_dbg(entity->media, "Streams API not supported\n");
+		return -ENOTSUP;
+	}
+
 	memset(&ival, 0, sizeof(ival));
 	ival.pad = pad;
 	ival.stream = stream;
@@ -386,7 +440,6 @@ static int v4l2_subdev_parse_setup_route(struct media_device *media,
 	/* sink pad/stream */
 
 	r->sink_pad = strtoul(p, &end, 10);
-
 	if (*end != '/') {
 		media_dbg(media, "Expected '/'\n");
 		return -EINVAL;
@@ -407,7 +460,6 @@ static int v4l2_subdev_parse_setup_route(struct media_device *media,
 	/* source pad/stream */
 
 	r->source_pad = strtoul(p, &end, 10);
-
 	if (*end != '/') {
 		media_dbg(media, "Expected '/'\n");
 		return -EINVAL;
@@ -431,7 +483,6 @@ static int v4l2_subdev_parse_setup_route(struct media_device *media,
 	p = end;
 
 	r->flags = strtoul(p, &end, 0);
-
 	if (r->flags & ~(V4L2_SUBDEV_ROUTE_FL_ACTIVE)) {
 		media_dbg(media, "Bad route flags %#x\n", r->flags);
 		return -EINVAL;
@@ -516,7 +567,8 @@ int v4l2_subdev_parse_setup_routes(struct media_device *media, const char *p)
 
 	ret = v4l2_subdev_set_routing(entity, routes, num_routes);
 	if (ret) {
-		printf("VIDIOC_SUBDEV_S_ROUTING failed: %d\n", ret);
+		media_dbg(entity->media, "VIDIOC_SUBDEV_S_ROUTING failed: %d\n",
+			  ret);
 		goto out;
 	}
 
diff --git a/utils/media-ctl/mediactl-priv.h b/utils/media-ctl/mediactl-priv.h
index a0d3a55a..eb55e07e 100644
--- a/utils/media-ctl/mediactl-priv.h
+++ b/utils/media-ctl/mediactl-priv.h
@@ -33,6 +33,7 @@ struct media_entity {
 	struct media_link *links;
 	unsigned int max_links;
 	unsigned int num_links;
+	bool supports_streams;
 
 	char devname[32];
 	int fd;
diff --git a/utils/media-ctl/options.c b/utils/media-ctl/options.c
index 58ddec3c..3c408a1b 100644
--- a/utils/media-ctl/options.c
+++ b/utils/media-ctl/options.c
@@ -105,7 +105,7 @@ static void usage(const char *argv0)
 	printf("\tpad-number      Pad numeric identifier\n");
 	printf("\tstream-number   Stream numeric identifier\n");
 	printf("\tflags           Link flags (0: inactive, 1: active)\n");
-	printf("\troute-flags     Route flags (bitmask of route flags: active - 0x1, immutable - 0x2, source - 0x4)\n");
+	printf("\troute-flags     Route flags (bitmask of route flags: active - 0x1)\n");
 	printf("\tfcc             Format FourCC\n");
 	printf("\twidth           Image width in pixels\n");
 	printf("\theight          Image height in pixels\n");
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index a147604c..7c3a688b 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1241,6 +1241,18 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		node.is_passthrough_subdev = has_source && has_sink;
 
 		if (has_routes) {
+			printf("Sub-Device routing ioctls:\n");
+
+			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
+				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
+
+				printf("\ttest %s VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: %s\n",
+						       which ? "Active" : "Try",
+						       ok(testSubDevRouting(&node, which)));
+			}
+
+			printf("\n");
+
 			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
 				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
 
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 0cd43980..35b2274b 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -375,6 +375,7 @@ int testSubDevEnum(struct node *node, unsigned which, unsigned pad, unsigned str
 int testSubDevFormat(struct node *node, unsigned which, unsigned pad, unsigned stream);
 int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigned stream);
 int testSubDevFrameInterval(struct node *node, unsigned pad, unsigned stream);
+int testSubDevRouting(struct node *node, unsigned which);
 
 // Buffer ioctl tests
 int testReqBufs(struct node *node);
diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index 07192bda..962d9244 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -551,3 +551,19 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigne
 
 	return have_sel ? 0 : ENOTTY;
 }
+
+int testSubDevRouting(struct node *node, unsigned which)
+{
+	struct v4l2_subdev_routing routing = {};
+	struct v4l2_subdev_route routes[256] = {};
+
+	routing.which = which;
+	routing.routes = (__u64)&routes;
+	routing.num_routes = 256;
+
+	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing));
+
+	fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_ROUTING, &routing));
+
+	return 0;
+}
diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
index 81236451..ec70b52b 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -124,9 +124,17 @@ void subdev_usage()
 void subdev_cmd(int ch, char *optarg)
 {
 	char *value, *subs;
+	char *endp;
 
 	switch (ch) {
 	case OptListSubDevMBusCodes:
+		if (optarg) {
+			/* Legacy pad-only parsing */
+			list_mbus_codes_pad = strtoul(optarg, &endp, 0);
+			if (*endp == 0)
+				break;
+		}
+
 		subs = optarg;
 		while (subs && *subs != '\0') {
 			static constexpr const char *subopts[] = {
@@ -209,6 +217,13 @@ void subdev_cmd(int ch, char *optarg)
 		}
 		break;
 	case OptGetSubDevFormat:
+		if (optarg) {
+			/* Legacy pad-only parsing */
+			get_fmt_pad = strtoul(optarg, &endp, 0);
+			if (*endp == 0)
+				break;
+		}
+
 		subs = optarg;
 		while (subs && *subs != '\0') {
 			static constexpr const char *subopts[] = {
@@ -263,6 +278,13 @@ void subdev_cmd(int ch, char *optarg)
 		}
 		break;
 	case OptGetSubDevFPS:
+		if (optarg) {
+			/* Legacy pad-only parsing */
+			get_fps_pad = strtoul(optarg, &endp, 0);
+			if (*endp == 0)
+				break;
+		}
+
 		subs = optarg;
 		while (subs && *subs != '\0') {
 			static constexpr const char *subopts[] = {
@@ -547,6 +569,11 @@ void subdev_set(cv4l_fd &_fd)
 	if (options[OptSetSubDevFormat] || options[OptTrySubDevFormat]) {
 		struct v4l2_subdev_format fmt;
 
+		if (!_fd.has_streams_support() && set_fmt_stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		memset(&fmt, 0, sizeof(fmt));
 		fmt.pad = set_fmt_pad;
 		fmt.stream = set_fmt_stream;
@@ -595,6 +622,11 @@ void subdev_set(cv4l_fd &_fd)
 	if (options[OptSetSubDevSelection] || options[OptTrySubDevSelection]) {
 		struct v4l2_subdev_selection sel;
 
+		if (!_fd.has_streams_support() && vsel.stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		memset(&sel, 0, sizeof(sel));
 		sel.pad = vsel.pad;
 		sel.stream = vsel.stream;
@@ -627,6 +659,11 @@ void subdev_set(cv4l_fd &_fd)
 	if (options[OptSetSubDevFPS]) {
 		struct v4l2_subdev_frame_interval fival;
 
+		if (!_fd.has_streams_support() && set_fps_stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		memset(&fival, 0, sizeof(fival));
 		fival.pad = set_fps_pad;
 		fival.stream = set_fps_stream;
@@ -652,6 +689,11 @@ void subdev_set(cv4l_fd &_fd)
 		}
 	}
 	if (options[OptSetRouting]) {
+		if (!_fd.has_streams_support()) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		if (doioctl(fd, VIDIOC_SUBDEV_S_ROUTING, &routing) == 0)
 			printf("Routing set\n");
 	}
@@ -709,6 +751,11 @@ void subdev_get(cv4l_fd &_fd)
 	if (options[OptGetSubDevFormat]) {
 		struct v4l2_subdev_format fmt;
 
+		if (!_fd.has_streams_support() && get_fmt_stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		memset(&fmt, 0, sizeof(fmt));
 		fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		fmt.pad = get_fmt_pad;
@@ -723,6 +770,11 @@ void subdev_get(cv4l_fd &_fd)
 		struct v4l2_subdev_selection sel;
 		unsigned idx = 0;
 
+		if (!_fd.has_streams_support() && get_sel_stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		memset(&sel, 0, sizeof(sel));
 		sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		sel.pad = get_sel_pad;
@@ -745,6 +797,11 @@ void subdev_get(cv4l_fd &_fd)
 	if (options[OptGetSubDevFPS]) {
 		struct v4l2_subdev_frame_interval fival;
 
+		if (!_fd.has_streams_support() && get_fps_stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		memset(&fival, 0, sizeof(fival));
 		fival.pad = get_fps_pad;
 		fival.stream = get_fps_stream;
@@ -762,6 +819,11 @@ void subdev_get(cv4l_fd &_fd)
 	}
 
 	if (options[OptGetRouting]) {
+		if (!_fd.has_streams_support()) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		memset(&routing, 0, sizeof(routing));
 		memset(routes, 0, sizeof(routes[0]) * NUM_ROUTES_MAX);
 		routing.which = V4L2_SUBDEV_FORMAT_ACTIVE;
@@ -845,11 +907,21 @@ void subdev_list(cv4l_fd &_fd)
 	int fd = _fd.g_fd();
 
 	if (options[OptListSubDevMBusCodes]) {
+		if (!_fd.has_streams_support() && list_mbus_codes_stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		printf("ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=%u,stream=%u)\n",
 		       list_mbus_codes_pad, list_mbus_codes_stream);
 		print_mbus_codes(fd, list_mbus_codes_pad, list_mbus_codes_stream);
 	}
 	if (options[OptListSubDevFrameSizes]) {
+		if (!_fd.has_streams_support() && frmsize.stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		printf("ioctl: VIDIOC_SUBDEV_ENUM_FRAME_SIZE (pad=%u,stream=%u)\n",
 		       frmsize.pad, frmsize.stream);
 		frmsize.index = 0;
@@ -860,6 +932,11 @@ void subdev_list(cv4l_fd &_fd)
 		}
 	}
 	if (options[OptListSubDevFrameIntervals]) {
+		if (!_fd.has_streams_support() && frmival.stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		printf("ioctl: VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL (pad=%u,stream=%u)\n",
 		       frmival.pad, frmival.stream);
 		frmival.index = 0;
-- 
2.34.1

