Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EACD836DA7F
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240850AbhD1O4O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:56:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:36802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240356AbhD1Oxo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8AC4061928;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=RKkiGoCDSW3lMHxV9n7JS+4PruB0khbogVRD1m+DqBc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pSWtkaIqJ30NOq+rbHn2rQQa9uXOTFSDe0mptSY05h0lajdh5p2PajviD3hyq+mdD
         wwMJ4Nb23fr3RaOk0jiMqnO6pKgv+/nrODKM2eax7JXp0SutxTDS12LROSNgoQ/0wx
         s9vpwlx4pSrS5RezheFn2UqCwMBiV0aZ3yTiRBsx3CuUb94ogUQOCLtfOyCmzy4g+5
         5Jx06oGlz5r3mHw9EWXm8LgaKb+9BVF7EIcbKGIZKt/Tp/ZeZo8x8zq6/2I/T4Ot5p
         FebSL0gcp06++78Ld805EmB/n4dhadgWNxm2XcdGW8n1x6YNfd5g6ixig8CENkh6Wc
         li4QpwnZ31paw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001DrK-JQ; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Leon Luo <leonl@leopardimaging.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 36/79] media: i2c: imx274: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:51:57 +0200
Message-Id: <e76d57e076207708d341922aecfa90d3fc51ac13.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
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

