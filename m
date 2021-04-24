Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2381E369F9F
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244353AbhDXGsp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:48:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:35766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234596AbhDXGqp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2CF06195E;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246734;
        bh=Z0USvyTZ3fXu9UhxRT5FD354jvvwjeNjqwFRY+Zs3l8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dqsBjn9/Bf2A6M/UwcnnjdPljaB6hUBS0NY7XxvLCEhshXtq6l7cueFP06zJx9XaS
         Ddx395lER0WC5ZU/8eavmUodQnaDzi8le4hIYKsXlCwybtvOYoXZYJaeOUueHpQYnv
         5AOZ8Qc2TxWyXXxANCNZ5rDrbHDit3qTEmcdjPErnZ54q+SavCDc9pKTL44bixHoY4
         iSUu9FJBZI1PjeS/W4Lxd3SOv1zNDA59NkjglXdQ9n0rZmhggylgHad72CCfQ7KlZ9
         /KyYkfNv5pACeMsOIRSz7bZvn4TdQRIbupmbWQOn7R8nG6u0sBd7RvFuJC/Z3QU9QJ
         Y08ZgkQp4rUpQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jg8-Am; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 50/78] media: i2c: ov8856: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:00 +0200
Message-Id: <3694b57920df99087c1b9c94c2489935d8e633e4.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
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

