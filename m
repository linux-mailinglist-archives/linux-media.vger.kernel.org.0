Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60F4E36C27B
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235570AbhD0KOq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:14:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:34772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235351AbhD0KOe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0708F613D3;
        Tue, 27 Apr 2021 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518431;
        bh=cJmIogEt8DtaRrLuirE0smJSOENxo/aAnd7cgWYfYDc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KZp74C/N3xULsOG1NcjGyCnHrQUbBn7L4C6SjULa6jlIkjkwb4uQjAmyz7MBIatyJ
         8aZXyLOROj+YrO2pBurSY+F68uEs1Jq7JH8uqCwePJcN1IGEgiLVpmyxerCcjGmQIf
         ZTmIUdmWmE3sxwJyOEeTKlY2LM2tJP+uzh4xlcCEuQ3IuqdQWKS9j1AdkFOrYN6Vor
         RafH87t0RcMEZ2XSQQBWv5wtqRM3l8dW6T/m2a2MOTN6eezeZbhPil2BAoyM/Z8ZFK
         9q5GHr2H+784p6XQXO43aCpof7AgRGZF/J7/LD2TXJKgfIX/Wx5n9U0dNdaQ39pRd9
         JuMWqXSUso+VQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiy-000j5P-RZ; Tue, 27 Apr 2021 12:13:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v2 17/79] media: s5p-jpeg: fix pm_runtime_get_sync() usage count
Date:   Tue, 27 Apr 2021 12:12:44 +0200
Message-Id: <b6a5ee6479e005c271849b27e752c10f0fd8a150.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
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

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/s5p-jpeg/jpeg-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
index 026111505f5a..c4f19418a460 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
@@ -2568,7 +2568,7 @@ static int s5p_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct s5p_jpeg_ctx *ctx = vb2_get_drv_priv(q);
 	int ret;
 
-	ret = pm_runtime_get_sync(ctx->jpeg->dev);
+	ret = pm_runtime_resume_and_get(ctx->jpeg->dev);
 
 	return ret > 0 ? 0 : ret;
 }
-- 
2.30.2

