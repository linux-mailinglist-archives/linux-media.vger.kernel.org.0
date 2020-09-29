Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD3327D02E
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 15:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731327AbgI2N6i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 09:58:38 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:47096 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731230AbgI2N61 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 09:58:27 -0400
X-IronPort-AV: E=Sophos;i="5.77,318,1596492000"; 
   d="scan'208";a="470079965"
Received: from palace.lip6.fr ([132.227.105.202])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES256-SHA256; 29 Sep 2020 15:57:41 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Kyungmin Park <kyungmin.park@samsung.com>
Cc:     =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Joe Perches <joe@perches.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 19/20] media: exynos4-is: use semicolons rather than commas to separate statements
Date:   Tue, 29 Sep 2020 15:14:42 +0200
Message-Id: <1601385283-26144-20-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace commas with semicolons.  Commas introduce unnecessary
variability in the code structure and are hard to see.  What is done
is essentially described by the following Coccinelle semantic patch
(http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/platform/exynos4-is/fimc-core.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-core.c b/drivers/media/platform/exynos4-is/fimc-core.c
index 08d1f39a914c..db6e548fe08e 100644
--- a/drivers/media/platform/exynos4-is/fimc-core.c
+++ b/drivers/media/platform/exynos4-is/fimc-core.c
@@ -214,11 +214,13 @@ static int fimc_get_scaler_factor(u32 src, u32 tar, u32 *ratio, u32 *shift)
 	while (sh--) {
 		u32 tmp = 1 << sh;
 		if (src >= tar * tmp) {
-			*shift = sh, *ratio = tmp;
+			*shift = sh;
+			*ratio = tmp;
 			return 0;
 		}
 	}
-	*shift = 0, *ratio = 1;
+	*shift = 0;
+	*ratio = 1;
 	return 0;
 }
 

