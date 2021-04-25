Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F412336A5D1
	for <lists+linux-media@lfdr.de>; Sun, 25 Apr 2021 10:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbhDYInL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Apr 2021 04:43:11 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:41120 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229527AbhDYInK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Apr 2021 04:43:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619340144; bh=GBkaNh3DDDhepQi6ZUHf8i6AfSYPw/Givkt+esixaDc=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=a6zPza7ddATmiezpO3M+pS6ZDVfSoxTSzC/8AtYom6ttuaRJSW1ip0O0/T7ckjj6k
         gbhY9tzkpaCeP9mzTCvU7fDWsnYVmTA3lZboYHvZbfTMDXwrGylUWxnwUHVtxJBZrf
         gh8lIvGj4Yo94USTWhfrlvq3NijFpMhHy26V9EPM=
Received: by 192.168.90.16 [192.168.90.16] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sun, 25 Apr 2021 10:42:24 +0200 (CEST)
X-EA-Auth: lqPcrBFN9g2+N8KLnmFAU/Zu2aUPHbEsQYFm4ZZJh+VsRLsXFtGp9GDfDpq7YEpP7RfrSxlkxrUAGvlzOWunbxceHxAuPedA
Date:   Sun, 25 Apr 2021 14:12:20 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH RESEND v3 2/6] staging: media: atomisp: balance braces around
 if...else block
Message-ID: <71220662c5facd746e56288cc74786c96fa3c5a7.1619199344.git.drv@mailo.com>
References: <cover.1619199344.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619199344.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Balance braces around the if else blocks as per the code style guidelines.
Resolves checkpatch script CHECK / WARNING feedback messages.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes since v2:
   - None.
Changes since v1:
   - None.

 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c  | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c  | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c  | 7 ++++---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c  | 4 ++--
 5 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 6be3ee1d93a5..d68a2bcc9ae1 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -872,9 +872,9 @@ static int gc0310_s_power(struct v4l2_subdev *sd, int on)
 {
 	int ret;
 
-	if (on == 0)
+	if (on == 0) {
 		return power_down(sd);
-	else {
+	} else {
 		ret = power_up(sd);
 		if (!ret)
 			return gc0310_init(sd);
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 6ba4a8adff7c..e722c639b60d 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -658,9 +658,9 @@ static int gc2235_s_power(struct v4l2_subdev *sd, int on)
 {
 	int ret;
 
-	if (on == 0)
+	if (on == 0) {
 		ret = power_down(sd);
-	else {
+	} else {
 		ret = power_up(sd);
 		if (!ret)
 			ret = __gc2235_init(sd);
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index f5de81132177..465fc4468442 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -568,9 +568,9 @@ static int power_down(struct v4l2_subdev *sd)
 
 static int mt9m114_s_power(struct v4l2_subdev *sd, int power)
 {
-	if (power == 0)
+	if (power == 0) {
 		return power_down(sd);
-	else {
+	} else {
 		if (power_up(sd))
 			return -EINVAL;
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index c90730513438..92c52431bd8f 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -461,11 +461,12 @@ static int ov2680_v_flip(struct v4l2_subdev *sd, s32 value)
 	ret = ov2680_read_reg(client, 1, OV2680_FLIP_REG, &val);
 	if (ret)
 		return ret;
-	if (value) {
+
+	if (value)
 		val |= OV2680_FLIP_MIRROR_BIT_ENABLE;
-	} else {
+	else
 		val &= ~OV2680_FLIP_MIRROR_BIT_ENABLE;
-	}
+
 	ret = ov2680_write_reg(client, 1,
 			       OV2680_FLIP_REG, val);
 	if (ret)
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index aec7392fd1de..d046a9804f63 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -772,9 +772,9 @@ static int ov2722_s_power(struct v4l2_subdev *sd, int on)
 {
 	int ret;
 
-	if (on == 0)
+	if (on == 0) {
 		return power_down(sd);
-	else {
+	} else {
 		ret = power_up(sd);
 		if (!ret)
 			return ov2722_init(sd);
-- 
2.25.1



