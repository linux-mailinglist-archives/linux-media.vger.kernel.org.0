Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDA845CCF4
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351287AbhKXTQ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:16:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:53250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351245AbhKXTQs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C7876109E;
        Wed, 24 Nov 2021 19:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781216;
        bh=7ACxNdIYeMx8BUyKvevWfbu+SlAB3f7acPwte6T0ctw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UvF1O2K2wz8dTg8lVTJTsof9T5iLyiw4owWRk2izeBHKRcG+Abhny1WbI4EmdgzAD
         U5a0pKb0WQcWlAi4Io5/jfeS2d2w4zE6yWNec3/1tIl/hTHESOx7082s0y/H8GC6T9
         d6+kAcc0gUG/mbbEdvxN53xxP1ATPmlgS+wL1hqWXaxE4nLhB9Lri2pCi/aZBhfdvU
         AIf7snghwdHLS9B6FuqViHSDnYuA/qP8tGcRr7yPEJdtahQhrp+xLIWvgGS0RWR+e2
         WLVJHbaUUExcGZtWYgkl5wcXfK2WUKVK79AN3njb0ba9nwyHqcmuhSadFb8b+8qZmd
         SpqY/WqAY6kIQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q60-Nr; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        llvm@lists.linux.dev
Subject: [PATCH 18/20] media: mtk-mdp: address a clang warning
Date:   Wed, 24 Nov 2021 20:13:21 +0100
Message-Id: <63ecb865c4f2b81862f5e6ac0dea497d3e0baca3.1637781097.git.mchehab+huawei@kernel.org>
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

The typecasts at the dvb-core generate clang warnings when W=1
is enabled.

Such warning is harmless, but it causes the build to break with
CONFIG_WERROR and W=1 with clang, so do the cast on a way that
it won't produce warnings anymore.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 976aa1f4829b..11285717577f 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -148,7 +148,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		comp_type = (enum mtk_mdp_comp_type)of_id->data;
+		comp_type = (long)of_id->data;
 
 		comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
 		if (!comp) {
-- 
2.33.1

