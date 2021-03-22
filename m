Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2492344B19
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 17:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbhCVQWc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 12:22:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:58352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231269AbhCVQWP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 12:22:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50A5D61923;
        Mon, 22 Mar 2021 16:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616430135;
        bh=N1pZXoFW8EzraubmXWgO03VV3JrwVKw7C3iLnvZZWxM=;
        h=From:To:Cc:Subject:Date:From;
        b=lS6CJOzkWN89QNtmk4jO8YbJOU7x/dcL9NNZZ79rL7z0jskZU7AQ16Or6snJMjubp
         QWpfINGAxWZv9BkyUQbBFXK8i8oPgQtBZVsbUVkLzutUCb38hY1jfzJPtYJ3wHrPo1
         +M1c1O29i67CdzLtvjY9tcdfhcWbhD9BTMhJwMjpIfZYmhHpnrTf4uRmTERZMbiVnq
         /j7PtwwElLXoUHiWFesVpPMNHbRRLOckdZNX51jbcRIi9o+luqUyE6fn91MfQ5J0y0
         L5xyOoAHpk4k4c2WpPOlJXdaaVAToMZv83uavXSwz6USrCrDRvNIQwOKsVMYVpugDB
         Ndx2pe/GGuKuA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lONJk-007MW7-Ew; Mon, 22 Mar 2021 17:22:12 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Colin Ian King <colin.king@canonical.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH] atomisp: remove a now unused var
Date:   Mon, 22 Mar 2021 17:22:09 +0100
Message-Id: <a03a4a3e9aad2b8154018c323cf7766266990724.1616430113.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A previous cleanup patch removed the usage of the ret var.

So, drop it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/i2c/atomisp-lm3554.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
index ebe3c618051f..e444c0129f5d 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
@@ -904,7 +904,6 @@ static int lm3554_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct lm3554 *flash = to_lm3554(sd);
-	int ret;
 
 	media_entity_cleanup(&flash->sd.entity);
 	v4l2_ctrl_handler_free(&flash->ctrl_handler);
-- 
2.30.2

