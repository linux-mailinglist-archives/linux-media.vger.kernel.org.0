Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE9E436C36B
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237756AbhD0K20 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:48192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235545AbhD0K2E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3874E613E4;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=v0N3nXsqMajMGBVdnEBF4DR9l7FpjhgT+LyWaPFGjVY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TEf7qhVehujQVV6Albr0nyFqVDACoM1pOFSNDknpUYSeLQo1k5o5iS4ZlIsro3/vb
         W9TlBQ8H0Eyv+qGhzZjeBPOFR9neTQrJ/cpFVgVdt+Xg8UEwVP8buY5RxkXAz+sSvC
         xX4kGpzAlFRoAHPmor+FmDiBI25kezRKSDxIA7ZD2zip2r+qo6JqJ82QISjANJin+p
         K0lND4+TZUI+yDlJhzC7Ey0o09YNEQdVhWs7i5G82W4nqm5RwzsUBby9xjUHKLUHtG
         WOJ9Ndlb1DoAGxvOJxpJYPfWKF3nhvAMxGD/teKpUuMQKY0DzZKlvT3GZsFszAiQOo
         vb7ZhXR4js0rQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvv-000nzS-1M; Tue, 27 Apr 2021 12:27:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 05/79] media: i2c: video-i2c: don't resume at remove time
Date:   Tue, 27 Apr 2021 12:25:55 +0200
Message-Id: <2b0d9e2e11bc883f1d630d43a5a464af9279b267.1619519080.git.mchehab+huawei@kernel.org>
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

