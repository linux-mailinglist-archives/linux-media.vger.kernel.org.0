Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8282935B8AF
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 04:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236562AbhDLChz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Apr 2021 22:37:55 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:52337 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235857AbhDLChz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Apr 2021 22:37:55 -0400
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id AA1BC200004;
        Mon, 12 Apr 2021 02:37:36 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: Removed a superfluous else clause
Date:   Sun, 11 Apr 2021 22:35:56 -0400
Message-Id: <20210412023558.360103-2-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412023558.360103-1-vrzh@vrzh.net>
References: <20210412023558.360103-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixed a coding style issue.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index eecefcd734d0..c017e9066b7a 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -774,11 +774,11 @@ static int ov2722_s_power(struct v4l2_subdev *sd, int on)
 
 	if (on == 0)
 		return power_down(sd);
-	else {
-		ret = power_up(sd);
-		if (!ret)
-			return ov2722_init(sd);
-	}
+
+	ret = power_up(sd);
+	if (!ret)
+		return ov2722_init(sd);
+
 	return ret;
 }
 
-- 
2.31.1

