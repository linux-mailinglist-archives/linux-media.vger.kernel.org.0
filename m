Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16D6636C2A8
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235603AbhD0KPS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:34882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235443AbhD0KOh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 104C861451;
        Tue, 27 Apr 2021 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518432;
        bh=nPYpAR91E3rgdblnM1RIaAoqqFVi+fAvcFwJJ6A4j/g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nyB7zNaYGZV4naMl/LDAOORTpR91EAqBlvt0LS0ik3sdNk7RtxwJ+auTC0lI5nRoO
         pAA/5g7xCxr1fwn0XCfeGxu6yY5BRWLO1ie2M1hB4k/rxhpbl/Nl3WKmudUyFqBwQo
         sSFoiVIj+WjEaFifqL71B7K06MfMPpqcVjgmY6Na7x/6Kunoej8tnrywf5fpuuJQ8q
         DmCf2Crusd8EMQ9k3C81MVmLdcFJc/X7kBN0EJ2iUaH8ErsUjpfqaG21S6ywV/6o8N
         th481aO8jWp0YwHn1Q6ATUJEnmEhVBMUsTLmufHKDyeA58HzfYRh5AstGIniguHOH+
         puWq4rbDC5akg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiz-000j6H-Rv; Tue, 27 Apr 2021 12:13:49 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 35/79] media: i2c: imx219: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:02 +0200
Message-Id: <7766f23539a0a12f8e76cc01477cbcdc6013574d.1619518193.git.mchehab+huawei@kernel.org>
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

