Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E85B321C55
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhBVQFi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:05:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbhBVQE2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:04:28 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C742C061D7E
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:02:00 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id m1so14869184wml.2
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a+OrwHZbF+yZUUA/s5BETsaXgiYWfCnPM+gSTxwgLG0=;
        b=xkrMZEj8y98zWaYE/wurKOQrzN+pn0UsJTAiNQN4gimqUdIYemYiAtG0TMyP3boSUt
         y8GPHQ0jIv6zxHpJW9CrFLmws1YKmq20vF0Rzjwb28jrCkgCuGseGK8Xs03Fok0FKJb/
         elZIX4PgwkWRmxrA0DNRC5TJF1ZqLRjwhcBsOcI3KuSG3Qi+rukT1UR9aUvFW5vG1EuX
         1G+1gaUtroYdK8mDAWZfvr4gfIyp8RF+4K1L+BWI33hIpjJ/IjSjFwLuU3JjdBlHUb7q
         RCjViyMgBPqohxi055C0g0JoRwxKSRlq4kFmsXGdYeWT31UogmyAn0oGCGlFURJ8RA55
         nJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a+OrwHZbF+yZUUA/s5BETsaXgiYWfCnPM+gSTxwgLG0=;
        b=LPG36LGL/+z4vGYEuPQcqW/0GHvLhZu9+ig+siNdub4+8GIpTsX4LKNCTX5Wt6SQOY
         Fcq5tw7gJcMkdzA8VJtQgjxDGX34cnbi75GXLKH+vTEzYz2z+Df2IYhW4eZJIzubgGuV
         gwk+YF6XDcWjLmemFGVDzw2smLDCZCDZXhmQbp5+rOwQHukwcito0x3zp4z6pcrx9c5N
         GKTG7T8Rkdu1hDOWAUGJK6XqCzIh1k5wpTOZWX/EBxfE8MVV2ZQfsmtx/0QUj/KWVzG4
         GPb6HSxxGwE1YFvXEHoxkzjFqTxlekyDrjKwrlVMxLy7Rt1kYOnLSDe+t8D2mD2GH/D6
         lNMA==
X-Gm-Message-State: AOAM533bMfUGyWXUnsv2YJ07j23ZWngqHMU+/YthjHt4vmABtPx5RlrX
        CfDFIt+jeawgBS5cGGyWa36EZg==
X-Google-Smtp-Source: ABdhPJyW9m03DbV76bt0ZH6hIrqSjB1KCpBPJ2Sznl8fpUQ+Dlz1OztLSXBBYudd5nniKNaMvd3vPw==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr20661700wmr.179.1614009719318;
        Mon, 22 Feb 2021 08:01:59 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:58 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 22/25] media: venus: helpers, hfi, vdec: Set actual plane constraints to FW
Date:   Mon, 22 Feb 2021 16:02:57 +0000
Message-Id: <20210222160300.1811121-23-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Set actual plane alignments to FW with
HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO to calculate
correct buffer size.

bod: Fixed fall-through error in pkt_session_set_property_6xx() switch

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c  | 21 ++++++++++++++++++++
 drivers/media/platform/qcom/venus/helpers.h  |  1 +
 drivers/media/platform/qcom/venus/hfi_cmds.c | 13 ++++++++++++
 drivers/media/platform/qcom/venus/vdec.c     |  4 ++++
 4 files changed, 39 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index f0413236a56f..49c52ef1084a 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1113,6 +1113,27 @@ int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode)
 }
 EXPORT_SYMBOL_GPL(venus_helper_set_work_mode);
 
+int venus_helper_set_format_constraints(struct venus_inst *inst)
+{
+	const u32 ptype = HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO;
+	struct hfi_uncompressed_plane_actual_constraints_info pconstraint;
+
+	pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
+	pconstraint.num_planes = 2;
+	pconstraint.plane_format[0].stride_multiples = 128;
+	pconstraint.plane_format[0].max_stride = 8192;
+	pconstraint.plane_format[0].min_plane_buffer_height_multiple = 32;
+	pconstraint.plane_format[0].buffer_alignment = 256;
+
+	pconstraint.plane_format[1].stride_multiples = 128;
+	pconstraint.plane_format[1].max_stride = 8192;
+	pconstraint.plane_format[1].min_plane_buffer_height_multiple = 16;
+	pconstraint.plane_format[1].buffer_alignment = 256;
+
+	return hfi_session_set_property(inst, ptype, &pconstraint);
+}
+EXPORT_SYMBOL_GPL(venus_helper_set_format_constraints);
+
 int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
 			      unsigned int output_bufs,
 			      unsigned int output2_bufs)
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 351093845499..98106e6eee85 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -33,6 +33,7 @@ int venus_helper_set_output_resolution(struct venus_inst *inst,
 				       unsigned int width, unsigned int height,
 				       u32 buftype);
 int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
+int venus_helper_set_format_constraints(struct venus_inst *inst);
 int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
 			      unsigned int output_bufs,
 			      unsigned int output2_bufs);
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 4f7565834469..cc282b0df8c3 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -1249,6 +1249,19 @@ pkt_session_set_property_6xx(struct hfi_session_set_property_pkt *pkt,
 	pkt->data[0] = ptype;
 
 	switch (ptype) {
+	case HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO: {
+		struct hfi_uncompressed_plane_actual_constraints_info *in = pdata;
+		struct hfi_uncompressed_plane_actual_constraints_info *info = prop_data;
+
+		info->buffer_type = in->buffer_type;
+		info->num_planes = in->num_planes;
+		info->plane_format[0] = in->plane_format[0];
+		if (in->num_planes > 1)
+			info->plane_format[1] = in->plane_format[1];
+
+		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*info);
+		break;
+	}
 	case HFI_PROPERTY_CONFIG_HEIC_FRAME_QUALITY: {
 		struct hfi_heic_frame_quality *in = pdata, *cq = prop_data;
 
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 84c16f33e01b..88ac40ce12e6 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -698,6 +698,10 @@ static int vdec_output_conf(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
+	ret = venus_helper_set_format_constraints(inst);
+	if (ret)
+		return ret;
+
 	if (inst->dpb_fmt) {
 		ret = venus_helper_set_multistream(inst, false, true);
 		if (ret)
-- 
2.29.2

