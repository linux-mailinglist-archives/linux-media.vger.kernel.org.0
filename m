Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9E5F36710B
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 19:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241372AbhDURNw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 13:13:52 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:58786 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237498AbhDURNt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 13:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619023944; bh=LKtMoR4lsluuaw9UOiUUQQGDhk1e0PTaigauOMlSMHQ=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=fJkDjDYAsrl0pDfTdLjNf1xKlQCTUNMLfC8kER6o1hc14YS73hymtNxZDBoVusUd9
         WTei8J0a1gUrTo8D8NxrfeTXA6OwZHW7a7O0spGBhx9y0D5I90SDLAFFVwEcgxP/bl
         f809t/ijOLWrTu7zqu72wVtDxmQOSQCPoBt35tQk=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Wed, 21 Apr 2021 18:52:24 +0200 (CEST)
X-EA-Auth: lgo6EQFlf5F1cWIR3PxDR5L0JVX/v/z4oWqmwf74AXAClxDNJu6PKIZhTifq5qe0/7QYSQAWGfvnmvxm6CjWvpn2n3/V599d
Date:   Wed, 21 Apr 2021 22:22:19 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com, drv@mailo.com
Subject: [PATCH v1 2/6] staging: media: atomisp: balance braces around
 if...else block
Message-ID: <71220662c5facd746e56288cc74786c96fa3c5a7.1619022192.git.drv@mailo.com>
References: <cover.1619022192.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619022192.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Balance braces around the if else blocks as per the code style guidelines.
Resolves checkpatch script CHECK / WARNING feedback messages.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes in v1:
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



