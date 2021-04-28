Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D958A36DA1E
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240460AbhD1OyF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:54:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:36302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240304AbhD1Oxe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22A4F61554;
        Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=dO1gD2vCTyNaQMmr4CD5RrufRsq5HOpPc9z13n0Rohk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kCX5EGCo/+tl8FiqD+iNAbou4vWiupP08Ja8L3uTC65gi9JfE/CQToRBSiYRBXdk0
         Yw2U+kLbsDYq/XQzgAkCxFm72cVF/5JmFhTv1h4X1tfjAV/hScgHc2YCPzGWFCeGfQ
         JIT+/ymvxUOJ2xHTBMTy1xo8ACpTLPdnt0UYsDie+L4PRYifDpexKYGHf+2BrTWP+j
         3D47LMx6DT+8/l1DAYIjaWS8yV8QCKuXDo8vOibUBAyxBLTQ2oj6O/I64F6hSHNC5p
         ATCeTtSBNZo1zWs8rhdRgNsPwd7kiww9HFQS0W26E1NYNcGyjxuzjG2yeBylpJ3vC8
         XL4KE9+6Np9Kg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001DqM-0u; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v4 16/79] media: mtk-vcodec: fix pm_runtime_get_sync() usage count
Date:   Wed, 28 Apr 2021 16:51:37 +0200
Message-Id: <b2f5f6e6287d4b56530dcf51b25b5a1c009381f8.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
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

