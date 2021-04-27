Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E51436C376
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237891AbhD0K2a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:48138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235583AbhD0K2E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57DE2613FB;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=dO1gD2vCTyNaQMmr4CD5RrufRsq5HOpPc9z13n0Rohk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fbWvtVHWTAey+hipESaA7D/+JGsH4iHUJ5QUnJWbaQ90t2lqsJR8DxjhYJ4tZY9NE
         7sUWaQNJ58a/gx21g/v8U9+dTCqhpPqqvyzXz6440q615rfHwbz/ngOS98Gv1aUW1e
         6F85UFHzWeu9qFsabeZwnEBYC2YHI8XMNNVPWrkt/LdI19wuwtWCzlfILd1kFofYH6
         ZJwI2DHv0V03BLexWkLKicITH1k/ksrp8FrP+wEaIPMwLy8+d37OwN/pVWARJFLSgO
         m8PZs/ofoceMQDgm+qgcZRXyBjxHu7KWFqlqaWUu3rXaTFPxccq6ndoUYBczc2Vo12
         VxGae3nG6bBwQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvv-000nzz-NK; Tue, 27 Apr 2021 12:27:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 16/79] media: mtk-vcodec: fix pm_runtime_get_sync() usage count
Date:   Tue, 27 Apr 2021 12:26:06 +0200
Message-Id: <5ecb7c839255ae1b74a4f623cad05cc1a1ed3efe.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter and avoid memory
leaks.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index ddee7046ce42..fe096fe61c9d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -92,9 +92,9 @@ void mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
 {
 	int ret;
 
-	ret = pm_runtime_get_sync(pm->dev);
+	ret = pm_runtime_resume_and_get(pm->dev);
 	if (ret)
-		mtk_v4l2_err("pm_runtime_get_sync fail %d", ret);
+		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
 }
 
 void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
-- 
2.30.2

