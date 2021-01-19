Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 821252FB8B9
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 15:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394498AbhASNlS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 08:41:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392672AbhASMSS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 07:18:18 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29BE3C061786
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 04:16:54 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id f1so7115399edr.12
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 04:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7do0SqrAAjNKuAwvjSS/PH9scEdy2dmxkDXLAMjZ4Mw=;
        b=WQE1HroxlDYFsu92j4/V9+GiWk5tgYIXA5t5rMxlNHN+oAsDy6OtlAyuWGdBitj9oH
         mAAHN9Y1JYr7wuxdrkPmAg2ixuNhnxgWtnBAR4qF2BYK7XuGgWVKObv5CBTeQZuY6exE
         sxxr8Ga/1mpyL8M60wNo0nmckXrcSJKbbEd0OOjRixYyuWLvo7k7U4Qvpy2nsxcTQHRw
         hL3JCYR757qO4YqNMX1/LvopSNEmHDb/PtPvFFOtNWCiZI3Bm/dKP2n6jYfVBKz0nKnr
         Wk9CxH27ZHP9KqdGCQKLZeqCiJ219XMCcF0++WWJraHb4NH+Dbe9xr9S3bodRxjyB3jA
         V/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7do0SqrAAjNKuAwvjSS/PH9scEdy2dmxkDXLAMjZ4Mw=;
        b=E+X9ppfCCPezTYadvjbFroOsaylqBq/L3cBhK4g7u6juq2YemHRr3KdUc5ptpMP4IZ
         H0+W1J2sfcFIXv++08fDtSlDF2Xb9/vHfh0DGOz+hrLYt6mLNxYiyQBh/F5cRj1XP72Z
         4WNSESr/bcm3Ciohu/axBWvr1i7Cb/0r5iQs6gA/u2OSjER3z7udMOsUICkNgd/Z38is
         idl2oYDQHlVoBnCRkrPfbrt4h9AZq/mPpqF4FJGOtjrNye/YGccyGt83coG2mFYOQ5Tz
         zmaDqdYF/KCoTMRdEepAMpEQ8Dy5Q6XhNomOtYH4t9OVHxVMZpH2n+qwz7dK4pVUCpBd
         nUAw==
X-Gm-Message-State: AOAM531vnojlL0bTtO5Ojg2+AbTwE8IAhwXG5mht/3F3ZhikNnAtnCFm
        3fzHjszmwiXLgSXGhjO6JoRHKd6GCpTllP3Q
X-Google-Smtp-Source: ABdhPJxNRzeR8gtOV1TdEhF1tAGxZnV6FSR8lWz513vGWacEJiLq1q2yYYjMAnL7lqkG4fS6wdSwLQ==
X-Received: by 2002:a50:d5c1:: with SMTP id g1mr3296389edj.299.1611058612764;
        Tue, 19 Jan 2021 04:16:52 -0800 (PST)
Received: from localhost.localdomain (hst-221-116.medicom.bg. [84.238.221.116])
        by smtp.gmail.com with ESMTPSA id hb19sm180819ejc.16.2021.01.19.04.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 04:16:52 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 2/2] venus: venc: Add support for AUD NALU control
Date:   Tue, 19 Jan 2021 14:16:25 +0200
Message-Id: <20210119121625.2397824-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119121625.2397824-1-stanimir.varbanov@linaro.org>
References: <20210119121625.2397824-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for Access Unit Delimiter control into encoder.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h       |  1 +
 drivers/media/platform/qcom/venus/venc.c       | 14 ++++++++++++++
 drivers/media/platform/qcom/venus/venc_ctrls.c |  8 +++++++-
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index b984d508ed71..efb9ce5505ac 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -222,6 +222,7 @@ struct venc_controls {
 	u32 multi_slice_max_mb;
 
 	u32 header_mode;
+	bool aud_enable;
 
 	struct {
 		u32 h264;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index e4775ec97a87..498efa875c51 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -728,6 +728,20 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
+	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
+	    inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
+		struct hfi_enable en = {};
+
+		ptype = HFI_PROPERTY_PARAM_VENC_H264_GENERATE_AUDNAL;
+
+		if (ctr->aud_enable)
+			en.enable = 1;
+
+		ret = hfi_session_set_property(inst, ptype, &en);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 9fbe8388a938..cbc49910de67 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -262,6 +262,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID:
 		ctr->base_priority_id = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:
+		ctr->aud_enable = ctrl->val;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -277,7 +280,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 51);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 52);
 	if (ret)
 		return ret;
 
@@ -483,6 +486,9 @@ int venc_ctrl_init(struct venus_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID, 0,
 			  6, 1, 0);
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_AU_DELIMITER, 0, 1, 1, 0);
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.25.1

