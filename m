Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97912DF4A9
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 10:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbgLTJeS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 04:34:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727418AbgLTJeQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 04:34:16 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1562EC0611E4
        for <linux-media@vger.kernel.org>; Sun, 20 Dec 2020 01:32:57 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id i24so6746757edj.8
        for <linux-media@vger.kernel.org>; Sun, 20 Dec 2020 01:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=flHi69N3bIoMbwYxkKr1cV0kS4hH3i/8NcXPvU/7pKU=;
        b=f1sYNLjLN1NrdLn3Tep0+1IOr4uhU/P8+ZNbmSQnTym4qb3SaU5ZP/utbB58d0Akar
         e01qnrKcuBI3z0RUxBQILcHaLAXSryj6b5cKHkqk7N+G4h69Wd7Akquz3pOzUm+2UyLe
         SmXzrAs6bi/9lUrZf/IpC1dsMLw3K6jBQBcpXA8Ae3ndiDcGGmhDtxTnizvIpJ4JRcrd
         qQFH9YA8DXncWd4pcIbns95PV6klwqTr9bdFKb9gQ01cRW2urKRIJrczDXybIXF1ZISe
         d9Nmm1yMWbsTGTxEniqzW6QrRw3uJSOHchPKDNXyWaAB28TTI1Sf/u+IBOYL46tXzxMv
         jvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=flHi69N3bIoMbwYxkKr1cV0kS4hH3i/8NcXPvU/7pKU=;
        b=I8GMASbu92X1rMP6r9mt4S8i/P1MC+HQEx3Lc/i8XpyH9+urz5/fnZgSNpYZm28TFk
         uat5vPG12AadpRyRhC3E/6v2wkvLUlkxb5tUD5Ie7WBFBktwXfNvd7NAJWrzuO3PBhi4
         j1MWDQPYFmxzt9IirnxtbvL+phROt8Ne58+BSXhXftSWi+uNgZG92KO5RRQgfGClsUrJ
         YmSHvfuTkhOaFkABucgje7mxBQ3xzndtiZPg1b2vP3DJTOKda3eoJ/6PBTjrw4VCM3il
         h1Eu7a1+IEwo+HONrD8H+kYAo0p8gjloMLs0MeaVxxJ/CBVXTbIGGAOvNka5V7shoJVr
         Lg0g==
X-Gm-Message-State: AOAM532naVwxSrnEwNP2pC4Ph3fTNv12N/gG5+nHMiCo4e2/qF6HykDt
        NOlrapsJokMv5HjS5fXAQ0CdZIHl0GXzTlJB
X-Google-Smtp-Source: ABdhPJxxHxpfuA34Yv9hx/efz1jEeHHdFa3F0L0hcGzWmE3Yi5R8w6+lZekOETqkO4kGPGJ1O0VuNw==
X-Received: by 2002:a05:6402:3192:: with SMTP id di18mr11659143edb.332.1608456775650;
        Sun, 20 Dec 2020 01:32:55 -0800 (PST)
Received: from localhost.localdomain (hst-221-118.medicom.bg. [84.238.221.118])
        by smtp.gmail.com with ESMTPSA id z12sm7769814ejr.17.2020.12.20.01.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 01:32:55 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     vgarodia@codeaurora.org, acourbot@chromium.org,
        Fritz Koenig <frkoenig@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 4/5] media: venus: preserve DRC state across seeks
Date:   Sun, 20 Dec 2020 11:31:29 +0200
Message-Id: <20201220093130.10177-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201220093130.10177-1-stanimir.varbanov@linaro.org>
References: <20201220093130.10177-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Alexandre Courbot <acourbot@chromium.org>

DRC events can happen virtually at anytime, including when we are
starting a seek. Should this happen, we must make sure to return to the
DRC state, otherwise the firmware will expect buffers of the new
resolution whereas userspace will still work with the old one.

Returning to the DRC state upon resume for seeking makes sure that the
client will get the DRC event and will reallocate the buffers to fit the
firmware's expectations.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---

No changes since v1.

 drivers/media/platform/qcom/venus/vdec.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 9f2c7b3e7d4c..d27f4fd0ca01 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -987,7 +987,10 @@ static int vdec_start_output(struct venus_inst *inst)
 
 	if (inst->codec_state == VENUS_DEC_STATE_SEEK) {
 		ret = venus_helper_process_initial_out_bufs(inst);
-		inst->codec_state = VENUS_DEC_STATE_DECODING;
+		if (inst->next_buf_last)
+			inst->codec_state = VENUS_DEC_STATE_DRC;
+		else
+			inst->codec_state = VENUS_DEC_STATE_DECODING;
 		goto done;
 	}
 
@@ -1093,8 +1096,10 @@ static int vdec_stop_capture(struct venus_inst *inst)
 		ret = hfi_session_flush(inst, HFI_FLUSH_ALL, true);
 		fallthrough;
 	case VENUS_DEC_STATE_DRAIN:
-		vdec_cancel_dst_buffers(inst);
 		inst->codec_state = VENUS_DEC_STATE_STOPPED;
+		fallthrough;
+	case VENUS_DEC_STATE_SEEK:
+		vdec_cancel_dst_buffers(inst);
 		break;
 	case VENUS_DEC_STATE_DRC:
 		ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, true);
@@ -1116,6 +1121,7 @@ static int vdec_stop_output(struct venus_inst *inst)
 	case VENUS_DEC_STATE_DECODING:
 	case VENUS_DEC_STATE_DRAIN:
 	case VENUS_DEC_STATE_STOPPED:
+	case VENUS_DEC_STATE_DRC:
 		ret = hfi_session_flush(inst, HFI_FLUSH_ALL, true);
 		inst->codec_state = VENUS_DEC_STATE_SEEK;
 		break;
@@ -1389,6 +1395,7 @@ static void vdec_event_change(struct venus_inst *inst,
 			dev_dbg(dev, VDBGH "flush output error %d\n", ret);
 	}
 
+	inst->next_buf_last = true;
 	inst->reconfig = true;
 	v4l2_event_queue_fh(&inst->fh, &ev);
 	wake_up(&inst->reconf_wait);
-- 
2.17.1

