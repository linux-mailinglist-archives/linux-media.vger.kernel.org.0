Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3764666B0
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 16:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359075AbhLBPjR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 10:39:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359065AbhLBPjO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 10:39:14 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F77C06174A
        for <linux-media@vger.kernel.org>; Thu,  2 Dec 2021 07:35:52 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso2644039wml.1
        for <linux-media@vger.kernel.org>; Thu, 02 Dec 2021 07:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UdUzS90xHBZQkZnmDjqybxrLaFmgOreexYGvvJh97Uk=;
        b=l20PipFSlEkYA/VpSSg41CHVltHUs7gkFwiH2+Ytj41lh9MwPoWpUBByLihXiLGqeB
         wclxb5u0jsyMvyifKVDsbuQXe+W9sdn7HCDHtge34ujyXch0S9Duxe3WvD2sZkxE/UQ0
         cQi4+1BlH3tiejuGgxLtFKgfkVtZYW59ruWJFLghKqGcUVjnP2Vy4XDyM6Q5/IWPXvdN
         MzjXhuvJPlbd1QIDpl/VJ1MycrcVrKlLk3bRrhowMCwDeA3kZ5wj73pXVU+3qaNmZaG4
         f/sCBKpgSnmgFXH/AAlSA5C5StzTuRJEtmxgMfcKPb6EXflhqIBqnSLF0/3iYe4oi9Te
         MObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UdUzS90xHBZQkZnmDjqybxrLaFmgOreexYGvvJh97Uk=;
        b=fvmmo+7AZsbB4wC00CLXU4Nct28nh+SyyUUEw9T3cV3SQLOPS5ftBJbvrSFN6bUhhY
         tGXOgsEbjGFTwFysfms7whUtNcELtz5uHy0auWT/33oP9Ns8C5RhCNK7wkxREgnph5f5
         pm2noW/3qUx1DzYm9jVvEzT2oXe3Jv+/xj61k3CIJJt2kzexQZ/WzSMHCftnfMxajrcm
         EEWO3IDazVXhaNhT81ukxJlBejGoo8+GW5ExAlxElZhgzEbb++d547cs4QhOSKNgZ1Ng
         QqLw9zbQgMUxIu4rfWCcOSlJw2P+InEZ7g6/lFHHTAll35/boqDajeLRm/nZVZaFpidL
         11Xg==
X-Gm-Message-State: AOAM530/6gKjZz/NzCUGrAf3a8dMAd7rXrWkAlRiq/uSB/6+yah+MILB
        LrHT3O1+hoenHcDbB0T+IpeupQ==
X-Google-Smtp-Source: ABdhPJyrQO3a2GelKE8ccJxz6RDHa2NhcC58I/v2RMRHt9npcRIR2Xw0WI1d64/B+vNIlqzTX+X9qQ==
X-Received: by 2002:a05:600c:3b8f:: with SMTP id n15mr7250072wms.180.1638459350662;
        Thu, 02 Dec 2021 07:35:50 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:35:50 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 09/19] media: camss: csid-170: set the right HALT_CMD when disabled
Date:   Thu,  2 Dec 2021 15:37:19 +0000
Message-Id: <20211202153729.3362372-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
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

