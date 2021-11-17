Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8634549D9
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 16:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232307AbhKQP2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 10:28:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbhKQP2L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 10:28:11 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD84C061570
        for <linux-media@vger.kernel.org>; Wed, 17 Nov 2021 07:25:12 -0800 (PST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mnMoA-0005JZ-HX
        for linux-media@vger.kernel.org; Wed, 17 Nov 2021 16:25:10 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] media-ctl: add DV timing parser to --set-dv option
Date:   Wed, 17 Nov 2021 16:24:52 +0100
Message-Id: <20211117152452.530828-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently --set-dv only allows to query DV timings and set those.
Add a DV timing parser to allow setting DV timings manually.
The format is the same as the dv.current line from --get-dv.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 utils/media-ctl/libv4l2subdev.c | 315 ++++++++++++++++++++++++++++++++
 utils/media-ctl/media-ctl.c     |  14 +-
 utils/media-ctl/v4l2subdev.h    |  32 ++++
 3 files changed, 359 insertions(+), 2 deletions(-)

diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
index 0d0afbe702d9..cee4d8af7cfa 100644
--- a/utils/media-ctl/libv4l2subdev.c
+++ b/utils/media-ctl/libv4l2subdev.c
@@ -28,6 +28,7 @@
 #include <fcntl.h>
 #include <stdbool.h>
 #include <stdio.h>
+#include <stdint.h>
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
@@ -850,6 +851,270 @@ int v4l2_subdev_parse_setup_formats(struct media_device *media, const char *p)
 	return *end ? -EINVAL : 0;
 }
 
+static int v4l2_subdev_parse_timing_type(struct media_device *media,
+					 struct v4l2_dv_timings *timings,
+					 const char *p, char **endp)
+{
+	char *end;
+
+	for (end = (char *)p; *end != ' ' && *end != '\0'; ++end);
+
+	if (strncmp(p, "BT.656/1120", end - p) != 0) {
+		media_dbg(media, "Invalid timing type '%.*s'\n", end - p, p);
+		return -EINVAL;
+	}
+
+	*endp = end;
+
+	return V4L2_DV_BT_656_1120;
+}
+
+static int v4l2_subdev_parse_timing_stds(struct media_device *media,
+					 struct v4l2_dv_timings *timings,
+					 const char *p, char **endp)
+{
+	int timing_standard;
+	uint32_t standards = 0;
+	char *std;
+	char *end;
+
+	do {
+		for (end = (char *)p;
+		     *end != ',' && *end != ' ' && *end != ']' && *end != '\0'; ++end);
+
+		/* Backward compatibility: allow empty stds: ... */
+		if (end == p)
+			break;
+
+		/* ... followed by empty flags: */
+		if (strncmp(p, "flags:", end - p) == 0) {
+			end = (char *)p;
+			break;
+		}
+
+		std = strndup(p, end - p);
+		if (!std)
+			return -ENOMEM;
+
+		timing_standard = v4l2_subdev_string_to_timing_standard(std);
+		free(std);
+
+		if (timing_standard == -1) {
+			media_dbg(media, "Invalid DV timing standard '%.*s'\n", end - p, p);
+			return -EINVAL;
+		}
+
+		standards |= (uint32_t)timing_standard;
+
+		p = end + 1;
+	} while (*end == ',');
+
+	timings->bt.standards = standards;
+
+	*endp = end;
+
+	return 0;
+}
+
+static int v4l2_subdev_parse_timing_flags(struct media_device *media,
+					  struct v4l2_dv_timings *timings,
+					  const char *p, char **endp)
+{
+	int timing_flag;
+	uint32_t flags = 0;
+	char *flag;
+	char *end;
+
+	do {
+		for (end = (char *)p;
+		     *end != ',' && *end != ' ' && *end != ']' && *end != '\0'; ++end);
+
+		/* For backwards compatibility, allow empty flags: */
+		if (end == p)
+			break;
+
+		flag = strndup(p, end - p);
+		if (!flag)
+			return -ENOMEM;
+
+		timing_flag = v4l2_subdev_string_to_timing_flag(flag);
+		free(flag);
+
+		if (timing_flag == -1) {
+			media_dbg(media, "Invalid DV timing flag '%.*s'\n", end - p, p);
+			return -EINVAL;
+		}
+
+		flags |= (uint32_t)timing_flag;
+
+		p = end + 1;
+	} while (*end == ',');
+
+	timings->bt.flags = flags;
+
+	*endp = end;
+
+	return 0;
+}
+
+static struct media_pad *v4l2_subdev_parse_dv_timings(
+	struct media_device *media, struct v4l2_dv_timings *timings,
+	const char *p, char **endp)
+{
+	struct media_pad *pad;
+	char *end;
+	int ret;
+
+	for (; isspace(*p); ++p);
+
+	pad = media_parse_pad(media, p, &end);
+	if (pad == NULL) {
+		*endp = end;
+		return NULL;
+	}
+
+	for (p = end; isspace(*p); ++p);
+	if (*p++ != '[') {
+		media_dbg(media, "Expected '['\n");
+		*endp = (char *)p - 1;
+		return NULL;
+	}
+
+	for (;;) {
+		for (; isspace(*p); p++);
+
+		if (strhazit("dv.current:", &p)) {
+			unsigned long fps, total_width, total_height;
+
+			ret = v4l2_subdev_parse_timing_type(media, timings, p, &end);
+			if (ret < 0) {
+				*endp = end;
+				return NULL;
+			}
+
+			if (*end != ' ') {
+				media_dbg(media, "Expected ' '\n");
+				*endp = end;
+				return NULL;
+			}
+
+			p = end + 1;
+
+			timings->bt.width = strtoul(p, &end, 10);
+			if (*end != 'x') {
+				media_dbg(media, "Expected 'x'\n");
+				*endp = end;
+				return NULL;
+			}
+
+			p = end + 1;
+
+			timings->bt.height = strtoul(p, &end, 10);
+			if (*end != 'p') {
+				media_dbg(media, "Expected 'p'\n");
+				*endp = end;
+				return NULL;
+			}
+
+			p = end + 1;
+
+			fps = strtoul(p, &end, 10);
+			if (*end != ' ') {
+				media_dbg(media, "Expected ' '\n");
+				*endp = end;
+				return NULL;
+			}
+
+			if (*(end + 1) != '(') {
+				media_dbg(media, "Expected '('\n");
+				*endp = end;
+				return NULL;
+			}
+
+			p = end + 2;
+
+			total_width = strtoul(p, &end, 10);
+			if (*end != 'x') {
+				media_dbg(media, "Expected 'x'\n");
+				*endp = end;
+				return NULL;
+			}
+
+			p = end + 1;
+
+			total_height = strtoul(p, &end, 10);
+			if (*end != ')') {
+				media_dbg(media, "Expected ')'\n");
+				*endp = end;
+				return NULL;
+			}
+
+			timings->bt.pixelclock = (uint64_t)fps * total_width * total_height;
+
+			timings->bt.hsync = total_width - timings->bt.width;
+			timings->bt.vsync = total_height - timings->bt.height;
+
+			p = end + 1;
+			continue;
+		}
+
+		if (strhazit("stds:", &p)) {
+			ret = v4l2_subdev_parse_timing_stds(media, timings, p, &end);
+			if (ret < 0) {
+				*endp = end;
+				return NULL;
+			}
+
+			p = end;
+			continue;
+		}
+
+		if (strhazit("flags:", &p)) {
+			ret = v4l2_subdev_parse_timing_flags(media, timings, p, &end);
+			if (ret < 0) {
+				*endp = end;
+				return NULL;
+			}
+
+			p = end;
+			continue;
+		}
+
+		break;
+	}
+
+	if (*p != ']') {
+		media_dbg(media, "Expected ']'\n");
+		*endp = (char *)p;
+		return NULL;
+	}
+
+	*endp = (char *)p + 1;
+	return pad;
+}
+
+int v4l2_subdev_parse_setup_dv_timings(struct media_device *media,
+				       const char *p)
+{
+	struct v4l2_dv_timings timings = { 0 };
+	struct media_pad *pad;
+	char *end;
+	int ret;
+
+	pad = v4l2_subdev_parse_dv_timings(media, &timings, p, &end);
+	if (pad == NULL) {
+		media_print_streampos(media, p, end);
+		media_dbg(media, "Unable to parse DV timings\n");
+		return -EINVAL;
+	}
+
+	ret = v4l2_subdev_set_dv_timings(pad->entity, &timings);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static const struct {
 	const char *name;
 	enum v4l2_mbus_pixelcode code;
@@ -952,6 +1217,56 @@ enum v4l2_field v4l2_subdev_string_to_field(const char *string)
 	return (enum v4l2_field)-1;
 }
 
+static const struct {
+	const char *name;
+	uint32_t standard;
+} bt_standards[] = {
+	{ "CEA-861", V4L2_DV_BT_STD_CEA861 },
+	{ "DMT", V4L2_DV_BT_STD_DMT },
+	{ "CVT", V4L2_DV_BT_STD_CVT },
+	{ "GTF", V4L2_DV_BT_STD_GTF },
+	{ "SDI", V4L2_DV_BT_STD_SDI },
+};
+
+int v4l2_subdev_string_to_timing_standard(const char *string)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(bt_standards); ++i) {
+		if (strcasecmp(bt_standards[i].name, string) == 0)
+			return bt_standards[i].standard;
+	}
+
+	return (uint32_t)-1;
+}
+
+static const struct {
+	uint32_t flag;
+	const char *name;
+} bt_flags[] = {
+	{ V4L2_DV_FL_REDUCED_BLANKING, "reduced-blanking" },
+	{ V4L2_DV_FL_CAN_REDUCE_FPS, "can-reduce-fps" },
+	{ V4L2_DV_FL_REDUCED_FPS, "reduced-fps" },
+	{ V4L2_DV_FL_HALF_LINE, "half-line" },
+	{ V4L2_DV_FL_IS_CE_VIDEO, "CE-video" },
+	{ V4L2_DV_FL_FIRST_FIELD_EXTRA_LINE, "first-field-extra-line" },
+	{ V4L2_DV_FL_HAS_PICTURE_ASPECT, "has-picture-aspect" },
+	{ V4L2_DV_FL_HAS_CEA861_VIC, "has-cea861-vic" },
+	{ V4L2_DV_FL_HAS_HDMI_VIC, "has-hdmi-vic" },
+};
+
+int v4l2_subdev_string_to_timing_flag(const char *string)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(bt_flags); ++i) {
+		if (strcasecmp(bt_flags[i].name, string) == 0)
+			return bt_flags[i].flag;
+	}
+
+	return (uint32_t)-1;
+}
+
 static struct {
 	const char *name;
 	enum v4l2_colorspace colorspace;
diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
index 84ee7a83c7d6..d48dec5a9f11 100644
--- a/utils/media-ctl/media-ctl.c
+++ b/utils/media-ctl/media-ctl.c
@@ -620,10 +620,20 @@ int main(int argc, char **argv)
 	if (media_opts.dv_pad) {
 		struct v4l2_dv_timings timings;
 		struct media_pad *pad;
+		char *endp;
 
-		pad = media_parse_pad(media, media_opts.dv_pad, NULL);
+		pad = media_parse_pad(media, media_opts.dv_pad, &endp);
 		if (pad == NULL) {
-			printf("Pad '%s' not found\n", media_opts.dv_pad);
+			printf("Pad '%.*s' not found\n",
+			       (int)(endp - media_opts.dv_pad), media_opts.dv_pad);
+			goto out;
+		}
+
+		if (*endp == '[') {
+			ret = v4l2_subdev_parse_setup_dv_timings(media,
+								 media_opts.dv_pad);
+			if (ret < 0)
+				printf("Unable to setup DV timings: %s\n", strerror(-ret));
 			goto out;
 		}
 
diff --git a/utils/media-ctl/v4l2subdev.h b/utils/media-ctl/v4l2subdev.h
index a18139118494..026bde2fcd68 100644
--- a/utils/media-ctl/v4l2subdev.h
+++ b/utils/media-ctl/v4l2subdev.h
@@ -235,6 +235,18 @@ int v4l2_subdev_set_frame_interval(struct media_entity *entity,
  */
 int v4l2_subdev_parse_setup_formats(struct media_device *media, const char *p);
 
+/**
+ * @brief Parse a string and apply DV timing settings.
+ * @param media - media device.
+ * @param p - input string
+ *
+ * Parse string @a p and apply DV timing settings to a subdev pad specified in
+ * @a p.
+ *
+ * @return 0 on success, or a negative error code on failure.
+ */
+int v4l2_subdev_parse_setup_dv_timings(struct media_device *media, const char *p);
+
 /**
  * @brief Convert media bus pixel code to string.
  * @param code - input string
@@ -366,4 +378,24 @@ enum v4l2_quantization v4l2_subdev_string_to_quantization(const char *string);
 const enum v4l2_mbus_pixelcode *v4l2_subdev_pixelcode_list(
 	unsigned int *length);
 
+/**
+ * @brief Parse string to DV timing standard.
+ * @param string - nul terminated string, textual DV timing standard
+ *
+ * Parse human readable string @a string to DV timing standard.
+ *
+ * @return DV timing standard on success, -1 on failure.
+ */
+int v4l2_subdev_string_to_timing_standard(const char *string);
+
+/**
+ * @brief Parse string to DV timing flag.
+ * @param string - nul terminated string, textual DV timing flag
+ *
+ * Parse human readable string @a string to DV timing flag.
+ *
+ * @return DV timing flag on success, -1 on failure.
+ */
+int v4l2_subdev_string_to_timing_flag(const char *string);
+
 #endif
-- 
2.30.2

