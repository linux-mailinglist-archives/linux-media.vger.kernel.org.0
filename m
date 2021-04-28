Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67EF936DA62
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240739AbhD1Ozi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:36366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240461AbhD1OyF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:54:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA6A861970;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621565;
        bh=kwIJFx+3BZT7CutnecuzIxhgs2GnXNtjRI6MBhWOcG4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aqyEcOe1373v2IxrEcx0sTniQDH7DHbNKOfgpoGB5RikmQwT0VSiQbq2m7bqa8Jm2
         I3k+Py3hiY08ddP2PJMTKLcMR5Yb7EL4bouXoBrwofFsDXlkTIr1cQdfRoeQzfssB4
         ZUd6tXRIfupa47lAkccVwgmaCclQwSokT/rvaUdEvGMXblHBjuGsDfdMwTcUHS7w2g
         yux7o8gKVJz65geUL7eL8UmeIedXSFUHs0ep1778C/cRH//qPPmPKWQOpF15Eg/+Rn
         Vadtv0RSBYaxJAWsnDj844iSoBnARIySLkLeyBX2qCWKRQNJS/w4fAGmwo1lEkAsxe
         CFBt76BajDKmg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001Drx-W4; Wed, 28 Apr 2021 16:52:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Tu <shawnx.tu@intel.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v4 49/79] media: i2c: ov5675: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:10 +0200
Message-Id: <3deaf3753d5adb417320bfb59a511329a7191c24.1619621413.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov5675.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index dea32859459a..e7e297a23960 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -863,9 +863,8 @@ static int ov5675_set_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&ov5675->mutex);
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
 			mutex_unlock(&ov5675->mutex);
 			return ret;
 		}
-- 
2.30.2

