Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB9377F129
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 09:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348454AbjHQH0e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 03:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348460AbjHQH0I (ORCPT
        <rfc822;linux-media@vger.Kernel.org>);
        Thu, 17 Aug 2023 03:26:08 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737951BE7
        for <linux-media@vger.Kernel.org>; Thu, 17 Aug 2023 00:26:07 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-58d799aa369so11090637b3.0
        for <linux-media@vger.Kernel.org>; Thu, 17 Aug 2023 00:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692257166; x=1692861966;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h2+TrXen8px/2Uq98vNTZm8pfIgUACjnL8wj6YrRWtg=;
        b=GiIechT1eASW/3r/T8apoLG4WE1898goZItiJvNeDHxzfBOEzS2VBKOwDHTLykX+yQ
         9UjGHiAAWtRc2Bjz8iKqfOcSFITiPdpE8sLQ5laOMiFYtV2nnlJ+/gWXgASPzAHT7oD8
         lzjTxU/0OUryiBIM77U0dNKk9IWkLeOUhf+wCGTgjoCNLNHMtdIwdL6aYnJlgLJvo4ZW
         RYLMmzX7o98FRMhs+fHJ2BLpM2r4TMjHtLU+vd1BivYkfpnzoSYXg62kThip8Go7JNVa
         PjQwwByRRO/ICf/p0QcCqYNmuCeyAbPHq36Sf6/8GnT5zpJaHpsmwYVx9gooQvT92And
         DW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692257166; x=1692861966;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2+TrXen8px/2Uq98vNTZm8pfIgUACjnL8wj6YrRWtg=;
        b=XjQJXHZtWTqp6hlExvy/PSHd5OOR1SS/6JeKOcC+vapgL5PR6Iv7VE5/NnPuxP6vjl
         niEGkkTYlwQu8nAeo3qVbXsTdnkUdaIT9CrJ3ZJdutgT+4RD9qJ8AYKB+VcaTeY82m5l
         Ihzq/vuuKYGF0TNzLZKxDUMjSceUNV0HrHLPLom1g/2It3jdyIfeSooqZCmEIMS0kssi
         0wSxcSekiQJYOlrWUeuUFDU/i4JEXIhHyyXyrXBBbkty2MsMOivu3Bro6yb7SOcalEPE
         qLldN5WADL9lda7xFX2GBeq6knnR/yJEQgCCjVWaJa+ZFdecqNsQEqwFRyi3rYCWoE9Q
         HC3g==
X-Gm-Message-State: AOJu0YzSWU9skewNq/u9D4GN9W4WJMzPEBpmx/p7o6KTfNTBDwfn4dgf
        urfHBNRFuhJopAWUymcDFRGHgAGuiZLEasintnAtMoQSpimxwvMeA4GdZJW5EBDENHRxaNsO5Az
        i+UnB7kwUgkkchLt2ma50SDu/BdiVBcQXrKovHV5LTgH3mTjNN1Yz+B+j8Z0JUFNRHTlo
X-Google-Smtp-Source: AGHT+IF9LskVQ1KUUg8eYmNd8UtsLQAFLDCaziM9MDCsnX6AYuWw8IDQQJdgFsy+G2qiXw3SKzQjyYwg6rs=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:cb5f:f997:f2a2:88c6])
 (user=yunkec job=sendgmr) by 2002:a05:6902:1828:b0:d4f:d7a5:ba3b with SMTP id
 cf40-20020a056902182800b00d4fd7a5ba3bmr59548ybb.8.1692257166531; Thu, 17 Aug
 2023 00:26:06 -0700 (PDT)
Date:   Thu, 17 Aug 2023 16:25:35 +0900
In-Reply-To: <20230817072537.2837504-1-yunkec@google.com>
Mime-Version: 1.0
References: <20230817072537.2837504-1-yunkec@google.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230817072537.2837504-2-yunkec@google.com>
Subject: [PATCH 1/2] v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
From:   Yunke Cao <yunkec@google.com>
To:     linux-media@vger.Kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tested with VIVID

 ./v4l2-ctl -C rect -d 0
rect: 300x400@200x100

 ./v4l2-ctl -c rect=1000x2000@0x0
 ./v4l2-ctl -C rect -d 0
rect: 1000x2000@0x0

Signed-off-by: Yunke Cao <yunkec@google.com>
---
 include/linux/videodev2.h          |  2 ++
 utils/v4l2-ctl/v4l2-ctl-common.cpp | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index c19441a1..a27ea755 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -1776,6 +1776,7 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
 		struct v4l2_ctrl_hevc_scaling_matrix *p_hevc_scaling_matrix;
 		struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
+		struct v4l2_rect *p_rect;
 		void *ptr;
 	};
 } __attribute__ ((packed));
@@ -1818,6 +1819,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
+	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 
 	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
 	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index a1cc93c8..07d2e34b 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -516,6 +516,13 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
 		case V4L2_CTRL_TYPE_AREA:
 			printf("%dx%d", ctrl.p_area->width, ctrl.p_area->height);
 			break;
+		case V4L2_CTRL_TYPE_RECT:
+			printf("%ux%u@%dx%d",
+			       ctrl.p_rect->width,
+			       ctrl.p_rect->height,
+			       ctrl.p_rect->left,
+			       ctrl.p_rect->top);
+			break;
 		default:
 			printf("unsupported payload type");
 			break;
@@ -604,6 +611,9 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
 	case V4L2_CTRL_TYPE_AREA:
 		printf("%31s %#8.8x (area)   :", s.c_str(), qc.id);
 		break;
+	case V4L2_CTRL_TYPE_RECT:
+		printf("%31s %#8.8x (rect)   :", s.c_str(), qc.id);
+		break;
 	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
 		printf("%31s %#8.8x (hdr10-cll-info):", s.c_str(), qc.id);
 		break;
@@ -1157,6 +1167,11 @@ void common_set(cv4l_fd &_fd)
 					sscanf(set_ctrl.second.c_str(), "%ux%u",
 					       &ctrl.p_area->width, &ctrl.p_area->height);
 					break;
+				case V4L2_CTRL_TYPE_RECT:
+					sscanf(set_ctrl.second.c_str(), "%ux%u@%dx%d",
+					       &ctrl.p_rect->width, &ctrl.p_rect->height,
+					       &ctrl.p_rect->left, &ctrl.p_rect->top);
+					break;
 				default:
 					fprintf(stderr, "%s: unsupported payload type\n",
 							qc.name);
-- 
2.41.0.694.ge786442a9b-goog

