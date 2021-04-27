Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4567136C2B9
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235639AbhD0KPi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:34660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235530AbhD0KOp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3D3961606;
        Tue, 27 Apr 2021 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518432;
        bh=9V28x/0yZtyv8nyV8uH7fSioPt4mARji1tVhL7JUs2c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JdxzXEI5OVxGEVs1HfWhvEf7coejpuy3bX1jNgtvmn0OaL2G9p62heiGIexGShTLy
         isnzKD6LG6KNfE/XNSvLJ4k6sL7UzMcdbKog6b86iju9Q7gsBQihvcyq3cHG9RTC4M
         Wh3jcydfUA3KOueIv05a/Bg3ONeNam7TxWGWoxDWLKMn+OzMrUq1lA803wwKycM+T1
         TxnrVlOzQFgt5IlFQXM5zmxCSmZnO4ivJnuWhHuSAR2NXFppSPLuEqNIKzMK//BNEp
         QEDaCltVZn5VrWPlZtXIbr3V/5FizPlydJVjJB2nU5BP3GtZ72IqijLY8nKA4hiD3v
         gHKp56BqoSFEg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj0-000j76-R4; Tue, 27 Apr 2021 12:13:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 52/79] media: i2c: ov5695: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:19 +0200
Message-Id: <bb21f44f344f7351492ccf8aa913e3aecb1f8555.1619518193.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov5695.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index 09bee57a241d..469d941813c6 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -946,11 +946,9 @@ static int ov5695_s_stream(struct v4l2_subdev *sd, int on)
 		goto unlock_and_return;
 
 	if (on) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto unlock_and_return;
-		}
 
 		ret = __ov5695_start_stream(ov5695);
 		if (ret) {
-- 
2.30.2

