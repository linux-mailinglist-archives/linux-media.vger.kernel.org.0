Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1169353523
	for <lists+linux-media@lfdr.de>; Sat,  3 Apr 2021 20:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236979AbhDCSJQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Apr 2021 14:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236955AbhDCSJM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Apr 2021 14:09:12 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB239C06178C;
        Sat,  3 Apr 2021 11:09:08 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id v15so11751123lfq.5;
        Sat, 03 Apr 2021 11:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t734qKFGEnK5lkG+XHQ0j+jWOw9AOKU33SnUXzxrOfc=;
        b=mumJUhAKfW3EP3MOaJUdPWSFLHx0uAxrQz96weLn6d2EfT3wYFUbF4Mn0mM/0xcC+K
         m9x4U39GnJla0U/tzOs6f6hhPJa0aAu3sugMwgDpv7YhrHeqkp1TDGvs0nCqJ5FfjBDp
         OIwQZsFS+pkHg5qSf0zKu4AQSOUmraiMoE7tWcUjCqSBBdwzNsuaK3aj0MvflwMECIbH
         2pP85gEuB0QVNekDuJ7e1GnrV30wLrTRFR8ip3NlTjUwAFdBBjfDOHIYzNCdEVWFcIIU
         3scQmAp5A9m/h+AwN4a2w6U8Egc0AZWftrMjmRutK0xySgxZFC1qsgaOOKFrk2g23i8j
         GLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t734qKFGEnK5lkG+XHQ0j+jWOw9AOKU33SnUXzxrOfc=;
        b=rzqIwnSNK61MEXpxSBoGsDkQWw02XIjfKWgLB8w4RUg4wdBCjfONbu9vln9Qu74gcF
         XhVtIuIwZaffaLvPZi0MEdeSKQjP3+lHVcAVILhqDSrom4L0d1EA1Ry7nsYrTYUK7ATn
         QWnXbUbMD1v+sZhIFj0I1OSWDZMmr0wzdv6ClAht7O+27prQqaSKiVrqx8R72tvF3tu9
         6gElh8hNjP92hgoYMQ0YljE1u7KoGMOI/AKZ0HKxQX7MvszSIuagqj4O27wJCkfwKA9T
         wiZ8tB0nZzG+bLvaLZ24utzv3tYRSOceIFxfG/uqxRU20gG1pql3sNl73JEsk/biAYTW
         UACQ==
X-Gm-Message-State: AOAM532FclEsmVCck90mraMKkzbGQwptrLwkVHDQhWA6DJ09FmkI4WtR
        KuEk2ZIJyLUNwoktyDqxqqM=
X-Google-Smtp-Source: ABdhPJyDlbd9fyIJLSZJFUjYG3XWJAT2ng0brqoSAVUhOnopJBJcD0EcH5sIK8CfC/t8QS82TNjWkg==
X-Received: by 2002:ac2:47e5:: with SMTP id b5mr12410427lfp.476.1617473347482;
        Sat, 03 Apr 2021 11:09:07 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id v20sm1272136ljh.105.2021.04.03.11.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 11:09:07 -0700 (PDT)
Date:   Sun, 4 Apr 2021 00:09:05 +0600
From:   Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 6/7] staging: media: zoran: Rename 'We' to 'we'
Message-ID: <128bc601bb3787470e0d2599af07766575c6c2a0.1617472411.git.zhansayabagdaulet@gmail.com>
References: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename variable 'We' to 'we' to eliminate camelcase.
Reported by checkpatch.pl.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/media/zoran/zoran_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 49e0efcc0062..007d8855178e 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -295,7 +295,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	unsigned int disp_mode;
 	unsigned int vid_win_wid, vid_win_ht;
 	unsigned int hcrop1, hcrop2, vcrop1, vcrop2;
-	unsigned int wa, We, ha, He;
+	unsigned int wa, we, ha, He;
 	unsigned int X, Y, hor_dcm, ver_dcm;
 	u32 reg;
 
@@ -318,10 +318,10 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	/* horizontal */
 	vid_win_wid = video_width;
 	X = DIV_ROUND_UP(vid_win_wid * 64, tvn->wa);
-	We = (vid_win_wid * 64) / X;
+	we = (vid_win_wid * 64) / X;
 	hor_dcm = 64 - X;
-	hcrop1 = 2 * ((tvn->wa - We) / 4);
-	hcrop2 = tvn->wa - We - hcrop1;
+	hcrop1 = 2 * ((tvn->wa - we) / 4);
+	hcrop2 = tvn->wa - we - hcrop1;
 	h_start = tvn->h_start ? tvn->h_start : 1;
 	/* (Ronald) Original comment:
 	 * "| 1 Doesn't have any effect, tested on both a DC10 and a DC10+"
-- 
2.25.1

