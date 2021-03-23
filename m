Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 083D63460CE
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 15:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhCWOBA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 10:01:00 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33453 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbhCWOAu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 10:00:50 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lOhaR-0006q8-SW; Tue, 23 Mar 2021 14:00:47 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        Brad Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: dvb-frontends: Remove redundant error check on variable ret
Date:   Tue, 23 Mar 2021 14:00:47 +0000
Message-Id: <20210323140047.347955-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An earlier commit removed a call to lgdt3306a_spectral_inversion and
omitted to remove the error return check. The check on ret is now
redundant and can be removed.

Addresses-Coverity: ("Logically dead code")
Fixes: d4a3fa6652e3 ("media: dvb-frontends: lgdt3306a.c: remove dead code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/lgdt3306a.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-frontends/lgdt3306a.c
index 22d484487695..136b76cb4807 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -1017,9 +1017,6 @@ static int lgdt3306a_set_parameters(struct dvb_frontend *fe)
 
 	/* spectral_inversion defaults already set for VSB and QAM */
 
-	if (lg_chkerr(ret))
-		goto fail;
-
 	ret = lgdt3306a_mpeg_mode(state, state->cfg->mpeg_mode);
 	if (lg_chkerr(ret))
 		goto fail;
-- 
2.30.2

