Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808613A88E8
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 20:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbhFOSzV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 14:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbhFOSzU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 14:55:20 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1104FC061574
        for <linux-media@vger.kernel.org>; Tue, 15 Jun 2021 11:53:15 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id fy24-20020a17090b0218b029016c5a59021fso2451422pjb.0
        for <linux-media@vger.kernel.org>; Tue, 15 Jun 2021 11:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m/VAg4al1i+asDty6ZiTw3R0AoVt0WRT+57toOA0FXA=;
        b=jVVOG981v570NH1HRGbl4znfE36N/LiJ4yHMP5GoizlZCUvGyAVIRDARy2HiphwNJ4
         YG2REzHXrdLpCou4jp926lDD7iaHSk25P5/bk2cT0JWvjO3tTzCK8vD+uXVrxXnwGoSq
         dObwIRNtDlsMk0w0VF1MUO8aOq7M7To4RMJRfNJUdexHfST+frFn5Lll8sV1FiyR8SC5
         +3dNoN45Kj7j+uo9RvlBmVEJ+eLtr1s50RlIqHAQPqsEBmG1wVv5uaGvu4tBqiTYqL/J
         7uM2XyFYpT1zMKCoTvJtCJEeuO+Dre17me5TbZNt5cPJN5Y1+MPKGUhBUyv3t1BqgBDt
         rg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m/VAg4al1i+asDty6ZiTw3R0AoVt0WRT+57toOA0FXA=;
        b=nN0KaUWD8QHHUAwNwEs0Vms6cRubNKpZGCFvSc+ocmTA5e3EAu5ced/JmEjvYhtn2h
         6a1MkQ1cE0ueWW343QHGz7W0MolWJz+fzgGxhxs0P4BDzHZEArm9MQZDGHtaXIEAHD/f
         fCrpOwRUelqOej+dZhF9PJE2riOSBvUyeim4GosWcfCsSY5ogP7TqE1irI4fGvd32Ire
         zx6CrTxSAY26XIiwcK9nBdkpWuIcHa5/xZnRBZakPQsiZ6PT/ny+A9Ux1clQ/Fu3mJsL
         pS1/639AjYQbmSyTHQfIwJ+Wfg7v6LXiv3hjrpZ3jaFw+SVFbqkv6RePk/aNGFwoaBB9
         pFmg==
X-Gm-Message-State: AOAM533DCR0Hml91JGbAZvOzhu9LfS3QPjKvaIPidCaB+rCi4eVVCQnU
        8daSMI4jU8lXSxY1kytFGe0dKuFhK3mvNA==
X-Google-Smtp-Source: ABdhPJyjs8TKBr2hTcnPLXtCtrN9RsFrZ8WUZTfVKAjjfPk+JGJ1/9azVmMPknj1/FEdi/AUSQ7C0g==
X-Received: by 2002:a17:902:7c92:b029:111:2ca8:3d8e with SMTP id y18-20020a1709027c92b02901112ca83d8emr5564310pll.77.1623783194359;
        Tue, 15 Jun 2021 11:53:14 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id k7sm3184422pjj.46.2021.06.15.11.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 11:53:13 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH] cec: remove redundant struct cec_msg initializations
Date:   Tue, 15 Jun 2021 11:53:07 -0700
Message-Id: <20210615185307.13856-1-deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is redundant to initialize a struct cec_msg variable with an empty list
if the variable is also initialized by a call to cec_msg_init. Remove
these redundant initializations.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-compliance/cec-compliance.cpp   |  2 +-
 utils/cec-compliance/cec-test-adapter.cpp |  2 +-
 utils/cec-compliance/cec-test-audio.cpp   | 46 ++++++------
 utils/cec-compliance/cec-test-power.cpp   | 26 +++----
 utils/cec-compliance/cec-test.cpp         | 88 +++++++++++------------
 utils/cec-ctl/cec-ctl.cpp                 |  2 +-
 utils/cec-follower/cec-processing.cpp     |  6 +-
 7 files changed, 86 insertions(+), 86 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index 322bc772..c04904c2 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -741,7 +741,7 @@ static int poll_remote_devs(struct node *node)
 
 static void topology_probe_device(struct node *node, unsigned i, unsigned la)
 {
-	struct cec_msg msg = { };
+	struct cec_msg msg;
 	bool unknown;
 
 	printf("\tSystem Information for device %d (%s) from device %d (%s):\n",
diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compliance/cec-test-adapter.cpp
index df7feb21..81eb4013 100644
--- a/utils/cec-compliance/cec-test-adapter.cpp
+++ b/utils/cec-compliance/cec-test-adapter.cpp
@@ -261,7 +261,7 @@ static int testAdapLogAddrs(struct node *node)
 
 static int testTransmit(struct node *node)
 {
-	struct cec_msg msg = { };
+	struct cec_msg msg;
 	unsigned i, la = node->log_addr[0];
 	unsigned valid_la = 15, invalid_la = 15;
 	bool tested_self = false;
diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index 5937a0be..611f600f 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -213,7 +213,7 @@ static void sad_decode(struct short_audio_desc *sad, __u32 descriptor)
 
 static int dal_request_current_latency(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_request_current_latency(&msg, true, node->remote[la].phys_addr);
@@ -276,7 +276,7 @@ static int dal_request_current_latency(struct node *node, unsigned me, unsigned
 
 static int dal_req_current_latency_invalid(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	/* Test that there is no reply when the physical address operand is not the
 	   physical address of the remote device. */
@@ -334,7 +334,7 @@ static int arc_initiate_tx(struct node *node, unsigned me, unsigned la, bool int
 	if (pa_is_upstream_from(node->phys_addr, node->remote[la].phys_addr))
 		return NOTAPPLICABLE;
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	/*
 	 * Note that this is a special case: INITIATE_ARC can reply with two possible
@@ -377,7 +377,7 @@ static int arc_terminate_tx(struct node *node, unsigned me, unsigned la, bool in
 	if (!node->remote[la].arc_initiated)
 		return NOTAPPLICABLE;
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_terminate_arc(&msg, true);
@@ -404,7 +404,7 @@ static int arc_initiate_rx(struct node *node, unsigned me, unsigned la, bool int
 	if (pa_is_upstream_from(node->remote[la].phys_addr, node->phys_addr))
 		return NOTAPPLICABLE;
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_request_arc_initiation(&msg, true);
@@ -452,7 +452,7 @@ static int arc_terminate_rx(struct node *node, unsigned me, unsigned la, bool in
 	if (!node->remote[la].arc_initiated)
 		return NOTAPPLICABLE;
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_request_arc_termination(&msg, true);
@@ -526,7 +526,7 @@ const vec_remote_subtests arc_subtests{
 
 static int sac_request_sad_probe(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	__u8 audio_format_id = 0;
 	__u8 audio_format_code = 1;
 
@@ -550,7 +550,7 @@ static int sac_request_sad_invalid(struct node *node, unsigned me, unsigned la,
 	if (!node->remote[la].has_sad)
 		return NOTAPPLICABLE;
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	__u8 audio_format_id = CEC_OP_AUD_FMT_ID_CEA861;
 	__u8 audio_format_code = 63; // This is outside the range of CEA861-F
 
@@ -572,7 +572,7 @@ static int sac_sad_format_check(struct node *node, unsigned me, unsigned la, boo
 	if (!node->remote[la].has_sad)
 		return NOTAPPLICABLE;
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	__u8 audio_format_id;
 	__u8 audio_format_code;
 
@@ -627,7 +627,7 @@ static int sac_sad_req_multiple(struct node *node, unsigned me, unsigned la, boo
 	/* Check that if we got a response to a Request Short Audio Descriptor
 	   with a single format, we also get a response when the same audio format
 	   occurs in a request together with other formats. */
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	__u8 audio_format_id[4] = { };
 	__u8 audio_format_code[4];
 
@@ -648,7 +648,7 @@ static int sac_sad_req_multiple(struct node *node, unsigned me, unsigned la, boo
 
 static int sac_set_system_audio_mode_direct(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_set_system_audio_mode(&msg, CEC_OP_SYS_AUD_STATUS_ON);
@@ -666,7 +666,7 @@ static int sac_set_system_audio_mode_direct(struct node *node, unsigned me, unsi
 
 static int sac_set_system_audio_mode_broadcast_on(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, CEC_LOG_ADDR_BROADCAST);
 	cec_msg_set_system_audio_mode(&msg, CEC_OP_SYS_AUD_STATUS_ON);
@@ -677,7 +677,7 @@ static int sac_set_system_audio_mode_broadcast_on(struct node *node, unsigned me
 
 static int sac_system_audio_mode_status(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	/* The device shall not feature abort System Audio Status if it did not
 	   feature abort Set System Audio Mode.
@@ -701,7 +701,7 @@ static int sac_system_audio_mode_status(struct node *node, unsigned me, unsigned
 
 static int sac_set_system_audio_mode_broadcast_off(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, CEC_LOG_ADDR_BROADCAST);
 	cec_msg_set_system_audio_mode(&msg, CEC_OP_SYS_AUD_STATUS_OFF);
@@ -712,7 +712,7 @@ static int sac_set_system_audio_mode_broadcast_off(struct node *node, unsigned m
 
 static int sac_system_audio_mode_req_on(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	__u8 status;
 
 	/* Send a System Audio Mode Request to the audio system. This notifies the
@@ -741,7 +741,7 @@ static int sac_system_audio_mode_req_on(struct node *node, unsigned me, unsigned
 
 static int sac_give_system_audio_mode_status(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	__u8 system_audio_status;
 
 	/* The device shall not feature abort Give System Audio Mode Status if it did not
@@ -769,7 +769,7 @@ static int sac_give_system_audio_mode_status(struct node *node, unsigned me, uns
 
 static int sac_give_audio_status(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	/* Give Audio Status is mandatory for audio systems in CEC 2.0, except
 	   for systems that lack external controls for volume/mute status. */
@@ -795,7 +795,7 @@ static int sac_give_audio_status(struct node *node, unsigned me, unsigned la, bo
 
 static int sac_util_send_user_control_press(struct node *node, unsigned me, unsigned la, __u8 ui_cmd)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	struct cec_op_ui_command rc_press = {};
 
 	/* The device shall not feature abort
@@ -914,7 +914,7 @@ static int sac_user_control_press_restore_volume_function(struct node *node, uns
 
 static int sac_user_control_release(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	/* The device shall not feature abort User Control Released if it did not
 	   feature abort System Audio Mode Request
@@ -941,7 +941,7 @@ static int sac_system_audio_mode_req_off(struct node *node, unsigned me, unsigne
 	if (!node->remote[la].has_sys_audio_mode_req)
 		return NOTAPPLICABLE;
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	__u8 status;
 
 	cec_msg_init(&msg, me, la);
@@ -1059,7 +1059,7 @@ const vec_remote_subtests sac_subtests{
 
 static int audio_rate_ctl_set_audio_rate(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_set_audio_rate(&msg, CEC_OP_AUD_RATE_WIDE_STD);
@@ -1086,7 +1086,7 @@ static int audio_rate_ctl_active_sensing(struct node *node, unsigned me, unsigne
 	if (!node->remote[la].has_aud_rate)
 		return NOTAPPLICABLE;
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 
@@ -1106,7 +1106,7 @@ static int audio_rate_ctl_invalid(struct node *node, unsigned me, unsigned la, b
 	if (!node->remote[la].has_aud_rate)
 		return NOTAPPLICABLE;
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_set_audio_rate(&msg, 0xa); /* Invalid Audio Rate Control message operand */
diff --git a/utils/cec-compliance/cec-test-power.cpp b/utils/cec-compliance/cec-test-power.cpp
index 8ac45fbf..b675bfc4 100644
--- a/utils/cec-compliance/cec-test-power.cpp
+++ b/utils/cec-compliance/cec-test-power.cpp
@@ -16,7 +16,7 @@
 
 static bool get_power_status(struct node *node, unsigned me, unsigned la, __u8 &power_status)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_give_device_power_status(&msg, true);
@@ -62,7 +62,7 @@ bool util_interactive_ensure_power_state(struct node *node, unsigned me, unsigne
 
 static int power_status_give(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = { };
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_give_device_power_status(&msg, true);
@@ -83,7 +83,7 @@ static int power_status_give(struct node *node, unsigned me, unsigned la, bool i
 
 static int power_status_report(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_report_power_status(&msg, CEC_OP_POWER_STATUS_ON);
@@ -106,7 +106,7 @@ const vec_remote_subtests power_status_subtests{
 static int one_touch_play_view_on(struct node *node, unsigned me, unsigned la, bool interactive,
 				  __u8 opcode)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	if (opcode == CEC_MSG_IMAGE_VIEW_ON)
@@ -179,7 +179,7 @@ static int one_touch_play_text_view_on_wakeup(struct node *node, unsigned me, un
 static int one_touch_play_view_on_change(struct node *node, unsigned me, unsigned la, bool interactive,
 					 __u8 opcode)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	int ret;
 
 	fail_on_test(!util_interactive_ensure_power_state(node, me, la, interactive, CEC_OP_POWER_STATUS_ON));
@@ -215,7 +215,7 @@ static int one_touch_play_text_view_on_change(struct node *node, unsigned me, un
 
 static int one_touch_play_req_active_source(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_active_source(&msg, node->phys_addr);
@@ -318,7 +318,7 @@ static int standby_resume_standby(struct node *node, unsigned me, unsigned la, b
 	if (!node->remote[la].has_power_status)
 		return NOTAPPLICABLE;
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	unsigned unresponsive_time = 0;
 
 	fail_on_test(!util_interactive_ensure_power_state(node, me, la, interactive, CEC_OP_POWER_STATUS_ON));
@@ -355,7 +355,7 @@ static int standby_resume_standby_toggle(struct node *node, unsigned me, unsigne
 	if (!node->remote[la].in_standby)
 		return NOTAPPLICABLE;
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	unsigned unresponsive_time = 0;
 	__u8 new_status;
 
@@ -403,7 +403,7 @@ static int standby_resume_active_source_nowake(struct node *node, unsigned me, u
 	if (!node->remote[la].in_standby)
 		return NOTAPPLICABLE;
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	unsigned unresponsive_time = 0;
 	__u8 new_status;
 
@@ -435,7 +435,7 @@ static int standby_resume_active_source_nowake(struct node *node, unsigned me, u
 
 static int wakeup_rc(struct node *node, unsigned me, unsigned la)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	struct cec_op_ui_command rc_press = {};
 
 	/* Todo: A release should be sent after this */
@@ -450,7 +450,7 @@ static int wakeup_rc(struct node *node, unsigned me, unsigned la)
 
 static int wakeup_tv(struct node *node, unsigned me, unsigned la)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_image_view_on(&msg);
@@ -475,7 +475,7 @@ static int wakeup_tv(struct node *node, unsigned me, unsigned la)
 
 static int wakeup_source(struct node *node, unsigned me, unsigned la)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_set_stream_path(&msg, node->remote[la].phys_addr);
@@ -545,7 +545,7 @@ static int standby_resume_wakeup_view_on(struct node *node, unsigned me, unsigne
 	fail_on_test(!poll_stable_power_status(node, me, la, CEC_OP_POWER_STATUS_ON, unresponsive_time));
 	fail_on_test(interactive && !question("Is the device in On state?"));
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_active_source(&msg, node->phys_addr);
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 283abe43..d28642d7 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -21,7 +21,7 @@ struct remote_test {
 
 static int deck_status_get(struct node *node, unsigned me, unsigned la, __u8 &deck_status)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	deck_status = 0;
 
 	cec_msg_init(&msg, me, la);
@@ -35,7 +35,7 @@ static int deck_status_get(struct node *node, unsigned me, unsigned la, __u8 &de
 
 static int test_play_mode(struct node *node, unsigned me, unsigned la, __u8 play_mode, __u8 expected)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	__u8 deck_status;
 
 	cec_msg_init(&msg, me, la);
@@ -52,7 +52,7 @@ static int test_play_mode(struct node *node, unsigned me, unsigned la, __u8 play
 
 int system_info_polling(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = { };
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	fail_on_test(doioctl(node, CEC_TRANSMIT, &msg));
@@ -74,7 +74,7 @@ int system_info_polling(struct node *node, unsigned me, unsigned la, bool intera
 
 int system_info_phys_addr(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = { };
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_give_physical_addr(&msg, true);
@@ -89,7 +89,7 @@ int system_info_phys_addr(struct node *node, unsigned me, unsigned la, bool inte
 
 int system_info_version(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_get_cec_version(&msg, true);
@@ -110,7 +110,7 @@ int system_info_version(struct node *node, unsigned me, unsigned la, bool intera
 
 int system_info_get_menu_lang(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	char language[4];
 
 	cec_msg_init(&msg, me, la);
@@ -139,7 +139,7 @@ int system_info_get_menu_lang(struct node *node, unsigned me, unsigned la, bool
 
 static int system_info_set_menu_lang(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_set_menu_language(&msg, "eng");
@@ -154,7 +154,7 @@ static int system_info_set_menu_lang(struct node *node, unsigned me, unsigned la
 
 int system_info_give_features(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = { };
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_give_features(&msg, true);
@@ -215,7 +215,7 @@ static const vec_remote_subtests system_info_subtests{
 
 int core_unknown(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = { };
+	struct cec_msg msg;
 	const __u8 unknown_opcode = 0xfe;
 
 	/* Unknown opcodes should be responded to with Feature Abort, with abort
@@ -248,7 +248,7 @@ int core_unknown(struct node *node, unsigned me, unsigned la, bool interactive)
 
 int core_abort(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	/* The Abort message should always be responded to with Feature Abort
 	   (with any abort reason) */
@@ -269,7 +269,7 @@ static const vec_remote_subtests core_subtests{
 
 int vendor_specific_commands_id(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_give_device_vendor_id(&msg, true);
@@ -295,7 +295,7 @@ static const vec_remote_subtests vendor_specific_subtests{
 
 static int device_osd_transfer_set(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = { };
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_set_osd_name(&msg, "Whatever");
@@ -314,7 +314,7 @@ static int device_osd_transfer_set(struct node *node, unsigned me, unsigned la,
 
 int device_osd_transfer_give(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = { };
+	struct cec_msg msg;
 
 	/* Todo: CEC 2.0: devices with several logical addresses shall report
 	   the same for each logical address. */
@@ -347,7 +347,7 @@ static const vec_remote_subtests device_osd_transfer_subtests{
 
 static int osd_string_set_default(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = { };
+	struct cec_msg msg;
 	char osd[14];
 	bool unsuitable = false;
 
@@ -388,7 +388,7 @@ static int osd_string_set_until_clear(struct node *node, unsigned me, unsigned l
 	if (!node->remote[la].has_osd)
 		return NOTAPPLICABLE;
 
-	struct cec_msg msg = { };
+	struct cec_msg msg;
 	char osd[14];
 	bool unsuitable = false;
 
@@ -423,7 +423,7 @@ static int osd_string_invalid(struct node *node, unsigned me, unsigned la, bool
 	if (!node->remote[la].has_osd)
 		return NOTAPPLICABLE;
 
-	struct cec_msg msg = { };
+	struct cec_msg msg;
 
 	/* Send Set OSD String with an Display Control operand. A Feature Abort is
 	   expected in reply. */
@@ -448,7 +448,7 @@ static const vec_remote_subtests osd_string_subtests{
 
 static int routing_control_inactive_source(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	int response;
 
 	interactive_info(true, "Please make sure that the TV is currently viewing this source.");
@@ -481,7 +481,7 @@ static int routing_control_inactive_source(struct node *node, unsigned me, unsig
 
 static int routing_control_active_source(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	interactive_info(true, "Please switch the TV to another source.");
 	cec_msg_init(&msg, me, la);
@@ -497,7 +497,7 @@ static int routing_control_active_source(struct node *node, unsigned me, unsigne
 
 static int routing_control_req_active_source(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	/* We have now said that we are active source, so receiving a reply to
 	   Request Active Source should fail the test. */
@@ -511,7 +511,7 @@ static int routing_control_req_active_source(struct node *node, unsigned me, uns
 
 static int routing_control_set_stream_path(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	__u16 phys_addr;
 
 	/* Send Set Stream Path with the remote physical address. We expect the
@@ -555,7 +555,7 @@ static const vec_remote_subtests routing_control_subtests{
 
 static int rc_passthrough_user_ctrl_pressed(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	struct cec_op_ui_command rc_press;
 
 	cec_msg_init(&msg, me, la);
@@ -575,7 +575,7 @@ static int rc_passthrough_user_ctrl_pressed(struct node *node, unsigned me, unsi
 
 static int rc_passthrough_user_ctrl_released(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_user_control_released(&msg);
@@ -604,7 +604,7 @@ static const vec_remote_subtests rc_passthrough_subtests{
 
 static int dev_menu_ctl_request(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_menu_request(&msg, true, CEC_OP_MENU_REQUEST_QUERY);
@@ -631,7 +631,7 @@ static const vec_remote_subtests dev_menu_ctl_subtests{
 
 static int deck_ctl_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_give_deck_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
@@ -677,7 +677,7 @@ static int deck_ctl_give_status(struct node *node, unsigned me, unsigned la, boo
 
 static int deck_ctl_give_status_invalid(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_give_deck_status(&msg, true, 0); /* Invalid Operand */
@@ -698,7 +698,7 @@ static int deck_ctl_give_status_invalid(struct node *node, unsigned me, unsigned
 
 static int deck_ctl_deck_ctl(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	__u8 deck_status;
 
 	cec_msg_init(&msg, me, la);
@@ -769,7 +769,7 @@ static int deck_ctl_deck_ctl(struct node *node, unsigned me, unsigned la, bool i
 
 static int deck_ctl_deck_ctl_invalid(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_deck_control(&msg, 0); /* Invalid Deck Control operand */
@@ -790,7 +790,7 @@ static int deck_ctl_deck_ctl_invalid(struct node *node, unsigned me, unsigned la
 
 static int deck_ctl_play(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	__u8 deck_status;
 
 	cec_msg_init(&msg, me, la);
@@ -840,7 +840,7 @@ static int deck_ctl_play(struct node *node, unsigned me, unsigned la, bool inter
 
 static int deck_ctl_play_invalid(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_play(&msg, 0); /* Invalid Operand */
@@ -1035,7 +1035,7 @@ static int log_tuner_service(const struct cec_op_tuner_device_info &info,
 
 static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	struct cec_op_tuner_device_info info = {};
 	std::vector<struct cec_op_tuner_device_info> info_vec;
 	bool has_tuner = (1 << la) & (CEC_LOG_ADDR_MASK_TV | CEC_LOG_ADDR_MASK_TUNER);
@@ -1157,7 +1157,7 @@ static int one_touch_rec_tv_screen(struct node *node, unsigned me, unsigned la,
 	  - The TV should ignore this message when received from other LA than Recording or
 	    Reserved.
 	 */
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_record_tv_screen(&msg, true);
@@ -1182,7 +1182,7 @@ static int one_touch_rec_on(struct node *node, unsigned me, unsigned la, bool in
 	  TODO: Page 36 in HDMI CEC 1.4b spec lists additional behaviors that should be
 	  checked for.
 	 */
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	struct cec_op_record_src rec_src = {};
 
 	rec_src.type = CEC_OP_RECORD_SRC_OWN;
@@ -1203,7 +1203,7 @@ static int one_touch_rec_on(struct node *node, unsigned me, unsigned la, bool in
 
 static int one_touch_rec_off(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_record_off(&msg, false);
@@ -1223,7 +1223,7 @@ static int one_touch_rec_off(struct node *node, unsigned me, unsigned la, bool i
 
 static int one_touch_rec_status(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_DIG_SERVICE);
@@ -1255,7 +1255,7 @@ static int timer_prog_set_analog_timer(struct node *node, unsigned me, unsigned
 {
 	/* TODO: Check the timer status for possible errors, etc. */
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_set_analogue_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
@@ -1281,7 +1281,7 @@ static int timer_prog_set_digital_timer(struct node *node, unsigned me, unsigned
 {
 	/* TODO: Check the timer status for possible errors, etc. */
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	struct cec_op_digital_service_id digital_service_id = {};
 
 	digital_service_id.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
@@ -1310,7 +1310,7 @@ static int timer_prog_set_ext_timer(struct node *node, unsigned me, unsigned la,
 {
 	/* TODO: Check the timer status. */
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_set_ext_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
@@ -1334,7 +1334,7 @@ static int timer_prog_clear_analog_timer(struct node *node, unsigned me, unsigne
 {
 	/* TODO: Check the timer cleared status. */
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_clear_analogue_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
@@ -1360,7 +1360,7 @@ static int timer_prog_clear_digital_timer(struct node *node, unsigned me, unsign
 {
 	/* TODO: Check the timer cleared status. */
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	struct cec_op_digital_service_id digital_service_id = {};
 
 	digital_service_id.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
@@ -1389,7 +1389,7 @@ static int timer_prog_clear_ext_timer(struct node *node, unsigned me, unsigned l
 {
 	/* TODO: Check the timer cleared status. */
 
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_clear_ext_timer(&msg, true, 1, 1, 0, 0, 1, 0, CEC_OP_REC_SEQ_ONCE_ONLY,
@@ -1411,7 +1411,7 @@ static int timer_prog_clear_ext_timer(struct node *node, unsigned me, unsigned l
 
 static int timer_prog_set_prog_title(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_set_timer_program_title(&msg, "Super-Hans II");
@@ -1426,7 +1426,7 @@ static int timer_prog_set_prog_title(struct node *node, unsigned me, unsigned la
 
 static int timer_prog_timer_status(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_timer_status(&msg, CEC_OP_TIMER_OVERLAP_WARNING_NO_OVERLAP,
@@ -1444,7 +1444,7 @@ static int timer_prog_timer_status(struct node *node, unsigned me, unsigned la,
 
 static int timer_prog_timer_clear_status(struct node *node, unsigned me, unsigned la, bool interactive)
 {
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 
 	cec_msg_init(&msg, me, la);
 	cec_msg_timer_cleared_status(&msg, CEC_OP_TIMER_CLR_STAT_CLEARED);
@@ -1533,7 +1533,7 @@ static int cdc_hec_discover(struct node *node, unsigned me, unsigned la, bool pr
 {
 	/* TODO: For future use cases, it might be necessary to store the results
 	   from the HEC discovery to know which HECs are possible to form, etc. */
-	struct cec_msg msg = {};
+	struct cec_msg msg;
 	__u32 mode = CEC_MODE_INITIATOR | CEC_MODE_FOLLOWER;
 	bool has_cdc = false;
 
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 44754787..4bed81a9 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -673,7 +673,7 @@ static __u16 calc_mask(__u16 pa)
 
 static int showTopology(struct node *node)
 {
-	struct cec_msg msg = { };
+	struct cec_msg msg;
 	struct cec_log_addrs laddrs = { };
 
 	if (!(node->caps & CEC_CAP_TRANSMIT))
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 5385b335..41bb990c 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -262,7 +262,7 @@ static void update_deck_state(struct node *node, unsigned me, __u8 deck_state_ne
 		node->state.deck_state = deck_state_new;
 
 		if (node->state.deck_report_changes) {
-			struct cec_msg msg = {};
+			struct cec_msg msg;
 
 			cec_msg_init(&msg, me, node->state.deck_report_changes_to);
 			cec_msg_deck_status(&msg, node->state.deck_state);
@@ -1095,7 +1095,7 @@ void testProcessing(struct node *node, bool wallclock)
 		if (node->cec_version >= CEC_OP_CEC_VERSION_2_0 &&
 		    last_pwr_state != pwr_state &&
 		    (time_to_stable > 2 || pwr_state < CEC_OP_POWER_STATUS_TO_ON)) {
-			struct cec_msg msg = {};
+			struct cec_msg msg;
 
 			cec_msg_init(&msg, me, CEC_LOG_ADDR_BROADCAST);
 			cec_msg_report_power_status(&msg, pwr_state);
@@ -1118,7 +1118,7 @@ void testProcessing(struct node *node, bool wallclock)
 		if (poll_la != me &&
 		    poll_la != last_poll_la && poll_la < 15 && la_info[poll_la].ts &&
 		    ts_to_ms(ts_now - la_info[poll_la].ts) > POLL_PERIOD) {
-			struct cec_msg msg = {};
+			struct cec_msg msg;
 
 			cec_msg_init(&msg, me, poll_la);
 			transmit(node, &msg);
-- 
2.25.1

