Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6833B42DE2F
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 17:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232846AbhJNPfA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 11:35:00 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:43736
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230345AbhJNPe7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 11:34:59 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id C1C6B3FFE6;
        Thu, 14 Oct 2021 15:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634225573;
        bh=BqmDJrHFqBHxoTqS4hIwgHXRVxQ1I+vJ59gvb2WD7a0=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=MkzfKoovTsEGdBHrbxWaw1qLu0OfDJMw3Ux96i+x6PK7LonLBNDuK7FRoegpbnBNq
         TXDeUriYaZE7yiOEGSvo9MtKSxQ29r/bCIpjp+XudkP8kLVirfnNn18t38z4xZ8vWA
         tO6cfdTv+bF/RgW4S+jKfvoH5Mcu8P1ZpwdFcN82Ry56bCgNxa3EgZQTEQCrtyjh3Y
         FkWLBcg1gIxw2wDXcnM6mhx0TMmZbnNaoKCr8vQpwRd+l16i18gUCySAKQdj88CkKl
         PT8of/7ylY6/qmnrDO89nE0JKXaeQBJsDIkfcZCrMzQe6cauagifEqOusLqpko4Esz
         WEzNR2D0PuDzA==
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-frontends/stv0367: remove redundant variable ADCClk_Hz
Date:   Thu, 14 Oct 2021 16:32:53 +0100
Message-Id: <20211014153253.63527-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable ADCClk_Hz is being initialised with a variable that is never read
and then re-assigned immediately afterwards. Clean up the code by removing
it and just returning the return value from the call to stv0367cab_get_mclk

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/stv0367.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/stv0367.c b/drivers/media/dvb-frontends/stv0367.c
index 6c2b05fae1c5..95e376f23506 100644
--- a/drivers/media/dvb-frontends/stv0367.c
+++ b/drivers/media/dvb-frontends/stv0367.c
@@ -1797,11 +1797,7 @@ static u32 stv0367cab_get_mclk(struct dvb_frontend *fe, u32 ExtClk_Hz)
 
 static u32 stv0367cab_get_adc_freq(struct dvb_frontend *fe, u32 ExtClk_Hz)
 {
-	u32 ADCClk_Hz = ExtClk_Hz;
-
-	ADCClk_Hz = stv0367cab_get_mclk(fe, ExtClk_Hz);
-
-	return ADCClk_Hz;
+	return stv0367cab_get_mclk(fe, ExtClk_Hz);
 }
 
 static enum stv0367cab_mod stv0367cab_SetQamSize(struct stv0367_state *state,
-- 
2.32.0

