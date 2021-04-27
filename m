Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10E2A36C360
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237061AbhD0K2R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:48156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235517AbhD0K2D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B303613D0;
        Tue, 27 Apr 2021 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=Brp5bgVOD7UqAef4tVuj+33Q8jgTwnd/UQoPNRzNrhM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e6fyJt/1tyQ+bKXpDrQhcZ2T+6eCV2UdjdMUSlzUshM/+lUly7WUAndQ07uDq81c4
         3BDo2YsAh9mlufH5zkddHpySwopBKA9CwmUfvK/IPLvO/8Ux03j3Fe3v1dJd3Hgqm8
         1Zsw5WvJ4XAg1xQjDhzOd2aZVs4yvcxoYiT8q5bAewCKTsp+0wgfliR0TA7oMsxy4Y
         QvwvMxwjynnbek0QBSHJoA8zpXMOro/I7kJ/P2XrloADUpW8I8DRdDwWtnp+S/SbWb
         b5Z+H4wxqip4ikECiIgHW/T7hPTXN6f6DBwbu6cRbvtmuPtkhALg35NvY9QZsWCpnF
         k98sbx5cJ/Zng==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvw-000o0c-Gf; Tue, 27 Apr 2021 12:27:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 29/79] media: i2c: ccs-core: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:19 +0200
Message-Id: <b605d9efaf6ae9535a7c348e9972af2f6c873a12.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ccs/ccs-core.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index b05f409014b2..8cce80557128 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1880,12 +1880,11 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
-	rval = pm_runtime_get_sync(&client->dev);
-	if (rval < 0) {
-		pm_runtime_put_noidle(&client->dev);
-
+	rval = pm_runtime_resume_and_get(&client->dev);
+	if (rval < 0)
 		return rval;
-	} else if (!rval) {
+
+	if (!rval) {
 		rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->
 					       ctrl_handler);
 		if (rval)
@@ -3089,12 +3088,9 @@ static int __maybe_unused ccs_suspend(struct device *dev)
 	bool streaming = sensor->streaming;
 	int rval;
 
-	rval = pm_runtime_get_sync(dev);
-	if (rval < 0) {
-		pm_runtime_put_noidle(dev);
-
+	rval = pm_runtime_resume_and_get(dev);
+	if (rval < 0)
 		return rval;
-	}
 
 	if (sensor->streaming)
 		ccs_stop_streaming(sensor);
-- 
2.30.2

