Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA698D4653
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 19:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728427AbfJKRN4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 13:13:56 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49055 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727984AbfJKRN4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 13:13:56 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iIyUE-0004eM-Ig; Fri, 11 Oct 2019 17:13:54 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: lm3646: remove redundant assignment to variable rval
Date:   Fri, 11 Oct 2019 18:13:54 +0100
Message-Id: <20191011171354.13787-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rval is being initialized with a value that
is never read and is being re-assigned a little later on. The
assignment is redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/i2c/lm3646.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/lm3646.c b/drivers/media/i2c/lm3646.c
index d8a8853f9a2b..c76ccf67a909 100644
--- a/drivers/media/i2c/lm3646.c
+++ b/drivers/media/i2c/lm3646.c
@@ -134,7 +134,7 @@ static int lm3646_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct lm3646_flash *flash = to_lm3646_flash(ctrl);
 	unsigned int reg_val;
-	int rval = -EINVAL;
+	int rval;
 
 	switch (ctrl->id) {
 	case V4L2_CID_FLASH_LED_MODE:
-- 
2.20.1

