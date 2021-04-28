Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E64536DA15
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240408AbhD1Oxt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:53:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:36354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240289AbhD1Oxa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2713D6157F;
        Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=U3xPtY+HT1GPqKz+iC8qw5pPuPioh4afaqfdd0R7SD0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nU8/4nqsaUzqc/2P2LSyHnwWSNRH0YsgZc7WwCj9qWc17cv+s3MwoJRkLsoUaTrZW
         0fYO9Yx3bA5D0iH7J7SRbWZaxA6dbnqyIahQ070LTg2iHUTnRhlVKN+iIbUaaoOIh/
         u5SiAd6E7WXV++WxBhFAJIIXXIZGeRa+7XboOxmWaAetyhAmkRTjgisXuERwmxopfN
         WV3wZNDuIdABms25SFXDGjRuJURKyGxhQhPHP6EdKLLC3cUPEucpq9nY6raeGLPUgG
         0nXqfBU6wl0WZyhgSLkuyPhhis5hf9ftTledvQZKIVBvs99Ta3C737EGNzHWABUae0
         0qemN983jqWfA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001DqS-2n; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 18/79] media: sti/delta: fix pm_runtime_get_sync() usage count
Date:   Wed, 28 Apr 2021 16:51:39 +0200
Message-Id: <e4d120126b7c3be15d33ed8bcf07c285e14c25bf.1619621413.git.mchehab+huawei@kernel.org>
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

