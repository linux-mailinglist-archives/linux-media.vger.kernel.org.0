Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D1822684A
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 18:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387779AbgGTQNn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 12:13:43 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44351 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388103AbgGTQNj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 12:13:39 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jxYQ3-0005Nh-KW; Mon, 20 Jul 2020 16:13:35 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: i2c: fix error check on max9286_read call
Date:   Mon, 20 Jul 2020 17:13:35 +0100
Message-Id: <20200720161335.339174-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the error return from the call to max9286_read is masked
with 0xf0 so the following check for a negative error return is
never true.  Fix this by checking for an error first, then masking
the return value for subsequent conflink_mask checking.

Addresses-Coverity: ("Logically dead code")
fixes: 66d8c9d2422d ("media: i2c: Add MAX9286 driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/i2c/max9286.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 47f280518fdb..b364a3f60486 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -405,10 +405,11 @@ static int max9286_check_config_link(struct max9286_priv *priv,
 	 * to 5 milliseconds.
 	 */
 	for (i = 0; i < 10; i++) {
-		ret = max9286_read(priv, 0x49) & 0xf0;
+		ret = max9286_read(priv, 0x49);
 		if (ret < 0)
 			return -EIO;
 
+		ret &= 0xf0;
 		if (ret == conflink_mask)
 			break;
 
-- 
2.27.0

