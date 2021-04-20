Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DADB6366153
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 23:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233750AbhDTVEU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 17:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233724AbhDTVET (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 17:04:19 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7507AC06174A
        for <linux-media@vger.kernel.org>; Tue, 20 Apr 2021 14:03:46 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id i190so26526200pfc.12
        for <linux-media@vger.kernel.org>; Tue, 20 Apr 2021 14:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y45aiHpqU86+JAqn5GzsEdA0y2QWZFq7gstEd/M0oBc=;
        b=pUtGdiHyBUKUzxl0NzsA0tFDnLWmQ6AMW6/SDKXspACHo8+V+gKKjpEEREKLGFypX0
         683JUrIeS9OFJNqMkSP2kV7NveeFHFOZ3z2LUky7nujvF0gTphmoeCB75FjXxgrQE+42
         NZHnsHrI8Z/1cX3QgHaMyZEDD2f5IGUWsfQ+eerpKBiegDfoek2HRA1zIJTKRpq6+Qmi
         OxPa/x8hfC+N9TDJxIuIJZQqvNqR0m409t7PkYz5RopKRqRp/Qy2i07mZRVqmp2jr4du
         mfPnUy8GK4gIhhx/BaCo6+2aCP9FoMaLnk0pgXDWVDCWnMXvm8PRjUOFvL4GqsBX0evz
         9atg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y45aiHpqU86+JAqn5GzsEdA0y2QWZFq7gstEd/M0oBc=;
        b=avRu1et6736UKMGNSzl7UOmFF3oPaWEs4C2yTDafiz3Ml9DkNNuGf32WWuUmkTsn9f
         Y3A5qacAO1s3XH+dXNO8lMKng49yOFnfG23r8EYpccSL+N5VWqnbml+EZy28/7Gf/Hvu
         kJOA5yNFj2SWv4VrjkwFhgLC6RhR2VA/hAy0+JIMzDaFZKnTkZzaWcKAA7DxUE8RsfDZ
         aIx077IcBYxDL5Y4n6qFw3Gcq+vM/S0IhY2gwwDXmiIlvHqhTqPz5+pOuaJ3EGgHwL68
         +vuDptpO6zTxxD2KvkEBv3Ey4gnDTLSSQWdtPfglltfpO4mXK5Zo6r15z3Dqa7MACWNm
         nBLg==
X-Gm-Message-State: AOAM533gCciwJmQBOKz0pm7FpxHFTkQFm6431puRGdTQQlNv+iOTw5JC
        Sm5LoLxaAgUON8IJePcc1o3diJ8Mo2qbDQ==
X-Google-Smtp-Source: ABdhPJxvC1LJQ+RHR6hIzwGmwVnS+elmqHlGVhfAo04ve4QhYaRM+d9zqBoc8wOJX7yMOYh6M8aaIw==
X-Received: by 2002:a17:90a:88e:: with SMTP id v14mr6891630pjc.107.1618952625444;
        Tue, 20 Apr 2021 14:03:45 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id z29sm16736111pga.52.2021.04.20.14.03.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 14:03:44 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCHv2] v4l-utils: switch remote_subtest arrays to vector
Date:   Tue, 20 Apr 2021 14:03:44 -0700
Message-Id: <20210420210344.4684-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Easier to read and allows removing some boilerplate code. Only a
moderate size increase.

Ran through git clang-format

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: added using statement and removed auto&&
 utils/cec-compliance/cec-compliance.h   |  28 ++--
 utils/cec-compliance/cec-test-audio.cpp | 171 ++++++++++++----------
 utils/cec-compliance/cec-test-power.cpp |  17 +--
 utils/cec-compliance/cec-test.cpp       | 182 +++++++-----------------
 4 files changed, 170 insertions(+), 228 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
index d87e4f1b7..d2949a989 100644
--- a/utils/cec-compliance/cec-compliance.h
+++ b/utils/cec-compliance/cec-compliance.h
@@ -19,6 +19,8 @@
 
 #include <cec-info.h>
 
+#include <vector>
+
 #define TAG_AUDIO_RATE_CONTROL		1
 #define TAG_ARC_CONTROL 		(1 << 1)
 #define TAG_CAP_DISCOVERY_CONTROL 	(1 << 2)
@@ -174,6 +176,8 @@ struct remote_subtest {
 	bool for_cec20;
 };
 
+using stvec = std::vector<remote_subtest>;
+
 #define OK			0
 #define FAIL			1
 #define OK_PRESUMED		2
@@ -456,25 +460,17 @@ void testRemote(struct node *node, unsigned me, unsigned la, unsigned test_tags,
 			     bool interactive);
 
 // cec-test-audio.cpp
-extern struct remote_subtest sac_subtests[];
-extern const unsigned sac_subtests_size;
-extern struct remote_subtest dal_subtests[];
-extern const unsigned dal_subtests_size;
-extern struct remote_subtest arc_subtests[];
-extern const unsigned arc_subtests_size;
-extern struct remote_subtest audio_rate_ctl_subtests[];
-extern const unsigned audio_rate_ctl_subtests_size;
+extern const stvec sac_subtests;
+extern const stvec dal_subtests;
+extern const stvec arc_subtests;
+extern const stvec audio_rate_ctl_subtests;
 
 // cec-test-power.cpp
 bool util_interactive_ensure_power_state(struct node *node, unsigned me, unsigned la, bool interactive,
 					 __u8 target_pwr);
-extern struct remote_subtest standby_subtests[];
-extern const unsigned standby_subtests_size;
-extern struct remote_subtest one_touch_play_subtests[];
-extern const unsigned one_touch_play_subtests_size;
-extern struct remote_subtest power_status_subtests[];
-extern const unsigned power_status_subtests_size;
-extern struct remote_subtest standby_resume_subtests[];
-extern const unsigned standby_resume_subtests_size;
+extern const stvec standby_subtests;
+extern const stvec one_touch_play_subtests;
+extern const stvec power_status_subtests;
+extern const stvec standby_resume_subtests;
 
 #endif
diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index 30b702e74..03294241d 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -82,14 +82,11 @@ static int dal_req_current_latency_invalid(struct node *node, unsigned me, unsig
 	return 0;
 }
 
-struct remote_subtest dal_subtests[] = {
+const stvec dal_subtests{
 	{ "Request Current Latency", CEC_LOG_ADDR_MASK_ALL, dal_request_current_latency },
 	{ "Request Current Latency with invalid PA", CEC_LOG_ADDR_MASK_ALL, dal_req_current_latency_invalid },
 };
 
-const unsigned dal_subtests_size = ARRAY_SIZE(dal_subtests);
-
-
 /* Audio Return Channel Control */
 
 static __u16 pa_common_mask(__u16 pa1, __u16 pa2)
@@ -274,16 +271,13 @@ static int arc_terminate_rx(struct node *node, unsigned me, unsigned la, bool in
 	return 0;
 }
 
-struct remote_subtest arc_subtests[] = {
+const stvec arc_subtests{
 	{ "Initiate ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_initiate_rx },
 	{ "Terminate ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_terminate_rx },
 	{ "Initiate ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_initiate_tx },
 	{ "Terminate ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_terminate_tx },
 };
 
-const unsigned arc_subtests_size = ARRAY_SIZE(arc_subtests);
-
-
 /* System Audio Control */
 
 /*
@@ -762,66 +756,99 @@ static int sac_system_audio_mode_req_off(struct node *node, unsigned me, unsigne
 	return 0;
 }
 
-struct remote_subtest sac_subtests[] = {
-	{ "Request Short Audio Descriptor",
-	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
-	  sac_request_sad_probe },
-	{ "Request Short Audio Descriptor, invalid",
-	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
-	  sac_request_sad_invalid },
-	{ "Report Short Audio Descriptor consistency",
-	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
-	  sac_sad_format_check },
-	{ "Report Short Audio Descriptor, multiple requests in one",
-	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
-	  sac_sad_req_multiple },
-	{ "Set System Audio Mode (directly addressed)",
-	  CEC_LOG_ADDR_MASK_TV,
-	  sac_set_system_audio_mode_direct },
-	{ "Set System Audio Mode (broadcast on)",
-	  CEC_LOG_ADDR_MASK_TV,
-	  sac_set_system_audio_mode_broadcast_on },
-	{ "System Audio Mode Status",
-	  CEC_LOG_ADDR_MASK_TV,
-	  sac_system_audio_mode_status },
-	{ "System Audio Mode Request (on)",
-	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
-	  sac_system_audio_mode_req_on },
-	{ "Give System Audio Mode Status",
-	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
-	  sac_give_system_audio_mode_status },
-	{ "Give Audio Status",
-	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
-	  sac_give_audio_status },
-	{ "User Control Pressed (Volume Up)",
-	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
-	  sac_user_control_press_vol_up },
-	{ "User Control Pressed (Volume Down)",
-	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
-	  sac_user_control_press_vol_down },
-	{ "User Control Pressed (Mute)",
-	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
-	  sac_user_control_press_mute },
-	{ "User Control Pressed (Restore Volume Function)",
-	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
-	  sac_user_control_press_restore_volume_function },
-	{ "User Control Pressed (Mute Function)",
-	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
-	  sac_user_control_press_mute_function },
-	{ "User Control Released (Audio)",
-	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
-	  sac_user_control_release },
-	{ "Set System Audio Mode (broadcast off)",
-	  CEC_LOG_ADDR_MASK_TV,
-	  sac_set_system_audio_mode_broadcast_off },
-	{ "System Audio Mode Request (off)",
-	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
-	  sac_system_audio_mode_req_off },
+const stvec sac_subtests{
+	{
+		"Request Short Audio Descriptor",
+		CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
+		sac_request_sad_probe,
+	},
+	{
+		"Request Short Audio Descriptor, invalid",
+		CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
+		sac_request_sad_invalid,
+	},
+	{
+		"Report Short Audio Descriptor consistency",
+		CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
+		sac_sad_format_check,
+	},
+	{
+		"Report Short Audio Descriptor, multiple requests in one",
+		CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
+		sac_sad_req_multiple,
+	},
+	{
+		"Set System Audio Mode (directly addressed)",
+		CEC_LOG_ADDR_MASK_TV,
+		sac_set_system_audio_mode_direct,
+	},
+	{
+		"Set System Audio Mode (broadcast on)",
+		CEC_LOG_ADDR_MASK_TV,
+		sac_set_system_audio_mode_broadcast_on,
+	},
+	{
+		"System Audio Mode Status",
+		CEC_LOG_ADDR_MASK_TV,
+		sac_system_audio_mode_status,
+	},
+	{
+		"System Audio Mode Request (on)",
+		CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
+		sac_system_audio_mode_req_on,
+	},
+	{
+		"Give System Audio Mode Status",
+		CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
+		sac_give_system_audio_mode_status,
+	},
+	{
+		"Give Audio Status",
+		CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
+		sac_give_audio_status,
+	},
+	{
+		"User Control Pressed (Volume Up)",
+		CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
+		sac_user_control_press_vol_up,
+	},
+	{
+		"User Control Pressed (Volume Down)",
+		CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
+		sac_user_control_press_vol_down,
+	},
+	{
+		"User Control Pressed (Mute)",
+		CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
+		sac_user_control_press_mute,
+	},
+	{
+		"User Control Pressed (Restore Volume Function)",
+		CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
+		sac_user_control_press_restore_volume_function,
+	},
+	{
+		"User Control Pressed (Mute Function)",
+		CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
+		sac_user_control_press_mute_function,
+	},
+	{
+		"User Control Released (Audio)",
+		CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
+		sac_user_control_release,
+	},
+	{
+		"Set System Audio Mode (broadcast off)",
+		CEC_LOG_ADDR_MASK_TV,
+		sac_set_system_audio_mode_broadcast_off,
+	},
+	{
+		"System Audio Mode Request (off)",
+		CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
+		sac_system_audio_mode_req_off,
+	},
 };
 
-const unsigned sac_subtests_size = ARRAY_SIZE(sac_subtests);
-
-
 /* Audio Rate Control */
 
 /*
@@ -848,10 +875,10 @@ static int audio_rate_ctl_set_audio_rate(struct node *node, unsigned me, unsigne
 	return OK_PRESUMED;
 }
 
-struct remote_subtest audio_rate_ctl_subtests[] = {
-	{ "Set Audio Rate",
-	  CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_TUNER,
-	  audio_rate_ctl_set_audio_rate },
+const stvec audio_rate_ctl_subtests{
+	{
+		"Set Audio Rate",
+		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_TUNER,
+		audio_rate_ctl_set_audio_rate,
+	},
 };
-
-const unsigned audio_rate_ctl_subtests_size = ARRAY_SIZE(audio_rate_ctl_subtests);
diff --git a/utils/cec-compliance/cec-test-power.cpp b/utils/cec-compliance/cec-test-power.cpp
index 42f4d2980..c26944609 100644
--- a/utils/cec-compliance/cec-test-power.cpp
+++ b/utils/cec-compliance/cec-test-power.cpp
@@ -6,6 +6,7 @@
 #include <cerrno>
 #include <ctime>
 #include <string>
+#include <vector>
 
 #include <sys/ioctl.h>
 #include <unistd.h>
@@ -95,14 +96,11 @@ static int power_status_report(struct node *node, unsigned me, unsigned la, bool
 	return OK_PRESUMED;
 }
 
-struct remote_subtest power_status_subtests[] = {
+const stvec power_status_subtests{
 	{ "Give Device Power Status", CEC_LOG_ADDR_MASK_ALL, power_status_give },
 	{ "Report Device Power Status", CEC_LOG_ADDR_MASK_ALL, power_status_report },
 };
 
-const unsigned power_status_subtests_size = ARRAY_SIZE(power_status_subtests);
-
-
 /* One Touch Play */
 
 static int one_touch_play_view_on(struct node *node, unsigned me, unsigned la, bool interactive,
@@ -233,7 +231,7 @@ static int one_touch_play_req_active_source(struct node *node, unsigned me, unsi
 	return 0;
 }
 
-struct remote_subtest one_touch_play_subtests[] = {
+const stvec one_touch_play_subtests{
 	{ "Image View On", CEC_LOG_ADDR_MASK_TV, one_touch_play_image_view_on },
 	{ "Text View On", CEC_LOG_ADDR_MASK_TV, one_touch_play_text_view_on },
 	{ "Wakeup on Image View On", CEC_LOG_ADDR_MASK_TV, one_touch_play_image_view_on_wakeup },
@@ -243,9 +241,6 @@ struct remote_subtest one_touch_play_subtests[] = {
 	{ "Active Source and Request Active Source", CEC_LOG_ADDR_MASK_ALL, one_touch_play_req_active_source },
 };
 
-const unsigned one_touch_play_subtests_size = ARRAY_SIZE(one_touch_play_subtests);
-
-
 /* Standby / Resume */
 
 /* The default sleep time between power status requests. */
@@ -638,7 +633,7 @@ static int power_state_transitions(struct node *node, unsigned me, unsigned la,
 	return 0;
 }
 
-struct remote_subtest standby_resume_subtests[] = {
+const stvec standby_resume_subtests{
 	{ "Standby", CEC_LOG_ADDR_MASK_ALL, standby_resume_standby },
 	{ "Repeated Standby message does not wake up", CEC_LOG_ADDR_MASK_ALL, standby_resume_standby_toggle },
 	{ "Standby: Feature aborts unknown messages", CEC_LOG_ADDR_MASK_ALL, core_unknown, true },
@@ -652,10 +647,8 @@ struct remote_subtest standby_resume_subtests[] = {
 	{ "Standby: Get Menu Language", CEC_LOG_ADDR_MASK_ALL, system_info_get_menu_lang, true },
 	{ "Standby: Give Device Features", CEC_LOG_ADDR_MASK_ALL, system_info_give_features, true },
 	{ "No wakeup on Active Source", CEC_LOG_ADDR_MASK_ALL, standby_resume_active_source_nowake },
-	{ "Wake up", CEC_LOG_ADDR_MASK_ALL, standby_resume_wakeup},
+	{ "Wake up", CEC_LOG_ADDR_MASK_ALL, standby_resume_wakeup },
 	{ "Wake up TV on Image View On", CEC_LOG_ADDR_MASK_TV, standby_resume_wakeup_image_view_on },
 	{ "Wake up TV on Text View On", CEC_LOG_ADDR_MASK_TV, standby_resume_wakeup_text_view_on },
 	{ "Power State Transitions", CEC_LOG_ADDR_MASK_TV, power_state_transitions, false, true },
 };
-
-const unsigned standby_resume_subtests_size = ARRAY_SIZE(standby_resume_subtests);
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 8a9ea2afe..978d04ec4 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -13,14 +13,10 @@
 
 #include "cec-compliance.h"
 
-#define test_case(name, tags, subtests) {name, tags, subtests, ARRAY_SIZE(subtests)}
-#define test_case_ext(name, tags, subtests) {name, tags, subtests, subtests##_size}
-
 struct remote_test {
 	const char *name;
 	const unsigned tags;
-	struct remote_subtest *subtests;
-	unsigned num_subtests;
+	const stvec &subtests;
 };
 
 
@@ -178,7 +174,7 @@ int system_info_give_features(struct node *node, unsigned me, unsigned la, bool
 	return 0;
 }
 
-static struct remote_subtest system_info_subtests[] = {
+static const stvec system_info_subtests{
 	{ "Polling Message", CEC_LOG_ADDR_MASK_ALL, system_info_polling },
 	{ "Give Physical Address", CEC_LOG_ADDR_MASK_ALL, system_info_phys_addr },
 	{ "Give CEC Version", CEC_LOG_ADDR_MASK_ALL, system_info_version },
@@ -187,7 +183,6 @@ static struct remote_subtest system_info_subtests[] = {
 	{ "Give Device Features", CEC_LOG_ADDR_MASK_ALL, system_info_give_features },
 };
 
-
 /* Core behavior */
 
 int core_unknown(struct node *node, unsigned me, unsigned la, bool interactive)
@@ -237,12 +232,11 @@ int core_abort(struct node *node, unsigned me, unsigned la, bool interactive)
 	return 0;
 }
 
-static struct remote_subtest core_subtests[] = {
+static const stvec core_subtests{
 	{ "Feature aborts unknown messages", CEC_LOG_ADDR_MASK_ALL, core_unknown },
 	{ "Feature aborts Abort message", CEC_LOG_ADDR_MASK_ALL, core_abort },
 };
 
-
 /* Vendor Specific Commands */
 
 int vendor_specific_commands_id(struct node *node, unsigned me, unsigned la, bool interactive)
@@ -265,11 +259,10 @@ int vendor_specific_commands_id(struct node *node, unsigned me, unsigned la, boo
 	return 0;
 }
 
-static struct remote_subtest vendor_specific_subtests[] = {
+static const stvec vendor_specific_subtests{
 	{ "Give Device Vendor ID", CEC_LOG_ADDR_MASK_ALL, vendor_specific_commands_id },
 };
 
-
 /* Device OSD Transfer */
 
 static int device_osd_transfer_set(struct node *node, unsigned me, unsigned la, bool interactive)
@@ -317,12 +310,11 @@ int device_osd_transfer_give(struct node *node, unsigned me, unsigned la, bool i
 	return 0;
 }
 
-static struct remote_subtest device_osd_transfer_subtests[] = {
+static const stvec device_osd_transfer_subtests{
 	{ "Set OSD Name", CEC_LOG_ADDR_MASK_ALL, device_osd_transfer_set },
 	{ "Give OSD Name", CEC_LOG_ADDR_MASK_ALL, device_osd_transfer_give },
 };
 
-
 /* OSD Display */
 
 static int osd_string_set_default(struct node *node, unsigned me, unsigned la, bool interactive)
@@ -418,13 +410,12 @@ static int osd_string_invalid(struct node *node, unsigned me, unsigned la, bool
 	return 0;
 }
 
-static struct remote_subtest osd_string_subtests[] = {
+static const stvec osd_string_subtests{
 	{ "Set OSD String with default timeout", CEC_LOG_ADDR_MASK_TV, osd_string_set_default },
 	{ "Set OSD String with no timeout", CEC_LOG_ADDR_MASK_TV, osd_string_set_until_clear },
 	{ "Set OSD String with invalid operand", CEC_LOG_ADDR_MASK_TV, osd_string_invalid },
 };
 
-
 /* Routing Control */
 
 static int routing_control_inactive_source(struct node *node, unsigned me, unsigned la, bool interactive)
@@ -525,14 +516,13 @@ static int routing_control_set_stream_path(struct node *node, unsigned me, unsig
 	return OK_PRESUMED;
 }
 
-static struct remote_subtest routing_control_subtests[] = {
+static const stvec routing_control_subtests{
 	{ "Active Source", CEC_LOG_ADDR_MASK_TV, routing_control_active_source },
 	{ "Request Active Source", CEC_LOG_ADDR_MASK_ALL, routing_control_req_active_source },
 	{ "Inactive Source", CEC_LOG_ADDR_MASK_TV, routing_control_inactive_source },
 	{ "Set Stream Path", CEC_LOG_ADDR_MASK_ALL, routing_control_set_stream_path },
 };
 
-
 /* Remote Control Passthrough */
 
 static int rc_passthrough_user_ctrl_pressed(struct node *node, unsigned me, unsigned la, bool interactive)
@@ -573,12 +563,11 @@ static int rc_passthrough_user_ctrl_released(struct node *node, unsigned me, uns
 	return OK_PRESUMED;
 }
 
-static struct remote_subtest rc_passthrough_subtests[] = {
+static const stvec rc_passthrough_subtests{
 	{ "User Control Pressed", CEC_LOG_ADDR_MASK_ALL, rc_passthrough_user_ctrl_pressed },
 	{ "User Control Released", CEC_LOG_ADDR_MASK_ALL, rc_passthrough_user_ctrl_released },
 };
 
-
 /* Device Menu Control */
 
 /*
@@ -604,13 +593,12 @@ static int dev_menu_ctl_request(struct node *node, unsigned me, unsigned la, boo
 	return 0;
 }
 
-static struct remote_subtest dev_menu_ctl_subtests[] = {
+static const stvec dev_menu_ctl_subtests{
 	{ "Menu Request", static_cast<__u16>(~CEC_LOG_ADDR_MASK_TV), dev_menu_ctl_request },
 	{ "User Control Pressed", CEC_LOG_ADDR_MASK_ALL, rc_passthrough_user_ctrl_pressed },
 	{ "User Control Released", CEC_LOG_ADDR_MASK_ALL, rc_passthrough_user_ctrl_released },
 };
 
-
 /* Deck Control */
 
 /*
@@ -704,22 +692,13 @@ static int deck_ctl_play(struct node *node, unsigned me, unsigned la, bool inter
 	return OK_PRESUMED;
 }
 
-static struct remote_subtest deck_ctl_subtests[] = {
-	{ "Give Deck Status",
-	  CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
-	  deck_ctl_give_status },
-	{ "Deck Status",
-	  CEC_LOG_ADDR_MASK_ALL,
-	  deck_ctl_deck_status },
-	{ "Deck Control",
-	  CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
-	  deck_ctl_deck_ctl },
-	{ "Play",
-	  CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
-	  deck_ctl_play },
+static const stvec deck_ctl_subtests{
+	{ "Give Deck Status", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, deck_ctl_give_status },
+	{ "Deck Status", CEC_LOG_ADDR_MASK_ALL, deck_ctl_deck_status },
+	{ "Deck Control", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, deck_ctl_deck_ctl },
+	{ "Play", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, deck_ctl_play },
 };
 
-
 /* Tuner Control */
 
 static const char *bcast_type2s(__u8 bcast_type)
@@ -957,11 +936,10 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
 	return 0;
 }
 
-static struct remote_subtest tuner_ctl_subtests[] = {
+static const stvec tuner_ctl_subtests{
 	{ "Tuner Control", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_test },
 };
 
-
 /* One Touch Record */
 
 /*
@@ -1061,14 +1039,13 @@ static int one_touch_rec_status(struct node *node, unsigned me, unsigned la, boo
 	return 0;
 }
 
-static struct remote_subtest one_touch_rec_subtests[] = {
+static const stvec one_touch_rec_subtests{
 	{ "Record TV Screen", CEC_LOG_ADDR_MASK_TV, one_touch_rec_tv_screen },
 	{ "Record On", CEC_LOG_ADDR_MASK_RECORD, one_touch_rec_on },
 	{ "Record Off", CEC_LOG_ADDR_MASK_RECORD, one_touch_rec_off },
 	{ "Record Status", CEC_LOG_ADDR_MASK_ALL, one_touch_rec_status },
 };
 
-
 /* Timer Programming */
 
 /*
@@ -1281,7 +1258,7 @@ static int timer_prog_timer_clear_status(struct node *node, unsigned me, unsigne
 	return OK_PRESUMED;
 }
 
-static struct remote_subtest timer_prog_subtests[] = {
+static const stvec timer_prog_subtests{
 	{ "Set Analogue Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_set_analog_timer },
 	{ "Set Digital Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_set_digital_timer },
 	{ "Set Timer Program Title", CEC_LOG_ADDR_MASK_RECORD, timer_prog_set_prog_title },
@@ -1384,11 +1361,10 @@ static int cdc_hec_discover(struct node *node, unsigned me, unsigned la, bool pr
 	return OK_NOT_SUPPORTED;
 }
 
-static struct remote_subtest cdc_subtests[] = {
+static const stvec cdc_subtests{
 	{ "CDC_HEC_Discover", CEC_LOG_ADDR_MASK_ALL, cdc_hec_discover },
 };
 
-
 /* Post-test checks */
 
 static int post_test_check_recognized(struct node *node, unsigned me, unsigned la, bool interactive)
@@ -1409,79 +1385,33 @@ static int post_test_check_recognized(struct node *node, unsigned me, unsigned l
 	return 0;
 }
 
-static struct remote_subtest post_test_subtests[] = {
+static const stvec post_test_subtests{
 	{ "Recognized/unrecognized message consistency", CEC_LOG_ADDR_MASK_ALL, post_test_check_recognized },
 };
 
-
-static const struct remote_test tests[] = {
-	test_case("Core",
-		  TAG_CORE,
-		  core_subtests),
-	test_case_ext("Give Device Power Status feature",
-		      TAG_POWER_STATUS,
-		      power_status_subtests),
-	test_case("System Information feature",
-		  TAG_SYSTEM_INFORMATION,
-		  system_info_subtests),
-	test_case("Vendor Specific Commands feature",
-		  TAG_VENDOR_SPECIFIC_COMMANDS,
-		  vendor_specific_subtests),
-	test_case("Device OSD Transfer feature",
-		  TAG_DEVICE_OSD_TRANSFER,
-		  device_osd_transfer_subtests),
-	test_case("OSD String feature",
-		  TAG_OSD_DISPLAY,
-		  osd_string_subtests),
-	test_case("Remote Control Passthrough feature",
-		  TAG_REMOTE_CONTROL_PASSTHROUGH,
-		  rc_passthrough_subtests),
-	test_case("Device Menu Control feature",
-		  TAG_DEVICE_MENU_CONTROL,
-		  dev_menu_ctl_subtests),
-	test_case("Deck Control feature",
-		  TAG_DECK_CONTROL,
-		  deck_ctl_subtests),
-	test_case("Tuner Control feature",
-		  TAG_TUNER_CONTROL,
-		  tuner_ctl_subtests),
-	test_case("One Touch Record feature",
-		  TAG_ONE_TOUCH_RECORD,
-		  one_touch_rec_subtests),
-	test_case("Timer Programming feature",
-		  TAG_TIMER_PROGRAMMING,
-		  timer_prog_subtests),
-	test_case("Capability Discovery and Control feature",
-		  TAG_CAP_DISCOVERY_CONTROL,
-		  cdc_subtests),
-	test_case_ext("Dynamic Auto Lipsync feature",
-		      TAG_DYNAMIC_AUTO_LIPSYNC,
-		      dal_subtests),
-	test_case_ext("Audio Return Channel feature",
-		      TAG_ARC_CONTROL,
-		      arc_subtests),
-	test_case_ext("System Audio Control feature",
-		      TAG_SYSTEM_AUDIO_CONTROL,
-		      sac_subtests),
-	test_case_ext("Audio Rate Control feature",
-		      TAG_AUDIO_RATE_CONTROL,
-		      audio_rate_ctl_subtests),
-	test_case_ext("One Touch Play feature",
-		      TAG_ONE_TOUCH_PLAY,
-		      one_touch_play_subtests),
-	test_case("Routing Control feature",
-		  TAG_ROUTING_CONTROL,
-		  routing_control_subtests),
-	test_case_ext("Standby/Resume and Power Status",
-		      TAG_POWER_STATUS | TAG_STANDBY_RESUME,
-		      standby_resume_subtests),
-	test_case("Post-test checks",
-		  TAG_CORE,
-		  post_test_subtests),
+static const remote_test tests[] = {
+	{ "Core", TAG_CORE, core_subtests },
+	{ "Give Device Power Status feature", TAG_POWER_STATUS, power_status_subtests },
+	{ "System Information feature", TAG_SYSTEM_INFORMATION, system_info_subtests },
+	{ "Vendor Specific Commands feature", TAG_VENDOR_SPECIFIC_COMMANDS, vendor_specific_subtests },
+	{ "Device OSD Transfer feature", TAG_DEVICE_OSD_TRANSFER, device_osd_transfer_subtests },
+	{ "OSD String feature", TAG_OSD_DISPLAY, osd_string_subtests },
+	{ "Remote Control Passthrough feature", TAG_REMOTE_CONTROL_PASSTHROUGH, rc_passthrough_subtests },
+	{ "Device Menu Control feature", TAG_DEVICE_MENU_CONTROL, dev_menu_ctl_subtests },
+	{ "Deck Control feature", TAG_DECK_CONTROL, deck_ctl_subtests },
+	{ "Tuner Control feature", TAG_TUNER_CONTROL, tuner_ctl_subtests },
+	{ "One Touch Record feature", TAG_ONE_TOUCH_RECORD, one_touch_rec_subtests },
+	{ "Timer Programming feature", TAG_TIMER_PROGRAMMING, timer_prog_subtests },
+	{ "Capability Discovery and Control feature", TAG_CAP_DISCOVERY_CONTROL, cdc_subtests },
+	{ "Dynamic Auto Lipsync feature", TAG_DYNAMIC_AUTO_LIPSYNC, dal_subtests },
+	{ "Audio Return Channel feature", TAG_ARC_CONTROL, arc_subtests },
+	{ "System Audio Control feature", TAG_SYSTEM_AUDIO_CONTROL, sac_subtests },
+	{ "Audio Rate Control feature", TAG_AUDIO_RATE_CONTROL, audio_rate_ctl_subtests },
+	{ "Routing Control feature", TAG_ROUTING_CONTROL, routing_control_subtests },
+	{ "Standby/Resume and Power Status", TAG_POWER_STATUS | TAG_STANDBY_RESUME, standby_resume_subtests },
+	{ "Post-test checks", TAG_CORE, post_test_subtests },
 };
 
-static const unsigned num_tests = sizeof(tests) / sizeof(struct remote_test);
-
 static std::map<std::string, int> mapTests;
 static std::map<std::string, bool> mapTestsNoWarnings;
 
@@ -1490,14 +1420,13 @@ void collectTests()
 	std::map<std::string, __u64> mapTestFuncs;
 
 	for (const auto &test : tests) {
-		for (unsigned j = 0; j < test.num_subtests; j++) {
-			std::string name = safename(test.subtests[j].name);
-			auto func = (__u64)test.subtests[j].test_fn;
+		for (const auto &subtest : test.subtests) {
+			std::string name = safename(subtest.name);
+			auto func = (__u64)subtest.test_fn;
 
 			if (mapTestFuncs.find(name) != mapTestFuncs.end() &&
 			    mapTestFuncs[name] != func) {
-				fprintf(stderr, "Duplicate subtest name, but different tests: %s\n",
-					test.subtests[j].name);
+				fprintf(stderr, "Duplicate subtest name, but different tests: %s\n", subtest.name);
 				std::exit(EXIT_FAILURE);
 			}
 			mapTestFuncs[name] = func;
@@ -1511,10 +1440,8 @@ void listTests()
 {
 	for (const auto &test : tests) {
 		printf("%s:\n", test.name);
-		for (unsigned j = 0; j < test.num_subtests; j++) {
-			std::string name = safename(test.subtests[j].name);
-
-			printf("\t%s\n", name.c_str());
+		for (const auto &subtest : test.subtests) {
+			printf("\t%s\n", safename(subtest.name).c_str());
 		}
 	}
 }
@@ -1558,27 +1485,26 @@ void testRemote(struct node *node, unsigned me, unsigned la, unsigned test_tags,
 			continue;
 
 		printf("\t%s:\n", test.name);
-		for (unsigned j = 0; j < test.num_subtests; j++) {
-			const char *name = test.subtests[j].name;
+		for (const auto &subtest : test.subtests) {
+			const char *name = subtest.name;
 
-			if (test.subtests[j].for_cec20 &&
-			    (node->remote[la].cec_version < CEC_OP_CEC_VERSION_2_0 ||
-			     !node->has_cec20))
+			if (subtest.for_cec20 &&
+			    (node->remote[la].cec_version < CEC_OP_CEC_VERSION_2_0 || !node->has_cec20))
 				continue;
 
-			if (test.subtests[j].in_standby) {
+			if (subtest.in_standby) {
 				struct cec_log_addrs laddrs = { };
 				doioctl(node, CEC_ADAP_G_LOG_ADDRS, &laddrs);
 
 				if (!laddrs.log_addr_mask)
 					continue;
 			}
-			node->in_standby = test.subtests[j].in_standby;
+			node->in_standby = subtest.in_standby;
 			mode_set_initiator(node);
 			unsigned old_warnings = warnings;
-			ret = test.subtests[j].test_fn(node, me, la, interactive);
+			ret = subtest.test_fn(node, me, la, interactive);
 			bool has_warnings = old_warnings < warnings;
-			if (!(test.subtests[j].la_mask & (1 << la)) && !ret)
+			if (!(subtest.la_mask & (1 << la)) && !ret)
 				ret = OK_UNEXPECTED;
 
 			if (mapTests[safename(name)] != DONT_CARE) {
-- 
2.30.2

