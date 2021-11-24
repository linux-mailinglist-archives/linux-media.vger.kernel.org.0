Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53D0B45CCDA
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350997AbhKXTQh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:16:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:52480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350928AbhKXTQg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76F33604D1;
        Wed, 24 Nov 2021 19:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781206;
        bh=rEaQWJSLeAyWYeLUZHpsb/ELAyk98yYLjZE+h6E7dJA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iJ++v5ZKZl8nAzT4E1auSFRWb4TujUSAWWXHLdbAtJ16MoC8NLphfkwtzgkS9kAVU
         R258QBgc4hGKTlQjh5m0eF/3YvI8wDW4RiRcGl8ksXF4IWfufNifU5H1Lq6RCDgYVX
         TMWDO6yPweBuD0lyAKBopjQXh2InEQWMfAekejWq6oXzlx99suIrPSjntfzxxSjBmr
         tHVhBH5kKuM1qUIjozIhheFggzgOXaNcgHieiK38Q6GcQJnoFfn7WcaxVgR2rq9Lxj
         t9quB7qLZfscRPcwq/2HGP7q0goh31aO7bPikePBnL0XR3RMYQyysefF37kzhoOkWs
         I1ebe/1dmltMg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q5M-IE; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 07/20] media: si21xx: report eventual errors at set_frontend
Date:   Wed, 24 Nov 2021 20:13:10 +0100
Message-Id: <36d55de3be035253bf1b07506db13eab04ad803d.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If an error occurs while setting the registers at set_frontend,
it is silently ignored. Yet, the variable status is updated.

Change the logic to return an error if it fails to write values
to the registers.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/dvb-frontends/si21xx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/si21xx.c b/drivers/media/dvb-frontends/si21xx.c
index e31eb2c5cc4c..001b23588389 100644
--- a/drivers/media/dvb-frontends/si21xx.c
+++ b/drivers/media/dvb-frontends/si21xx.c
@@ -711,7 +711,7 @@ static int si21xx_set_frontend(struct dvb_frontend *fe)
 	int i;
 	bool inband_interferer_div2[ALLOWABLE_FS_COUNT];
 	bool inband_interferer_div4[ALLOWABLE_FS_COUNT];
-	int status;
+	int status = 0;
 
 	/* allowable sample rates for ADC in MHz */
 	int afs[ALLOWABLE_FS_COUNT] = { 200, 192, 193, 194, 195,
@@ -747,8 +747,6 @@ static int si21xx_set_frontend(struct dvb_frontend *fe)
 	rf_freq = 10 * c->frequency ;
 	data_rate = c->symbol_rate / 100;
 
-	status = PASS;
-
 	band_low = (rf_freq - lnb_lo) - ((lnb_uncertanity * 200)
 					+ (data_rate * 135)) / 200;
 
@@ -832,6 +830,9 @@ static int si21xx_set_frontend(struct dvb_frontend *fe)
 	state->fs = sample_rate;/*ADC MHz*/
 	si21xx_setacquire(fe, c->symbol_rate, c->fec_inner);
 
+	if (status)
+		return -EREMOTEIO;
+
 	return 0;
 }
 
-- 
2.33.1

