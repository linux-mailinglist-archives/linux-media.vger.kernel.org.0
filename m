Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 175EE2CF332
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 18:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731058AbgLDRjT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 12:39:19 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:45764 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728451AbgLDRjT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 12:39:19 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1klF2P-0006Ov-QB; Fri, 04 Dec 2020 17:38:33 +0000
From:   Colin King <colin.king@canonical.com>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: rcar-vin: fix return, use ret instead of zero
Date:   Fri,  4 Dec 2020 17:38:33 +0000
Message-Id: <20201204173833.1146570-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the return error code is in ret is being assigned but not
used. It and should be returned by the return statement and currently
just 0 is being returned. Fix this.

Addresses-Coverity: ("Unused value")
Fixes: b9ad52aafe38 ("media: rcar-vin: Rework parallel firmware parsing")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 98bff765b02e..e48d666f2c63 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -654,7 +654,7 @@ static int rvin_parallel_parse_of(struct rvin_dev *vin)
 out:
 	fwnode_handle_put(fwnode);
 
-	return 0;
+	return ret;
 }
 
 static int rvin_parallel_init(struct rvin_dev *vin)
-- 
2.29.2

