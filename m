Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F176036DA66
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240750AbhD1Ozq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:36992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240469AbhD1OyI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:54:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E71E961968;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621565;
        bh=jUMHPV3bIyEEarOloeBBF8gl6HQ5pp77fQglK6LRWcc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BivV3NjJj/ywJDUjznQ+oytWJz0gsTGh3T+6fnDvdE+71FPfPCY+6KscrxyOFn9W7
         rB6sZEw4xxBEm+qqBbyyMBmYmzKKxNGHT6Q2A87ryb9dBsch+cPQhFamu0ODMTqsOy
         /wpWYFx2Vb2/R+SfqpAx5l3f32+Sy0Ivm/i4rDN80f4UMuZNgljufl2IpHg4PmRr+o
         Q0djl8wv2PQ7nDjoaiyXiCSbKzAz4yoasj6O+RHx28XVSqGz/Hrl7KXeqMLgunvM2j
         dtCLPaqyuFFxokL/dBaLvLzV/LEViEIlCVV6kX8cnhd821c05GR7E9hoqsurXKtS0W
         uc/w3eXiwKCUQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYR-001Ds3-1f; Wed, 28 Apr 2021 16:52:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 51/79] media: i2c: ov7740: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:12 +0200
Message-Id: <423f19c5fadcdbf5cddab08ab926477177961890.1619621413.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov7740.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index ed6904b2e8f5..74219f67f245 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -624,11 +624,9 @@ static int ov7740_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto err_unlock;
-		}
 
 		ret = ov7740_start_streaming(ov7740);
 		if (ret)
-- 
2.30.2

