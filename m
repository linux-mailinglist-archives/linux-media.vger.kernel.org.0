Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F22B9375686
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235231AbhEFPYk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:24:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:37980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235122AbhEFPY2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3787A6121F;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=eHVLTLMHsH9CniLLDWRCODM0fRuiKeyCHa5RZsztWV8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U2/LY5FDlM0rE1ytMfxR/4ENh1Rz5px37uchIJ3oNTdiYKW/DjiPpCrXlGJiYm7fM
         0+kFLuNa3nNvw9es3c/4Gy2DIUpD+jgYmtUVF7KmLE5Bpmko7sKW9Cide5bMetF/3B
         gueG3L30G/8W3muFtNNenosxtS7NO5Rv128T0+lH75teIh8sieGUACyQFbjpw6v1hU
         leihzp2WOlNLH8XSn19JGYYk/IHl8Xcht2mLr5lWAuByezf9MDZbrVzUzNdAUdSaby
         aIbl0jku3Pwz234VCicOlBSygdpgUNX2i1WaujRD2OJfeJffaB7GekjmIJ170RdqyY
         aEOY6eYcUX9bA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000Rv4-7V; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 08/30] media: i2c: imx258: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:23:04 +0200
Message-Id: <e7aab03c0a932e36c47f3e01ca9c3588ec7af307.1620314098.git.mchehab+huawei@kernel.org>
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

