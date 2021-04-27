Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74FA336C3C4
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238319AbhD0K3g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:48278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237999AbhD0K2c (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFD3061443;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519237;
        bh=nPYpAR91E3rgdblnM1RIaAoqqFVi+fAvcFwJJ6A4j/g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b0Nt8VqlPtaZy9yemo4qCkgWmuuP7AEJmdQPTgtLLoJ/84eCKQwHVhyfd+18d8XMi
         F0jMoCB9z982bvvJwdLzo6PYHORbcNsX17SQVArVUi0jo70cDp1XFBKzg4AKXy8mjA
         U5mVuR+nwTevQ2/PnlAuI8mErhAEpouttMCCJE8Hg6Mbq4QfFq6ZDgkdlLC9T8eIfA
         sbXiesKBInS5uLlO7pCzT1m2+nZw3GXtAK3HNxcC788xE01k+MF3rEkevSyisMWcOu
         XhiMztLj5SeWk9A0e8QG1Jd+aF3o2N40YC4O9LHzBHs46jxWwQEYUwKQBDeHMgIlb3
         uzRfcMNx7n0Mw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvw-000o0u-S3; Tue, 27 Apr 2021 12:27:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 35/79] media: i2c: imx219: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:25 +0200
Message-Id: <b699e30328abbfb952e3b64a948b90bb5243ec11.1619519080.git.mchehab+huawei@kernel.org>
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

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/imx219.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 1054ffedaefd..74a0bf9b088b 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1035,11 +1035,9 @@ static int imx219_start_streaming(struct imx219 *imx219)
 	const struct imx219_reg_list *reg_list;
 	int ret;
 
-	ret = pm_runtime_get_sync(&client->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(&client->dev);
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* Apply default values of current mode */
 	reg_list = &imx219->mode->reg_list;
-- 
2.30.2

