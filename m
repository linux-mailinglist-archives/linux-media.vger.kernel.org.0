Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C77262DF4B1
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 10:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727550AbgLTJeb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 04:34:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727519AbgLTJea (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 04:34:30 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A000C0619D4
        for <linux-media@vger.kernel.org>; Sun, 20 Dec 2020 01:32:58 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id c7so6740699edv.6
        for <linux-media@vger.kernel.org>; Sun, 20 Dec 2020 01:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FN/bEnipr2y9sCYb7N5bkHhgN7bbMj0oywhCqcGevOA=;
        b=v8peECqPJNg/N1Yfh3YW+bJ2bILnI7awKKkhkrReWPnl/5fCBwvh+TNnZL67PVh4Kn
         XSAEFs4KQysDNHgmyqYGHyUw9GcCBRNi1aPsjDTCeVlZATkgeAjb+lT79oiyCzXQ/9cR
         xscBUogVFwPiyRmtTZVALTDMzdaDCcOASaVV16cYXs0Sev/lOcwrihNeYZz0iM6rlqMv
         bQdRfPQBffPJG8gSggx//jcGxC7PYp65g0iXUT5Uf6/wINmN4ZbWmA3a4eXu+qPI8nbT
         DfY0pWzvnr0zzb05kzuox4X9DfH5M7uCS7OBQf3tn+Sn1PPAhi/TBPLK/G0bft3s7/JR
         rdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FN/bEnipr2y9sCYb7N5bkHhgN7bbMj0oywhCqcGevOA=;
        b=AheTnc3uXNGe6dASHh4r8XlBW8bEPDkNSroq0hssrQJlYnwGl6T9DU9Clx5uUDpQTg
         zpyqcbjPv4Dmm4/ddlWapFnJh92dTFKg9z+CV6ZKKIuzR4xGkoK8u/WiPTO27e0pdYru
         hAPOTxL3hofc7x6m4hvqE9pBY7to5SD89r09bg5aMib5YruVNVhFFjItLCvnsKv/ojnk
         kVrhmcMOKito/xM5cXt2TyOiPr9tLkRSpa/vYdnwBmTsVnd6uDHSJgSUTwiJAokggkOk
         3bWSaeZqnL16C0ZtczxeRHTC+5pp15drquInON+ZiEr+aR0YXBomY1J5JC7wjcfeg+xf
         6udg==
X-Gm-Message-State: AOAM532s8jUn29eJL6yq1UbhvhiRWunvykJr3I0UzPSwOAkTn7AmZNzl
        KBkyHSJ7RIfbqgD7T+yQNtpoXebOTguYwmyp
X-Google-Smtp-Source: ABdhPJwIq0fpyvaSJl94muY+RZpxPYGkdSjzDhObLqGyYZFmguawYXQVibjrORbz3oIU2JcDnXSFEA==
X-Received: by 2002:a05:6402:2292:: with SMTP id cw18mr11885156edb.336.1608456777231;
        Sun, 20 Dec 2020 01:32:57 -0800 (PST)
Received: from localhost.localdomain (hst-221-118.medicom.bg. [84.238.221.118])
        by smtp.gmail.com with ESMTPSA id z12sm7769814ejr.17.2020.12.20.01.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 01:32:56 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     vgarodia@codeaurora.org, acourbot@chromium.org,
        Fritz Koenig <frkoenig@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 5/5] venus: vdec: Handle DRC after drain
Date:   Sun, 20 Dec 2020 11:31:30 +0200
Message-Id: <20201220093130.10177-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201220093130.10177-1-stanimir.varbanov@linaro.org>
References: <20201220093130.10177-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Fritz Koenig <frkoenig@chromium.org>

If the DRC is near the end of the stream the client
may send a V4L2_DEC_CMD_STOP before the DRC occurs.
V4L2_DEC_CMD_STOP puts the driver into the
VENUS_DEC_STATE_DRAIN state.  DRC must be aware so
that after the DRC event the state can be restored
correctly.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---

Changes since v2 (from Fritz):
 - moved state transition from vdec_event_notify to vdec_event_change. 

 drivers/media/platform/qcom/venus/core.h |  1 +
 drivers/media/platform/qcom/venus/vdec.c | 14 ++++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index db0e6738281e..765ab7ed881b 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -413,6 +413,7 @@ struct venus_inst {
 	unsigned int core_acquired: 1;
 	unsigned int bit_depth;
 	bool next_buf_last;
+	bool drain_active;
 };
 
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index d27f4fd0ca01..6cc35ffe2d6e 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -519,8 +519,10 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 
 		ret = hfi_session_process_buf(inst, &fdata);
 
-		if (!ret && inst->codec_state == VENUS_DEC_STATE_DECODING)
+		if (!ret && inst->codec_state == VENUS_DEC_STATE_DECODING) {
 			inst->codec_state = VENUS_DEC_STATE_DRAIN;
+			inst->drain_active = true;
+		}
 	}
 
 unlock:
@@ -969,9 +971,13 @@ static int vdec_start_capture(struct venus_inst *inst)
 
 	inst->codec_state = VENUS_DEC_STATE_DECODING;
 
+	if (inst->drain_active)
+		inst->codec_state = VENUS_DEC_STATE_DRAIN;
+
 	inst->streamon_cap = 1;
 	inst->sequence_cap = 0;
 	inst->reconfig = false;
+	inst->drain_active = false;
 
 	return 0;
 
@@ -1097,6 +1103,7 @@ static int vdec_stop_capture(struct venus_inst *inst)
 		fallthrough;
 	case VENUS_DEC_STATE_DRAIN:
 		inst->codec_state = VENUS_DEC_STATE_STOPPED;
+		inst->drain_active = false;
 		fallthrough;
 	case VENUS_DEC_STATE_SEEK:
 		vdec_cancel_dst_buffers(inst);
@@ -1296,8 +1303,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 
 			v4l2_event_queue_fh(&inst->fh, &ev);
 
-			if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
+			if (inst->codec_state == VENUS_DEC_STATE_DRAIN) {
+				inst->drain_active = false;
 				inst->codec_state = VENUS_DEC_STATE_STOPPED;
+			}
 		}
 
 		if (!bytesused)
@@ -1373,6 +1382,7 @@ static void vdec_event_change(struct venus_inst *inst,
 		inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
 		break;
 	case VENUS_DEC_STATE_DECODING:
+	case VENUS_DEC_STATE_DRAIN:
 		inst->codec_state = VENUS_DEC_STATE_DRC;
 		break;
 	default:
-- 
2.17.1

