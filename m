Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E469728272D
	for <lists+linux-media@lfdr.de>; Sun,  4 Oct 2020 00:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgJCWol (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 18:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgJCWol (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Oct 2020 18:44:41 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6993C0613D0
        for <linux-media@vger.kernel.org>; Sat,  3 Oct 2020 15:44:40 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id g18so1168981pgd.5
        for <linux-media@vger.kernel.org>; Sat, 03 Oct 2020 15:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kUuw+C6WwSVY1bIbBgrdWPTzJvUvhQNwultG31tnCuc=;
        b=YVppX136DkETcqWzd3fU8B+5Td//xebRHIrrXR2dYVrtCZ1xzA9I+9Ngjv3wL875su
         Z8fuiOwrS3UmeLNx42cpsDqi/pOw4gjrteVmLjkkW36qELmIBkl/Y7EaRMnLtVdb2A6+
         MtY21N8qabcoECOyoqWFximOfo0tAyenP+ZQZ/vHwoQCcPi1XsLBQbTI/5ZRW6SGom9q
         B8hLVHaHDwYv8qEBbwImFvXuS/bzyZj0DWKTVmqmeWanNm682OLb3PmqSXvvqGzz3vlq
         94kXhQEAm2hWfoe2BMRSLzfhrr1AXWYc52Wfh/i+RfOEt/wLSF7DQwmzoRFDWeldhssv
         RXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kUuw+C6WwSVY1bIbBgrdWPTzJvUvhQNwultG31tnCuc=;
        b=sR8ztp82wTebUUpvkOzVF2+Ui2jUOSDr4+1Nhh7HQc6VEndl41LiJFpE7HdSj4+WYs
         QmPq9VnM3wJMSnXYGhAx469KZ/43XAwRnrPP6JcHawgI3s7y1S0kx4nXL9yMSjNLBbr4
         0VqNh+tke+0CzmTKeEKh5sQvvdoKxvXVUfAL0we2Pj22ITA74cCX4SlpS41y73JoUYFI
         ec6tFRbeEqF52mFD8v4/I015bBRm2PhpynbOTtH5nwzVfw09wAVhvzDAF+xliBM7Tyf1
         EvpHydO/W0aEmyixlPowe89MV6s+6u/AdDWYzM5/rscKNVxJuLfcNU9DySFEuU6eT9wc
         UQJA==
X-Gm-Message-State: AOAM531IZu7cj7P3RTge+ckXqwNDhm7gLRYIcpsq3NQOssN1atfVVz8V
        B/uMFapzIZJ3S7vxcBfQ4aAj0RaOI/h8pg==
X-Google-Smtp-Source: ABdhPJxG7bfh3HeaASm6zJnCikyNe+0MvIQFBNnrjtF5wIndsL7k3x4tS2P1wXJdWi9f7PSAJJAMTQ==
X-Received: by 2002:a63:f746:: with SMTP id f6mr7959160pgk.128.1601765077799;
        Sat, 03 Oct 2020 15:44:37 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id l10sm5777777pgp.25.2020.10.03.15.44.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 15:44:36 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/2] clang-tidy: use nullptr
Date:   Sat,  3 Oct 2020 15:44:34 -0700
Message-Id: <20201003224435.37725-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with modernize-use-nullptr

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-compliance.cpp       | 154 +++---
 utils/cec-compliance/cec-test-adapter.cpp     |  26 +-
 utils/cec-compliance/cec-test-power.cpp       |  22 +-
 utils/cec-compliance/cec-test.cpp             |   4 +-
 utils/cec-ctl/cec-ctl.cpp                     | 240 ++++-----
 utils/cec-follower/cec-follower.cpp           |  44 +-
 utils/cec-follower/cec-processing.cpp         |  16 +-
 utils/common/media-info.cpp                   |  20 +-
 utils/common/v4l2-info.cpp                    |  38 +-
 utils/libcecutil/cec-info.cpp                 |   8 +-
 utils/libcecutil/cec-log.cpp                  |   4 +-
 utils/libcecutil/cec-parse.cpp                |   6 +-
 utils/rds-ctl/rds-ctl.cpp                     |  58 +--
 utils/v4l2-compliance/v4l2-compliance.cpp     |  78 +--
 utils/v4l2-compliance/v4l2-test-buffers.cpp   |  58 +--
 utils/v4l2-compliance/v4l2-test-colors.cpp    |   2 +-
 utils/v4l2-compliance/v4l2-test-controls.cpp  |   6 +-
 utils/v4l2-compliance/v4l2-test-debug.cpp     |   2 +-
 utils/v4l2-compliance/v4l2-test-formats.cpp   |   4 +-
 utils/v4l2-compliance/v4l2-test-io-config.cpp |   2 +-
 utils/v4l2-compliance/v4l2-test-media.cpp     |   8 +-
 utils/v4l2-ctl/v4l2-ctl-common.cpp            |  30 +-
 utils/v4l2-ctl/v4l2-ctl-edid.cpp              |  40 +-
 utils/v4l2-ctl/v4l2-ctl-io.cpp                |   8 +-
 utils/v4l2-ctl/v4l2-ctl-meta.cpp              |   6 +-
 utils/v4l2-ctl/v4l2-ctl-misc.cpp              |  16 +-
 utils/v4l2-ctl/v4l2-ctl-overlay.cpp           |  52 +-
 utils/v4l2-ctl/v4l2-ctl-sdr.cpp               |   2 +-
 utils/v4l2-ctl/v4l2-ctl-selection.cpp         |  20 +-
 utils/v4l2-ctl/v4l2-ctl-stds.cpp              |  12 +-
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp         |  72 +--
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp            |  56 +--
 utils/v4l2-ctl/v4l2-ctl-tuner.cpp             |  18 +-
 utils/v4l2-ctl/v4l2-ctl-vbi.cpp               |  18 +-
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp            |  12 +-
 utils/v4l2-ctl/v4l2-ctl-vidout.cpp            |   2 +-
 utils/v4l2-ctl/v4l2-ctl.cpp                   | 468 +++++++++---------
 utils/v4l2-dbg/v4l2-dbg.cpp                   |  58 +--
 38 files changed, 845 insertions(+), 845 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index 2f085b49d..94fa1c226 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -105,70 +105,70 @@ unsigned reply_threshold = 1000;
 time_t long_timeout = 60;
 
 static struct option long_options[] = {
-	{"device", required_argument, 0, OptSetDevice},
-	{"adapter", required_argument, 0, OptSetAdapter},
-	{"driver", required_argument, 0, OptSetDriver},
-	{"help", no_argument, 0, OptHelp},
-	{"no-warnings", no_argument, 0, OptNoWarnings},
-	{"exit-on-fail", no_argument, 0, OptExitOnFail},
-	{"exit-on-warn", no_argument, 0, OptExitOnWarn},
-	{"remote", optional_argument, 0, OptRemote},
-	{"list-tests", no_argument, 0, OptListTests},
-	{"expect", required_argument, 0, OptExpect},
-	{"expect-with-no-warnings", required_argument, 0, OptExpectWithNoWarnings},
-	{"timeout", required_argument, 0, OptTimeout},
-	{"trace", no_argument, 0, OptTrace},
-	{"verbose", no_argument, 0, OptVerbose},
-	{"color", required_argument, 0, OptColor},
-	{"skip-info", no_argument, 0, OptSkipInfo},
-	{"wall-clock", no_argument, 0, OptWallClock},
-	{"interactive", no_argument, 0, OptInteractive},
-	{"reply-threshold", required_argument, 0, OptReplyThreshold},
-
-	{"test-adapter", no_argument, 0, OptTestAdapter},
-	{"test-fuzzing", no_argument, 0, OptTestFuzzing},
-	{"test-core", no_argument, 0, OptTestCore},
-	{"test-audio-rate-control", no_argument, 0, OptTestAudioRateControl},
-	{"test-audio-return-channel-control", no_argument, 0, OptTestARCControl},
-	{"test-capability-discovery-and-control", no_argument, 0, OptTestCapDiscoveryControl},
-	{"test-deck-control", no_argument, 0, OptTestDeckControl},
-	{"test-device-menu-control", no_argument, 0, OptTestDeviceMenuControl},
-	{"test-device-osd-transfer", no_argument, 0, OptTestDeviceOSDTransfer},
-	{"test-dynamic-auto-lipsync", no_argument, 0, OptTestDynamicAutoLipsync},
-	{"test-osd-display", no_argument, 0, OptTestOSDDisplay},
-	{"test-one-touch-play", no_argument, 0, OptTestOneTouchPlay},
-	{"test-one-touch-record", no_argument, 0, OptTestOneTouchRecord},
-	{"test-power-status", no_argument, 0, OptTestPowerStatus},
-	{"test-remote-control-passthrough", no_argument, 0, OptTestRemoteControlPassthrough},
-	{"test-routing-control", no_argument, 0, OptTestRoutingControl},
-	{"test-system-audio-control", no_argument, 0, OptTestSystemAudioControl},
-	{"test-system-information", no_argument, 0, OptTestSystemInformation},
-	{"test-timer-programming", no_argument, 0, OptTestTimerProgramming},
-	{"test-tuner-control", no_argument, 0, OptTestTunerControl},
-	{"test-vendor-specific-commands", no_argument, 0, OptTestVendorSpecificCommands},
-	{"test-standby-resume", no_argument, 0, OptTestStandbyResume},
-
-	{"skip-test-audio-rate-control", no_argument, 0, OptSkipTestAudioRateControl},
-	{"skip-test-audio-return-channel-control", no_argument, 0, OptSkipTestARCControl},
-	{"skip-test-capability-discovery-and-control", no_argument, 0, OptSkipTestCapDiscoveryControl},
-	{"skip-test-deck-control", no_argument, 0, OptSkipTestDeckControl},
-	{"skip-test-device-menu-control", no_argument, 0, OptSkipTestDeviceMenuControl},
-	{"skip-test-device-osd-transfer", no_argument, 0, OptSkipTestDeviceOSDTransfer},
-	{"skip-test-dynamic-auto-lipsync", no_argument, 0, OptSkipTestDynamicAutoLipsync},
-	{"skip-test-osd-display", no_argument, 0, OptSkipTestOSDDisplay},
-	{"skip-test-one-touch-play", no_argument, 0, OptSkipTestOneTouchPlay},
-	{"skip-test-one-touch-record", no_argument, 0, OptSkipTestOneTouchRecord},
-	{"skip-test-power-status", no_argument, 0, OptSkipTestPowerStatus},
-	{"skip-test-remote-control-passthrough", no_argument, 0, OptSkipTestRemoteControlPassthrough},
-	{"skip-test-routing-control", no_argument, 0, OptSkipTestRoutingControl},
-	{"skip-test-system-audio-control", no_argument, 0, OptSkipTestSystemAudioControl},
-	{"skip-test-system-information", no_argument, 0, OptSkipTestSystemInformation},
-	{"skip-test-timer-programming", no_argument, 0, OptSkipTestTimerProgramming},
-	{"skip-test-tuner-control", no_argument, 0, OptSkipTestTunerControl},
-	{"skip-test-vendor-specific-commands", no_argument, 0, OptSkipTestVendorSpecificCommands},
-	{"skip-test-standby-resume", no_argument, 0, OptSkipTestStandbyResume},
-	{"version", no_argument, 0, OptVersion},
-	{0, 0, 0, 0}
+	{"device", required_argument, nullptr, OptSetDevice},
+	{"adapter", required_argument, nullptr, OptSetAdapter},
+	{"driver", required_argument, nullptr, OptSetDriver},
+	{"help", no_argument, nullptr, OptHelp},
+	{"no-warnings", no_argument, nullptr, OptNoWarnings},
+	{"exit-on-fail", no_argument, nullptr, OptExitOnFail},
+	{"exit-on-warn", no_argument, nullptr, OptExitOnWarn},
+	{"remote", optional_argument, nullptr, OptRemote},
+	{"list-tests", no_argument, nullptr, OptListTests},
+	{"expect", required_argument, nullptr, OptExpect},
+	{"expect-with-no-warnings", required_argument, nullptr, OptExpectWithNoWarnings},
+	{"timeout", required_argument, nullptr, OptTimeout},
+	{"trace", no_argument, nullptr, OptTrace},
+	{"verbose", no_argument, nullptr, OptVerbose},
+	{"color", required_argument, nullptr, OptColor},
+	{"skip-info", no_argument, nullptr, OptSkipInfo},
+	{"wall-clock", no_argument, nullptr, OptWallClock},
+	{"interactive", no_argument, nullptr, OptInteractive},
+	{"reply-threshold", required_argument, nullptr, OptReplyThreshold},
+
+	{"test-adapter", no_argument, nullptr, OptTestAdapter},
+	{"test-fuzzing", no_argument, nullptr, OptTestFuzzing},
+	{"test-core", no_argument, nullptr, OptTestCore},
+	{"test-audio-rate-control", no_argument, nullptr, OptTestAudioRateControl},
+	{"test-audio-return-channel-control", no_argument, nullptr, OptTestARCControl},
+	{"test-capability-discovery-and-control", no_argument, nullptr, OptTestCapDiscoveryControl},
+	{"test-deck-control", no_argument, nullptr, OptTestDeckControl},
+	{"test-device-menu-control", no_argument, nullptr, OptTestDeviceMenuControl},
+	{"test-device-osd-transfer", no_argument, nullptr, OptTestDeviceOSDTransfer},
+	{"test-dynamic-auto-lipsync", no_argument, nullptr, OptTestDynamicAutoLipsync},
+	{"test-osd-display", no_argument, nullptr, OptTestOSDDisplay},
+	{"test-one-touch-play", no_argument, nullptr, OptTestOneTouchPlay},
+	{"test-one-touch-record", no_argument, nullptr, OptTestOneTouchRecord},
+	{"test-power-status", no_argument, nullptr, OptTestPowerStatus},
+	{"test-remote-control-passthrough", no_argument, nullptr, OptTestRemoteControlPassthrough},
+	{"test-routing-control", no_argument, nullptr, OptTestRoutingControl},
+	{"test-system-audio-control", no_argument, nullptr, OptTestSystemAudioControl},
+	{"test-system-information", no_argument, nullptr, OptTestSystemInformation},
+	{"test-timer-programming", no_argument, nullptr, OptTestTimerProgramming},
+	{"test-tuner-control", no_argument, nullptr, OptTestTunerControl},
+	{"test-vendor-specific-commands", no_argument, nullptr, OptTestVendorSpecificCommands},
+	{"test-standby-resume", no_argument, nullptr, OptTestStandbyResume},
+
+	{"skip-test-audio-rate-control", no_argument, nullptr, OptSkipTestAudioRateControl},
+	{"skip-test-audio-return-channel-control", no_argument, nullptr, OptSkipTestARCControl},
+	{"skip-test-capability-discovery-and-control", no_argument, nullptr, OptSkipTestCapDiscoveryControl},
+	{"skip-test-deck-control", no_argument, nullptr, OptSkipTestDeckControl},
+	{"skip-test-device-menu-control", no_argument, nullptr, OptSkipTestDeviceMenuControl},
+	{"skip-test-device-osd-transfer", no_argument, nullptr, OptSkipTestDeviceOSDTransfer},
+	{"skip-test-dynamic-auto-lipsync", no_argument, nullptr, OptSkipTestDynamicAutoLipsync},
+	{"skip-test-osd-display", no_argument, nullptr, OptSkipTestOSDDisplay},
+	{"skip-test-one-touch-play", no_argument, nullptr, OptSkipTestOneTouchPlay},
+	{"skip-test-one-touch-record", no_argument, nullptr, OptSkipTestOneTouchRecord},
+	{"skip-test-power-status", no_argument, nullptr, OptSkipTestPowerStatus},
+	{"skip-test-remote-control-passthrough", no_argument, nullptr, OptSkipTestRemoteControlPassthrough},
+	{"skip-test-routing-control", no_argument, nullptr, OptSkipTestRoutingControl},
+	{"skip-test-system-audio-control", no_argument, nullptr, OptSkipTestSystemAudioControl},
+	{"skip-test-system-information", no_argument, nullptr, OptSkipTestSystemInformation},
+	{"skip-test-timer-programming", no_argument, nullptr, OptSkipTestTimerProgramming},
+	{"skip-test-tuner-control", no_argument, nullptr, OptSkipTestTunerControl},
+	{"skip-test-vendor-specific-commands", no_argument, nullptr, OptSkipTestVendorSpecificCommands},
+	{"skip-test-standby-resume", no_argument, nullptr, OptSkipTestStandbyResume},
+	{"version", no_argument, nullptr, OptVersion},
+	{nullptr, 0, nullptr, 0}
 };
 
 #define STR(x) #x
@@ -268,7 +268,7 @@ static std::string ts2s(__u64 ts)
 		return buf;
 	}
 	clock_gettime(CLOCK_MONOTONIC, &now);
-	gettimeofday(&tv, NULL);
+	gettimeofday(&tv, nullptr);
 	diff = now.tv_sec * 1000000000ULL + now.tv_nsec - ts;
 	sub.tv_sec = diff / 1000000000ULL;
 	sub.tv_usec = (diff % 1000000000ULL) / 1000;
@@ -815,7 +815,7 @@ static bool wait_for_hpd(struct node *node, bool send_image_view_on)
 {
 	int fd = node->fd;
 	int flags = fcntl(node->fd, F_GETFL);
-	time_t t = time(NULL);
+	time_t t = time(nullptr);
 
 	fcntl(node->fd, F_SETFL, flags | O_NONBLOCK);
 	for (;;) {
@@ -825,7 +825,7 @@ static bool wait_for_hpd(struct node *node, bool send_image_view_on)
 
 		FD_ZERO(&ex_fds);
 		FD_SET(fd, &ex_fds);
-		res = select(fd + 1, NULL, NULL, &ex_fds, &tv);
+		res = select(fd + 1, nullptr, nullptr, &ex_fds, &tv);
 		if (res < 0) {
 			fail("select failed with error %d\n", errno);
 			return false;
@@ -839,7 +839,7 @@ static bool wait_for_hpd(struct node *node, bool send_image_view_on)
 				break;
 		}
 
-		if (send_image_view_on && time(NULL) - t > TX_WAIT_FOR_HPD) {
+		if (send_image_view_on && time(nullptr) - t > TX_WAIT_FOR_HPD) {
 			struct cec_msg image_view_on_msg;
 
 			// So the HPD is gone (possibly due to a standby), but
@@ -852,7 +852,7 @@ static bool wait_for_hpd(struct node *node, bool send_image_view_on)
 			send_image_view_on = false;
 		}
 
-		if (time(NULL) - t > TX_WAIT_FOR_HPD + TX_WAIT_FOR_HPD_RETURN) {
+		if (time(nullptr) - t > TX_WAIT_FOR_HPD + TX_WAIT_FOR_HPD_RETURN) {
 			fail("timed out after %d s waiting for HPD to return\n",
 			     TX_WAIT_FOR_HPD + TX_WAIT_FOR_HPD_RETURN);
 			return false;
@@ -1103,11 +1103,11 @@ static void topology_probe_device(struct node *node, unsigned i, unsigned la)
 		/* RC Profile and Device Features are assumed to be 1 byte. As of CEC 2.0 only
 		   1 byte is used, but this might be extended in future versions. */
 		__u8 cec_version, all_device_types;
-		const __u8 *rc_profile = NULL, *dev_features = NULL;
+		const __u8 *rc_profile = nullptr, *dev_features = nullptr;
 
 		cec_ops_report_features(&msg, &cec_version, &all_device_types,
 					&rc_profile, &dev_features);
-		if (rc_profile == NULL || dev_features == NULL)
+		if (rc_profile == nullptr || dev_features == nullptr)
 			return;
 		node->remote[i].rc_profile = *rc_profile;
 		node->remote[i].dev_features = *dev_features;
@@ -1128,8 +1128,8 @@ static void topology_probe_device(struct node *node, unsigned i, unsigned la)
 int main(int argc, char **argv)
 {
 	std::string device;
-	const char *driver = NULL;
-	const char *adapter = NULL;
+	const char *driver = nullptr;
+	const char *adapter = nullptr;
 	char short_options[26 * 2 * 2 + 1];
 	int remote_la = -1;
 	bool test_remote = false;
@@ -1140,7 +1140,7 @@ int main(int argc, char **argv)
 	int i;
 	const char *env_media_apps_color = getenv("MEDIA_APPS_COLOR");
 
-	srandom(time(NULL));
+	srandom(time(nullptr));
 	if (!env_media_apps_color || !strcmp(env_media_apps_color, "auto"))
 		show_colors = isatty(STDOUT_FILENO);
 	else if (!strcmp(env_media_apps_color, "always"))
@@ -1207,10 +1207,10 @@ int main(int argc, char **argv)
 			adapter = optarg;
 			break;
 		case OptReplyThreshold:
-			reply_threshold = strtoul(optarg, NULL, 0);
+			reply_threshold = strtoul(optarg, nullptr, 0);
 			break;
 		case OptTimeout:
-			long_timeout = strtoul(optarg, NULL, 0);
+			long_timeout = strtoul(optarg, nullptr, 0);
 			break;
 		case OptColor:
 			if (!strcmp(optarg, "always"))
@@ -1243,7 +1243,7 @@ int main(int argc, char **argv)
 			break;
 		case OptRemote:
 			if (optarg) {
-				remote_la = strtoul(optarg, NULL, 0);
+				remote_la = strtoul(optarg, nullptr, 0);
 				if (remote_la < 0 || remote_la > 15) {
 					fprintf(stderr, "--test: invalid remote logical address\n");
 					usage();
diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compliance/cec-test-adapter.cpp
index 4fb7bc080..cf1b6191f 100644
--- a/utils/cec-compliance/cec-test-adapter.cpp
+++ b/utils/cec-compliance/cec-test-adapter.cpp
@@ -38,7 +38,7 @@ static int testCap(struct node *node)
 	struct cec_caps caps;
 
 	memset(&caps, 0xff, sizeof(caps));
-	fail_on_test(doioctl(node, CEC_ADAP_G_CAPS, NULL) != EFAULT);
+	fail_on_test(doioctl(node, CEC_ADAP_G_CAPS, nullptr) != EFAULT);
 	fail_on_test(doioctl(node, CEC_ADAP_G_CAPS, &caps));
 	fail_on_test(caps.available_log_addrs == 0 ||
 		     caps.available_log_addrs > CEC_MAX_LOG_ADDRS);
@@ -53,9 +53,9 @@ static int testInvalidIoctls(struct node *node)
 	unsigned ioc = _IOC(_IOC_NONE, type, 0xff, 0);
 	unsigned char buf[0x4000] = {};
 
-	fail_on_test(doioctl(node, ioc, NULL) != ENOTTY);
+	fail_on_test(doioctl(node, ioc, nullptr) != ENOTTY);
 	ioc = _IOC(_IOC_NONE, type, 0, 0x3fff);
-	fail_on_test(doioctl(node, ioc, NULL) != ENOTTY);
+	fail_on_test(doioctl(node, ioc, nullptr) != ENOTTY);
 	ioc = _IOC(_IOC_READ, type, 0, 0x3fff);
 	fail_on_test(doioctl(node, ioc, buf) != ENOTTY);
 	fail_on_test(check_0(buf, sizeof(buf)));
@@ -224,7 +224,7 @@ static int testAdapLogAddrs(struct node *node)
 				fail("Unknown event %d\n", ev.event);
 				break;
 			}
-			select(0, NULL, NULL, NULL, &tv);
+			select(0, nullptr, nullptr, nullptr, &tv);
 		}
 	} while (!res);
 	fail_on_test(doioctl(node, CEC_ADAP_S_LOG_ADDRS, &clear));
@@ -234,7 +234,7 @@ static int testAdapLogAddrs(struct node *node)
 		res = doioctl(node, CEC_DQEVENT, &ev);
 		fail_on_test(res && res != EAGAIN);
 		if (res)
-			select(0, NULL, NULL, NULL, &tv);
+			select(0, nullptr, nullptr, nullptr, &tv);
 	} while (res);
 	fail_on_test(ev.flags & CEC_EVENT_FL_INITIAL_STATE);
 	fail_on_test(ev.ts == 0);
@@ -249,7 +249,7 @@ static int testAdapLogAddrs(struct node *node)
 		res = doioctl(node, CEC_DQEVENT, &ev);
 		fail_on_test(res && res != EAGAIN);
 		if (res)
-			select(0, NULL, NULL, NULL, &tv);
+			select(0, nullptr, nullptr, nullptr, &tv);
 	} while (res);
 	fail_on_test(ev.flags & CEC_EVENT_FL_INITIAL_STATE);
 	fail_on_test(ev.ts == 0);
@@ -448,13 +448,13 @@ static int testTransmit(struct node *node)
 	}
 
 	if (tested_valid_la) {
-		time_t cur_t = time(NULL), t;
+		time_t cur_t = time(nullptr), t;
 		time_t last_t = cur_t + 7;
 		unsigned max_cnt = 0;
 		unsigned cnt = 0;
 
 		do {
-			t = time(NULL);
+			t = time(nullptr);
 			if (t != cur_t) {
 				if (cnt > max_cnt)
 					max_cnt = cnt;
@@ -472,13 +472,13 @@ static int testTransmit(struct node *node)
 	}
 
 	if (tested_invalid_la) {
-		time_t cur_t = time(NULL), t;
+		time_t cur_t = time(nullptr), t;
 		time_t last_t = cur_t + 7;
 		unsigned max_cnt = 0;
 		unsigned cnt = 0;
 
 		do {
-			t = time(NULL);
+			t = time(nullptr);
 			if (t != cur_t) {
 				if (cnt > max_cnt)
 					max_cnt = cnt;
@@ -1062,7 +1062,7 @@ static int testLostMsgs(struct node *node)
 			if (res == EBUSY) {
 				struct timeval tv = { 0, 10000 }; // 10 ms
 
-				select(0, NULL, NULL, NULL, &tv);
+				select(0, nullptr, nullptr, nullptr, &tv);
 				got_busy = true;
 			} else if (!got_busy) {
 				tx_queue_depth++;
@@ -1098,7 +1098,7 @@ static int testLostMsgs(struct node *node)
 	unsigned pending_tx_rx_aborted_msgs = 0;
 	unsigned pending_rx_msgs = 0;
 	unsigned pending_rx_cec_version_msgs = 0;
-	time_t start = time(NULL);
+	time_t start = time(nullptr);
 	__u8 last_init = 0xff;
 	__u64 last_ts = 0;
 	unsigned tx_repeats = 0;
@@ -1211,7 +1211,7 @@ static int testLostMsgs(struct node *node)
 		if (pending_quick_msgs < pending_msgs)
 			printf("\t\tReceived %d messages immediately, and %d over %ld seconds\n",
 			       pending_quick_msgs, pending_msgs - pending_quick_msgs,
-			       time(NULL) - start);
+			       time(nullptr) - start);
 	}
 	if (fail_msg)
 		return fail("There were %d messages in the receive queue for %d transmits\n",
diff --git a/utils/cec-compliance/cec-test-power.cpp b/utils/cec-compliance/cec-test-power.cpp
index 81faa60ed..68e441c44 100644
--- a/utils/cec-compliance/cec-test-power.cpp
+++ b/utils/cec-compliance/cec-test-power.cpp
@@ -255,19 +255,19 @@ static bool wait_changing_power_status(struct node *node, unsigned me, unsigned
 				       unsigned &unresponsive_time)
 {
 	__u8 old_status;
-	time_t t = time(NULL);
+	time_t t = time(nullptr);
 
 	announce("Checking for power status change. This may take up to %llu s.", (long long)long_timeout);
 	if (!get_power_status(node, me, la, old_status))
 		return false;
-	while (time(NULL) - t < long_timeout) {
+	while (time(nullptr) - t < long_timeout) {
 		__u8 power_status;
 
 		if (!get_power_status(node, me, la, power_status)) {
 			/* Some TVs become completely unresponsive when transitioning
 			   between power modes. Register that this happens, but continue
 			   the test. */
-			unresponsive_time = time(NULL) - t;
+			unresponsive_time = time(nullptr) - t;
 		} else if (old_status != power_status) {
 			new_status = power_status;
 			return true;
@@ -283,25 +283,25 @@ static bool poll_stable_power_status(struct node *node, unsigned me, unsigned la
 {
 	bool transient = false;
 	unsigned time_to_transient = 0;
-	time_t t = time(NULL);
+	time_t t = time(nullptr);
 
 	/* Some devices can use several seconds to transition from one power
 	   state to another, so the power state must be repeatedly polled */
 	announce("Waiting for new stable power status. This may take up to %llu s.", (long long)long_timeout);
-	while (time(NULL) - t < long_timeout) {
+	while (time(nullptr) - t < long_timeout) {
 		__u8 power_status;
 
 		if (!get_power_status(node, me, la, power_status)) {
 			/* Some TVs become completely unresponsive when transitioning
 			   between power modes. Register that this happens, but continue
 			   the test. */
-			unresponsive_time = time(NULL) - t;
+			unresponsive_time = time(nullptr) - t;
 			sleep(SLEEP_POLL_POWER_STATUS);
 			continue;
 		}
 		if (!transient && (power_status == CEC_OP_POWER_STATUS_TO_ON ||
 				   power_status == CEC_OP_POWER_STATUS_TO_STANDBY)) {
-			time_to_transient = time(NULL) - t;
+			time_to_transient = time(nullptr) - t;
 			transient = true;
 			warn_once_on_test(expected_status == CEC_OP_POWER_STATUS_ON &&
 					  power_status == CEC_OP_POWER_STATUS_TO_STANDBY);
@@ -565,7 +565,7 @@ static int power_state_transitions(struct node *node, unsigned me, unsigned la,
 	cec_msg_init(&msg, me, la);
 	cec_msg_standby(&msg);
 	fail_on_test(!transmit_timeout(node, &msg));
-	time_t start = time(NULL);
+	time_t start = time(nullptr);
 	int res = util_receive(node, la, long_timeout * 1000, &msg, CEC_MSG_STANDBY,
 			       CEC_MSG_REPORT_POWER_STATUS);
 	fail_on_test(!res);
@@ -576,7 +576,7 @@ static int power_state_transitions(struct node *node, unsigned me, unsigned la,
 		info("so any kernel released after January 2020 should have this fix.\n");
 		return OK_PRESUMED;
 	}
-	if (time(NULL) - start > 3)
+	if (time(nullptr) - start > 3)
 		warn("The first Report Power Status broadcast arrived > 3s after sending <Standby>\n");
 	if (msg.msg[2] == CEC_OP_POWER_STATUS_STANDBY)
 		return 0;
@@ -603,10 +603,10 @@ static int power_state_transitions(struct node *node, unsigned me, unsigned la,
 		fail_on_test(doioctl(node, CEC_TRANSMIT, &msg));
 	}
 	fail_on_test(!(msg.tx_status & CEC_TX_STATUS_OK));
-	start = time(NULL);
+	start = time(nullptr);
 	fail_on_test(util_receive(node, la, long_timeout * 1000, &msg, opcode,
 		     CEC_MSG_REPORT_POWER_STATUS) <= 0);
-	if (time(NULL) - start > 3)
+	if (time(nullptr) - start > 3)
 		warn("The first Report Power Status broadcast arrived > 3s after sending <%s>\n",
 		     opcode == CEC_MSG_IMAGE_VIEW_ON ? "Image View On" : "Set Stream Path");
 	if (msg.msg[2] == CEC_OP_POWER_STATUS_ON)
diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 7b39e20bc..8633171a0 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -152,7 +152,7 @@ int system_info_give_features(struct node *node, unsigned me, unsigned la, bool
 	const __u8 *rc_profile, *dev_features;
 
 	cec_ops_report_features(&msg, &cec_version, &all_device_types, &rc_profile, &dev_features);
-	fail_on_test(rc_profile == NULL || dev_features == NULL);
+	fail_on_test(rc_profile == nullptr || dev_features == nullptr);
 	info("All Device Types: \t\t%s\n", cec_all_dev_types2s(all_device_types).c_str());
 	info("RC Profile: \t%s", cec_rc_src_prof2s(*rc_profile, "").c_str());
 	info("Device Features: \t%s", cec_dev_feat2s(*dev_features, "").c_str());
@@ -1529,7 +1529,7 @@ int setExpectedResult(char *optarg, bool no_warnings)
 	std::string name = safename(optarg);
 	if (mapTests.find(name) == mapTests.end())
 		return 1;
-	mapTests[name] = strtoul(equal + 1, NULL, 0);
+	mapTests[name] = strtoul(equal + 1, nullptr, 0);
 	mapTestsNoWarnings[name] = no_warnings;
 	return 0;
 }
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 2ee88ec9e..4446a239d 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -151,84 +151,84 @@ bool verbose;
 typedef std::vector<cec_msg> msg_vec;
 
 static struct option long_options[] = {
-	{ "device", required_argument, 0, OptSetDevice },
-	{ "adapter", required_argument, 0, OptSetAdapter },
-	{ "driver", required_argument, 0, OptSetDriver },
-	{ "help", no_argument, 0, OptHelp },
-	{ "trace", no_argument, 0, OptTrace },
-	{ "verbose", no_argument, 0, OptVerbose },
-	{ "wall-clock", no_argument, 0, OptWallClock },
-	{ "osd-name", required_argument, 0, OptOsdName },
-	{ "phys-addr-from-edid-poll", required_argument, 0, OptPhysAddrFromEDIDPoll },
-	{ "phys-addr-from-edid", required_argument, 0, OptPhysAddrFromEDID },
-	{ "phys-addr", required_argument, 0, OptPhysAddr },
-	{ "vendor-id", required_argument, 0, OptVendorID },
-	{ "cec-version-1.4", no_argument, 0, OptCECVersion1_4 },
-	{ "allow-unreg-fallback", no_argument, 0, OptAllowUnregFallback },
-	{ "no-rc-passthrough", no_argument, 0, OptNoRC },
-	{ "reply-to-followers", no_argument, 0, OptReplyToFollowers },
-	{ "raw-msg", no_argument, 0, OptRawMsg },
-	{ "timeout", required_argument, 0, OptTimeout },
-	{ "clear", no_argument, 0, OptClear },
-	{ "wait-for-msgs", no_argument, 0, OptWaitForMsgs },
-	{ "monitor", no_argument, 0, OptMonitor },
-	{ "monitor-all", no_argument, 0, OptMonitorAll },
-	{ "monitor-pin", no_argument, 0, OptMonitorPin },
-	{ "monitor-time", required_argument, 0, OptMonitorTime },
-	{ "ignore", required_argument, 0, OptIgnore },
-	{ "store-pin", required_argument, 0, OptStorePin },
-	{ "analyze-pin", required_argument, 0, OptAnalyzePin },
-	{ "no-reply", no_argument, 0, OptToggleNoReply },
-	{ "non-blocking", no_argument, 0, OptNonBlocking },
-	{ "logical-address", no_argument, 0, OptLogicalAddress },
-	{ "logical-addresses", no_argument, 0, OptLogicalAddresses },
-	{ "to", required_argument, 0, OptTo },
-	{ "from", required_argument, 0, OptFrom },
-	{ "skip-info", no_argument, 0, OptSkipInfo },
-	{ "show-raw", no_argument, 0, OptShowRaw },
-	{ "show-topology", no_argument, 0, OptShowTopology },
-	{ "list-devices", no_argument, 0, OptListDevices },
-	{ "poll", no_argument, 0, OptPoll },
-	{ "rc-tv-profile-1", no_argument, 0, OptRcTVProfile1 },
-	{ "rc-tv-profile-2", no_argument, 0, OptRcTVProfile2 },
-	{ "rc-tv-profile-3", no_argument, 0, OptRcTVProfile3 },
-	{ "rc-tv-profile-4", no_argument, 0, OptRcTVProfile4 },
-	{ "rc-src-dev-root", no_argument, 0, OptRcSrcDevRoot },
-	{ "rc-src-dev-setup", no_argument, 0, OptRcSrcDevSetup },
-	{ "rc-src-contents", no_argument, 0, OptRcSrcContents },
-	{ "rc-src-media-top", no_argument, 0, OptRcSrcMediaTop },
-	{ "rc-src-media-context", no_argument, 0, OptRcSrcMediaContext },
-	{ "feat-record-tv-screen", no_argument, 0, OptFeatRecordTVScreen },
-	{ "feat-set-osd-string", no_argument, 0, OptFeatSetOSDString },
-	{ "feat-deck-control", no_argument, 0, OptFeatDeckControl },
-	{ "feat-set-audio-rate", no_argument, 0, OptFeatSetAudioRate },
-	{ "feat-sink-has-arc-tx", no_argument, 0, OptFeatSinkHasARCTx },
-	{ "feat-source-has-arc-rx", no_argument, 0, OptFeatSourceHasARCRx },
-
-	{ "tv", no_argument, 0, OptTV },
-	{ "record", no_argument, 0, OptRecord },
-	{ "tuner", no_argument, 0, OptTuner },
-	{ "playback", no_argument, 0, OptPlayback },
-	{ "audio", no_argument, 0, OptAudio },
-	{ "processor", no_argument, 0, OptProcessor },
-	{ "switch", no_argument, 0, OptSwitch },
-	{ "cdc-only", no_argument, 0, OptCDCOnly },
-	{ "unregistered", no_argument, 0, OptUnregistered },
-	{ "help-all", no_argument, 0, OptHelpAll },
-
-	{ "version", no_argument, 0, OptVersion },
+	{ "device", required_argument, nullptr, OptSetDevice },
+	{ "adapter", required_argument, nullptr, OptSetAdapter },
+	{ "driver", required_argument, nullptr, OptSetDriver },
+	{ "help", no_argument, nullptr, OptHelp },
+	{ "trace", no_argument, nullptr, OptTrace },
+	{ "verbose", no_argument, nullptr, OptVerbose },
+	{ "wall-clock", no_argument, nullptr, OptWallClock },
+	{ "osd-name", required_argument, nullptr, OptOsdName },
+	{ "phys-addr-from-edid-poll", required_argument, nullptr, OptPhysAddrFromEDIDPoll },
+	{ "phys-addr-from-edid", required_argument, nullptr, OptPhysAddrFromEDID },
+	{ "phys-addr", required_argument, nullptr, OptPhysAddr },
+	{ "vendor-id", required_argument, nullptr, OptVendorID },
+	{ "cec-version-1.4", no_argument, nullptr, OptCECVersion1_4 },
+	{ "allow-unreg-fallback", no_argument, nullptr, OptAllowUnregFallback },
+	{ "no-rc-passthrough", no_argument, nullptr, OptNoRC },
+	{ "reply-to-followers", no_argument, nullptr, OptReplyToFollowers },
+	{ "raw-msg", no_argument, nullptr, OptRawMsg },
+	{ "timeout", required_argument, nullptr, OptTimeout },
+	{ "clear", no_argument, nullptr, OptClear },
+	{ "wait-for-msgs", no_argument, nullptr, OptWaitForMsgs },
+	{ "monitor", no_argument, nullptr, OptMonitor },
+	{ "monitor-all", no_argument, nullptr, OptMonitorAll },
+	{ "monitor-pin", no_argument, nullptr, OptMonitorPin },
+	{ "monitor-time", required_argument, nullptr, OptMonitorTime },
+	{ "ignore", required_argument, nullptr, OptIgnore },
+	{ "store-pin", required_argument, nullptr, OptStorePin },
+	{ "analyze-pin", required_argument, nullptr, OptAnalyzePin },
+	{ "no-reply", no_argument, nullptr, OptToggleNoReply },
+	{ "non-blocking", no_argument, nullptr, OptNonBlocking },
+	{ "logical-address", no_argument, nullptr, OptLogicalAddress },
+	{ "logical-addresses", no_argument, nullptr, OptLogicalAddresses },
+	{ "to", required_argument, nullptr, OptTo },
+	{ "from", required_argument, nullptr, OptFrom },
+	{ "skip-info", no_argument, nullptr, OptSkipInfo },
+	{ "show-raw", no_argument, nullptr, OptShowRaw },
+	{ "show-topology", no_argument, nullptr, OptShowTopology },
+	{ "list-devices", no_argument, nullptr, OptListDevices },
+	{ "poll", no_argument, nullptr, OptPoll },
+	{ "rc-tv-profile-1", no_argument, nullptr, OptRcTVProfile1 },
+	{ "rc-tv-profile-2", no_argument, nullptr, OptRcTVProfile2 },
+	{ "rc-tv-profile-3", no_argument, nullptr, OptRcTVProfile3 },
+	{ "rc-tv-profile-4", no_argument, nullptr, OptRcTVProfile4 },
+	{ "rc-src-dev-root", no_argument, nullptr, OptRcSrcDevRoot },
+	{ "rc-src-dev-setup", no_argument, nullptr, OptRcSrcDevSetup },
+	{ "rc-src-contents", no_argument, nullptr, OptRcSrcContents },
+	{ "rc-src-media-top", no_argument, nullptr, OptRcSrcMediaTop },
+	{ "rc-src-media-context", no_argument, nullptr, OptRcSrcMediaContext },
+	{ "feat-record-tv-screen", no_argument, nullptr, OptFeatRecordTVScreen },
+	{ "feat-set-osd-string", no_argument, nullptr, OptFeatSetOSDString },
+	{ "feat-deck-control", no_argument, nullptr, OptFeatDeckControl },
+	{ "feat-set-audio-rate", no_argument, nullptr, OptFeatSetAudioRate },
+	{ "feat-sink-has-arc-tx", no_argument, nullptr, OptFeatSinkHasARCTx },
+	{ "feat-source-has-arc-rx", no_argument, nullptr, OptFeatSourceHasARCRx },
+
+	{ "tv", no_argument, nullptr, OptTV },
+	{ "record", no_argument, nullptr, OptRecord },
+	{ "tuner", no_argument, nullptr, OptTuner },
+	{ "playback", no_argument, nullptr, OptPlayback },
+	{ "audio", no_argument, nullptr, OptAudio },
+	{ "processor", no_argument, nullptr, OptProcessor },
+	{ "switch", no_argument, nullptr, OptSwitch },
+	{ "cdc-only", no_argument, nullptr, OptCDCOnly },
+	{ "unregistered", no_argument, nullptr, OptUnregistered },
+	{ "help-all", no_argument, nullptr, OptHelpAll },
+
+	{ "version", no_argument, nullptr, OptVersion },
 
 	CEC_PARSE_LONG_OPTS
 
-	{ "vendor-remote-button-down", required_argument, 0, OptVendorRemoteButtonDown }, \
-	{ "vendor-command-with-id", required_argument, 0, OptVendorCommandWithID }, \
-	{ "vendor-command", required_argument, 0, OptVendorCommand }, \
-	{ "custom-command", required_argument, 0, OptCustomCommand }, \
+	{ "vendor-remote-button-down", required_argument, nullptr, OptVendorRemoteButtonDown }, \
+	{ "vendor-command-with-id", required_argument, nullptr, OptVendorCommandWithID }, \
+	{ "vendor-command", required_argument, nullptr, OptVendorCommand }, \
+	{ "custom-command", required_argument, nullptr, OptCustomCommand }, \
 
-	{ "test-power-cycle", optional_argument, 0, OptTestPowerCycle }, \
-	{ "stress-test-power-cycle", required_argument, 0, OptStressTestPowerCycle }, \
+	{ "test-power-cycle", optional_argument, nullptr, OptTestPowerCycle }, \
+	{ "stress-test-power-cycle", required_argument, nullptr, OptStressTestPowerCycle }, \
 
-	{ 0, 0, 0, 0 }
+	{ nullptr, 0, nullptr, 0 }
 };
 
 static void print_version()
@@ -799,9 +799,9 @@ static void wait_for_msgs(const struct node &node, __u32 monitor_time)
 	time_t t;
 
 	fcntl(fd, F_SETFL, fcntl(fd, F_GETFL) | O_NONBLOCK);
-	t = time(NULL) + monitor_time;
+	t = time(nullptr) + monitor_time;
 
-	while (!monitor_time || time(NULL) < t) {
+	while (!monitor_time || time(nullptr) < t) {
 		struct timeval tv = { 1, 0 };
 		int res;
 
@@ -810,7 +810,7 @@ static void wait_for_msgs(const struct node &node, __u32 monitor_time)
 		FD_ZERO(&ex_fds);
 		FD_SET(fd, &rd_fds);
 		FD_SET(fd, &ex_fds);
-		res = select(fd + 1, &rd_fds, NULL, &ex_fds, &tv);
+		res = select(fd + 1, &rd_fds, nullptr, &ex_fds, &tv);
 		if (res < 0)
 			break;
 		if (FD_ISSET(fd, &ex_fds)) {
@@ -842,7 +842,7 @@ static void monitor(const struct node &node, __u32 monitor_time, const char *sto
 	fd_set rd_fds;
 	fd_set ex_fds;
 	int fd = node.fd;
-	FILE *fstore = NULL;
+	FILE *fstore = nullptr;
 	time_t t;
 
 	if (options[OptMonitorAll])
@@ -880,7 +880,7 @@ static void monitor(const struct node &node, __u32 monitor_time, const char *sto
 			fstore = stdout;
 		else
 			fstore = fopen(store_pin, "w+");
-		if (fstore == NULL) {
+		if (fstore == nullptr) {
 			fprintf(stderr, "Failed to open %s: %s\n", store_pin,
 				strerror(errno));
 			std::exit(EXIT_FAILURE);
@@ -900,9 +900,9 @@ static void monitor(const struct node &node, __u32 monitor_time, const char *sto
 		printf("\n");
 
 	fcntl(fd, F_SETFL, fcntl(fd, F_GETFL) | O_NONBLOCK);
-	t = time(NULL) + monitor_time;
+	t = time(nullptr) + monitor_time;
 
-	while (!monitor_time || time(NULL) < t) {
+	while (!monitor_time || time(nullptr) < t) {
 		struct timeval tv = { 1, 0 };
 		bool pin_event = false;
 		int res;
@@ -912,7 +912,7 @@ static void monitor(const struct node &node, __u32 monitor_time, const char *sto
 		FD_ZERO(&ex_fds);
 		FD_SET(fd, &rd_fds);
 		FD_SET(fd, &ex_fds);
-		res = select(fd + 1, &rd_fds, NULL, &ex_fds, &tv);
+		res = select(fd + 1, &rd_fds, nullptr, &ex_fds, &tv);
 		if (res < 0)
 			break;
 		if (FD_ISSET(fd, &rd_fds)) {
@@ -979,7 +979,7 @@ static void analyze(const char *analyze_pin)
 		fanalyze = stdin;
 	else
 		fanalyze = fopen(analyze_pin, "r");
-	if (fanalyze == NULL) {
+	if (fanalyze == nullptr) {
 		fprintf(stderr, "Failed to open %s: %s\n", analyze_pin,
 			strerror(errno));
 		std::exit(EXIT_FAILURE);
@@ -1496,7 +1496,7 @@ static void stress_test_power_cycle(const struct node &node, unsigned cnt,
 		mod_usleep = 1000000 * (max_sleep - min_sleep) + 1;
 
 	if (!has_seed)
-		seed = time(NULL);
+		seed = time(nullptr);
 
 	if (mod_usleep)
 		printf("Randomizer seed: %u\n\n", seed);
@@ -1734,7 +1734,7 @@ static __u16 parse_phys_addr_from_edid(const char *edid_path)
 	__u16 pa = CEC_PHYS_ADDR_INVALID;
 	__u8 edid[256];
 
-	if (f == NULL)
+	if (f == nullptr)
 		return pa;
 	if (fread(edid, sizeof(edid), 1, f) == 1) {
 		unsigned int loc = cec_get_edid_spa_location(edid, sizeof(edid));
@@ -1780,7 +1780,7 @@ static void *thread_edid_poll(void *arg)
 				       cec_phys_addr_exp(phys_addr));
 		}
 	}
-	return NULL;
+	return nullptr;
 }
 
 using dev_vec = std::vector<std::string>;
@@ -1796,7 +1796,7 @@ static void list_devices()
 	struct cec_caps caps;
 
 	dp = opendir("/dev");
-	if (dp == NULL) {
+	if (dp == nullptr) {
 		perror("Couldn't open the directory");
 		return;
 	}
@@ -1864,8 +1864,8 @@ static void list_devices()
 int main(int argc, char **argv)
 {
 	std::string device;
-	const char *driver = NULL;
-	const char *adapter = NULL;
+	const char *driver = nullptr;
+	const char *adapter = nullptr;
 	const struct cec_msg_args *opt;
 	msg_vec msgs;
 	char short_options[26 * 2 * 2 + 1];
@@ -1890,8 +1890,8 @@ int main(int argc, char **argv)
 	__u8 rc_tv = 0;
 	__u8 rc_src = 0;
 	const char *osd_name = "";
-	const char *store_pin = NULL;
-	const char *analyze_pin = NULL;
+	const char *store_pin = nullptr;
+	const char *analyze_pin = nullptr;
 	bool reply = true;
 	int idx = 0;
 	int fd = -1;
@@ -1944,18 +1944,18 @@ int main(int argc, char **argv)
 			verbose = true;
 			break;
 		case OptFrom:
-			from = strtoul(optarg, NULL, 0) & 0xf;
+			from = strtoul(optarg, nullptr, 0) & 0xf;
 			break;
 		case OptTo:
-			to = strtoul(optarg, NULL, 0) & 0xf;
+			to = strtoul(optarg, nullptr, 0) & 0xf;
 			if (first_to == 0xff)
 				first_to = to;
 			break;
 		case OptTimeout:
-			timeout = strtoul(optarg, NULL, 0);
+			timeout = strtoul(optarg, nullptr, 0);
 			break;
 		case OptMonitorTime:
-			monitor_time = strtoul(optarg, NULL, 0);
+			monitor_time = strtoul(optarg, nullptr, 0);
 			break;
 		case OptIgnore: {
 			bool all_la = !strncmp(optarg, "all", 3);
@@ -1966,7 +1966,7 @@ int main(int argc, char **argv)
 			if (sep)
 				all_opcodes = !strncmp(sep + 1, "all", 3);
 			if (!all_la) {
-				la = strtoul(optarg, NULL, 0);
+				la = strtoul(optarg, nullptr, 0);
 
 				if (la > 15) {
 					fprintf(stderr, "invalid logical address (> 15)\n");
@@ -1979,7 +1979,7 @@ int main(int argc, char **argv)
 				if (!strncmp(sep + 1, "poll", 4)) {
 					opcode = POLL_FAKE_OPCODE;
 				} else {
-					opcode = strtoul(sep + 1, NULL, 0);
+					opcode = strtoul(sep + 1, nullptr, 0);
 					if (opcode > 255) {
 						fprintf(stderr, "invalid opcode (> 255)\n");
 						usage();
@@ -2019,7 +2019,7 @@ int main(int argc, char **argv)
 			osd_name = optarg;
 			break;
 		case OptVendorID:
-			vendor_id = strtoul(optarg, NULL, 0) & 0x00ffffff;
+			vendor_id = strtoul(optarg, nullptr, 0) & 0x00ffffff;
 			break;
 		case OptRcTVProfile1:
 			rc_tv = CEC_OP_FEAT_RC_TV_PROFILE_1;
@@ -2096,7 +2096,7 @@ int main(int argc, char **argv)
 		case OptVendorCommand: {
 			static const char *arg_names[] = {
 				"payload",
-				NULL
+				nullptr
 			};
 			char *value, *endptr, *subs = optarg;
 			__u8 size = 0;
@@ -2112,7 +2112,7 @@ int main(int argc, char **argv)
 							break;
 						}
 						value = std::strchr(value, ':');
-						if (value == NULL)
+						if (value == nullptr)
 							break;
 						value++;
 					}
@@ -2131,7 +2131,7 @@ int main(int argc, char **argv)
 			static const char *arg_names[] = {
 				"cmd",
 				"payload",
-				NULL
+				nullptr
 			};
 			char *value, *endptr, *subs = optarg;
 			bool have_cmd = false;
@@ -2153,7 +2153,7 @@ int main(int argc, char **argv)
 							break;
 						}
 						value = std::strchr(value, ':');
-						if (value == NULL)
+						if (value == nullptr)
 							break;
 						value++;
 					}
@@ -2174,7 +2174,7 @@ int main(int argc, char **argv)
 			static const char *arg_names[] = {
 				"vendor-id",
 				"cmd",
-				NULL
+				nullptr
 			};
 			char *value, *endptr, *subs = optarg;
 			__u32 vendor_id = 0;
@@ -2184,7 +2184,7 @@ int main(int argc, char **argv)
 			while (*subs != '\0') {
 				switch (cec_parse_subopt(&subs, arg_names, &value)) {
 				case 0:
-					vendor_id = strtol(value, 0L, 0);
+					vendor_id = strtol(value, nullptr, 0);
 					break;
 				case 1:
 					while (size < sizeof(bytes)) {
@@ -2194,7 +2194,7 @@ int main(int argc, char **argv)
 							break;
 						}
 						value = std::strchr(value, ':');
-						if (value == NULL)
+						if (value == nullptr)
 							break;
 						value++;
 					}
@@ -2212,7 +2212,7 @@ int main(int argc, char **argv)
 		case OptVendorRemoteButtonDown: {
 			static const char *arg_names[] = {
 				"rc-code",
-				NULL
+				nullptr
 			};
 			char *value, *endptr, *subs = optarg;
 			__u8 size = 0;
@@ -2228,7 +2228,7 @@ int main(int argc, char **argv)
 							break;
 						}
 						value = std::strchr(value, ':');
-						if (value == NULL)
+						if (value == nullptr)
 							break;
 						value++;
 					}
@@ -2262,7 +2262,7 @@ int main(int argc, char **argv)
 			static const char *arg_names[] = {
 				"polls",
 				"sleep",
-				NULL
+				nullptr
 			};
 			char *value, *subs = optarg;
 
@@ -2273,10 +2273,10 @@ int main(int argc, char **argv)
 			while (*subs != '\0') {
 				switch (cec_parse_subopt(&subs, arg_names, &value)) {
 				case 0:
-					test_pwr_cycle_polls = strtoul(value, 0L, 0);
+					test_pwr_cycle_polls = strtoul(value, nullptr, 0);
 					break;
 				case 1:
-					test_pwr_cycle_sleep = strtoul(value, 0L, 0);
+					test_pwr_cycle_sleep = strtoul(value, nullptr, 0);
 					break;
 				default:
 					std::exit(EXIT_FAILURE);
@@ -2295,36 +2295,36 @@ int main(int argc, char **argv)
 				"sleep-before-on",
 				"sleep-before-off",
 				"polls",
-				NULL
+				nullptr
 			};
 			char *value, *subs = optarg;
 
 			while (*subs != '\0') {
 				switch (cec_parse_subopt(&subs, arg_names, &value)) {
 				case 0:
-					stress_test_pwr_cycle_cnt = strtoul(value, 0L, 0);
+					stress_test_pwr_cycle_cnt = strtoul(value, nullptr, 0);
 					break;
 				case 1:
-					stress_test_pwr_cycle_min_sleep = strtoul(value, 0L, 0);
+					stress_test_pwr_cycle_min_sleep = strtoul(value, nullptr, 0);
 					break;
 				case 2:
-					stress_test_pwr_cycle_max_sleep = strtoul(value, 0L, 0);
+					stress_test_pwr_cycle_max_sleep = strtoul(value, nullptr, 0);
 					break;
 				case 3:
 					stress_test_pwr_cycle_has_seed = true;
-					stress_test_pwr_cycle_seed = strtoul(value, 0L, 0);
+					stress_test_pwr_cycle_seed = strtoul(value, nullptr, 0);
 					break;
 				case 4:
-					stress_test_pwr_cycle_repeats = strtoul(value, 0L, 0);
+					stress_test_pwr_cycle_repeats = strtoul(value, nullptr, 0);
 					break;
 				case 5:
-					stress_test_pwr_cycle_sleep_before_on = strtod(value, NULL);
+					stress_test_pwr_cycle_sleep_before_on = strtod(value, nullptr);
 					break;
 				case 6:
-					stress_test_pwr_cycle_sleep_before_off = strtod(value, NULL);
+					stress_test_pwr_cycle_sleep_before_off = strtod(value, nullptr);
 					break;
 				case 7:
-					stress_test_pwr_cycle_polls = strtoul(value, 0L, 0);
+					stress_test_pwr_cycle_polls = strtoul(value, nullptr, 0);
 					break;
 				default:
 					std::exit(EXIT_FAILURE);
@@ -2435,7 +2435,7 @@ int main(int argc, char **argv)
 		device = "/dev/cec0";
 
 	clock_gettime(CLOCK_MONOTONIC, &start_monotonic);
-	gettimeofday(&start_timeofday, NULL);
+	gettimeofday(&start_timeofday, nullptr);
 
 	if ((fd = open(device.c_str(), O_RDWR)) < 0) {
 		fprintf(stderr, "Failed to open %s: %s\n", device.c_str(),
@@ -2615,7 +2615,7 @@ int main(int argc, char **argv)
 
 	if (options[OptPhysAddrFromEDIDPoll]) {
 		pthread_t t;
-		int ret = pthread_create(&t, NULL, thread_edid_poll, &node);
+		int ret = pthread_create(&t, nullptr, thread_edid_poll, &node);
 		if (ret) {
 			fprintf(stderr, "Failed to start EDID poll thread: %s\n",
 				strerror(errno));
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 94173d73e..93c941746 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -49,23 +49,23 @@ bool show_warnings = true;
 unsigned warnings;
 
 static struct option long_options[] = {
-	{ "device", required_argument, 0, OptSetDevice },
-	{ "adapter", required_argument, 0, OptSetAdapter },
-	{ "driver", required_argument, 0, OptSetDriver },
-	{ "help", no_argument, 0, OptHelp },
-	{ "no-warnings", no_argument, 0, OptNoWarnings },
-	{ "trace", no_argument, 0, OptTrace },
-	{ "verbose", no_argument, 0, OptVerbose },
-	{ "show-msgs", no_argument, 0, OptShowMsgs },
-	{ "show-state", no_argument, 0, OptShowState },
-	{ "wall-clock", no_argument, 0, OptWallClock },
-	{ "service-by-dig-id", no_argument, 0, OptServiceByDigID },
-	{ "standby", no_argument, 0, OptStandby },
-	{ "toggle-power-status", required_argument, 0, OptTogglePowerStatus },
-	{ "ignore", required_argument, 0, OptIgnore },
-	{ "version", no_argument, 0, OptVersion },
-
-	{ 0, 0, 0, 0 }
+	{ "device", required_argument, nullptr, OptSetDevice },
+	{ "adapter", required_argument, nullptr, OptSetAdapter },
+	{ "driver", required_argument, nullptr, OptSetDriver },
+	{ "help", no_argument, nullptr, OptHelp },
+	{ "no-warnings", no_argument, nullptr, OptNoWarnings },
+	{ "trace", no_argument, nullptr, OptTrace },
+	{ "verbose", no_argument, nullptr, OptVerbose },
+	{ "show-msgs", no_argument, nullptr, OptShowMsgs },
+	{ "show-state", no_argument, nullptr, OptShowState },
+	{ "wall-clock", no_argument, nullptr, OptWallClock },
+	{ "service-by-dig-id", no_argument, nullptr, OptServiceByDigID },
+	{ "standby", no_argument, nullptr, OptStandby },
+	{ "toggle-power-status", required_argument, nullptr, OptTogglePowerStatus },
+	{ "ignore", required_argument, nullptr, OptIgnore },
+	{ "version", no_argument, nullptr, OptVersion },
+
+	{ nullptr, 0, nullptr, 0 }
 };
 
 #define STR(x) #x
@@ -320,8 +320,8 @@ int main(int argc, char **argv)
 {
 	std::string device;
 	struct node node = { };
-	const char *driver = NULL;
-	const char *adapter = NULL;
+	const char *driver = nullptr;
+	const char *adapter = nullptr;
 	unsigned toggle_power_status = 0;
 	char short_options[26 * 2 * 2 + 1];
 	int idx = 0;
@@ -391,7 +391,7 @@ int main(int argc, char **argv)
 			show_state = true;
 			break;
 		case OptTogglePowerStatus:
-			toggle_power_status = strtoul(optarg, NULL, 0);
+			toggle_power_status = strtoul(optarg, nullptr, 0);
 			break;
 		case OptIgnore: {
 			bool all_la = !strncmp(optarg, "all", 3);
@@ -402,7 +402,7 @@ int main(int argc, char **argv)
 			if (sep)
 				all_opcodes = !strncmp(sep + 1, "all", 3);
 			if (!all_la) {
-				la = strtoul(optarg, NULL, 0);
+				la = strtoul(optarg, nullptr, 0);
 
 				if (la > 15) {
 					fprintf(stderr, "invalid logical address (> 15)\n");
@@ -412,7 +412,7 @@ int main(int argc, char **argv)
 				la_mask = 1 << la;
 			}
 			if (!all_opcodes) {
-				opcode = strtoul(sep + 1, NULL, 0);
+				opcode = strtoul(sep + 1, nullptr, 0);
 				if (opcode > 255) {
 					fprintf(stderr, "invalid opcode (> 255)\n");
 					usage();
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index fdc62c8bd..83ffcc30b 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -147,7 +147,7 @@ static bool exit_standby(struct node *node)
 	    node->state.power_status == CEC_OP_POWER_STATUS_TO_STANDBY) {
 		node->state.old_power_status = node->state.power_status;
 		node->state.power_status = CEC_OP_POWER_STATUS_ON;
-		node->state.power_status_changed_time = time(NULL);
+		node->state.power_status_changed_time = time(nullptr);
 		dev_info("Changing state to on\n");
 		return true;
 	}
@@ -160,7 +160,7 @@ static bool enter_standby(struct node *node)
 	    node->state.power_status == CEC_OP_POWER_STATUS_TO_ON) {
 		node->state.old_power_status = node->state.power_status;
 		node->state.power_status = CEC_OP_POWER_STATUS_STANDBY;
-		node->state.power_status_changed_time = time(NULL);
+		node->state.power_status_changed_time = time(nullptr);
 		dev_info("Changing state to standby\n");
 		return true;
 	}
@@ -222,7 +222,7 @@ static bool pa_is_upstream_from(__u16 pa1, __u16 pa2)
 
 static __u8 current_power_state(struct node *node)
 {
-	time_t t = time(NULL);
+	time_t t = time(nullptr);
 
 	if (t - node->state.power_status_changed_time <= time_to_transient)
 		return node->state.old_power_status;
@@ -864,10 +864,10 @@ void testProcessing(struct node *node, bool wallclock)
 	unsigned me;
 	unsigned last_poll_la = 15;
 	__u8 last_pwr_state = current_power_state(node);
-	time_t last_pwr_status_toggle = time(NULL);
+	time_t last_pwr_status_toggle = time(nullptr);
 
 	clock_gettime(CLOCK_MONOTONIC, &start_monotonic);
-	gettimeofday(&start_timeofday, NULL);
+	gettimeofday(&start_timeofday, nullptr);
 
 	doioctl(node, CEC_S_MODE, &mode);
 	doioctl(node, CEC_ADAP_G_LOG_ADDRS, &laddrs);
@@ -885,7 +885,7 @@ void testProcessing(struct node *node, bool wallclock)
 		FD_ZERO(&ex_fds);
 		FD_SET(fd, &rd_fds);
 		FD_SET(fd, &ex_fds);
-		res = select(fd + 1, &rd_fds, NULL, &ex_fds, &timeval);
+		res = select(fd + 1, &rd_fds, nullptr, &ex_fds, &timeval);
 		if (res < 0)
 			break;
 		if (FD_ISSET(fd, &ex_fds)) {
@@ -967,8 +967,8 @@ void testProcessing(struct node *node, bool wallclock)
 		}
 
 		if (node->state.toggle_power_status && cec_has_tv(1 << me) &&
-		    (time(NULL) - last_pwr_status_toggle > node->state.toggle_power_status)) {
-			last_pwr_status_toggle = time(NULL);
+		    (time(nullptr) - last_pwr_status_toggle > node->state.toggle_power_status)) {
+			last_pwr_status_toggle = time(nullptr);
 			if (pwr_state & 1) // standby or to-standby
 				exit_standby(node);
 			else
diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index 2d7caf3dd..cfddab0b2 100644
--- a/utils/common/media-info.cpp
+++ b/utils/common/media-info.cpp
@@ -45,7 +45,7 @@ static struct {
 	{ "dvr", MEDIA_TYPE_DVB_DVR },
 	{ "net", MEDIA_TYPE_DVB_NET },
 	{ "ca", MEDIA_TYPE_DTV_CA },
-	{ NULL, MEDIA_TYPE_UNKNOWN }
+	{ nullptr, MEDIA_TYPE_UNKNOWN }
 };
 
 media_type mi_media_detect_type(const char *device)
@@ -166,12 +166,12 @@ std::string mi_get_devpath_from_dev_t(dev_t dev)
 
 	FILE *uevent_fd = fopen(media_uevent_path.c_str(), "r");
 
-	if (uevent_fd == NULL) {
+	if (uevent_fd == nullptr) {
 		fprintf(stderr, "failed to open %s\n", media_uevent_path.c_str());
 		return "";
 	}
 
-	char *line = NULL;
+	char *line = nullptr;
 	size_t size = 0;
 	std::string devpath;
 
@@ -210,7 +210,7 @@ int mi_get_media_fd(int fd, const char *bus_info)
 	DIR *dp;
 	struct dirent *ep;
 	dp = opendir(media_path.c_str());
-	if (dp == NULL)
+	if (dp == nullptr)
 		return -1;
 	media_path[0] = 0;
 	while ((ep = readdir(dp))) {
@@ -237,7 +237,7 @@ int mi_get_media_fd(int fd, const char *bus_info)
 static const flag_def entity_flags_def[] = {
 	{ MEDIA_ENT_FL_DEFAULT, "default" },
 	{ MEDIA_ENT_FL_CONNECTOR, "connector" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 std::string mi_entflags2s(__u32 flags)
@@ -267,7 +267,7 @@ static const flag_def interface_types_def[] = {
 	{ MEDIA_INTF_T_ALSA_HWDEP, "ALSA HWDEP" },
 	{ MEDIA_INTF_T_ALSA_SEQUENCER, "ALSA Sequencer" },
 	{ MEDIA_INTF_T_ALSA_TIMER, "ALSA Timer" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 std::string mi_ifacetype2s(__u32 type)
@@ -314,7 +314,7 @@ static const flag_def entity_functions_def[] = {
 	{ MEDIA_ENT_F_PROC_VIDEO_ENCODER, "Video Encoder" },
 	{ MEDIA_ENT_F_VID_MUX, "Video Muxer" },
 	{ MEDIA_ENT_F_VID_IF_BRIDGE, "Video Interface Bridge" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 std::string mi_entfunction2s(__u32 function, bool *is_invalid)
@@ -376,7 +376,7 @@ static const flag_def pad_flags_def[] = {
 	{ MEDIA_PAD_FL_SINK, "Sink" },
 	{ MEDIA_PAD_FL_SOURCE, "Source" },
 	{ MEDIA_PAD_FL_MUST_CONNECT, "Must Connect" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 std::string mi_padflags2s(__u32 flags)
@@ -388,7 +388,7 @@ static const flag_def link_flags_def[] = {
 	{ MEDIA_LNK_FL_ENABLED, "Enabled" },
 	{ MEDIA_LNK_FL_IMMUTABLE, "Immutable" },
 	{ MEDIA_LNK_FL_DYNAMIC, "Dynamic" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 std::string mi_linkflags2s(__u32 flags)
@@ -512,7 +512,7 @@ static __u32 read_topology(int media_fd, __u32 major, __u32 minor,
 			__u32 type = link.flags & MEDIA_LNK_FL_LINK_TYPE;
 			__u32 remote_pad;
 			__u32 remote_ent_id = 0;
-			const media_v2_entity *remote_ent = NULL;
+			const media_v2_entity *remote_ent = nullptr;
 
 			if (type != MEDIA_LNK_FL_DATA_LINK ||
 			    (link.source_id != pad.id && link.sink_id != pad.id))
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index cd80a80d8..274caa89b 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -190,7 +190,7 @@ static const flag_def bufcap_def[] = {
 	{ V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS, "orphaned-bufs" },
 	{ V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF, "m2m-hold-capture-buf" },
 	{ V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS, "mmap-cache-hints" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 std::string bufcap2s(__u32 caps)
@@ -328,7 +328,7 @@ std::string quantization2s(int val)
 
 static const flag_def pixflags_def[] = {
 	{ V4L2_PIX_FMT_FLAG_PREMUL_ALPHA,  "premultiplied-alpha" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 std::string pixflags2s(unsigned flags)
@@ -341,7 +341,7 @@ static const flag_def service_def[] = {
 	{ V4L2_SLICED_VPS,         "vps" },
 	{ V4L2_SLICED_CAPTION_525, "cc" },
 	{ V4L2_SLICED_WSS_625,     "wss" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 std::string service2s(unsigned service)
@@ -401,7 +401,7 @@ static const flag_def selection_targets_def[] = {
 	{ V4L2_SEL_TGT_COMPOSE_BOUNDS, "compose_bounds" },
 	{ V4L2_SEL_TGT_COMPOSE_PADDED, "compose_padded" },
 	{ V4L2_SEL_TGT_NATIVE_SIZE, "native_size" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 bool valid_seltarget_at_idx(unsigned i)
@@ -420,7 +420,7 @@ std::string seltarget2s(__u32 target)
 {
 	int i = 0;
 
-	while (selection_targets_def[i].str != NULL) {
+	while (selection_targets_def[i].str != nullptr) {
 		if (selection_targets_def[i].flag == target)
 			return selection_targets_def[i].str;
 		i++;
@@ -432,7 +432,7 @@ const flag_def selection_flags_def[] = {
 	{ V4L2_SEL_FLAG_GE, "ge" },
 	{ V4L2_SEL_FLAG_LE, "le" },
 	{ V4L2_SEL_FLAG_KEEP_CONFIG, "keep-config" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 std::string selflags2s(__u32 flags)
@@ -443,19 +443,19 @@ std::string selflags2s(__u32 flags)
 static const char *std_pal[] = {
 	"B", "B1", "G", "H", "I", "D", "D1", "K",
 	"M", "N", "Nc", "60",
-	NULL
+	nullptr
 };
 static const char *std_ntsc[] = {
 	"M", "M-JP", "443", "M-KR",
-	NULL
+	nullptr
 };
 static const char *std_secam[] = {
 	"B", "D", "G", "H", "K", "K1", "L", "Lc",
-	NULL
+	nullptr
 };
 static const char *std_atsc[] = {
 	"8-VSB", "16-VSB",
-	NULL
+	nullptr
 };
 
 static std::string partstd2s(const char *prefix, const char *stds[], unsigned long long std)
@@ -512,7 +512,7 @@ std::string ctrlflags2s(__u32 flags)
 		{ V4L2_CTRL_FLAG_HAS_PAYLOAD,"has-payload" },
 		{ V4L2_CTRL_FLAG_EXECUTE_ON_WRITE, "execute-on-write" },
 		{ V4L2_CTRL_FLAG_MODIFY_LAYOUT, "modify-layout" },
-		{ 0, NULL }
+		{ 0, nullptr }
 	};
 	return flags2s(flags, def);
 }
@@ -533,7 +533,7 @@ static const flag_def in_status_def[] = {
 	{ V4L2_IN_ST_MACROVISION, "macrovision" },
 	{ V4L2_IN_ST_NO_ACCESS,   "no conditional access" },
 	{ V4L2_IN_ST_VTR,         "VTR time constant" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 std::string in_status2s(__u32 status)
@@ -545,7 +545,7 @@ static const flag_def input_cap_def[] = {
 	{ V4L2_IN_CAP_DV_TIMINGS, "DV timings" },
 	{ V4L2_IN_CAP_STD, "SDTV standards" },
 	{ V4L2_IN_CAP_NATIVE_SIZE, "Native Size" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 std::string input_cap2s(__u32 capabilities)
@@ -557,7 +557,7 @@ static const flag_def output_cap_def[] = {
 	{ V4L2_OUT_CAP_DV_TIMINGS, "DV timings" },
 	{ V4L2_OUT_CAP_STD, "SDTV standards" },
 	{ V4L2_OUT_CAP_NATIVE_SIZE, "Native Size" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 std::string output_cap2s(__u32 capabilities)
@@ -617,7 +617,7 @@ static const flag_def dv_standards_def[] = {
 	{ V4L2_DV_BT_STD_CVT, "CVT" },
 	{ V4L2_DV_BT_STD_GTF, "GTF" },
 	{ V4L2_DV_BT_STD_SDI, "SDI" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 std::string dv_standards2s(__u32 flags)
@@ -661,7 +661,7 @@ static const flag_def dv_caps_def[] = {
 	{ V4L2_DV_BT_CAP_PROGRESSIVE, "Progressive" },
 	{ V4L2_DV_BT_CAP_REDUCED_BLANKING, "Reduced Blanking" },
 	{ V4L2_DV_BT_CAP_CUSTOM, "Custom Formats" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 std::string dv_caps2s(__u32 flags)
@@ -675,7 +675,7 @@ static const flag_def tc_flags_def[] = {
 	{ V4L2_TC_USERBITS_field, "userbits-field" },
 	{ V4L2_TC_USERBITS_USERDEFINED, "userbits-userdefined" },
 	{ V4L2_TC_USERBITS_8BITCHARS, "userbits-8bitchars" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 std::string tc_flags2s(__u32 flags)
@@ -699,7 +699,7 @@ static const flag_def buffer_flags_def[] = {
 	{ V4L2_BUF_FLAG_LAST, "last" },
 	{ V4L2_BUF_FLAG_REQUEST_FD, "request-fd" },
 	{ V4L2_BUF_FLAG_IN_REQUEST, "in-request" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 std::string bufferflags2s(__u32 flags)
@@ -741,7 +741,7 @@ std::string bufferflags2s(__u32 flags)
 static const flag_def vbi_def[] = {
 	{ V4L2_VBI_UNSYNC,     "unsynchronized" },
 	{ V4L2_VBI_INTERLACED, "interlaced" },
-	{ 0, NULL }
+	{ 0, nullptr }
 };
 
 std::string vbiflags2s(__u32 flags)
diff --git a/utils/libcecutil/cec-info.cpp b/utils/libcecutil/cec-info.cpp
index baa3f6186..37467b5cd 100644
--- a/utils/libcecutil/cec-info.cpp
+++ b/utils/libcecutil/cec-info.cpp
@@ -23,7 +23,7 @@ const char *cec_opcode2s(unsigned opcode)
 	for (auto i : msgtable)
 		if (i.opcode == opcode)
 			return i.name;
-	return NULL;
+	return nullptr;
 }
 
 const char *cec_cdc_opcode2s(unsigned cdc_opcode)
@@ -31,7 +31,7 @@ const char *cec_cdc_opcode2s(unsigned cdc_opcode)
 	for (auto i : cdcmsgtable)
 		if (i.opcode == cdc_opcode)
 			return i.name;
-	return NULL;
+	return nullptr;
 }
 
 const char *cec_htng_opcode2s(unsigned htng_opcode)
@@ -39,7 +39,7 @@ const char *cec_htng_opcode2s(unsigned htng_opcode)
 	for (auto i : htngmsgtable)
 		if (i.opcode == htng_opcode)
 			return i.name;
-	return NULL;
+	return nullptr;
 }
 
 static std::string caps2s(unsigned caps)
@@ -493,7 +493,7 @@ std::string cec_device_find(const char *driver, const char *adapter)
 	std::string name;
 
 	dp = opendir("/dev");
-	if (dp == NULL) {
+	if (dp == nullptr) {
 		perror("Couldn't open the directory");
 		return name;
 	}
diff --git a/utils/libcecutil/cec-log.cpp b/utils/libcecutil/cec-log.cpp
index 41dd9b2dc..323e3d616 100644
--- a/utils/libcecutil/cec-log.cpp
+++ b/utils/libcecutil/cec-log.cpp
@@ -114,7 +114,7 @@ static void log_htng_unknown_msg(const struct cec_msg *msg);
 const struct cec_msg_args *cec_log_msg_args(unsigned int index)
 {
 	if (index >= sizeof(messages) / sizeof(messages[0]))
-		return NULL;
+		return nullptr;
 	return &messages[index];
 }
 
@@ -325,5 +325,5 @@ const char *cec_log_ui_cmd_string(__u8 ui_cmd)
 		if (type_ui_cmd[i].value == ui_cmd)
 			return type_ui_cmd[i].type_name;
 	}
-	return NULL;
+	return nullptr;
 }
diff --git a/utils/libcecutil/cec-parse.cpp b/utils/libcecutil/cec-parse.cpp
index 574b86ecd..fd37f5b83 100644
--- a/utils/libcecutil/cec-parse.cpp
+++ b/utils/libcecutil/cec-parse.cpp
@@ -153,7 +153,7 @@ int cec_parse_subopt(char **subs, const char * const *subopts, char **value)
 		fprintf(stderr, "Invalid suboptions specified\n");
 		return -1;
 	}
-	if (*value == NULL) {
+	if (*value == nullptr) {
 		fprintf(stderr, "No value given to suboption <%s>\n",
 				subopts[opt]);
 		return -1;
@@ -164,7 +164,7 @@ int cec_parse_subopt(char **subs, const char * const *subopts, char **value)
 static unsigned parse_enum(const char *value, const struct cec_arg *a)
 {
 	if (isdigit(*value))
-		return strtoul(value, NULL, 0);
+		return strtoul(value, nullptr, 0);
 	for (int i = 0; i < a->num_enum_values; i++) {
 		if (!strcmp(value, a->values[i].type_name))
 			return a->values[i].value;
@@ -177,7 +177,7 @@ unsigned cec_parse_phys_addr(const char *value)
 	unsigned p1, p2, p3, p4;
 
 	if (!std::strchr(value, '.'))
-		return strtoul(value, NULL, 0);
+		return strtoul(value, nullptr, 0);
 	if (sscanf(value, "%x.%x.%x.%x", &p1, &p2, &p3, &p4) != 4) {
 		fprintf(stderr, "Expected a physical address of the form x.x.x.x\n");
 		return 0;
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index 37ab7dad4..994fc9c4d 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -77,26 +77,26 @@ static struct ctl_parameters params;
 static int app_result;
 
 static struct option long_options[] = {
-	{"all", no_argument, 0, OptAll},
-	{"rbds", no_argument, 0, OptRBDS},
-	{"device", required_argument, 0, OptSetDevice},
-	{"file", required_argument, 0, OptOpenFile},
-	{"freq-seek", required_argument, 0, OptFreqSeek},
-	{"get-freq", no_argument, 0, OptGetFreq},
-	{"get-tuner", no_argument, 0, OptGetTuner},
-	{"help", no_argument, 0, OptHelp},
-	{"info", no_argument, 0, OptGetDriverInfo},
-	{"list-devices", no_argument, 0, OptListDevices},
-	{"list-freq-bands", no_argument, 0, OptListFreqBands},
-	{"print-block", no_argument, 0, OptPrintBlock},
-	{"read-rds", no_argument, 0, OptReadRds},
-	{"set-freq", required_argument, 0, OptSetFreq},
-	{"tmc", no_argument, 0, OptTMC},
-	{"tuner-index", required_argument, 0, OptTunerIndex},
-	{"silent", no_argument, 0, OptSilent},
-	{"verbose", no_argument, 0, OptVerbose},
-	{"wait-limit", required_argument, 0, OptWaitLimit},
-	{0, 0, 0, 0}
+	{"all", no_argument, nullptr, OptAll},
+	{"rbds", no_argument, nullptr, OptRBDS},
+	{"device", required_argument, nullptr, OptSetDevice},
+	{"file", required_argument, nullptr, OptOpenFile},
+	{"freq-seek", required_argument, nullptr, OptFreqSeek},
+	{"get-freq", no_argument, nullptr, OptGetFreq},
+	{"get-tuner", no_argument, nullptr, OptGetTuner},
+	{"help", no_argument, nullptr, OptHelp},
+	{"info", no_argument, nullptr, OptGetDriverInfo},
+	{"list-devices", no_argument, nullptr, OptListDevices},
+	{"list-freq-bands", no_argument, nullptr, OptListFreqBands},
+	{"print-block", no_argument, nullptr, OptPrintBlock},
+	{"read-rds", no_argument, nullptr, OptReadRds},
+	{"set-freq", required_argument, nullptr, OptSetFreq},
+	{"tmc", no_argument, nullptr, OptTMC},
+	{"tuner-index", required_argument, nullptr, OptTunerIndex},
+	{"silent", no_argument, nullptr, OptSilent},
+	{"verbose", no_argument, nullptr, OptVerbose},
+	{"wait-limit", required_argument, nullptr, OptWaitLimit},
+	{nullptr, 0, nullptr, 0}
 };
 
 static void usage_hint()
@@ -326,7 +326,7 @@ static dev_vec list_devices()
 	struct v4l2_tuner vt;
 
 	dp = opendir("/dev");
-	if (dp == NULL) {
+	if (dp == nullptr) {
 		perror ("Couldn't open the directory");
 		std::exit(EXIT_FAILURE);
 	}
@@ -370,7 +370,7 @@ static int parse_subopt(char **subs, const char * const *subopts, char **value)
 		fprintf(stderr, "Invalid suboptions specified\n");
 		return -1;
 	}
-	if (*value == NULL) {
+	if (*value == nullptr) {
 		fprintf(stderr, "No value given to suboption <%s>\n",
 				subopts[opt]);
 		return -1;
@@ -388,18 +388,18 @@ static void parse_freq_seek(char *optarg, struct v4l2_hw_freq_seek &seek)
 			"dir",
 			"wrap",
 			"spacing",
-			NULL
+			nullptr
 		};
 
 		switch (parse_subopt(&subs, subopts, &value)) {
 		case 0:
-			seek.seek_upward = strtol(value, 0L, 0);
+			seek.seek_upward = strtol(value, nullptr, 0);
 			break;
 		case 1:
-			seek.wrap_around = strtol(value, 0L, 0);
+			seek.wrap_around = strtol(value, nullptr, 0);
 			break;
 		case 2:
-			seek.spacing = strtol(value, 0L, 0);
+			seek.spacing = strtol(value, nullptr, 0);
 			break;
 		default:
 			usage_tuner();
@@ -765,7 +765,7 @@ static int parse_cl(int argc, char **argv)
 			params.fd_name[sizeof(params.fd_name) - 1] = '\0';
 			break;
 		case OptSetFreq:
-			params.freq = strtod(optarg, NULL);
+			params.freq = strtod(optarg, nullptr);
 			break;
 		case OptListDevices:
 			print_devices(list_devices());
@@ -774,7 +774,7 @@ static int parse_cl(int argc, char **argv)
 			parse_freq_seek(optarg, params.freq_seek);
 			break;
 		case OptTunerIndex:
-			params.tuner_index = strtoul(optarg, NULL, 0);
+			params.tuner_index = strtoul(optarg, nullptr, 0);
 			break;
 		case OptOpenFile:
 		{
@@ -791,7 +791,7 @@ static int parse_cl(int argc, char **argv)
 			break;
 		}
 		case OptWaitLimit:
-			params.wait_limit = strtoul(optarg, NULL, 0);
+			params.wait_limit = strtoul(optarg, nullptr, 0);
 			break;
 		case ':':
 			fprintf(stderr, "Option '%s' requires a value\n",
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 4ff0a3036..cfc980c4c 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -114,35 +114,35 @@ struct dev_state {
 static struct dev_state state;
 
 static struct option long_options[] = {
-	{"device", required_argument, 0, OptSetDevice},
-	{"radio-device", required_argument, 0, OptSetRadioDevice},
-	{"vbi-device", required_argument, 0, OptSetVbiDevice},
-	{"sdr-device", required_argument, 0, OptSetSWRadioDevice},
-	{"subdev-device", required_argument, 0, OptSetSubDevDevice},
-	{"expbuf-device", required_argument, 0, OptSetExpBufDevice},
-	{"touch-device", required_argument, 0, OptSetTouchDevice},
-	{"media-device", required_argument, 0, OptSetMediaDevice},
-	{"media-device-only", required_argument, 0, OptSetMediaDeviceOnly},
-	{"media-bus-info", required_argument, 0, OptMediaBusInfo},
-	{"help", no_argument, 0, OptHelp},
-	{"verbose", no_argument, 0, OptVerbose},
-	{"color", required_argument, 0, OptColor},
-	{"no-warnings", no_argument, 0, OptNoWarnings},
-	{"no-progress", no_argument, 0, OptNoProgress},
-	{"exit-on-fail", no_argument, 0, OptExitOnFail},
-	{"exit-on-warn", no_argument, 0, OptExitOnWarn},
-	{"trace", no_argument, 0, OptTrace},
+	{"device", required_argument, nullptr, OptSetDevice},
+	{"radio-device", required_argument, nullptr, OptSetRadioDevice},
+	{"vbi-device", required_argument, nullptr, OptSetVbiDevice},
+	{"sdr-device", required_argument, nullptr, OptSetSWRadioDevice},
+	{"subdev-device", required_argument, nullptr, OptSetSubDevDevice},
+	{"expbuf-device", required_argument, nullptr, OptSetExpBufDevice},
+	{"touch-device", required_argument, nullptr, OptSetTouchDevice},
+	{"media-device", required_argument, nullptr, OptSetMediaDevice},
+	{"media-device-only", required_argument, nullptr, OptSetMediaDeviceOnly},
+	{"media-bus-info", required_argument, nullptr, OptMediaBusInfo},
+	{"help", no_argument, nullptr, OptHelp},
+	{"verbose", no_argument, nullptr, OptVerbose},
+	{"color", required_argument, nullptr, OptColor},
+	{"no-warnings", no_argument, nullptr, OptNoWarnings},
+	{"no-progress", no_argument, nullptr, OptNoProgress},
+	{"exit-on-fail", no_argument, nullptr, OptExitOnFail},
+	{"exit-on-warn", no_argument, nullptr, OptExitOnWarn},
+	{"trace", no_argument, nullptr, OptTrace},
 #ifndef NO_LIBV4L2
-	{"wrapper", no_argument, 0, OptUseWrapper},
+	{"wrapper", no_argument, nullptr, OptUseWrapper},
 #endif
-	{"streaming", optional_argument, 0, OptStreaming},
-	{"stream-from", required_argument, 0, OptStreamFrom},
-	{"stream-from-hdr", required_argument, 0, OptStreamFromHdr},
-	{"stream-all-formats", optional_argument, 0, OptStreamAllFormats},
-	{"stream-all-io", no_argument, 0, OptStreamAllIO},
-	{"stream-all-color", required_argument, 0, OptStreamAllColorTest},
-	{"version", no_argument, 0, OptVersion},
-	{0, 0, 0, 0}
+	{"streaming", optional_argument, nullptr, OptStreaming},
+	{"stream-from", required_argument, nullptr, OptStreamFrom},
+	{"stream-from-hdr", required_argument, nullptr, OptStreamFromHdr},
+	{"stream-all-formats", optional_argument, nullptr, OptStreamAllFormats},
+	{"stream-all-io", no_argument, nullptr, OptStreamAllIO},
+	{"stream-all-color", required_argument, nullptr, OptStreamAllColorTest},
+	{"version", no_argument, nullptr, OptVersion},
+	{nullptr, 0, nullptr, 0}
 };
 
 #define STR(x) #x
@@ -620,7 +620,7 @@ static int testCap(struct node *node)
 
 	memset(&vcap, 0xff, sizeof(vcap));
 	// Must always be there
-	fail_on_test(doioctl(node, VIDIOC_QUERYCAP, NULL) != EFAULT);
+	fail_on_test(doioctl(node, VIDIOC_QUERYCAP, nullptr) != EFAULT);
 	fail_on_test(doioctl(node, VIDIOC_QUERYCAP, &vcap));
 	fail_on_test(check_ustring(vcap.driver, sizeof(vcap.driver)));
 	fail_on_test(check_ustring(vcap.card, sizeof(vcap.card)));
@@ -779,9 +779,9 @@ static int testInvalidIoctls(struct node *node, char type)
 	unsigned ioc = _IOC(_IOC_NONE, type, 0xff, 0);
 	unsigned char buf[0x4000] = {};
 
-	fail_on_test(doioctl(node, ioc, NULL) != ENOTTY);
+	fail_on_test(doioctl(node, ioc, nullptr) != ENOTTY);
 	ioc = _IOC(_IOC_NONE, type, 0, 0x3fff);
-	fail_on_test(doioctl(node, ioc, NULL) != ENOTTY);
+	fail_on_test(doioctl(node, ioc, nullptr) != ENOTTY);
 	ioc = _IOC(_IOC_READ, type, 0, 0x3fff);
 	fail_on_test(doioctl(node, ioc, buf) != ENOTTY);
 	fail_on_test(check_0(buf, sizeof(buf)));
@@ -823,7 +823,7 @@ static int parse_subopt(char **subs, const char * const *subopts, char **value)
 		fprintf(stderr, "Invalid suboptions specified\n");
 		return -1;
 	}
-	if (*value == NULL) {
+	if (*value == nullptr) {
 		fprintf(stderr, "No value given to suboption <%s>\n",
 				subopts[opt]);
 		return -1;
@@ -837,7 +837,7 @@ static int open_media_bus_info(const std::string &bus_info, std::string &media_d
 	struct dirent *ep;
 
 	dp = opendir("/dev");
-	if (dp == NULL)
+	if (dp == nullptr)
 		return -1;
 
 	while ((ep = readdir(dp))) {
@@ -905,7 +905,7 @@ static std::string make_devname(const char *device, const char *devname,
 		goto err;
 
 	if (device[0] == '0' && device[1] == 'x')
-		iface_id = strtoul(device, NULL, 16);
+		iface_id = strtoul(device, nullptr, 16);
 
 	if (!iface_id) {
 		for (i = 0; i < topology.num_entities; i++)
@@ -1569,7 +1569,7 @@ int main(int argc, char **argv)
 			break;
 		case OptStreaming:
 			if (optarg)
-				frame_count = strtoul(optarg, NULL, 0);
+				frame_count = strtoul(optarg, nullptr, 0);
 			break;
 		case OptStreamFrom:
 		case OptStreamFromHdr: {
@@ -1577,7 +1577,7 @@ int main(int argc, char **argv)
 			bool has_hdr = ch == OptStreamFromHdr;
 
 			if (equal == optarg)
-				equal = NULL;
+				equal = nullptr;
 			if (equal) {
 				*equal = '\0';
 				stream_from_map[optarg] = equal + 1;
@@ -1590,7 +1590,7 @@ int main(int argc, char **argv)
 		}
 		case OptStreamAllFormats:
 			if (optarg)
-				all_fmt_frame_count = strtoul(optarg, NULL, 0);
+				all_fmt_frame_count = strtoul(optarg, nullptr, 0);
 			break;
 		case OptStreamAllColorTest:
 			subs = optarg;
@@ -1599,7 +1599,7 @@ int main(int argc, char **argv)
 					"color",
 					"skip",
 					"perc",
-					NULL
+					nullptr
 				};
 
 				switch (parse_subopt(&subs, subopts, &value)) {
@@ -1616,10 +1616,10 @@ int main(int argc, char **argv)
 					}
 					break;
 				case 1:
-					color_skip = strtoul(value, 0L, 0);
+					color_skip = strtoul(value, nullptr, 0);
 					break;
 				case 2:
-					color_perc = strtoul(value, 0L, 0);
+					color_perc = strtoul(value, nullptr, 0);
 					if (color_perc == 0)
 						color_perc = 90;
 					if (color_perc > 100)
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index aca0eb68f..e4edd3592 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -548,7 +548,7 @@ int testReqBufs(struct node *node)
 		return ret;
 	}
 	fail_on_test(ret != EINVAL);
-	fail_on_test(node->node2 == NULL);
+	fail_on_test(node->node2 == nullptr);
 	for (i = 1; i <= V4L2_BUF_TYPE_LAST; i++) {
 		bool is_overlay = v4l_type_is_overlay(i);
 		__u32 caps = 0;
@@ -970,9 +970,9 @@ static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_
 			if (node->is_m2m)
 				ret = select(node->g_fd() + 1, &rfds, &wfds, &efds, &tv);
 			else if (v4l_type_is_output(q.g_type()))
-				ret = select(node->g_fd() + 1, NULL, &wfds, NULL, &tv);
+				ret = select(node->g_fd() + 1, nullptr, &wfds, nullptr, &tv);
 			else
-				ret = select(node->g_fd() + 1, &rfds, NULL, NULL, &tv);
+				ret = select(node->g_fd() + 1, &rfds, nullptr, nullptr, &tv);
 			fail_on_test(ret == 0);
 			fail_on_test(ret < 0);
 			fail_on_test(!FD_ISSET(node->g_fd(), &rfds) &&
@@ -1061,7 +1061,7 @@ static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_
 				warn_once("QBUF returned the buffer as DONE.\n");
 			if (buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD) {
 				fail_on_test(doioctl_fd(buf_req_fds[req_idx],
-							MEDIA_REQUEST_IOC_QUEUE, 0));
+							MEDIA_REQUEST_IOC_QUEUE, nullptr));
 				// testRequests will close some of these request fds,
 				// so we need to find the next valid fds.
 				do {
@@ -1403,7 +1403,7 @@ int testMmap(struct node *node, struct node *node_m2m_cap, unsigned frame_count,
 				fcntl(node->g_fd(), F_SETFL, fd_flags | O_NONBLOCK);
 				FD_ZERO(&efds);
 				FD_SET(node->g_fd(), &efds);
-				ret = select(node->g_fd() + 1, NULL, NULL, &efds, &tv);
+				ret = select(node->g_fd() + 1, nullptr, nullptr, &efds, &tv);
 				fail_on_test(ret < 0);
 				fail_on_test(ret == 0);
 				fail_on_test(node->dqevent(ev));
@@ -1550,7 +1550,7 @@ static int setupUserPtr(struct node *node, cv4l_queue &q)
 		// Try to use VIDIOC_PREPARE_BUF for every other buffer
 		if ((i & 1) == 0) {
 			for (unsigned p = 0; p < buf.g_num_planes(); p++)
-				buf.s_userptr(0UL, p);
+				buf.s_userptr(nullptr, p);
 			ret = buf.prepare_buf(node);
 			fail_on_test(!ret);
 			for (unsigned p = 0; p < buf.g_num_planes(); p++)
@@ -1566,7 +1566,7 @@ static int setupUserPtr(struct node *node, cv4l_queue &q)
 				fail_on_test(buf.querybuf(node, i));
 				fail_on_test(buf.check(q, Prepared, i));
 				for (unsigned p = 0; p < buf.g_num_planes(); p++) {
-					buf.s_userptr(0UL, p);
+					buf.s_userptr(nullptr, p);
 					buf.s_bytesused(0, p);
 					buf.s_length(0, p);
 				}
@@ -1574,7 +1574,7 @@ static int setupUserPtr(struct node *node, cv4l_queue &q)
 		}
 		if (ret == ENOTTY) {
 			for (unsigned p = 0; p < buf.g_num_planes(); p++)
-				buf.s_userptr(0UL, p);
+				buf.s_userptr(nullptr, p);
 			ret = buf.qbuf(node);
 			fail_on_test(!ret);
 
@@ -1759,7 +1759,7 @@ int testUserPtr(struct node *node, struct node *node_m2m_cap, unsigned frame_cou
 						fail("data at %zd bytes after the end of the buffer was touched\n",
 						     (x - (u + buflen / 4)) * 4);
 				free(m);
-				q.s_userptr(i, p, NULL);
+				q.s_userptr(i, p, nullptr);
 			}
 		}
 		stream_close();
@@ -2018,16 +2018,16 @@ int testRequests(struct node *node, bool test_streaming)
 		ctrls.request_fd = req_fd;
 		fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls) != EACCES);
 	}
-	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_QUEUE, 0) != ENOENT);
-	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_REINIT, 0));
+	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_QUEUE, nullptr) != ENOENT);
+	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_REINIT, nullptr));
 	fhs.del(media_fd);
-	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_QUEUE, 0) != ENOENT);
-	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_REINIT, 0));
+	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_QUEUE, nullptr) != ENOENT);
+	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_REINIT, nullptr));
 	fhs.del(req_fd);
 	if (have_controls)
 		fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls) != EINVAL);
-	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_QUEUE, 0) != EBADF);
-	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_REINIT, 0) != EBADF);
+	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_QUEUE, nullptr) != EBADF);
+	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_REINIT, nullptr) != EBADF);
 
 	media_fd = fhs.add(mi_get_media_fd(node->g_fd(), node->bus_info));
 	fail_on_test(doioctl_fd(media_fd, MEDIA_IOC_REQUEST_ALLOC, &req_fd));
@@ -2095,7 +2095,7 @@ int testRequests(struct node *node, bool test_streaming)
 		fail_on_test(doioctl_fd(media_fd, MEDIA_IOC_REQUEST_ALLOC, &buf_req_fds[i]));
 		fhs.add(buf_req_fds[i]);
 		fail_on_test(buf_req_fds[i] < 0);
-		fail_on_test(!doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, 0));
+		fail_on_test(!doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, nullptr));
 	}
 	fhs.del(media_fd);
 
@@ -2199,7 +2199,7 @@ int testRequests(struct node *node, bool test_streaming)
 		ctrl.value = (i & 1) ? valid_qctrl.maximum : valid_qctrl.minimum;
 		ctrls.request_fd = buf_req_fds[i];
 		fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
-		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_REINIT, 0));
+		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_REINIT, nullptr));
 
 		fail_on_test(buf.querybuf(node, i));
 		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_IN_REQUEST);
@@ -2223,8 +2223,8 @@ int testRequests(struct node *node, bool test_streaming)
 						  VIVID_CID_BUF_PREPARE_ERROR :
 						  VIVID_CID_REQ_VALIDATE_ERROR))
 			fail_on_test(doioctl_fd(buf_req_fds[i],
-						MEDIA_REQUEST_IOC_QUEUE, 0) != EINVAL);
-		ret = doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, 0);
+						MEDIA_REQUEST_IOC_QUEUE, nullptr) != EINVAL);
+		ret = doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, nullptr);
 		if (node->codec_mask & STATELESS_DECODER) {
 			fail_on_test(ret != ENOENT);
 			test_streaming = false;
@@ -2235,8 +2235,8 @@ int testRequests(struct node *node, bool test_streaming)
 		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_IN_REQUEST);
 		fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD));
 		fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_QUEUED));
-		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_REINIT, 0) != EBUSY);
-		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, 0) != EBUSY);
+		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_REINIT, nullptr) != EBUSY);
+		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, nullptr) != EBUSY);
 		if (i >= min_bufs) {
 			close(buf_req_fds[i]);
 			buf_req_fds[i] = -1;
@@ -2273,8 +2273,8 @@ int testRequests(struct node *node, bool test_streaming)
 			POLLPRI, 0
 		};
 		fail_on_test(poll(&pfd, 1, 100) != 1);
-		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, 0) != EBUSY);
-		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_REINIT, 0));
+		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, nullptr) != EBUSY);
+		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_REINIT, nullptr));
 		fail_on_test(buf.querybuf(node, i));
 		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD);
 		fail_on_test(buf.g_request_fd());
@@ -2322,7 +2322,7 @@ public:
 
 	int start()
 	{
-		int ret = pthread_create(&thread, NULL, startRoutine, this);
+		int ret = pthread_create(&thread, nullptr, startRoutine, this);
 		if (ret < 0)
 			return ret;
 
@@ -2353,7 +2353,7 @@ public:
 			usleep(100000);
 		}
 
-		pthread_join(thread, NULL);
+		pthread_join(thread, nullptr);
 		running = false;
 	}
 
@@ -2364,13 +2364,13 @@ private:
 	{
 		auto self = static_cast<BlockingThread *>(arg);
 
-		pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
-		pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
+		pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, nullptr);
+		pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, nullptr);
 
 		self->run();
 
 		self->done = true;
-		return NULL;
+		return nullptr;
 	}
 
 	virtual void run() = 0;
@@ -2969,7 +2969,7 @@ static void streamIntervals(struct node *node, __u32 pixelformat, __u32 w, __u32
 	v4l2_frmivalenum frmival = { 0 };
 
 	if (node->enum_frameintervals(frmival, pixelformat, w, h)) {
-		streamFmt(node, pixelformat, w, h, NULL, frame_count);
+		streamFmt(node, pixelformat, w, h, nullptr, frame_count);
 		return;
 	}
 
diff --git a/utils/v4l2-compliance/v4l2-test-colors.cpp b/utils/v4l2-compliance/v4l2-test-colors.cpp
index 936515048..55a816949 100644
--- a/utils/v4l2-compliance/v4l2-test-colors.cpp
+++ b/utils/v4l2-compliance/v4l2-test-colors.cpp
@@ -476,7 +476,7 @@ static int testColorsFmt(struct node *node, unsigned component,
 {
 	cv4l_queue q;
 	cv4l_fmt fmt;
-	__u8 *planes[3] = { 0, 0, 0 };
+	__u8 *planes[3] = { nullptr, nullptr, nullptr };
 	skip++;
 
 	node->g_fmt(fmt);
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index 4faa538f5..d9c13b4ec 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -616,7 +616,7 @@ int testExtendedControls(struct node *node)
 		info("checking extended control '%s' (0x%08x)\n", qctrl.name, qctrl.id);
 		ctrl.id = qctrl.id;
 		ctrl.size = 0;
-		ctrl.ptr = NULL;
+		ctrl.ptr = nullptr;
 		ctrl.reserved2[0] = 0;
 		ctrls.count = 1;
 
@@ -690,7 +690,7 @@ int testExtendedControls(struct node *node)
 		}
 		if (qctrl.type == V4L2_CTRL_TYPE_STRING)
 			delete [] ctrl.string;
-		ctrl.string = NULL;
+		ctrl.string = nullptr;
 	}
 
 	ctrls.which = 0;
@@ -824,7 +824,7 @@ int testEvents(struct node *node)
 		//if (qctrl.type == V4L2_CTRL_TYPE_CTRL_CLASS)
 		FD_ZERO(&set);
 		FD_SET(node->g_fd(), &set);
-		ret = select(node->g_fd() + 1, NULL, NULL, &set, &timeout);
+		ret = select(node->g_fd() + 1, nullptr, nullptr, &set, &timeout);
 		if (ret == 0) {
 			if (qctrl.type != V4L2_CTRL_TYPE_CTRL_CLASS)
 				return fail("failed to find event for control '%s'\n", qctrl.name);
diff --git a/utils/v4l2-compliance/v4l2-test-debug.cpp b/utils/v4l2-compliance/v4l2-test-debug.cpp
index 877b577c3..732c7ee36 100644
--- a/utils/v4l2-compliance/v4l2-test-debug.cpp
+++ b/utils/v4l2-compliance/v4l2-test-debug.cpp
@@ -57,5 +57,5 @@ int testRegister(struct node *node)
 
 int testLogStatus(struct node *node)
 {
-	return doioctl(node, VIDIOC_LOG_STATUS, NULL);
+	return doioctl(node, VIDIOC_LOG_STATUS, nullptr);
 }
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index ef669ca21..c20d5ad2c 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -414,7 +414,7 @@ static void createInvalidFmt(struct v4l2_format &fmt, struct v4l2_clip &clip, un
 		clip.next = (struct  v4l2_clip *)0x0eadbeef;
 		fmt.fmt.win.clipcount = 1;
 		fmt.fmt.win.clips = &clip;
-		fmt.fmt.win.bitmap = NULL;
+		fmt.fmt.win.bitmap = nullptr;
 	}
 }
 
@@ -1177,7 +1177,7 @@ int testSetFormats(struct node *node)
 
 	// Test if setting a format on one fh will set the format for all
 	// filehandles.
-	if (node->node2 == NULL)
+	if (node->node2 == nullptr)
 		return 0;
 
 	// m2m devices are special in that the format is often per-filehandle.
diff --git a/utils/v4l2-compliance/v4l2-test-io-config.cpp b/utils/v4l2-compliance/v4l2-test-io-config.cpp
index 1d672520d..677a3ac53 100644
--- a/utils/v4l2-compliance/v4l2-test-io-config.cpp
+++ b/utils/v4l2-compliance/v4l2-test-io-config.cpp
@@ -579,7 +579,7 @@ static int checkEdid(struct node *node, unsigned pad, bool is_input)
 	}
 	edid.blocks = blocks;
 	edid.pad = pad;
-	edid.edid = NULL;
+	edid.edid = nullptr;
 	ret = doioctl(node, VIDIOC_S_EDID, &edid);
 	fail_on_test(ret != EFAULT);
 	edid.edid = (__u8 *)0x0eadbeef;
diff --git a/utils/v4l2-compliance/v4l2-test-media.cpp b/utils/v4l2-compliance/v4l2-test-media.cpp
index a7dd81b2c..d7a83b0cd 100644
--- a/utils/v4l2-compliance/v4l2-test-media.cpp
+++ b/utils/v4l2-compliance/v4l2-test-media.cpp
@@ -32,7 +32,7 @@ int testMediaDeviceInfo(struct node *node)
 	struct media_device_info mdinfo;
 
 	memset(&mdinfo, 0xff, sizeof(mdinfo));
-	fail_on_test(doioctl(node, MEDIA_IOC_DEVICE_INFO, NULL) != EFAULT);
+	fail_on_test(doioctl(node, MEDIA_IOC_DEVICE_INFO, nullptr) != EFAULT);
 	fail_on_test(doioctl(node, MEDIA_IOC_DEVICE_INFO, &mdinfo));
 	fail_on_test(check_0(mdinfo.reserved, sizeof(mdinfo.reserved)));
 	fail_on_test(check_string(mdinfo.driver, sizeof(mdinfo.driver)));
@@ -66,7 +66,7 @@ static int checkDevice(__u32 major, __u32 minor, bool iface, __u32 id)
 	fail_on_test(snprintf(dev_path, sizeof(dev_path), "/sys/dev/char/%d:%d",
 			      major, minor) == -1);
 	DIR *dp = opendir(dev_path);
-	if (dp == NULL)
+	if (dp == nullptr)
 		return fail("couldn't find %s for %s %u\n",
 			    dev_path, iface ? "interface" : "entity", id);
 	closedir(dp);
@@ -396,10 +396,10 @@ int testMediaEnum(struct node *node)
 		fail_on_test(links.links);
 		links.pads = (struct media_pad_desc *)4;
 		fail_on_test(ent.pads && doioctl(node, MEDIA_IOC_ENUM_LINKS, &links) != EFAULT);
-		links.pads = NULL;
+		links.pads = nullptr;
 		links.links = (struct media_link_desc *)4;
 		fail_on_test(ent.links && doioctl(node, MEDIA_IOC_ENUM_LINKS, &links) != EFAULT);
-		links.links = NULL;
+		links.links = nullptr;
 		links.pads = new media_pad_desc[ent.pads];
 		memset(links.pads, 0xff, ent.pads * sizeof(*links.pads));
 		links.links = new media_link_desc[ent.links];
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index b15c03f14..663c2b1ca 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -123,7 +123,7 @@ static const char *prefixes[] = {
 	"v4l-subdev",
 	"v4l-touch",
 	"media",
-	NULL
+	nullptr
 };
 
 static bool is_v4l_dev(const char *name)
@@ -173,7 +173,7 @@ static void list_media_devices(const std::string &media_bus_info)
 	std::map<dev_t, std::string> devices;
 
 	dp = opendir("/dev");
-	if (dp == NULL) {
+	if (dp == nullptr) {
 		perror ("Couldn't open the directory");
 		return;
 	}
@@ -239,7 +239,7 @@ static void list_devices()
 	struct v4l2_capability vcap;
 
 	dp = opendir("/dev");
-	if (dp == NULL) {
+	if (dp == nullptr) {
 		perror ("Couldn't open the directory");
 		return;
 	}
@@ -520,7 +520,7 @@ static int print_control(int fd, struct v4l2_query_ext_ctrl &qctrl, int show_men
 		return 1;
 	}
 	if (qctrl.type >= V4L2_CTRL_COMPOUND_TYPES) {
-		print_qctrl(fd, &qctrl, NULL, show_menus);
+		print_qctrl(fd, &qctrl, nullptr, show_menus);
 		return 1;
 	}
 	ctrls.which = V4L2_CTRL_ID2WHICH(qctrl.id);
@@ -745,9 +745,9 @@ static bool parse_subset(char *optarg)
 				return true;
 			}
 			if (idx & 1)
-				subset.offset[idx / 2] = strtoul(optarg, 0, 0);
+				subset.offset[idx / 2] = strtoul(optarg, nullptr, 0);
 			else {
-				subset.size[idx / 2 - 1] = strtoul(optarg, 0, 0);
+				subset.size[idx / 2 - 1] = strtoul(optarg, nullptr, 0);
 				if (subset.size[idx / 2 - 1] == 0) {
 					fprintf(stderr, "<size> cannot be 0\n");
 					return true;
@@ -755,7 +755,7 @@ static bool parse_subset(char *optarg)
 			}
 		}
 		idx++;
-		if (p == NULL)
+		if (p == nullptr)
 			break;
 		optarg = p + 1;
 	}
@@ -775,7 +775,7 @@ static bool parse_subset(char *optarg)
 static bool parse_next_subopt(char **subs, char **value)
 {
 	static char *const subopts[] = {
-	    NULL
+	    nullptr
 	};
 	int opt = getsubopt(subs, subopts, value);
 
@@ -829,7 +829,7 @@ void common_cmd(const std::string &media_bus_info, int ch, char *optarg)
 		}
 		break;
 	case OptSetPriority:
-		prio = static_cast<enum v4l2_priority>(strtoul(optarg, 0L, 0));
+		prio = static_cast<enum v4l2_priority>(strtoul(optarg, nullptr, 0));
 		break;
 	case OptListDevices:
 		if (media_bus_info.empty())
@@ -940,19 +940,19 @@ void common_set(cv4l_fd &_fd)
 
 				switch (qc.type) {
 				case V4L2_CTRL_TYPE_U8:
-					v = strtoul(set_ctrl.second.c_str(), NULL, 0);
+					v = strtoul(set_ctrl.second.c_str(), nullptr, 0);
 					for (i = 0; i < qc.elems; i++)
 						if (idx_in_subset(qc, subset, divide, i))
 							ctrl.p_u8[i] = v;
 					break;
 				case V4L2_CTRL_TYPE_U16:
-					v = strtoul(set_ctrl.second.c_str(), NULL, 0);
+					v = strtoul(set_ctrl.second.c_str(), nullptr, 0);
 					for (i = 0; i < qc.elems; i++)
 						if (idx_in_subset(qc, subset, divide, i))
 							ctrl.p_u16[i] = v;
 					break;
 				case V4L2_CTRL_TYPE_U32:
-					v = strtoul(set_ctrl.second.c_str(), NULL, 0);
+					v = strtoul(set_ctrl.second.c_str(), nullptr, 0);
 					for (i = 0; i < qc.elems; i++)
 						if (idx_in_subset(qc, subset, divide, i))
 							ctrl.p_u32[i] = v;
@@ -974,9 +974,9 @@ void common_set(cv4l_fd &_fd)
 				if (V4L2_CTRL_DRIVER_PRIV(ctrl.id))
 					use_ext_ctrls = true;
 				if (qc.type == V4L2_CTRL_TYPE_INTEGER64)
-					ctrl.value64 = strtoll(set_ctrl.second.c_str(), NULL, 0);
+					ctrl.value64 = strtoll(set_ctrl.second.c_str(), nullptr, 0);
 				else
-					ctrl.value = strtol(set_ctrl.second.c_str(), NULL, 0);
+					ctrl.value = strtol(set_ctrl.second.c_str(), nullptr, 0);
 			}
 			class2ctrls[V4L2_CTRL_ID2WHICH(ctrl.id)].push_back(ctrl);
 		}
@@ -1178,7 +1178,7 @@ void common_get(cv4l_fd &_fd)
 		static char buf[40960];
 		int len = -1;
 
-		if (doioctl(fd, VIDIOC_LOG_STATUS, NULL) == 0) {
+		if (doioctl(fd, VIDIOC_LOG_STATUS, nullptr) == 0) {
 			printf("\nStatus Log:\n\n");
 #ifdef HAVE_KLOGCTL
 			len = klogctl(3, buf, sizeof(buf) - 1);
diff --git a/utils/v4l2-ctl/v4l2-ctl-edid.cpp b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
index d82af0c90..9f7f60071 100644
--- a/utils/v4l2-ctl/v4l2-ctl-edid.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
@@ -225,7 +225,7 @@ static void edid_add_block(struct v4l2_edid *e)
 	if (e->blocks > 256) {
 		fprintf(stderr, "edid file error: too long\n");
 		free(e->edid);
-		e->edid = NULL;
+		e->edid = nullptr;
 		std::exit(EXIT_FAILURE);
 	}
 	e->edid = static_cast<unsigned char *>(realloc(e->edid, e->blocks * 128));
@@ -238,7 +238,7 @@ static void read_edid_file(FILE *f, struct v4l2_edid *e)
 	int c;
 
 	fseek(f, SEEK_SET, 0);
-	e->edid = NULL;
+	e->edid = nullptr;
 	e->blocks = 0;
 
 	while ((c = fgetc(f)) != EOF) {
@@ -258,7 +258,7 @@ static void read_edid_file(FILE *f, struct v4l2_edid *e)
 			value[1] = c;
 			if (i % 256 == 1)
 				edid_add_block(e);
-			e->edid[i / 2] = strtoul(value, 0, 16);
+			e->edid[i / 2] = strtoul(value, nullptr, 16);
 		} else {
 			value[0] = c;
 		}
@@ -704,7 +704,7 @@ static unsigned short parse_phys_addr(const char *value)
 	unsigned p1, p2, p3, p4;
 
 	if (!std::strchr(value, '.'))
-		return strtoul(value, NULL, 0);
+		return strtoul(value, nullptr, 0);
 	if (sscanf(value, "%x.%x.%x.%x", &p1, &p2, &p3, &p4) != 4) {
 		fprintf(stderr, "Expected a physical address of the form x.x.x.x\n");
 		return 0xffff;
@@ -908,7 +908,7 @@ void edid_cmd(int ch, char *optarg)
 	switch (ch) {
 	case OptSetEdid:
 		memset(&sedid, 0, sizeof(sedid));
-		file_in = NULL;
+		file_in = nullptr;
 		if (!optarg)
 			break;
 		subs = optarg;
@@ -971,7 +971,7 @@ void edid_cmd(int ch, char *optarg)
 				"btfc",
 				"btfl-btbr",
 				"tpls-tprs",
-				NULL
+				nullptr
 			};
 
 			int opt = getsubopt(&subs, (char* const*)subopts, &value);
@@ -981,7 +981,7 @@ void edid_cmd(int ch, char *optarg)
 				edid_usage();
 				std::exit(EXIT_FAILURE);
 			}
-			if (value == NULL && opt <= 8) {
+			if (value == nullptr && opt <= 8) {
 				fprintf(stderr, "No value given to suboption <%s>\n",
 					subopts[opt]);
 				edid_usage();
@@ -989,7 +989,7 @@ void edid_cmd(int ch, char *optarg)
 			}
 			switch (opt) {
 			case 0:
-				sedid.pad = strtoul(value, 0, 0);
+				sedid.pad = strtoul(value, nullptr, 0);
 				break;
 			case 1:
 			case 2:	/* keep edid for compat reasons, it's the same as type */
@@ -1044,13 +1044,13 @@ void edid_cmd(int ch, char *optarg)
 					phys_addr = parse_phys_addr(value);
 				break;
 			case 6:
-				mod_s_pt = strtoul(value, 0, 0) & 3;
+				mod_s_pt = strtoul(value, nullptr, 0) & 3;
 				break;
 			case 7:
-				mod_s_it = strtoul(value, 0, 0) & 3;
+				mod_s_it = strtoul(value, nullptr, 0) & 3;
 				break;
 			case 8:
-				mod_s_ce = strtoul(value, 0, 0) & 3;
+				mod_s_ce = strtoul(value, nullptr, 0) & 3;
 				break;
 			case 9: toggle_hdmi_vsdb_dc_flags |= HDMI_VSDB_Y444_BIT; break;
 			case 10: toggle_hdmi_vsdb_dc_flags |= HDMI_VSDB_30_BIT; break;
@@ -1109,14 +1109,14 @@ void edid_cmd(int ch, char *optarg)
 
 	case OptClearEdid:
 		if (optarg)
-			clear_pad = strtoul(optarg, 0, 0);
+			clear_pad = strtoul(optarg, nullptr, 0);
 		break;
 
 	case OptGetEdid:
 		memset(&gedid, 0, sizeof(gedid));
 		gedid.blocks = 256; /* default all blocks */
 		gformat = HEX; /* default hex output */
-		file_out = NULL;
+		file_out = nullptr;
 		if (!optarg)
 			break;
 		subs = optarg;
@@ -1127,22 +1127,22 @@ void edid_cmd(int ch, char *optarg)
 				"blocks",
 				"format",
 				"file",
-				NULL
+				nullptr
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				gedid.pad = strtoul(value, 0, 0);
+				gedid.pad = strtoul(value, nullptr, 0);
 				break;
 			case 1:
-				gedid.start_block = strtoul(value, 0, 0);
+				gedid.start_block = strtoul(value, nullptr, 0);
 				if (gedid.start_block > 255) {
 					fprintf(stderr, "startblock %d too large, max 255\n", gedid.start_block);
 					std::exit(EXIT_FAILURE);
 				}
 				break;
 			case 2:
-				gedid.blocks = strtoul(value, 0, 0);
+				gedid.blocks = strtoul(value, nullptr, 0);
 				break;
 			case 3:
 				if (!strcmp(value, "hex")) {
@@ -1172,7 +1172,7 @@ void edid_cmd(int ch, char *optarg)
 	case OptInfoEdid:
 		memset(&info_edid, 0, sizeof(info_edid));
 		if (optarg)
-			info_edid.pad = strtoul(optarg, 0, 0);
+			info_edid.pad = strtoul(optarg, nullptr, 0);
 		break;
 	}
 }
@@ -1191,7 +1191,7 @@ void edid_set(cv4l_fd &_fd)
 	}
 
 	if (options[OptSetEdid]) {
-		FILE *fin = NULL;
+		FILE *fin = nullptr;
 		bool must_fix_edid = options[OptFixEdidChecksums];
 
 		if (file_in) {
@@ -1299,7 +1299,7 @@ void edid_set(cv4l_fd &_fd)
 		if (fin) {
 			if (sedid.edid) {
 				free(sedid.edid);
-				sedid.edid = NULL;
+				sedid.edid = nullptr;
 			}
 			if (fin != stdin)
 				fclose(fin);
diff --git a/utils/v4l2-ctl/v4l2-ctl-io.cpp b/utils/v4l2-ctl/v4l2-ctl-io.cpp
index ac30b062b..2c51e5736 100644
--- a/utils/v4l2-ctl/v4l2-ctl-io.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-io.cpp
@@ -63,16 +63,16 @@ void io_cmd(int ch, char *optarg)
 {
 	switch (ch) {
 		case OptSetInput:
-			input = strtol(optarg, 0L, 0);
+			input = strtol(optarg, nullptr, 0);
 			break;
 		case OptSetOutput:
-			output = strtol(optarg, 0L, 0);
+			output = strtol(optarg, nullptr, 0);
 			break;
 		case OptSetAudioInput:
-			vaudio.index = strtol(optarg, 0L, 0);
+			vaudio.index = strtol(optarg, nullptr, 0);
 			break;
 		case OptSetAudioOutput:
-			vaudout.index = strtol(optarg, 0L, 0);
+			vaudout.index = strtol(optarg, nullptr, 0);
 			break;
 	}
 }
diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
index a2db57c73..33c6db462 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -48,16 +48,16 @@ void meta_cmd(int ch, char *optarg)
 			vfmt.fmt.meta.dataformat = v4l2_fourcc(optarg[0],
 					optarg[1], optarg[2], optarg[3]);
 		} else {
-			vfmt.fmt.meta.dataformat = strtol(optarg, 0L, 0);
+			vfmt.fmt.meta.dataformat = strtol(optarg, nullptr, 0);
 		}
 		break;
 	case OptListMetaFormats:
 		if (optarg)
-			mbus_code = strtoul(optarg, 0L, 0);
+			mbus_code = strtoul(optarg, nullptr, 0);
 		break;
 	case OptListMetaOutFormats:
 		if (optarg)
-			mbus_code_out = strtoul(optarg, 0L, 0);
+			mbus_code_out = strtoul(optarg, nullptr, 0);
 		break;
 	}
 }
diff --git a/utils/v4l2-ctl/v4l2-ctl-misc.cpp b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
index a9eec94d1..1853608a3 100644
--- a/utils/v4l2-ctl/v4l2-ctl-misc.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
@@ -170,10 +170,10 @@ void misc_cmd(int ch, char *optarg)
 
 	switch (ch) {
 	case OptSetParm:
-		fps = strtod(optarg, NULL);
+		fps = strtod(optarg, nullptr);
 		break;
 	case OptSetOutputParm:
-		output_fps = strtod(optarg, NULL);
+		output_fps = strtod(optarg, nullptr);
 		break;
 	case OptSetJpegComp:
 		subs = optarg;
@@ -186,14 +186,14 @@ void misc_cmd(int ch, char *optarg)
 				"quality",
 				"markers",
 				"comment",
-				NULL
+				nullptr
 			};
 			size_t len;
 			int opt = parse_subopt(&subs, subopts, &value);
 
 			switch (opt) {
 			case 16:
-				jpegcomp.quality = strtol(value, 0L, 0);
+				jpegcomp.quality = strtol(value, nullptr, 0);
 				break;
 			case 17:
 				if (strstr(value, "dht"))
@@ -238,7 +238,7 @@ void misc_cmd(int ch, char *optarg)
 			static const char *const subopts[] = {
 				"cmd",
 				"flags",
-				NULL
+				nullptr
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
@@ -264,7 +264,7 @@ void misc_cmd(int ch, char *optarg)
 				"stop_pts",
 				"start_speed",
 				"start_format",
-				NULL
+				nullptr
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
@@ -275,10 +275,10 @@ void misc_cmd(int ch, char *optarg)
 				dec_cmd.flags = parse_decflags(value);
 				break;
 			case 2:
-				dec_cmd.stop.pts = strtoull(value, 0, 0);
+				dec_cmd.stop.pts = strtoull(value, nullptr, 0);
 				break;
 			case 3:
-				dec_cmd.start.speed = strtol(value, 0, 0);
+				dec_cmd.start.speed = strtol(value, nullptr, 0);
 				break;
 			case 4:
 				if (!strcmp(value, "gop"))
diff --git a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
index d8138ff5a..09de70c85 100644
--- a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
@@ -77,7 +77,7 @@ static void find_fb(int fd)
 
 	if (doioctl(fd, VIDIOC_G_FBUF, &fbuf))
 		return;
-	if (fbuf.base == 0) {
+	if (fbuf.base == nullptr) {
 		printf("No framebuffer base address was defined\n");
 		return;
 	}
@@ -146,7 +146,7 @@ static int fbuf_fill_from_fb(struct v4l2_framebuffer &fb, const char *fb_device)
 	struct fb_var_screeninfo vi;
 	int fb_fd;
 
-	if (fb_device == NULL)
+	if (fb_device == nullptr)
 		return 0;
 	fb_fd = open(fb_device, O_RDWR);
 	if (fb_fd == -1) {
@@ -219,32 +219,32 @@ void overlay_cmd(int ch, char *optarg)
 				"width",
 				"height",
 				"field",
-				NULL
+				nullptr
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				overlay_fmt.fmt.win.chromakey = strtoul(value, 0L, 0);
+				overlay_fmt.fmt.win.chromakey = strtoul(value, nullptr, 0);
 				set_overlay_fmt |= FmtChromaKey;
 				break;
 			case 1:
-				overlay_fmt.fmt.win.global_alpha = strtoul(value, 0L, 0);
+				overlay_fmt.fmt.win.global_alpha = strtoul(value, nullptr, 0);
 				set_overlay_fmt |= FmtGlobalAlpha;
 				break;
 			case 2:
-				overlay_fmt.fmt.win.w.left = strtol(value, 0L, 0);
+				overlay_fmt.fmt.win.w.left = strtol(value, nullptr, 0);
 				set_overlay_fmt |= FmtLeft;
 				break;
 			case 3:
-				overlay_fmt.fmt.win.w.top = strtol(value, 0L, 0);
+				overlay_fmt.fmt.win.w.top = strtol(value, nullptr, 0);
 				set_overlay_fmt |= FmtTop;
 				break;
 			case 4:
-				overlay_fmt.fmt.win.w.width = strtoul(value, 0L, 0);
+				overlay_fmt.fmt.win.w.width = strtoul(value, nullptr, 0);
 				set_overlay_fmt |= FmtWidth;
 				break;
 			case 5:
-				overlay_fmt.fmt.win.w.height = strtoul(value, 0L, 0);
+				overlay_fmt.fmt.win.w.height = strtoul(value, nullptr, 0);
 				set_overlay_fmt |= FmtHeight;
 				break;
 			case 6:
@@ -267,21 +267,21 @@ void overlay_cmd(int ch, char *optarg)
 				"top",
 				"width",
 				"height",
-				NULL
+				nullptr
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				r.left = strtoul(value, 0L, 0);
+				r.left = strtoul(value, nullptr, 0);
 				break;
 			case 1:
-				r.top = strtoul(value, 0L, 0);
+				r.top = strtoul(value, nullptr, 0);
 				break;
 			case 2:
-				r.width = strtoul(value, 0L, 0);
+				r.width = strtoul(value, nullptr, 0);
 				break;
 			case 3:
-				r.height = strtoul(value, 0L, 0);
+				r.height = strtoul(value, nullptr, 0);
 				break;
 			default:
 				overlay_usage();
@@ -298,7 +298,7 @@ void overlay_cmd(int ch, char *optarg)
 			struct v4l2_clip c;
 
 			c.c = r;
-			c.next = NULL;
+			c.next = nullptr;
 			clips.push_back(c);
 		}
 		break;
@@ -317,33 +317,33 @@ void overlay_cmd(int ch, char *optarg)
 				"local_alpha",
 				"local_inv_alpha",
 				"fb",
-				NULL
+				nullptr
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
 				fbuf.flags &= ~chroma_flags;
-				fbuf.flags |= strtol(value, 0L, 0) ? V4L2_FBUF_FLAG_CHROMAKEY : 0;
+				fbuf.flags |= strtol(value, nullptr, 0) ? V4L2_FBUF_FLAG_CHROMAKEY : 0;
 				set_fbuf |= chroma_flags;
 				break;
 			case 1:
 				fbuf.flags &= ~chroma_flags;
-				fbuf.flags |= strtol(value, 0L, 0) ? V4L2_FBUF_FLAG_SRC_CHROMAKEY : 0;
+				fbuf.flags |= strtol(value, nullptr, 0) ? V4L2_FBUF_FLAG_SRC_CHROMAKEY : 0;
 				set_fbuf |= chroma_flags;
 				break;
 			case 2:
 				fbuf.flags &= ~alpha_flags;
-				fbuf.flags |= strtol(value, 0L, 0) ? V4L2_FBUF_FLAG_GLOBAL_ALPHA : 0;
+				fbuf.flags |= strtol(value, nullptr, 0) ? V4L2_FBUF_FLAG_GLOBAL_ALPHA : 0;
 				set_fbuf |= alpha_flags;
 				break;
 			case 3:
 				fbuf.flags &= ~alpha_flags;
-				fbuf.flags |= strtol(value, 0L, 0) ? V4L2_FBUF_FLAG_LOCAL_ALPHA : 0;
+				fbuf.flags |= strtol(value, nullptr, 0) ? V4L2_FBUF_FLAG_LOCAL_ALPHA : 0;
 				set_fbuf |= alpha_flags;
 				break;
 			case 4:
 				fbuf.flags &= ~alpha_flags;
-				fbuf.flags |= strtol(value, 0L, 0) ? V4L2_FBUF_FLAG_LOCAL_INV_ALPHA : 0;
+				fbuf.flags |= strtol(value, nullptr, 0) ? V4L2_FBUF_FLAG_LOCAL_INV_ALPHA : 0;
 				set_fbuf |= alpha_flags;
 				break;
 			case 5:
@@ -362,7 +362,7 @@ void overlay_cmd(int ch, char *optarg)
 		}
 		break;
 	case OptOverlay:
-		overlay = strtol(optarg, 0L, 0);
+		overlay = strtol(optarg, nullptr, 0);
 		break;
 	}
 }
@@ -372,9 +372,9 @@ static void do_try_set_overlay(struct v4l2_format &fmt, int fd)
 	struct v4l2_window &win = fmt.fmt.win;
 	bool keep_old_clip = true;
 	bool keep_old_bitmap = true;
-	struct v4l2_clip *cliplist = NULL;
+	struct v4l2_clip *cliplist = nullptr;
 	unsigned stride = (win.w.width + 7) / 8;
-	unsigned char *bitmap = NULL;
+	unsigned char *bitmap = nullptr;
 	int ret;
 
 	if (((set_overlay_fmt & FmtWidth) && win.w.width != overlay_fmt.fmt.win.w.width) ||
@@ -385,7 +385,7 @@ static void do_try_set_overlay(struct v4l2_format &fmt, int fd)
 	if (options[OptClearClips] || !clips.empty())
 		keep_old_clip = false;
 
-	win.bitmap = NULL;
+	win.bitmap = nullptr;
 	if (keep_old_bitmap) {
 		bitmap = static_cast<unsigned char *>(calloc(1, stride * win.w.height));
 		win.bitmap = bitmap;
@@ -489,7 +489,7 @@ void overlay_get(cv4l_fd &_fd)
 
 	if (options[OptGetOverlayFormat]) {
 		struct v4l2_format fmt;
-		unsigned char *bitmap = NULL;
+		unsigned char *bitmap = nullptr;
 
 		memset(&fmt, 0, sizeof(fmt));
 		// You can never have both VIDEO_OVERLAY and VIDEO_OUTPUT_OVERLAY
diff --git a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
index 95ac17121..4168eeb1b 100644
--- a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
@@ -41,7 +41,7 @@ void sdr_cmd(int ch, char *optarg)
 			vfmt.fmt.sdr.pixelformat = v4l2_fourcc(optarg[0],
 					optarg[1], optarg[2], optarg[3]);
 		} else {
-			vfmt.fmt.sdr.pixelformat = strtol(optarg, 0L, 0);
+			vfmt.fmt.sdr.pixelformat = strtol(optarg, nullptr, 0);
 		}
 		break;
 	}
diff --git a/utils/v4l2-ctl/v4l2-ctl-selection.cpp b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
index c4ede272c..4633776fb 100644
--- a/utils/v4l2-ctl/v4l2-ctl-selection.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-selection.cpp
@@ -98,24 +98,24 @@ static void parse_crop(char *optarg, unsigned int &set_crop, v4l2_rect &vcrop)
 			"top",
 			"width",
 			"height",
-			NULL
+			nullptr
 		};
 
 		switch (parse_subopt(&subs, subopts, &value)) {
 		case 0:
-			vcrop.left = strtol(value, 0L, 0);
+			vcrop.left = strtol(value, nullptr, 0);
 			set_crop |= CropLeft;
 			break;
 		case 1:
-			vcrop.top = strtol(value, 0L, 0);
+			vcrop.top = strtol(value, nullptr, 0);
 			set_crop |= CropTop;
 			break;
 		case 2:
-			vcrop.width = strtol(value, 0L, 0);
+			vcrop.width = strtol(value, nullptr, 0);
 			set_crop |= CropWidth;
 			break;
 		case 3:
-			vcrop.height = strtol(value, 0L, 0);
+			vcrop.height = strtol(value, nullptr, 0);
 			set_crop |= CropHeight;
 			break;
 		default:
@@ -160,7 +160,7 @@ static int parse_selection(char *optarg, unsigned int &set_sel, v4l2_selection &
 			"top",
 			"width",
 			"height",
-			NULL
+			nullptr
 		};
 
 		switch (parse_subopt(&subs, subopts, &value)) {
@@ -176,19 +176,19 @@ static int parse_selection(char *optarg, unsigned int &set_sel, v4l2_selection &
 			set_sel |= SelectionFlags;
 			break;
 		case 2:
-			vsel.r.left = strtol(value, 0L, 0);
+			vsel.r.left = strtol(value, nullptr, 0);
 			set_sel |= SelectionLeft;
 			break;
 		case 3:
-			vsel.r.top = strtol(value, 0L, 0);
+			vsel.r.top = strtol(value, nullptr, 0);
 			set_sel |= SelectionTop;
 			break;
 		case 4:
-			vsel.r.width = strtoul(value, 0L, 0);
+			vsel.r.width = strtoul(value, nullptr, 0);
 			set_sel |= SelectionWidth;
 			break;
 		case 5:
-			vsel.r.height = strtoul(value, 0L, 0);
+			vsel.r.height = strtoul(value, nullptr, 0);
 			set_sel |= SelectionHeight;
 			break;
 		default:
diff --git a/utils/v4l2-ctl/v4l2-ctl-stds.cpp b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
index 13f26757b..82571f932 100644
--- a/utils/v4l2-ctl/v4l2-ctl-stds.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
@@ -182,7 +182,7 @@ static int parse_timing_subopt(char **subopt_str, int *value)
 		"reduced-blanking",
 		"reduced-fps",
 		"clear",
-		NULL
+		nullptr
 	};
 
 	opt = getsubopt(subopt_str, (char* const*) subopt_list, &opt_str);
@@ -192,7 +192,7 @@ static int parse_timing_subopt(char **subopt_str, int *value)
 		stds_usage();
 		std::exit(EXIT_FAILURE);
 	}
-	if (opt_str == NULL && opt != CVT && opt != GTF && opt != CLEAR) {
+	if (opt_str == nullptr && opt != CVT && opt != GTF && opt != CLEAR) {
 		fprintf(stderr, "No value given to suboption <%s>\n",
 				subopt_list[opt]);
 		stds_usage();
@@ -200,7 +200,7 @@ static int parse_timing_subopt(char **subopt_str, int *value)
 	}
 
 	if (opt_str)
-		*value = strtol(opt_str, 0L, 0);
+		*value = strtol(opt_str, nullptr, 0);
 	return opt;
 }
 
@@ -446,7 +446,7 @@ void stds_cmd(int ch, char *optarg)
 				standard = V4L2_STD_SECAM;
 		}
 		else if (isdigit(optarg[0])) {
-			standard = strtol(optarg, 0L, 0) | (1ULL << 63);
+			standard = strtol(optarg, nullptr, 0) | (1ULL << 63);
 		} else {
 			fprintf(stderr, "Unknown standard '%s'\n", optarg);
 			stds_usage();
@@ -458,11 +458,11 @@ void stds_cmd(int ch, char *optarg)
 		break;
 	case OptListDvTimings:
 		if (optarg)
-			list_dv_timings_pad = strtoul(optarg, 0L, 0);
+			list_dv_timings_pad = strtoul(optarg, nullptr, 0);
 		break;
 	case OptGetDvTimingsCap:
 		if (optarg)
-			dv_timings_cap_pad = strtoul(optarg, 0L, 0);
+			dv_timings_cap_pad = strtoul(optarg, nullptr, 0);
 		break;
 	}
 }
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 0f34b3e6e..d1d1f91aa 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -637,13 +637,13 @@ void streaming_cmd(int ch, char *optarg)
 
 	switch (ch) {
 	case OptStreamCount:
-		stream_count = strtoul(optarg, 0L, 0);
+		stream_count = strtoul(optarg, nullptr, 0);
 		break;
 	case OptStreamSkip:
-		stream_skip = strtoul(optarg, 0L, 0);
+		stream_skip = strtoul(optarg, nullptr, 0);
 		break;
 	case OptStreamSleep:
-		stream_sleep = strtol(optarg, 0L, 0);
+		stream_sleep = strtol(optarg, nullptr, 0);
 		break;
 	case OptStreamNoQuery:
 		stream_no_query = true;
@@ -652,7 +652,7 @@ void streaming_cmd(int ch, char *optarg)
 		stream_loop = true;
 		break;
 	case OptStreamOutPattern:
-		stream_pat = strtoul(optarg, 0L, 0);
+		stream_pat = strtoul(optarg, nullptr, 0);
 		for (i = 0; tpg_pattern_strings[i]; i++) ;
 		if (stream_pat >= i)
 			stream_pat = 0;
@@ -692,7 +692,7 @@ void streaming_cmd(int ch, char *optarg)
 			streaming_usage();
 		break;
 	case OptStreamOutAlphaComponent:
-		stream_out_alpha = strtoul(optarg, 0L, 0);
+		stream_out_alpha = strtoul(optarg, nullptr, 0);
 		break;
 	case OptStreamOutAlphaRedOnly:
 		stream_out_alpha_red_only = true;
@@ -702,7 +702,7 @@ void streaming_cmd(int ch, char *optarg)
 		break;
 	case OptStreamOutHorSpeed:
 	case OptStreamOutVertSpeed:
-		speed = strtol(optarg, 0L, 0);
+		speed = strtol(optarg, nullptr, 0);
 		if (speed < -3)
 			speed = -3;
 		if (speed > 3)
@@ -713,7 +713,7 @@ void streaming_cmd(int ch, char *optarg)
 			stream_out_vert_mode = static_cast<tpg_move_mode>(speed + 3);
 		break;
 	case OptStreamOutPercFill:
-		stream_out_perc_fill = strtoul(optarg, 0L, 0);
+		stream_out_perc_fill = strtoul(optarg, nullptr, 0);
 		if (stream_out_perc_fill > 100)
 			stream_out_perc_fill = 100;
 		if (stream_out_perc_fill < 1)
@@ -753,7 +753,7 @@ void streaming_cmd(int ch, char *optarg)
 		fallthrough;
 	case OptStreamMmap:
 		if (optarg) {
-			reqbufs_count_cap = strtoul(optarg, 0L, 0);
+			reqbufs_count_cap = strtoul(optarg, nullptr, 0);
 			if (reqbufs_count_cap == 0)
 				reqbufs_count_cap = 3;
 		}
@@ -766,7 +766,7 @@ void streaming_cmd(int ch, char *optarg)
 		fallthrough;
 	case OptStreamOutMmap:
 		if (optarg) {
-			reqbufs_count_out = strtoul(optarg, 0L, 0);
+			reqbufs_count_out = strtoul(optarg, nullptr, 0);
 			if (reqbufs_count_out == 0)
 				reqbufs_count_out = 3;
 		}
@@ -1416,7 +1416,7 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
 				     host_fd_to >= 0 ? 100 - comp_perc / comp_perc_count : -1);
 		comp_perc_count = comp_perc = 0;
 	}
-	if (!last_buffer && index == NULL) {
+	if (!last_buffer && index == nullptr) {
 		/*
 		 * EINVAL in qbuf can happen if this is the last buffer before
 		 * a dynamic resolution change sequence. In this case the buffer
@@ -1632,7 +1632,7 @@ static int do_handle_out_to_in(cv4l_fd &out_fd, cv4l_fd &fd, cv4l_queue &out, cv
 
 static FILE *open_output_file(cv4l_fd &fd)
 {
-	FILE *fout = NULL;
+	FILE *fout = nullptr;
 
 #ifndef NO_STREAM_TO
 	if (file_to) {
@@ -1644,7 +1644,7 @@ static FILE *open_output_file(cv4l_fd &fd)
 		return fout;
 	}
 	if (!host_to)
-		return NULL;
+		return nullptr;
 
 	char *p = std::strchr(host_to, ':');
 	struct sockaddr_in serv_addr;
@@ -1657,7 +1657,7 @@ static FILE *open_output_file(cv4l_fd &fd)
 
 	aspect = fd.g_pixel_aspect(width, height);
 	if (p) {
-		host_port_to = strtoul(p + 1, 0L, 0);
+		host_port_to = strtoul(p + 1, nullptr, 0);
 		*p = '\0';
 	}
 	host_fd_to = socket(AF_INET, SOCK_STREAM, 0);
@@ -1666,7 +1666,7 @@ static FILE *open_output_file(cv4l_fd &fd)
 		std::exit(EXIT_SUCCESS);
 	}
 	server = gethostbyname(host_to);
-	if (server == NULL) {
+	if (server == nullptr) {
 		fprintf(stderr, "no such host %s\n", host_to);
 		std::exit(EXIT_SUCCESS);
 	}
@@ -1728,7 +1728,7 @@ static void streaming_set_cap(cv4l_fd &fd, cv4l_fd &exp_fd)
 	unsigned count;
 	bool eos;
 	bool source_change;
-	FILE *fout = NULL;
+	FILE *fout = nullptr;
 	cv4l_fmt fmt;
 
 	if (!(capabilities & (V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_CAPTURE_MPLANE |
@@ -1833,7 +1833,7 @@ recover:
 		FD_SET(fd.g_fd(), &exception_fds);
 		FD_ZERO(&read_fds);
 		FD_SET(fd.g_fd(), &read_fds);
-		r = select(fd.g_fd() + 1, use_poll ? &read_fds : NULL, NULL, &exception_fds, &tv);
+		r = select(fd.g_fd() + 1, use_poll ? &read_fds : nullptr, nullptr, &exception_fds, &tv);
 
 		if (r == -1) {
 			if (EINTR == errno)
@@ -1870,7 +1870,7 @@ recover:
 		}
 
 		if (FD_ISSET(fd.g_fd(), &read_fds)) {
-			r = do_handle_cap(fd, q, fout, NULL,
+			r = do_handle_cap(fd, q, fout, nullptr,
 					  count, fps_ts, fmt, false);
 			if (r < 0)
 				break;
@@ -1898,7 +1898,7 @@ done:
 
 static FILE *open_input_file(cv4l_fd &fd, __u32 type)
 {
-	FILE *fin = NULL;
+	FILE *fin = nullptr;
 
 	if (file_from) {
 		if (!strcmp(file_from, "-"))
@@ -1909,7 +1909,7 @@ static FILE *open_input_file(cv4l_fd &fd, __u32 type)
 		return fin;
 	}
 	if (!host_from)
-		return NULL;
+		return nullptr;
 
 	char *p = std::strchr(host_from, ':');
 	int listen_fd;
@@ -1917,7 +1917,7 @@ static FILE *open_input_file(cv4l_fd &fd, __u32 type)
 	struct sockaddr_in serv_addr = {}, cli_addr;
 
 	if (p) {
-		host_port_from = strtoul(p + 1, 0L, 0);
+		host_port_from = strtoul(p + 1, nullptr, 0);
 		*p = '\0';
 	}
 	listen_fd = socket(AF_INET, SOCK_STREAM, 0);
@@ -2032,7 +2032,7 @@ static void streaming_set_out(cv4l_fd &fd, cv4l_fd &exp_fd)
 	fps_timestamps fps_ts;
 	unsigned count = 0;
 	bool stopped = false;
-	FILE *fin = NULL;
+	FILE *fin = nullptr;
 	cv4l_fmt fmt;
 
 	fd.g_fmt(fmt);
@@ -2113,7 +2113,7 @@ static void streaming_set_out(cv4l_fd &fd, cv4l_fd &exp_fd)
 			tv.tv_sec = 2;
 			tv.tv_usec = 0;
 
-			r = select(fd.g_fd() + 1, NULL, &fds, NULL, &tv);
+			r = select(fd.g_fd() + 1, nullptr, &fds, nullptr, &tv);
 
 			if (r == -1) {
 				if (EINTR == errno)
@@ -2128,7 +2128,7 @@ static void streaming_set_out(cv4l_fd &fd, cv4l_fd &exp_fd)
 				goto done;
 			}
 		}
-		r = do_handle_out(fd, q, fin, NULL,
+		r = do_handle_out(fd, q, fin, nullptr,
 				  count, fps_ts, fmt, stopped, false);
 		if (r == QUEUE_STOPPED)
 			stopped = true;
@@ -2160,7 +2160,7 @@ enum stream_type {
 	OUT,
 };
 
-static int capture_setup(cv4l_fd &fd, cv4l_queue &in, cv4l_fd *exp_fd, cv4l_fmt *new_fmt = NULL)
+static int capture_setup(cv4l_fd &fd, cv4l_queue &in, cv4l_fd *exp_fd, cv4l_fmt *new_fmt = nullptr)
 {
 	if (fd.streamoff(in.g_type())) {
 		fprintf(stderr, "%s: fd.streamoff error\n", __func__);
@@ -2323,22 +2323,22 @@ static void stateful_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 		}
 
 		if (rd_fds && FD_ISSET(fd.g_fd(), rd_fds)) {
-			r = do_handle_cap(fd, in, fin, NULL,
+			r = do_handle_cap(fd, in, fin, nullptr,
 					  count[CAP], fps_ts[CAP], fmt_in,
 					  ignore_count_skip);
 			if (r == QUEUE_STOPPED)
 				break;
 			if (r < 0) {
-				rd_fds = NULL;
+				rd_fds = nullptr;
 				if (!have_eos) {
-					ex_fds = NULL;
+					ex_fds = nullptr;
 					break;
 				}
 			}
 		}
 
 		if (wr_fds && FD_ISSET(fd.g_fd(), wr_fds)) {
-			r = do_handle_out(fd, out, fout, NULL,
+			r = do_handle_out(fd, out, fout, nullptr,
 					  count[OUT], fps_ts[OUT], fmt_out, stopped,
 					  !ignore_count_skip);
 			if (r == QUEUE_STOPPED) {
@@ -2362,7 +2362,7 @@ static void stateful_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 
 			while (!fd.dqevent(ev)) {
 				if (ev.type == V4L2_EVENT_EOS) {
-					wr_fds = NULL;
+					wr_fds = nullptr;
 					if (!verbose)
 						fprintf(stderr, "\n");
 					fprintf(stderr, "EOS EVENT\n");
@@ -2472,7 +2472,7 @@ static void stateless_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 		FD_ZERO(&except_fds);
 		FD_SET(req_fd, &except_fds);
 
-		int rc = select(req_fd + 1, NULL, NULL, &except_fds, &tv);
+		int rc = select(req_fd + 1, nullptr, nullptr, &except_fds, &tv);
 
 		if (rc == 0) {
 			fprintf(stderr, "Timeout when waiting for media request\n");
@@ -2499,7 +2499,7 @@ static void stateless_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 		 * fin is not sent to do_handle_cap since the capture buf is
 		 * written to the file in current function
 		 */
-		rc = do_handle_cap(fd, in, NULL, &buf_idx, count[CAP],
+		rc = do_handle_cap(fd, in, nullptr, &buf_idx, count[CAP],
 				   fps_ts[CAP], fmt_in, false);
 		if (rc && rc != QUEUE_STOPPED) {
 			fprintf(stderr, "%s: do_handle_cap err\n", __func__);
@@ -2539,7 +2539,7 @@ static void stateless_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 			return;
 
 		if (!stopped) {
-			rc = do_handle_out(fd, out, fout, NULL, count[OUT],
+			rc = do_handle_out(fd, out, fout, nullptr, count[OUT],
 					   fps_ts[OUT], fmt_out, false, true);
 			if (rc) {
 				stopped = true;
@@ -2567,8 +2567,8 @@ static void streaming_set_m2m(cv4l_fd &fd, cv4l_fd &exp_fd)
 	cv4l_queue in(fd.g_type(), memory);
 	cv4l_queue out(v4l_type_invert(fd.g_type()), out_memory);
 	cv4l_queue exp_q(exp_fd.g_type(), V4L2_MEMORY_MMAP);
-	cv4l_fd *exp_fd_p = NULL;
-	FILE *file[2] = {NULL, NULL};
+	cv4l_fd *exp_fd_p = nullptr;
+	FILE *file[2] = {nullptr, nullptr};
 	cv4l_fmt fmt[2];
 
 	fd.g_fmt(fmt[OUT], out.g_type());
@@ -2629,7 +2629,7 @@ static void streaming_set_cap2out(cv4l_fd &fd, cv4l_fd &out_fd)
 	cv4l_queue out(out_type, out_memory);
 	fps_timestamps fps_ts[2];
 	unsigned count[2] = { 0, 0 };
-	FILE *file[2] = {NULL, NULL};
+	FILE *file[2] = {nullptr, nullptr};
 	fd_set fds;
 	unsigned cnt = 0;
 	cv4l_fmt fmt[2];
@@ -2737,7 +2737,7 @@ static void streaming_set_cap2out(cv4l_fd &fd, cv4l_fd &out_fd)
 		FD_SET(fd.g_fd(), &fds);
 
 		if (use_poll)
-			r = select(fd.g_fd() + 1, &fds, NULL, NULL, &tv);
+			r = select(fd.g_fd() + 1, &fds, nullptr, nullptr, &tv);
 
 		if (r == -1) {
 			if (EINTR == errno)
diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
index 8f6bb3d61..d0f391bba 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -8,7 +8,7 @@ struct mbus_name {
 static struct mbus_name mbus_names[] = {
 	{ "Fixed", MEDIA_BUS_FMT_FIXED },
 #include "media-bus-format-names.h"
-	{ NULL, 0 }
+	{ nullptr, 0 }
 };
 
 /* selection specified */
@@ -92,7 +92,7 @@ void subdev_cmd(int ch, char *optarg)
 	switch (ch) {
 	case OptListSubDevMBusCodes:
 		if (optarg)
-			list_mbus_codes_pad = strtoul(optarg, 0L, 0);
+			list_mbus_codes_pad = strtoul(optarg, nullptr, 0);
 		break;
 	case OptListSubDevFrameSizes:
 		subs = optarg;
@@ -100,15 +100,15 @@ void subdev_cmd(int ch, char *optarg)
 			static const char *const subopts[] = {
 				"pad",
 				"code",
-				NULL
+				nullptr
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				frmsize.pad = strtoul(value, 0L, 0);
+				frmsize.pad = strtoul(value, nullptr, 0);
 				break;
 			case 1:
-				frmsize.code = strtoul(value, 0L, 0);
+				frmsize.code = strtoul(value, nullptr, 0);
 				break;
 			default:
 				subdev_usage();
@@ -124,21 +124,21 @@ void subdev_cmd(int ch, char *optarg)
 				"code",
 				"width",
 				"height",
-				NULL
+				nullptr
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				frmival.pad = strtoul(value, 0L, 0);
+				frmival.pad = strtoul(value, nullptr, 0);
 				break;
 			case 1:
-				frmival.code = strtoul(value, 0L, 0);
+				frmival.code = strtoul(value, nullptr, 0);
 				break;
 			case 2:
-				frmival.width = strtoul(value, 0L, 0);
+				frmival.width = strtoul(value, nullptr, 0);
 				break;
 			case 3:
-				frmival.height = strtoul(value, 0L, 0);
+				frmival.height = strtoul(value, nullptr, 0);
 				break;
 			default:
 				subdev_usage();
@@ -148,7 +148,7 @@ void subdev_cmd(int ch, char *optarg)
 		break;
 	case OptGetSubDevFormat:
 		if (optarg)
-			get_fmt_pad = strtoul(optarg, 0L, 0);
+			get_fmt_pad = strtoul(optarg, nullptr, 0);
 		break;
 	case OptGetSubDevSelection:
 		subs = optarg;
@@ -156,13 +156,13 @@ void subdev_cmd(int ch, char *optarg)
 			static const char *const subopts[] = {
 				"pad",
 				"target",
-				NULL
+				nullptr
 			};
 			unsigned int target;
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				get_sel_pad = strtoul(value, 0L, 0);
+				get_sel_pad = strtoul(value, nullptr, 0);
 				break;
 			case 1:
 				if (parse_selection_target(value, target)) {
@@ -180,7 +180,7 @@ void subdev_cmd(int ch, char *optarg)
 		break;
 	case OptGetSubDevFPS:
 		if (optarg)
-			get_fps_pad = strtoul(optarg, 0L, 0);
+			get_fps_pad = strtoul(optarg, nullptr, 0);
 		break;
 	case OptSetSubDevFormat:
 	case OptTrySubDevFormat:
@@ -198,20 +198,20 @@ void subdev_cmd(int ch, char *optarg)
 				"quantization",
 				"xfer",
 				"pad",
-				NULL
+				nullptr
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				ffmt.width = strtoul(value, 0L, 0);
+				ffmt.width = strtoul(value, nullptr, 0);
 				set_fmt |= FmtWidth;
 				break;
 			case 1:
-				ffmt.height = strtoul(value, 0L, 0);
+				ffmt.height = strtoul(value, nullptr, 0);
 				set_fmt |= FmtHeight;
 				break;
 			case 2:
-				ffmt.code = strtoul(value, 0L, 0);
+				ffmt.code = strtoul(value, nullptr, 0);
 				set_fmt |= FmtPixelFormat;
 				break;
 			case 3:
@@ -242,7 +242,7 @@ void subdev_cmd(int ch, char *optarg)
 				set_fmt |= FmtXferFunc;
 				break;
 			case 9:
-				set_fmt_pad = strtoul(value, 0L, 0);
+				set_fmt_pad = strtoul(value, nullptr, 0);
 				break;
 			default:
 				fprintf(stderr, "Unknown option\n");
@@ -264,7 +264,7 @@ void subdev_cmd(int ch, char *optarg)
 				"width",
 				"height",
 				"pad",
-				NULL
+				nullptr
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
@@ -280,23 +280,23 @@ void subdev_cmd(int ch, char *optarg)
 				set_selection |= SelectionFlags;
 				break;
 			case 2:
-				vsel.r.left = strtol(value, 0L, 0);
+				vsel.r.left = strtol(value, nullptr, 0);
 				set_selection |= SelectionLeft;
 				break;
 			case 3:
-				vsel.r.top = strtol(value, 0L, 0);
+				vsel.r.top = strtol(value, nullptr, 0);
 				set_selection |= SelectionTop;
 				break;
 			case 4:
-				vsel.r.width = strtoul(value, 0L, 0);
+				vsel.r.width = strtoul(value, nullptr, 0);
 				set_selection |= SelectionWidth;
 				break;
 			case 5:
-				vsel.r.height = strtoul(value, 0L, 0);
+				vsel.r.height = strtoul(value, nullptr, 0);
 				set_selection |= SelectionHeight;
 				break;
 			case 6:
-				vsel.pad = strtoul(value, 0L, 0);
+				vsel.pad = strtoul(value, nullptr, 0);
 				break;
 			default:
 				fprintf(stderr, "Unknown option\n");
@@ -312,15 +312,15 @@ void subdev_cmd(int ch, char *optarg)
 			static const char *const subopts[] = {
 				"pad",
 				"fps",
-				NULL
+				nullptr
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				set_fps_pad = strtoul(value, 0L, 0);
+				set_fps_pad = strtoul(value, nullptr, 0);
 				break;
 			case 1:
-				set_fps = strtod(value, NULL);
+				set_fps = strtod(value, nullptr);
 				break;
 			default:
 				fprintf(stderr, "Unknown option\n");
diff --git a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
index f5a04d25e..7d6f6f3e7 100644
--- a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
@@ -163,24 +163,24 @@ static void parse_freq_seek(char *optarg, struct v4l2_hw_freq_seek &seek)
 			"spacing",
 			"low",
 			"high",
-			NULL
+			nullptr
 		};
 
 		switch (parse_subopt(&subs, subopts, &value)) {
 		case 0:
-			seek.seek_upward = strtol(value, 0L, 0);
+			seek.seek_upward = strtol(value, nullptr, 0);
 			break;
 		case 1:
-			seek.wrap_around = strtol(value, 0L, 0);
+			seek.wrap_around = strtol(value, nullptr, 0);
 			break;
 		case 2:
-			seek.spacing = strtol(value, 0L, 0);
+			seek.spacing = strtol(value, nullptr, 0);
 			break;
 		case 3:
-			low = strtod(value, NULL);
+			low = strtod(value, nullptr);
 			break;
 		case 4:
-			high = strtod(value, NULL);
+			high = strtod(value, nullptr);
 			break;
 		default:
 			tuner_usage();
@@ -193,7 +193,7 @@ void tuner_cmd(int ch, char *optarg)
 {
 	switch (ch) {
 	case OptSetFreq:
-		freq = strtod(optarg, NULL);
+		freq = strtod(optarg, nullptr);
 		break;
 	case OptSetTuner:
 		if (!strcmp(optarg, "stereo"))
@@ -213,7 +213,7 @@ void tuner_cmd(int ch, char *optarg)
 		}
 		break;
 	case OptSetModulator:
-		txsubchans = strtol(optarg, 0L, 0);
+		txsubchans = strtol(optarg, nullptr, 0);
 		if (!strcmp(optarg, "stereo"))
 			txsubchans = V4L2_TUNER_SUB_STEREO;
 		else if (!strcmp(optarg, "stereo-sap"))
@@ -238,7 +238,7 @@ void tuner_cmd(int ch, char *optarg)
 		parse_freq_seek(optarg, freq_seek);
 		break;
 	case OptTunerIndex:
-		tuner_index = strtoul(optarg, NULL, 0);
+		tuner_index = strtoul(optarg, nullptr, 0);
 		break;
 	}
 }
diff --git a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
index 358aba6a3..33191aa64 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
@@ -104,7 +104,7 @@ void vbi_cmd(int ch, char *optarg)
 					V4L2_SLICED_VPS;
 			else
 				vbi_usage();
-			if (subs == NULL)
+			if (subs == nullptr)
 				break;
 			optarg = subs + 1;
 		}
@@ -131,30 +131,30 @@ void vbi_cmd(int ch, char *optarg)
 				"start1",
 				"count0",
 				"count1",
-				NULL
+				nullptr
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				raw->fmt.vbi.sampling_rate = strtoul(value, NULL, 0);
+				raw->fmt.vbi.sampling_rate = strtoul(value, nullptr, 0);
 				break;
 			case 1:
-				raw->fmt.vbi.offset = strtoul(value, NULL, 0);
+				raw->fmt.vbi.offset = strtoul(value, nullptr, 0);
 				break;
 			case 2:
-				raw->fmt.vbi.samples_per_line = strtoul(value, NULL, 0);
+				raw->fmt.vbi.samples_per_line = strtoul(value, nullptr, 0);
 				break;
 			case 3:
-				raw->fmt.vbi.start[0] = strtoul(value, NULL, 0);
+				raw->fmt.vbi.start[0] = strtoul(value, nullptr, 0);
 				break;
 			case 4:
-				raw->fmt.vbi.start[1] = strtoul(value, NULL, 0);
+				raw->fmt.vbi.start[1] = strtoul(value, nullptr, 0);
 				break;
 			case 5:
-				raw->fmt.vbi.count[0] = strtoul(value, NULL, 0);
+				raw->fmt.vbi.count[0] = strtoul(value, nullptr, 0);
 				break;
 			case 6:
-				raw->fmt.vbi.count[1] = strtoul(value, NULL, 0);
+				raw->fmt.vbi.count[1] = strtoul(value, nullptr, 0);
 				break;
 			default:
 				vbi_usage();
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index 1169d6a71..c66c248a3 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -114,7 +114,7 @@ void vidcap_cmd(int ch, char *optarg)
 	case OptListFormats:
 	case OptListFormatsExt:
 		if (optarg)
-			mbus_code = strtoul(optarg, 0L, 0);
+			mbus_code = strtoul(optarg, nullptr, 0);
 		break;
 	case OptListFrameSizes:
 		be_pixfmt = strlen(optarg) == 7 && !memcmp(optarg + 4, "-BE", 3);
@@ -124,7 +124,7 @@ void vidcap_cmd(int ch, char *optarg)
 			if (be_pixfmt)
 				frmsize.pixel_format |= 1U << 31;
 		} else if (isdigit(optarg[0])) {
-			frmsize.pixel_format = strtol(optarg, 0L, 0);
+			frmsize.pixel_format = strtol(optarg, nullptr, 0);
 		} else {
 			fprintf(stderr, "The pixelformat '%s' is invalid\n", optarg);
 			std::exit(EXIT_FAILURE);
@@ -137,15 +137,15 @@ void vidcap_cmd(int ch, char *optarg)
 				"width",
 				"height",
 				"pixelformat",
-				NULL
+				nullptr
 			};
 
 			switch (parse_subopt(&subs, subopts, &value)) {
 			case 0:
-				frmival.width = strtol(value, 0L, 0);
+				frmival.width = strtol(value, nullptr, 0);
 				break;
 			case 1:
-				frmival.height = strtol(value, 0L, 0);
+				frmival.height = strtol(value, nullptr, 0);
 				break;
 			case 2:
 				be_pixfmt = strlen(value) == 7 && !memcmp(value + 4, "-BE", 3);
@@ -156,7 +156,7 @@ void vidcap_cmd(int ch, char *optarg)
 					if (be_pixfmt)
 						frmival.pixel_format |= 1U << 31;
 				} else if (isdigit(optarg[0])) {
-					frmival.pixel_format = strtol(value, 0L, 0);
+					frmival.pixel_format = strtol(value, nullptr, 0);
 				} else {
 					fprintf(stderr, "The pixelformat '%s' is invalid\n", optarg);
 					std::exit(EXIT_FAILURE);
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
index 4b3d910a0..15bedc442 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
@@ -94,7 +94,7 @@ void vidout_cmd(int ch, char *optarg)
 	case OptListOutFormats:
 	case OptListOutFormatsExt:
 		if (optarg)
-			mbus_code_out = strtoul(optarg, 0L, 0);
+			mbus_code_out = strtoul(optarg, nullptr, 0);
 		break;
 	}
 }
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 3b30bea9d..951b70d8d 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -50,224 +50,224 @@ __u32 vidcap_buftype;
 __u32 vidout_buftype;
 
 static struct option long_options[] = {
-	{"list-audio-inputs", no_argument, 0, OptListAudioInputs},
-	{"list-audio-outputs", no_argument, 0, OptListAudioOutputs},
-	{"all", no_argument, 0, OptAll},
-	{"device", required_argument, 0, OptSetDevice},
-	{"out-device", required_argument, 0, OptSetOutDevice},
-	{"export-device", required_argument, 0, OptSetExportDevice},
-	{"media-bus-info", required_argument, 0, OptMediaBusInfo},
-	{"get-fmt-video", no_argument, 0, OptGetVideoFormat},
-	{"set-fmt-video", required_argument, 0, OptSetVideoFormat},
-	{"try-fmt-video", required_argument, 0, OptTryVideoFormat},
-	{"get-fmt-video-out", no_argument, 0, OptGetVideoOutFormat},
-	{"set-fmt-video-out", required_argument, 0, OptSetVideoOutFormat},
-	{"try-fmt-video-out", required_argument, 0, OptTryVideoOutFormat},
-	{"help", no_argument, 0, OptHelp},
-	{"help-tuner", no_argument, 0, OptHelpTuner},
-	{"help-io", no_argument, 0, OptHelpIO},
-	{"help-stds", no_argument, 0, OptHelpStds},
-	{"help-vidcap", no_argument, 0, OptHelpVidCap},
-	{"help-vidout", no_argument, 0, OptHelpVidOut},
-	{"help-overlay", no_argument, 0, OptHelpOverlay},
-	{"help-vbi", no_argument, 0, OptHelpVbi},
-	{"help-sdr", no_argument, 0, OptHelpSdr},
-	{"help-meta", no_argument, 0, OptHelpMeta},
-	{"help-subdev", no_argument, 0, OptHelpSubDev},
-	{"help-selection", no_argument, 0, OptHelpSelection},
-	{"help-misc", no_argument, 0, OptHelpMisc},
-	{"help-streaming", no_argument, 0, OptHelpStreaming},
-	{"help-edid", no_argument, 0, OptHelpEdid},
-	{"help-all", no_argument, 0, OptHelpAll},
+	{"list-audio-inputs", no_argument, nullptr, OptListAudioInputs},
+	{"list-audio-outputs", no_argument, nullptr, OptListAudioOutputs},
+	{"all", no_argument, nullptr, OptAll},
+	{"device", required_argument, nullptr, OptSetDevice},
+	{"out-device", required_argument, nullptr, OptSetOutDevice},
+	{"export-device", required_argument, nullptr, OptSetExportDevice},
+	{"media-bus-info", required_argument, nullptr, OptMediaBusInfo},
+	{"get-fmt-video", no_argument, nullptr, OptGetVideoFormat},
+	{"set-fmt-video", required_argument, nullptr, OptSetVideoFormat},
+	{"try-fmt-video", required_argument, nullptr, OptTryVideoFormat},
+	{"get-fmt-video-out", no_argument, nullptr, OptGetVideoOutFormat},
+	{"set-fmt-video-out", required_argument, nullptr, OptSetVideoOutFormat},
+	{"try-fmt-video-out", required_argument, nullptr, OptTryVideoOutFormat},
+	{"help", no_argument, nullptr, OptHelp},
+	{"help-tuner", no_argument, nullptr, OptHelpTuner},
+	{"help-io", no_argument, nullptr, OptHelpIO},
+	{"help-stds", no_argument, nullptr, OptHelpStds},
+	{"help-vidcap", no_argument, nullptr, OptHelpVidCap},
+	{"help-vidout", no_argument, nullptr, OptHelpVidOut},
+	{"help-overlay", no_argument, nullptr, OptHelpOverlay},
+	{"help-vbi", no_argument, nullptr, OptHelpVbi},
+	{"help-sdr", no_argument, nullptr, OptHelpSdr},
+	{"help-meta", no_argument, nullptr, OptHelpMeta},
+	{"help-subdev", no_argument, nullptr, OptHelpSubDev},
+	{"help-selection", no_argument, nullptr, OptHelpSelection},
+	{"help-misc", no_argument, nullptr, OptHelpMisc},
+	{"help-streaming", no_argument, nullptr, OptHelpStreaming},
+	{"help-edid", no_argument, nullptr, OptHelpEdid},
+	{"help-all", no_argument, nullptr, OptHelpAll},
 #ifndef NO_LIBV4L2
-	{"wrapper", no_argument, 0, OptUseWrapper},
+	{"wrapper", no_argument, nullptr, OptUseWrapper},
 #endif
-	{"concise", no_argument, 0, OptConcise},
-	{"get-output", no_argument, 0, OptGetOutput},
-	{"set-output", required_argument, 0, OptSetOutput},
-	{"list-outputs", no_argument, 0, OptListOutputs},
-	{"list-inputs", no_argument, 0, OptListInputs},
-	{"get-input", no_argument, 0, OptGetInput},
-	{"set-input", required_argument, 0, OptSetInput},
-	{"get-audio-input", no_argument, 0, OptGetAudioInput},
-	{"set-audio-input", required_argument, 0, OptSetAudioInput},
-	{"get-audio-output", no_argument, 0, OptGetAudioOutput},
-	{"set-audio-output", required_argument, 0, OptSetAudioOutput},
-	{"get-freq", no_argument, 0, OptGetFreq},
-	{"set-freq", required_argument, 0, OptSetFreq},
-	{"list-standards", no_argument, 0, OptListStandards},
-	{"list-formats", optional_argument, 0, OptListFormats},
-	{"list-formats-ext", optional_argument, 0, OptListFormatsExt},
-	{"list-fields", no_argument, 0, OptListFields},
-	{"list-framesizes", required_argument, 0, OptListFrameSizes},
-	{"list-frameintervals", required_argument, 0, OptListFrameIntervals},
-	{"list-formats-overlay", no_argument, 0, OptListOverlayFormats},
-	{"list-formats-sdr", no_argument, 0, OptListSdrFormats},
-	{"list-formats-sdr-out", no_argument, 0, OptListSdrOutFormats},
-	{"list-formats-out", optional_argument, 0, OptListOutFormats},
-	{"list-formats-out-ext", optional_argument, 0, OptListOutFormatsExt},
-	{"list-formats-meta", optional_argument, 0, OptListMetaFormats},
-	{"list-formats-meta-out", optional_argument, 0, OptListMetaOutFormats},
-	{"list-subdev-mbus-codes", optional_argument, 0, OptListSubDevMBusCodes},
-	{"list-subdev-framesizes", required_argument, 0, OptListSubDevFrameSizes},
-	{"list-subdev-frameintervals", required_argument, 0, OptListSubDevFrameIntervals},
-	{"list-fields-out", no_argument, 0, OptListOutFields},
-	{"clear-clips", no_argument, 0, OptClearClips},
-	{"clear-bitmap", no_argument, 0, OptClearBitmap},
-	{"add-clip", required_argument, 0, OptAddClip},
-	{"add-bitmap", required_argument, 0, OptAddBitmap},
-	{"find-fb", no_argument, 0, OptFindFb},
-	{"subset", required_argument, 0, OptSubset},
-	{"get-standard", no_argument, 0, OptGetStandard},
-	{"set-standard", required_argument, 0, OptSetStandard},
-	{"get-detected-standard", no_argument, 0, OptQueryStandard},
-	{"get-parm", no_argument, 0, OptGetParm},
-	{"set-parm", required_argument, 0, OptSetParm},
-	{"get-output-parm", no_argument, 0, OptGetOutputParm},
-	{"set-output-parm", required_argument, 0, OptSetOutputParm},
-	{"info", no_argument, 0, OptGetDriverInfo},
-	{"list-ctrls", no_argument, 0, OptListCtrls},
-	{"list-ctrls-menus", no_argument, 0, OptListCtrlsMenus},
-	{"set-ctrl", required_argument, 0, OptSetCtrl},
-	{"get-ctrl", required_argument, 0, OptGetCtrl},
-	{"get-tuner", no_argument, 0, OptGetTuner},
-	{"set-tuner", required_argument, 0, OptSetTuner},
-	{"list-freq-bands", no_argument, 0, OptListFreqBands},
-	{"silent", no_argument, 0, OptSilent},
-	{"verbose", no_argument, 0, OptVerbose},
-	{"log-status", no_argument, 0, OptLogStatus},
-	{"get-fmt-overlay", no_argument, 0, OptGetOverlayFormat},
-	{"set-fmt-overlay", optional_argument, 0, OptSetOverlayFormat},
-	{"try-fmt-overlay", optional_argument, 0, OptTryOverlayFormat},
-	{"get-fmt-sliced-vbi", no_argument, 0, OptGetSlicedVbiFormat},
-	{"set-fmt-sliced-vbi", required_argument, 0, OptSetSlicedVbiFormat},
-	{"try-fmt-sliced-vbi", required_argument, 0, OptTrySlicedVbiFormat},
-	{"get-fmt-sliced-vbi-out", no_argument, 0, OptGetSlicedVbiOutFormat},
-	{"set-fmt-sliced-vbi-out", required_argument, 0, OptSetSlicedVbiOutFormat},
-	{"try-fmt-sliced-vbi-out", required_argument, 0, OptTrySlicedVbiOutFormat},
-	{"get-fmt-vbi", no_argument, 0, OptGetVbiFormat},
-	{"set-fmt-vbi", required_argument, 0, OptSetVbiFormat},
-	{"try-fmt-vbi", required_argument, 0, OptTryVbiFormat},
-	{"get-fmt-vbi-out", no_argument, 0, OptGetVbiOutFormat},
-	{"set-fmt-vbi-out", required_argument, 0, OptSetVbiOutFormat},
-	{"try-fmt-vbi-out", required_argument, 0, OptTryVbiOutFormat},
-	{"get-fmt-sdr", no_argument, 0, OptGetSdrFormat},
-	{"set-fmt-sdr", required_argument, 0, OptSetSdrFormat},
-	{"try-fmt-sdr", required_argument, 0, OptTrySdrFormat},
-	{"get-fmt-sdr-out", no_argument, 0, OptGetSdrOutFormat},
-	{"set-fmt-sdr-out", required_argument, 0, OptSetSdrOutFormat},
-	{"try-fmt-sdr-out", required_argument, 0, OptTrySdrOutFormat},
-	{"get-fmt-meta", no_argument, 0, OptGetMetaFormat},
-	{"set-fmt-meta", required_argument, 0, OptSetMetaFormat},
-	{"try-fmt-meta", required_argument, 0, OptTryMetaFormat},
-	{"get-fmt-meta-out", no_argument, 0, OptGetMetaOutFormat},
-	{"set-fmt-meta-out", required_argument, 0, OptSetMetaOutFormat},
-	{"try-fmt-meta-out", required_argument, 0, OptTryMetaOutFormat},
-	{"get-subdev-fmt", optional_argument, 0, OptGetSubDevFormat},
-	{"set-subdev-fmt", required_argument, 0, OptSetSubDevFormat},
-	{"try-subdev-fmt", required_argument, 0, OptTrySubDevFormat},
-	{"get-sliced-vbi-cap", no_argument, 0, OptGetSlicedVbiCap},
-	{"get-sliced-vbi-out-cap", no_argument, 0, OptGetSlicedVbiOutCap},
-	{"get-fbuf", no_argument, 0, OptGetFBuf},
-	{"set-fbuf", required_argument, 0, OptSetFBuf},
-	{"get-cropcap", no_argument, 0, OptGetCropCap},
-	{"get-crop", no_argument, 0, OptGetCrop},
-	{"set-crop", required_argument, 0, OptSetCrop},
-	{"get-cropcap-output", no_argument, 0, OptGetOutputCropCap},
-	{"get-crop-output", no_argument, 0, OptGetOutputCrop},
-	{"set-crop-output", required_argument, 0, OptSetOutputCrop},
-	{"get-cropcap-overlay", no_argument, 0, OptGetOverlayCropCap},
-	{"get-crop-overlay", no_argument, 0, OptGetOverlayCrop},
-	{"set-crop-overlay", required_argument, 0, OptSetOverlayCrop},
-	{"get-cropcap-output-overlay", no_argument, 0, OptGetOutputOverlayCropCap},
-	{"get-crop-output-overlay", no_argument, 0, OptGetOutputOverlayCrop},
-	{"set-crop-output-overlay", required_argument, 0, OptSetOutputOverlayCrop},
-	{"get-selection", required_argument, 0, OptGetSelection},
-	{"set-selection", required_argument, 0, OptSetSelection},
-	{"get-selection-output", required_argument, 0, OptGetOutputSelection},
-	{"set-selection-output", required_argument, 0, OptSetOutputSelection},
-	{"get-subdev-selection", required_argument, 0, OptGetSubDevSelection},
-	{"set-subdev-selection", required_argument, 0, OptSetSubDevSelection},
-	{"try-subdev-selection", required_argument, 0, OptTrySubDevSelection},
-	{"get-subdev-fps", optional_argument, 0, OptGetSubDevFPS},
-	{"set-subdev-fps", required_argument, 0, OptSetSubDevFPS},
-	{"get-jpeg-comp", no_argument, 0, OptGetJpegComp},
-	{"set-jpeg-comp", required_argument, 0, OptSetJpegComp},
-	{"get-modulator", no_argument, 0, OptGetModulator},
-	{"set-modulator", required_argument, 0, OptSetModulator},
-	{"get-priority", no_argument, 0, OptGetPriority},
-	{"set-priority", required_argument, 0, OptSetPriority},
-	{"wait-for-event", required_argument, 0, OptWaitForEvent},
-	{"poll-for-event", required_argument, 0, OptPollForEvent},
-	{"epoll-for-event", required_argument, 0, OptEPollForEvent},
-	{"overlay", required_argument, 0, OptOverlay},
-	{"sleep", required_argument, 0, OptSleep},
-	{"list-devices", no_argument, 0, OptListDevices},
-	{"list-dv-timings", optional_argument, 0, OptListDvTimings},
-	{"query-dv-timings", no_argument, 0, OptQueryDvTimings},
-	{"get-dv-timings", no_argument, 0, OptGetDvTimings},
-	{"set-dv-bt-timings", required_argument, 0, OptSetDvBtTimings},
-	{"get-dv-timings-cap", optional_argument, 0, OptGetDvTimingsCap},
-	{"freq-seek", required_argument, 0, OptFreqSeek},
-	{"encoder-cmd", required_argument, 0, OptEncoderCmd},
-	{"try-encoder-cmd", required_argument, 0, OptTryEncoderCmd},
-	{"decoder-cmd", required_argument, 0, OptDecoderCmd},
-	{"try-decoder-cmd", required_argument, 0, OptTryDecoderCmd},
-	{"set-edid", required_argument, 0, OptSetEdid},
-	{"clear-edid", optional_argument, 0, OptClearEdid},
-	{"get-edid", optional_argument, 0, OptGetEdid},
-	{"info-edid", optional_argument, 0, OptInfoEdid},
-	{"fix-edid-checksums", no_argument, 0, OptFixEdidChecksums},
-	{"tuner-index", required_argument, 0, OptTunerIndex},
-	{"list-buffers", no_argument, 0, OptListBuffers},
-	{"list-buffers-out", no_argument, 0, OptListBuffersOut},
-	{"list-buffers-vbi", no_argument, 0, OptListBuffersVbi},
-	{"list-buffers-sliced-vbi", no_argument, 0, OptListBuffersSlicedVbi},
-	{"list-buffers-vbi-out", no_argument, 0, OptListBuffersVbiOut},
-	{"list-buffers-sliced-vbi-out", no_argument, 0, OptListBuffersSlicedVbiOut},
-	{"list-buffers-sdr", no_argument, 0, OptListBuffersSdr},
-	{"list-buffers-sdr-out", no_argument, 0, OptListBuffersSdrOut},
-	{"list-buffers-meta", no_argument, 0, OptListBuffersMeta},
-	{"list-buffers-meta-out", no_argument, 0, OptListBuffersMetaOut},
-	{"stream-count", required_argument, 0, OptStreamCount},
-	{"stream-skip", required_argument, 0, OptStreamSkip},
-	{"stream-loop", no_argument, 0, OptStreamLoop},
-	{"stream-sleep", required_argument, 0, OptStreamSleep},
-	{"stream-poll", no_argument, 0, OptStreamPoll},
-	{"stream-no-query", no_argument, 0, OptStreamNoQuery},
+	{"concise", no_argument, nullptr, OptConcise},
+	{"get-output", no_argument, nullptr, OptGetOutput},
+	{"set-output", required_argument, nullptr, OptSetOutput},
+	{"list-outputs", no_argument, nullptr, OptListOutputs},
+	{"list-inputs", no_argument, nullptr, OptListInputs},
+	{"get-input", no_argument, nullptr, OptGetInput},
+	{"set-input", required_argument, nullptr, OptSetInput},
+	{"get-audio-input", no_argument, nullptr, OptGetAudioInput},
+	{"set-audio-input", required_argument, nullptr, OptSetAudioInput},
+	{"get-audio-output", no_argument, nullptr, OptGetAudioOutput},
+	{"set-audio-output", required_argument, nullptr, OptSetAudioOutput},
+	{"get-freq", no_argument, nullptr, OptGetFreq},
+	{"set-freq", required_argument, nullptr, OptSetFreq},
+	{"list-standards", no_argument, nullptr, OptListStandards},
+	{"list-formats", optional_argument, nullptr, OptListFormats},
+	{"list-formats-ext", optional_argument, nullptr, OptListFormatsExt},
+	{"list-fields", no_argument, nullptr, OptListFields},
+	{"list-framesizes", required_argument, nullptr, OptListFrameSizes},
+	{"list-frameintervals", required_argument, nullptr, OptListFrameIntervals},
+	{"list-formats-overlay", no_argument, nullptr, OptListOverlayFormats},
+	{"list-formats-sdr", no_argument, nullptr, OptListSdrFormats},
+	{"list-formats-sdr-out", no_argument, nullptr, OptListSdrOutFormats},
+	{"list-formats-out", optional_argument, nullptr, OptListOutFormats},
+	{"list-formats-out-ext", optional_argument, nullptr, OptListOutFormatsExt},
+	{"list-formats-meta", optional_argument, nullptr, OptListMetaFormats},
+	{"list-formats-meta-out", optional_argument, nullptr, OptListMetaOutFormats},
+	{"list-subdev-mbus-codes", optional_argument, nullptr, OptListSubDevMBusCodes},
+	{"list-subdev-framesizes", required_argument, nullptr, OptListSubDevFrameSizes},
+	{"list-subdev-frameintervals", required_argument, nullptr, OptListSubDevFrameIntervals},
+	{"list-fields-out", no_argument, nullptr, OptListOutFields},
+	{"clear-clips", no_argument, nullptr, OptClearClips},
+	{"clear-bitmap", no_argument, nullptr, OptClearBitmap},
+	{"add-clip", required_argument, nullptr, OptAddClip},
+	{"add-bitmap", required_argument, nullptr, OptAddBitmap},
+	{"find-fb", no_argument, nullptr, OptFindFb},
+	{"subset", required_argument, nullptr, OptSubset},
+	{"get-standard", no_argument, nullptr, OptGetStandard},
+	{"set-standard", required_argument, nullptr, OptSetStandard},
+	{"get-detected-standard", no_argument, nullptr, OptQueryStandard},
+	{"get-parm", no_argument, nullptr, OptGetParm},
+	{"set-parm", required_argument, nullptr, OptSetParm},
+	{"get-output-parm", no_argument, nullptr, OptGetOutputParm},
+	{"set-output-parm", required_argument, nullptr, OptSetOutputParm},
+	{"info", no_argument, nullptr, OptGetDriverInfo},
+	{"list-ctrls", no_argument, nullptr, OptListCtrls},
+	{"list-ctrls-menus", no_argument, nullptr, OptListCtrlsMenus},
+	{"set-ctrl", required_argument, nullptr, OptSetCtrl},
+	{"get-ctrl", required_argument, nullptr, OptGetCtrl},
+	{"get-tuner", no_argument, nullptr, OptGetTuner},
+	{"set-tuner", required_argument, nullptr, OptSetTuner},
+	{"list-freq-bands", no_argument, nullptr, OptListFreqBands},
+	{"silent", no_argument, nullptr, OptSilent},
+	{"verbose", no_argument, nullptr, OptVerbose},
+	{"log-status", no_argument, nullptr, OptLogStatus},
+	{"get-fmt-overlay", no_argument, nullptr, OptGetOverlayFormat},
+	{"set-fmt-overlay", optional_argument, nullptr, OptSetOverlayFormat},
+	{"try-fmt-overlay", optional_argument, nullptr, OptTryOverlayFormat},
+	{"get-fmt-sliced-vbi", no_argument, nullptr, OptGetSlicedVbiFormat},
+	{"set-fmt-sliced-vbi", required_argument, nullptr, OptSetSlicedVbiFormat},
+	{"try-fmt-sliced-vbi", required_argument, nullptr, OptTrySlicedVbiFormat},
+	{"get-fmt-sliced-vbi-out", no_argument, nullptr, OptGetSlicedVbiOutFormat},
+	{"set-fmt-sliced-vbi-out", required_argument, nullptr, OptSetSlicedVbiOutFormat},
+	{"try-fmt-sliced-vbi-out", required_argument, nullptr, OptTrySlicedVbiOutFormat},
+	{"get-fmt-vbi", no_argument, nullptr, OptGetVbiFormat},
+	{"set-fmt-vbi", required_argument, nullptr, OptSetVbiFormat},
+	{"try-fmt-vbi", required_argument, nullptr, OptTryVbiFormat},
+	{"get-fmt-vbi-out", no_argument, nullptr, OptGetVbiOutFormat},
+	{"set-fmt-vbi-out", required_argument, nullptr, OptSetVbiOutFormat},
+	{"try-fmt-vbi-out", required_argument, nullptr, OptTryVbiOutFormat},
+	{"get-fmt-sdr", no_argument, nullptr, OptGetSdrFormat},
+	{"set-fmt-sdr", required_argument, nullptr, OptSetSdrFormat},
+	{"try-fmt-sdr", required_argument, nullptr, OptTrySdrFormat},
+	{"get-fmt-sdr-out", no_argument, nullptr, OptGetSdrOutFormat},
+	{"set-fmt-sdr-out", required_argument, nullptr, OptSetSdrOutFormat},
+	{"try-fmt-sdr-out", required_argument, nullptr, OptTrySdrOutFormat},
+	{"get-fmt-meta", no_argument, nullptr, OptGetMetaFormat},
+	{"set-fmt-meta", required_argument, nullptr, OptSetMetaFormat},
+	{"try-fmt-meta", required_argument, nullptr, OptTryMetaFormat},
+	{"get-fmt-meta-out", no_argument, nullptr, OptGetMetaOutFormat},
+	{"set-fmt-meta-out", required_argument, nullptr, OptSetMetaOutFormat},
+	{"try-fmt-meta-out", required_argument, nullptr, OptTryMetaOutFormat},
+	{"get-subdev-fmt", optional_argument, nullptr, OptGetSubDevFormat},
+	{"set-subdev-fmt", required_argument, nullptr, OptSetSubDevFormat},
+	{"try-subdev-fmt", required_argument, nullptr, OptTrySubDevFormat},
+	{"get-sliced-vbi-cap", no_argument, nullptr, OptGetSlicedVbiCap},
+	{"get-sliced-vbi-out-cap", no_argument, nullptr, OptGetSlicedVbiOutCap},
+	{"get-fbuf", no_argument, nullptr, OptGetFBuf},
+	{"set-fbuf", required_argument, nullptr, OptSetFBuf},
+	{"get-cropcap", no_argument, nullptr, OptGetCropCap},
+	{"get-crop", no_argument, nullptr, OptGetCrop},
+	{"set-crop", required_argument, nullptr, OptSetCrop},
+	{"get-cropcap-output", no_argument, nullptr, OptGetOutputCropCap},
+	{"get-crop-output", no_argument, nullptr, OptGetOutputCrop},
+	{"set-crop-output", required_argument, nullptr, OptSetOutputCrop},
+	{"get-cropcap-overlay", no_argument, nullptr, OptGetOverlayCropCap},
+	{"get-crop-overlay", no_argument, nullptr, OptGetOverlayCrop},
+	{"set-crop-overlay", required_argument, nullptr, OptSetOverlayCrop},
+	{"get-cropcap-output-overlay", no_argument, nullptr, OptGetOutputOverlayCropCap},
+	{"get-crop-output-overlay", no_argument, nullptr, OptGetOutputOverlayCrop},
+	{"set-crop-output-overlay", required_argument, nullptr, OptSetOutputOverlayCrop},
+	{"get-selection", required_argument, nullptr, OptGetSelection},
+	{"set-selection", required_argument, nullptr, OptSetSelection},
+	{"get-selection-output", required_argument, nullptr, OptGetOutputSelection},
+	{"set-selection-output", required_argument, nullptr, OptSetOutputSelection},
+	{"get-subdev-selection", required_argument, nullptr, OptGetSubDevSelection},
+	{"set-subdev-selection", required_argument, nullptr, OptSetSubDevSelection},
+	{"try-subdev-selection", required_argument, nullptr, OptTrySubDevSelection},
+	{"get-subdev-fps", optional_argument, nullptr, OptGetSubDevFPS},
+	{"set-subdev-fps", required_argument, nullptr, OptSetSubDevFPS},
+	{"get-jpeg-comp", no_argument, nullptr, OptGetJpegComp},
+	{"set-jpeg-comp", required_argument, nullptr, OptSetJpegComp},
+	{"get-modulator", no_argument, nullptr, OptGetModulator},
+	{"set-modulator", required_argument, nullptr, OptSetModulator},
+	{"get-priority", no_argument, nullptr, OptGetPriority},
+	{"set-priority", required_argument, nullptr, OptSetPriority},
+	{"wait-for-event", required_argument, nullptr, OptWaitForEvent},
+	{"poll-for-event", required_argument, nullptr, OptPollForEvent},
+	{"epoll-for-event", required_argument, nullptr, OptEPollForEvent},
+	{"overlay", required_argument, nullptr, OptOverlay},
+	{"sleep", required_argument, nullptr, OptSleep},
+	{"list-devices", no_argument, nullptr, OptListDevices},
+	{"list-dv-timings", optional_argument, nullptr, OptListDvTimings},
+	{"query-dv-timings", no_argument, nullptr, OptQueryDvTimings},
+	{"get-dv-timings", no_argument, nullptr, OptGetDvTimings},
+	{"set-dv-bt-timings", required_argument, nullptr, OptSetDvBtTimings},
+	{"get-dv-timings-cap", optional_argument, nullptr, OptGetDvTimingsCap},
+	{"freq-seek", required_argument, nullptr, OptFreqSeek},
+	{"encoder-cmd", required_argument, nullptr, OptEncoderCmd},
+	{"try-encoder-cmd", required_argument, nullptr, OptTryEncoderCmd},
+	{"decoder-cmd", required_argument, nullptr, OptDecoderCmd},
+	{"try-decoder-cmd", required_argument, nullptr, OptTryDecoderCmd},
+	{"set-edid", required_argument, nullptr, OptSetEdid},
+	{"clear-edid", optional_argument, nullptr, OptClearEdid},
+	{"get-edid", optional_argument, nullptr, OptGetEdid},
+	{"info-edid", optional_argument, nullptr, OptInfoEdid},
+	{"fix-edid-checksums", no_argument, nullptr, OptFixEdidChecksums},
+	{"tuner-index", required_argument, nullptr, OptTunerIndex},
+	{"list-buffers", no_argument, nullptr, OptListBuffers},
+	{"list-buffers-out", no_argument, nullptr, OptListBuffersOut},
+	{"list-buffers-vbi", no_argument, nullptr, OptListBuffersVbi},
+	{"list-buffers-sliced-vbi", no_argument, nullptr, OptListBuffersSlicedVbi},
+	{"list-buffers-vbi-out", no_argument, nullptr, OptListBuffersVbiOut},
+	{"list-buffers-sliced-vbi-out", no_argument, nullptr, OptListBuffersSlicedVbiOut},
+	{"list-buffers-sdr", no_argument, nullptr, OptListBuffersSdr},
+	{"list-buffers-sdr-out", no_argument, nullptr, OptListBuffersSdrOut},
+	{"list-buffers-meta", no_argument, nullptr, OptListBuffersMeta},
+	{"list-buffers-meta-out", no_argument, nullptr, OptListBuffersMetaOut},
+	{"stream-count", required_argument, nullptr, OptStreamCount},
+	{"stream-skip", required_argument, nullptr, OptStreamSkip},
+	{"stream-loop", no_argument, nullptr, OptStreamLoop},
+	{"stream-sleep", required_argument, nullptr, OptStreamSleep},
+	{"stream-poll", no_argument, nullptr, OptStreamPoll},
+	{"stream-no-query", no_argument, nullptr, OptStreamNoQuery},
 #ifndef NO_STREAM_TO
-	{"stream-to", required_argument, 0, OptStreamTo},
-	{"stream-to-hdr", required_argument, 0, OptStreamToHdr},
-	{"stream-lossless", no_argument, 0, OptStreamLossless},
-	{"stream-to-host", required_argument, 0, OptStreamToHost},
+	{"stream-to", required_argument, nullptr, OptStreamTo},
+	{"stream-to-hdr", required_argument, nullptr, OptStreamToHdr},
+	{"stream-lossless", no_argument, nullptr, OptStreamLossless},
+	{"stream-to-host", required_argument, nullptr, OptStreamToHost},
 #endif
-	{"stream-buf-caps", no_argument, 0, OptStreamBufCaps},
-	{"stream-mmap", optional_argument, 0, OptStreamMmap},
-	{"stream-user", optional_argument, 0, OptStreamUser},
-	{"stream-dmabuf", no_argument, 0, OptStreamDmaBuf},
-	{"stream-from", required_argument, 0, OptStreamFrom},
-	{"stream-from-hdr", required_argument, 0, OptStreamFromHdr},
-	{"stream-from-host", required_argument, 0, OptStreamFromHost},
-	{"stream-out-pattern", required_argument, 0, OptStreamOutPattern},
-	{"stream-out-square", no_argument, 0, OptStreamOutSquare},
-	{"stream-out-border", no_argument, 0, OptStreamOutBorder},
-	{"stream-out-sav", no_argument, 0, OptStreamOutInsertSAV},
-	{"stream-out-eav", no_argument, 0, OptStreamOutInsertEAV},
-	{"stream-out-pixel-aspect", required_argument, 0, OptStreamOutPixelAspect},
-	{"stream-out-video-aspect", required_argument, 0, OptStreamOutVideoAspect},
-	{"stream-out-alpha", required_argument, 0, OptStreamOutAlphaComponent},
-	{"stream-out-alpha-red-only", no_argument, 0, OptStreamOutAlphaRedOnly},
-	{"stream-out-rgb-lim-range", required_argument, 0, OptStreamOutRGBLimitedRange},
-	{"stream-out-hor-speed", required_argument, 0, OptStreamOutHorSpeed},
-	{"stream-out-vert-speed", required_argument, 0, OptStreamOutVertSpeed},
-	{"stream-out-perc-fill", required_argument, 0, OptStreamOutPercFill},
-	{"stream-out-buf-caps", no_argument, 0, OptStreamOutBufCaps},
-	{"stream-out-mmap", optional_argument, 0, OptStreamOutMmap},
-	{"stream-out-user", optional_argument, 0, OptStreamOutUser},
-	{"stream-out-dmabuf", no_argument, 0, OptStreamOutDmaBuf},
-	{"list-patterns", no_argument, 0, OptListPatterns},
-	{"version", no_argument, 0, OptVersion},
-	{0, 0, 0, 0}
+	{"stream-buf-caps", no_argument, nullptr, OptStreamBufCaps},
+	{"stream-mmap", optional_argument, nullptr, OptStreamMmap},
+	{"stream-user", optional_argument, nullptr, OptStreamUser},
+	{"stream-dmabuf", no_argument, nullptr, OptStreamDmaBuf},
+	{"stream-from", required_argument, nullptr, OptStreamFrom},
+	{"stream-from-hdr", required_argument, nullptr, OptStreamFromHdr},
+	{"stream-from-host", required_argument, nullptr, OptStreamFromHost},
+	{"stream-out-pattern", required_argument, nullptr, OptStreamOutPattern},
+	{"stream-out-square", no_argument, nullptr, OptStreamOutSquare},
+	{"stream-out-border", no_argument, nullptr, OptStreamOutBorder},
+	{"stream-out-sav", no_argument, nullptr, OptStreamOutInsertSAV},
+	{"stream-out-eav", no_argument, nullptr, OptStreamOutInsertEAV},
+	{"stream-out-pixel-aspect", required_argument, nullptr, OptStreamOutPixelAspect},
+	{"stream-out-video-aspect", required_argument, nullptr, OptStreamOutVideoAspect},
+	{"stream-out-alpha", required_argument, nullptr, OptStreamOutAlphaComponent},
+	{"stream-out-alpha-red-only", no_argument, nullptr, OptStreamOutAlphaRedOnly},
+	{"stream-out-rgb-lim-range", required_argument, nullptr, OptStreamOutRGBLimitedRange},
+	{"stream-out-hor-speed", required_argument, nullptr, OptStreamOutHorSpeed},
+	{"stream-out-vert-speed", required_argument, nullptr, OptStreamOutVertSpeed},
+	{"stream-out-perc-fill", required_argument, nullptr, OptStreamOutPercFill},
+	{"stream-out-buf-caps", no_argument, nullptr, OptStreamOutBufCaps},
+	{"stream-out-mmap", optional_argument, nullptr, OptStreamOutMmap},
+	{"stream-out-user", optional_argument, nullptr, OptStreamOutUser},
+	{"stream-out-dmabuf", no_argument, nullptr, OptStreamOutDmaBuf},
+	{"list-patterns", no_argument, nullptr, OptListPatterns},
+	{"version", no_argument, nullptr, OptVersion},
+	{nullptr, 0, nullptr, 0}
 };
 
 static void usage_all()
@@ -667,7 +667,7 @@ int parse_subopt(char **subs, const char * const *subopts, char **value)
 		fprintf(stderr, "Invalid suboptions specified\n");
 		return -1;
 	}
-	if (*value == NULL) {
+	if (*value == nullptr) {
 		fprintf(stderr, "No value given to suboption <%s>\n",
 				subopts[opt]);
 		return -1;
@@ -775,16 +775,16 @@ int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
 			"quantization",
 			"xfer",
 			"sizeimage",
-			NULL
+			nullptr
 		};
 
 		switch (parse_subopt(&subs, subopts, &value)) {
 		case 0:
-			width = strtoul(value, 0L, 0);
+			width = strtoul(value, nullptr, 0);
 			fmts |= FmtWidth;
 			break;
 		case 1:
-			height = strtoul(value, 0L, 0);
+			height = strtoul(value, nullptr, 0);
 			fmts |= FmtHeight;
 			break;
 		case 2:
@@ -796,7 +796,7 @@ int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
 				if (be_pixfmt)
 					pixelformat |= 1U << 31;
 			} else if (isdigit(value[0])) {
-				pixelformat = strtol(value, 0L, 0);
+				pixelformat = strtol(value, nullptr, 0);
 			} else {
 				fprintf(stderr, "The pixelformat '%s' is invalid\n", value);
 				std::exit(EXIT_FAILURE);
@@ -823,7 +823,7 @@ int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
 			fmts |= FmtYCbCr;
 			break;
 		case 7:
-			bytesperline[bpl_index] = strtoul(value, 0L, 0);
+			bytesperline[bpl_index] = strtoul(value, nullptr, 0);
 			if (bytesperline[bpl_index] > 0xffff) {
 				fprintf(stderr, "bytesperline can't be more than 65535\n");
 				bytesperline[bpl_index] = 0;
@@ -844,7 +844,7 @@ int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
 			fmts |= FmtXferFunc;
 			break;
 		case 11:
-			sizeimage[sizeimage_index] = strtoul(value, 0L, 0);
+			sizeimage[sizeimage_index] = strtoul(value, nullptr, 0);
 			sizeimage_index++;
 			fmts |= FmtSizeImage;
 			break;
@@ -931,7 +931,7 @@ static __u32 parse_event(const char *e, const char **name)
 
 	*name = "0";
 	if (isdigit(e[0])) {
-		event = strtoul(e, 0L, 0);
+		event = strtoul(e, nullptr, 0);
 		if (event == V4L2_EVENT_CTRL) {
 			fprintf(stderr, "Missing control name for ctrl event, use ctrl=<name>\n");
 			misc_usage();
@@ -1005,7 +1005,7 @@ static int open_media_bus_info(const std::string &bus_info)
 	struct dirent *ep;
 
 	dp = opendir("/dev");
-	if (dp == NULL)
+	if (dp == nullptr)
 		return -1;
 
 	while ((ep = readdir(dp))) {
@@ -1065,7 +1065,7 @@ static const char *make_devname(const char *device, const char *devname,
 		goto err;
 
 	if (device[0] == '0' && device[1] == 'x')
-		iface_id = strtoul(device, NULL, 16);
+		iface_id = strtoul(device, nullptr, 16);
 
 	if (!iface_id) {
 		for (i = 0; i < topology.num_entities; i++)
@@ -1118,15 +1118,15 @@ int main(int argc, char **argv)
 	/* command args */
 	int ch;
 	const char *device = "/dev/video0";	/* -d device */
-	const char *out_device = NULL;
-	const char *export_device = NULL;
+	const char *out_device = nullptr;
+	const char *export_device = nullptr;
 	struct v4l2_capability vcap;	/* list_cap */
 	__u32 wait_for_event = 0;	/* wait for this event */
-	const char *wait_event_id = NULL;
+	const char *wait_event_id = nullptr;
 	__u32 poll_for_event = 0;	/* poll for this event */
-	const char *poll_event_id = NULL;
+	const char *poll_event_id = nullptr;
 	__u32 epoll_for_event = 0;	/* epoll for this event */
-	const char *epoll_event_id = NULL;
+	const char *epoll_event_id = nullptr;
 	unsigned secs = 0;
 	char short_options[26 * 2 * 3 + 1];
 	int idx = 0;
@@ -1247,7 +1247,7 @@ int main(int argc, char **argv)
 				return 1;
 			break;
 		case OptSleep:
-			secs = strtoul(optarg, 0L, 0);
+			secs = strtoul(optarg, nullptr, 0);
 			break;
 		case OptVersion:
 			print_version();
@@ -1515,7 +1515,7 @@ int main(int argc, char **argv)
 		if (wait_for_event == V4L2_EVENT_CTRL)
 			sub.id = common_find_ctrl_id(wait_event_id);
 		else if (wait_for_event == V4L2_EVENT_SOURCE_CHANGE)
-			sub.id = strtoul(wait_event_id, 0L, 0);
+			sub.id = strtoul(wait_event_id, nullptr, 0);
 		if (!doioctl(fd, VIDIOC_SUBSCRIBE_EVENT, &sub))
 			if (!doioctl(fd, VIDIOC_DQEVENT, &ev))
 				print_event(&ev);
@@ -1531,7 +1531,7 @@ int main(int argc, char **argv)
 		if (poll_for_event == V4L2_EVENT_CTRL)
 			sub.id = common_find_ctrl_id(poll_event_id);
 		else if (poll_for_event == V4L2_EVENT_SOURCE_CHANGE)
-			sub.id = strtoul(poll_event_id, 0L, 0);
+			sub.id = strtoul(poll_event_id, nullptr, 0);
 		if (!doioctl(fd, VIDIOC_SUBSCRIBE_EVENT, &sub)) {
 			fd_set fds;
 			__u32 seq = 0;
@@ -1542,7 +1542,7 @@ int main(int argc, char **argv)
 
 				FD_ZERO(&fds);
 				FD_SET(fd, &fds);
-				res = select(fd + 1, NULL, NULL, &fds, NULL);
+				res = select(fd + 1, nullptr, nullptr, &fds, nullptr);
 				if (res <= 0)
 					break;
 				if (!doioctl(fd, VIDIOC_DQEVENT, &ev)) {
@@ -1572,7 +1572,7 @@ int main(int argc, char **argv)
 		if (epoll_for_event == V4L2_EVENT_CTRL)
 			sub.id = common_find_ctrl_id(epoll_event_id);
 		else if (epoll_for_event == V4L2_EVENT_SOURCE_CHANGE)
-			sub.id = strtoul(epoll_event_id, 0L, 0);
+			sub.id = strtoul(epoll_event_id, nullptr, 0);
 		if (!doioctl(fd, VIDIOC_SUBSCRIBE_EVENT, &sub)) {
 			__u32 seq = 0;
 
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index 6a190f1b8..dd2904356 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -64,7 +64,7 @@ static const struct board_list boards[] = {
 		sizeof(AC97_PREFIX) - 1,
 		ac97_regs,
 		ARRAY_SIZE(ac97_regs),
-		NULL,
+		nullptr,
 		0,
 	},
 	{				/* From v4l2-dbg-bttv.h */
@@ -80,7 +80,7 @@ static const struct board_list boards[] = {
 		sizeof(SAA7134_PREFIX) - 1,
 		saa7134_regs,
 		ARRAY_SIZE(saa7134_regs),
-		NULL,
+		nullptr,
 		0,
 	},
 	{				/* From v4l2-dbg-em28xx.h */
@@ -96,7 +96,7 @@ static const struct board_list boards[] = {
 		sizeof(TVP5150_PREFIX) - 1,
 		tvp5150_regs,
 		ARRAY_SIZE(tvp5150_regs),
-		NULL,
+		nullptr,
 		0,
 	},
 	{				/* From v4l2-dbg-micron.h */
@@ -104,7 +104,7 @@ static const struct board_list boards[] = {
 		sizeof(MT9V011_PREFIX) - 1,
 		mt9v011_regs,
 		ARRAY_SIZE(mt9v011_regs),
-		NULL,
+		nullptr,
 		0,
 	},
 };
@@ -138,19 +138,19 @@ static char options[OptLast];
 static unsigned capabilities;
 
 static struct option long_options[] = {
-	{"device", required_argument, 0, OptSetDevice},
-	{"help", no_argument, 0, OptHelp},
-	{"list-registers", optional_argument, 0, OptListRegisters},
-	{"get-register", required_argument, 0, OptGetRegister},
-	{"set-register", required_argument, 0, OptSetRegister},
-	{"chip", required_argument, 0, OptChip},
-	{"scan-chips", no_argument, 0, OptScanChips},
-	{"info", no_argument, 0, OptGetDriverInfo},
-	{"verbose", no_argument, 0, OptVerbose},
-	{"log-status", no_argument, 0, OptLogStatus},
-	{"list-symbols", no_argument, 0, OptListSymbols},
-	{"wide", required_argument, 0, OptSetStride},
-	{0, 0, 0, 0}
+	{"device", required_argument, nullptr, OptSetDevice},
+	{"help", no_argument, nullptr, OptHelp},
+	{"list-registers", optional_argument, nullptr, OptListRegisters},
+	{"get-register", required_argument, nullptr, OptGetRegister},
+	{"set-register", required_argument, nullptr, OptSetRegister},
+	{"chip", required_argument, nullptr, OptChip},
+	{"scan-chips", no_argument, nullptr, OptScanChips},
+	{"info", no_argument, nullptr, OptGetDriverInfo},
+	{"verbose", no_argument, nullptr, OptVerbose},
+	{"log-status", no_argument, nullptr, OptLogStatus},
+	{"list-symbols", no_argument, nullptr, OptListSymbols},
+	{"wide", required_argument, nullptr, OptSetStride},
+	{nullptr, 0, nullptr, 0}
 };
 
 static void usage()
@@ -307,7 +307,7 @@ static unsigned long long parse_reg(const struct board_list *curr_bd, const std:
 			}
 		}
 	}
-	return strtoull(reg.c_str(), NULL, 0);
+	return strtoull(reg.c_str(), nullptr, 0);
 }
 
 static const char *reg_name(const struct board_list *curr_bd, unsigned long long reg)
@@ -322,7 +322,7 @@ static const char *reg_name(const struct board_list *curr_bd, unsigned long long
 				return curr_bd->regs[i].name;
 		}
 	}
-	return NULL;
+	return nullptr;
 }
 
 static const char *binary(unsigned long long val)
@@ -379,7 +379,7 @@ static int parse_subopt(char **subs, const char * const *subopts, char **value)
 		usage();
 		std::exit(EXIT_FAILURE);
 	}
-	if (*value == NULL) {
+	if (*value == nullptr) {
 		fprintf(stderr, "No value given to suboption <%s>\n",
 				subopts[opt]);
 		usage();
@@ -402,7 +402,7 @@ int main(int argc, char **argv)
 	struct v4l2_dbg_register set_reg;
 	struct v4l2_dbg_register get_reg;
 	struct v4l2_dbg_chip_info chip_info;
-	const struct board_list *curr_bd = NULL;
+	const struct board_list *curr_bd = nullptr;
 	char short_options[26 * 2 * 3 + 1];
 	int idx = 0;
 	std::string reg_min_arg, reg_max_arg;
@@ -472,12 +472,12 @@ int main(int argc, char **argv)
 		case OptChip:
 			if (!memcmp(optarg, "subdev", 6) && isdigit(optarg[6])) {
 				match.type = V4L2_CHIP_MATCH_SUBDEV;
-				match.addr = strtoul(optarg + 6, NULL, 0);
+				match.addr = strtoul(optarg + 6, nullptr, 0);
 				break;
 			}
 			if (!memcmp(optarg, "bridge", 6)) {
 				match.type = V4L2_CHIP_MATCH_BRIDGE;
-				match.addr = strtoul(optarg + 6, NULL, 0);
+				match.addr = strtoul(optarg + 6, nullptr, 0);
 				break;
 			}
 			match.type = V4L2_CHIP_MATCH_BRIDGE;
@@ -493,19 +493,19 @@ int main(int argc, char **argv)
 			break;
 
 		case OptSetStride:
-			forcedstride = strtoull(optarg, 0L, 0);
+			forcedstride = strtoull(optarg, nullptr, 0);
 			break;
 
 		case OptListRegisters:
 			subs = optarg;
-			if (subs == NULL)
+			if (subs == nullptr)
 				break;
 
 			while (*subs != '\0') {
 				static const char * const subopts[] = {
 					"min",
 					"max",
-					NULL
+					nullptr
 				};
 
 				switch (parse_subopt(&subs, subopts, &value)) {
@@ -597,7 +597,7 @@ int main(int argc, char **argv)
 				    "VIDIOC_DBG_G_REGISTER") >= 0)
 				size = set_reg.size;
 
-			set_reg.val = strtoull(argv[optind++], NULL, 0);
+			set_reg.val = strtoull(argv[optind++], nullptr, 0);
 			if (doioctl(fd, VIDIOC_DBG_S_REGISTER, &set_reg,
 						"VIDIOC_DBG_S_REGISTER") >= 0) {
 				const char *name = reg_name(curr_bd, set_reg.reg);
@@ -763,7 +763,7 @@ list_done:
 		static char buf[40960];
 		int len = -1;
 
-		if (doioctl(fd, VIDIOC_LOG_STATUS, NULL, "VIDIOC_LOG_STATUS") == 0) {
+		if (doioctl(fd, VIDIOC_LOG_STATUS, nullptr, "VIDIOC_LOG_STATUS") == 0) {
 			printf("\nStatus Log:\n\n");
 #ifdef HAVE_KLOGCTL
 			len = klogctl(3, buf, sizeof(buf) - 1);
@@ -791,7 +791,7 @@ list_done:
 	}
 
 	if (options[OptListSymbols]) {
-		if (curr_bd == NULL) {
+		if (curr_bd == nullptr) {
 			printf("No symbols found for driver %s\n", vcap.driver);
 		}
 		else {
-- 
2.26.2

