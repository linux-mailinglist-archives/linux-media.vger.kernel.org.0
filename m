Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD0BF369E89
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 04:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233188AbhDXCsX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 22:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232619AbhDXCsU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 22:48:20 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CAB4C061574
        for <linux-media@vger.kernel.org>; Fri, 23 Apr 2021 19:47:43 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id cu16so22035900pjb.4
        for <linux-media@vger.kernel.org>; Fri, 23 Apr 2021 19:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zgT//YAO1COPzCB++Muod2Nvdw/lCDP8QCQkjgnY3E8=;
        b=PwLn/7ibVRYaXMRBywHpj9uwILxcMF0DJkb5DHjmkzghXJXhafRFt6TplHT8cfKzIm
         tddP3yIUj37KW6QOid0l8tQzPr6v332EO8LvhArpAK0zbmmZffqcSkST/BumhkcPhs6r
         cU8/aQNESHmLR+2686I70aUx0S/ogRVePw/h2ZQSJraxCf/W15K0QV4297qZ7zmiQS6g
         V/GA6xZbvVgyw0tOUhNLsuOqiQgX5u5zSULAbaaFySvV25HhHECGs1TN3Ycf9fizwVUy
         Arz9yQpYgYsgob9/4z/b/5cDAKyvg8tq58ehNoQoCDXuesI395o9Tghszsnqh1XZOmfc
         G3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zgT//YAO1COPzCB++Muod2Nvdw/lCDP8QCQkjgnY3E8=;
        b=TX8kG8ePPQKSfu8Tkh0Yb5s40vFJfjb/6+chIYxIFhkXw0DQPqf6aVoBSbYEMKsfG1
         ugxJViaBAjiHNj+7JhL2fsRf0GyCVTKDIa3qeFHjWcThx4NLSTm83/3150+nfDeGgAfL
         zkN+3YDmCf+5kDLfExxemN3LQKpcJ4hw8yV+X19w2mE6nJyz+I0acvuvAWLXaXXEZPbx
         WER095Q7gt9bT3Puww6BvWRsNe2Nd1iXmhH5y9+vADL2efsvQ86X3Iw9kzz4F7ji0ETi
         YjdLIT80Y4tgQWWrEZx+HHYvECSInurOkCQp1PWc67R5syo1knuhEWRN5m212ESeZHQ9
         dSyw==
X-Gm-Message-State: AOAM531P+mG6Sk8IDfc2GBukydhaSu3j8t2bxx5azNPxWL4EsX2YER83
        UwU1EhrwEYcTUqqRsrnv/AqEhv9DoP/YhA==
X-Google-Smtp-Source: ABdhPJwGsqWDKLybeB3Rd/3E5NdNW+E0ThG6SyTvjkCwJV6gGY73CSsjW0wvy2Bw3b0N0/EC/Bzhuw==
X-Received: by 2002:a17:902:a5c1:b029:ec:b031:750b with SMTP id t1-20020a170902a5c1b02900ecb031750bmr7081598plq.85.1619232461753;
        Fri, 23 Apr 2021 19:47:41 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id h2sm5534447pfv.196.2021.04.23.19.47.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 19:47:41 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/2] mass constexpr conversions
Date:   Fri, 23 Apr 2021 19:47:38 -0700
Message-Id: <20210424024739.83762-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-test-adapter.cpp   | 12 ++++-----
 utils/cec-ctl/cec-ctl.cpp                   | 12 ++++-----
 utils/cec-follower/cec-processing.cpp       |  4 +--
 utils/common/media-info.cpp                 | 12 ++++-----
 utils/common/v4l2-info.cpp                  | 28 ++++++++++-----------
 utils/rds-ctl/rds-ctl.cpp                   |  2 +-
 utils/v4l2-compliance/v4l2-compliance.cpp   |  2 +-
 utils/v4l2-compliance/v4l2-test-buffers.cpp |  2 +-
 utils/v4l2-compliance/v4l2-test-colors.cpp  | 10 ++++----
 utils/v4l2-compliance/v4l2-test-formats.cpp |  2 +-
 utils/v4l2-ctl/v4l2-ctl-edid.cpp            | 10 ++++----
 utils/v4l2-ctl/v4l2-ctl-misc.cpp            |  6 ++---
 utils/v4l2-ctl/v4l2-ctl-overlay.cpp         | 10 ++++----
 utils/v4l2-ctl/v4l2-ctl-selection.cpp       |  4 +--
 utils/v4l2-ctl/v4l2-ctl-stds.cpp            |  2 +-
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp       |  2 +-
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp          | 12 ++++-----
 utils/v4l2-ctl/v4l2-ctl-tuner.cpp           |  2 +-
 utils/v4l2-ctl/v4l2-ctl-vbi.cpp             |  2 +-
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp          |  4 +--
 utils/v4l2-ctl/v4l2-ctl.cpp                 |  6 ++---
 utils/v4l2-dbg/v4l2-dbg.cpp                 |  2 +-
 22 files changed, 74 insertions(+), 74 deletions(-)

diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compliance/cec-test-adapter.cpp
index cf1b6191f..df7feb218 100644
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
@@ -107,24 +107,24 @@ static int testAdapPhysAddr(struct node *node)
 
 static int testAdapLogAddrs(struct node *node)
 {
-	static const __u8 la_types[] = {
+	static constexpr __u8 la_types[] = {
 		CEC_LOG_ADDR_TYPE_TV,
 		CEC_LOG_ADDR_TYPE_RECORD,
 		CEC_LOG_ADDR_TYPE_TUNER,
 		CEC_LOG_ADDR_TYPE_AUDIOSYSTEM
 	};
-	static const __u8 prim_dev_types[] = {
+	static constexpr __u8 prim_dev_types[] = {
 		CEC_OP_PRIM_DEVTYPE_TV,
 		CEC_OP_PRIM_DEVTYPE_RECORD,
 		CEC_OP_PRIM_DEVTYPE_TUNER,
 		CEC_OP_PRIM_DEVTYPE_AUDIOSYSTEM
 	};
-	static const __u8 all_dev_types[2] = {
+	static constexpr __u8 all_dev_types[2] = {
 		CEC_OP_ALL_DEVTYPE_TV | CEC_OP_ALL_DEVTYPE_RECORD |
 		CEC_OP_ALL_DEVTYPE_AUDIOSYSTEM,
 		CEC_OP_ALL_DEVTYPE_RECORD | CEC_OP_ALL_DEVTYPE_AUDIOSYSTEM,
 	};
-	static const __u8 features[12] = {
+	static constexpr __u8 features[12] = {
 		0x90, 0x00, 0x8e, 0x00,
 		0xff, 0xff, 0xff, 0xff,
 		0xff, 0xff, 0xff, 0xff
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index c17265a5c..d9391ab72 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -2179,7 +2179,7 @@ int main(int argc, char **argv)
 			usage();
 			return 1;
 		case OptVendorCommand: {
-			static const char *arg_names[] = {
+			static constexpr const char *arg_names[] = {
 				"payload",
 				nullptr
 			};
@@ -2213,7 +2213,7 @@ int main(int argc, char **argv)
 			break;
 		}
 		case OptCustomCommand: {
-			static const char *arg_names[] = {
+			static constexpr const char *arg_names[] = {
 				"cmd",
 				"payload",
 				nullptr
@@ -2256,7 +2256,7 @@ int main(int argc, char **argv)
 			break;
 		}
 		case OptVendorCommandWithID: {
-			static const char *arg_names[] = {
+			static constexpr const char *arg_names[] = {
 				"vendor-id",
 				"cmd",
 				nullptr
@@ -2295,7 +2295,7 @@ int main(int argc, char **argv)
 			break;
 		}
 		case OptVendorRemoteButtonDown: {
-			static const char *arg_names[] = {
+			static constexpr const char *arg_names[] = {
 				"rc-code",
 				nullptr
 			};
@@ -2344,7 +2344,7 @@ int main(int argc, char **argv)
 			break;
 
 		case OptTestPowerCycle: {
-			static const char *arg_names[] = {
+			static constexpr const char *arg_names[] = {
 				"polls",
 				"sleep",
 				nullptr
@@ -2371,7 +2371,7 @@ int main(int argc, char **argv)
 		}
 
 		case OptStressTestPowerCycle: {
-			static const char *arg_names[] = {
+			static constexpr const char *arg_names[] = {
 				"cnt",
 				"min-sleep",
 				"max-sleep",
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 93db40598..9acaf7ec9 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -41,8 +41,8 @@ struct la_info la_info[15];
 
 static struct timespec start_monotonic;
 static struct timeval start_timeofday;
-static const time_t time_to_transient = 1;
-static const time_t time_to_stable = 8;
+static constexpr time_t time_to_transient = 1;
+static constexpr time_t time_to_stable = 8;
 
 static const char *get_ui_cmd_string(__u8 ui_cmd)
 {
diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index 3a5477e84..410e18cd7 100644
--- a/utils/common/media-info.cpp
+++ b/utils/common/media-info.cpp
@@ -33,7 +33,7 @@ static std::string num2s(unsigned num, bool is_hex = true)
 	return buf;
 }
 
-static struct {
+static constexpr struct {
 	const char *devname;
 	enum media_type type;
 } media_types[] = {
@@ -255,7 +255,7 @@ int mi_get_media_fd(int fd, const char *bus_info)
 	return media_fd;
 }
 
-static const flag_def entity_flags_def[] = {
+static constexpr flag_def entity_flags_def[] = {
 	{ MEDIA_ENT_FL_DEFAULT, "default" },
 	{ MEDIA_ENT_FL_CONNECTOR, "connector" },
 	{ 0, nullptr }
@@ -266,7 +266,7 @@ std::string mi_entflags2s(__u32 flags)
 	return flags2s(flags, entity_flags_def);
 }
 
-static const flag_def interface_types_def[] = {
+static constexpr flag_def interface_types_def[] = {
 	{ MEDIA_INTF_T_DVB_FE, "DVB Front End" },
 	{ MEDIA_INTF_T_DVB_DEMUX, "DVB Demuxer" },
 	{ MEDIA_INTF_T_DVB_DVR, "DVB DVR" },
@@ -299,7 +299,7 @@ std::string mi_ifacetype2s(__u32 type)
 	return "FAIL: Unknown (" + num2s(type) + ")";
 }
 
-static const flag_def entity_functions_def[] = {
+static constexpr flag_def entity_functions_def[] = {
 	{ MEDIA_ENT_F_UNKNOWN, "FAIL: Uninitialized Function" },
 	{ MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN, "FAIL: Unknown V4L2 Sub-Device" },
 	{ MEDIA_ENT_T_DEVNODE_UNKNOWN, "FAIL: Unknown Device Node" },
@@ -392,7 +392,7 @@ bool mi_func_requires_intf(__u32 function)
 	}
 }
 
-static const flag_def pad_flags_def[] = {
+static constexpr flag_def pad_flags_def[] = {
 	{ MEDIA_PAD_FL_SINK, "Sink" },
 	{ MEDIA_PAD_FL_SOURCE, "Source" },
 	{ MEDIA_PAD_FL_MUST_CONNECT, "Must Connect" },
@@ -404,7 +404,7 @@ std::string mi_padflags2s(__u32 flags)
 	return flags2s(flags, pad_flags_def);
 }
 
-static const flag_def link_flags_def[] = {
+static constexpr flag_def link_flags_def[] = {
 	{ MEDIA_LNK_FL_ENABLED, "Enabled" },
 	{ MEDIA_LNK_FL_IMMUTABLE, "Immutable" },
 	{ MEDIA_LNK_FL_DYNAMIC, "Dynamic" },
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index cb3cb91f7..b8f2c865d 100644
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
@@ -345,7 +345,7 @@ std::string quantization2s(int val)
 	}
 }
 
-static const flag_def pixflags_def[] = {
+static constexpr flag_def pixflags_def[] = {
 	{ V4L2_PIX_FMT_FLAG_PREMUL_ALPHA,  "premultiplied-alpha" },
 	{ 0, nullptr }
 };
@@ -355,7 +355,7 @@ std::string pixflags2s(unsigned flags)
 	return flags2s(flags, pixflags_def);
 }
 
-static const flag_def service_def[] = {
+static constexpr flag_def service_def[] = {
 	{ V4L2_SLICED_TELETEXT_B,  "teletext" },
 	{ V4L2_SLICED_VPS,         "vps" },
 	{ V4L2_SLICED_CAPTION_525, "cc" },
@@ -369,7 +369,7 @@ std::string service2s(unsigned service)
 }
 
 #define FMTDESC_DEF(enc_type)							\
-static const flag_def fmtdesc_ ## enc_type ## _def[] = { 			\
+static constexpr flag_def fmtdesc_ ## enc_type ## _def[] = { 			\
 	{ V4L2_FMT_FLAG_COMPRESSED, "compressed" }, 				\
 	{ V4L2_FMT_FLAG_EMULATED, "emulated" }, 				\
 	{ V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM, "continuous-bytestream" }, 	\
@@ -393,7 +393,7 @@ std::string fmtdesc2s(unsigned flags, bool is_hsv)
 }
 
 #define MBUS_DEF(enc_type)						\
-static const flag_def mbus_ ## enc_type ## _def[] = { 			\
+static constexpr flag_def mbus_ ## enc_type ## _def[] = { 			\
 	{ V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE, "csc-colorspace" }, 	\
 	{ V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC, "csc-"#enc_type },	\
 	{ V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION, "csc-quantization" }, \
@@ -411,7 +411,7 @@ std::string mbus2s(unsigned flags, bool is_hsv)
 	return flags2s(flags, mbus_ycbcr_def);
 }
 
-static const flag_def selection_targets_def[] = {
+static constexpr flag_def selection_targets_def[] = {
 	{ V4L2_SEL_TGT_CROP_ACTIVE, "crop" },
 	{ V4L2_SEL_TGT_CROP_DEFAULT, "crop_default" },
 	{ V4L2_SEL_TGT_CROP_BOUNDS, "crop_bounds" },
@@ -519,7 +519,7 @@ std::string std2s(v4l2_std_id std, const char *sep)
 
 std::string ctrlflags2s(__u32 flags)
 {
-	static const flag_def def[] = {
+	static constexpr flag_def def[] = {
 		{ V4L2_CTRL_FLAG_GRABBED,    "grabbed" },
 		{ V4L2_CTRL_FLAG_DISABLED,   "disabled" },
 		{ V4L2_CTRL_FLAG_READ_ONLY,  "read-only" },
@@ -536,7 +536,7 @@ std::string ctrlflags2s(__u32 flags)
 	return flags2s(flags, def);
 }
 
-static const flag_def in_status_def[] = {
+static constexpr flag_def in_status_def[] = {
 	{ V4L2_IN_ST_NO_POWER,    "no power" },
 	{ V4L2_IN_ST_NO_SIGNAL,   "no signal" },
 	{ V4L2_IN_ST_NO_COLOR,    "no color" },
@@ -560,7 +560,7 @@ std::string in_status2s(__u32 status)
 	return status ? flags2s(status, in_status_def) : "ok";
 }
 
-static const flag_def input_cap_def[] = {
+static constexpr flag_def input_cap_def[] = {
 	{ V4L2_IN_CAP_DV_TIMINGS, "DV timings" },
 	{ V4L2_IN_CAP_STD, "SDTV standards" },
 	{ V4L2_IN_CAP_NATIVE_SIZE, "Native Size" },
@@ -572,7 +572,7 @@ std::string input_cap2s(__u32 capabilities)
 	return capabilities ? flags2s(capabilities, input_cap_def) : "not defined";
 }
 
-static const flag_def output_cap_def[] = {
+static constexpr flag_def output_cap_def[] = {
 	{ V4L2_OUT_CAP_DV_TIMINGS, "DV timings" },
 	{ V4L2_OUT_CAP_STD, "SDTV standards" },
 	{ V4L2_OUT_CAP_NATIVE_SIZE, "Native Size" },
@@ -630,7 +630,7 @@ std::string fbufflags2s(unsigned fl)
 	return s;
 }
 
-static const flag_def dv_standards_def[] = {
+static constexpr flag_def dv_standards_def[] = {
 	{ V4L2_DV_BT_STD_CEA861, "CTA-861" },
 	{ V4L2_DV_BT_STD_DMT, "DMT" },
 	{ V4L2_DV_BT_STD_CVT, "CVT" },
@@ -675,7 +675,7 @@ std::string dvflags2s(unsigned vsync, int val)
 	return s;
 }
 
-static const flag_def dv_caps_def[] = {
+static constexpr flag_def dv_caps_def[] = {
 	{ V4L2_DV_BT_CAP_INTERLACED, "Interlaced" },
 	{ V4L2_DV_BT_CAP_PROGRESSIVE, "Progressive" },
 	{ V4L2_DV_BT_CAP_REDUCED_BLANKING, "Reduced Blanking" },
@@ -688,7 +688,7 @@ std::string dv_caps2s(__u32 flags)
 	return flags2s(flags, dv_caps_def);
 }
 
-static const flag_def tc_flags_def[] = {
+static constexpr flag_def tc_flags_def[] = {
 	{ V4L2_TC_FLAG_DROPFRAME, "dropframe" },
 	{ V4L2_TC_FLAG_COLORFRAME, "colorframe" },
 	{ V4L2_TC_USERBITS_field, "userbits-field" },
@@ -702,7 +702,7 @@ std::string tc_flags2s(__u32 flags)
 	return flags2s(flags, tc_flags_def);
 }
 
-static const flag_def buffer_flags_def[] = {
+static constexpr flag_def buffer_flags_def[] = {
 	{ V4L2_BUF_FLAG_MAPPED, "mapped" },
 	{ V4L2_BUF_FLAG_QUEUED, "queued" },
 	{ V4L2_BUF_FLAG_DONE, "done" },
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index 8161aa453..80a9396ab 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -382,7 +382,7 @@ static void parse_freq_seek(char *optarg, struct v4l2_hw_freq_seek &seek)
 	char *subs = optarg;
 
 	while (*subs != '\0') {
-		static const char *const subopts[] = {
+		static constexpr const char *subopts[] = {
 			"dir",
 			"wrap",
 			"spacing",
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 90a503612..b25e34640 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1618,7 +1618,7 @@ int main(int argc, char **argv)
 		case OptStreamAllColorTest:
 			subs = optarg;
 			while (*subs != '\0') {
-				static const char *const subopts[] = {
+				static constexpr const char *subopts[] = {
 					"color",
 					"skip",
 					"perc",
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 045f8d54a..e515fea48 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -845,7 +845,7 @@ static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_
 		cv4l_queue &m2m_q, unsigned frame_count, int pollmode,
 		unsigned &capture_count)
 {
-	static const char *pollmode_str[] = {
+	static constexpr const char *pollmode_str[] = {
 		"",
 		" (select)",
 		" (epoll)",
diff --git a/utils/v4l2-compliance/v4l2-test-colors.cpp b/utils/v4l2-compliance/v4l2-test-colors.cpp
index 55a816949..887b2fd41 100644
--- a/utils/v4l2-compliance/v4l2-test-colors.cpp
+++ b/utils/v4l2-compliance/v4l2-test-colors.cpp
@@ -59,22 +59,22 @@ struct color {
 	double r, g, b, a;
 };
 
-static const double bt601[3][3] = {
+static constexpr double bt601[3][3] = {
 	{ 1, 0,       1.4020  },
 	{ 1, -0.3441, -0.7141 },
 	{ 1, 1.7720,  0       },
 };
-static const double rec709[3][3] = {
+static constexpr double rec709[3][3] = {
 	{ 1, 0,       1.5748  },
 	{ 1, -0.1873, -0.4681 },
 	{ 1, 1.8556,  0       },
 };
-static const double smpte240m[3][3] = {
+static constexpr double smpte240m[3][3] = {
 	{ 1, 0,       1.5756  },
 	{ 1, -0.2253, -0.4767 },
 	{ 1, 1.8270,  0       },
 };
-static const double bt2020[3][3] = {
+static constexpr double bt2020[3][3] = {
 	{ 1, 0,       1.4746  },
 	{ 1, -0.1646, -0.5714 },
 	{ 1, 1.8814,  0       },
@@ -465,7 +465,7 @@ static void getColor(const cv4l_fmt &fmt, __u8 * const planes[3],
 	}
 }
 
-static const char * const colors[] = {
+static constexpr const char *colors[] = {
 	"red",
 	"green",
 	"blue"
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
diff --git a/utils/v4l2-ctl/v4l2-ctl-edid.cpp b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
index 80ea151f5..5b5d715da 100644
--- a/utils/v4l2-ctl/v4l2-ctl-edid.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
@@ -658,19 +658,19 @@ static void print_edid_mods(const struct v4l2_edid *e)
 	}
 	loc = get_edid_vid_cap_location(e->edid, e->blocks * 128);
 	if (loc >= 0) {
-		static const char *pt_scan[] = {
+		static constexpr const char *pt_scan[] = {
 			"No Data",
 			"Always Overscanned",
 			"Always Underscanned",
 			"Supports both over- and underscan"
 		};
-		static const char *it_scan[] = {
+		static constexpr const char *it_scan[] = {
 			"IT Formats not supported",
 			"Always Overscanned",
 			"Always Underscanned",
 			"Supports both over- and underscan"
 		};
-		static const char *ce_scan[] = {
+		static constexpr const char *ce_scan[] = {
 			"CE Formats not supported",
 			"Always Overscanned",
 			"Always Underscanned",
@@ -1087,7 +1087,7 @@ void edid_cmd(int ch, char *optarg)
 			break;
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"pad",
 				"type",
 				"edid",
@@ -1307,7 +1307,7 @@ void edid_cmd(int ch, char *optarg)
 			break;
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"pad",
 				"startblock",
 				"blocks",
diff --git a/utils/v4l2-ctl/v4l2-ctl-misc.cpp b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
index 1853608a3..dc587aeb1 100644
--- a/utils/v4l2-ctl/v4l2-ctl-misc.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
@@ -178,7 +178,7 @@ void misc_cmd(int ch, char *optarg)
 	case OptSetJpegComp:
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"app0", "app1", "app2", "app3",
 				"app4", "app5", "app6", "app7",
 				"app8", "app9", "appa", "appb",
@@ -235,7 +235,7 @@ void misc_cmd(int ch, char *optarg)
 	case OptTryEncoderCmd:
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"cmd",
 				"flags",
 				nullptr
@@ -258,7 +258,7 @@ void misc_cmd(int ch, char *optarg)
 	case OptTryDecoderCmd:
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"cmd",
 				"flags",
 				"stop_pts",
diff --git a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
index 639a41757..5493222dd 100644
--- a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
@@ -209,7 +209,7 @@ void overlay_cmd(int ch, char *optarg)
 	case OptTryOverlayFormat:
 		subs = optarg;
 		while (subs && *subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"chromakey",
 				"global_alpha",
 				"left",
@@ -260,7 +260,7 @@ void overlay_cmd(int ch, char *optarg)
 		subs = optarg;
 		memset(&r, 0, sizeof(r));
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"left",
 				"top",
 				"width",
@@ -303,12 +303,12 @@ void overlay_cmd(int ch, char *optarg)
 	case OptSetFBuf:
 		subs = optarg;
 		while (*subs != '\0') {
-			const unsigned chroma_flags = V4L2_FBUF_FLAG_CHROMAKEY |
+			constexpr unsigned chroma_flags = V4L2_FBUF_FLAG_CHROMAKEY |
 						      V4L2_FBUF_FLAG_SRC_CHROMAKEY;
-			const unsigned alpha_flags = V4L2_FBUF_FLAG_GLOBAL_ALPHA |
+			constexpr unsigned alpha_flags = V4L2_FBUF_FLAG_GLOBAL_ALPHA |
 						     V4L2_FBUF_FLAG_LOCAL_ALPHA |
 						     V4L2_FBUF_FLAG_LOCAL_INV_ALPHA;
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"chromakey",
 				"src_chromakey",
 				"global_alpha",
diff --git a/utils/v4l2-ctl/v4l2-ctl-selection.cpp b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
index 4633776fb..68a39c149 100644
--- a/utils/v4l2-ctl/v4l2-ctl-selection.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
@@ -93,7 +93,7 @@ static void parse_crop(char *optarg, unsigned int &set_crop, v4l2_rect &vcrop)
 	char *subs = optarg;
 
 	while (*subs != '\0') {
-		static const char *const subopts[] = {
+		static constexpr const char *subopts[] = {
 			"left",
 			"top",
 			"width",
@@ -153,7 +153,7 @@ static int parse_selection(char *optarg, unsigned int &set_sel, v4l2_selection &
 	char *subs = optarg;
 
 	while (*subs != '\0') {
-		static const char *const subopts[] = {
+		static constexpr const char *subopts[] = {
 			"target",
 			"flags",
 			"left",
diff --git a/utils/v4l2-ctl/v4l2-ctl-stds.cpp b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
index 82571f932..08154df45 100644
--- a/utils/v4l2-ctl/v4l2-ctl-stds.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
@@ -160,7 +160,7 @@ static int parse_timing_subopt(char **subopt_str, int *value)
 	int opt;
 	char *opt_str;
 
-	static const char * const subopt_list[] = {
+	static constexpr const char *subopt_list[] = {
 		"width",
 		"height",
 		"interlaced",
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
index ecfd32443..33cc13427 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -97,7 +97,7 @@ void subdev_cmd(int ch, char *optarg)
 	case OptListSubDevFrameSizes:
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"pad",
 				"code",
 				nullptr
@@ -119,7 +119,7 @@ void subdev_cmd(int ch, char *optarg)
 	case OptListSubDevFrameIntervals:
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"pad",
 				"code",
 				"width",
@@ -153,7 +153,7 @@ void subdev_cmd(int ch, char *optarg)
 	case OptGetSubDevSelection:
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"pad",
 				"target",
 				nullptr
@@ -187,7 +187,7 @@ void subdev_cmd(int ch, char *optarg)
 		ffmt.field = V4L2_FIELD_ANY;
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"width",
 				"height",
 				"code",
@@ -256,7 +256,7 @@ void subdev_cmd(int ch, char *optarg)
 		subs = optarg;
 
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"target",
 				"flags",
 				"left",
@@ -309,7 +309,7 @@ void subdev_cmd(int ch, char *optarg)
 		subs = optarg;
 
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"pad",
 				"fps",
 				nullptr
diff --git a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
index 7d6f6f3e7..177aa8e60 100644
--- a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
@@ -157,7 +157,7 @@ static void parse_freq_seek(char *optarg, struct v4l2_hw_freq_seek &seek)
 	char *subs = optarg;
 
 	while (*subs != '\0') {
-		static const char *const subopts[] = {
+		static constexpr const char *subopts[] = {
 			"dir",
 			"wrap",
 			"spacing",
diff --git a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
index 33191aa64..dc7b4282c 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
@@ -123,7 +123,7 @@ void vbi_cmd(int ch, char *optarg)
 		subs = optarg;
 		memset(&raw->fmt.vbi, 0, sizeof(raw->fmt.vbi));
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"samplingrate",
 				"offset",
 				"samplesperline",
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index c66c248a3..cca2d4b42 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -133,7 +133,7 @@ void vidcap_cmd(int ch, char *optarg)
 	case OptListFrameIntervals:
 		subs = optarg;
 		while (*subs != '\0') {
-			static const char *const subopts[] = {
+			static constexpr const char *subopts[] = {
 				"width",
 				"height",
 				"pixelformat",
@@ -395,7 +395,7 @@ void vidcap_list(cv4l_fd &fd)
 
 void print_touch_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
 {
-	static const char img[16] = {
+	static constexpr char img[16] = {
 		'.', ',', ':', ';', '!', '|', 'i', 'c',
 		'n', 'o', 'm', 'I', 'C', 'N', 'O', 'M',
 	};
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index d91577e14..95b8a2e78 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -523,7 +523,7 @@ void printfmt(int fd, const struct v4l2_format &vfmt)
 
 static std::string frmtype2s(unsigned type)
 {
-	static const char *types[] = {
+	static constexpr const char *types[] = {
 		"Unknown",
 		"Discrete",
 		"Continuous",
@@ -764,7 +764,7 @@ int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
 	flags = 0;
 	subs = optarg;
 	while (*subs != '\0') {
-		static const char *const subopts[] = {
+		static constexpr const char *subopts[] = {
 			"width",
 			"height",
 			"pixelformat",
@@ -1033,7 +1033,7 @@ static int open_media_bus_info(const std::string &bus_info)
 }
 
 static const char *make_devname(const char *device, const char *devname,
-				const std::string &media_bus_info)
+				      const std::string &media_bus_info)
 {
 	if (device[0] >= '0' && device[0] <= '9' && strlen(device) <= 3) {
 		static char newdev[32];
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index 47b1263cf..d711c9e4f 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -494,7 +494,7 @@ int main(int argc, char **argv)
 				break;
 
 			while (*subs != '\0') {
-				static const char * const subopts[] = {
+				static constexpr const char *subopts[] = {
 					"min",
 					"max",
 					nullptr
-- 
2.30.2

