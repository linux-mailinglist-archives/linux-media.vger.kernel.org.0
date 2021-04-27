Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEABA36C390
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235515AbhD0K2y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:48192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235729AbhD0K2J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B784613E5;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=rXQEV5ur3+5U6VOB8wAB6dlcXqNLqRBsrKFm5rfs1io=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TDWEHSoiJqHs+CXnKEzA0b8240R9e7+E5MwttfdXgkUfu4ckV4MTuYOUopf6dbCUO
         57AO1wormtn9rpGhh26NDa3mpubctsWkq5n9PlCftz/Jm34XtgCdeeEbwYUF6szTBe
         OSVCrXvbLEB6KeAfd+ZMQtltpJbNi9CDFWgTR07+0DeRsuXbGORG8KXul+QRnPih9r
         vtp6XfekRVt7r6Eh1+gEA56Ysd1W7aCiNfNDbd8wVauvnd8g4bDq7ig/P8DLzgvM+R
         7EYC2NXzU1p5I+a+B+9/+Af95BHT6Y/AUhfRSqBc4xwd6hr2chJACrHuG/JFQBUD2V
         rD0WiGx6/xExA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvx-000o1I-B1; Tue, 27 Apr 2021 12:27:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 43/79] media: i2c: ov02a10: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:33 +0200
Message-Id: <b25c530fbf2434e6ed6f1ac8ab34ce07e5dc9602.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov02a10.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index c47b1d45d8fd..a1d7314b20a9 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -540,11 +540,9 @@ static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
 	}
 
 	if (on) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto unlock_and_return;
-		}
 
 		ret = __ov02a10_start_stream(ov02a10);
 		if (ret) {
-- 
2.30.2

