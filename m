Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69B0B35351C
	for <lists+linux-media@lfdr.de>; Sat,  3 Apr 2021 20:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236924AbhDCSJI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Apr 2021 14:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236907AbhDCSJG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Apr 2021 14:09:06 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18C4C061788;
        Sat,  3 Apr 2021 11:09:01 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id r20so8684148ljk.4;
        Sat, 03 Apr 2021 11:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P4L7V3F+4F2OsutYm9zIXnd8ryH/kFEzVMXabtRtrgk=;
        b=lRBp5XWB67XwzXmrSb70V7fo3Wxrzm8PBa/F8TImBkan1WX/LKrH0IHmQUagWTQ2n4
         6IAHtIds6+/RBi1DIeffQPYParjg8zPeoYhgQPGQNBfNt74WeICCS3p6ImxgErGl2ECO
         r/BeRFErk4YYNZE0QEsYAwOwNDRpzfJjvK8+6jZZE7vHCT4xKjOiBxKssl+6IoKMfBPq
         Y8GxsEMwNl590e+yOfVfwWoza3EyWX3HO+vCoavfhyK60lbvfWCcleUkvVqx0JwNczxp
         1oFqXD8N3Se7pSgvGNmQ4YSyXZZIXtHqvdwf8c16XeEyiWRKaC54cbqyAtUFpeVwPv1g
         d15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P4L7V3F+4F2OsutYm9zIXnd8ryH/kFEzVMXabtRtrgk=;
        b=giooRozSd6beecIewZ5zBHcNENap5oKgBEHdhquOqsnoWTDkT2XzrqDnIhVvpsl5gg
         0nCCGUI9TgtqNde2wwtPOy3hbMB6rXRik9qj7ezgXyzHKir90dXRk517Sc5v4jE/CAIg
         oMuqFU7265PZcS/f3KFYVlrnPgdXtqQDNHJhj4X7Vmb7ldXI8Emhj97evITuRW6Xv3ty
         7fiI9ZT+wMRmriTbUiUwrno4myF1pQ+KRIkcDrc4EFW4idhPemeY4bnTRcyQNAIC7HC7
         0NJz3IoQtKWm0psVNV5NNL268SvCr8EJV9Rr6sPYwrvKBRH212w5zZG0udekzg18Akdh
         u6Tg==
X-Gm-Message-State: AOAM530tWGBjeZRUoz+BdpAbqNclVKt8Qsc68M3UKzt2jDZcOdTryxWR
        ktRStyxnFwZ/yhH/+3Pa9/bzpfJTcZ/oBCRT
X-Google-Smtp-Source: ABdhPJyX4kGkwpY8zgU97BOHq6W5uukFi46485HqHo5bQiWvzZu4M9hkVrUAbAuoGqfoaSpTCbAXbg==
X-Received: by 2002:a2e:a415:: with SMTP id p21mr11798268ljn.108.1617473340519;
        Sat, 03 Apr 2021 11:09:00 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id r4sm1204044lfn.135.2021.04.03.11.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 11:09:00 -0700 (PDT)
Date:   Sun, 4 Apr 2021 00:08:59 +0600
From:   Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 1/7] staging: media: zoran: Rename 'HEnd' to 'h_end'
Message-ID: <b5713f89cb4c52f50cfb3db6ac1e1e9dc2665f2d.1617472411.git.zhansayabagdaulet@gmail.com>
References: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename variable 'HEnd' to 'h_end' to eliminate camelcase
Reported by checkpatch.pl.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/media/zoran/zoran_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index e569a1341d01..415b3cf4826e 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -291,7 +291,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 			    const struct zoran_format *format)
 {
 	const struct tvnorm *tvn;
-	unsigned int h_start, HEnd, v_start, VEnd;
+	unsigned int h_start, h_end, v_start, VEnd;
 	unsigned int DispMode;
 	unsigned int VidWinWid, VidWinHt;
 	unsigned int hcrop1, hcrop2, vcrop1, vcrop2;
@@ -331,11 +331,11 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	 * However, the DC10 has '0' as h_start, but does need |1, so we
 	 * use a dirty check...
 	 */
-	HEnd = h_start + tvn->wa - 1;
+	h_end = h_start + tvn->wa - 1;
 	h_start += hcrop1;
-	HEnd -= hcrop2;
+	h_end -= hcrop2;
 	reg = ((h_start & ZR36057_VFEHCR_HMASK) << ZR36057_VFEHCR_H_START)
-	    | ((HEnd & ZR36057_VFEHCR_HMASK) << ZR36057_VFEHCR_H_END);
+	    | ((h_end & ZR36057_VFEHCR_HMASK) << ZR36057_VFEHCR_H_END);
 	if (zr->card.vfe_pol.hsync_pol)
 		reg |= ZR36057_VFEHCR_HS_POL;
 	btwrite(reg, ZR36057_VFEHCR);
-- 
2.25.1

