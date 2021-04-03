Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE5435351B
	for <lists+linux-media@lfdr.de>; Sat,  3 Apr 2021 20:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236919AbhDCSJH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Apr 2021 14:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236893AbhDCSJG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Apr 2021 14:09:06 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18AFC061793;
        Sat,  3 Apr 2021 11:09:02 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g8so11704329lfv.12;
        Sat, 03 Apr 2021 11:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v0krWIe7+jYDq9Qsx+sHNhNnuq8bykK1gj9DfeDqL2U=;
        b=lqTneHiHyE7nJi6VT50kSLAtJT6Srdtr42dCNISwj7s9/zm3Keihaa9ktxHQx+ve2A
         gl+IVB2sis7pHB/LPbH7J8YTxmDexoa6gJHq9awj9ZJfDeevtBfC9QoWHRernWfDd+2g
         zus2bgqvRIJZMwyauQP/xHEoyf+6vghSIwWSTLo3itWO2g42RAjhwyqEA3A74SziqdT8
         Wz8UFDTmU2rli294STEc9C3wOTP8WD1QAgjrWgYDdmCW7oT4bdzoauYPJbQ3Q84E9pRD
         xzQwTAxfs7IEAQfuX8kquWQCOkJJ0oNf3t6f/JgnMyNuB8BoRvGsRyvrG6+nAcvJVXn7
         U+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v0krWIe7+jYDq9Qsx+sHNhNnuq8bykK1gj9DfeDqL2U=;
        b=DKseOhHxA6zEEKZEIXi90N7MJvm0NZEnrWW3OFfFm7SNJ+NUvwcr8q5y2ppYXjrqGl
         +jc88tG3VXUB1OSSp0NJqTZbmeSRwOuV7xkstCo6MZseOSmSirOpn5q73UXXVZFRAeOg
         sShzT7feR/DSi/jVxS9Et1rt++YAKNOg/YQiJxoWGLxZxfRDw3FMKmWwv6PxHI5ZWb8B
         /VewyzHw1CVWxP6sngOMn4Pw/mJjZAbJhvQoGAjFBEEuy6ruK6gwkKjAJ//30+xeBZZk
         mmgb47wWxQ8kHfWiZJWiuJeAbqJZUQPBjpruzC0lV6AejAL8aReT9WI/nIciZiERa0O4
         /Ntw==
X-Gm-Message-State: AOAM5336xKgtdWl2PKHW2mfxyBRsTm46az0H3S05aso74OQG3lJu3SAt
        BxgFMSK7AYCYSv1jsNQsx0U=
X-Google-Smtp-Source: ABdhPJyDymodgWo417Oj1iCrFieudvRS35T9DQ6VoDJ2vERDoIeDlO3wIZrUC61MWf2xYB3FUM6QSA==
X-Received: by 2002:ac2:46d5:: with SMTP id p21mr13422183lfo.295.1617473341443;
        Sat, 03 Apr 2021 11:09:01 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id i185sm1201092lfd.279.2021.04.03.11.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 11:09:01 -0700 (PDT)
Date:   Sun, 4 Apr 2021 00:09:00 +0600
From:   Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 2/7] staging: media: zoran: Rename 'VEnd' to 'v_end'
Message-ID: <bda5e77d271173e8ab6c2180b39e2aa7b1fd65de.1617472411.git.zhansayabagdaulet@gmail.com>
References: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename variable 'VEnd' to 'v_end' to eliminate camelcase.
Reported by checkpatch.pl.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/media/zoran/zoran_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 415b3cf4826e..6764b51fc595 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -291,7 +291,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 			    const struct zoran_format *format)
 {
 	const struct tvnorm *tvn;
-	unsigned int h_start, h_end, v_start, VEnd;
+	unsigned int h_start, h_end, v_start, v_end;
 	unsigned int DispMode;
 	unsigned int VidWinWid, VidWinHt;
 	unsigned int hcrop1, hcrop2, vcrop1, vcrop2;
@@ -349,11 +349,11 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	vcrop1 = (tvn->ha / 2 - He) / 2;
 	vcrop2 = tvn->ha / 2 - He - vcrop1;
 	v_start = tvn->v_start;
-	VEnd = v_start + tvn->ha / 2;	// - 1; FIXME SnapShot times out with -1 in 768*576 on the DC10 - LP
+	v_end = v_start + tvn->ha / 2;	// - 1; FIXME SnapShot times out with -1 in 768*576 on the DC10 - LP
 	v_start += vcrop1;
-	VEnd -= vcrop2;
+	v_end -= vcrop2;
 	reg = ((v_start & ZR36057_VFEVCR_VMASK) << ZR36057_VFEVCR_V_START)
-	    | ((VEnd & ZR36057_VFEVCR_VMASK) << ZR36057_VFEVCR_V_END);
+	    | ((v_end & ZR36057_VFEVCR_VMASK) << ZR36057_VFEVCR_V_END);
 	if (zr->card.vfe_pol.vsync_pol)
 		reg |= ZR36057_VFEVCR_VS_POL;
 	btwrite(reg, ZR36057_VFEVCR);
-- 
2.25.1

