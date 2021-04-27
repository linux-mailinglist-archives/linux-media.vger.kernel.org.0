Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF26136C347
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235663AbhD0K2F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:47814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235408AbhD0K2B (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E56C76127A;
        Tue, 27 Apr 2021 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519235;
        bh=5AHhx16DJL5gdJqgumKoh72s5QcxkeHszhw8tqlTmq0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m2GPWkxvHZOlWbkTSHetERhPlOy8zq3V4Lsk8pt7/i+GzudFxPpOpPRsRQSCogTMw
         2afTeEMa5Se1g/uTW9W0DQsIOW38JynU/lWkj7ICwstHqBR0VfsgxrEZBXi4od3qGz
         d+S3uc4YkRcZptKDixHYbD+ldvI9TTredPrNkaiKieDvYdaYwhaSphHZ/gcJdm2wSg
         z3iascj+yvpxvbADuLWj+924GU+4g8v+X7/g4vRWv+Eh0VDBQLAliLgz4kF8vqojiP
         jub5B3hXmkl6X46GX147HbJc2mA+UwiMpqu4QOqdpVmPa7IW9fLU5JPzt6RS1JMrIU
         ahEsILICxWGCA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvu-000nzP-Vp; Tue, 27 Apr 2021 12:27:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Songjun Wu <songjun.wu@microchip.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 04/79] media: i2c: ov7740: don't resume at remove time
Date:   Tue, 27 Apr 2021 12:25:54 +0200
Message-Id: <cf2c78bd35f9951508ae6e7aac1c8da7ce870e92.1619519080.git.mchehab+huawei@kernel.org>
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

Calling pm_runtime_get_sync() at driver's removal time is
not right, as this will resume PM runtime. This is clearly
not what it is desired there, since it calls
pm_runtime_set_suspended() afterwards.

So, just remove pm runtime get/put logic from the device
removal logic.

Fixes: 39c5c4471b8d ("media: i2c: Add the ov7740 image sensor driver")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/ov7740.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 47a9003d29d6..ed6904b2e8f5 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -1165,10 +1165,8 @@ static int ov7740_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(sd);
 	ov7740_free_controls(ov7740);
 
-	pm_runtime_get_sync(&client->dev);
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
-	pm_runtime_put_noidle(&client->dev);
 
 	ov7740_set_power(ov7740, 0);
 	return 0;
-- 
2.30.2

