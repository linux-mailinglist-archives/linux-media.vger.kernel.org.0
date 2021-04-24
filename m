Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9849369F96
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244173AbhDXGs2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:48:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:36098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237175AbhDXGqk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 205F86197F;
        Sat, 24 Apr 2021 06:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246734;
        bh=9V28x/0yZtyv8nyV8uH7fSioPt4mARji1tVhL7JUs2c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a1/QrOgPF/5qFxtxLBIQCeeYsPbkHuJdY7rzJW2c2TR3reH1rDA7DqdG0C4nAw59M
         Kv5f6Yn4i4BUh5hct34L/ifwZaPT1RwYi3O2jhpTZg/P6pkzk48ON32+Ep7ooW8hKN
         y7Odv8BZWOq6kj7Z64LY1+q9mvoHZJ8i5Cm8QsOF884Pkex4iNySofy09sXqSlDLmz
         Ir66AJWL1aL/FITDaYzV9gdoeau9nzXPYHde3v+WOmMHH+tgRsCtYy7Og8EvQ6djVD
         O0GZif8Xv0LMtVgLf95dFfP4qg0evKRQlFgBE4990pWR93sve6LHX1+DnVKOGydAnC
         0Ir42A9cYhAdg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jg2-8w; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 48/78] media: i2c: ov5695: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:58 +0200
Message-Id: <ece8b96a8e54b36016a543e068bf2736c7b875f5.1619191723.git.mchehab+huawei@kernel.org>
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

