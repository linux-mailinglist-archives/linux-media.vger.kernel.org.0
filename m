Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7918369F68
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236232AbhDXGrW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:35766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233230AbhDXGqQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A60CB61927;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=RKkiGoCDSW3lMHxV9n7JS+4PruB0khbogVRD1m+DqBc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lzTfgeu9At0bf4uiYEAvZdltrs2bGamdmbak/yuxAsJcEJcLtytz95Wa0Pjgjy1uL
         H3mpeFuatUTQC7vNJ/XgshUECkSzvyrLCu8ghzB33anWfge6HIGKYq8N++CDx49w9Z
         mSRkcYhvMWZmhS8837qNkdX2u/M1QFlz1v0ubeHw9GDLKRE/i4QfSVfI+CXCPL3pYD
         hrlG+f1E+o5ewxNhsuK/52XmNC2uIZvzlr96KbMKOR08EqSU0qhfxrMzvFCNTjakN+
         mLaA1ewuSCqUbJ1PvWFZvh12mvhTkoNQkElgRQiBUHGFOOrhmMmKVDvDvoSDf543Pv
         4F7rprQ7ZteoQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004JfJ-RA; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Leon Luo <leonl@leopardimaging.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 33/78] media: i2c: imx274: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:43 +0200
Message-Id: <d97e001d5aa0598b5adccb7e977f5cf205055fcd.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/imx274.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index cdccaab3043a..ee2127436f0b 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1441,9 +1441,8 @@ static int imx274_s_stream(struct v4l2_subdev *sd, int on)
 	mutex_lock(&imx274->lock);
 
 	if (on) {
-		ret = pm_runtime_get_sync(&imx274->client->dev);
+		ret = pm_runtime_resume_and_get(&imx274->client->dev);
 		if (ret < 0) {
-			pm_runtime_put_noidle(&imx274->client->dev);
 			mutex_unlock(&imx274->lock);
 			return ret;
 		}
-- 
2.30.2

