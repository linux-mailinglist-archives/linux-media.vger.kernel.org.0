Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D93C538EA90
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 16:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233911AbhEXO4f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 10:56:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:55384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233887AbhEXOxi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 10:53:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1C4161411;
        Mon, 24 May 2021 14:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621867707;
        bh=yGMZrSeD5ldYQ8amepKy7fmPBbO/88Lgz8D1NmVxsVU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P8N0MZ2/Rc5VjajapQ6MclwLt+9lzLuqRefzUSlCnRwkAY50wlFoCLamvyxzGABWs
         ++XuwrdVRlfNSdWcKiqB8P1lvoVOMGEAjtKA8rAE4boTXWwnIUCIffNJfiKs49IK4M
         2rq+PRCDw63riVwdU+CxXY9s/UlzKwunjtulVpsbo4uqlIHmXM8LU1XlfPLhmeP2tE
         vubFe9ZdizJDxfSVh7ZLyAvpIC7H42HpANYe3GvZdOr2mtRTmw3M7hLJTSADPLWhPr
         EdHznD1JEZiPMOYMOeDTlCq+n2lbOccgQGOyQF8+E52fx2N/GKhX8t/vgESscJpLvB
         bUHzSVIyeMgeg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Aditya Pakki <pakki001@umn.edu>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 35/62] Revert "media: gspca: mt9m111: Check write_bridge for timeout"
Date:   Mon, 24 May 2021 10:47:16 -0400
Message-Id: <20210524144744.2497894-35-sashal@kernel.org>
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

[ Upstream commit d8c3be2fb2079d0cb4cd29d6aba58dbe54771e42 ]

This reverts commit 656025850074f5c1ba2e05be37bda57ba2b8d491.

Because of recent interactions with developers from @umn.edu, all
commits from them have been recently re-reviewed to ensure if they were
correct or not.

Upon review, this commit was found to be incorrect for the reasons
below, so it must be reverted.  It will be fixed up "correctly" in a
later kernel change.

Different error values should never be "OR" together and expect anything
sane to come out of the result.

Cc: Aditya Pakki <pakki001@umn.edu>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Link: https://lore.kernel.org/r/20210503115736.2104747-61-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/gspca/m5602/m5602_mt9m111.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/gspca/m5602/m5602_mt9m111.c b/drivers/media/usb/gspca/m5602/m5602_mt9m111.c
index bfa3b381d8a2..50481dc928d0 100644
--- a/drivers/media/usb/gspca/m5602/m5602_mt9m111.c
+++ b/drivers/media/usb/gspca/m5602/m5602_mt9m111.c
@@ -195,7 +195,7 @@ static const struct v4l2_ctrl_config mt9m111_greenbal_cfg = {
 int mt9m111_probe(struct sd *sd)
 {
 	u8 data[2] = {0x00, 0x00};
-	int i, rc = 0;
+	int i;
 	struct gspca_dev *gspca_dev = (struct gspca_dev *)sd;
 
 	if (force_sensor) {
@@ -213,18 +213,16 @@ int mt9m111_probe(struct sd *sd)
 	/* Do the preinit */
 	for (i = 0; i < ARRAY_SIZE(preinit_mt9m111); i++) {
 		if (preinit_mt9m111[i][0] == BRIDGE) {
-			rc |= m5602_write_bridge(sd,
+			m5602_write_bridge(sd,
 				preinit_mt9m111[i][1],
 				preinit_mt9m111[i][2]);
 		} else {
 			data[0] = preinit_mt9m111[i][2];
 			data[1] = preinit_mt9m111[i][3];
-			rc |= m5602_write_sensor(sd,
+			m5602_write_sensor(sd,
 				preinit_mt9m111[i][1], data, 2);
 		}
 	}
-	if (rc < 0)
-		return rc;
 
 	if (m5602_read_sensor(sd, MT9M111_SC_CHIPVER, data, 2))
 		return -ENODEV;
-- 
2.30.2

