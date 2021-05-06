Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A4D3756EB
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235625AbhEFP2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:28:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:41060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235566AbhEFP1x (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AD9A61969;
        Thu,  6 May 2021 15:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314784;
        bh=CljwneJOzsAzCxr1z7NSaPn2lzrNFeMbh5spoGp6sG0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JpkDG+1kkaRH/dCZPmcLtq3DaDCDXgF5xWcjAlKhOuiUr1z/IQVXCsgyYy2omoce6
         /J75nCgEPRGrT+lFqehcRMdlScj/mf7jCFr2Z9aBMBMxECtiL4J6s64/MbFBeptZlX
         NZDUMytGMTCucl0bBrCTjkzqxTUtfV8jvInIhciF+n+CBWTTMvyzPwd01dvWT+aKuc
         O0fDecAngeMhSfJ2WbQRVDCOwVvnmXm3mb0lMpLfQ3Wg4d9Buv7RFYV5CMBMueHuLm
         G2QP2lombNU9zFcZ9gkn7ogCARdt5wj9AvXbuLpzWkKC640nDWOaY8D5R+22RRDvr4
         mBIh405q8I3mg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left8-000SCd-FN; Thu, 06 May 2021 17:26:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev
Subject: [PATCH v5 25/25] media: hantro: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:26:03 +0200
Message-Id: <0505970478fcb86e190ecdc4aefe55c9982ae7d5.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

While there's nothing wrong with the current usage on this driver,
as we're getting rid of the pm_runtime_get_sync() call all over
the media subsystem, let's remove the last occurrence on this
driver.

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/hantro/hantro_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index eea2009fa17b..74d6545395f9 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -160,9 +160,8 @@ static void device_run(void *priv)
 	src = hantro_get_src_buf(ctx);
 	dst = hantro_get_dst_buf(ctx);
 
-	ret = pm_runtime_get_sync(ctx->dev->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(ctx->dev->dev);
+	ret = pm_runtime_resume_and_get(ctx->dev->dev);
+	if (ret < 0)
 		goto err_cancel_job;
 	}
 
-- 
2.30.2

