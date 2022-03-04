Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2BDD4CD47D
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 13:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232756AbiCDMvQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 07:51:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233283AbiCDMvO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 07:51:14 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F4B1B1DF8
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 04:50:25 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id y11so10107717eda.12
        for <linux-media@vger.kernel.org>; Fri, 04 Mar 2022 04:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1JGUzzrE4T+E8JakKE2PaZYv8Zw6QAorMEDh7v6Jzsg=;
        b=PYEzKQ8ajnNFS9Io1BRwYTtBJF7svjmgISbaJQLLK6c6QHedZg5DmlqvApX1Mf3yN0
         icFJmHcKhkaN8x9vm31foidKyZX4bO2wH0/TNa0i+n3OlocOSbS2PLSdVFOejs9PQ7lV
         Ej44M4vcE35kLdChkH42d0eHxz3Efh2L5NTPgrc/e5pE8MlwjBiyyv4ErwxQ6zS+KkWp
         21R5hgearP1oGkOr9yRq7CievCdw/jTsDiPXvD2ovfLeGTBCqMscHm4z5N4c27amKYcp
         BEMjCCWdsk+zHAr6M10lJ5HwUffHIjT9YcQ5TmmdRuVxbiFA1FJcWT00oyJRGMoCT68u
         jcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1JGUzzrE4T+E8JakKE2PaZYv8Zw6QAorMEDh7v6Jzsg=;
        b=HZcJrF4ttvuYRMiwXvVgZtjEEGhtAWcwEopyN7GSpiFFvwGvxSe8/hTy16Fbn97FcA
         lSM2JIfJ5KXvIWskA06oEHNh2TjH6JNhRnrRhkHonF2p/cYUZeDB8THlHrq7SqMOY/QI
         cOWNeG0YR4RiaFt7otv8EHma/tOvR64GADMHXLNcJFnCJvjSKjB3o/veXQCIJxOjVDLL
         7RTpjPb/8Rq1rHF9Bw/AwxqDtg+SXGz4S8/I/5Id2FYpU4WKEnFJwe/ymiQRbbla3bgU
         s5C0C38s6ecdcb3fruPBn2o8Qsh0518QQoWSHPZT6XKj7lFXJquNyMV3BpKspCTqDohT
         f9iQ==
X-Gm-Message-State: AOAM533ki6sDpHxvII2XrKXIjELjzk51Fwr8862pOV11sBiKFdDMiXLc
        LXvwRqY7X7rgpNZLj7bsC7WC6O2KDPbR48T74/8=
X-Google-Smtp-Source: ABdhPJyL8GnyYoXdwEYGJPHxOGZ1WopGk3d17hIQHeqDdvbUh5oR4LHtM4EOo/GzYhzucTfdq7PpXA==
X-Received: by 2002:a05:6402:26cc:b0:415:b6f7:bfa with SMTP id x12-20020a05640226cc00b00415b6f70bfamr12921475edd.42.1646398224198;
        Fri, 04 Mar 2022 04:50:24 -0800 (PST)
Received: from shashanks-buildpc.. ([2a02:8109:b540:9438:542e:fe2:e980:5b1])
        by smtp.gmail.com with ESMTPSA id e5-20020a170906374500b006d5825520a7sm1736359ejc.71.2022.03.04.04.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 04:50:23 -0800 (PST)
From:   Shashank Sharma <contactshashanksharma@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl,
        Shashank Sharma <shashank.sharma@amd.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Shashank Sharma <contactshashanksharma@gmail.com>
Subject: [PATCH 3/3] edid-decode: Add test utility for libedid-decode
Date:   Fri,  4 Mar 2022 13:50:01 +0100
Message-Id: <20220304125001.1732057-3-contactshashanksharma@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
References: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Shashank Sharma <shashank.sharma@amd.com>

This patch adds a small test utility to show usage of
libedid-decode.

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Jani Nikula <jani.nikula@intel.com>

Signed-off-by: Shashank Sharma <contactshashanksharma@gmail.com>
---
 Makefile     |   3 ++
 test-lib.cpp | 121 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 test-lib.cpp

diff --git a/Makefile b/Makefile
index ebf3370..fdd02a0 100644
--- a/Makefile
+++ b/Makefile
@@ -44,6 +44,9 @@ edid-decode.js: $(SOURCES) edid-decode.h oui.h Makefile
 libedid-decode: $(SOURCES) edid-decode.h oui.h Makefile
 	$(CXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(WARN_FLAGS) -g $(LIB_FLAGS) $(sha) $(date) $(LIBLINK_FLAGS) -o $(LIB_NAME) $(LIB_SOURCES) $(SOURCES) -lm
 
+libedid-test:
+	$(CXX)  -o test-lib test-lib.cpp -g -L$(PWD) -ledid-decode
+
 clean:
 	rm -f edid-decode libedid-decode.so
 
diff --git a/test-lib.cpp b/test-lib.cpp
new file mode 100644
index 0000000..9b86adb
--- /dev/null
+++ b/test-lib.cpp
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Author: Shashank Sharma <contactshashanksharma@gmail.com>
+ */
+
+#include <stdio.h>
+#include <sys/types.h>
+#include "libedid-decode-api.h"
+#define EDID_PATH "/sys/class/drm/card0-HDMI-A-1/edid"
+
+/* This is a sample program to demo the usages of libedid-decode */
+
+int main(void)
+{
+    int ret;
+    unsigned int u_ret;
+    struct edid_state *estate;
+    int w = 0, h = 0;
+
+    estate = libedid_parse_edid(EDID_PATH);
+    if (!estate) {
+        printf("Failed to parse EDID\n");
+        return -1;
+    }
+
+    printf("EDID parsing success\n");
+
+
+    ret = libedid_num_blks(estate);
+    if (ret < 0) {
+        printf("Error: failed to get num blocks\n");
+        return -1;
+    }
+    printf("EDID: No of blocks: %d\n", ret);
+
+    ret = libedid_has_cta_blks(estate);
+    if (ret < 0) {
+        printf("Error: failed to check CTA block\n");
+        return -1;
+    }
+    printf("EDID: EDID %s CTA blocks\n", ret ? "has" : "doesn't have");
+
+    ret = libedid_get_edid_version_minor(estate);
+    if (ret < 0) {
+        printf("Error: failed to check EDID version\n");
+        return -1;
+    }
+    printf("EDID: EDID version: 1.%d\n", ret);
+
+    ret = libedid_get_edid_get_num_dtd(estate);
+    if (ret < 0) {
+        printf("Error: failed to check EDID num DTDs\n");
+        return -1;
+    }
+    printf("EDID: EDID has %d DTDs\n", ret);
+
+    ret = libedid_if_preferred_mode_native(estate);
+    if (ret < 0) {
+        printf("Error: failed to check preferred mode\n");
+        return -1;
+    }
+    printf("EDID: EDID preferred mode is %s\n", ret ? "native" : "not native");
+
+    ret = libedid_get_max_display_w_h_mm(estate, &w, &h);
+    if (ret < 0) {
+        printf("Error: failed to check height/width\n");
+        return -1;
+    }
+    printf("EDID: EDID hxw is %dx%d\n", w, h);
+
+    ret = libedid_ctablk_has_hdmi(estate);
+    if (ret < 0) {
+        printf("Error: failed to check CTA HDMI support\n");
+        return -1;
+    }
+    printf("EDID: CTA block %s HDMI\n", ret ? "supports" : "doesn't support");
+
+    ret = libedid_ctablk_has_vcdb(estate);
+    if (ret < 0) {
+        printf("Error: failed to check CTA VCDB support\n");
+        return -1;
+    }
+    printf("EDID: CTA block %s VCDB\n", ret ? "has" : "doesn't have");
+
+    ret = libedid_ctablk_has_hfvsdb(estate);
+    if (ret < 0) {
+        printf("Error: failed to check CTA HF-VSDB support\n");
+        return -1;
+    }
+    printf("EDID: CTA block %s HF-VSDB\n", ret ? "has" : "doesn't have");
+
+    u_ret = libedid_get_max_pclk_khz(estate);
+    if (u_ret == 0) {
+        printf("Error: failed to get max pixel clock\n");
+        return -1;
+    }
+    printf("EDID: EDID's max pixel clock is %u KHz\n", u_ret);
+
+    u_ret = libedid_get_max_hfreq_hz(estate);
+    if (u_ret == 0) {
+        printf("Error: failed to get max hfreq\n");
+        return -1;
+    }
+    printf("EDID: EDID's max hfreq is %u Hz\n", u_ret);
+
+    u_ret = libedid_get_max_vfreq_hz(estate);
+    if (u_ret == 0) {
+        printf("Error: failed to get max vfreq\n");
+        return -1;
+    }
+    printf("EDID: EDID's max vfreq is %u Hz\n", u_ret);
+
+    u_ret = libedid_ctablk_supported_hdmi_vics(estate);
+    if (u_ret == 0) {
+        printf("Error: failed to get supported VICs\n");
+        return -1;
+    }
+    printf("EDID: EDID's supported HDMI VICs map is %u\n", u_ret);
+
+    return 0;
+}
\ No newline at end of file
-- 
2.32.0

