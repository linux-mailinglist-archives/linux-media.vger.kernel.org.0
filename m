Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7E6369F71
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241274AbhDXGra (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:35994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233327AbhDXGqQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B382961931;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=uVFbSBsOFTlNeqpthO6c96NJAUfPhbV6UvOttxV6+5A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MuVoKpleTd+o2AQVdMJ/Eel3LkxhdwtMotaGZrO2oHOfLNJqf2cNyBHm1wM90Sktk
         NmKuLPAWMBeF4k+9H22EvOW7iW+zjvgZan0fJdo6wLu8VLAfCybzO4AtLK8FaHg4Kg
         Vx61xfHD2gA9SOnq4hSL3N9FR0PfOKLp4ooZbwMIjTi3NWNRyTHlFtVTCus6u9cu2v
         i6lsDvi3EEX5iM8OSU1ySjSf890O2lhZGpIAkMsEn075JoD/OHbB0S3CBlMa8Rsh63
         ROEMWirDxRx7KbjYNfrdOXkygKbjQiiLj58U49zMquXNsilKCgTrtZEg094IDus5O1
         pWnAxkJGasdow==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004JfM-S5; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 34/78] media: i2c: imx290: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:44 +0200
Message-Id: <eb5e3c326e83f0e26ffecafc14ab05a50328ea5e.1619191723.git.mchehab+huawei@kernel.org>
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

