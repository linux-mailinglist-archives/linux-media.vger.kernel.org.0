Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAF1036DA16
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240414AbhD1Oxw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:53:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:36324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240283AbhD1Oxa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8BEA61455;
        Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=v0N3nXsqMajMGBVdnEBF4DR9l7FpjhgT+LyWaPFGjVY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Lgav0xx9qLJD809kGwduHIweCAI4kyiXZBtlMOR7b6LhS+8aCwOYkFJGkMfoF7v+Q
         AjRZ4gb9KUesndsx3yjJSug0jySNhwmgQ+YyzUeAEo18ELZwgLgBU6W0foVwSMUUH1
         oMH2fdfOIlUEsN43n3X2l1gBlg+zDvVhjYQU1KEP8BO0eW2VqhN66dYD/0Oq4gXZLq
         nmRmXujydgjQw/ZeGPN8LvJlrOCDMzeCyUobLxkAo32giYjTcwrCJLNzlqrdZTwxqY
         PK0w2NVajkQjcT/X26f7Sgo/0F34OgVrjDuqF+huVNWA9pmq45XwidyJ9pJvbXiSRi
         bWZQhP/eVeijQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYP-001Dpp-Me; Wed, 28 Apr 2021 16:52:41 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 05/79] media: i2c: video-i2c: don't resume at remove time
Date:   Wed, 28 Apr 2021 16:51:26 +0200
Message-Id: <4af597b4d09d874308a23680cf3fed4a31a1674a.1619621413.git.mchehab+huawei@kernel.org>
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

Calling pm_runtime_get_sync() at driver's removal time is
not right, as this will resume PM runtime. This is clearly
not what it is desired there, since it calls
pm_runtime_set_suspended() afterwards.

So, just remove pm runtime get/put logic from the device
removal logic.

Fixes: 69d2a734c5dc ("media: video-i2c: support runtime PM")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/video-i2c.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 0465832a4090..c9a774f4c8d2 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -893,10 +893,8 @@ static int video_i2c_remove(struct i2c_client *client)
 {
 	struct video_i2c_data *data = i2c_get_clientdata(client);
 
-	pm_runtime_get_sync(&client->dev);
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
-	pm_runtime_put_noidle(&client->dev);
 
 	if (data->chip->set_power)
 		data->chip->set_power(data, false);
-- 
2.30.2

