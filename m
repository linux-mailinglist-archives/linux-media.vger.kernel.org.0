Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2B236C34C
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235732AbhD0K2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:48146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235475AbhD0K2C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EBC5613D2;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=Z0USvyTZ3fXu9UhxRT5FD354jvvwjeNjqwFRY+Zs3l8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U4qOa5eXEbpGJEnpDsn9AftbTcE4dVqd2rj0odesCHZJYdwjIatSJV6uN2bmLq4gT
         s+R+f5l4/CpAQGOBn0roIpgTfK7sILJqUb4QT6O/A05ME+iC4X4rYM9LMQylRwUvYO
         jy1slmdaBWu7g0UE6Rx3dGNwq/xR7HxYGvBbWULJTpI5tmKE2MtA0aK5J9HkqFSBKn
         iHvyT5BfLRnqu3pTjvQtBZ5GiWSKOpBUUUDGtS4U+IDUyoW6N+pB/RmG8izS4XdjUl
         8qXcVUd+4rtqvk70yKmhPTQ507EPyu5pg+Eu7Ph58zQRorPfi8XTzV6sg2ntgKzyQZ
         G8NuztiTuARDg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvx-000o1p-Vo; Tue, 27 Apr 2021 12:27:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 54/79] media: i2c: ov8856: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:44 +0200
Message-Id: <5e930e81ccf214e05cf5da85a34d8d9a79f21696.1619519080.git.mchehab+huawei@kernel.org>
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

