Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDE1837569A
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235318AbhEFPYz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:24:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:38204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235199AbhEFPYa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 522CB613C2;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=KnK+ScvrOSmF+XC/C/B4F8IBvu/svp7LsuDeKcM5sXU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fo3mpoIwlF2YTmD+DnpzMqX4qAaDKE8ReBIJbDjDgurF4qfc0UJ6br3Ir90R8RRPW
         a6hiP92P3yyHTN2KESUN776tbfFmmeIkhh2Vyeg94xZzGcT1VSJQZR6NSAKRQk7mvK
         bnUPM9gSlPyxXEwNgtu24Irp29vV3aKebhYk//O3524BX0dYUKChL/rXZL9SC4oDbK
         5DzP2t/iuW3wvu4XS3Qrp6PhVu5wC+Ud+ojS/j26oVb0bGn7CvJx/jf8mr0Won0Syl
         kQJ/AbyUTltr6+H9p3qS6TCVrJPk9RyvMHBdvr9VKWFEcqw9JUVSi5koYKG9c2oEVH
         kJ1qHtxnxsvjQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000Ruv-5B; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 06/30] media: i2c: imx214: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:23:02 +0200
Message-Id: <057abf87cbfc71a7d4b40db8ef3c72f200e56ac6.1620314098.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/imx214.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index e8b281e432e8..1a770a530cf5 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -776,11 +776,9 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 		return 0;
 
 	if (enable) {
-		ret = pm_runtime_get_sync(imx214->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(imx214->dev);
+		ret = pm_runtime_resume_and_get(imx214->dev);
+		if (ret < 0)
 			return ret;
-		}
 
 		ret = imx214_start_streaming(imx214);
 		if (ret < 0)
-- 
2.30.2

