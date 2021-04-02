Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C956D35297C
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235176AbhDBKFr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235087AbhDBKFo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:44 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79BABC061788
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:43 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id k8so4317747wrc.3
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mdYuWwgCAgpe/tpCk/WPHQPCQeWl/PCSYj7cNktgbbg=;
        b=IQjVngtaEmv8R+bycJCfbeb4LCx60QpT0m+RAJ7LHyxaDRtdLhSMJhkSHcwO4e8XgA
         qr/emy+/hycZKPNrpCfCLWFZ7C2KdgVGXEoJTuuISSotKViPbeDBZ21AmWYhZ+45p0vq
         a+wo97dJNDZqIuflUgjpLT1sAu3WZT0y64ZyuweW5oyW3SFNCjLMrfX2hqf2zeOMkR3b
         K0Vo7cD7WjFu46mC7zjzgnj9GjBsDSMyX9rXFf1FTmKe3ltntKD0T10mu3Cw/5g5b2W8
         9lSL+1di3+oO+MKHIDOmaDQKTqpfstQXJH0vJD3oty4AfqU/WXthLzC8A5YcYrGHk/U6
         /pZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mdYuWwgCAgpe/tpCk/WPHQPCQeWl/PCSYj7cNktgbbg=;
        b=mRwxNy6VLBX1rH4vyVZVzK/K561pQSOoVLjdfOed0Q9UFO3qG3zevjEdFM/6oOEYsN
         rWY5qvgNvpxBKCUlXTIRj5QPTzpPVvYjjDQBLFkfX/R1JyC18mIUAJofNHAsp4WfY5/T
         awoZHzrIDW1fUnXmbzeiJjk4NNngQNVlSbu6f69YsxSHF5kbaWiRYLf3xbZ7B3o5wM0n
         Xvb4Y9IC6Q9KP3TJc6eEfp/4QLqKWLyxPz/lV8ssWzLm1L853PhABn5lfZgpiE5motzk
         ra1lO3XTI9YrKW1iVpyxrDsrP6WsaH5LV8RRPbtuIcld2HE0LwJOCiMgcKHv36SQXMZD
         mnNA==
X-Gm-Message-State: AOAM5327ulI7ZBL70naGlWnQGE8+SjWJTyZGmDR/NwifC+bsc/6S4fX6
        sgPLrFkt482LQDMdzGBAZJS92g==
X-Google-Smtp-Source: ABdhPJzBaRKTuvXu72RbacAbK15IHL4Zj8LyA1VmGP4kKBs0i+dJ6YN2hBwFe6gky8aamXoVR1RB6A==
X-Received: by 2002:a05:6000:1acd:: with SMTP id i13mr14378546wry.48.1617357942265;
        Fri, 02 Apr 2021 03:05:42 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:41 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 25/25] media: venus: vdec: Fix decoder cmd STOP issue
Date:   Fri,  2 Apr 2021 11:06:48 +0100
Message-Id: <20210402100648.1815854-26-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Fixes an issue when issuing a stop command to the controller, negating the
following firmware error.

"SFR message from FW: Exception: TID = Unknown IP = 0x3b7dc FA = 0x0
 cause = 0x6"

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 2 +-
 drivers/media/platform/qcom/venus/vdec.c     | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 0bcd434e7876..fb64046d1e35 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -254,7 +254,7 @@ int pkt_session_unset_buffers(struct hfi_session_release_buffer_pkt *pkt,
 int pkt_session_etb_decoder(struct hfi_session_empty_buffer_compressed_pkt *pkt,
 			    void *cookie, struct hfi_frame_data *in_frame)
 {
-	if (!cookie || !in_frame->device_addr)
+	if (!cookie)
 		return -EINVAL;
 
 	pkt->shdr.hdr.size = sizeof(*pkt);
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 0fe4863371e2..04f457cbf631 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -515,7 +515,10 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 
 		fdata.buffer_type = HFI_BUFFER_INPUT;
 		fdata.flags |= HFI_BUFFERFLAG_EOS;
-		fdata.device_addr = 0xdeadb000;
+		if (IS_V6(inst->core))
+			fdata.device_addr = 0;
+		else
+			fdata.device_addr = 0xdeadb000;
 
 		ret = hfi_session_process_buf(inst, &fdata);
 
-- 
2.30.1

