Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3698336DA34
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240623AbhD1OzE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:36354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240320AbhD1Oxi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 776096191A;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=KnK+ScvrOSmF+XC/C/B4F8IBvu/svp7LsuDeKcM5sXU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=septlkHzzLOCJr2qjUEEE5d8SZMsscqVZ0xwzhnKsIcTBfCGggQUT0gxzkJOSwN3Z
         8kCVB7v8SYWbA/KIJxyhfRDfK6IC7v3+AgGdgtwAreHfI/wWwPfVkD06DOOB/i4Bg3
         Agi/QfLD063BnIUJXSXqCTRMnJIavqEH6WUTPymcIVox8Ff3+TLuMdl+qtMGDwMm9D
         WPjzM9znjLgF51p9x6GS8f+YKfs6TLbUYGk/aZXHDcyl37lTusP4X3OUvGB/XX57Ec
         uPXjsi45BadkGOrRcpsKmCFTDaQOLc4JG8J9pWEU51S3uR9OPGCZn/qaKIJt4ES0F7
         cKmLuu8B+tgbg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001DrB-Gj; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 33/79] media: i2c: imx214: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:51:54 +0200
Message-Id: <96f807bd061dcbc5b0497526cab2f4c63dc73f64.1619621413.git.mchehab+huawei@kernel.org>
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

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/imx214.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index e8b281e432e8..1a770a530cf5 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -776,11 +776,9 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 		return 0;
 
 	if (enable) {
-		ret = pm_runtime_get_sync(imx214->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(imx214->dev);
+		ret = pm_runtime_resume_and_get(imx214->dev);
+		if (ret < 0)
 			return ret;
-		}
 
 		ret = imx214_start_streaming(imx214);
 		if (ret < 0)
-- 
2.30.2

