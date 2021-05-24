Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D518738EA20
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 16:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233538AbhEXOw1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 10:52:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:54514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233550AbhEXOu0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 10:50:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8A27613FC;
        Mon, 24 May 2021 14:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621867669;
        bh=sVg6SB/8K3yyZdgO0ZP29Rf+pPOA/vY5LIPQHKTVJMw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wd+6W075RBz+rlQ7GKFZwszm6ncgRCbOoxFr61gPjEF8fzslb48jw951ZJYhlY58r
         sXo1zce+yj1idQe47w2F8l8+V/gQYlLpOKOceZpyFXBIp2+wv+0zasjbHvddLbNb7z
         PM9fWDYBzJrP2mVwuKw9zBPAVESAZw3gd8RSo/DhsFdUqV58skm/OvIPlAhmIPSp3U
         L/VNzrQgvikoNWNwNNKUE6BY2WVIh2zxbzh7aFwSS2Dybt+2+gzOVk627r/4Cd5f4b
         A1KVSfsS+M3sd7gkVZzQ3nI8bqYKRnvkko/LAO1gmj0iSehQp+284nT4lTNQ6yeJaZ
         i4PQobXEKd/gg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kangjie Lu <kjlu@umn.edu>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 04/62] Revert "media: usb: gspca: add a missed check for goto_low_power"
Date:   Mon, 24 May 2021 10:46:45 -0400
Message-Id: <20210524144744.2497894-4-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524144744.2497894-1-sashal@kernel.org>
References: <20210524144744.2497894-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

[ Upstream commit fd013265e5b5576a74a033920d6c571e08d7c423 ]

This reverts commit 5b711870bec4dc9a6d705d41e127e73944fa3650.

Because of recent interactions with developers from @umn.edu, all
commits from them have been recently re-reviewed to ensure if they were
correct or not.

Upon review, this commit was found to do does nothing useful as a user
can do nothing with this information and if an error did happen, the
code would continue on as before.  Because of this, just revert it.

Cc: Kangjie Lu <kjlu@umn.edu>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Link: https://lore.kernel.org/r/20210503115736.2104747-7-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/gspca/cpia1.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/usb/gspca/cpia1.c b/drivers/media/usb/gspca/cpia1.c
index a4f7431486f3..d93d384286c1 100644
--- a/drivers/media/usb/gspca/cpia1.c
+++ b/drivers/media/usb/gspca/cpia1.c
@@ -1424,7 +1424,6 @@ static int sd_config(struct gspca_dev *gspca_dev,
 {
 	struct sd *sd = (struct sd *) gspca_dev;
 	struct cam *cam;
-	int ret;
 
 	sd->mainsFreq = FREQ_DEF == V4L2_CID_POWER_LINE_FREQUENCY_60HZ;
 	reset_camera_params(gspca_dev);
@@ -1436,10 +1435,7 @@ static int sd_config(struct gspca_dev *gspca_dev,
 	cam->cam_mode = mode;
 	cam->nmodes = ARRAY_SIZE(mode);
 
-	ret = goto_low_power(gspca_dev);
-	if (ret)
-		gspca_err(gspca_dev, "Cannot go to low power mode: %d\n",
-			  ret);
+	goto_low_power(gspca_dev);
 	/* Check the firmware version. */
 	sd->params.version.firmwareVersion = 0;
 	get_version_information(gspca_dev);
-- 
2.30.2

