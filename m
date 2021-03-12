Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4503A3394EF
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbhCLRaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:30:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232867AbhCLR3i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:38 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1B67C061574
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:37 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so12671267wmj.2
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ougCNlrbgb2ZXt+39o0iaCSMx7oFooc901KKp5lUaLE=;
        b=c0Y5NkwJz7kyCDJwHHk0VCXWQlUkjJWdjFsk8owQiLrZOoiQYwu5c97yyJzRe0PlAN
         nWF5vO7X7Aq1oo6uo1JpI8SfUXbMsWvbmurH/40oReBvsIj1YWlmlM2njkXwZ5WRzHtS
         VAMDKGHVEE/W2iyVHbW6VfentILYj+hxt8hcWgzacsJvx97GyBblW8Fm829ZARRyox84
         EZTFHZu1Ftu1Rym4O+bj7OpcDv1w5fYWV6yFK8p15j52opCQs+DPpnS1qFs0Ac+X8I9Y
         2o0DWfoarO4qxXFbw6JVSrDLIF5kIdzrZB3uRr6mah79YV9SKuczXegC2s4PMFvnkFr1
         w0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ougCNlrbgb2ZXt+39o0iaCSMx7oFooc901KKp5lUaLE=;
        b=ZcdqIm40xWqqIWODuCYWjFSG5mXzu05ph8gTPUmlNhy7WCOtYbD44Ah/UbDC3t5enL
         WkmqbkziclXI4xD5RIrQilaho5rR84q7sNxd/GiH+Gi5LOE/7aJqYnJV/QxBtEYyvOzB
         QeDxmdl+6K142VuAtWgK/GiE0CfoInwo7gBL96ICthB2i9Uq24XSSqlF3mwUc4M2MYWc
         vTK2xFo+/piE0PZV0qfHWjFNpcGkX2cD3kewkmMVEz6x8XXSMDYjbeTlO/Yuf5g5U9eI
         CNCHwCEJg5zDm5hE18d4kwazeLuZh1ahAyZTPEdDfPQqiEe86LKBOAX17uCQmDxy4PjY
         t/ng==
X-Gm-Message-State: AOAM531dsXVp0dcINPyttBVFZyujs6KgOHo3KmDt+rQa6Lr3xHIJ2o5F
        uuTNOWvfATFlEDThbDNgPGsgrQ==
X-Google-Smtp-Source: ABdhPJwzRBW1snNLri8JYrWLmFJFoORT0KxsMxWIa8vQLvNhvSCkSP/7ag4R126+OyAv23dwBrL20A==
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr14209387wmc.168.1615570176757;
        Fri, 12 Mar 2021 09:29:36 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:36 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 25/25] media: venus: vdec: Fix decoder cmd STOP issue
Date:   Fri, 12 Mar 2021 17:30:39 +0000
Message-Id: <20210312173039.1387617-26-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
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

