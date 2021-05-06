Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA5533756A7
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235381AbhEFPZG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:25:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:38278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235218AbhEFPYd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A99A561410;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=9V28x/0yZtyv8nyV8uH7fSioPt4mARji1tVhL7JUs2c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EFZ8hIqArABpk9DMDsf/G1CDPC2hBXzDlWqScqzaDy2PmCW216C90N7mKmCcTosVk
         v/LYTGIJGoMmGHIzjDDBTlzA9cZt5SP3ifKnrsL3Mm1kj+zcbcxM5ZR0Z3Lw84yzJi
         wBastm0hfg/0iBXMFQRlz3zpMlCY/iDTttmyAJ2jbYawuKXcW599mOhgoCel/hBWW+
         D/94K/HajOndVnUanH6cRqGJBINikcG9zT0xB3lQBPoCBbiVh9ZmHkqwGVy8icz74P
         L9FKMB6A775S/fk7Rb6juADRSlx5laMFyiDq9UB1eugayIOT1C4PlhAH+pTqNwSint
         UU7druy0MzLzg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000Rw2-QQ; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 23/30] media: i2c: ov5695: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:23:19 +0200
Message-Id: <2dec6444d6c68c1acd81b5d5cd4bb6a437104959.1620314098.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314098.git.mchehab+huawei@kernel.org>
References: <cover.1620314098.git.mchehab+huawei@kernel.org>
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

