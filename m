Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C76536C36F
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237842AbhD0K22 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:48226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235555AbhD0K2E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4BAAA613F5;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=uVFbSBsOFTlNeqpthO6c96NJAUfPhbV6UvOttxV6+5A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a3qh6IDWSg3pJg1l/LlOM0a+ZuzFRnI+fTGlm6Tl57pO4vBJxeBKdnMygztYQH5cH
         9hLLlNG/mTok2AAXFHG53RoJWXQM7bCoiMWIt/751hAd4tDQPGnEnfR+GhVUmjlWmB
         mtyD4kEV9vSZEz10ncor9cEa5imRycQjzV7NdeG1pgVWo+78tIPnwTYXXV1Bp9v3hM
         pHZpA4J4PqEK6/bSRuXg6psv8sSpetOXPRfcCSn0mFsWJ+L58DjCTDUlj6K/Kuz/Ka
         SJyNiHpRxOSq5wZpeIlvB6JQUi71Rfj6vIVFSSXhU/O7VKOK8SbsnjhEvRFYf18ORu
         znLVAeP+Y0ppg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvx-000o13-1S; Tue, 27 Apr 2021 12:27:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 38/79] media: i2c: imx290: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:28 +0200
Message-Id: <08e787aa001053584b70710ef73911d955ac51ee.1619519080.git.mchehab+huawei@kernel.org>
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

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/imx290.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 6319a42057d2..06020e648a97 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -764,11 +764,9 @@ static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
 	int ret = 0;
 
 	if (enable) {
-		ret = pm_runtime_get_sync(imx290->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(imx290->dev);
+		ret = pm_runtime_resume_and_get(imx290->dev);
+		if (ret < 0)
 			goto unlock_and_return;
-		}
 
 		ret = imx290_start_streaming(imx290);
 		if (ret) {
-- 
2.30.2

