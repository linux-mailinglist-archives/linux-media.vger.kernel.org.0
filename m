Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C1F369F6F
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238031AbhDXGr2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:35796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233280AbhDXGqQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0C0A6192E;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=6SWDMHkSlrYNzq7GtPd5DH9pbQJCAbHbxO2AKYAv8vU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SKUkQWMF5xRvaRZUnhogiYC6mCr50zuinV63RwxhjdIx3FJyP0HD78wtO9cxLvQwN
         cGitAVtNSuEEkWaokoW6jcsf7SphEFKD1vRYOgL7250hDlCdnI8hSSDPtfbybCyiNR
         eQNNfSqr6s/xslALy0HSvEsZz+HRA84kL5J/HtZR4Sd6Vz+5YtvfvKhsbNVXhtuUUD
         /Zaipy1RQutFQyaPCuzZ+DAV4ctL4rseJwM2/YBKj6v4xfjxkY2uFFTAcmYlEm4uZ1
         zhUXNp+EtGyNMJfNLkJ/0zWJzCaMYwd2BOKqFcZBOtnHtS4GGMp1YtbwsnDeToqDaD
         E72gtfSJ5a9sg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004JfP-T0; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 35/78] media: i2c: imx319: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:45 +0200
Message-Id: <f66861e89de1b98026ee3d91709003551614244e.1619191723.git.mchehab+huawei@kernel.org>
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

