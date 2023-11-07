Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 029BD7E359A
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 08:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233066AbjKGHP3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 02:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjKGHP0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 02:15:26 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB600DF
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 23:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1699341323; x=1730877323;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eyQeygwlZ1ByqlmDBU/FTZfrKC1s/dNLG4fNmcTM0G0=;
  b=jIluDWvR2Ed4y2Zl6TScxBJ5j1q/Dzu7lCaK1WugUcggpKvmcIyEsOPA
   bHp0Zq19yCuIRAmWSUCPFvZdJlFs0Z4kPUrNeMkj83dvyQopHJBF5V6d8
   A9vWeScl/jF9A92dUm9gQe40Zd++sgSwvJRO6dqWX/3l52hiF4KvMaXmd
   SrGxFzEtDuDEJYdZohb4otwAEEh+5nHg/shXcnF7BEyRfh/eELnRe+zxn
   N71zSkrDdmJu1wVTCWevPcX1QCF1ZAfSyMqTSD8eQuvKSyxsvdugY6Fp1
   FWep9GgoHIqv9bZJBnKuLLRl2c5WYS2UCNgxE9pOGFdJX1Kp/L1JwitXs
   A==;
X-IronPort-AV: E=Sophos;i="6.03,282,1694728800"; 
   d="scan'208";a="33840803"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 07 Nov 2023 08:15:21 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2055628007F;
        Tue,  7 Nov 2023 08:15:21 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: amphion: Fix VPU core alias name
Date:   Tue,  7 Nov 2023 08:15:21 +0100
Message-Id: <20231107071521.953318-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Starting with commit f6038de293f28 ("arm64: dts: imx8qm: Fix VPU core
alias name") the alias for VPU cores uses dashes instead of underscores.
Adjust the alias stem accordingly. Fixes the errors:
amphion-vpu-core 2d040000.vpu-core: can't get vpu core id
amphion-vpu-core 2d050000.vpu-core: can't get vpu core id

Fixes: f6038de293f28 ("arm64: dts: imx8qm: Fix VPU core alias name")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This is technically not a fix, but needs to be applied together with together
referenced commit in the fixes tag.

 drivers/media/platform/amphion/vpu_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
index 1af6fc9460d4d..3a2030d02e45e 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -642,7 +642,7 @@ static int vpu_core_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	core->type = core->res->type;
-	core->id = of_alias_get_id(dev->of_node, "vpu_core");
+	core->id = of_alias_get_id(dev->of_node, "vpu-core");
 	if (core->id < 0) {
 		dev_err(dev, "can't get vpu core id\n");
 		return core->id;
-- 
2.34.1

