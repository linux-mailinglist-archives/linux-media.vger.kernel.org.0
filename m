Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC355326A60
	for <lists+linux-media@lfdr.de>; Sat, 27 Feb 2021 00:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhBZXXQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 18:23:16 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:34201 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbhBZXXP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 18:23:15 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lFmRK-0001eh-2t; Fri, 26 Feb 2021 23:22:30 +0000
From:   Colin King <colin.king@canonical.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: adp1653: fix error handling from a call to adp1653_get_fault
Date:   Fri, 26 Feb 2021 23:22:29 +0000
Message-Id: <20210226232229.1076199-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The error check on rval from the call to adp1653_get_fault currently
returns if rval is non-zero. This appears to be incorrect as the
following if statement checks for various bit settings in rval so
clearly rval is expected to be non-zero at that point. Coverity
flagged the if statement up as deadcode.  Fix this so the error
return path only occurs when rval is negative.

Addresses-Coverity: ("Logically dead code")
Fixes: 287980e49ffc ("remove lots of IS_ERR_VALUE abuses")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/i2c/adp1653.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adp1653.c b/drivers/media/i2c/adp1653.c
index 522a0b10e415..1a4878385394 100644
--- a/drivers/media/i2c/adp1653.c
+++ b/drivers/media/i2c/adp1653.c
@@ -170,7 +170,7 @@ static int adp1653_set_ctrl(struct v4l2_ctrl *ctrl)
 	int rval;
 
 	rval = adp1653_get_fault(flash);
-	if (rval)
+	if (rval < 0)
 		return rval;
 	if ((rval & (ADP1653_REG_FAULT_FLT_SCP |
 		     ADP1653_REG_FAULT_FLT_OT |
-- 
2.30.0

