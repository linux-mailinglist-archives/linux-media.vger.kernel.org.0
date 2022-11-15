Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC23D629793
	for <lists+linux-media@lfdr.de>; Tue, 15 Nov 2022 12:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbiKOLiG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Nov 2022 06:38:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbiKOLhw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Nov 2022 06:37:52 -0500
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 15 Nov 2022 03:37:49 PST
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A314E2871F
        for <linux-media@vger.kernel.org>; Tue, 15 Nov 2022 03:37:49 -0800 (PST)
X-KPN-MessageId: c79787ac-64d9-11ed-a5a6-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.38])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id c79787ac-64d9-11ed-a5a6-005056abbe64;
        Tue, 15 Nov 2022 12:36:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=iNjlvXipvJu3PQ8Aia0pCWEgTi4Sn6VfmLXnxGxqCKw=;
        b=OVmOWD1aEPjN0qLxSWXzfG9885T7qu71mnCMxRZfjEjijht55L8OpiTyE00GylJa2pKEEGWWbs0o/
         194/u5oW7746TRJu01jWb3l+TZzUjLgzkQhKSCXf5QZb/O1S7DRPm6TNcWSPS1dO7KknAvnJz9bCZB
         UCU3i7gL3rbrvxyrKK6G9F9dPnXCRSewk94+oBDWwnTxzqlxT2yav9k4Us6zK+cG3ToG/IJJjuKkk4
         UyTWdL293bpR1fbVBfHP6MiAvuc8Op8kZ9OnGoF2oZtNA1IF2rVNo/6LmBUjNXyOAaMvLwyX26L2g9
         YeXiU4fmSyEaqkRreiRvimv7Qq5Q4Lg==
X-KPN-MID: 33|M6tRJX+zkcgARqT56HpLvxKMdrADi7MDGVbPffAky7/vMdB2ql+IaV4QaSxL1BV
 8iAOt7+OA9TAt+K8Z0lBACKzQzWva9rhJOndqd4HBE50=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|xNABSJEl1U5bVPIn4T/+su3KDq8np2zK0BiE78ZStZXUAzokuDdLhnVz9QTX+3K
 NJe7BV+hTK0CF/ablXiAf7g==
X-Originating-IP: 173.38.220.59
Received: from [10.47.77.219] (unknown [173.38.220.59])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id c7fac221-64d9-11ed-b5ea-005056abf0db;
        Tue, 15 Nov 2022 12:36:45 +0100 (CET)
Message-ID: <1c1fd714-5277-417e-bf69-0941dc40a8b7@xs4all.nl>
Date:   Tue, 15 Nov 2022 12:36:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: [PATCH] v4l2-tracer: add support for most basic controls
Content-Language: en-US
To:     Deborah Brouwer <deborah.brouwer@collabora.com>
Cc:     daniel.almeida@collabora.com, nfraprado@collabora.com,
        nicolas.dufresne@collabora.com, deborahbrouwer3563@gmail.com,
        linux-media@vger.kernel.org
References: <20221114184426.39997-1-deborah.brouwer@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20221114184426.39997-1-deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
Hi Deb,

I think this is a nice addition for your v3 patch. Support for these
common simple controls is easy to add, and it makes for much better
tracing.

	Hans
---
diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index b736e835..f0353988 100644
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
+				p->value = json_object_get_int64(value_obj);
+		}
 		break;
 	}

diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
index f0bd7002..e26d6e6d 100644
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
+		json_object_object_add(v4l2_ext_control_obj, "value64", json_object_new_uint64(p->value64));
+		break;
 	default:
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "warning: cannot trace control: %s\n", val2s(p->id, control_val_def).c_str());
+		if (p->size) {
+			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "warning: cannot trace control: %s\n", val2s(p->id, control_val_def).c_str());
+		} else {
+			json_object_object_add(v4l2_ext_control_obj, "value", json_object_new_uint64(p->value));
+		}
 		break;
 	}


