Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234DE36C2CC
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237784AbhD0KQK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:16:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:34658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235591AbhD0KOs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3311061922;
        Tue, 27 Apr 2021 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518433;
        bh=xptLiLCkGNJuz7QvbfWAgofgWCEJyWuHFXhmxlDN2vI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V8SvGjsspDfm0f4oLRWagweTDHcBq+I65mtRH9GDCgOGhJNQh/w4S8YPgVYBN+oHg
         LpAJyNKJERXzYKRpABbvHip/BdXCo2S2WMIb6TaSDtf+aM+LrkPp676vvGDXjMy3oz
         MnPID0Mb3Wqg8DlMztHz+eToj9nPREI+M50JzaKiTa1cxLXYC6fNtc3/u5QfleQdbg
         NTIzlgZXNnQwV3k4TsOd/f8mmLhZGrsvDx3K7FHIrRgaye6BpgCctMuurG5FPGBtBE
         YOfa5tXRGpdNJslzFodyWCIGD7iy+Hh6Buz3ZOaJruYCbVvZ4smkAJOaAvhiyhStIR
         qFJhm+b0it46A==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj1-000j7X-DE; Tue, 27 Apr 2021 12:13:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 61/79] media: coda: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:28 +0200
Message-Id: <2016c20ba94df57736e677fc7acf5cb109ac75a5.1619518193.git.mchehab+huawei@kernel.org>
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

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/coda/coda-common.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index bd666c858fa1..13ff05e7d850 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -2660,10 +2660,10 @@ static int coda_open(struct file *file)
 	ctx->use_vdoa = false;
 
 	/* Power up and upload firmware if necessary */
-	ret = pm_runtime_get_sync(dev->dev);
+	ret = pm_runtime_resume_and_get(dev->dev);
 	if (ret < 0) {
 		v4l2_err(&dev->v4l2_dev, "failed to power up: %d\n", ret);
-		goto err_pm_get;
+		goto err_fh_del;
 	}
 
 	ret = clk_prepare_enable(dev->clk_per);
@@ -2709,6 +2709,7 @@ static int coda_open(struct file *file)
 	clk_disable_unprepare(dev->clk_per);
 err_pm_get:
 	pm_runtime_put_sync(dev->dev);
+err_fh_del:
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 err_coda_name_init:
-- 
2.30.2

