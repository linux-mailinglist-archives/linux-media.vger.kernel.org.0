Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D493B36C386
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238127AbhD0K2n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:48136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235643AbhD0K2F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3444B613DF;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=yher15YM7h61KHb/hY+EJ/RRJANP10wcnUo8G05kfG0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fZLOSHxxj6XFtyWy5SPFa4XFXyrPAz+FE3eZ13Vby4rnRpAJS8mxQ2fB061SOoe2g
         4QdFJF14sJZoWHxdhfGkZPIBpqHjQfPaWBy1I0yDf/bt1t62s/NnmPWG82zX7Saa8v
         0TB+MR3dqrNB3MJlWOjQSR/hyQSXqtWpSLk0OjYWAyooEvcKhLfOTEYGWWFwSE83bZ
         8h8l8ZPMX0mPfktJvSRzCeFtyzoUjCQJluYhD0jpE0Fz+knRYKY2W4PhcdutSjybPJ
         Cy52Kxc2vnSiBAWfsWC4NnPTUjOQ+W7oLci9njUD+Yu/su92K3hbfVH+eHHBnVJKpc
         DmPhROin1UUEw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvu-000nzL-Ug; Tue, 27 Apr 2021 12:27:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 03/79] media: i2c: mt9m001: don't resume at remove time
Date:   Tue, 27 Apr 2021 12:25:53 +0200
Message-Id: <6e37d3c545d09222882881b7717379a9042e7005.1619519080.git.mchehab+huawei@kernel.org>
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

