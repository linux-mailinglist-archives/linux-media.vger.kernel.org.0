Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2776D9367
	for <lists+linux-media@lfdr.de>; Thu,  6 Apr 2023 11:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236387AbjDFJ5u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Apr 2023 05:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236658AbjDFJ5X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Apr 2023 05:57:23 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA73A93CD
        for <linux-media@vger.kernel.org>; Thu,  6 Apr 2023 02:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1680774958; x=1712310958;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FUsp/KS0Crug3ydnN8ZvTFzhb3kjKKVMR97zQj2i5Gk=;
  b=Nbbv8N/chF8r+WnOxMAwpeIDYgUWoyTKhaloW2rB3JsvMLfVSgawvCts
   3Ku5Ca1fGmjNxeffD6jSGpOvG8z0f9snhKeQQwClgAOrno+LCYHSGiswE
   edQSasFC8+dmkHdGUYkhQNDKlbNBifZld82YNT+vW9+LeEgyGpgG8QUI0
   Luoowe+9MuPt1ZXKPAHYX9kCjpzWm2tj1otv5Gg6uuHZIQ6POvRAsPU8l
   fKW4XNOhtW2k/sJiaLXusftJG9EzY7o7NmuD1zkOWyMZiwo+//14MzJyV
   YFMXoJwO3vOQfAOT2wc6+Bwo7d9wXMRJiSAJgRV7F5/tSOx17IL+QDIFM
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,323,1673910000"; 
   d="scan'208";a="30189600"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Apr 2023 11:55:56 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 06 Apr 2023 11:55:56 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 06 Apr 2023 11:55:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1680774956; x=1712310956;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FUsp/KS0Crug3ydnN8ZvTFzhb3kjKKVMR97zQj2i5Gk=;
  b=PjMzd83y7FPPctWhLG80vRTSoZNG/+gPdphNm/xDRA05bZ+S1q9+0me9
   Hw91fE8+bPDgDMCW1CgklTXNWbVZlsbSE/o1coZhzYLZd6K4vsFdRaUCc
   lxG8h9gU+UG1ppcyKXOfwtjv3VnNSoAdl48zUy2FXD49lcN6L3BV8OKdg
   Yoj5sX7rTkNbqXSAuBvW9Rs33VAqq+LaoPFXiGHozS2sgvbor/jyC9NQo
   4jBm6bwhMArsD//yCgyVWzNZXbqfrqHa5/Z0gV1JkxLEhBWwtwuaZA3fA
   DO6qF7O22SLfO5WEYAn2Ebnno9G316q9QjvG3oMU44PcPKIrSmNhXDwOH
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,323,1673910000"; 
   d="scan'208";a="30189599"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Apr 2023 11:55:56 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 450BE280056;
        Thu,  6 Apr 2023 11:55:56 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: i2c: imx290: Add missing \n on dev_err_probe() message
Date:   Thu,  6 Apr 2023 11:55:51 +0200
Message-Id: <20230406095551.952091-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Also dev_err_probe message require a trailing \n.
Fixes: 63127235bebd ("media: i2c: imx290: Use dev_err_probe()")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 94bba482af38..5ea25b7acc55 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1602,7 +1602,7 @@ static int imx290_probe(struct i2c_client *client)
 	imx290->xclk = devm_clk_get(dev, "xclk");
 	if (IS_ERR(imx290->xclk))
 		return dev_err_probe(dev, PTR_ERR(imx290->xclk),
-				     "Could not get xclk");
+				     "Could not get xclk\n");
 
 	ret = imx290_get_regulators(dev, imx290);
 	if (ret < 0)
-- 
2.34.1

