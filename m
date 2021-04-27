Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 569BC36C2BF
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235690AbhD0KPu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:35420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235545AbhD0KOp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF2866162B;
        Tue, 27 Apr 2021 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518432;
        bh=Z0USvyTZ3fXu9UhxRT5FD354jvvwjeNjqwFRY+Zs3l8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=miNL4dgF/bGac4VlztluU+MAcrxwIFMPrhKH8et4MrOh2b9TxYJXmbvXEXd9LRAWn
         g6eyjFp9VKgsq4dMqA426V9E/U7jdncuYKp4rSGFDZH1Hj7Ch3OWJbfbjb89jZ1mGA
         POGsOXA7mm3AWrXu8Gl+qPxDS/rKVeJEzLyaQIJIBV3pmDJp45PV8SaVAMLkVf7EbR
         W97/usTyhxeAKcCr5tZw0v0n2WRyY4nBrQyPJ6ffisSNEEnbKheqRclmFbAw6m6jst
         DeV7pOfjCjVLP2MKLWEFgk/q3kMJuEc2aipzb/HlYnw1nVWLl0R51iUg99AzbaAeUW
         cPzXvaHHerbkw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj0-000j7C-Um; Tue, 27 Apr 2021 12:13:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 54/79] media: i2c: ov8856: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:21 +0200
Message-Id: <fbde1d08d709e461ea45bbbd2fe371e42d712bc4.1619518193.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov8856.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index e3af3ea277af..2875f8e4ddcb 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -1340,9 +1340,8 @@ static int ov8856_set_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&ov8856->mutex);
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
 			mutex_unlock(&ov8856->mutex);
 			return ret;
 		}
-- 
2.30.2

