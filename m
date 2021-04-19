Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D121364A49
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 21:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241300AbhDSTNz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 15:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237147AbhDSTNz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 15:13:55 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B39C06174A;
        Mon, 19 Apr 2021 12:13:25 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id h15so6165787pfv.2;
        Mon, 19 Apr 2021 12:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Tqs2F9D8mtaZHkRU7hQLyOSiRNj0+PQwuNov0o/N/KU=;
        b=C67zAjvdiXktoow7fiG5fD7E8Gm0bf7rtMIGH6ghoWH03LF/buE0OP6oeED4euOl1J
         tqDAJK42DHdgukd9woXDI79P5D2qazrnnCk5/d3g43btaqUKkV8VTqcLoHyJDjHDB8PX
         Gr+mBjGaTuOOlFGpIadhfk2IVh9qqkuVkS/YXCTPgFV7FIbsrGq2H7u5G6UDMBzGNHfb
         JLvxm2PxBdfpu6TrHk5lw4rGzS6Bu+afXeINGUvE5+wLAz6lgrRH9wLOcOEEJkM6b/KD
         YHe/e85zQSDF19EpvCyd5afkh7x09IV+c8BrVft4f+BaGryKQII06G6gnIi1RSky9BcL
         bfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tqs2F9D8mtaZHkRU7hQLyOSiRNj0+PQwuNov0o/N/KU=;
        b=UMZt6Czfev+3uzUIYaFQ48/acvGOnrwJxoEbZN3ceUcie1gAvCl1kfM/t1loSuPPKa
         nD2LmYar4gNndyPaQfljWd2tUr7ArRodmsEM+GckXiGgXw2uzt48MPd+JEgN7WewJsAT
         6NkpxFiFKFlmphjw/zxWTGGtNdkR5OHk7w047auW3oa9Q5Ew/sBwvrkqiPxv1Cjd/6ur
         QPgkvh3cocSYNIk88nxj4exe8ilmFhVvCforgvUS1DbPGCPZo4gx25J2UtoEAKxiLglV
         cJH5JDpAe5m+p5GFBdq1VQtHKhGAvlOSGWKjGhFu6WhtnWcL8moMGmwrFfcjqIIOg5mG
         6z1g==
X-Gm-Message-State: AOAM531KOl+IMGxHuMfJNRm45YVpDLKxciu0OTQMQDWAhtLrpynW/g3c
        6lEhRB0pq6zfo8x1cOPTnMA=
X-Google-Smtp-Source: ABdhPJwcLqrw+mCdkC06D+pMa5umJ4htdmFvgQdj8jdUmk41HJhIHxwQ63R/dKRGSPHQxlS5OqxAxw==
X-Received: by 2002:a65:4082:: with SMTP id t2mr13432531pgp.396.1618859605171;
        Mon, 19 Apr 2021 12:13:25 -0700 (PDT)
Received: from localhost ([103.241.225.98])
        by smtp.gmail.com with ESMTPSA id n39sm10333086pfv.51.2021.04.19.12.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 12:13:24 -0700 (PDT)
From:   Deepak R Varma <mh12gx2825@gmail.com>
X-Google-Original-From: Deepak R Varma <drv@mailo.com>
Date:   Tue, 20 Apr 2021 00:43:19 +0530
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     mh12gx2825@gmail.com
Subject: [PATCH 2/6] staging: media: atomisp: balance braces around if...else
 block
Message-ID: <71220662c5facd746e56288cc74786c96fa3c5a7.1618859059.git.drv@mailo.com>
References: <cover.1618859059.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618859059.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Balance braces around the if else blocks as per the code style guidelines.
Resolves checkpatch script CHECK / WARNING feedback messages.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
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

