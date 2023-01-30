Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74EDC680B5A
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 11:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236267AbjA3KzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 05:55:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236522AbjA3KzB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 05:55:01 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A51C2E0EE
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 02:54:58 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id p26so19283666ejx.13
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 02:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RM8U9+B1EhA1/hpyYh3BZmmd/DRaMkOQKBIReWojWE0=;
        b=cv3yc3hLcy6abkqAAPYgBfLHXl8MIBezAIwxfl/w8Upau1eWpjL9jI1fTECoYetQw7
         zjH6xrm8Zuoqaxs2WOtTBMxkQhiJH5rD1ya08Bgo3+kmMci6LRh921yjnkEL0D7U0pXT
         dksHktrE0uY+nXnRjuXRMB3syKpjMCHDJy9nevYNmrsBZpMN6ICpU1Pu7gcy5dxWKW0H
         aAIWgE3YSlxn5d8LprOMj/Kz/gs0cLLghtQISOqs6ZMSy2qx4yctPZNRpFCWSsQJWBA0
         NpPmZYNgXahi/0pjV3hO/1UF4wreVE0Hc2CW7Q4CMXCPiVKhgoeqPn1vNz26LHqOYXsl
         0rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RM8U9+B1EhA1/hpyYh3BZmmd/DRaMkOQKBIReWojWE0=;
        b=yGwSg0wgrfbwoWliHUZ2gBgWmGJd8Fg1VsoeTPKYOlgMcUXkdS+MoK1TBW7HxXVMWc
         Zmluxd2MKSiKdqiLomfz1sxNJfGiK6v2dm9b1bcrv7vl5S5DGxdtssQ/LoYvStprUWaQ
         Fp5LCaoryzcxzLAiiTAkIDmdYOxYdlRDITvu7BXVIBsw8U/WjAu8CCSZVmrXBV5Q2Lp1
         Y1+ANCrYP3BjwMGDGw9KmET5NMDUacihvlgUoSE5GSvgyo6B8vQSBFprYAUonrWoT2du
         7F61UK22QV9ZdvLmMADuG8MPX8qjSMW0Qhlf1TK9RF4sj9lnxFo7J++3RVypwN8YbPdm
         h0xg==
X-Gm-Message-State: AFqh2kpmQ+g4B8dvlm3A024v39aNqOouXmR0wviG/eQc5hxYnyAoEKdh
        6kjzl4edurVYqhOYrTyBbLWOwA==
X-Google-Smtp-Source: AMrXdXvwt9D641Ii6B8VTtLcYp+/Pqtgi0XOcjujklWNr3DjsMFgPwyOH41jdBeSf3vl2jq1HPfbrg==
X-Received: by 2002:a17:907:6c16:b0:86f:3dfa:4016 with SMTP id rl22-20020a1709076c1600b0086f3dfa4016mr58255800ejc.7.1675076096407;
        Mon, 30 Jan 2023 02:54:56 -0800 (PST)
Received: from mikrawczyk.c.googlers.com.com (12.196.204.35.bc.googleusercontent.com. [35.204.196.12])
        by smtp.gmail.com with ESMTPSA id d20-20020a17090694d400b00887830e535csm2054742ejy.159.2023.01.30.02.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 02:54:55 -0800 (PST)
From:   "=?UTF-8?q?Micha=C5=82=20Krawczyk?=" <mk@semihalf.com>
X-Google-Original-From: =?UTF-8?q?Micha=C5=82=20Krawczyk?= <mk@semmihalf.com>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Micha=C5=82=20Krawczyk?= <mk@semihalf.com>
Subject: [PATCH] media: venus: dec: Fix handling of the start cmd
Date:   Mon, 30 Jan 2023 10:54:23 +0000
Message-Id: <20230130105423.1338554-1-mk@semmihalf.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Michał Krawczyk <mk@semihalf.com>

The decoder driver should clear the last_buffer_dequeued flag of the
capture queue upon receiving V4L2_DEC_CMD_START.

The last_buffer_dequeued flag is set upon receiving EOS (which always
happens upon receiving V4L2_DEC_CMD_STOP).

Without this patch, after issuing the V4L2_DEC_CMD_STOP and
V4L2_DEC_CMD_START, the vb2_dqbuf() function will always fail, even if
the buffers are completed by the hardware.

Fixes: beac82904a87 ("media: venus: make decoder compliant with stateful codec API")

Signed-off-by: Michał Krawczyk <mk@semihalf.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4ceaba37e2e5..175488ea08ff 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -526,6 +526,7 @@ static int
 vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 {
 	struct venus_inst *inst = to_inst(file);
+	struct vb2_queue *dst_vq;
 	struct hfi_frame_data fdata = {0};
 	int ret;
 
@@ -556,6 +557,13 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 			inst->codec_state = VENUS_DEC_STATE_DRAIN;
 			inst->drain_active = true;
 		}
+	} else if (cmd->cmd == V4L2_DEC_CMD_START &&
+		   inst->codec_state == VENUS_DEC_STATE_STOPPED) {
+		dst_vq = v4l2_m2m_get_vq(inst->fh.m2m_ctx,
+					 V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+		vb2_clear_last_buffer_dequeued(&inst->fh.m2m_ctx->cap_q_ctx.q);
+
+		inst->codec_state = VENUS_DEC_STATE_DECODING;
 	}
 
 unlock:
-- 
2.39.1.456.gfc5497dd1b-goog

