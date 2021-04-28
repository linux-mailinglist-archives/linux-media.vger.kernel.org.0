Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A816D36DA5D
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240722AbhD1Ozf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:36930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240436AbhD1Ox4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F13896195D;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621565;
        bh=k96A/wu5csXQdkebmEvDXUWzQhtBwXxGUFyh7/8ot0s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZkIGnpy5sAMljMt9rKvtwT7hx2n6ZPobSF7j9e9bBLT5aEbuJ8N0caeC9O4hyIFQG
         B2aMPlI7bTD94cgLwIZF/KhqvCSBnMcQKZ2n/yyFbAMIOzLB2SJOxigGQvs2igY1Y8
         +W5QVG7A8/+JcPsFGmFbhKDV0M2VkBkjuclXmrOajT/+B3dbWNs3qKfsICEhxSStJF
         ljBlxsm3V2kEXDhQi096u1VdcudEHWLq+C1wZ7ESdTH73dfMXzM8HXooqoUkue3cYt
         gi1b8d4MwbDjIg0RUhfDe5moQw3DN5s08F6fsOxADpaxBE0rdaZtn0Hf3a1yz3Bpga
         vXlc+LaR4dPDg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001Dru-V7; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 48/79] media: i2c: ov5670: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:09 +0200
Message-Id: <50486e1f4ff4daf24d2a43f641791f0900285811.1619621413.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov5670.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index dee7df8dd100..182f271f118f 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2347,11 +2347,9 @@ static int ov5670_set_stream(struct v4l2_subdev *sd, int enable)
 		goto unlock_and_return;
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto unlock_and_return;
-		}
 
 		ret = ov5670_start_streaming(ov5670);
 		if (ret)
-- 
2.30.2

