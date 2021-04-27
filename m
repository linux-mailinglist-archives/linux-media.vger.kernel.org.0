Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 423EA36C3AD
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238384AbhD0K3O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:48148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237505AbhD0K2X (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C88961405;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=U3xPtY+HT1GPqKz+iC8qw5pPuPioh4afaqfdd0R7SD0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iXMAigZdnmTu5DSfhVBGfcBPGN3QF6ScmmR9U0f5Im+LPTYBWoyF4ySDewljMfoBD
         DuxyJAJ1gMLQ6p55STB+KKwr+WrJSR7g3hnugClyn/E78d90b8STIoDxT3xQBiV/n6
         uL9M9bbEpXbNuIQnbmAm5E6JIWT6+V0tJ8evbx22wxlqQiTfw0l7nXGaV0I87B1VBa
         XKR/bd4QEFA1Zsi6T9nSKagVK4WUpXZx+4aEhq9gXp+buv8+jKMExd9Xs9e8eBkQTf
         giDONGAEmXjeisYXz5b0fJau6kz4cBUwC005YzBRs308oiacNrkhIZWR3w4YC0Vp3Y
         mLWQ5E/mVhnYQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvv-000o05-RL; Tue, 27 Apr 2021 12:27:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 18/79] media: delta-v4l2: fix pm_runtime_get_sync() usage count
Date:   Tue, 27 Apr 2021 12:26:08 +0200
Message-Id: <364e0a87973ec4676f1aa16b3373a0c95f0366f0.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
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

