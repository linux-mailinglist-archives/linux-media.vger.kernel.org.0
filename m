Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 521EF4CD47E
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 13:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233283AbiCDMvR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 07:51:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234115AbiCDMvO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 07:51:14 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52611B4039
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 04:50:25 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id dr20so17256585ejc.6
        for <linux-media@vger.kernel.org>; Fri, 04 Mar 2022 04:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cfVrQaTuSRlspnqFAOyIP+LzK9x+KLsv1yujUpM5yK4=;
        b=XzbUhhZwoGMeAuarUiQlVNg7qtcsd95BHUen2GDfFfPoiAGCOoS/+rYVB8kSBpb+Td
         +1hp/MJXX4IAKRxPSxSMcjapfHmyl015DBq7Q2QiamD9SAs/BRa+iY0zwUWFP3VhL0xq
         lXrbpA8bOLvqLYRfyLc7b/jxoKh+d9fKQQ+UYbSSYbcdDNhFYThgXI1Vhpyf5/vPyCFY
         w3iG2AwSKE+P051KpvZJiHkaJqEONnCQN4edzIjU+Xr/4Ixab8bs3yXdbOhuj+Vx4b+M
         5pElJ3T/DVbJHisDLuCF5iujfVR/5j8pybMLrM/gSthaphqWwk4+5aGr8VvIuL82nyvx
         sfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cfVrQaTuSRlspnqFAOyIP+LzK9x+KLsv1yujUpM5yK4=;
        b=uQRAjTAa9QATJu92kx8dJsZm2WgIKbrr2MvXGPsTA8bpbfVHemslMnAArqxyGXmOh/
         oDjxgpdQOrOF183sQ6k2EjpmbCMDOIDsBVduHDzAP9C3Lm7/e4dH10IXGbNYA+G9XieU
         ocQMDBB1Ng6/qIQq5la/NlgG1Xf9gOYWLT5HCSMDt/FrUoVgyM6PAP3NLQc7R64AxhgW
         mNENXNiCNM9Inauk54ufiJYpkq1rwBUeLfpqQAIUolXHDgO3lrn1X3qeEC0mP8UL5y54
         ysmmaTKKyC+m7qx8bQ6zgHlqshPbEl6Q1TXvkaCiZZP9LAtx7tMQdgTelzVkglEaxVtM
         PU1g==
X-Gm-Message-State: AOAM530CYuN1wtBVGsrvTKMf60w7Lsg0chYlMGL5qW7vkp5xWhb4x+/M
        fVBro3HQo1tB6hd855IolW9UtCXOZPQXuWSzCQA=
X-Google-Smtp-Source: ABdhPJxVH78yoL6OoghqiXAxPgz4zkBKXpbbaYML+qe2spY4AYFgSnbDBdpkaFDRFC0taF7ZKt6s5A==
X-Received: by 2002:a17:906:a148:b0:6cd:50c7:8d4d with SMTP id bu8-20020a170906a14800b006cd50c78d4dmr30680350ejb.641.1646398223148;
        Fri, 04 Mar 2022 04:50:23 -0800 (PST)
Received: from shashanks-buildpc.. ([2a02:8109:b540:9438:542e:fe2:e980:5b1])
        by smtp.gmail.com with ESMTPSA id e5-20020a170906374500b006d5825520a7sm1736359ejc.71.2022.03.04.04.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 04:50:22 -0800 (PST)
From:   Shashank Sharma <contactshashanksharma@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl,
        Shashank Sharma <shashank.sharma@amd.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Shashank Sharma <contactshashanksharma@gmail.com>
Subject: [PATCH 2/3] edid-decode: Introduce libedid-decode APIs
Date:   Fri,  4 Mar 2022 13:50:00 +0100
Message-Id: <20220304125001.1732057-2-contactshashanksharma@gmail.com>
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

This patch adds a shared library wrapper for edid-decode
tool. With this library acting as an interface, other Linux
processes would also be able to analyze their EDIDs using the
core logic of edid-decode tools.

This would be particularly useful for applications like a Compositor
who wants to extract the information from an EDID, but doesn't
want to add tons of code to do that.

The initial version of the library APIs are basic and fundamental to
understand the response of the community. The long term plan is to
introduce more capable APIs which can:
- extract color correction and colorspace capabilities of the display
  from their respective CTA-861 blocks.
- extract advance information like static and dynamic HDR capabilities,
  YCBCR 4:2:0 support, color depth and bpc, max pixel clocks for
  HDMI 2.0, 2.1 etc.

This infomration will help a display manager or compositor to take
several decisions related to display states and modeset.

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Shashank Sharma <contactshashanksharma@gmail.com>
---
 libedid-decode-api.cpp | 174 +++++++++++++++++++++++++++++++++++++++++
 libedid-decode-api.h   |  27 +++++++
 2 files changed, 201 insertions(+)
 create mode 100644 libedid-decode-api.cpp
 create mode 100644 libedid-decode-api.h

diff --git a/libedid-decode-api.cpp b/libedid-decode-api.cpp
new file mode 100644
index 0000000..ce06ba6
--- /dev/null
+++ b/libedid-decode-api.cpp
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Author: Shashank Sharma <contactshashanksharma@gmail.com>
+ */
+#include <stdio.h>
+#include <unistd.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include "libedid-decode-api.h"
+
+extern struct edid_state *extract_edid_state(int fd, FILE *error);
+
+/*
+ * This is the init function for the API, a user must call
+ * this function with the EDID file node, to extract the edid
+ * into a state, and then call the rest of the APIs with that state
+ * to extract information about EDID.
+ */
+struct edid_state *libedid_parse_edid(const char *edid_path)
+{
+    int edid_fd, ret;
+    struct edid_state *estate;
+
+    if (!edid_path) {
+        printf("No EDID path provided\n");
+        return NULL;
+    }
+
+    /* Expecting path to a connector's EDID file like /sys/class/drm/..../edid */
+    edid_fd = open(edid_path, O_RDONLY);
+    if (edid_fd < 0) {
+        printf("Failed to open fd at path %s\n", edid_path);
+        return NULL;
+    }
+
+    /* Extract the infomrmation from edid node and prepare it's state */
+    estate = extract_edid_state(edid_fd, stderr);
+    if (!estate) {
+        printf("Failed to extract EDID\n");
+        return NULL;
+    }
+    printf("EDID extracted\n");
+
+    /* Now parse edid blocks */
+    ret = estate->parse_edid();
+    if (ret < 0) {
+        printf("Error parsing edid, err=%d \n", ret);
+        estate = NULL;
+    }
+
+    close(edid_fd);
+    return estate;
+}
+
+int libedid_num_blks(struct edid_state *estate)
+{
+    if (estate)
+        return estate->num_blocks;
+
+    printf("EDID state not initialized\n");
+    return -1;
+}
+
+int libedid_has_cta_blks(struct edid_state *estate)
+{
+    if (estate)
+        return estate->has_cta;
+
+    printf("EDID state not initialized\n");
+    return -1;
+}
+
+unsigned int libedid_get_max_hfreq_hz(struct edid_state *estate)
+{
+    if (estate)
+        return estate->max_hor_freq_hz;
+
+    printf("EDID state not initialized\n");
+    return 0;
+}
+
+unsigned int libedid_get_max_vfreq_hz(struct edid_state *estate)
+{
+    if (estate)
+        return estate->max_vert_freq_hz;
+
+    printf("EDID state not initialized\n");
+    return 0;
+}
+
+unsigned int libedid_get_max_pclk_khz(struct edid_state *estate)
+{
+    if (estate)
+        return estate->max_pixclk_khz;
+
+    printf("EDID state not initialized\n");
+    return 0;
+}
+
+int libedid_get_edid_version_minor(struct edid_state *estate)
+{
+    if (estate)
+        return estate->base.edid_minor;
+
+    printf("EDID state not initialized\n");
+    return -1;
+}
+
+int libedid_get_edid_get_num_dtd(struct edid_state *estate)
+{
+    if (estate)
+        return estate->base.dtd_cnt;
+
+    printf("EDID state not initialized\n");
+    return -1;
+}
+
+int libedid_if_preferred_mode_native(struct edid_state *estate)
+{
+    if (estate)
+        return estate->base.preferred_is_also_native;
+
+    printf("EDID state not initialized\n");
+    return -1;
+}
+
+int libedid_get_max_display_w_h_mm(struct edid_state *estate, int *wmm, int *hmm)
+{
+    if (estate && hmm && wmm) {
+        *hmm = estate->base.max_display_height_mm;
+        *wmm = estate->base.max_display_width_mm;
+        return 0;
+    }
+
+    printf("EDID state not initialized\n");
+    return -1;
+}
+
+int libedid_ctablk_has_hdmi(struct edid_state *estate)
+{
+    if (estate)
+        return estate->cta.has_hdmi;
+
+    printf("EDID state not initialized\n");
+    return -1;
+}
+
+int libedid_ctablk_has_vcdb(struct edid_state *estate)
+{
+    if (estate)
+        return estate->cta.has_vcdb;
+
+    printf("EDID state not initialized\n");
+    return -1;
+}
+
+int libedid_ctablk_has_hfvsdb(struct edid_state *estate)
+{
+    if (estate)
+        return estate->cta.have_hf_vsdb;
+
+    printf("EDID state not initialized\n");
+    return -1;
+}
+
+unsigned int libedid_ctablk_supported_hdmi_vics(struct edid_state *estate)
+{
+    if (estate)
+        return estate->cta.supported_hdmi_vic_codes;
+
+    printf("EDID state not initialized\n");
+    return -1;
+}
\ No newline at end of file
diff --git a/libedid-decode-api.h b/libedid-decode-api.h
new file mode 100644
index 0000000..742b4a4
--- /dev/null
+++ b/libedid-decode-api.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Author: Shashank Sharma <contactshashanksharma@gmail.com>
+ */
+
+#ifndef __LIBEDID_DECODE_API_H_
+#define __LIBEDID_DECODE_API_H_
+
+#include "edid-decode.h"
+
+struct edid_state *libedid_parse_edid(const char *edid_path);
+int libedid_num_blks(struct edid_state *estate);
+int libedid_has_cta_blks(struct edid_state *estate);
+int libedid_get_edid_version_minor(struct edid_state *estate);
+int libedid_get_edid_get_num_dtd(struct edid_state *estate);
+int libedid_if_preferred_mode_native(struct edid_state *estate);
+int libedid_get_max_display_w_h_mm(struct edid_state *estate, int *wmm, int *hmm);
+int libedid_ctablk_has_hdmi(struct edid_state *estate);
+int libedid_ctablk_has_vcdb(struct edid_state *estate);
+int libedid_ctablk_has_hfvsdb(struct edid_state *estate);
+
+unsigned int libedid_get_max_pclk_khz(struct edid_state *estate);
+unsigned int libedid_get_max_hfreq_hz(struct edid_state *estate);
+unsigned int libedid_get_max_vfreq_hz(struct edid_state *estate);
+unsigned int libedid_ctablk_supported_hdmi_vics(struct edid_state *estate);
+
+#endif
-- 
2.32.0

