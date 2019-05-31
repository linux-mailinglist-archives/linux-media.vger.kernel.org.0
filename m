Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD113140D
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 19:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfEaRpP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 13:45:15 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42323 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726653AbfEaRpP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 13:45:15 -0400
Received: by mail-qt1-f193.google.com with SMTP id s15so1856234qtk.9
        for <linux-media@vger.kernel.org>; Fri, 31 May 2019 10:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0Qc1wtJ+AlHNFdrr6IvW8ZlhIQFw6oUtBH71ZGMG3xM=;
        b=LbxeMG8Io47BqV+w6NoB0QQyQNQRkwSYlrmB5ZLgIytxzIX4zAUxmL5wSMX3vkwRns
         4ges2rpfEppiP/kfy5rfv2iBzxvmf1hyYQjDP4viwxWl5vHqFTN6c1j9VBy6VG1XtwGm
         EXVOJCeFqHg1zPF0cueOxSN+q6pqCWoSkMwyVDWHgZzoDqpKK1Z2U4+nxrfvEALKcnAN
         A52kyn29scJNKSJv3OJpFh25IimlGeW7ra+GhVdsmo1E6GcjuZCwQ9foawudgCn9AsZ9
         O9/wrBXCMXkODqefLt9wuzUV0xKbEzYrpfrtWBokNADtD2PPubj/JvWFf+ziNEOSG6Q+
         I0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0Qc1wtJ+AlHNFdrr6IvW8ZlhIQFw6oUtBH71ZGMG3xM=;
        b=qWgx15XYWCGoGo5zAzOQ7jUMkkLZ5QVlhXd9OtVoRpZyOWSIxk0C18Phab5ZqoutOK
         IPM0r6SQdBV2oH/87Z3CnuQh76HabRs2WSDGWgOQ34YfifNtBdEY/ZBk9mKDL6TXCSqM
         ExTaay2cWx0uQHUkTidA2pCPSeAHrdqirsIKRdPdbosY2CKOLc41C5EwDK4H29v/niBS
         ducd0JW72knyGBfXHtispuMb1dxB+ad3fqZUKFCRxr4GJHN6NAN2fUvwNionRW+/d0wN
         /66XI+smizdC/jcQ0fpSD67/g7kSxnCPVlr5eJRPtuMyUJgm8g7pIDvezz0oX0l0vDbK
         esXA==
X-Gm-Message-State: APjAAAWwgFdLJKv/byewMZw3HGEaAN9yInPOGGvP9AbANeeAi6EFwR8C
        5rxyneWyfRWFbcW++mc4nfw=
X-Google-Smtp-Source: APXvYqxMZPOVNbNzB2zUcrBrywxZ58Sd3aqgoomkw7zQ7j5pbce1yBivJm1/VDNe2LGOHGlPfq3cGw==
X-Received: by 2002:a0c:b09a:: with SMTP id o26mr10068802qvc.68.1559324714259;
        Fri, 31 May 2019 10:45:14 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id f129sm3184879qkj.47.2019.05.31.10.45.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 10:45:13 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     rmfrfs@gmail.com, p.zabel@pengutronix.de, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/3] media: imx7-mipi-csis: Propagate the error if clock enabling fails
Date:   Fri, 31 May 2019 14:45:04 -0300
Message-Id: <20190531174506.13251-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the return value from clk_bulk_prepare_enable() is checked,
but it is not propagate it in the case of failure.

Fix it and also move the error message to the caller of
mipi_csis_clk_enable().

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 042837b8ea28..1b538ae77364 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -456,13 +456,9 @@ static void mipi_csis_set_params(struct csi_state *state)
 			MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL);
 }
 
-static void mipi_csis_clk_enable(struct csi_state *state)
+static int mipi_csis_clk_enable(struct csi_state *state)
 {
-	int ret;
-
-	ret = clk_bulk_prepare_enable(state->num_clks, state->clks);
-	if (ret < 0)
-		dev_err(state->dev, "failed to enable clocks\n");
+	return clk_bulk_prepare_enable(state->num_clks, state->clks);
 }
 
 static void mipi_csis_clk_disable(struct csi_state *state)
@@ -989,7 +985,11 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	mipi_csis_clk_enable(state);
+	ret = mipi_csis_clk_enable(state);
+	if (ret < 0) {
+		dev_err(state->dev, "failed to enable clocks: %d\n", ret);
+		return ret;
+	}
 
 	ret = devm_request_irq(dev, state->irq, mipi_csis_irq_handler,
 			       0, dev_name(dev), state);
-- 
2.17.1

