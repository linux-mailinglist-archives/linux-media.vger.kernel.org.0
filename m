Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418A63809B0
	for <lists+linux-media@lfdr.de>; Fri, 14 May 2021 14:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233513AbhENMhp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 May 2021 08:37:45 -0400
Received: from m12-18.163.com ([220.181.12.18]:42094 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232712AbhENMhn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 May 2021 08:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=MoSSP
        kXKo4o6qIFWqVEQl4V2Nc01N2F0xON63x+w1u8=; b=PFUngJNoSIPqXYGmCc1q9
        oDhWFnEU0ucPX/X0nldZFP8E1163/e1mGIG2dtlWEYI+9AXRUOD19FYF3w8YH6FS
        AA1dRzfw+o42zxEQspsOaOF+3pNc1eAmLFT27gaqNR7XrHOfyNpOKhBtzdPK0ASr
        HAkkx+u1k1+5rVQMCKEhZE=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
        by smtp14 (Coremail) with SMTP id EsCowACXkcHBbp5gGuSZjQ--.23353S2;
        Fri, 14 May 2021 20:36:18 +0800 (CST)
From:   dingsenjie@163.com
To:     mchehab@kernel.org, matthias.bgg@gmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ding Senjie <dingsenjie@yulong.com>
Subject: [PATCH] media: mtk-vpu: Use devm_platform_ioremap_resource_byname
Date:   Fri, 14 May 2021 20:35:21 +0800
Message-Id: <20210514123521.39296-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowACXkcHBbp5gGuSZjQ--.23353S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Wry3ZF13tw4fWryDGF4rZrb_yoW8GrWDpr
        yvkay7CryrGF4jqas8t3WUZFZ8AF4avayUC393Zw1fZ398XFWDZr18Ja48Zryak397Ja43
        tF45CrW3AFZ5ZFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbsqXUUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/1tbiTgKSyFUDJdSwjAAAsN
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ding Senjie <dingsenjie@yulong.com>

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: Ding Senjie <dingsenjie@yulong.com>
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index 043894f..bfb9932 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -821,13 +821,11 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	vpu->dev = &pdev->dev;
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tcm");
-	vpu->reg.tcm = devm_ioremap_resource(dev, res);
+	vpu->reg.tcm = devm_platform_ioremap_resource_byname(pdev, "tcm");
 	if (IS_ERR((__force void *)vpu->reg.tcm))
 		return PTR_ERR((__force void *)vpu->reg.tcm);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg_reg");
-	vpu->reg.cfg = devm_ioremap_resource(dev, res);
+	vpu->reg.cfg = devm_platform_ioremap_resource_byname(pdev, "cfg_reg");
 	if (IS_ERR((__force void *)vpu->reg.cfg))
 		return PTR_ERR((__force void *)vpu->reg.cfg);
 
-- 
1.9.1


