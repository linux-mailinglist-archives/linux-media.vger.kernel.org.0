Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A786F6C7EF2
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 14:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231826AbjCXNiv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 09:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbjCXNit (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 09:38:49 -0400
Received: from mail-out.aladdin-rd.ru (mail-out.aladdin-rd.ru [91.199.251.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2CEBC;
        Fri, 24 Mar 2023 06:38:45 -0700 (PDT)
From:   Daniil Dulov <d.dulov@aladdin.ru>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Daniil Dulov <d.dulov@aladdin.ru>, <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        <lvc-patches@linuxtesting.org>
Subject: [PATCH] media: dib7000p: Fix potential division by zero
Date:   Fri, 24 Mar 2023 06:38:32 -0700
Message-ID: <20230324133832.652630-1-d.dulov@aladdin.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.0.20.32]
X-ClientProxiedBy: EXCH-2016-02.aladdin.ru (192.168.1.102) To
 EXCH-2016-01.aladdin.ru (192.168.1.101)
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Variable loopdiv can be assigned 0, then it is used as a denominator,
without checking it for 0.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 713d54a8bd81 ("[media] DiB7090: add support for the dib7090 based")
Signed-off-by: Daniil Dulov <d.dulov@aladdin.ru>
---
 drivers/media/dvb-frontends/dib7000p.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/dib7000p.c b/drivers/media/dvb-frontends/dib7000p.c
index 55bee50aa871..bea5717907e7 100644
--- a/drivers/media/dvb-frontends/dib7000p.c
+++ b/drivers/media/dvb-frontends/dib7000p.c
@@ -497,7 +497,7 @@ static int dib7000p_update_pll(struct dvb_frontend *fe, struct dibx000_bandwidth
 	prediv = reg_1856 & 0x3f;
 	loopdiv = (reg_1856 >> 6) & 0x3f;
 
-	if ((bw != NULL) && (bw->pll_prediv != prediv || bw->pll_ratio != loopdiv)) {
+	if (loopdiv && (bw != NULL) && (bw->pll_prediv != prediv || bw->pll_ratio != loopdiv)) {
 		dprintk("Updating pll (prediv: old =  %d new = %d ; loopdiv : old = %d new = %d)\n", prediv, bw->pll_prediv, loopdiv, bw->pll_ratio);
 		reg_1856 &= 0xf000;
 		reg_1857 = dib7000p_read_word(state, 1857);
-- 
2.25.1

