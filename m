Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D49BE3AE87B
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 13:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhFUL7I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 07:59:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:34234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229610AbhFUL7H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 07:59:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2496461153;
        Mon, 21 Jun 2021 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624276613;
        bh=uwGsDLBM94wlH08xSFR21Av3pUOHYUbttrYJhv47Jjk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M2VJW0ElDZvi62c5dBfx9jvQeL4z7PgZ24MY/B4Gb4D4A9bPE3i/woCKhLWFDED/7
         4HwBf5ohJMa7Jjax54eCixgLNbbCGdUMxO/ozyGkNeEBllEtguytwhg/2uciWVfDWX
         W1gPbrqazNlRHC3cBWMd8tFqaLxTDbts4L6En3vbStVOFskX2rMP31nWK0Tc8pPVY5
         es1rJo4furoAdzcvdXoy1coexag8DjbaU0fqyJlYr9izu6+BPQgdbTAT61Nvar/kwi
         lb+SxQ+TMZHWxVIPO0lnzLk6UF7/t6JhfPCN5R0xmc5Q6N2YqekaMSidPm48kvvd3A
         wggMwDJy/JgCg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lvIXq-000Hco-Vr; Mon, 21 Jun 2021 13:56:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 3/5] media: v4l2-flash-led-class: drop an useless check
Date:   Mon, 21 Jun 2021 13:56:47 +0200
Message-Id: <e1629ac223470630eed4096361965d154aff70b7.1624276138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624276137.git.mchehab+huawei@kernel.org>
References: <cover.1624276137.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As pointed by smatch:
	drivers/media/v4l2-core/v4l2-flash-led-class.c:264 v4l2_flash_s_ctrl() error: we previously assumed 'fled_cdev' could be null (see line 197)

It is too late to check if fled_cdev is NULL there. If such check is
needed, it should be, instead, inside v4l2_flash_init().

On other words, if v4l2_flash->fled_cdev() is NULL at
v4l2_flash_s_ctrl(), all led_*() function calls inside the function
would try to de-reference a NULL pointer, as the logic won't prevent
it.

So, remove the useless check.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/v4l2-core/v4l2-flash-led-class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
index 10ddcc48aa17..a1653c635d82 100644
--- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
+++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
@@ -194,7 +194,7 @@ static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
 {
 	struct v4l2_flash *v4l2_flash = v4l2_ctrl_to_v4l2_flash(c);
 	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
-	struct led_classdev *led_cdev = fled_cdev ? &fled_cdev->led_cdev : NULL;
+	struct led_classdev *led_cdev = &fled_cdev->led_cdev;
 	struct v4l2_ctrl **ctrls = v4l2_flash->ctrls;
 	bool external_strobe;
 	int ret = 0;
-- 
2.31.1

