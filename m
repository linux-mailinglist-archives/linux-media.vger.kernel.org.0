Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D22B63DD22
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 19:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbiK3SYR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 13:24:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbiK3SX5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 13:23:57 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9A1F07
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 10:23:42 -0800 (PST)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 36217660231D;
        Wed, 30 Nov 2022 18:23:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1669832621;
        bh=mkbXuCrcarObODRYjG2VVuMVezy8+vrvpKJSmaykbhA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ieoFe2msy3SGWm0KhwZpTeW8i+eIBBGKRHtIz9wmvmZ0NtU8gMBlqFQFvEWLbdlq4
         PMxWCBznwLoms8Dl60z7izNz3ZwXU9IwAgZBEDJxV1dsyqEi1WdOGl9kohDzjvArlM
         15p4VXWjRJ1n+TCRkekvy95ePg8V1XrOCTyX0QZGICYlmPvkg/rGeVLd4C5cwekTrm
         JvRxN0fq8UrSOetZon2r523BiYCQ8494UaXX6cslvz8F8ynQsKE3k0gJzd5dhBEBrn
         L0V4hCuoGkA+V72C6CH5ebRIK8fGET1/OPX8qfcR1rVagM0gTQpDnQLqWCammL3qKx
         N0zv6ipiwMmHw==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     daniel.almeida@collabora.com, nfraprado@collabora.com,
        nicolas.dufresne@collabora.com, hverkuil-cisco@xs4all.nl,
        deborahbrouwer3563@gmail.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v4 2/2] v4l2-tracer: add support for most basic controls
Date:   Wed, 30 Nov 2022 10:24:15 -0800
Message-Id: <aba188ee4aad4d8970085087d54509017215ea38.1669831184.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1669831184.git.deborah.brouwer@collabora.com>
References: <cover.1669831184.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

The v4l2-tracer utility didn't support tracing simple controls without
a payload (i.e. the 'size' field is 0) and just a simple value.

This adds support for that, plus the four standard INTEGER64 controls
that use field value64.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/retrace.cpp | 16 ++++++++++++++++
 utils/v4l2-tracer/trace.cpp   | 14 ++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 9b03d3bb..36a218d3 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -726,7 +726,23 @@ struct v4l2_ext_control *retrace_v4l2_ext_control(json_object *parent_obj, int c
 		p->value = retrace_v4l2_ext_control_value(v4l2_ext_control_obj,
 		                                          v4l2_stateless_hevc_start_code_val_def);
 		break;
+	case V4L2_CID_MPEG_VIDEO_DEC_PTS:
+	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:
+	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
+	case V4L2_CID_PIXEL_RATE: {
+		json_object *value64_obj;
+
+		if (json_object_object_get_ex(v4l2_ext_control_obj, "value64", &value64_obj))
+			p->value64 = json_object_get_int64(value64_obj);
+		break;
+	}
 	default:
+		if (!p->size) {
+			json_object *value_obj;
+
+			if (json_object_object_get_ex(v4l2_ext_control_obj, "value", &value_obj))
+				p->value = json_object_get_int(value_obj);
+		}
 		break;
 	}
 
diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
index cff78315..d5a09ad7 100644
--- a/utils/v4l2-tracer/trace.cpp
+++ b/utils/v4l2-tracer/trace.cpp
@@ -410,9 +410,19 @@ void trace_v4l2_ext_control(void *arg, json_object *parent_obj, std::string key_
 	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:
 		trace_v4l2_ctrl_mpeg2_quantisation_gen(p->p_mpeg2_quantisation, v4l2_ext_control_obj);
 		break;
+	case V4L2_CID_MPEG_VIDEO_DEC_PTS:
+	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:
+	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
+	case V4L2_CID_PIXEL_RATE:
+		json_object_object_add(v4l2_ext_control_obj, "value64", json_object_new_int64(p->value64));
+		break;
 	default:
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "warning: cannot trace control: %s\n", val2s(p->id, control_val_def).c_str());
+		if (p->size) {
+			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "warning: cannot trace control: %s\n", val2s(p->id, control_val_def).c_str());
+		} else {
+			json_object_object_add(v4l2_ext_control_obj, "value", json_object_new_int(p->value));
+		}
 		break;
 	}
 
-- 
2.38.0

