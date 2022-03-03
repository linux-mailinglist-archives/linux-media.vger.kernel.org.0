Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044114CC0B4
	for <lists+linux-media@lfdr.de>; Thu,  3 Mar 2022 16:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234303AbiCCPHd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Mar 2022 10:07:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234293AbiCCPHb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Mar 2022 10:07:31 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5E931903FB
        for <linux-media@vger.kernel.org>; Thu,  3 Mar 2022 07:06:45 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id i8so8291721wrr.8
        for <linux-media@vger.kernel.org>; Thu, 03 Mar 2022 07:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZDbc5Zu6HoRaLo+/k8LqLkoHIjXtL1mJtM5q0u7i6VE=;
        b=BxAxXeY1f1ADhiPhtuRlC/hwavrnHQcrnvdwNpsdzXhkg+L8/B2T6XnUehvOZMugPm
         CMULrUjdeAa0EIqUjxYyWRZLb5BOIrFtGmDCQTyZ3ctMxaq4yX+hq12kMIznq6KRGAei
         aPXq3G3a3pvGqbGyFzMe/6MrlkDY0eHrSOf3qlXnut8RBNnOX8Z0WLoXsqPcYTJmsmGc
         BSYFDmdoIMh6GYhEn7OB3r4KXjxKDPF2Sx9ay9SpgPjcQvc6rUkAz8mZT5OE++Kan6Ir
         OZEJ1dRgqNA8bK4XCtxKzrZggCAcKup65pfHwffjQ8y0jDrFKkxkzw7wRB+lcqEqP5B0
         GuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZDbc5Zu6HoRaLo+/k8LqLkoHIjXtL1mJtM5q0u7i6VE=;
        b=8NWGGxOs4gpOwqltMZdiASUbawJ0cMbk9DaOJzbaApPQ1RO3H3oeJZX1OUrPWDdS4x
         YkO+i0bImUZPTN2QPu8VIB8fK3o7a3/KcTgnAlDedpuzXtQAe/WAElVpKyx3eKqcG3Hw
         0eOa5Ex0YhATDndWaM55hvjzciO7vkv5OeYN9qis8VFDunycGnP28/QoSjqpuI6qCQLe
         aWEsXDWiax93Vf6Tj4365FHN0Ngy+kNJVrc+P9MAIgielbuPU0xlO1bnECaPAYxr37Lj
         wMoWDvP55QeFjGQsjfb9Etzr9sEZG8W7Bm6g83SB4NLQrqc8Qsq5hVE8yBjKZoS5PGAI
         X1nw==
X-Gm-Message-State: AOAM532udlDv3WadnJKt15NLgDLqe/KUR6UTyraNw3jqN10Sg84KAYaY
        UA+Rk5uF+QyMssWwWsrH0lxx1J9EaqxCBwEI
X-Google-Smtp-Source: ABdhPJxBRKLqO16sjNcuPajVoBu0TZBU8lW7PmHbVGZM2P61uskvrbftLaDOs0G6+4sPQzZHYsi0Xw==
X-Received: by 2002:adf:df0a:0:b0:1f0:2140:1b41 with SMTP id y10-20020adfdf0a000000b001f021401b41mr8357683wrl.94.1646320004260;
        Thu, 03 Mar 2022 07:06:44 -0800 (PST)
Received: from localhost.localdomain (hst-221-14.medicom.bg. [84.238.221.14])
        by smtp.gmail.com with ESMTPSA id o16-20020a05600c511000b0038141b4a4edsm10757072wms.38.2022.03.03.07.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 07:06:43 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-api@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 3/6] venus: Add a handling of QC08C compressed format
Date:   Thu,  3 Mar 2022 17:06:33 +0200
Message-Id: <20220303150636.577063-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303150636.577063-1-stanimir.varbanov@linaro.org>
References: <20220303150636.577063-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds QC08C compressed pixel format in the Venus driver, and
make it possible to discover from v4l2 clients.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c |  2 ++
 drivers/media/platform/qcom/venus/vdec.c    | 18 +++++++++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 52b198a194b3..7144747398b6 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -592,6 +592,8 @@ static u32 to_hfi_raw_fmt(u32 v4l2_fmt)
 		return HFI_COLOR_FORMAT_NV12;
 	case V4L2_PIX_FMT_NV21:
 		return HFI_COLOR_FORMAT_NV21;
+	case V4L2_PIX_FMT_QC08C:
+		return HFI_COLOR_FORMAT_NV12_UBWC;
 	default:
 		break;
 	}
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 91da3f509724..eb02e45a512b 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -31,6 +31,10 @@
  */
 static const struct venus_format vdec_formats[] = {
 	{
+		.pixfmt = V4L2_PIX_FMT_QC08C,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	}, {
 		.pixfmt = V4L2_PIX_FMT_NV12,
 		.num_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
@@ -106,6 +110,10 @@ find_format(struct venus_inst *inst, u32 pixfmt, u32 type)
 	    !venus_helper_check_codec(inst, fmt[i].pixfmt))
 		return NULL;
 
+	if (V4L2_TYPE_IS_CAPTURE(type) &&
+	    !venus_helper_check_format(inst, fmt[i].pixfmt))
+		return NULL;
+
 	return &fmt[i];
 }
 
@@ -124,8 +132,12 @@ find_format_by_index(struct venus_inst *inst, unsigned int index, u32 type)
 
 		if (fmt[i].type != type)
 			continue;
-		valid = type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ||
-			venus_helper_check_codec(inst, fmt[i].pixfmt);
+
+		if (V4L2_TYPE_IS_OUTPUT(type))
+			valid = venus_helper_check_codec(inst, fmt[i].pixfmt);
+		else if (V4L2_TYPE_IS_CAPTURE(type))
+			valid = venus_helper_check_format(inst, fmt[i].pixfmt);
+
 		if (k == index && valid)
 			break;
 		if (valid)
@@ -1525,7 +1537,7 @@ static const struct hfi_inst_ops vdec_hfi_ops = {
 static void vdec_inst_init(struct venus_inst *inst)
 {
 	inst->hfi_codec = HFI_VIDEO_CODEC_H264;
-	inst->fmt_out = &vdec_formats[6];
+	inst->fmt_out = &vdec_formats[7];
 	inst->fmt_cap = &vdec_formats[0];
 	inst->width = frame_width_min(inst);
 	inst->height = ALIGN(frame_height_min(inst), 32);
-- 
2.25.1

