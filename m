Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6E443D10F
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 17:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405226AbfFKPiR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 11:38:17 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50752 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405188AbfFKPiR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 11:38:17 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1haiqj-0003WC-5x; Tue, 11 Jun 2019 15:38:13 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: stv090x: fix double free on state object
Date:   Tue, 11 Jun 2019 16:38:12 +0100
Message-Id: <20190611153812.4789-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There two callers of stv090x_setup_compound manage the allocation and
freeing if state there is an error condition from stv090x_setup_compound.
Currently function stv090x_setup_compound also frees the state object
too, leading to a double free in the callers of this function.  Fix
this by removing the extraneous free in stv090x_setup_compound and just
leave the callers handle the allocation/free'ing.

Addresses-Coverity: ("Double free")
Fixes: eb5005df886b ("media: stv090x: Implement probe/remove for stv090x")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/stv090x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/stv090x.c b/drivers/media/dvb-frontends/stv090x.c
index 986e585e0103..90d24131d335 100644
--- a/drivers/media/dvb-frontends/stv090x.c
+++ b/drivers/media/dvb-frontends/stv090x.c
@@ -4942,7 +4942,6 @@ static int stv090x_setup_compound(struct stv090x_state *state)
 	return 0;
 
 error:
-	kfree(state);
 	return -ENOMEM;
 err_remove:
 	remove_dev(state->internal);
-- 
2.20.1

