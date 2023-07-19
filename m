Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B222875984E
	for <lists+linux-media@lfdr.de>; Wed, 19 Jul 2023 16:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbjGSO0m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jul 2023 10:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231667AbjGSO02 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jul 2023 10:26:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879041998
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 07:26:26 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 155F6AF2;
        Wed, 19 Jul 2023 16:25:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1689776730;
        bh=4tzLWkbmOZmO2qbxENSAHpAhKT1U3AYUFz6qlcVDMtU=;
        h=From:To:Cc:Subject:Date:From;
        b=TjXHCxgeGV3GasOdtUVCRk7EsD5Uex5PJjEa5EFExxmGoNvEBg2t87CrmF3Mu0wDG
         JvFx9dG96lEGoOl+K3b5+5HPrO1kuIyVK9et4/gkzt/aSFnegLtqI94k6fPFagesyo
         XlodfQlQ+PC7rlNASTdcJE0P5/iHsQdgwI+VxLcU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH] media: i2c: ds90ub913: Fix a warning about use of uninitialized variable
Date:   Wed, 19 Jul 2023 17:26:10 +0300
Message-Id: <20230719142610.368291-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following warning:

drivers/media/i2c/ds90ub913.c:488:9: warning: 'v' may be used uninitialized [-Wmaybe-uninitialized]
  488 |         ub913_write(priv, UB913_REG_GENERAL_CFG,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  489 |                     v | UB913_REG_GENERAL_CFG_CRC_ERR_RESET);
      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/i2c/ds90ub913.c:477:12: note: 'v' was declared here
  477 |         u8 v, v1, v2;
      |            ^

Fix the warning by initializing the variable to 0. Proper error handling
here would be somewhat pointless, as we are just printing register
values, and the user will see an error about the failed i2c transaction.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 4dae5afa9fa9..55be28463ca2 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -469,7 +469,7 @@ static int ub913_log_status(struct v4l2_subdev *sd)
 {
 	struct ub913_data *priv = sd_to_ub913(sd);
 	struct device *dev = &priv->client->dev;
-	u8 v, v1, v2;
+	u8 v = 0, v1, v2;
 
 	ub913_read(priv, UB913_REG_MODE_SEL, &v);
 	dev_info(dev, "MODE_SEL %#02x\n", v);
-- 
2.34.1

