Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3BF37486D
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 21:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234293AbhEETHS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 15:07:18 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35647 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbhEETHR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 15:07:17 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1leMqg-0008J6-S8; Wed, 05 May 2021 19:06:18 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: mxl692: make a const array static, makes object smaller
Date:   Wed,  5 May 2021 20:06:18 +0100
Message-Id: <20210505190618.70367-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array fw_hdr on the stack but instead it
static. Makes the object code smaller by 5 bytes:

Before:
   text    data    bss     dec    hex filename
  31948   12072     64   44084   ac34 drivers/media/dvb-frontends/mxl692.o

After:
   text    data    bss     dec    hex filename
  31879   12136     64   44079   ac2f drivers/media/dvb-frontends/mxl692.o

(gcc version 10.3.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/mxl692.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/mxl692.c b/drivers/media/dvb-frontends/mxl692.c
index 83030643aba7..a246db683cdf 100644
--- a/drivers/media/dvb-frontends/mxl692.c
+++ b/drivers/media/dvb-frontends/mxl692.c
@@ -224,7 +224,9 @@ static int mxl692_validate_fw_header(struct mxl692_dev *dev,
 	u32 ix, temp;
 	__be32 *local_buf = NULL;
 	u8 temp_cksum = 0;
-	const u8 fw_hdr[] = { 0x4D, 0x31, 0x10, 0x02, 0x40, 0x00, 0x00, 0x80 };
+	static const u8 fw_hdr[] = {
+		0x4D, 0x31, 0x10, 0x02, 0x40, 0x00, 0x00, 0x80
+	};
 
 	if (memcmp(buffer, fw_hdr, 8) != 0) {
 		status = -EINVAL;
-- 
2.30.2

