Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB5836DEC7
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 20:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243457AbhD1SIx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 14:08:53 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:55442 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231966AbhD1SIu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 14:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619633147; bh=brOaZ74L5IQCdhe8Ng+gvJInozKmDRxmXQBpvP5SpFQ=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=hr5eJctyVMWE0Y1WQTxzDmtjGbNLwiHqVvMqpytPLWIwHZEYzKKTSCpvOIUEaKlzC
         HpukD/KGqwruQFJXrisggFAc/eKYnaSX6cMFXBMWcEh3Xkiw9JzVNH8ycZiYxOfokJ
         IqmUqZTbj97JKbTp57j7cDGG/QklzO+vg7DWGC/s=
Received: by 192.168.90.11 [192.168.90.11] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Wed, 28 Apr 2021 20:05:46 +0200 (CEST)
X-EA-Auth: K/99XHxJdKp2dF3e8sydn4pVeY8Xh2mVd15q7MyPaG4YplnoQFH8O2Nxc2Sl95pHGIoMLO5mhw3jJFT/411HxoszK3KjqiFV
Date:   Wed, 28 Apr 2021 23:35:41 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH v4 2/9] staging: media: atomisp: balance braces around
 if...else block
Message-ID: <b5e1eacf1a3ec2d317e68b1747e92240dedfb160.1619628317.git.drv@mailo.com>
References: <cover.1619628317.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619628317.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Balance braces around the if else blocks as per the code style guidelines.
Add braces to branches where it is missing. Resolves checkpatch script
CHECK / WARNING feedback messages.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes since v3:
   - Split this patch into patch 2 and 3.
   - patch 2 now only adds missing braces.
   - Removing unwanted braces is moved into patch 3 
Changes since v2:
   - None.
Changes since v1:
   - None.


 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c  | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c  | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c  | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

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
2.31.1



