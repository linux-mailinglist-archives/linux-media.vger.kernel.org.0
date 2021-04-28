Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3908736DA32
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240629AbhD1OzE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:36356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240324AbhD1Oxi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7994E6191D;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=nPYpAR91E3rgdblnM1RIaAoqqFVi+fAvcFwJJ6A4j/g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JBsqfn0quCCj3MqgqP6ZHRmkqOS3cmiQXdWx7T7zZvxWkECmOWn61aNxtzP/YPdU2
         JV7UdHJdfL7nwkhIcDYqVHUs3gigUqilKVMPnpoj/qQndD4y6gb3qrDq6f0+FnLSHH
         rvpjEUrn4ZHAqhl1ItIrK1PBF0kkTXVhj1uaRXMwKd09NJERvdWAjNj2b2lWSdfnJB
         uLfPCFZMTnGsByeTuwSs2vnkCXXDCcCHhranB4WusZlPXy9w3aAKRATCesvBRpN2q3
         /NfxRl6M/BzIccVtCJBfBWtvbBuTcoS17Ywug80fK5/loBkKjh5b9v6FKBcCL/XU4I
         o0gRz1WY4tQ2g==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001DrE-Hc; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 34/79] media: i2c: imx219: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:51:55 +0200
Message-Id: <de8f64df28c73597a0d31106e63c76c203ca20cf.1619621413.git.mchehab+huawei@kernel.org>
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

