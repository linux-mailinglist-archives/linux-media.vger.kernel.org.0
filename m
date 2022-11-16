Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0447462B464
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 08:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbiKPH70 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 02:59:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232913AbiKPH7Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 02:59:16 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE0BC7
        for <linux-media@vger.kernel.org>; Tue, 15 Nov 2022 23:59:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E78CC61A77
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 07:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF00C433C1;
        Wed, 16 Nov 2022 07:59:13 +0000 (UTC)
Message-ID: <0e396262-2ec6-c18c-b566-f3b5b90381c9@xs4all.nl>
Date:   Wed, 16 Nov 2022 08:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2] v4l2-tracer: add support for most basic controls
To:     Deborah Brouwer <deborah.brouwer@collabora.com>
Cc:     daniel.almeida@collabora.com, nfraprado@collabora.com,
        nicolas.dufresne@collabora.com, deborahbrouwer3563@gmail.com,
        linux-media@vger.kernel.org
References: <20221114184426.39997-1-deborah.brouwer@collabora.com>
Content-Language: en-US
In-Reply-To: <20221114184426.39997-1-deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2-tracer utility didn't support tracing simple controls without
a payload (i.e. the 'size' field is 0) and just a simple value.

This adds support for that, plus the four standard INTEGER64 controls
that use field value64.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Changes since v1:

- Use int64 instead of uint64 for "value64" (copy-paste error).
- Use int instead of int64 for "value".
---
diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index b736e835..efed96e8 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -734,7 +734,23 @@ struct v4l2_ext_control *retrace_v4l2_ext_control(json_object *parent_obj, int c
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
index f0bd7002..ce14538b 100644
--- a/utils/v4l2-tracer/trace.cpp
+++ b/utils/v4l2-tracer/trace.cpp
@@ -405,9 +405,19 @@ void trace_v4l2_ext_control(void *arg, json_object *parent_obj, std::string key_
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

