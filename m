Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4926A36C2A0
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235891AbhD0KPN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:34866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235426AbhD0KOg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 038506144B;
        Tue, 27 Apr 2021 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518432;
        bh=eHVLTLMHsH9CniLLDWRCODM0fRuiKeyCHa5RZsztWV8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JMlzRJhmQiV2TJjHSVLzxIKJkvgvthi/G4+CsNuxYnl/xf7F6qR5Q2N593QyHX5EL
         2JHbxXCdH1bRTCWER0n2ynSM7sj1HfGFsocvB7YpEQiiAEp8/PXyqlTgGdgy/tFJar
         4V1T+l4Sj0ejslUpQ6g/pRmDYEnwTRbUqI27AgjDhM/kGi4anf+UXtUAEgBLyqAJvf
         9MUIQAj42Y/4Li7UJAENIgWUhtbVnidPbK6MxdzYuQQLWIlT10ddNdEGkk7PJIhC8e
         fq+bti3bS0F6QtXd9JgjsB7+EDbDimCM1Zz7+1zOaNmzyjmmR1bouiHRey45Wfnn/d
         yuSKyFL1+kn3w==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiz-000j6K-U9; Tue, 27 Apr 2021 12:13:49 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 36/79] media: i2c: imx258: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:03 +0200
Message-Id: <e738a6d1c402c382a0ce6fa90b85a202950e3a3f.1619518193.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/imx258.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index a017ec4e0f50..90529424d5b6 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1039,11 +1039,9 @@ static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
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

