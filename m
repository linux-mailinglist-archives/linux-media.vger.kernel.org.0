Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC7444D9E7
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234070AbhKKQLm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:11:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234154AbhKKQLl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:11:41 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E52C06127A
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:51 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id d27so10638349wrb.6
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FFkZzpy5SsjOY6Rq6Rp0WjHinpFwH4h4/0g0HL7f/9Y=;
        b=ClI/d52BHcQo3dQAonIj07fJrASYewZgBkLp1LKhbx1sGt4uSgwoF5xfn436VMLeRp
         SN/4/kCH1yvDhDy7KiOZHVepWAF/LtLzFSGvym9FI/8Sa8a9dUzFx9GaG4dhbmiKeioe
         yu7UGn9vGcLAcKoQBJO3om3HZl+3J4RoXHm/i6ANwi9iJ/iNehjTFK2dCAsHHnWlYQN4
         qZIfXpLmhBiucxTVAZo7BGuEyEvTH1I7dUxH4KbvZ5+K0AunbUjOsaismQ7HFndIeFHJ
         BHzfSH2qrJfhxqtWJJw4n7gOo3mBoXg65bBnJL1I4Mq8cksFyWQc3wudB3GBKev1JKn3
         58Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FFkZzpy5SsjOY6Rq6Rp0WjHinpFwH4h4/0g0HL7f/9Y=;
        b=Fuv9X9SG9xHJJ85SeCncP+cm2hkoABoB+RuEQQ8cHBqndPF5nRPkGWFdMsK9drNLBa
         /+uNHZld6b5wVSZ8MATmPk5kPaGKusMvq2LRVzBkiXOy4f+TnSBODcAZKMUon5i70Oyi
         FsjpCNWa5ZT+mW0tVbzAgmL6YaY68KGBVyuXH0KSAkU+RUPdyQhWDOVr4fGPIhWCKv7c
         MGU+mjIoyAdoO3UGt1RRDgjrTxifyuK2W7Q2gQFstWol7Nr7eJAekg0rdd21d8dCgpKQ
         Gqc5ZHePR8FecJd4QVoxSdDn84VOKJarokhUT0o7NQPwlrzIBJIyBmWK21OcqO6OQ4eI
         82Hw==
X-Gm-Message-State: AOAM53033V58McPKOxutvEVnZGcAYZh1bjYiWLEHabRtlbdDoNtN+oJ0
        UL0t/OWlnsRocFGZgIp2OnUh4g==
X-Google-Smtp-Source: ABdhPJzsa2Z8X+jfSmsN40w6AWUYyC8xcXu/YypyF/PbiU7TuD41vmVul1cNFiQnoMCDrzRoX6bC5g==
X-Received: by 2002:a5d:4b06:: with SMTP id v6mr10074674wrq.194.1636646930482;
        Thu, 11 Nov 2021 08:08:50 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8sm3245558wrw.6.2021.11.11.08.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:08:50 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     inux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 09/18] media: camss: csid-170: set the right HALT_CMD when disabled
Date:   Thu, 11 Nov 2021 16:10:29 +0000
Message-Id: <20211111161038.3936217-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
References: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Use the "HALT_CMD_RESUME_AT_FRAME_BOUNDARY" define instead of a "1" which
is otherwise confusing, and add a "HALT_CMD_HALT_AT_FRAME_BOUNDARY" which
is set when disabling.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index 2c84d40fe3e0..22a7d7ad6340 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -105,7 +105,8 @@
 #define CSID_RDI_CTRL(rdi)			((IS_LITE ? 0x208 : 0x308)\
 						+ 0x100 * (rdi))
 #define		RDI_CTRL_HALT_CMD		0
-#define			ALT_CMD_RESUME_AT_FRAME_BOUNDARY	1
+#define			HALT_CMD_HALT_AT_FRAME_BOUNDARY		0
+#define			HALT_CMD_RESUME_AT_FRAME_BOUNDARY	1
 #define		RDI_CTRL_HALT_MODE		2
 
 #define CSID_RDI_FRM_DROP_PATTERN(rdi)			((IS_LITE ? 0x20C : 0x30C)\
@@ -444,7 +445,10 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 
-	val = 1 << RDI_CTRL_HALT_CMD;
+	if (enable)
+		val = HALT_CMD_RESUME_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
+	else
+		val = HALT_CMD_HALT_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
 }
 
-- 
2.33.0

