Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D062E602A1
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 10:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727538AbfGEIve (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 04:51:34 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:38624 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfGEIve (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jul 2019 04:51:34 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hjJwK-0007O1-T4; Fri, 05 Jul 2019 08:51:33 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [media] stv0900_core: remove redundant assignment to variables mclk, div and ad_div
Date:   Fri,  5 Jul 2019 09:51:32 +0100
Message-Id: <20190705085132.16237-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variables mclk, div and ad_div are being assigned with a values
that are never read and are being updated later with a new values.
The assignments are redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/stv0900_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/stv0900_core.c b/drivers/media/dvb-frontends/stv0900_core.c
index 0c50740e7bb8..7d93a1617e86 100644
--- a/drivers/media/dvb-frontends/stv0900_core.c
+++ b/drivers/media/dvb-frontends/stv0900_core.c
@@ -270,7 +270,7 @@ static enum fe_stv0900_error stv0900_initialize(struct stv0900_internal *intp)
 
 static u32 stv0900_get_mclk_freq(struct stv0900_internal *intp, u32 ext_clk)
 {
-	u32 mclk = 90000000, div = 0, ad_div = 0;
+	u32 mclk, div, ad_div;
 
 	div = stv0900_get_bits(intp, F0900_M_DIV);
 	ad_div = ((stv0900_get_bits(intp, F0900_SELX1RATIO) == 1) ? 4 : 6);
-- 
2.20.1

