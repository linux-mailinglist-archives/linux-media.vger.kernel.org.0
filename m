Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3B8D42203A
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233344AbhJEIND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 04:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233363AbhJEINC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 04:13:02 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFD1C061766
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 01:11:11 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id dj4so75681408edb.5
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 01:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F0rxTAIDQUC00gIGQ2hZRmANNTx894FvV5JJnWTgTsY=;
        b=ralaYkL5Xw7qbWeLgFH9tju3bNrClp1qrs40/XNH+JU1eDpEbbLPT2ItFrp/WwdzY7
         X86qpw1ZLWfkBOY0nbQkOvUh+gmdd390wSlCufXebSRTBfI0BXQOcXSzKoyrgD4WOWUw
         ETvXsXHT2FzybdlBglxdaHCP4Nx6aR1p3CZF9xsL5Ww1Vk0GE4vD3Xj89ZmXVfYg7pdM
         MPOEvzOkVtIvMzDrml3C1ZXf3VLfb4GQHuK8wCiTp8q6GI7JFEKnUkvio5tXyUdtxT0h
         rRNqznL4oRzNcNX2RjMlTjr7H4xgRegF5MDf15vLE7k+yt7CjiFJYMm0rBLS3Zv+QWBO
         OMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F0rxTAIDQUC00gIGQ2hZRmANNTx894FvV5JJnWTgTsY=;
        b=T+t8b4QquEFM4anntMIhFXvof7U+GFE2JY42iCOucr3zc06XfX7ZCSMD3AG9/EwiOY
         puXZN1n7HVHdSpf34V/ALkfsDwjQZFPW5htCqJuFd+GNqdSV+/lL4cRQWwVNqBeww6o0
         Jy2TW0nTeXylM5ZcMVA5dbgedansIEX8I/OYpjC9BQ6favticYiQ2uQGH5RuIoSm3g/B
         LY08Suw+wHEeaWfwKa16R/yJOqWANy7PJ/Ap8GPUBfi+Wpc9hGzM+Qgu3b/9S7Cb/Jf5
         gRIDkP3EkiVEMkPjCdBC5jZFmwcVKPpdQio+5EouQz9goLj7whH1fjQQZH+UsS1NeMdj
         YF6g==
X-Gm-Message-State: AOAM532G5n1L0wG3s9B87TmqsD1+fuZ6Gc20U2rPzl7+6gg/YIcQYVXN
        ahvpXgSpD01rm3QCqwYXI86RlS7HtBX8DQ==
X-Google-Smtp-Source: ABdhPJzHG6QcpyJuJ3Le4bg387qad0Rbw6o1l3Bs2pO2kHXim+gSQAUu37bwJlYnOzNwoJGKqEXOZQ==
X-Received: by 2002:a17:906:f2cd:: with SMTP id gz13mr15507022ejb.278.1633421470068;
        Tue, 05 Oct 2021 01:11:10 -0700 (PDT)
Received: from localhost.localdomain ([84.238.208.199])
        by smtp.gmail.com with ESMTPSA id f1sm3096258edz.47.2021.10.05.01.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 01:11:09 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 5/7] venus: vdec: set work route to fw
Date:   Tue,  5 Oct 2021 11:10:46 +0300
Message-Id: <20211005081048.3095252-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005081048.3095252-1-stanimir.varbanov@linaro.org>
References: <20211005081048.3095252-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Set work route to FW based on num of vpp pipes.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---

Added space after 'if'
Return directly hfi_session_set_property

 drivers/media/platform/qcom/venus/hfi_cmds.c   |  7 +++++++
 drivers/media/platform/qcom/venus/hfi_helper.h |  5 +++++
 drivers/media/platform/qcom/venus/vdec.c       | 17 +++++++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 60f4b8e4b8d0..5aea07307e02 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -1299,6 +1299,13 @@ pkt_session_set_property_6xx(struct hfi_session_set_property_pkt *pkt,
 		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*cq);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_WORK_ROUTE: {
+		struct hfi_video_work_route *in = pdata, *wr = prop_data;
+
+		wr->video_work_route = in->video_work_route;
+		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*wr);
+		break;
+	}
 	default:
 		return pkt_session_set_property_4xx(pkt, cookie, ptype, pdata);
 	}
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index bec4feb63ceb..253911272b4c 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -448,6 +448,7 @@
 #define HFI_PROPERTY_PARAM_MVC_BUFFER_LAYOUT			0x100f
 #define HFI_PROPERTY_PARAM_MAX_SESSIONS_SUPPORTED		0x1010
 #define HFI_PROPERTY_PARAM_WORK_MODE				0x1015
+#define HFI_PROPERTY_PARAM_WORK_ROUTE				0x1017
 
 /*
  * HFI_PROPERTY_CONFIG_COMMON_START
@@ -873,6 +874,10 @@ struct hfi_video_work_mode {
 	u32 video_work_mode;
 };
 
+struct hfi_video_work_route {
+	u32 video_work_route;
+};
+
 struct hfi_h264_vui_timing_info {
 	u32 enable;
 	u32 fixed_framerate;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index c129b061a325..88cd9e46c333 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -656,6 +656,19 @@ static int vdec_set_properties(struct venus_inst *inst)
 	return 0;
 }
 
+static int vdec_set_work_route(struct venus_inst *inst)
+{
+	u32 ptype = HFI_PROPERTY_PARAM_WORK_ROUTE;
+	struct hfi_video_work_route wr;
+
+	if (!IS_V6(inst->core))
+		return 0;
+
+	wr.video_work_route = inst->core->res->num_vpp_pipes;
+
+	return hfi_session_set_property(inst, ptype, &wr);
+}
+
 #define is_ubwc_fmt(fmt) (!!((fmt) & HFI_COLOR_FORMAT_UBWC_BASE))
 
 static int vdec_output_conf(struct venus_inst *inst)
@@ -1042,6 +1055,10 @@ static int vdec_start_output(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
+	ret = vdec_set_work_route(inst);
+	if (ret)
+		return ret;
+
 	ret = vdec_output_conf(inst);
 	if (ret)
 		return ret;
-- 
2.25.1

