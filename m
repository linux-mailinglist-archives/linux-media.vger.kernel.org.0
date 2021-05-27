Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70B9A392688
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 06:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbhE0Ekx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 00:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhE0Ekw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 00:40:52 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646CFC061574
        for <linux-media@vger.kernel.org>; Wed, 26 May 2021 21:39:19 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id t193so2767073pgb.4
        for <linux-media@vger.kernel.org>; Wed, 26 May 2021 21:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dgsuzgw+A6LavSeod485rbtdeU8E8GKeuQ2qGXFVt90=;
        b=VnDxLTEiSduskXhb7BHugEM//xR29k6sy0QPfOE8FYBzncZ/qC8F0Kd4dLrGNuRjSO
         PCMeFf1DP/Kk8/zOiRxwysDRdRRyZZobLH4IxEERCWqD/i1Jz+LnenTSwSXfKAciBFOF
         77E7fNW+OOPcMPaagcKx+M+Zt+n1snZCDznRocOawbG10858OrqFaAeqs9lQSOwFZziM
         VtgDrOONNdkiEKmD37FnTCGMILVP+GWwksD7vHm3AGAx/tgxFCMgXCH2UCeGl7tBgVKK
         13IiikwWZc1d17sV4owBG/wckZkdAFxa0PNvP9suKOUMhJiEGabuXtrBRFWDhzfxgQ8W
         Mvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dgsuzgw+A6LavSeod485rbtdeU8E8GKeuQ2qGXFVt90=;
        b=Ee28t0HKl2560V0dPYJwmKFAWcW6c8nhgbBFa66T5LqGcqWtNq+HPUIJEJYS4fCj9m
         uN83IfnEV9LekEYow7qUIQc6+OSvLeUYw8MUSwqAGJ4XCPwWSglNsQONcAALzbout9kR
         N9nXC5ii0Z3+AN4QVYuWkU0u3c26MEoPZdW01urn9z7IfHBm4BJESIxXwSZ394Y+tzyi
         Muv8+OxLHkhThODZIz4oi2huYpwkjiRyCJVselFMvsA/Zwxdp2iVsbsQoChRt+hfL2ah
         lv9yffnTWmVzlQPCfEeB1hId6Omw70MM30VY9IZInS1D/JBGkOQkrY9moSFxmwYiQxLJ
         P/1g==
X-Gm-Message-State: AOAM5335I96FyvsyGHaYYW3Gej/RY9Cwfg209Yvxrx0OGH8XfZw4Y+Y+
        KkW0xEEV8pXeqDRZtjbQOR/O+Q1XYsmmFw==
X-Google-Smtp-Source: ABdhPJw1UVNGlHbZM3ciHT35oHLmKE3Ht8e7T7Wci0ee1jApX351f3zzKLmxn1vzQxzyA63g6m/42w==
X-Received: by 2002:a62:3001:0:b029:2e9:39d0:46cd with SMTP id w1-20020a6230010000b02902e939d046cdmr1858216pfw.47.1622090358528;
        Wed, 26 May 2021 21:39:18 -0700 (PDT)
Received: from ryzen.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id n8sm655317pff.167.2021.05.26.21.39.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 21:39:18 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] v4l-utils: add missing static
Date:   Wed, 26 May 2021 21:39:17 -0700
Message-Id: <20210527043917.52719-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found by -Wmissing-prototypes

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-compliance.cpp     | 2 +-
 utils/cec-ctl/cec-ctl.cpp                   | 2 +-
 utils/cec-follower/cec-follower.cpp         | 2 +-
 utils/libcecutil/cec-gen.pl                 | 2 +-
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 2 +-
 utils/v4l2-ctl/v4l2-ctl-meta.cpp            | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index b292e541e..84038d096 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -336,7 +336,7 @@ static std::string audio_format_code2s(__u8 format_code)
 	}
 }
 
-std::string extension_type_code2s(__u8 type_code)
+static std::string extension_type_code2s(__u8 type_code)
 {
 	switch (type_code) {
 	case 0:
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 8abb84d64..1a9611670 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -409,7 +409,7 @@ static __u64 current_ts()
 	return ts.tv_sec * 1000000000ULL + ts.tv_nsec;
 }
 
-int cec_named_ioctl(int fd, const char *name,
+static int cec_named_ioctl(int fd, const char *name,
 		    unsigned long int request, void *parm)
 {
 	int retval = ioctl(fd, request, parm);
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 10a9552de..2ecad0923 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -197,7 +197,7 @@ static std::string audio_format_code2s(__u8 format_code)
 	}
 }
 
-std::string extension_type_code2s(__u8 type_code)
+static std::string extension_type_code2s(__u8 type_code)
 {
 	switch (type_code) {
 	case 0:
diff --git a/utils/libcecutil/cec-gen.pl b/utils/libcecutil/cec-gen.pl
index 224d0ba22..726e74b30 100755
--- a/utils/libcecutil/cec-gen.pl
+++ b/utils/libcecutil/cec-gen.pl
@@ -503,7 +503,7 @@ status:
 		printf("\t%s\n", cec_status2s(*msg).c_str());
 }
 
-void log_htng_msg(const struct cec_msg *msg)
+static void log_htng_msg(const struct cec_msg *msg)
 {
 	if ((msg->tx_status && !(msg->tx_status & CEC_TX_STATUS_OK)) ||
 	    (msg->rx_status && !(msg->rx_status & (CEC_RX_STATUS_OK | CEC_RX_STATUS_FEATURE_ABORT))))
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index ca973c601..9d542957f 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -39,7 +39,7 @@ static bool stream_use_hdr;
 static std::array<unsigned int, VIDEO_MAX_PLANES> max_bytesused;
 static std::array<unsigned int, VIDEO_MAX_PLANES> min_data_offset;
 
-bool operator<(struct timeval const& n1, struct timeval const& n2)
+static bool operator<(struct timeval const& n1, struct timeval const& n2)
 {
 	return n1.tv_sec < n2.tv_sec ||
 		(n1.tv_sec == n2.tv_sec && n1.tv_usec < n2.tv_usec);
diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
index e1b149117..7c6946243 100644
--- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
@@ -102,7 +102,7 @@ void meta_set(cv4l_fd &_fd)
 		   options[OptTryMetaOutFormat], V4L2_BUF_TYPE_META_OUTPUT);
 }
 
-void __meta_get(const cv4l_fd &fd, __u32 type)
+static void __meta_get(const cv4l_fd &fd, __u32 type)
 {
 	vfmt.type = type;
 	if (doioctl(fd.g_fd(), VIDIOC_G_FMT, &vfmt) == 0)
-- 
2.31.1

