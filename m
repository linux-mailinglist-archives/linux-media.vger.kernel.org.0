Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B156136C264
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235435AbhD0KOg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:14:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:34504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235225AbhD0KOe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D95A0613C3;
        Tue, 27 Apr 2021 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518430;
        bh=yher15YM7h61KHb/hY+EJ/RRJANP10wcnUo8G05kfG0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T3XWa01AwHvFFDXxPmHCkXGTpu38NkeBQsMzh+aS2GAQnXF2qtZeFHRaKoIlsegp/
         SoD9/IACexeeo1blB8Ydt5o2Pr5A+/JjnLgHUMiatdPxv5kvpVMW4vm71eIVQv5hCh
         Oi779nfJAbRT5NrWcSD6CNptFxLtS53RXam/B7/PFki0PRWY73hbkr8J9wh71R1GxF
         bdNiXKvSYNH+DdhdKr/wemLCbawzsQmTK0PwbnwnO8J/Sf2FVoP/gs18XWZgm3rpGV
         GR21XcsN/zuvrf3TjsPSg6zuDTCuDlHTo85570h1FRhV3GBVubaizLJkzO9WzTlsky
         sDyIsDwW1ZNyA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiy-000j4j-Aw; Tue, 27 Apr 2021 12:13:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 03/79] media: i2c: mt9m001: don't resume at remove time
Date:   Tue, 27 Apr 2021 12:12:30 +0200
Message-Id: <5a5442f20a8ddfd18d1231c1f33356729dc8c9c1.1619518193.git.mchehab+huawei@kernel.org>
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

Calling pm_runtime_get_sync() at driver's removal time is
not right, as this will resume PM runtime. This is clearly
not what it is desired there, since it calls
pm_runtime_set_suspended() afterwards.

So, just remove pm runtime get/put logic from the device
removal logic.

Fixes: 8fcfc491c6ca ("media: mt9m001: switch s_power callback to runtime PM")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/mt9m001.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 3b0ba8ed5233..ac1b380e6c03 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -834,14 +834,11 @@ static int mt9m001_remove(struct i2c_client *client)
 {
 	struct mt9m001 *mt9m001 = to_mt9m001(client);
 
-	pm_runtime_get_sync(&client->dev);
-
 	v4l2_async_unregister_subdev(&mt9m001->subdev);
 	media_entity_cleanup(&mt9m001->subdev.entity);
 
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
-	pm_runtime_put_noidle(&client->dev);
 	mt9m001_power_off(&client->dev);
 
 	v4l2_ctrl_handler_free(&mt9m001->hdl);
-- 
2.30.2

