Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C6E316FAC
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 20:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234427AbhBJTIo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 14:08:44 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:53433 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233117AbhBJTIh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 14:08:37 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l9uq9-0000HE-1u; Wed, 10 Feb 2021 19:07:53 +0000
From:   Colin King <colin.king@canonical.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: i2c: imx334: Fix a read of the uninitialized variable ret
Date:   Wed, 10 Feb 2021 19:07:52 +0000
Message-Id: <20210210190752.146631-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently there is a dev_err error message that is printing the
error status in variable ret (that has not been set) instead of
the correct error status from imx334->reset_gpio.  Fix this.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 9746b11715c3 ("media: i2c: Add imx334 camera sensor driver")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/i2c/imx334.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 07e31bc2ef18..f8b1caf26c9b 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -790,7 +790,8 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 	imx334->reset_gpio = devm_gpiod_get_optional(imx334->dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(imx334->reset_gpio)) {
-		dev_err(imx334->dev, "failed to get reset gpio %d", ret);
+		dev_err(imx334->dev, "failed to get reset gpio %ld",
+			IS_ERR_VALUE(imx334->reset_gpio));
 		return PTR_ERR(imx334->reset_gpio);
 	}
 
-- 
2.30.0

