Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73B0B45CB93
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 18:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350060AbhKXSAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 13:00:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349980AbhKXSAk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 13:00:40 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28D8C061748
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:29 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id i12so3224577wmq.4
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UdUzS90xHBZQkZnmDjqybxrLaFmgOreexYGvvJh97Uk=;
        b=g71KBsBuksAmBudc/nDmkr2xbzpoKoWw2HmHdG4z3oQHHUD/USL/OObxTvdF6DLI57
         6CtKNWarCK6psoTEontC4lvC221ejS1+VNob/psJfevI61hWERSYK6QYJQGriGCeWipK
         gw5RF7YRp5mZZblhouU0M3jKpz5GfTe55sUT/Cugz1JAfAgsoNQPOQe8JmahRR7+k9XK
         /QXzA1eg7hhNRscslFB7xB7xx2WHui0tzvEptsg8tSEoIUrcqL9hSn0j4V2G+8vANVSt
         bbpUe+1Z0WnJqwyHvGvQ+1CO9wWiiTfGIq4eks5ZPGSiTMMGPLXfs1+8680Nea2R8ic0
         fIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UdUzS90xHBZQkZnmDjqybxrLaFmgOreexYGvvJh97Uk=;
        b=Bp1cydcKKiQO0SmSzN1/YDr6xjMDsn5FzIBq2xEwpNlk0qYew3sE92qECkXlNTXvkL
         wcdMS/BNRyH3aJnp9gEiyM8/Mc7xvr0pEwTrcjjsKuRUY4ZRz5sRr/l94yUGIXc64cmR
         YnkouWCvm9XcMvczS8wIlEsK3fEvpGevbST6YapKTk5MZQPUaPGX8OWpTPFCBr6jox6p
         AABtlFQTWUweXPlef04CDSkm7IK/YQ5SkLg08pyvgCMOAJbbM8NOnV8PopZHfIerZ8tG
         yYC6zuDyOEsdar/CW3EBnae3qYMxNBOS+qtnkMnGGJFA2PMFLo2qxPkETyJgBsJyL8m5
         EIlA==
X-Gm-Message-State: AOAM530E6Vp0+eX4Whoz6Lf+OLSXR+p4NTCRoPkuKxYtuviwYu9pZRuL
        wwvEso9uxF+99E5jdbuuHl0lHw==
X-Google-Smtp-Source: ABdhPJzJU5ixGinC8li+cyrjiz4VfAIpnc2JnuTUgspG759LQjJt5nJ/P0iWYlL6AFFgstTMyx84Yg==
X-Received: by 2002:a05:600c:500d:: with SMTP id n13mr17392840wmr.174.1637776648425;
        Wed, 24 Nov 2021 09:57:28 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s24sm380576wmj.26.2021.11.24.09.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:57:27 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 09/19] media: camss: csid-170: set the right HALT_CMD when disabled
Date:   Wed, 24 Nov 2021 17:59:11 +0000
Message-Id: <20211124175921.1048375-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
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
Tested-by: Julian Grahsl <jgrahsl@snap.com>
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

