Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8587356DC3
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 15:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347483AbhDGNso (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 09:48:44 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42253 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234087AbhDGNsn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 09:48:43 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lU8Xn-0000sO-QT; Wed, 07 Apr 2021 13:48:31 +0000
From:   Colin King <colin.king@canonical.com>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: venus: core,pm: fix potential infinite loop
Date:   Wed,  7 Apr 2021 14:48:31 +0100
Message-Id: <20210407134831.494351-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The for-loop iterates with a u8 loop counter i and compares this
with the loop upper limit of res->resets_num which is an unsigned
int type.  There is a potential infinite loop if res->resets_num
is larger than the u8 loop counter i. Fix this by making the loop
counter the same type as res->resets_num.

Addresses-Coverity: ("Infinite loop")
Fixes: 3bca43585e22 ("media: venus: core,pm: Add handling for resets")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index dfe3ee84eeb6..5c0a9aa23e83 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -868,7 +868,7 @@ static void vcodec_domains_put(struct venus_core *core)
 static int core_resets_reset(struct venus_core *core)
 {
 	const struct venus_resources *res = core->res;
-	unsigned char i;
+	unsigned int i;
 	int ret;
 
 	if (!res->resets_num)
@@ -893,7 +893,7 @@ static int core_resets_get(struct venus_core *core)
 {
 	struct device *dev = core->dev;
 	const struct venus_resources *res = core->res;
-	unsigned char i;
+	unsigned int i;
 	int ret;
 
 	if (!res->resets_num)
-- 
2.30.2

