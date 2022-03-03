Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83C024CBF97
	for <lists+linux-media@lfdr.de>; Thu,  3 Mar 2022 15:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233891AbiCCOLY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Mar 2022 09:11:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233899AbiCCOLX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Mar 2022 09:11:23 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48B1E18CC0E
        for <linux-media@vger.kernel.org>; Thu,  3 Mar 2022 06:10:37 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id d3so8067042wrf.1
        for <linux-media@vger.kernel.org>; Thu, 03 Mar 2022 06:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F2HBe93L3svuJ2ORJZjQ54bi/4VnhzLykZap61uYKHM=;
        b=k9DiTxUw5j++uXikaAzFOx9BNH5iQdYhEt3MSDOMrnZgCJQB2lMSQE0/C5QlqBty5C
         LUEf9KTFPk6tApMvFiEKPXVoRhINPBgLErOcnapMo3D4tRqHpOlMDiSWLUsuqIhzuwnS
         KKkS25j8T3BEktl0FM4bpB2+Ata0xM2GcFIKJLEW2O/Qei3gmKCKScTbE9MbCnBb9FN4
         H9AQigK54beNqaCFKfCdG4W2jz9h5tCH/+T3ynugBgta3yY+pUSrr4S1+hfoYjykkOPM
         HTXPe16bfl0hWb3AbiMMm0sncsW6ALI8PF6rVjnGLvMsZHxPdioaAE1XRA3JaO1bv5Y5
         SAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F2HBe93L3svuJ2ORJZjQ54bi/4VnhzLykZap61uYKHM=;
        b=tmS0o+4QLSA6tR6hAQM1JBHN43+aPRJ4dBHUDYBKGURPa5mogO7Uvv8w8JcSROk9Cj
         5bU4C8NI9NWx/s/aEzhTBoWhL85WpekGYu8JiSazpNecTObTc/sMv1A05XGtd6d0mp5c
         +WGEKKWFgYq536vcViQPRCzFyet4dKjkKXbEBwiO6RUZRbQrm/sKInJFF31pb2BIE7Uo
         B4NYdoM8tBcf9aXOm6DZ2kZ3Y197Rpxs8d8xCtuHn4mKNIQaG5P+mmFozf1vpNsKaIuT
         J20+VIppUtkeI+wmU1BV0G1Lezdk2qyetd54EEu0ckir9atFc9IHggQFjG5j9qIRmHMp
         gacw==
X-Gm-Message-State: AOAM5332+iCYJoHGqcIwaDPRS3jzJIv5uSqRTIBRsIGhOHl0rdXMHajI
        DwBcIbnM8PzM7OBrFNzP7ypqzcogUu7kvqko
X-Google-Smtp-Source: ABdhPJzh49X4+QP0mUf/C/fHEuvrpaxvSPHtNvet5o2/lmgEnucuADtmGWrG+NI7zLvHXB6dei2+3w==
X-Received: by 2002:a5d:624d:0:b0:1ef:771d:ca41 with SMTP id m13-20020a5d624d000000b001ef771dca41mr22257626wrv.603.1646316635689;
        Thu, 03 Mar 2022 06:10:35 -0800 (PST)
Received: from localhost.localdomain (hst-221-13.medicom.bg. [84.238.221.13])
        by smtp.gmail.com with ESMTPSA id ba2-20020a0560001c0200b001f0653f1097sm194312wrb.69.2022.03.03.06.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 06:10:35 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [RFC/WIP v2 5/6] venus: hfi: Add hfi property for enable grid
Date:   Thu,  3 Mar 2022 16:10:09 +0200
Message-Id: <20220303141010.573408-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303141010.573408-1-stanimir.varbanov@linaro.org>
References: <20220303141010.573408-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add HFI property to enable grid encoding.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c   | 7 +++++++
 drivers/media/platform/qcom/venus/hfi_helper.h | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 4ecd444050bb..4e9c1ad64976 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -1308,6 +1308,13 @@ pkt_session_set_property_6xx(struct hfi_session_set_property_pkt *pkt,
 		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*wr);
 		break;
 	}
+	case HFI_PROPERTY_CONFIG_HEIC_GRID_ENABLE: {
+		struct hfi_heic_grid_enable *in = pdata, *grid = prop_data;
+
+		grid->grid_enable = in->grid_enable;
+		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*grid);
+		break;
+	}
 	default:
 		return pkt_session_set_property_4xx(pkt, cookie, ptype, pdata);
 	}
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 2daa88e3df9f..fec4d2bd6a74 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -535,6 +535,7 @@
 #define HFI_PROPERTY_CONFIG_VENC_LTRPERIOD			0x200600c
 #define HFI_PROPERTY_CONFIG_VENC_PERF_MODE			0x200600e
 #define HFI_PROPERTY_CONFIG_HEIC_FRAME_QUALITY			0x2006014
+#define HFI_PROPERTY_CONFIG_HEIC_GRID_ENABLE			0x2006015
 
 /*
  * HFI_PROPERTY_PARAM_VPE_COMMON_START
@@ -794,6 +795,10 @@ struct hfi_quantization {
 	u32 layer_id;
 };
 
+struct hfi_heic_grid_enable {
+	u32 grid_enable;
+};
+
 struct hfi_initial_quantization {
 	u32 qp_i;
 	u32 qp_p;
-- 
2.25.1

