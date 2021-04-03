Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88717353525
	for <lists+linux-media@lfdr.de>; Sat,  3 Apr 2021 20:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236989AbhDCSJU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Apr 2021 14:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236945AbhDCSJN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Apr 2021 14:09:13 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D52DC061793;
        Sat,  3 Apr 2021 11:09:10 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id m12so11723480lfq.10;
        Sat, 03 Apr 2021 11:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iakHsUyxM+lHRQnNUqoKM3RMjlnWm90jWJwLczQ8GBc=;
        b=REKzfIMSxu75FMS0vPW083LBOEofNy1L0DSWLf2a5noReX7W/17BBYn2NrTC0THspE
         uVRT++z4G1WbGhksXMAYh9pfZRKgkXifeWLYrNGgCE79MSjchNSejsM95AizztVWTWlO
         cq8TvFGubvdRS8uwy/ZfOjIMGk0u4KINn/b9ilOX7wLYNkcqXPRXuGoWtGjJtndZWhzr
         xUlsavfgmE6Aa2gQZkmmk3/w/bXXtZ+fVwp4L6nV68jXlyTuvVpwV1OyHX38P7jX/OOe
         XFJNrg6USY2ytR5P84BXIP2W+sOqdPKXqKATR9CizWC6jWP1aLdcbOwQB9nrLpbt14p3
         gbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iakHsUyxM+lHRQnNUqoKM3RMjlnWm90jWJwLczQ8GBc=;
        b=oT8J6A65O1y14NiU//6cddD/nWrglAuHy/X8VruUgiMeVJu3WC9nrrk3znxpVEDkFN
         KY50rr09BcOiXCGHHqlZP3Ys5zplMjzAydj6/N3m5Nt7VIMbug5NqSDxejsOzk3KwW+H
         Ajlw7/n4Jqe+S7GshfFwypQdTm9Sv5A9pk38/pIiHcMp3Gt13peZjbToCk+8WWwPrHHm
         j2K4TidGrf2FQ589cHaYEYROCgfqyjc+68N2TLttCglJjGIn4FwMKNTKOisjulAfz+IW
         F1Z8GiVqlhn2Qfidy63ckFzKJ2V6q7ZgYgye3jc6bAgzdHUQT/Ovabz2w0ipnpGeodWi
         n6jQ==
X-Gm-Message-State: AOAM533b4oQl5Ma6Bxfv7iLboPgz7gN0ho0KxBydrv6MW48zKsBy1Jik
        ymw14VpWKcAZFmR+BRCDYi4=
X-Google-Smtp-Source: ABdhPJxGKURadwPZE/A9QsTdOLUm5Sj8YjsPuCUpvktkrQE6uZl+lC0Io13dd5dN+A2uyhQs0zjbbg==
X-Received: by 2002:a19:501b:: with SMTP id e27mr12726473lfb.584.1617473348592;
        Sat, 03 Apr 2021 11:09:08 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id b28sm1204452lfo.219.2021.04.03.11.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 11:09:08 -0700 (PDT)
Date:   Sun, 4 Apr 2021 00:09:07 +0600
From:   Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 7/7] staging: media: zoran: Rename 'He' to 'he'
Message-ID: <9982cf0d54cb0677519aa7f14d931fba65e023d3.1617472411.git.zhansayabagdaulet@gmail.com>
References: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename variable 'He' to 'he' to eliminate camelcase.
Reported by checkpatch.pl.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/media/zoran/zoran_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 007d8855178e..cf788d9cd1df 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -295,7 +295,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	unsigned int disp_mode;
 	unsigned int vid_win_wid, vid_win_ht;
 	unsigned int hcrop1, hcrop2, vcrop1, vcrop2;
-	unsigned int wa, we, ha, He;
+	unsigned int wa, we, ha, he;
 	unsigned int X, Y, hor_dcm, ver_dcm;
 	u32 reg;
 
@@ -344,10 +344,10 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	disp_mode = !(video_height > BUZ_MAX_HEIGHT / 2);
 	vid_win_ht = disp_mode ? video_height : video_height / 2;
 	Y = DIV_ROUND_UP(vid_win_ht * 64 * 2, tvn->ha);
-	He = (vid_win_ht * 64) / Y;
+	he = (vid_win_ht * 64) / Y;
 	ver_dcm = 64 - Y;
-	vcrop1 = (tvn->ha / 2 - He) / 2;
-	vcrop2 = tvn->ha / 2 - He - vcrop1;
+	vcrop1 = (tvn->ha / 2 - he) / 2;
+	vcrop2 = tvn->ha / 2 - he - vcrop1;
 	v_start = tvn->v_start;
 	v_end = v_start + tvn->ha / 2;	// - 1; FIXME SnapShot times out with -1 in 768*576 on the DC10 - LP
 	v_start += vcrop1;
-- 
2.25.1

