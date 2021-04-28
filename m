Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36EDA36DA6C
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239791AbhD1Ozy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:36740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240496AbhD1OyN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:54:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA0CA61474;
        Wed, 28 Apr 2021 14:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621566;
        bh=6SWDMHkSlrYNzq7GtPd5DH9pbQJCAbHbxO2AKYAv8vU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GT6O0nt4qbLs0BXJSqPpmzUgFzklLqjIri1f2tLeoqZuz9LcJdWjB349S+TBP6WKU
         x8F1Pi5vVafuSn/nu3YrR4c2DQ4943anN6Ei7AUqvMUQ09vQpmifdYdz1eFuPrI+Ot
         yucgbpNM17yxhgdDybfXpo3tCCT+zFtDNGXiT3bxEgC534pZN7rx1TQ9CDMGc6iYJR
         1CZhKgg+gaXMSiEmUQ3im6rBBLN9z7HIS5DOgIi7SxC79vCccGbCrGadww3JF5UZiF
         TB4jJccOGimPw4GYdlw7Rfwel62hO61K0eciKZx9Yml2SwcOnvrm2UHfnyXERaCjo3
         t8xEn0gecBWRw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001DrQ-LG; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 38/79] media: i2c: imx319: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:51:59 +0200
Message-Id: <353715a6b23c075e43d4d21bb77bea6abb2d13da.1619621413.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/imx319.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 38540323a156..4e0a8c9d271f 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2141,11 +2141,9 @@ static int imx319_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto err_unlock;
-		}
 
 		/*
 		 * Apply default & customized values
-- 
2.30.2

