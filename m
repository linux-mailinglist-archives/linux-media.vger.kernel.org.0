Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE4236C273
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235517AbhD0KOn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:14:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:34668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235314AbhD0KOe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CB60613D8;
        Tue, 27 Apr 2021 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518431;
        bh=U3xPtY+HT1GPqKz+iC8qw5pPuPioh4afaqfdd0R7SD0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SF3VGC81jsafrWSb4/+wRsXESNkqb6f087GFtYbL/2+Ajlc4mf6YsA6kWU+zFFinI
         clmLzaWVwHQyOA9g2Fn2fNMdi1lddtkNBbDYHOuxwh1ge+ToyaS2OuwzS9W0x3E1Kf
         yX7rHEMbwV1E0ZkvJmx26OP/OV3ssZIv/G2nBAGzyZQ78Pi5/mjJ2xfyybou4IWWnW
         +ujwaT3KdQSYngxdcbauaCmrC3zSJOcf9AATfe4pYp6v0/T3KBGKFEsBNliHwsBptD
         rvluOfKwrkg3UJr6ZYNEE0kBT1ZgVkJYgavWSXQUTP6tRYOfkvXEHQMPjcyBa952E6
         hAd9Qgpx/b17Q==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiy-000j5S-Sd; Tue, 27 Apr 2021 12:13:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 18/79] media: delta-v4l2: fix pm_runtime_get_sync() usage count
Date:   Tue, 27 Apr 2021 12:12:45 +0200
Message-Id: <9d65648bf69e2c7b2c59fdf06214153491d4cdf2.1619518193.git.mchehab+huawei@kernel.org>
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

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter and avoid memory
leaks.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/sti/delta/delta-v4l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sti/delta/delta-v4l2.c b/drivers/media/platform/sti/delta/delta-v4l2.c
index c691b3d81549..9928b7c46a41 100644
--- a/drivers/media/platform/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/sti/delta/delta-v4l2.c
@@ -1277,9 +1277,9 @@ int delta_get_sync(struct delta_ctx *ctx)
 	int ret = 0;
 
 	/* enable the hardware */
-	ret = pm_runtime_get_sync(delta->dev);
+	ret = pm_runtime_resume_and_get(delta->dev);
 	if (ret < 0) {
-		dev_err(delta->dev, "%s pm_runtime_get_sync failed (%d)\n",
+		dev_err(delta->dev, "%s pm_runtime_resume_and_get failed (%d)\n",
 			__func__, ret);
 		return ret;
 	}
-- 
2.30.2

