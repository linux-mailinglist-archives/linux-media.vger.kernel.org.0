Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3ACE59C4C
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 15:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfF1NAv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 09:00:51 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39884 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727270AbfF1NAr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 09:00:47 -0400
Received: by mail-wm1-f66.google.com with SMTP id z23so8905226wma.4
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 06:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TR1Hba1QrF3cEEzn3qEIOV5K3aBhII0u0pIDhReHlh8=;
        b=e3FyYuBcdyXCr8tu+V0BBik4G4XLrsxKndZgWReb+1PpRb/aflqYGdutUkHLDdDfUc
         AVhy23fH93ft+4qxhOqwdArNyvPo3J1MoptKwut8Co9GeAHKqXwYmwLgyENX1OZoa4WY
         TOSAxwubfjnPI/DAdnpof0CnFnwOe12Xo1caJBzO4B2x+Dd4BWQEK9OWS1rCd59KbZ8o
         TRezmk0HKVUWy5gAyapLOBLhKvllCUbuCSoedmO2IOLAcCxXvt8UkoD7k1mJGrNUBulb
         w4d7uIAdx8yAZXWC9+rtNDwM08d2TQgoTe8e+aBC6qX7Y/ibf4fYTj+cwiL5Qn6agOfm
         /Hpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TR1Hba1QrF3cEEzn3qEIOV5K3aBhII0u0pIDhReHlh8=;
        b=JxAC2OA1xoh47YXBHFSf6NSEQhD175MsgKIzcaHlGbym3Vs3+JMrJ1NmEE3fbNGO4n
         PSGYaNeyOGA51ahA3rNiVV6ELXSLipA6BWSgznZ5bJ4MB5vhHoslfWWG9bKg3NKE/IzX
         mri5S4IPiPWS76m2y6ekbHBr1G/3HykHVs1FUT1onUy/zlTgp/OfmB+PnYqe/+ZJcUHR
         hDSs282CS+HOJhGYJ3uIC0lBXdPeqRd5LOo5+f5fXMFJLWsVBQsiXaDEiBThYBjLtvZ/
         zVcrpZqIz5dNFMzk3PGwTe4gY1xZ0yTbLScqwYgizWyCGCbIL8ItHPwIBhCCh1gW/xk1
         XZFg==
X-Gm-Message-State: APjAAAVw7xle6gsHO/kJRBPKVy4zi6VWHi3+0EKMgm/h89Zu0kCDU0Fy
        DUPceE4DYCBYWBj11r4lnVq5kSpNaNM=
X-Google-Smtp-Source: APXvYqzy3/dCPyQLpnS6kdYiaqXA2xm79CQwSoNVqokTq4OlM2hvmgufVAd/exldwuS/K5iGRWkTgg==
X-Received: by 2002:a1c:1a06:: with SMTP id a6mr7224331wma.128.1561726844493;
        Fri, 28 Jun 2019 06:00:44 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id w20sm3717174wra.96.2019.06.28.06.00.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 06:00:43 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 11/11] venus: dec: populate properly timestamps and flags for capture buffers
Date:   Fri, 28 Jun 2019 16:00:02 +0300
Message-Id: <20190628130002.24293-12-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
References: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cache flags, timestamps and timecode structure of OUTPUT buffers
in per-instance structure array and fill correctly the same when
the CAPTURE buffers are done.

This will make v4l2-compliance decoder streaming test happy.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h    |  8 +++
 drivers/media/platform/qcom/venus/helpers.c | 54 +++++++++++++++++++++
 drivers/media/platform/qcom/venus/helpers.h |  2 +
 drivers/media/platform/qcom/venus/vdec.c    |  2 +
 4 files changed, 66 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 139b5d786375..5c6d4145138d 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -220,6 +220,13 @@ enum venus_dec_state {
 	VENUS_DEC_STATE_DRC		= 7
 };
 
+struct venus_ts_metadata {
+	bool used;
+	u64 ts_ns;
+	u64 ts_us;
+	u32 flags;
+	struct v4l2_timecode tc;
+};
 
 /**
  * struct venus_inst - holds per instance parameters
@@ -305,6 +312,7 @@ struct venus_inst {
 	wait_queue_head_t reconf_wait;
 	unsigned int subscriptions;
 	int buf_count;
+	struct venus_ts_metadata tss[VIDEO_MAX_FRAME];
 	u64 fps;
 	struct v4l2_fract timeperframe;
 	const struct venus_format *fmt_out;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index c948c4e809b5..b42a1fce273a 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -463,6 +463,57 @@ static void return_buf_error(struct venus_inst *inst,
 	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
 }
 
+static void
+put_ts_metadata(struct venus_inst *inst, struct vb2_v4l2_buffer *vbuf)
+{
+	struct vb2_buffer *vb = &vbuf->vb2_buf;
+	unsigned int i;
+	int slot = -1;
+	u64 ts_us = vb->timestamp;
+
+	for (i = 0; i < ARRAY_SIZE(inst->tss); i++) {
+		if (!inst->tss[i].used) {
+			slot = i;
+			break;
+		}
+	}
+
+	if (slot == -1) {
+		dev_dbg(inst->core->dev, "%s: no free slot\n", __func__);
+		return;
+	}
+
+	do_div(ts_us, NSEC_PER_USEC);
+
+	inst->tss[slot].used = true;
+	inst->tss[slot].flags = vbuf->flags;
+	inst->tss[slot].tc = vbuf->timecode;
+	inst->tss[slot].ts_us = ts_us;
+	inst->tss[slot].ts_ns = vb->timestamp;
+}
+
+void venus_helper_get_ts_metadata(struct venus_inst *inst, u64 timestamp_us,
+				  struct vb2_v4l2_buffer *vbuf)
+{
+	struct vb2_buffer *vb = &vbuf->vb2_buf;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(inst->tss); ++i) {
+		if (!inst->tss[i].used)
+			continue;
+
+		if (inst->tss[i].ts_us != timestamp_us)
+			continue;
+
+		inst->tss[i].used = false;
+		vbuf->flags |= inst->tss[i].flags;
+		vbuf->timecode = inst->tss[i].tc;
+		vb->timestamp = inst->tss[i].ts_ns;
+		break;
+	}
+}
+EXPORT_SYMBOL(venus_helper_get_ts_metadata);
+
 static int
 session_process_buf(struct venus_inst *inst, struct vb2_v4l2_buffer *vbuf)
 {
@@ -487,6 +538,9 @@ session_process_buf(struct venus_inst *inst, struct vb2_v4l2_buffer *vbuf)
 
 		if (vbuf->flags & V4L2_BUF_FLAG_LAST || !fdata.filled_len)
 			fdata.flags |= HFI_BUFFERFLAG_EOS;
+
+		if (inst->session_type == VIDC_SESSION_TYPE_DEC)
+			put_ts_metadata(inst, vbuf);
 	} else if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		if (inst->session_type == VIDC_SESSION_TYPE_ENC)
 			fdata.buffer_type = HFI_BUFFER_OUTPUT;
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index f2e111555bd9..791c35c64ca3 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -63,4 +63,6 @@ int venus_helper_unregister_bufs(struct venus_inst *inst);
 int venus_helper_load_scale_clocks(struct venus_core *core);
 int venus_helper_process_initial_cap_bufs(struct venus_inst *inst);
 int venus_helper_process_initial_out_bufs(struct venus_inst *inst);
+void venus_helper_get_ts_metadata(struct venus_inst *inst, u64 timestamp_us,
+				  struct vb2_v4l2_buffer *vbuf);
 #endif
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 336d49132d19..0b7d65db5cdc 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1135,6 +1135,8 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 		vbuf->sequence = inst->sequence_out++;
 	}
 
+	venus_helper_get_ts_metadata(inst, timestamp_us, vbuf);
+
 	if (hfi_flags & HFI_BUFFERFLAG_READONLY)
 		venus_helper_acquire_buf_ref(vbuf);
 
-- 
2.17.1

