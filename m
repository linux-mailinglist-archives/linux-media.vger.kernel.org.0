Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEEB36C263
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235416AbhD0KOf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:14:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:34416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230341AbhD0KOe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBC1D6101D;
        Tue, 27 Apr 2021 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518430;
        bh=v0N3nXsqMajMGBVdnEBF4DR9l7FpjhgT+LyWaPFGjVY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n/kz6QWyev0skRLpw2DZgDie2FWO3S8xNLHUdmf3C68v45zePcljDBMHgroqkJCpY
         A2DaPMJK3Rb+Nohy0CRDswgkjwHchK/lko6z7EVo5UZ/a0vAB6jLt5Lu9cUclHp4QT
         TmyTbDEmLbW12Cb6YaF1e6Q2d1uK/GVtRktNmpnsZil4o6yigXVKQ66vMxmw5OB2aS
         lZdfbF9QpFC6oHMZLGZYlzS8Y43DGF/Jz6NwXxKOV6YbA1i9nWQIr8o8LbUGtcmei2
         Smzp/jVFZFNPtqu89QBpGB4JdoAZc0/RqTjXbbBUUY2TUjvtcv5kRODK6aFcpoyZ1L
         vOr9Y0vHTgqNg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiy-000j4p-Dl; Tue, 27 Apr 2021 12:13:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 05/79] media: i2c: video-i2c: don't resume at remove time
Date:   Tue, 27 Apr 2021 12:12:32 +0200
Message-Id: <25c574a9459b43940d71e3f18942b936aae64820.1619518193.git.mchehab+huawei@kernel.org>
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

