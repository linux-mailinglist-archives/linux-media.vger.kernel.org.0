Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C14C236753A
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 00:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235362AbhDUWkh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 18:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbhDUWkh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 18:40:37 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A02C06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 15:40:03 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id t22so22161100ply.1
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 15:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YfLA4NtifrXrMIkGYrnnSlGRoUqhYlSrU1iC0fDTVO8=;
        b=GUucAgmnZm+i2ltNZnSstlGq9o0BoRvTHWqXzNBWRSYAxOlOwkwlU0ZvBnRwEelW1w
         BS2R9nc8CA104tW47TSo1Pf76JArNdrX8t6UEclj0dFHN+cLhBAiPvwOAq7ow03lIvHs
         MZVsxCJPNj11iQ/X+aBDlGPleZljSE8kRCZt5FO2pO0E2F3WA0Uu5+0yifmKquIxTSSM
         GCKWkQfyakQc1DeDY8QMt7j9dxOuRH64UAtpy3h2gfyiJyjIbInOLZsR4m5MgkSNmL04
         x4CHZlDcqzlbsFYGYLyl7h447T152z8KJ4TetenW79ER5a9RO/a63r1cRSoTZptnYx3Z
         gamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YfLA4NtifrXrMIkGYrnnSlGRoUqhYlSrU1iC0fDTVO8=;
        b=OFiP5eO7PlycTAzIgrCayPmFOP00+zFjMVxkjihaRQPPhzgUvn7dv85AEVeije9tcf
         qX/FHoIoJCft+rHxVZQ6RZ07t92F9VT/iHX3hRyw3PC4TiHnkd9JscHsOi9iQRTwfBaZ
         DF4RkNq/o0Xd2LTT1aklF9tk241l+wvkOwa+N3pjFrkkVDjiw+0W2UygyOkHz+S89Xt0
         cf91pSpQ5CzWT3QlSVAD6JzGr4dRh5ZR/bFI+PMebNjMfUbrN6SJdHTwM0dYCW6qoTbn
         nLC74ppdqUfomWMWxIH6KyFuIcicDwHEcJq3ENMIcsVAyZXmI6hFNbTlR68p/v0gKpXQ
         mKzA==
X-Gm-Message-State: AOAM532p4B9yXnJ4Ee7bbtwwxMQ7C+7d0Jn6Uy2oihAPF4HuX/DoOmMW
        hMNiVfhuBjKl9sGKifI34SR+7bOcYu+O1A==
X-Google-Smtp-Source: ABdhPJyv00Yf/hghM9rPqzXqKvkygySCBGCYDqZHS/ZAfz3JyoQAAOiYyxOfUilW3GpPzbIAZ7wcCg==
X-Received: by 2002:a17:902:ea0c:b029:eb:7b6:13ba with SMTP id s12-20020a170902ea0cb02900eb07b613bamr257168plg.25.1619044801971;
        Wed, 21 Apr 2021 15:40:01 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id w8sm327758pjq.10.2021.04.21.15.40.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 15:40:01 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] mass constexpr conversions
Date:   Wed, 21 Apr 2021 15:40:00 -0700
Message-Id: <20210421224000.24506-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reduces size slightly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-test-adapter.cpp   |  23 ++-
 utils/cec-compliance/cec-test.cpp           |   2 +-
 utils/cec-ctl/cec-ctl.cpp                   |  38 ++---
 utils/cec-follower/cec-processing.cpp       |   6 +-
 utils/common/media-info.cpp                 |  42 ++---
 utils/common/v4l2-info.cpp                  | 177 ++++++++++----------
 utils/libcecutil/cec-log.cpp                |  10 +-
 utils/libcecutil/cec-log.h                  |   2 +-
 utils/rds-ctl/rds-ctl.cpp                   |   6 +-
 utils/v4l2-compliance/v4l2-compliance.cpp   |   4 +-
 utils/v4l2-compliance/v4l2-test-buffers.cpp |   2 +-
 utils/v4l2-compliance/v4l2-test-colors.cpp  |  28 ++--
 utils/v4l2-compliance/v4l2-test-formats.cpp |   2 +-
 utils/v4l2-ctl/v4l2-ctl-common.cpp          |  11 +-
 utils/v4l2-ctl/v4l2-ctl-edid.cpp            |  91 +++-------
 utils/v4l2-ctl/v4l2-ctl-io.cpp              |   4 +-
 utils/v4l2-ctl/v4l2-ctl-misc.cpp            |  26 +--
 utils/v4l2-ctl/v4l2-ctl-overlay.cpp         |  30 +---
 utils/v4l2-ctl/v4l2-ctl-selection.cpp       |  18 +-
 utils/v4l2-ctl/v4l2-ctl-stds.cpp            |  28 +---
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp       |   2 +-
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp          |  50 ++----
 utils/v4l2-ctl/v4l2-ctl-tuner.cpp           |  13 +-
 utils/v4l2-ctl/v4l2-ctl-vbi.cpp             |  12 +-
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp          |   9 +-
 utils/v4l2-ctl/v4l2-ctl.cpp                 |  24 +--
 utils/v4l2-dbg/v4l2-dbg.cpp                 |   8 +-
 27 files changed, 244 insertions(+), 424 deletions(-)

diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compliance/cec-test-adapter.cpp
index cf1b6191f..3aa78fd66 100644
--- a/utils/cec-compliance/cec-test-adapter.cpp
+++ b/utils/cec-compliance/cec-test-adapter.cpp
@@ -14,8 +14,8 @@
 
 #include "cec-compliance.h"
 
-static const __u8 tx_ok_retry_mask = CEC_TX_STATUS_OK | CEC_TX_STATUS_MAX_RETRIES;
-static const __u32 msg_fl_mask = CEC_MSG_FL_REPLY_TO_FOLLOWERS | CEC_MSG_FL_RAW;
+static constexpr __u8 tx_ok_retry_mask = CEC_TX_STATUS_OK | CEC_TX_STATUS_MAX_RETRIES;
+static constexpr __u32 msg_fl_mask = CEC_MSG_FL_REPLY_TO_FOLLOWERS | CEC_MSG_FL_RAW;
 
 // Flush any pending messages
 static int flush_pending_msgs(struct node *node)
@@ -107,27 +107,24 @@ static int testAdapPhysAddr(struct node *node)
 
 static int testAdapLogAddrs(struct node *node)
 {
-	static const __u8 la_types[] = {
+	static constexpr __u8 la_types[] = {
 		CEC_LOG_ADDR_TYPE_TV,
 		CEC_LOG_ADDR_TYPE_RECORD,
 		CEC_LOG_ADDR_TYPE_TUNER,
-		CEC_LOG_ADDR_TYPE_AUDIOSYSTEM
+		CEC_LOG_ADDR_TYPE_AUDIOSYSTEM,
 	};
-	static const __u8 prim_dev_types[] = {
+	static constexpr __u8 prim_dev_types[] = {
 		CEC_OP_PRIM_DEVTYPE_TV,
 		CEC_OP_PRIM_DEVTYPE_RECORD,
 		CEC_OP_PRIM_DEVTYPE_TUNER,
-		CEC_OP_PRIM_DEVTYPE_AUDIOSYSTEM
+		CEC_OP_PRIM_DEVTYPE_AUDIOSYSTEM,
 	};
-	static const __u8 all_dev_types[2] = {
-		CEC_OP_ALL_DEVTYPE_TV | CEC_OP_ALL_DEVTYPE_RECORD |
-		CEC_OP_ALL_DEVTYPE_AUDIOSYSTEM,
+	static constexpr __u8 all_dev_types[2] = {
+		CEC_OP_ALL_DEVTYPE_TV | CEC_OP_ALL_DEVTYPE_RECORD | CEC_OP_ALL_DEVTYPE_AUDIOSYSTEM,
 		CEC_OP_ALL_DEVTYPE_RECORD | CEC_OP_ALL_DEVTYPE_AUDIOSYSTEM,
 	};
-	static const __u8 features[12] = {
-		0x90, 0x00, 0x8e, 0x00,
-		0xff, 0xff, 0xff, 0xff,
-		0xff, 0xff, 0xff, 0xff
+	static constexpr __u8 features[12] = {
+		0x90, 0x00, 0x8e, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
 	};
 	struct cec_log_addrs clear = { };
 	struct cec_log_addrs laddrs;
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 8da29f227..55e51b7b2 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -701,7 +701,7 @@ static const vec_remote_subtests deck_ctl_subtests{
 
 /* Tuner Control */
 
-static const char *bcast_type2s(__u8 bcast_type)
+static const char *const bcast_type2s(__u8 bcast_type)
 {
 	switch (bcast_type) {
 	case CEC_OP_ANA_BCAST_TYPE_CABLE:
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index c17265a5c..a7c4f3a2b 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -350,7 +350,7 @@ static void usage()
 	       );
 }
 
-static const char *power_status2s(__u8 power_status)
+static const char *const power_status2s(__u8 power_status)
 {
 	switch (power_status) {
 	case CEC_OP_POWER_STATUS_ON:
@@ -443,7 +443,7 @@ static void log_raw_msg(const struct cec_msg *msg)
 	printf("\n");
 }
 
-static const char *event2s(__u32 event)
+static const char *const event2s(__u32 event)
 {
 	switch (event) {
 	case CEC_EVENT_STATE_CHANGE:
@@ -2179,9 +2179,9 @@ int main(int argc, char **argv)
 			usage();
 			return 1;
 		case OptVendorCommand: {
-			static const char *arg_names[] = {
+			static constexpr const char *arg_names[] = {
 				"payload",
-				nullptr
+				nullptr,
 			};
 			char *value, *endptr, *subs = optarg;
 			__u8 size = 0;
@@ -2213,10 +2213,10 @@ int main(int argc, char **argv)
 			break;
 		}
 		case OptCustomCommand: {
-			static const char *arg_names[] = {
+			static constexpr const char *arg_names[] = {
 				"cmd",
 				"payload",
-				nullptr
+				nullptr,
 			};
 			char *value, *endptr, *subs = optarg;
 			bool have_cmd = false;
@@ -2256,10 +2256,10 @@ int main(int argc, char **argv)
 			break;
 		}
 		case OptVendorCommandWithID: {
-			static const char *arg_names[] = {
+			static constexpr const char *arg_names[] = {
 				"vendor-id",
 				"cmd",
-				nullptr
+				nullptr,
 			};
 			char *value, *endptr, *subs = optarg;
 			__u32 vendor_id = 0;
@@ -2295,9 +2295,9 @@ int main(int argc, char **argv)
 			break;
 		}
 		case OptVendorRemoteButtonDown: {
-			static const char *arg_names[] = {
+			static constexpr const char *arg_names[] = {
 				"rc-code",
-				nullptr
+				nullptr,
 			};
 			char *value, *endptr, *subs = optarg;
 			__u8 size = 0;
@@ -2344,10 +2344,10 @@ int main(int argc, char **argv)
 			break;
 
 		case OptTestPowerCycle: {
-			static const char *arg_names[] = {
+			static constexpr const char *arg_names[] = {
 				"polls",
 				"sleep",
-				nullptr
+				nullptr,
 			};
 			char *value, *subs = optarg;
 
@@ -2371,16 +2371,10 @@ int main(int argc, char **argv)
 		}
 
 		case OptStressTestPowerCycle: {
-			static const char *arg_names[] = {
-				"cnt",
-				"min-sleep",
-				"max-sleep",
-				"seed",
-				"repeats",
-				"sleep-before-on",
-				"sleep-before-off",
-				"polls",
-				nullptr
+			static constexpr const char *arg_names[] = {
+				"cnt",	   "min-sleep",	      "max-sleep",	  "seed",
+				"repeats", "sleep-before-on", "sleep-before-off", "polls",
+				nullptr,
 			};
 			char *value, *subs = optarg;
 
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 024407471..48d627096 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -38,10 +38,10 @@ struct la_info la_info[15];
 
 static struct timespec start_monotonic;
 static struct timeval start_timeofday;
-static const time_t time_to_transient = 1;
-static const time_t time_to_stable = 8;
+static constexpr time_t time_to_transient = 1;
+static constexpr time_t time_to_stable = 8;
 
-static const char *get_ui_cmd_string(__u8 ui_cmd)
+static const char *const get_ui_cmd_string(__u8 ui_cmd)
 {
 	return cec_log_ui_cmd_string(ui_cmd) ? : "Unknown";
 }
diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index 3a5477e84..ae327a7a1 100644
--- a/utils/common/media-info.cpp
+++ b/utils/common/media-info.cpp
@@ -33,23 +33,17 @@ static std::string num2s(unsigned num, bool is_hex = true)
 	return buf;
 }
 
-static struct {
+static constexpr struct {
 	const char *devname;
 	enum media_type type;
 } media_types[] = {
-	{ "video", MEDIA_TYPE_VIDEO },
-	{ "vbi", MEDIA_TYPE_VBI },
-	{ "radio", MEDIA_TYPE_RADIO },
-	{ "swradio", MEDIA_TYPE_SDR },
-	{ "v4l-subdev", MEDIA_TYPE_SUBDEV },
-	{ "v4l-touch", MEDIA_TYPE_TOUCH },
-	{ "media", MEDIA_TYPE_MEDIA },
-	{ "frontend", MEDIA_TYPE_DVB_FRONTEND },
-	{ "demux", MEDIA_TYPE_DVB_DEMUX },
-	{ "dvr", MEDIA_TYPE_DVB_DVR },
-	{ "net", MEDIA_TYPE_DVB_NET },
-	{ "ca", MEDIA_TYPE_DTV_CA },
-	{ nullptr, MEDIA_TYPE_UNKNOWN }
+	{ "video", MEDIA_TYPE_VIDEO },	     { "vbi", MEDIA_TYPE_VBI },
+	{ "radio", MEDIA_TYPE_RADIO },	     { "swradio", MEDIA_TYPE_SDR },
+	{ "v4l-subdev", MEDIA_TYPE_SUBDEV }, { "v4l-touch", MEDIA_TYPE_TOUCH },
+	{ "media", MEDIA_TYPE_MEDIA },	     { "frontend", MEDIA_TYPE_DVB_FRONTEND },
+	{ "demux", MEDIA_TYPE_DVB_DEMUX },   { "dvr", MEDIA_TYPE_DVB_DVR },
+	{ "net", MEDIA_TYPE_DVB_NET },	     { "ca", MEDIA_TYPE_DTV_CA },
+	{ nullptr, MEDIA_TYPE_UNKNOWN },
 };
 
 media_type mi_media_detect_type(const char *device)
@@ -255,10 +249,10 @@ int mi_get_media_fd(int fd, const char *bus_info)
 	return media_fd;
 }
 
-static const flag_def entity_flags_def[] = {
+static constexpr flag_def entity_flags_def[] = {
 	{ MEDIA_ENT_FL_DEFAULT, "default" },
 	{ MEDIA_ENT_FL_CONNECTOR, "connector" },
-	{ 0, nullptr }
+	{ 0, nullptr },
 };
 
 std::string mi_entflags2s(__u32 flags)
@@ -266,7 +260,7 @@ std::string mi_entflags2s(__u32 flags)
 	return flags2s(flags, entity_flags_def);
 }
 
-static const flag_def interface_types_def[] = {
+static constexpr flag_def interface_types_def[] = {
 	{ MEDIA_INTF_T_DVB_FE, "DVB Front End" },
 	{ MEDIA_INTF_T_DVB_DEMUX, "DVB Demuxer" },
 	{ MEDIA_INTF_T_DVB_DVR, "DVB DVR" },
@@ -288,7 +282,7 @@ static const flag_def interface_types_def[] = {
 	{ MEDIA_INTF_T_ALSA_HWDEP, "ALSA HWDEP" },
 	{ MEDIA_INTF_T_ALSA_SEQUENCER, "ALSA Sequencer" },
 	{ MEDIA_INTF_T_ALSA_TIMER, "ALSA Timer" },
-	{ 0, nullptr }
+	{ 0, nullptr },
 };
 
 std::string mi_ifacetype2s(__u32 type)
@@ -299,7 +293,7 @@ std::string mi_ifacetype2s(__u32 type)
 	return "FAIL: Unknown (" + num2s(type) + ")";
 }
 
-static const flag_def entity_functions_def[] = {
+static constexpr flag_def entity_functions_def[] = {
 	{ MEDIA_ENT_F_UNKNOWN, "FAIL: Uninitialized Function" },
 	{ MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN, "FAIL: Unknown V4L2 Sub-Device" },
 	{ MEDIA_ENT_T_DEVNODE_UNKNOWN, "FAIL: Unknown Device Node" },
@@ -335,7 +329,7 @@ static const flag_def entity_functions_def[] = {
 	{ MEDIA_ENT_F_PROC_VIDEO_ENCODER, "Video Encoder" },
 	{ MEDIA_ENT_F_VID_MUX, "Video Muxer" },
 	{ MEDIA_ENT_F_VID_IF_BRIDGE, "Video Interface Bridge" },
-	{ 0, nullptr }
+	{ 0, nullptr },
 };
 
 std::string mi_entfunction2s(__u32 function, bool *is_invalid)
@@ -392,11 +386,11 @@ bool mi_func_requires_intf(__u32 function)
 	}
 }
 
-static const flag_def pad_flags_def[] = {
+static constexpr flag_def pad_flags_def[] = {
 	{ MEDIA_PAD_FL_SINK, "Sink" },
 	{ MEDIA_PAD_FL_SOURCE, "Source" },
 	{ MEDIA_PAD_FL_MUST_CONNECT, "Must Connect" },
-	{ 0, nullptr }
+	{ 0, nullptr },
 };
 
 std::string mi_padflags2s(__u32 flags)
@@ -404,11 +398,11 @@ std::string mi_padflags2s(__u32 flags)
 	return flags2s(flags, pad_flags_def);
 }
 
-static const flag_def link_flags_def[] = {
+static constexpr flag_def link_flags_def[] = {
 	{ MEDIA_LNK_FL_ENABLED, "Enabled" },
 	{ MEDIA_LNK_FL_IMMUTABLE, "Immutable" },
 	{ MEDIA_LNK_FL_DYNAMIC, "Dynamic" },
-	{ 0, nullptr }
+	{ 0, nullptr },
 };
 
 std::string mi_linkflags2s(__u32 flags)
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index cb3cb91f7..512597a20 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -201,7 +201,7 @@ std::string buftype2s(int type)
 	}
 }
 
-static const flag_def bufcap_def[] = {
+static constexpr flag_def bufcap_def[] = {
 	{ V4L2_BUF_CAP_SUPPORTS_MMAP, "mmap" },
 	{ V4L2_BUF_CAP_SUPPORTS_USERPTR, "userptr" },
 	{ V4L2_BUF_CAP_SUPPORTS_DMABUF, "dmabuf" },
@@ -209,7 +209,7 @@ static const flag_def bufcap_def[] = {
 	{ V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS, "orphaned-bufs" },
 	{ V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF, "m2m-hold-capture-buf" },
 	{ V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS, "mmap-cache-hints" },
-	{ 0, nullptr }
+	{ 0, nullptr },
 };
 
 std::string bufcap2s(__u32 caps)
@@ -345,9 +345,9 @@ std::string quantization2s(int val)
 	}
 }
 
-static const flag_def pixflags_def[] = {
-	{ V4L2_PIX_FMT_FLAG_PREMUL_ALPHA,  "premultiplied-alpha" },
-	{ 0, nullptr }
+static constexpr flag_def pixflags_def[] = {
+	{ V4L2_PIX_FMT_FLAG_PREMUL_ALPHA, "premultiplied-alpha" },
+	{ 0, nullptr },
 };
 
 std::string pixflags2s(unsigned flags)
@@ -355,12 +355,12 @@ std::string pixflags2s(unsigned flags)
 	return flags2s(flags, pixflags_def);
 }
 
-static const flag_def service_def[] = {
-	{ V4L2_SLICED_TELETEXT_B,  "teletext" },
-	{ V4L2_SLICED_VPS,         "vps" },
+static constexpr flag_def service_def[] = {
+	{ V4L2_SLICED_TELETEXT_B, "teletext" },
+	{ V4L2_SLICED_VPS, "vps" },
 	{ V4L2_SLICED_CAPTION_525, "cc" },
-	{ V4L2_SLICED_WSS_625,     "wss" },
-	{ 0, nullptr }
+	{ V4L2_SLICED_WSS_625, "wss" },
+	{ 0, nullptr },
 };
 
 std::string service2s(unsigned service)
@@ -368,19 +368,19 @@ std::string service2s(unsigned service)
 	return flags2s(service, service_def);
 }
 
-#define FMTDESC_DEF(enc_type)							\
-static const flag_def fmtdesc_ ## enc_type ## _def[] = { 			\
-	{ V4L2_FMT_FLAG_COMPRESSED, "compressed" }, 				\
-	{ V4L2_FMT_FLAG_EMULATED, "emulated" }, 				\
-	{ V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM, "continuous-bytestream" }, 	\
-	{ V4L2_FMT_FLAG_DYN_RESOLUTION, "dyn-resolution" }, 			\
-	{ V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL, "enc-cap-frame-interval" },	\
-	{ V4L2_FMT_FLAG_CSC_COLORSPACE, "csc-colorspace" }, 			\
-	{ V4L2_FMT_FLAG_CSC_YCBCR_ENC, "csc-"#enc_type }, 			\
-	{ V4L2_FMT_FLAG_CSC_QUANTIZATION, "csc-quantization" }, 		\
-	{ V4L2_FMT_FLAG_CSC_XFER_FUNC, "csc-xfer-func" }, 			\
-	{ 0, NULL } 								\
-};
+#define FMTDESC_DEF(enc_type)                                                       \
+	static constexpr flag_def fmtdesc_##enc_type##_def[] = {                    \
+		{ V4L2_FMT_FLAG_COMPRESSED, "compressed" },                         \
+		{ V4L2_FMT_FLAG_EMULATED, "emulated" },                             \
+		{ V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM, "continuous-bytestream" },   \
+		{ V4L2_FMT_FLAG_DYN_RESOLUTION, "dyn-resolution" },                 \
+		{ V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL, "enc-cap-frame-interval" }, \
+		{ V4L2_FMT_FLAG_CSC_COLORSPACE, "csc-colorspace" },                 \
+		{ V4L2_FMT_FLAG_CSC_YCBCR_ENC, "csc-" #enc_type },                  \
+		{ V4L2_FMT_FLAG_CSC_QUANTIZATION, "csc-quantization" },             \
+		{ V4L2_FMT_FLAG_CSC_XFER_FUNC, "csc-xfer-func" },                   \
+		{ 0, NULL }                                                         \
+	};
 
 FMTDESC_DEF(ycbcr)
 FMTDESC_DEF(hsv)
@@ -392,14 +392,14 @@ std::string fmtdesc2s(unsigned flags, bool is_hsv)
 	return flags2s(flags, fmtdesc_ycbcr_def);
 }
 
-#define MBUS_DEF(enc_type)						\
-static const flag_def mbus_ ## enc_type ## _def[] = { 			\
-	{ V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE, "csc-colorspace" }, 	\
-	{ V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC, "csc-"#enc_type },	\
-	{ V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION, "csc-quantization" }, \
-	{ V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC, "csc-xfer-func" }, 	\
-	{ 0, NULL }							\
-};
+#define MBUS_DEF(enc_type)                                                      \
+	static constexpr flag_def mbus_##enc_type##_def[] = {                   \
+		{ V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE, "csc-colorspace" },     \
+		{ V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC, "csc-" #enc_type },      \
+		{ V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION, "csc-quantization" }, \
+		{ V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC, "csc-xfer-func" },       \
+		{ 0, NULL }                                                     \
+	};
 
 MBUS_DEF(ycbcr)
 MBUS_DEF(hsv)
@@ -411,7 +411,7 @@ std::string mbus2s(unsigned flags, bool is_hsv)
 	return flags2s(flags, mbus_ycbcr_def);
 }
 
-static const flag_def selection_targets_def[] = {
+static constexpr flag_def selection_targets_def[] = {
 	{ V4L2_SEL_TGT_CROP_ACTIVE, "crop" },
 	{ V4L2_SEL_TGT_CROP_DEFAULT, "crop_default" },
 	{ V4L2_SEL_TGT_CROP_BOUNDS, "crop_bounds" },
@@ -420,7 +420,7 @@ static const flag_def selection_targets_def[] = {
 	{ V4L2_SEL_TGT_COMPOSE_BOUNDS, "compose_bounds" },
 	{ V4L2_SEL_TGT_COMPOSE_PADDED, "compose_padded" },
 	{ V4L2_SEL_TGT_NATIVE_SIZE, "native_size" },
-	{ 0, nullptr }
+	{ 0, nullptr },
 };
 
 bool valid_seltarget_at_idx(unsigned i)
@@ -459,25 +459,22 @@ std::string selflags2s(__u32 flags)
 	return flags2s(flags, selection_flags_def);
 }
 
-static const char *std_pal[] = {
-	"B", "B1", "G", "H", "I", "D", "D1", "K",
-	"M", "N", "Nc", "60",
-	nullptr
+static constexpr const char *std_pal[] = {
+	"B", "B1", "G", "H", "I", "D", "D1", "K", "M", "N", "Nc", "60", nullptr,
 };
-static const char *std_ntsc[] = {
-	"M", "M-JP", "443", "M-KR",
-	nullptr
+static constexpr const char *std_ntsc[] = {
+	"M", "M-JP", "443", "M-KR", nullptr,
 };
-static const char *std_secam[] = {
-	"B", "D", "G", "H", "K", "K1", "L", "Lc",
-	nullptr
+static constexpr const char *std_secam[] = {
+	"B", "D", "G", "H", "K", "K1", "L", "Lc", nullptr,
 };
-static const char *std_atsc[] = {
-	"8-VSB", "16-VSB",
-	nullptr
+static constexpr const char *std_atsc[] = {
+	"8-VSB",
+	"16-VSB",
+	nullptr,
 };
 
-static std::string partstd2s(const char *prefix, const char *stds[], unsigned long long std)
+static std::string partstd2s(const char *prefix, const char *const stds[], unsigned long long std)
 {
 	std::string s = std::string(prefix) + "-";
 	int first = 1;
@@ -519,40 +516,40 @@ std::string std2s(v4l2_std_id std, const char *sep)
 
 std::string ctrlflags2s(__u32 flags)
 {
-	static const flag_def def[] = {
-		{ V4L2_CTRL_FLAG_GRABBED,    "grabbed" },
-		{ V4L2_CTRL_FLAG_DISABLED,   "disabled" },
-		{ V4L2_CTRL_FLAG_READ_ONLY,  "read-only" },
-		{ V4L2_CTRL_FLAG_UPDATE,     "update" },
-		{ V4L2_CTRL_FLAG_INACTIVE,   "inactive" },
-		{ V4L2_CTRL_FLAG_SLIDER,     "slider" },
+	static constexpr flag_def def[] = {
+		{ V4L2_CTRL_FLAG_GRABBED, "grabbed" },
+		{ V4L2_CTRL_FLAG_DISABLED, "disabled" },
+		{ V4L2_CTRL_FLAG_READ_ONLY, "read-only" },
+		{ V4L2_CTRL_FLAG_UPDATE, "update" },
+		{ V4L2_CTRL_FLAG_INACTIVE, "inactive" },
+		{ V4L2_CTRL_FLAG_SLIDER, "slider" },
 		{ V4L2_CTRL_FLAG_WRITE_ONLY, "write-only" },
-		{ V4L2_CTRL_FLAG_VOLATILE,   "volatile" },
-		{ V4L2_CTRL_FLAG_HAS_PAYLOAD,"has-payload" },
+		{ V4L2_CTRL_FLAG_VOLATILE, "volatile" },
+		{ V4L2_CTRL_FLAG_HAS_PAYLOAD, "has-payload" },
 		{ V4L2_CTRL_FLAG_EXECUTE_ON_WRITE, "execute-on-write" },
 		{ V4L2_CTRL_FLAG_MODIFY_LAYOUT, "modify-layout" },
-		{ 0, nullptr }
+		{ 0, nullptr },
 	};
 	return flags2s(flags, def);
 }
 
-static const flag_def in_status_def[] = {
-	{ V4L2_IN_ST_NO_POWER,    "no power" },
-	{ V4L2_IN_ST_NO_SIGNAL,   "no signal" },
-	{ V4L2_IN_ST_NO_COLOR,    "no color" },
-	{ V4L2_IN_ST_HFLIP,       "hflip" },
-	{ V4L2_IN_ST_VFLIP,       "vflip" },
-	{ V4L2_IN_ST_NO_H_LOCK,   "no hsync lock" },
-	{ V4L2_IN_ST_NO_V_LOCK,   "no vsync lock" },
+static constexpr flag_def in_status_def[] = {
+	{ V4L2_IN_ST_NO_POWER, "no power" },
+	{ V4L2_IN_ST_NO_SIGNAL, "no signal" },
+	{ V4L2_IN_ST_NO_COLOR, "no color" },
+	{ V4L2_IN_ST_HFLIP, "hflip" },
+	{ V4L2_IN_ST_VFLIP, "vflip" },
+	{ V4L2_IN_ST_NO_H_LOCK, "no hsync lock" },
+	{ V4L2_IN_ST_NO_V_LOCK, "no vsync lock" },
 	{ V4L2_IN_ST_NO_STD_LOCK, "no standard format lock" },
-	{ V4L2_IN_ST_COLOR_KILL,  "color kill" },
-	{ V4L2_IN_ST_NO_SYNC,     "no sync lock" },
-	{ V4L2_IN_ST_NO_EQU,      "no equalizer lock" },
-	{ V4L2_IN_ST_NO_CARRIER,  "no carrier" },
+	{ V4L2_IN_ST_COLOR_KILL, "color kill" },
+	{ V4L2_IN_ST_NO_SYNC, "no sync lock" },
+	{ V4L2_IN_ST_NO_EQU, "no equalizer lock" },
+	{ V4L2_IN_ST_NO_CARRIER, "no carrier" },
 	{ V4L2_IN_ST_MACROVISION, "macrovision" },
-	{ V4L2_IN_ST_NO_ACCESS,   "no conditional access" },
-	{ V4L2_IN_ST_VTR,         "VTR time constant" },
-	{ 0, nullptr }
+	{ V4L2_IN_ST_NO_ACCESS, "no conditional access" },
+	{ V4L2_IN_ST_VTR, "VTR time constant" },
+	{ 0, nullptr },
 };
 
 std::string in_status2s(__u32 status)
@@ -560,11 +557,11 @@ std::string in_status2s(__u32 status)
 	return status ? flags2s(status, in_status_def) : "ok";
 }
 
-static const flag_def input_cap_def[] = {
+static constexpr flag_def input_cap_def[] = {
 	{ V4L2_IN_CAP_DV_TIMINGS, "DV timings" },
 	{ V4L2_IN_CAP_STD, "SDTV standards" },
 	{ V4L2_IN_CAP_NATIVE_SIZE, "Native Size" },
-	{ 0, nullptr }
+	{ 0, nullptr },
 };
 
 std::string input_cap2s(__u32 capabilities)
@@ -572,11 +569,11 @@ std::string input_cap2s(__u32 capabilities)
 	return capabilities ? flags2s(capabilities, input_cap_def) : "not defined";
 }
 
-static const flag_def output_cap_def[] = {
+static constexpr flag_def output_cap_def[] = {
 	{ V4L2_OUT_CAP_DV_TIMINGS, "DV timings" },
 	{ V4L2_OUT_CAP_STD, "SDTV standards" },
 	{ V4L2_OUT_CAP_NATIVE_SIZE, "Native Size" },
-	{ 0, nullptr }
+	{ 0, nullptr },
 };
 
 std::string output_cap2s(__u32 capabilities)
@@ -630,13 +627,9 @@ std::string fbufflags2s(unsigned fl)
 	return s;
 }
 
-static const flag_def dv_standards_def[] = {
-	{ V4L2_DV_BT_STD_CEA861, "CTA-861" },
-	{ V4L2_DV_BT_STD_DMT, "DMT" },
-	{ V4L2_DV_BT_STD_CVT, "CVT" },
-	{ V4L2_DV_BT_STD_GTF, "GTF" },
-	{ V4L2_DV_BT_STD_SDI, "SDI" },
-	{ 0, nullptr }
+static constexpr flag_def dv_standards_def[] = {
+	{ V4L2_DV_BT_STD_CEA861, "CTA-861" }, { V4L2_DV_BT_STD_DMT, "DMT" }, { V4L2_DV_BT_STD_CVT, "CVT" },
+	{ V4L2_DV_BT_STD_GTF, "GTF" },	      { V4L2_DV_BT_STD_SDI, "SDI" }, { 0, nullptr },
 };
 
 std::string dv_standards2s(__u32 flags)
@@ -675,12 +668,12 @@ std::string dvflags2s(unsigned vsync, int val)
 	return s;
 }
 
-static const flag_def dv_caps_def[] = {
+static constexpr flag_def dv_caps_def[] = {
 	{ V4L2_DV_BT_CAP_INTERLACED, "Interlaced" },
 	{ V4L2_DV_BT_CAP_PROGRESSIVE, "Progressive" },
 	{ V4L2_DV_BT_CAP_REDUCED_BLANKING, "Reduced Blanking" },
 	{ V4L2_DV_BT_CAP_CUSTOM, "Custom Formats" },
-	{ 0, nullptr }
+	{ 0, nullptr },
 };
 
 std::string dv_caps2s(__u32 flags)
@@ -688,13 +681,13 @@ std::string dv_caps2s(__u32 flags)
 	return flags2s(flags, dv_caps_def);
 }
 
-static const flag_def tc_flags_def[] = {
+static constexpr flag_def tc_flags_def[] = {
 	{ V4L2_TC_FLAG_DROPFRAME, "dropframe" },
 	{ V4L2_TC_FLAG_COLORFRAME, "colorframe" },
 	{ V4L2_TC_USERBITS_field, "userbits-field" },
 	{ V4L2_TC_USERBITS_USERDEFINED, "userbits-userdefined" },
 	{ V4L2_TC_USERBITS_8BITCHARS, "userbits-8bitchars" },
-	{ 0, nullptr }
+	{ 0, nullptr },
 };
 
 std::string tc_flags2s(__u32 flags)
@@ -702,7 +695,7 @@ std::string tc_flags2s(__u32 flags)
 	return flags2s(flags, tc_flags_def);
 }
 
-static const flag_def buffer_flags_def[] = {
+static constexpr flag_def buffer_flags_def[] = {
 	{ V4L2_BUF_FLAG_MAPPED, "mapped" },
 	{ V4L2_BUF_FLAG_QUEUED, "queued" },
 	{ V4L2_BUF_FLAG_DONE, "done" },
@@ -718,7 +711,7 @@ static const flag_def buffer_flags_def[] = {
 	{ V4L2_BUF_FLAG_LAST, "last" },
 	{ V4L2_BUF_FLAG_REQUEST_FD, "request-fd" },
 	{ V4L2_BUF_FLAG_IN_REQUEST, "in-request" },
-	{ 0, nullptr }
+	{ 0, nullptr },
 };
 
 std::string bufferflags2s(__u32 flags)
@@ -757,10 +750,10 @@ std::string bufferflags2s(__u32 flags)
 	return s;
 }
 
-static const flag_def vbi_def[] = {
-	{ V4L2_VBI_UNSYNC,     "unsynchronized" },
+static constexpr flag_def vbi_def[] = {
+	{ V4L2_VBI_UNSYNC, "unsynchronized" },
 	{ V4L2_VBI_INTERLACED, "interlaced" },
-	{ 0, nullptr }
+	{ 0, nullptr },
 };
 
 std::string vbiflags2s(__u32 flags)
diff --git a/utils/libcecutil/cec-log.cpp b/utils/libcecutil/cec-log.cpp
index e2178473c..3aea03b54 100644
--- a/utils/libcecutil/cec-log.cpp
+++ b/utils/libcecutil/cec-log.cpp
@@ -14,19 +14,19 @@
 #include "cec-log.h"
 #include "compiler.h"
 
-static const struct cec_arg arg_u8 = {
+static constexpr cec_arg arg_u8 = {
 	CEC_ARG_TYPE_U8,
 };
 
-static const struct cec_arg arg_u16 = {
+static constexpr cec_arg arg_u16 = {
 	CEC_ARG_TYPE_U16,
 };
 
-static const struct cec_arg arg_u32 = {
+static constexpr cec_arg arg_u32 = {
 	CEC_ARG_TYPE_U32,
 };
 
-static const struct cec_arg arg_string = {
+static constexpr cec_arg arg_string = {
 	CEC_ARG_TYPE_STRING,
 };
 
@@ -330,7 +330,7 @@ static void log_unknown_msg(const struct cec_msg *msg)
 	}
 }
 
-const char *cec_log_ui_cmd_string(__u8 ui_cmd)
+const char *const cec_log_ui_cmd_string(__u8 ui_cmd)
 {
 	for (unsigned i = 0; i < arg_ui_cmd.num_enum_values; i++) {
 		if (type_ui_cmd[i].value == ui_cmd)
diff --git a/utils/libcecutil/cec-log.h b/utils/libcecutil/cec-log.h
index 09bf50637..b903fa22f 100644
--- a/utils/libcecutil/cec-log.h
+++ b/utils/libcecutil/cec-log.h
@@ -38,6 +38,6 @@ struct cec_msg_args {
 const struct cec_msg_args *cec_log_msg_args(unsigned int index);
 void cec_log_msg(const struct cec_msg *msg);
 void cec_log_htng_msg(const struct cec_msg *msg);
-const char *cec_log_ui_cmd_string(__u8 ui_cmd);
+const char *const cec_log_ui_cmd_string(__u8 ui_cmd);
 
 #endif
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index 8161aa453..0cae93a1f 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -185,7 +185,7 @@ static int doioctl_name(int fd, unsigned long int request, void *parm, const cha
 
 #define doioctl(n, r, p) doioctl_name(n, r, p, #r)
 
-static const char *audmode2s(int audmode)
+static const char *const audmode2s(int audmode)
 {
 	switch (audmode) {
 		case V4L2_TUNER_MODE_STEREO: return "stereo";
@@ -382,11 +382,11 @@ static void parse_freq_seek(char *optarg, struct v4l2_hw_freq_seek &seek)
 	char *subs = optarg;
 
 	while (*subs != '\0') {
-		static const char *const subopts[] = {
+		static constexpr const char *subopts[] = {
 			"dir",
 			"wrap",
 			"spacing",
-			nullptr
+			nullptr,
 		};
 
 		switch (parse_subopt(&subs, subopts, &value)) {
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 90a503612..8bd2f73e4 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1618,11 +1618,11 @@ int main(int argc, char **argv)
 		case OptStreamAllColorTest:
 			subs = optarg;
 			while (*subs != '\0') {
-				static const char *const subopts[] = {
+				static constexpr const char *subopts[] = {
 					"color",
 					"skip",
 					"perc",
-					nullptr
+					nullptr,
 				};
 
 				switch (parse_subopt(&subs, subopts, &value)) {
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index bc5958c2c..f154f3152 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -855,7 +855,7 @@ static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_
 		cv4l_queue &m2m_q, unsigned frame_count, int pollmode,
 		unsigned &capture_count)
 {
-	static const char *pollmode_str[] = {
+	static constexpr const char *pollmode_str[] = {
 		"",
 		" (select)",
 		" (epoll)",
diff --git a/utils/v4l2-compliance/v4l2-test-colors.cpp b/utils/v4l2-compliance/v4l2-test-colors.cpp
index 55a816949..3f0afe107 100644
--- a/utils/v4l2-compliance/v4l2-test-colors.cpp
+++ b/utils/v4l2-compliance/v4l2-test-colors.cpp
@@ -59,25 +59,25 @@ struct color {
 	double r, g, b, a;
 };
 
-static const double bt601[3][3] = {
-	{ 1, 0,       1.4020  },
+static constexpr double bt601[3][3] = {
+	{ 1, 0, 1.4020 },
 	{ 1, -0.3441, -0.7141 },
-	{ 1, 1.7720,  0       },
+	{ 1, 1.7720, 0 },
 };
-static const double rec709[3][3] = {
-	{ 1, 0,       1.5748  },
+static constexpr double rec709[3][3] = {
+	{ 1, 0, 1.5748 },
 	{ 1, -0.1873, -0.4681 },
-	{ 1, 1.8556,  0       },
+	{ 1, 1.8556, 0 },
 };
-static const double smpte240m[3][3] = {
-	{ 1, 0,       1.5756  },
+static constexpr double smpte240m[3][3] = {
+	{ 1, 0, 1.5756 },
 	{ 1, -0.2253, -0.4767 },
-	{ 1, 1.8270,  0       },
+	{ 1, 1.8270, 0 },
 };
-static const double bt2020[3][3] = {
-	{ 1, 0,       1.4746  },
+static constexpr double bt2020[3][3] = {
+	{ 1, 0, 1.4746 },
 	{ 1, -0.1646, -0.5714 },
-	{ 1, 1.8814,  0       },
+	{ 1, 1.8814, 0 },
 };
 
 static void ycbcr2rgb(const double m[3][3], double y, double cb, double cr,
@@ -465,10 +465,10 @@ static void getColor(const cv4l_fmt &fmt, __u8 * const planes[3],
 	}
 }
 
-static const char * const colors[] = {
+static constexpr const char *colors[] = {
 	"red",
 	"green",
-	"blue"
+	"blue",
 };
 
 static int testColorsFmt(struct node *node, unsigned component,
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 60ebf559a..3761b1fa9 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -27,7 +27,7 @@
 #include "compiler.h"
 #include "v4l2-compliance.h"
 
-static const __u32 buftype2cap[] = {
+static constexpr __u32 buftype2cap[] = {
 	0,
 	V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_M2M,
 	V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_VIDEO_M2M,
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 17ad488dd..66e468c3f 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -116,15 +116,8 @@ void common_usage()
 	       );
 }
 
-static const char *prefixes[] = {
-	"video",
-	"radio",
-	"vbi",
-	"swradio",
-	"v4l-subdev",
-	"v4l-touch",
-	"media",
-	nullptr
+static constexpr const char *prefixes[] = {
+	"video", "radio", "vbi", "swradio", "v4l-subdev", "v4l-touch", "media", nullptr,
 };
 
 static bool is_v4l_dev(const char *name)
diff --git a/utils/v4l2-ctl/v4l2-ctl-edid.cpp b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
index 80ea151f5..f40c17241 100644
--- a/utils/v4l2-ctl/v4l2-ctl-edid.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
@@ -658,23 +658,23 @@ static void print_edid_mods(const struct v4l2_edid *e)
 	}
 	loc = get_edid_vid_cap_location(e->edid, e->blocks * 128);
 	if (loc >= 0) {
-		static const char *pt_scan[] = {
+		static constexpr const char *pt_scan[] = {
 			"No Data",
 			"Always Overscanned",
 			"Always Underscanned",
-			"Supports both over- and underscan"
+			"Supports both over- and underscan",
 		};
-		static const char *it_scan[] = {
+		static constexpr const char *it_scan[] = {
 			"IT Formats not supported",
 			"Always Overscanned",
 			"Always Underscanned",
-			"Supports both over- and underscan"
+			"Supports both over- and underscan",
 		};
-		static const char *ce_scan[] = {
+		static constexpr const char *ce_scan[] = {
 			"CE Formats not supported",
 			"Always Overscanned",
 			"Always Underscanned",
-			"Supports both over- and underscan"
+			"Supports both over- and underscan",
 		};
 		__u8 v = e->edid[loc];
 
@@ -1087,65 +1087,17 @@ void edid_cmd(int ch, char *optarg)
 			break;
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
-				"pad",
-				"type",
-				"edid",
-				"file",
-				"format",
-				"pa",
-				"s-pt",
-				"s-it",
-				"s-ce",
-				"y444",
-				"30-bit",
-				"36-bit",
-				"48-bit",
-				"graphics",
-				"photo",
-				"cinema",
-				"game",
-				"scdc",
-				"underscan",
-				"audio",
-				"ycbcr444",
-				"ycbcr422",
-				"qy",
-				"qs",
-				"xvycc-601",
-				"xvycc-709",
-				"sycc",
-				"opycc",
-				"oprgb",
-				"bt2020-rgb",
-				"bt2020-ycc",
-				"bt2020-cycc",
-				"dci-p3",
-				"sdr",
-				"hdr",
-				"smpte2084",
-				"hlg",
-				"fl-fr",
-				"lfe",
-				"fc",
-				"bl-br",
-				"bc",
-				"flc-frc",
-				"rlc-rrc",
-				"flw-frw",
-				"tpfl-tpfr",
-				"tpc",
-				"tpfc",
-				"ls-rs",
-				"lfe2",
-				"tpbc",
-				"sil-sir",
-				"tpsil-tpsir",
-				"tpbl-tpbr",
-				"btfc",
-				"btfl-btbr",
-				"tpls-tprs",
-				nullptr
+			static constexpr const char *subopts[] = {
+				"pad",	      "type",	     "edid",	  "file",      "format",      "pa",
+				"s-pt",	      "s-it",	     "s-ce",	  "y444",      "30-bit",      "36-bit",
+				"48-bit",     "graphics",    "photo",	  "cinema",    "game",	      "scdc",
+				"underscan",  "audio",	     "ycbcr444",  "ycbcr422",  "qy",	      "qs",
+				"xvycc-601",  "xvycc-709",   "sycc",	  "opycc",     "oprgb",	      "bt2020-rgb",
+				"bt2020-ycc", "bt2020-cycc", "dci-p3",	  "sdr",       "hdr",	      "smpte2084",
+				"hlg",	      "fl-fr",	     "lfe",	  "fc",	       "bl-br",	      "bc",
+				"flc-frc",    "rlc-rrc",     "flw-frw",	  "tpfl-tpfr", "tpc",	      "tpfc",
+				"ls-rs",      "lfe2",	     "tpbc",	  "sil-sir",   "tpsil-tpsir", "tpbl-tpbr",
+				"btfc",	      "btfl-btbr",   "tpls-tprs", nullptr,
 			};
 
 			int opt = getsubopt(&subs, (char* const*)subopts, &value);
@@ -1307,13 +1259,8 @@ void edid_cmd(int ch, char *optarg)
 			break;
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
-				"pad",
-				"startblock",
-				"blocks",
-				"format",
-				"file",
-				nullptr
+			static constexpr const char *subopts[] = {
+				"pad", "startblock", "blocks", "format", "file", nullptr,
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
diff --git a/utils/v4l2-ctl/v4l2-ctl-io.cpp b/utils/v4l2-ctl/v4l2-ctl-io.cpp
index 2c51e5736..c50fff86b 100644
--- a/utils/v4l2-ctl/v4l2-ctl-io.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-io.cpp
@@ -31,7 +31,7 @@ void io_usage()
 	       );
 }
 
-static const char *inputtype2s(__u32 type)
+static const char *const inputtype2s(__u32 type)
 {
 	switch (type) {
 	case V4L2_INPUT_TYPE_TUNER:
@@ -45,7 +45,7 @@ static const char *inputtype2s(__u32 type)
 	}
 }
 
-static const char *outputtype2s(__u32 type)
+static const char *const outputtype2s(__u32 type)
 {
 	switch (type) {
 	case V4L2_OUTPUT_TYPE_MODULATOR:
diff --git a/utils/v4l2-ctl/v4l2-ctl-misc.cpp b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
index 1853608a3..06b5c7a90 100644
--- a/utils/v4l2-ctl/v4l2-ctl-misc.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
@@ -178,15 +178,10 @@ void misc_cmd(int ch, char *optarg)
 	case OptSetJpegComp:
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
-				"app0", "app1", "app2", "app3",
-				"app4", "app5", "app6", "app7",
-				"app8", "app9", "appa", "appb",
-				"appc", "appd", "appe", "appf",
-				"quality",
-				"markers",
-				"comment",
-				nullptr
+			static constexpr const char *subopts[] = {
+				"app0", "app1", "app2",	   "app3",    "app4",	 "app5",  "app6",
+				"app7", "app8", "app9",	   "appa",    "appb",	 "appc",  "appd",
+				"appe", "appf", "quality", "markers", "comment", nullptr,
 			};
 			size_t len;
 			int opt = parse_subopt(&subs, subopts, &value);
@@ -235,10 +230,10 @@ void misc_cmd(int ch, char *optarg)
 	case OptTryEncoderCmd:
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"cmd",
 				"flags",
-				nullptr
+				nullptr,
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
@@ -258,13 +253,8 @@ void misc_cmd(int ch, char *optarg)
 	case OptTryDecoderCmd:
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
-				"cmd",
-				"flags",
-				"stop_pts",
-				"start_speed",
-				"start_format",
-				nullptr
+			static constexpr const char *subopts[] = {
+				"cmd", "flags", "stop_pts", "start_speed", "start_format", nullptr,
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
diff --git a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
index 639a41757..71c437f81 100644
--- a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
@@ -209,15 +209,8 @@ void overlay_cmd(int ch, char *optarg)
 	case OptTryOverlayFormat:
 		subs = optarg;
 		while (subs && *subs != '\0') {
-			static const char *const subopts[] = {
-				"chromakey",
-				"global_alpha",
-				"left",
-				"top",
-				"width",
-				"height",
-				"field",
-				nullptr
+			static constexpr const char *subopts[] = {
+				"chromakey", "global_alpha", "left", "top", "width", "height", "field", nullptr,
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
@@ -260,12 +253,8 @@ void overlay_cmd(int ch, char *optarg)
 		subs = optarg;
 		memset(&r, 0, sizeof(r));
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
-				"left",
-				"top",
-				"width",
-				"height",
-				nullptr
+			static constexpr const char *subopts[] = {
+				"left", "top", "width", "height", nullptr,
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
@@ -308,14 +297,9 @@ void overlay_cmd(int ch, char *optarg)
 			const unsigned alpha_flags = V4L2_FBUF_FLAG_GLOBAL_ALPHA |
 						     V4L2_FBUF_FLAG_LOCAL_ALPHA |
 						     V4L2_FBUF_FLAG_LOCAL_INV_ALPHA;
-			static const char *const subopts[] = {
-				"chromakey",
-				"src_chromakey",
-				"global_alpha",
-				"local_alpha",
-				"local_inv_alpha",
-				"fb",
-				nullptr
+			static constexpr const char *subopts[] = {
+				"chromakey", "src_chromakey", "global_alpha", "local_alpha", "local_inv_alpha",
+				"fb",	     nullptr,
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
diff --git a/utils/v4l2-ctl/v4l2-ctl-selection.cpp b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
index 4633776fb..7385d5bfe 100644
--- a/utils/v4l2-ctl/v4l2-ctl-selection.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
@@ -93,12 +93,8 @@ static void parse_crop(char *optarg, unsigned int &set_crop, v4l2_rect &vcrop)
 	char *subs = optarg;
 
 	while (*subs != '\0') {
-		static const char *const subopts[] = {
-			"left",
-			"top",
-			"width",
-			"height",
-			nullptr
+		static constexpr const char *subopts[] = {
+			"left", "top", "width", "height", nullptr,
 		};
 
 		switch (parse_subopt(&subs, subopts, &value)) {
@@ -153,14 +149,8 @@ static int parse_selection(char *optarg, unsigned int &set_sel, v4l2_selection &
 	char *subs = optarg;
 
 	while (*subs != '\0') {
-		static const char *const subopts[] = {
-			"target",
-			"flags",
-			"left",
-			"top",
-			"width",
-			"height",
-			nullptr
+		static constexpr const char *subopts[] = {
+			"target", "flags", "left", "top", "width", "height", nullptr,
 		};
 
 		switch (parse_subopt(&subs, subopts, &value)) {
diff --git a/utils/v4l2-ctl/v4l2-ctl-stds.cpp b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
index 82571f932..f54368eb4 100644
--- a/utils/v4l2-ctl/v4l2-ctl-stds.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
@@ -160,29 +160,11 @@ static int parse_timing_subopt(char **subopt_str, int *value)
 	int opt;
 	char *opt_str;
 
-	static const char * const subopt_list[] = {
-		"width",
-		"height",
-		"interlaced",
-		"polarities",
-		"pixelclock",
-		"hfp",
-		"hs",
-		"hbp",
-		"vfp",
-		"vs",
-		"vbp",
-		"il_vfp",
-		"il_vs",
-		"il_vbp",
-		"index",
-		"cvt",
-		"gtf",
-		"fps",
-		"reduced-blanking",
-		"reduced-fps",
-		"clear",
-		nullptr
+	static constexpr const char *subopt_list[] = {
+		"width", "height", "interlaced", "polarities", "pixelclock",	   "hfp",	  "hs",
+		"hbp",	 "vfp",	   "vs",	 "vbp",	       "il_vfp",	   "il_vs",	  "il_vbp",
+		"index", "cvt",	   "gtf",	 "fps",	       "reduced-blanking", "reduced-fps", "clear",
+		nullptr,
 	};
 
 	opt = getsubopt(subopt_str, (char* const*) subopt_list, &opt_str);
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index b8dc30fb3..62424e4cc 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -503,7 +503,7 @@ static void print_buffer(FILE *f, struct v4l2_buffer &buf)
 		static_cast<__u64>(buf.timestamp.tv_sec), static_cast<__u64>(buf.timestamp.tv_usec),
 		timestamp_type2s(buf.flags).c_str(), timestamp_src2s(buf.flags).c_str());
 	if (buf.flags & V4L2_BUF_FLAG_TIMECODE) {
-		static const int fps_types[] = { 0, 24, 25, 30, 50, 60 };
+		static constexpr int fps_types[] = { 0, 24, 25, 30, 50, 60 };
 		int fps = buf.timecode.type;
 
 		if (fps > 5)
diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
index ecfd32443..1764ad485 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -5,10 +5,10 @@ struct mbus_name {
 	__u32 code;
 };
 
-static const struct mbus_name mbus_names[] = {
+static constexpr struct mbus_name mbus_names[] = {
 	{ "Fixed", MEDIA_BUS_FMT_FIXED },
 #include "media-bus-format-names.h"
-	{ nullptr, 0 }
+	{ nullptr, 0 },
 };
 
 /* selection specified */
@@ -97,10 +97,10 @@ void subdev_cmd(int ch, char *optarg)
 	case OptListSubDevFrameSizes:
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"pad",
 				"code",
-				nullptr
+				nullptr,
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
@@ -119,12 +119,8 @@ void subdev_cmd(int ch, char *optarg)
 	case OptListSubDevFrameIntervals:
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
-				"pad",
-				"code",
-				"width",
-				"height",
-				nullptr
+			static constexpr const char *subopts[] = {
+				"pad", "code", "width", "height", nullptr,
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
@@ -153,10 +149,10 @@ void subdev_cmd(int ch, char *optarg)
 	case OptGetSubDevSelection:
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"pad",
 				"target",
-				nullptr
+				nullptr,
 			};
 			unsigned int target;
 
@@ -187,18 +183,9 @@ void subdev_cmd(int ch, char *optarg)
 		ffmt.field = V4L2_FIELD_ANY;
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
-				"width",
-				"height",
-				"code",
-				"field",
-				"colorspace",
-				"ycbcr",
-				"hsv",
-				"quantization",
-				"xfer",
-				"pad",
-				nullptr
+			static constexpr const char *subopts[] = {
+				"width", "height",	 "code", "field", "colorspace", "ycbcr",
+				"hsv",	 "quantization", "xfer", "pad",	  nullptr,
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
@@ -256,15 +243,8 @@ void subdev_cmd(int ch, char *optarg)
 		subs = optarg;
 
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
-				"target",
-				"flags",
-				"left",
-				"top",
-				"width",
-				"height",
-				"pad",
-				nullptr
+			static constexpr const char *subopts[] = {
+				"target", "flags", "left", "top", "width", "height", "pad", nullptr,
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
@@ -309,10 +289,10 @@ void subdev_cmd(int ch, char *optarg)
 		subs = optarg;
 
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"pad",
 				"fps",
-				nullptr
+				nullptr,
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
diff --git a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
index 7d6f6f3e7..126b413eb 100644
--- a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
@@ -45,7 +45,7 @@ void tuner_usage()
 	       );
 }
 
-static const char *audmode2s(int audmode)
+static const char *const audmode2s(int audmode)
 {
 	switch (audmode) {
 		case V4L2_TUNER_MODE_STEREO: return "stereo";
@@ -57,7 +57,7 @@ static const char *audmode2s(int audmode)
 	}
 }
 
-static const char *ttype2s(int type)
+static const char *const ttype2s(int type)
 {
 	switch (type) {
 		case V4L2_TUNER_RADIO: return "radio";
@@ -157,13 +157,8 @@ static void parse_freq_seek(char *optarg, struct v4l2_hw_freq_seek &seek)
 	char *subs = optarg;
 
 	while (*subs != '\0') {
-		static const char *const subopts[] = {
-			"dir",
-			"wrap",
-			"spacing",
-			"low",
-			"high",
-			nullptr
+		static constexpr const char *subopts[] = {
+			"dir", "wrap", "spacing", "low", "high", nullptr,
 		};
 
 		switch (parse_subopt(&subs, subopts, &value)) {
diff --git a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
index 33191aa64..51508a7b9 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
@@ -123,15 +123,9 @@ void vbi_cmd(int ch, char *optarg)
 		subs = optarg;
 		memset(&raw->fmt.vbi, 0, sizeof(raw->fmt.vbi));
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
-				"samplingrate",
-				"offset",
-				"samplesperline",
-				"start0",
-				"start1",
-				"count0",
-				"count1",
-				nullptr
+			static constexpr const char *subopts[] = {
+				"samplingrate", "offset", "samplesperline", "start0",
+				"start1",	"count0", "count1",	    nullptr,
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index c66c248a3..b12631b80 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -133,11 +133,11 @@ void vidcap_cmd(int ch, char *optarg)
 	case OptListFrameIntervals:
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"width",
 				"height",
 				"pixelformat",
-				nullptr
+				nullptr,
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
@@ -395,9 +395,8 @@ void vidcap_list(cv4l_fd &fd)
 
 void print_touch_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
 {
-	static const char img[16] = {
-		'.', ',', ':', ';', '!', '|', 'i', 'c',
-		'n', 'o', 'm', 'I', 'C', 'N', 'O', 'M',
+	static constexpr char img[16] = {
+		'.', ',', ':', ';', '!', '|', 'i', 'c', 'n', 'o', 'm', 'I', 'C', 'N', 'O', 'M',
 	};
 	auto vbuf = static_cast<__s16 *>(q.g_dataptr(buf.g_index(), 0));
 	__u32 x, y;
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index d91577e14..4ddbecce7 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -523,11 +523,11 @@ void printfmt(int fd, const struct v4l2_format &vfmt)
 
 static std::string frmtype2s(unsigned type)
 {
-	static const char *types[] = {
+	static constexpr const char *types[] = {
 		"Unknown",
 		"Discrete",
 		"Continuous",
-		"Stepwise"
+		"Stepwise",
 	};
 
 	if (type > 3)
@@ -764,20 +764,9 @@ int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
 	flags = 0;
 	subs = optarg;
 	while (*subs != '\0') {
-		static const char *const subopts[] = {
-			"width",
-			"height",
-			"pixelformat",
-			"field",
-			"colorspace",
-			"ycbcr",
-			"hsv",
-			"bytesperline",
-			"premul-alpha",
-			"quantization",
-			"xfer",
-			"sizeimage",
-			nullptr
+		static constexpr const char *subopts[] = {
+			"width",	"height",	"pixelformat",	"field", "colorspace", "ycbcr", "hsv",
+			"bytesperline", "premul-alpha", "quantization", "xfer",	 "sizeimage",  nullptr,
 		};
 
 		switch (parse_subopt(&subs, subopts, &value)) {
@@ -1032,8 +1021,7 @@ static int open_media_bus_info(const std::string &bus_info)
 	return -1;
 }
 
-static const char *make_devname(const char *device, const char *devname,
-				const std::string &media_bus_info)
+static const char *const make_devname(const char *device, const char *devname, const std::string &media_bus_info)
 {
 	if (device[0] >= '0' && device[0] <= '9' && strlen(device) <= 3) {
 		static char newdev[32];
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index 0873c2686..b3eed1de7 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -302,7 +302,7 @@ static unsigned long long parse_reg(const struct board_list *curr_bd, const std:
 	return strtoull(reg.c_str(), nullptr, 0);
 }
 
-static const char *reg_name(const struct board_list *curr_bd, unsigned long long reg)
+static const char *const reg_name(const struct board_list *curr_bd, unsigned long long reg)
 {
 	if (curr_bd) {
 		for (const auto &curr : curr_bd->regs) {
@@ -317,7 +317,7 @@ static const char *reg_name(const struct board_list *curr_bd, unsigned long long
 	return nullptr;
 }
 
-static const char *binary(unsigned long long val)
+static const char *const binary(unsigned long long val)
 {
 	static char bin[80];
 	char *p = bin;
@@ -494,10 +494,10 @@ int main(int argc, char **argv)
 				break;
 
 			while (*subs != '\0') {
-				static const char * const subopts[] = {
+				static constexpr const char *subopts[] = {
 					"min",
 					"max",
-					nullptr
+					nullptr,
 				};
 
 				switch (parse_subopt(&subs, subopts, &value)) {
-- 
2.30.2

