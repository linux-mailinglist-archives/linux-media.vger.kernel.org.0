Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B945036C2C6
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235542AbhD0KP4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:35440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235558AbhD0KOq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E942161864;
        Tue, 27 Apr 2021 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518433;
        bh=6SWDMHkSlrYNzq7GtPd5DH9pbQJCAbHbxO2AKYAv8vU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MK11RwPeirCdiAyVUeqqhauMMB1T+1sNT0tn7okuvx+uNHbHNP9KJ6+MPTKTqAnwI
         mVbYJFubDdrYxX0Cato53OfyH0hn4syrPQoKowBGLkPR47JVzeYYlHWEZKJYUE5zkw
         Fd4Z65y9BIvDIpHzb9j0fNpbAY6RsyPyNc1xEmGUIBDVi4gm/yDklFrLuxtvqgQP2K
         MrrRoTvlk+cpjQpuRhiy84ZOlAxM8JGhwrDQWu2/qUV0siPS8MWroN76+Jo3JYcRKo
         ULHz1o9nIJQa6q9g0pC8762lzZ2j5Zfag5E9DwxG7Lrqz12oKjSzs/N3CjV5lDDhve
         f2zD/UKPoafpA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj0-000j6T-3i; Tue, 27 Apr 2021 12:13:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 39/79] media: i2c: imx319: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:06 +0200
Message-Id: <7dc45e7be7d808d638029dd515e972f9ec184f04.1619518193.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/imx319.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 38540323a156..4e0a8c9d271f 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2141,11 +2141,9 @@ static int imx319_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto err_unlock;
-		}
 
 		/*
 		 * Apply default & customized values
-- 
2.30.2

