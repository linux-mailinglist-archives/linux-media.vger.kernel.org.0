Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 555C836C2C2
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237717AbhD0KPx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:35422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235555AbhD0KOq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9DD861422;
        Tue, 27 Apr 2021 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518432;
        bh=CBbCf8lLczURo0R8ANC6iiJbxWCN1ESFz/X/hIdzJFg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YBwcXBVY4VdpZ7kio+28mV5gRRMhpEp5iSmz4wk6pxNYNbF5BnTIch2YNsMLYQUMP
         u5BbqWGPYCuN8LTPjatvDMyy2jRHJEunQd8/+S2E9/fAX5xGva7r78PgGbDoJTgTF7
         rre8kaJcMcGMq8RwpeP6nMzqR+t/REGQzHmocQ023aN2XVj/YuqIAovnC5ncMmfqhu
         B/7J9cyYfAQB54s7VY3IzEmmqOuxOsRMT98R9SxTTHLKLlIGE+/0U2sZTi1R3elyc0
         RPnWjile71DxUi3MfB0kZjwp17jJRVIdBfNUzLZDpimpbegNWw9eY28RMovqMStn2H
         qNvCzq7ykmxeg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj1-000j7I-2V; Tue, 27 Apr 2021 12:13:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 56/79] media: i2c: ov9734: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:23 +0200
Message-Id: <69eecab44bb0d431ea0403ee66f88f2249093824.1619518193.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov9734.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index b7309a551cae..ba156683c533 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -644,9 +644,8 @@ static int ov9734_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
 			mutex_unlock(&ov9734->mutex);
 			return ret;
 		}
-- 
2.30.2

