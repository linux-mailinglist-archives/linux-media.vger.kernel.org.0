Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E5F2F7657
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 11:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbhAOKMJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 05:12:09 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:36679 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbhAOKMI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 05:12:08 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l0M4k-0001qH-O4; Fri, 15 Jan 2021 10:11:26 +0000
From:   Colin King <colin.king@canonical.com>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: venus: Fix uninitialized variable count being checked for zero
Date:   Fri, 15 Jan 2021 10:11:26 +0000
Message-Id: <20210115101126.9668-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where plat->codecs is NULL the variable count is uninitialized
but is being checked to see if it is 0. Fix this by initializing
count to 0.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: e29929266be1 ("media: venus: Get codecs and capabilities from hfi platform")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 2c63988cb321..7263c0c32695 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -232,7 +232,7 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
 {
 	const struct hfi_platform *plat;
 	const struct hfi_plat_caps *caps = NULL;
-	u32 enc_codecs, dec_codecs, count;
+	u32 enc_codecs, dec_codecs, count = 0;
 	unsigned int entries;
 
 	if (inst)
-- 
2.29.2

