Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE1627B228
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 18:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgI1QpB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 12:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbgI1QpA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 12:45:00 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18842C0613D5
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 09:45:00 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id k14so2120160edo.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 09:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pNVoDDa73nLv4JDe00OIrDQno9iqywhjci+yCQnsgFM=;
        b=tpOXtrfJ6VqKQbgemY+gWrkkQCg60SFpahEx9UlUfOhYznIaJBHKAbmD86vO8D9gjW
         hbTzMywGKfc5142bxSp8+CKOk+zrz2lCn3l7X1ltMDfbDCbQow65cXIMp1vOJYxjGh4u
         wApZ2aX/WzHbv2Tx6FUiiXpZUVScY6FX+kVjtWG+iGhPoysVdt1z8YCQm0e5GMoe8tpF
         dJn7aJ/92C2WXAL2xRIKmS3Tjiv4CzEqc83fF9JaoKSGm8M2LFeWSEDNwsCg46v+n2Rz
         o+ok4U7iN83/jquRfOaOJ8dQHN713fE3u4Zsu0j3sZt6uCftmfj3Kceqyfr4gVedSENw
         +rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pNVoDDa73nLv4JDe00OIrDQno9iqywhjci+yCQnsgFM=;
        b=c6wb6w6Xig/OX6tINIzN4wx7RJoC86p9CzmAVcx2MoJuSBIxN4TzqX+pzcbA8Zvpmn
         QxEnJuwpwhpDq8b/RKKlbqeSt/odNpTcuopUoaDtFOp4KXPmq/8Bzz4/uE8SBcKFLaiS
         1XnCN9rePrNOmxh1G/NQ0RrGYhxa+vIvjHfKCj02JUAqEGD4J2o8cZiKIrQmaDo7D30i
         jum9xg+MBMXiEK5JfDswAGZeY9pMAT8SjWH2IJHikz0k7bbNWXRxJKTzgENfpw1yNBWG
         3z4NoQZEsjgb7+xABKfMu9viQCO+2+tTP9dG0HCywxCHhV1AnMWc+RRmJVZnAkNVKroM
         sU5Q==
X-Gm-Message-State: AOAM531tZC8QIq2i61UFKI+O4Iyn4EXYeICj0UBn6H1C+zUv1RHTY6ts
        /nIp+gtjiHCJr46Up96oBJ41BJmH+LGQmOKu
X-Google-Smtp-Source: ABdhPJzGN/BdbHToPVEP3Bq5YaaCW7Rm5XJzg8OCwOnaScyigFfzB88+QpaFm1QnzMtleDWBxdP/AA==
X-Received: by 2002:a05:6402:10c6:: with SMTP id p6mr2804428edu.76.1601311498558;
        Mon, 28 Sep 2020 09:44:58 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id nh1sm1912594ejb.21.2020.09.28.09.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 09:44:58 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/3] venus: vdec: Make decoder return LAST flag for sufficient event
Date:   Mon, 28 Sep 2020 19:44:30 +0300
Message-Id: <20200928164431.21884-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928164431.21884-1-stanimir.varbanov@linaro.org>
References: <20200928164431.21884-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the decoder to behaives equally for sufficient and
insufficient events. After this change the LAST buffer flag will be set
when the new resolution (in dynamic-resolution-change state) is smaller
then the old bitstream resolution.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 41 ++++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index c11bdf3ca21b..c006401255dc 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -634,6 +634,7 @@ static int vdec_output_conf(struct venus_inst *inst)
 {
 	struct venus_core *core = inst->core;
 	struct hfi_enable en = { .enable = 1 };
+	struct hfi_buffer_requirements bufreq;
 	u32 width = inst->out_width;
 	u32 height = inst->out_height;
 	u32 out_fmt, out2_fmt;
@@ -709,6 +710,22 @@ static int vdec_output_conf(struct venus_inst *inst)
 	}
 
 	if (IS_V3(core) || IS_V4(core)) {
+		ret = venus_helper_get_bufreq(inst, HFI_BUFFER_OUTPUT, &bufreq);
+		if (ret)
+			return ret;
+
+		if (bufreq.size > inst->output_buf_size)
+			return -EINVAL;
+
+		if (inst->dpb_fmt) {
+			ret = venus_helper_get_bufreq(inst, HFI_BUFFER_OUTPUT2, &bufreq);
+			if (ret)
+				return ret;
+
+			if (bufreq.size > inst->output2_buf_size)
+				return -EINVAL;
+		}
+
 		if (inst->output2_buf_size) {
 			ret = venus_helper_set_bufsize(inst,
 						       inst->output2_buf_size,
@@ -1327,19 +1344,15 @@ static void vdec_event_change(struct venus_inst *inst,
 	dev_dbg(dev, VDBGM "event %s sufficient resources (%ux%u)\n",
 		sufficient ? "" : "not", ev_data->width, ev_data->height);
 
-	if (sufficient) {
-		hfi_session_continue(inst);
-	} else {
-		switch (inst->codec_state) {
-		case VENUS_DEC_STATE_INIT:
-			inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
-			break;
-		case VENUS_DEC_STATE_DECODING:
-			inst->codec_state = VENUS_DEC_STATE_DRC;
-			break;
-		default:
-			break;
-		}
+	switch (inst->codec_state) {
+	case VENUS_DEC_STATE_INIT:
+		inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
+		break;
+	case VENUS_DEC_STATE_DECODING:
+		inst->codec_state = VENUS_DEC_STATE_DRC;
+		break;
+	default:
+		break;
 	}
 
 	/*
@@ -1348,7 +1361,7 @@ static void vdec_event_change(struct venus_inst *inst,
 	 * itself doesn't mark the last decoder output buffer with HFI EOS flag.
 	 */
 
-	if (!sufficient && inst->codec_state == VENUS_DEC_STATE_DRC) {
+	if (inst->codec_state == VENUS_DEC_STATE_DRC) {
 		struct vb2_v4l2_buffer *last;
 		int ret;
 
-- 
2.17.1

