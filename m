Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B41137568A
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235247AbhEFPYm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:24:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:38092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235184AbhEFPY3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35714610A5;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=RKkiGoCDSW3lMHxV9n7JS+4PruB0khbogVRD1m+DqBc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O+LlJTlUo2yvHlyAy49eNF7OYXRW3jPYNTM0ikesVnrrhWZNlJfoMiDb8cRW/Sf4F
         VuptXVTmoglEnlwiOhmKzRulppGeNU0kV+TvVBlWW0XsNE+Sqbi4WdQzl5ChLkIJon
         O3aHqt6MjoEN0JZjiqPIplYKoKXVD4RIUAJ4VS0qqg8XmbrBo/JK4CODUBBUmCx2Rp
         y7j7r+wHgX/j+JnzRljtftJRuoEMLEQugj7ddJ/POUnb59VtxszRdPsQ1dbrvCDE6K
         OM2fBOiizN/Cp8d5DN6nfJ55Vm8RrI4L6fabc9O97rXlRBeE6Ef7H3donauI6PnpzO
         7cw77wTleUQxA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000Rv8-8d; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Leon Luo <leonl@leopardimaging.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 09/30] media: i2c: imx274: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:23:05 +0200
Message-Id: <6ac82723b9c6428fc385981822ca14e72f793ec7.1620314098.git.mchehab+huawei@kernel.org>
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

