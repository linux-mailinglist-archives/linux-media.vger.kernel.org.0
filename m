Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF74F321C5C
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbhBVQF5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbhBVQEw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:04:52 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B58C0698C4
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:02:03 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id b3so19625009wrj.5
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mpQeOWIwxrnqUYF09ycSkk2SsgXNTv3iPduq13x2l1Y=;
        b=MRz/MQ+sZNM8+7X2P1PkePpVmdDMq+djL+3uq3107kAI7MSiYwyLyNeWIGYIigR/Nd
         Z3PORLom9TOIr8cvSACVQ9SbaCqqU2SoE22rMBpqps8qUxHHLsyBjsfuFNW8naJeLWaw
         RpNPpbweJh80yIwVzF6X8Sv8AT+UJJmmyuhYHCLnVK7kDFKnZmrCQHEaSuoksl04A4oh
         2KffzXxcKM0ZZ90Fs5XZzhXJwz8PkdwKdFzUCJZFP4VRoQGTUiz4aj35cJHlYt2WiCEx
         ZkRzsWKzuka8igwerHeq3yi6GMqX2Pw879+EDaizWjEB+dkECM4QIviktigMvCB0hPJk
         AO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mpQeOWIwxrnqUYF09ycSkk2SsgXNTv3iPduq13x2l1Y=;
        b=uDr0todgj4ROKhwethUX274SsflYJaEBFCBfga0mJQcMuDqDS7uw4kLVEHPz/f75Gb
         iDHURKlfnjNQ3cGjTYekmlI8nJUTc8WhVaO6xeCYeL+qk4Ga7vffrJm2Sv+qCslEDJ1+
         58xOz43QAV3mPr85VoN5vVV+TaL8ZmmnI+3OqNNtAyTHAEbRlO6gPX86C80EoTLlAKVl
         6/G3CThPggcQWgbkJQ9N9tPV79Y+oxyJFdG3fen7Fd3X5PmTBt/wzosHy+pfjZk8JhmL
         4ELaFw0caqV0/4vJJvYZKUz68cmTFgpHkdAFQXoYkbfcAt9W8oQ9lAPmqIwpAxnrFyT8
         BK/g==
X-Gm-Message-State: AOAM530AxSEj/MlsJQhnusnIDlgN54zwxtnLTPxqnYZY0peytXKav2fK
        E+94B7uEguwph5kUf5O4gT1O9A==
X-Google-Smtp-Source: ABdhPJwG6AJH4vVRD6OQKeKTxQDNn8aFd/KrY6Lakydrbc1lmxwYZWIp59hLD8s2EWtsTxXXL21sig==
X-Received: by 2002:adf:e585:: with SMTP id l5mr21667227wrm.85.1614009722745;
        Mon, 22 Feb 2021 08:02:02 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:02:02 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 25/25] media: venus: vdec: Fix decoder cmd STOP issue
Date:   Mon, 22 Feb 2021 16:03:00 +0000
Message-Id: <20210222160300.1811121-26-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
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
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 2 +-
 drivers/media/platform/qcom/venus/vdec.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index cc282b0df8c3..0a32bb44506c 100644
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
index 903443a7a757..9fbff40c4568 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -515,7 +515,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 
 		fdata.buffer_type = HFI_BUFFER_INPUT;
 		fdata.flags |= HFI_BUFFERFLAG_EOS;
-		fdata.device_addr = 0xdeadb000;
+		fdata.device_addr = 0;
 
 		ret = hfi_session_process_buf(inst, &fdata);
 
-- 
2.29.2

