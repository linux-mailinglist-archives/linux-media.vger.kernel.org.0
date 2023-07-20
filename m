Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7B6875A844
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 09:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbjGTHwJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 03:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231835AbjGTHwF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 03:52:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D83332699
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 00:51:54 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E32A73484;
        Thu, 20 Jul 2023 09:50:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1689839413;
        bh=MqRPujg6bF9Ru7QBQNctvTGvgFxUHZBDyjmGNQ200lc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KhZn5YE/bpFqJaiKYCEwt/4TIOFbZSuJHRCRZm/GU6BPv5LfneRWEBCkwJcconpL5
         AUsr6OgpMCKjiaPt3CR04dz4wz4knA8SacdhKOKl698ypiRcJU3G7Dg3VoDKsOBaJs
         QtiJpAtZeoD9bOoeK9qnQwzexnAb97feQg4WHa4Y=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v6 8/8] v4l2-ctl: Check for Streams API support
Date:   Thu, 20 Jul 2023 10:50:44 +0300
Message-Id: <20230720075044.442021-9-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720075044.442021-1-tomi.valkeinen@ideasonboard.com>
References: <20230720075044.442021-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Return an error if the user tries to use streams related features, but
streams are not supported.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 55 ++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
index d906b72d..b6d115fe 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -562,6 +562,11 @@ void subdev_set(cv4l_fd &_fd)
 	if (options[OptSetSubDevFormat] || options[OptTrySubDevFormat]) {
 		struct v4l2_subdev_format fmt;
 
+		if (!_fd.has_streams() && set_fmt_stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		memset(&fmt, 0, sizeof(fmt));
 		fmt.pad = set_fmt_pad;
 		fmt.stream = set_fmt_stream;
@@ -610,6 +615,11 @@ void subdev_set(cv4l_fd &_fd)
 	if (options[OptSetSubDevSelection] || options[OptTrySubDevSelection]) {
 		struct v4l2_subdev_selection sel;
 
+		if (!_fd.has_streams() && vsel.stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		memset(&sel, 0, sizeof(sel));
 		sel.pad = vsel.pad;
 		sel.stream = vsel.stream;
@@ -642,6 +652,11 @@ void subdev_set(cv4l_fd &_fd)
 	if (options[OptSetSubDevFPS]) {
 		struct v4l2_subdev_frame_interval fival;
 
+		if (!_fd.has_streams() && set_fps_stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		memset(&fival, 0, sizeof(fival));
 		fival.pad = set_fps_pad;
 		fival.stream = set_fps_stream;
@@ -667,6 +682,11 @@ void subdev_set(cv4l_fd &_fd)
 		}
 	}
 	if (options[OptSetRouting]) {
+		if (!_fd.has_streams()) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		if (doioctl(fd, VIDIOC_SUBDEV_S_ROUTING, &routing) == 0)
 			printf("Routing set\n");
 	}
@@ -724,6 +744,11 @@ void subdev_get(cv4l_fd &_fd)
 	if (options[OptGetSubDevFormat]) {
 		struct v4l2_subdev_format fmt;
 
+		if (!_fd.has_streams() && get_fmt_stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		memset(&fmt, 0, sizeof(fmt));
 		fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		fmt.pad = get_fmt_pad;
@@ -738,6 +763,11 @@ void subdev_get(cv4l_fd &_fd)
 		struct v4l2_subdev_selection sel;
 		unsigned idx = 0;
 
+		if (!_fd.has_streams() && get_sel_stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		memset(&sel, 0, sizeof(sel));
 		sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		sel.pad = get_sel_pad;
@@ -760,6 +790,11 @@ void subdev_get(cv4l_fd &_fd)
 	if (options[OptGetSubDevFPS]) {
 		struct v4l2_subdev_frame_interval fival;
 
+		if (!_fd.has_streams() && get_fps_stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		memset(&fival, 0, sizeof(fival));
 		fival.pad = get_fps_pad;
 		fival.stream = get_fps_stream;
@@ -777,6 +812,11 @@ void subdev_get(cv4l_fd &_fd)
 	}
 
 	if (options[OptGetRouting]) {
+		if (!_fd.has_streams()) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		memset(&routing, 0, sizeof(routing));
 		memset(routes, 0, sizeof(routes[0]) * NUM_ROUTES_MAX);
 		routing.which = V4L2_SUBDEV_FORMAT_ACTIVE;
@@ -860,11 +900,21 @@ void subdev_list(cv4l_fd &_fd)
 	int fd = _fd.g_fd();
 
 	if (options[OptListSubDevMBusCodes]) {
+		if (!_fd.has_streams() && list_mbus_codes_stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		printf("ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=%u,stream=%u)\n",
 		       list_mbus_codes_pad, list_mbus_codes_stream);
 		print_mbus_codes(fd, list_mbus_codes_pad, list_mbus_codes_stream);
 	}
 	if (options[OptListSubDevFrameSizes]) {
+		if (!_fd.has_streams() && frmsize.stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		printf("ioctl: VIDIOC_SUBDEV_ENUM_FRAME_SIZE (pad=%u,stream=%u)\n",
 		       frmsize.pad, frmsize.stream);
 		frmsize.index = 0;
@@ -875,6 +925,11 @@ void subdev_list(cv4l_fd &_fd)
 		}
 	}
 	if (options[OptListSubDevFrameIntervals]) {
+		if (!_fd.has_streams() && frmival.stream) {
+			printf("Streams API not supported.\n");
+			return;
+		}
+
 		printf("ioctl: VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL (pad=%u,stream=%u)\n",
 		       frmival.pad, frmival.stream);
 		frmival.index = 0;
-- 
2.34.1

